CREATE DATABASE College;
CREATE USER 'college_app_user'@'localhost' IDENTIFIED BY 'securepassword';
GRANT ALL PRIVILEGES ON College.* TO 'college_app_user'@'localhost';

USE College; 

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    date_of_birth DATE,
    enrollment_date DATE NOT NULL            
);

CREATE INDEX idx_email ON students(email);

SHOW TABLES;  
DESCRIBE students;  
SHOW INDEXES FROM students;  


INSERT INTO students (first_name, last_name, email, password_hash, date_of_birth, enrollment_date) 
VALUES ('Dorel', 'Kalev', 'Dorel.Kalev@cix.csi.cuny.edu', 'password', '2003-11-13', '2024-11-5');


SELECT * FROM students WHERE email = 'Dorel.Kalev@cix.csi.cuny.edu';

