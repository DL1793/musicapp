from sqlalchemy import TEXT, VARCHAR, Column, DateTime, LargeBinary
from appmodels.appbase import Base

class User(Base):
    __tablename__ = 'users'

    id = Column(TEXT, primary_key=True)
    name = Column(VARCHAR(100))
    email = Column(VARCHAR(100))
    password = Column(LargeBinary)
    timestamp = Column(DateTime)