
CREATE DATABASE college;
CREATE DATABASE IF NOT 	EXISTS college;

DROP DATABASE IF EXISTS company;


USE college;

CREATE TABLE student (
id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL
);

INSERT INTO  student VALUES(1, "VISHAL" , 26);
INSERT INTO  student VALUES(2, "GOLU" , 23);


SELECT * FROM student;


CREATE TABLE teachers (
regi INT,
name VARCHAR(50),
age Int);

INSERT INTO teachers VALUES( 21,'gandu master','50');

SELECT * FROM teachers; -- it is a data query language command will print all the names of the teacgers--

/* for showing selective things we can write like this 
SELECT id, name FROM college;
*/

SHOW DATABASES ; -- will show the entire database--
SHOW TABLES;  -- will show the tables --






CREATE DATABASE management;
USE management;
drop database management;

CREATE TABLE employee(
name VARCHAR(50) PRIMARY KEY,
role VARCHAR(50),
salary INT DEFAULT 25000);


INSERT INTO employee
VALUES('mira', 'garbage collector', 2000),
      ('ram', 'developer', 3000),
      ('raj', 'dba', 40000),
      ('rajesh', 'worker', DEFAULT);

      
DELETE FROM employee;  -- will delete the table employee--
/*
ALTER TABLE employees
ADD COLUMN salary INT;
 */



SELECT * FROM employee;

CREATE TABLE temp (
id INT ,
roll INT,
age INT DEFAULT 50,
PRIMARY KEY (id,roll)   -- another way to make primary key--
-- FOREIGN KEY (age) references customer(id) --
);

INSERT INTO  temp VALUES(
22,23,100),
(20,2,DEFAULT);     -- will have to write DEFAULT in order to get that default value --

INSERT INTO  temp (id,roll) VALUES(1,2);   -- here the default value is used like this remember that--


SELECT * FROM temp;
DROP TABLE temp;







CREATE DATABASE apna_college;
USE apna_college;

CREATE TABLE student (
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1) NOT NULL,
city VARCHAR(20)
);


INSERT INTO student
(rollno,name,marks,grade,city) 
VALUES
(1,'abhi',55,'c','delhi'),
(2,'adarsh',78,'b','mp'),
(3,'naval',98,'a','bihar'),
(4,'dheeraj',34,'f','noida'),
(5, 'gulshan',100,'a','noida');


SELECT * FROM student;
SELECT name, marks FROM student;
SELECT DISTINCT city from student;   -- this will only show the cities which are not repeated --

SELECT *
FROM student
WHERE marks >=70;  -- all that means ki give me the details of all of the students which have marks greater than 70 --

SELECT *
FROM student
WHERE marks >=70 AND city = 'noida';  -- noida waale baccho k naam btao --


SELECT *
FROM student
WHERE marks >70 OR rollno >3; -- if any of it gets true ,it will show up --

SELECT * FROM student WHERE marks BETWEEN 70 AND 80; -- print the students who got marks bw 70 and 80 --

SELECT * FROM student WHERE city IN ('noida','bihar' , 'jammu','chandigarh'); -- will print all the student whoever lie in any of the given cities 

SELECT * FROM student WHERE city NOT IN ('noida','bihar'); -- print the student who dont live in these cities --

SELECT * 
FROM student 
WHERE city IN ("noida" , "bihar")
ORDER BY name ASC -- order by clause is used for ascending and descending data preview --
limit 2; -- will print the data of only 2 student alphabetically who recside in noida and bihar --

SELECT *
FROM student
ORDER BY marks DESC
LIMIT 3;  -- this will print the toppers of the class-


-- AGGREGATE FUNCTION-> is used to  perform a calculation on a set of values and returnes a single values ,and these are count(),max(),avg(), min(),sum() --

SELECT avg(marks)
FROM student;

SELECT  COUNT(rollno)
FROM student;  -- will count the number of student in the class



-- GROUP BY CLAUSE-> it clooects data from multiple records and groups the result by one or more column --

-- example: count the number of student city wise --
SELECT city,count(name)
FROM student
GROUP BY city;


SELECT marks,count(name)
FROM student
GROUP BY marks
having marks>50;

SELECT count(name) 
FROM student WHERE marks>50; -- count the number of student who has marks greater than 50 --

SELECT city,COUNT(rollno)
FROM student
GROUP BY city;       -- counts the number of students reside in city --

-- write the query to find avg marks in each city in ascending order --
SELECT city, AVG(marks)
FROM student
GROUP BY city
ORDER BY city ASC;

SELECT  grade,count(rollno)  -- to find how much students got what grade --
FROM student
GROUP BY grade
ORDER BY grade ;

-- count the number of students in each city where max marks cross 90 --
SELECT city,COUNT(name)
FROM student
GROUP BY city
HAVING MAX(marks)>90;

-- update operations --
set SQL_SAFE_UPDATES=0;

UPDATE student
SET grade= 'O'
WHERE grade='a';

UPDATE student
SET marks = 89
WHERE rollno=4;

UPDATE student
SET grade = "B"
WHERE marks BETWEEN 80 AND 90;

UPDATE student 
SET marks= marks+1;  -- everyone's marks has been increased by one --

UPDATE student
SET marks = 30
WHERE rollno=4;

-- deleting the records --
DELETE FROM student
WHERE marks<33;  -- fail students marks has to be deleted --

SELECT * FROM student;
DROP TABLE student;


-- FOREIGN KEYS: foreign keys can be used by using refrence keyword ,and helps to add 2 or more tables,we can use cascading update and cascading delete to for syncronous opeartions --

CREATE DATABASE foreign_keys;
USE foreign_keys;

CREATE TABLE dept
(id int PRIMARY KEY,
dept_name VARCHAR(20));

CREATE TABLE teacher
(teacher_id INT PRIMARY KEY,
tname VARCHAR(20),
dept_id INT ,
FOREIGN KEY (dept_id) REFERENCES dept(id)  -- this table is child table --
ON UPDATE CASCADE
ON DELETE CASCADE   -- for reflecting the changes in both the table --
);

INSERT INTO dept
VALUES
(101,"eng"),
(102,"management"),
(103,"cs");

SELECT * FROM dept;

INSERT INTO teacher
(teacher_id,tname,dept_id)
VALUES
(1,"ram",101),
(2,"bob",102),
(3,"jack",103);
SELECT *FROM teacher;

UPDATE dept
SET id=199
WHERE id=101;

DROP TABLE teacher;


-- alter command: is used to change the schema,add(),drop(),rename()...etc operations --
USE apna_college;

CREATE TABLE stu(
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1) NOT NULL,
city VARCHAR(20)
);


INSERT INTO stu
VALUES
(1,'abhishek',55,'c','delhi'),
(2,'parth',78,'b','mp'),
(3,'naval',98,'a','bihar'),
(4,'dheeraj',34,'f','noida'),
(5, 'gulshan',100,'a','noida');
SELECT * FROM stu;

ALTER TABLE stu                   -- to add  another column --
ADD COLUMN age INT NOT NULL DEFAULT 20;

ALTER TABLE stu                -- to delete the cloumn --
DROP COLUMN age;

ALTER TABLE stu               -- to rename the column name along with new datatype--
CHANGE COLUMN rollno stu_id INT NOT NULL;

ALTER TABLE stu                -- to modify the column's datatype or constraint --
MODIFY age VARCHAR(20) NOT NULL DEFAULT "TWENTY"; 

INSERT INTO stu
VALUES
(106,"rohit", 88,'b','punjab',77);

UPDATE stu
SET age = "twenty"
WHERE age =77;
/*
ALTER TABLE stu
CHANGE age stu_age INT;  -- not possible to chnage the datatype of the cloumn because it contains varchar*/

ALTER TABLE stu         -- this command can chage the cloumn name as well as its datatype --
CHANGE age stu_age VARCHAR(10);

ALTER TABLE stu            -- to rename the table name --
RENAME TO stud;

ALTER TABLE stud            
RENAME TO stu;

ALTER TABLE stu
ADD COLUMN attendence INT DEFAULT 60;

ALTER TABLE stu
DROP COLUMN attendence;

DELETE FROM stu
WHERE marks<40;

TRUNCATE TABLE stu;    -- it clears all the data of the table --

SELECT * FROM stu;

SHOW TABLES;
drop table stu;


-- joins --

CREATE TABLE list (
id INT PRIMARY KEY ,
name VARCHAR(10));

INSERT INTO list
VALUES
(1,"sonam"),
(2,"kaka"),
(3,"flora");


SELECT * FROM list;

CREATE TABLE courses (
ids INT PRIMARY KEY ,
course VARCHAR(10));

INSERT INTO courses 
VALUES
(1,"eng"),
(5,"matha"),
(3,"sans"),
(7, "cs");



SELECT * FROM courses;
-- the INNER join will print all the common data between both table --
SELECT *
FROM list
INNER JOIN courses
ON courses.ids=list.id;    

-- alternatively --
SELECT * 
FROM list as l
INNER JOIN courses as c
ON c.ids = l.id;                 -- here 'as' is used as the alias means alternate name --

-- LEFT join : returns recorse from the left table,and the matched records form the both table --

SELECT * 
FROM list    -- the left table sould be written first --      
LEFT JOIN courses
ON list.id= courses.ids;

-- RIGHT join : returns recorse from the right table,and the matched records form the both able --
SELECT *
FROM list
RIGHT JOIN courses
ON courses.ids=list.id ;

-- FULL join: is used to give the union of both the table --

SELECT * FROM list as l
LEFT JOIN courses as c
ON l.id = c.ids
UNION
SELECT *FROM list as l
RIGHT JOIN courses as c
ON l.id =c.ids;

 --     LEFT EXCLUSIVE JOIN : use to return only the left table(L-R table's data) --
SELECT * FROM list as a
LEFT JOIN courses as b
ON a.id = b.ids 
WHERE b.ids IS NULL;


-- 	RIGHT EXCLUSIVE JOIN: use to return only the right table (R-L table's data) --
SELECT * FROM list as a
RIGHT JOIN courses as b
ON a.id = b.ids
WHERE a.id IS NULL ;

-- full exclusive join/disjoint  --

SELECT * FROM list as a
LEFT JOIN courses as b
ON a.id = b.ids 
WHERE b.ids IS NULL
UNION
SELECT * FROM list as a
RIGHT JOIN courses as b
ON a.id = b.ids
WHERE a.id IS NULL ;


-- UNION is used to combine the result-set of two or more select statements,and gives UNIQUE records  --
-- UNION ALL: gives all the records,means it gives duplicates as well  --


SELECT name FROM list   -- will show all the names in both the table --
UNION
SELECT course FROM courses;



CREATE TABLE classtest(
rollno INT PRIMARY KEY,
name VARCHAR(10),
marks INT NOT NULL );

INSERT INTO classtest
(rollno,name,marks)
VALUES
(101,"anil",78),
(102,"bhumika",93),
(103,"chetan",85),
(104,"dhruv",96),
(105,"eman",92),
(106,"frah",82);








