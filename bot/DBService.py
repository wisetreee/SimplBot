import psycopg2

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

# TODO
# переписать в соответсвии с синтаксисом sqlalchemy по новой базе данных(ссылка в группе)
# примеры в producte и usere
#   
class Product:
    def __init__(self, id, name, price):
        self.id = id 
        self.name = name
        self.price = price
        #ссылка на товар

class User:
    def __init__(self,id, fist_name, last_name, phone_number, balance, role_id):
        self.id = id
        self.fist_name = fist_name
        self.fist_name = last_name
        self.phone_number = phone_number
        self.balance = balance
        self.role_id = role_id
#TODO переписать метод
    def deposit_balance(self, amount):
        self.balance += amount

    def withdraw_balance(self, amount):
        if amount <= self.balance:
            self.balance -= amount
            return True
        else:
            return False

    