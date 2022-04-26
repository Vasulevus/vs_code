import pandas
import sys
import pypyodbc as odbc

CSV_file = pandas.read_csv('../csv/Logins.csv')
df = pandas.DataFrame(CSV_file)
print(df)


DRIVER = 'SQL Server'
SERVER_NAME = 'DESKTOP-T6OC7TM\ANSERVICESPROJEC'
DATABASE = 'test_A'

records = [['2020-02-20', 'check', 'CHECK', 'gy5456f3', 174],
            ['2021-03-17', 'grgr', 'GRGR', 'gwrd3q', 88892]]



connStr = (
    r'Driver={ODBC Driver 17 for SQL Server};'
    r'Server=DESKTOP-T6OC7TM\ANSERVICESPROJEC;'
    #r'Server=127.0.0.1,52865;' +
    #r'Server=(local)\SQLEXPRESS;'
    r'Database=test_A;'
    #r'Trusted_Connection=Yes;'
    r'UID=etl3;'
    r'PWD=demopassQ;'
    )

cursor = connStr.cursor()
cursor.execute('''
		CREATE TABLE products (
			product_id int primary key,
			product_name nvarchar(50),
			price int
			)
               ''')


for row in df.itertuples():
    cursor.execute('''
                INSERT INTO products (product_id, product_name, price)
                VALUES (?,?,?)
                ''',
                row.product_id, 
                row.product_name,
                row.price
                )
conn.commit()
# db = odbc.connect(connStr)
# cursor = db.cursor()
# insert_statement = """
#     INSERT INTO Grim_B(DATE,USERS,Login,Password,Number)
#     VALUES (?, ?, ?, ?, ?)"""



# for row in df.itertuples():
#     cursor.execute('''
#                 INSERT INTO Grim_B
#     VALUES (?, ?, ?, ?, ?)
#                 ''',
#                 row.DATE, 
#                 row.USERS,
#                 row.Login,
#                 row.Password,
#                 row.Number
#                 )
# db.commit()
# (DATE,USERS,Login,Password,Number)
#  try:
#      for record in CSV_file:
#          cursor.execute(insert_statement,record)
#   except Exception as ex:
#       cursor.rollback()
#       print("rollback")
#  except Exception as e:
#       cursor.rollback()
#       print(e.value)
#       print('transaction rolled back')
#  else:
#      print("Success")
#  finally:
#      if db.connected == 1:
#          db.close()

# try:
#      for record in CSV_file:
#          print(record)
#          cursor.execute(insert_statement, record)        
# except Exception as e:
#      cursor.rollback()
#      print(e.value)
#      print('transaction rolled back')
# else:
#      print('records inserted successfully')
#      cursor.commit()
#      cursor.close()
# finally:
#      if db.connected == 1:
#          print('connection closed')
#          db.close()
