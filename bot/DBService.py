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

class Item:
    def __init__(self, name, price, stock):
        self.name = name
        self.price = price
        self.stock = stock

    def is_available(self):
        return self.stock > 0

class Customer:
    def __init__(self, balance):
        self.balance = balance
        self.cart = []

    def deposit_balance(self, amount):
        self.balance += amount

    def withdraw_balance(self, amount):
        if amount <= self.balance:
            self.balance -= amount
            return True
        else:
            return False

    def add_to_cart(self, item):
        if item.is_available():
            self.cart.append(item)
            return True
        else:
            return False

    def purchase_items(self):
        total_cost = sum(item.price for item in self.cart)
        if self.withdraw_funds(total_cost):
            for item in self.cart:
                item.stock -= 1
            self.cart.clear()
            return True
        else:
            return False

# Пример использования
inventory = [Item('Книга', 300, 10), Item('Часы', 5000, 5)]
customer = Customer(10000)

# Покупатель добавляет средства на свой баланс
customer.add_funds(5000)

# Покупатель добавляет товар в корзину
customer.add_to_cart(inventory[0])  # Книга

# Покупатель совершает покупку
if customer.purchase_items():
    print('Покупка совершена успешно')
else:
    print('Недостаточно средств или товара нет в наличии')

    