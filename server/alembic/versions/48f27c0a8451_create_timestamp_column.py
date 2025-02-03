"""create timestamp column

Revision ID: 48f27c0a8451
Revises: 
Create Date: 2025-02-03 18:02:41.156174

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '48f27c0a8451'
down_revision: Union[str, None] = None
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    op.add_column('users', sa.Column('timestamp', sa.VARCHAR(length=100), nullable=True))


def downgrade() -> None:
    pass
