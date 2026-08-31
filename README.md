# Session 5: SQL Foreign Keys & Cascading Updates

A reference guide for setting up relational tables, defining explicit foreign key constraints with `ON UPDATE CASCADE`, and managing data integrity in MySQL.

---

##  Execution Script

Run the following SQL script to initialize the database, construct tables, establish constraints, and populate initial data.

```sql
-- 1. Create and select the database
CREATE DATABASE session_5;
USE session_5;

-- 2. Create the primary student table
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(20),
    branch VARCHAR(20)
);

-- 3. Populate initial student records
INSERT INTO student VALUES 
    (101, 'prathamesh', 'ECE'),
    (102, 'Himanshu', 'CSE'),
    (103, 'Krishna', 'MECH');

-- 4. Correct branch assignment (Fixes Himanshu's record)
UPDATE student 
SET branch = 'ECE' 
WHERE student_id = 102;

-- 5. Create the child enrollment table
CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(20)
);

-- 6. Bind foreign key constraint with cascading updates
ALTER TABLE enrollment 
ADD CONSTRAINT fk_student 
FOREIGN KEY (student_id) REFERENCES student(student_id) 
ON UPDATE CASCADE;

-- 7. Populate enrollment records
INSERT INTO enrollment VALUES 
    (1001, 101, 'DBMS'),
    (1002, 102, 'DAA'),
    (1003, 103, 'ACD');
