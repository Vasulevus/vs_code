import pandas as pd
import sys
import pyodbc 

data = pd.read_csv ("../csv/Logins.csv")   
df = pd.DataFrame(data)

# Connect to SQL Server
conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=DESKTOP-T6OC7TM\ANSERVICESPROJEC;'
                      'Database=test_A;'
                      'Trusted_Connection=yes;'
                      'UID=etl3;'
                      'PWD=demopassQ;')
cursor = conn.cursor()


#insert data into table
for row in df.itertuples():
    cursor.execute('''
                INSERT INTO Grim_B (DATE,USERS,Login,Password,Number)
                VALUES (?,?,?,?,?)
                ''',
                row.DATE, 
                row.USERS,
                row.Login,
                row.Password,
                row.Number
                )
conn.commit()


into = cursor.execute('''
		SELECT * FROM Grim_B
               ''')

df2 = pd.DataFrame(into)
print(df2)