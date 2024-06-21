import psycopg2
from sqlalchemy import session, create_engine, MetaData, Table, Integer, Column, ForeignKey, Numeric, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

#строка подключения
#db = ""

try:
    connection = psycopg2.connect(
        host='localhost',
        user='postgres',
        password='123',
        database='SimplDB'
      )
    with connection.cursor() as cursor:
        cursor.execute("SELECT version();")
        data=cursor.fetchone()
        print(f"Server version {cursor.fetchone()}")
except Exception as _ex:
    print('Error with work PostgreSQL',_ex)  

Base = declarative_base()

class Products(Base):
    __tablename__ = 'products'
    id = Column(Integer, primary_key =True)
    name = Column(String(100), nullable = False)
    description = Column(String(100), nullable = False)
    cost = Column(Integer, nullable = False)
    link = Column(String, nullable = False)

class Users(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key =True)
    fist_name = Column(String(100), nullable = False)
    last_name = Column(String(100), nullable = False)
    telephone = Column(String(100), nullable = False) # проверить тип атрибута и нужно ли номер вообще использовать
    balance = Column(Integer, nullable = False)
    id_role = Column(Integer, ForeignKey('role.id')) # нужно название таблицы на которую ссылается внешний ключ

class Achievements(Base):
    __tablename__ = 'achievements'
    id = Column(Integer, primary_key =True)
    name = Column(String(100), nullable = False)
    description = Column(String(100), nullable = False)
    prise = Column(Integer, nullable = False)

class Request_for_merch(Base):
    __tablename__ = 'request_for_merch'
    id = Column(Integer, primary_key =True)
    id_user = Column(Integer, ForeignKey('users.id'))
    id_product = Column(Integer, ForeignKey('products.id'))
    comment_hr = Column(String, nullable = False)
    comment_s = Column(String, nullable = False)
    id_status = Column(Integer, ForeignKey('status.id'))

class Request_for_coin(Base):
    __tablename__ = 'request_for_coin'
    id = Column(Integer, primary_key =True)
    id_user = Column(Integer, ForeignKey('users.id')) 
    id_achievements = Column(Integer, ForeignKey('achievements.id'))
    comment_hr = Column(String, nullable = False)
    comment_s = Column(String, nullable = False)
    id_status = Column(Integer, ForeignKey('status.id'))

class status(Base):
    __tablename__ = 'status'
    id = Column(Integer, primary_key =True)
    status_name = Column(String, nullable = False)

class role(Base):
    __tablename__ = 'status'
    id = Column(Integer, primary_key =True)
    role_name = Column(String, nullable = False)


#какой-то движок алхеми
engine = create_engine(db, echo  =True)
#класс сессии
Session = sessionmaker(autoflush=False, bind = engine)
user = Session.query(Users).get(1)