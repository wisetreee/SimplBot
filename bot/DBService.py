import psycopg2
from sqlalchemy import create_engine, MetaData, Table, Integer, Column, ForeignKey, Numeric, String
# from sqlalchemy.orm import sessionmaker
from sqlalchemy.orm import DeclarativeBase
from sqlalchemy.orm import Session
import json

#строка подключения 
with open('config.json') as file:
    data = json.load(file) 
    post_db = data['post_db']

#какой-то движок алхеми
engine = create_engine(post_db, echo  =True)

class Base(DeclarativeBase): pass
class Products(Base):
    __tablename__ = 'products'
    id_product = Column(Integer, primary_key =True)
    name = Column(String(100), nullable = False)
    description = Column(String(100), nullable = False)
    price = Column(Integer, nullable = False)
    linktofile = Column(String, nullable = False)

class Users(Base):
    __tablename__ = 'users'
    id_user = Column(Integer, primary_key =True)
    name = Column(String(100), nullable = False)
    lastname = Column(String(100), nullable = False)
    telephone = Column(String(100), nullable = False) # проверить тип атрибута и нужно ли номер вообще использовать
    balance = Column(Integer, nullable = False)
    id_role = Column(Integer, ForeignKey('role.id_role')) # нужно название таблицы на которую ссылается внешний ключ
    id_telegram = Column(Integer, nullable = False)

    def Get_dictionary(this):
        return {"id_user": this.id_user, "name": this.name, "lastname": this.lastname, "telephone": this.telephone, "balance": this.balance, "id_role": this.id_role, "id_telegram": this.id_telegram}

    def Get_description(this):
        return f"{this.id_user} {this.name} {this.lastname} {this.telephone} {this.balance} {this.id_role} {this.id_telegram}"

class Achievements(Base):
    __tablename__ = 'achievements'
    id_achievement = Column(Integer, primary_key =True)
    name = Column(String(100), nullable = False)
    description = Column(String(100), nullable = False)
    prize = Column(Integer, nullable = False)

    def Get_dictionary(this):
        return {"id_achievement": this.id_achievement, "name": this.name, "description": this.description, "prize": this.prize}

    def Get_description(this):
        return f"{this.id_achievement} {this.name} {this.description} {this.prize}"

class Request_for_merch(Base):
    __tablename__ = 'request_for_merch'
    id_request_for_merch = Column(Integer, primary_key =True)
    id_user = Column(Integer, ForeignKey('users.id_user'))
    id_product = Column(Integer, ForeignKey('products.id_product'))
    comment_hr = Column(String, nullable = False)
    comment_s = Column(String, nullable = False)
    id_status = Column(Integer, ForeignKey('status.id_status'))

    def Get_dictionary(this):
        return {"id_request_for_merch": this.id_request_for_merch, "id_user": this.id_user, "id_product": this.id_product, "comment_hr": this.comment_hr, "comment_s": this.comment_s, "id_status": this.id_status}

    def Get_description(this):
        return f"{this.id_request_for_merch} {this.id_user} {this.id_product} {this.comment_hr} {this.comment_s} {this.id_status}"

class Request_for_coin(Base):
    __tablename__ = 'request_for_coin'
    id_request_for_coin = Column(Integer, primary_key =True)
    id_user = Column(Integer, ForeignKey('users.id_user')) 
    id_achievement = Column(Integer, ForeignKey('achievements.id_achievement'))
    comment_hr = Column(String, nullable = False)
    comment_s = Column(String, nullable = False)
    id_status = Column(Integer, ForeignKey('status.id_status'))

    def Get_dictionary(this):
        return {"id_request_for_coin": this.id_request_for_coin, "id_user": this.id_user, "id_achievement": this.id_achievement, "comment_hr": this.comment_hr, "comment_s": this.comment_s, "id_status": this.id_status}

    def Get_description(this):
        return f"{this.id_request_for_coin} {this.id_user} {this.id_achievement} {this.comment_hr} {this.comment_s} {this.id_status}"

class Status(Base):
    __tablename__ = 'status'
    id_status = Column(Integer, primary_key =True)
    status_name = Column(String, nullable = False)

    def Get_dictionary(this):
        return {"id_status": this.id_status, "status_name": this.status_name}

    def Get_description(this):
        return f"{this.id_status} {this.status_name}"

class Role(Base):
    __tablename__ = 'role'
    id_role = Column(Integer, primary_key =True)
    pole_name = Column(String, nullable = False)

    def Get_dictionary(this):
        return {"id_role": this.id_role, "pole_name": this.pole_name}

    def Get_description(this):
        return f"{this.id_role} {this.pole_name}"


# Base.metadata.create_all(bind=engine)
#класс сессии
# Session = sessionmaker(autoflush=False, bind = engine)
# user = Session.query(Users).get(1)

def get_balance(user_id):
    with Session(autoflush=False, bind=engine) as db:
        users = list(db.query(Users).filter_by(id_user = user_id))
        users = [user.Get_dictionary() for user in users]
        return users

def insert_request_for_coins(user, achievement, comment_sotr, status):
    with Session(autoflush=False, bind=engine) as db:
        req = Request_for_coin(id_user = user, id_achievement = achievement, comment_s = comment_sotr, id_status = status)
        db.add(req)
        db.commit()

def get_request_for_coins(user_id):
    with Session(autoflush=False, bind=engine) as db:
        coins = list(db.query(Request_for_coin).filter_by(id_user = user_id))
        coins = [coin.Get_dictionary() for coin in coins]
        return coins

def get_request_for_merch(user_id):
    with Session(autoflush=False, bind=engine) as db:
        merch = list(db.query(Request_for_merch).filter_by(id_user = user_id))
        merch = [m.Get_dictionary() for m in merch]
        return merch

def login(telegram_id):
    with Session(autoflush=False, bind=engine) as db:
        telegram = list(db.query(Users.id_telegram))
        for t in telegram:
            if telegram_id == t:
                return True
            else:
                return False
                

# print(get_balance(2)[0])

