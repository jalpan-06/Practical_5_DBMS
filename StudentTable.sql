-- 1. Create the database and the master student table
CREATE DATABASE session_5;
USE session_5;

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(20),
    branch VARCHAR(20)
);

-- 2. Insert records into the student table
INSERT INTO student VALUES (101, 'Shivtej', 'ECE');
INSERT INTO student VALUES (102, 'Reet', 'CSE');
INSERT INTO student VALUES (103, 'jAY', 'CIVIL');

-- 3. Fix Krishna's branch to ECE
UPDATE student SET branch = 'ECE' WHERE student_id = 102;

-- 4. Create the enrollment table
CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(20)
);

-- 5. Add Foreign Key with ON UPDATE CASCADE using ALTER TABLE
ALTER TABLE enrollment 
ADD CONSTRAINT fk_student 
FOREIGN KEY (student_id) REFERENCES student(student_id) 
ON UPDATE CASCADE;

-- 6. Insert data into the enrollment table
INSERT INTO enrollment VALUES (1001, 101, 'DBMS');
INSERT INTO enrollment VALUES (1002, 102, 'DAA');
INSERT INTO enrollment VALUES (1003, 103, 'ACD');

-- 7. Verify the final data registers inside the tables
SELECT * FROM student;
SELECT * FROM enrollment;
