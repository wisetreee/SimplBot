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

class Status:
    id = 0
    def __init__(self, name):
        self.name = name
        Status.id += 1

class Role:
    id = 0
    def __init__(self, name):
        self.name = name
        Role.id += 1

class Product:
    id = 0
    def __init__(self, name, description, price):
        self.name = name
        self.description = description
        self.price = price
        Product.id += 1
        #ссылка на товар

class User:
    id = 0
    def __init__(self, fist_name, last_name, phone_number, balance):
        self.fist_name = fist_name
        self.fist_name = last_name
        self.phone_number = phone_number
        self.balance = balance
        User.id += 1
    role_id = Role.id

#TODO переписать метод

    def deposit_balance(self, amount):
        self.balance += amount

    def withdraw_balance(self, amount):
        if amount <= self.balance:
            self.balance -= amount
            return True
        else:
            return False

class Achievement:
    id = 0
    def __init__(self, name, description, reward):
        self.id = id
        self.name = name
        self.description = description
        self.reward = reward
        Achievement.id += 1

class Reques_for_coins:
    id = 0
    def __init__(self, employee_comment, hr_comment):
        self.id = id
        self.employee_comment = employee_comment
        self.hr_comment = hr_comment
        Reques_for_coins.id += 1
    id_user = User.id
    id_product = Product.id
    id_status = Status.id

class Request_for_merch:
    id = 0
    def __init__(self, employee_comment, hr_comment):
        self.id = id
        self.employee_comment = employee_comment
        self.hr_comment = hr_comment
        Request_for_merch.id += 1
    id_user = User.id
    id_achievement = Achievement.id
    id_status = Status.id
