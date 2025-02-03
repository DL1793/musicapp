"""change date time type

Revision ID: 200383eeed64
Revises: 48f27c0a8451
Create Date: 2025-02-03 18:31:57.726553

"""
from datetime import datetime, timezone
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa

from appmodels.user import User


# revision identifiers, used by Alembic.
revision: str = '200383eeed64'
down_revision: Union[str, None] = '48f27c0a8451'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:

    conn = op.get_bind()
    users = conn.execute(sa.select(User)).fetchall()

    for user in users:
        if user.timestamp:
            try:
                datetime.strptime(user.timestamp, '%Y-%m-%d %H:%M:%S')
            except ValueError:
                conn.execute(sa.update(User).where(User.id == user.id).values(timestamp=None))

    op.alter_column('users', 'timestamp', existing_type=sa.VARCHAR(100),type_=sa.DateTime(), existing_nullable=True, postgresql_using='timestamp::timestamp without time zone')

    for user in users:
        if user.timestamp:
            try:
                dt = datetime.strptime(user.timestamp, '%Y-%m-%d %H:%M:%S')
                conn.execute(
                    sa.update(User).where(User.id == user.id).values(timestamp=dt)
                )
            except ValueError:
                conn.execute(sa.update(User).where(User.id == user.id).values(timestamp=None))


def downgrade() -> None:
    pass
