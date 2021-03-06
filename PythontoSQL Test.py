import pyodbc

conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=localhost;'
                      'Database=deltahacksVII;'
                      'Trusted_Connection=yes;')

cursor = conn.cursor()
cursor.execute('SELECT * FROM deltahacksVII.patient')

for row in cursor:
    print(row)
    
