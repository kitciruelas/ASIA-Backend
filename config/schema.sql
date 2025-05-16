-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS school_management;
USE school_management;

-- Create Courses table
CREATE TABLE IF NOT EXISTS courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Professors table
CREATE TABLE IF NOT EXISTS professors (
    professor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    specialty VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Subjects table with foreign key to Professors
CREATE TABLE IF NOT EXISTS subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    credit_hours INT NOT NULL,
    professor_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (professor_id) REFERENCES professors(professor_id) ON DELETE SET NULL
);

-- Create Students table with foreign key to Courses
CREATE TABLE IF NOT EXISTS students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    course_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE SET NULL
);

-- Create Student_Subjects (many-to-many) table
CREATE TABLE IF NOT EXISTS student_subjects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id) ON DELETE CASCADE,
    UNIQUE KEY unique_enrollment (student_id, subject_id)
);

-- Sample data for Courses
INSERT INTO courses (course_name, description) VALUES
('Computer Science', 'Bachelor degree in Computer Science'),
('Business Administration', 'Bachelor degree in Business'),
('Electrical Engineering', 'Bachelor degree in Electrical Engineering');

-- Sample data for Professors
INSERT INTO professors (first_name, last_name, email, specialty) VALUES
('John', 'Smith', 'john.smith@example.com', 'Database Systems'),
('Sarah', 'Johnson', 'sarah.johnson@example.com', 'Software Engineering'),
('Michael', 'Davis', 'michael.davis@example.com', 'Network Security');

-- Sample data for Subjects
INSERT INTO subjects (subject_name, credit_hours, professor_id) VALUES
('Database Management', 3, 1),
('Software Development', 4, 2),
('Cybersecurity', 3, 3),
('Web Programming', 4, 2),
('Data Structures', 3, 1);

-- Sample data for Students
INSERT INTO students (first_name, last_name, email, course_id) VALUES
('Robert', 'Anderson', 'robert@example.com', 1),
('Jessica', 'Williams', 'jessica@example.com', 2),
('David', 'Brown', 'david@example.com', 1),
('Emily', 'Jones', 'emily@example.com', 3),
('Daniel', 'Miller', 'daniel@example.com', 1);

-- Sample data for Student_Subjects
INSERT INTO student_subjects (student_id, subject_id) VALUES
(1, 1), (1, 2), (1, 5),
(2, 3), (2, 4),
(3, 1), (3, 5),
(4, 3), (4, 4),
(5, 1), (5, 2), (5, 5); 