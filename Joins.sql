CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO students VALUES
(101, "Vishal"),
(102, "Golu"),
(103, "Rakesh"),
(104, "Neeraj");

select * from students;

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO courses VALUES
(101, "Java"),
(202, "Python"),
(303, "C++"),
(104, "C"),
(501, "C#");

select * from courses;

 -- Left Exclusive join --

SELECT *
FROM students s
LEFT JOIN courses c
ON s.student_id = c.course_id
WHERE c.course_id IS NULL;



-- Right Exclusive join --

SELECT *
FROM students s
RIGHT JOIN courses c
ON c.course_id = s.student_id
WHERE s.student_id IS NULL;





-- SELF JOIN --


CREATE TABLE factory(
    id INT PRIMARY KEY,
    name VARCHAR(50)
    manager_id INT
);

INSERT INTO fatory VALUES
(101,'adam',103),
(102,'bob',104),
(103,'charlie',null),
(104,'dave',103);

SELECT * FROM factory

-- SELF JOIN --

SELECT a.name as manager_name, b.name
FROM factory b
JOIN factory a
WHERE a.id = b.manager_id;

















-- Create the scores table --
CREATE TABLE scores (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    score INT,
    city VARCHAR(50)
);

-- Insert data into the scores table --
INSERT INTO scores VALUES
(1, 'Vishal', 90, 'Delhi'),
(2, 'Golu', 80, 'Mumbai'),
(3, 'Rakesh', 70, 'Delhi'),
(4, 'Neeraj', 60, 'Mumbai'),
(5, 'Raman', 69, 'Kolkata'); 

-- Create a view to show name and score --
CREATE VIEW v1 AS
SELECT name, score
FROM scores;

-- Select all from the view --
SELECT * FROM v1;
