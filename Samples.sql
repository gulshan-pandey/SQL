use star;
Select * FROM stu;
DROP TABLE IF EXISTS stu;

CREATE TABLE stu(
stu_id INT,										-- for auto increment while new insertions  use  ->  stu_id INT AUTO_INCREMENT,--
name VARCHAR(255),
email VARCHAR(255),
Phone_no VARCHAR(20),
PRIMARY KEY (stu_id)
);

INSERT INTO stu (stu_id,name,email,phone_no)
VALUES
(1,'rehan','abc@gmail.com','4334904'),
(2,'vishal','abcd@gmail.com' ,'5830503'),
(3,'kalu','abcde@gmail.com' ,'57352475'),
(4,'himanshu','abcdef@gmail.com' ,'58335473'),
(5,'nidhi','abcdefg@gmail.com' ,'265534543'),
(6,'raj','abcdefgh@gmail.com' ,'52455654'); 

SELECT * FROM stu;
SELECT MAX(stu_id) as abc FROM stu;       			-- will give the max student id--


INSERT INTO stu VALUES(8,'vipul','vipul@gmail.com','43343582');

delete from stu where stu_id = 7;
delete from stu where name='vipul';

CREATE DATABASE BANK;
USE BANK;

CREATE TABLE accounts(
name VARCHAR(20),
account_no VARCHAR(20),
type VARCHAR(10),
balance VARCHAR(10)
);

INSERT INTO accounts (name,account_no,type,balance)
VALUES 
('sam','11111','saving','100'),
('om','22222','student','100'),
('kiral','33333','saving','100'),
('vivek','44444','student','100'),
('bheem','55555','saving','100');

UPDATE accounts
SET balance = balance + 13300 where name ='kiran';

delete from accounts where name ='99999';  


select * from accounts;

select * from accounts where account_no = 22222;


CREATE DATABASE EMPLOYEE;

USE EMPLOYEE;

SELECT * FROM employee;

ALTER TABLE Employee
ADD CONSTRAINT uc_Employee_email UNIQUE (email);

