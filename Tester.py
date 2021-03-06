import mysql.connector

mydb = mysql.connector.connect(host='localhost',user='root',password='yunfei01',database='deltahacksvii')
mycursor = mydb.cursor()

mycursor.execute("SELECT * FROM clinic")

myresult = mycursor.fetchall()

for x in myresult:
    print(x)
