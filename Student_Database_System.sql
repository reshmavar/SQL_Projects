CREATE DATABASE university;
USE university;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    major VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Insert Students
INSERT INTO students (name, age, major) VALUES
('John Doe', 20, 'Computer Science'),
('Jane Smith', 22, 'Mathematics'),
('Sam Johnson', 21, 'Physics');

-- Insert Courses
INSERT INTO courses (course_name) VALUES
('Introduction to Programming'),
('Calculus I'),
('Quantum Mechanics');

-- Insert Enrollments
INSERT INTO enrollments (student_id, course_id) VALUES
(1, 1),
(1, 2),
(2, 2),
(3, 3);

SELECT students.*, courses.course_name
FROM students
JOIN enrollments ON students.student_id = enrollments.student_id
JOIN courses ON courses.course_id = enrollments.course_id;

SELECT courses.*, students.name AS student_name
FROM courses
JOIN enrollments ON courses.course_id = enrollments.course_id
JOIN students ON students.student_id = enrollments.student_id;

SELECT students.name AS student_name, courses.course_name
FROM enrollments
JOIN students ON students.student_id = enrollments.student_id
JOIN courses ON courses.course_id = enrollments.course_id;







