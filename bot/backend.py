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
        print("dfsdf")
except Exception as _ex:
    print('Error with work PostgreSQL',_ex)