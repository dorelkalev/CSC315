from flask import Flask, request, jsonify
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

def connect_to_database():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='College',
            user='college_app_user',
            password='securepassword'
        )
        if connection.is_connected():
            return connection
    except Error as e:
        return None

@app.route('/students', methods=['POST'])
def insert_student():
    data = request.get_json()
    first_name = data.get('first_name')
    last_name = data.get('last_name')
    email = data.get('email')
    password_hash = data.get('password_hash')
    date_of_birth = data.get('date_of_birth')
    enrollment_date = data.get('enrollment_date')
    
    connection = connect_to_database()
    if connection:
        try:
            cursor = connection.cursor()
            cursor.execute(
                "INSERT INTO students (first_name, last_name, email, password_hash, date_of_birth, enrollment_date) "
                "VALUES (%s, %s, %s, %s, %s, %s)", 
                (first_name, last_name, email, password_hash, date_of_birth, enrollment_date)
            )
            connection.commit()
            cursor.close()
            connection.close()
            return jsonify({"message": "Student inserted successfully"}), 201
        except Error as e:
            return jsonify({"error": str(e)}), 400
    return jsonify({"error": "Database connection failed"}), 500

@app.route('/students/<email>', methods=['GET'])
def get_student_by_email(email):
    connection = connect_to_database()
    if connection:
        try:
            cursor = connection.cursor()
            cursor.execute("SELECT * FROM students WHERE email = %s", (email,))
            result = cursor.fetchone()
            cursor.close()
            connection.close()
            
            if result:
                student = {
                    "student_id": result[0],
                    "first_name": result[1],
                    "last_name": result[2],
                    "email": result[3],
                    "date_of_birth": result[4],
                    "enrollment_date": result[5]
                }
                return jsonify(student), 200
            else:
                return jsonify({"message": "Student not found"}), 404
        except Error as e:
            return jsonify({"error": str(e)}), 400
    return jsonify({"error": "Database connection failed"}), 500

if __name__ == "__main__":
    app.run(debug=False, host='0.0.0.0', port=5001)

