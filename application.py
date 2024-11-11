import mysql.connector
from mysql.connector import Error

def connect_to_database():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='College',
            user='college_app_user',
            password='securepassword'
        )
        if connection.is_connected():
            print("Successfully connected to the database")
            return connection
    except Error as e:
        print(f"Error: {e}")
        return None

def insert_student(connection, first_name, last_name, email, password_hash, date_of_birth, enrollment_date):
    try:
        cursor = connection.cursor()
        cursor.execute(
            "INSERT INTO students (first_name, last_name, email, password_hash, date_of_birth, enrollment_date) "
            "VALUES (%s, %s, %s, %s, %s, %s)", 
            (first_name, last_name, email, password_hash, date_of_birth, enrollment_date)
        )
        connection.commit()
        print(f"Inserted student: {first_name} {last_name}")
    except Error as e:
        print(f"Error inserting student: {e}")

def select_student_by_email(connection, email):
    try:
        cursor = connection.cursor()
        cursor.execute("SELECT * FROM students WHERE email = %s", (email,))
        result = cursor.fetchone()
        if result:
            print("Student found:")
            print(f"Student ID: {result[0]}")
            print(f"First Name: {result[1]}")
            print(f"Last Name: {result[2]}")
            print(f"Email: {result[3]}")
            print(f"Date of Birth: {result[4]}")
            print(f"Enrollment Date: {result[5]}")
        else:
            print("No student found with the provided email.")
    except Error as e:
        print(f"Error querying student: {e}")

def main():
    connection = connect_to_database()
    if connection:
        insert_student(
            connection, 
            'Dorel', 
            'Kalev', 
            'Dorel.Kalev@cix.csi.cuny.edu', 
            'password', 
            '2003-11-13', 
            '2024-11-05'
        )
        select_student_by_email(connection, 'Dorel.Kalev@cix.csi.cuny.edu')
        connection.close()

if __name__ == "__main__":
    main()

