


CREATE TABLE Salary (
    Employee_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Hourly_Pay DECIMAL(5, 2),
    Job VARCHAR(50),
    Hire_Date DATE
);

INSERT INTO Salary (Employee_ID, First_Name, Last_Name, Hourly_Pay, Job, Hire_Date)
VALUES
(1, 'John', 'Doe', 20.50, 'Software Engineer', '2020-01-15'),
(2, 'Jane', 'Smith', 18.75, 'Accountant', '2019-06-20'),
(3, 'Robert', 'Johnson', 22.00, 'Sales Representative', '2021-03-10'),
(4, 'Emily', 'Brown', 19.25, 'Human Resources', '2020-09-05'),
(5, 'Michael', 'Davis', 21.50, 'Marketing Specialist', '2019-11-25'),
(6, 'Sophia', 'Wilson', 18.00, 'Customer Service Representative', '2021-02-18');

SELECT * From Salary;

ALTER TABLE Salary
ADD COLUMN Yearly DECIMAL(10,2) AFTER Hourly_pay;

UPDATE Salary
SET Yearly = Hourly_Pay* 1920;



-- now i want update the salary everytime I increase the hourly pay of an employee : so I will create a trigger--

 SHOW TRIGGERS;

UPDATE Salary			-- trigger will be applied to the id 1--
SET Hourly_pay =50
WHERE Employee_ID =1;

SELECT * FROM Salary;

UPDATE Salary
SET Hourly_pay = Hourly_pay + 5; -- This updates the employee with ID 1


-- creating a new trigger whenever we add new employee the the yearly pay is instantiated 


DELETE FROM Salary
WHERE Employee_ID = 6; 

-- before_Hourly_pay_insert :- this is just a name of trigger and dont have to do anything with the behaviour of the trigger

CREATE TRIGGER before_Hourly_pay_insert				
BEFORE UPDATE ON Salary
FOR EACH ROW
SET NEW.YEARLY =(NEW.Hourly_Pay * 1920);

CREATE TRIGGER insert_Hourly_pay_insert				
BEFORE INSERT ON Salary
FOR EACH ROW
SET NEW.YEARLY =(NEW.Hourly_Pay * 1920);

INSERT INTO Salary VALUES
(0, 'Jane', 'Smith', 18.75,NULL, 'Accountant', '2019-06-20');

SELECT * FROM Salary;
 SHOW TRIGGERS;
 
 drop table expenses;
 
 -- creating new table expense and adding triggers on it--------------------------
 
CREATE TABLE expenses(
	expense_id INT PRIMARY KEY,
    expense_name VARCHAR(50),
    expense_total DECIMAL(20,2)
);

DROP TABLE expenses;
SELECT * FROM expenses;
INSERT  INTO expenses 
VALUES (1,'budget',0),
	   (2,'taxes' ,0),
	   (3, 'supplies', 0);
	
UPDATE expenses
SET expense_total = (SELECT SUM(Yearly) FROM Salary)
WHERE expense_name = 'budget';

SELECT * FROM expenses;

-- now we want to plant a trigger whenever we delete an employee the budget should be updated

CREATE TRIGGER after_salary_delete
AFTER DELETE ON Salary
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total - OLD.Yearly 
WHERE expense_name = 'budget';

SELECT * FROM Salary;
-- now deleting a employee from the Salary table to see the trigger 

DELETE FROM Salary WHERE Employee_ID = 2;


-- Creating trigger for adding adding the yearly salary to the budget of table expense whenever we insert new employee to the Salary table 

CREATE TRIGGER after_salary_insert
AFTER INSERT ON Salary
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total + NEW.Yearly
WHERE expense_name = 'budget';


DROP TRIGGER IF EXISTS after_salary_delete	;


SELECT * FROM expenses;

INSERT INTO Salary (Employee_ID, First_Name, Last_Name, Hourly_Pay, Job, Hire_Date) VALUES
(1, 'John', 'Doe', 100, 'Software Engineer', '2020-01-15');

SHOW TRIGGERS;

-- creating a trigger whenver any change in yearly row happens it will update the whole budget of the expenses table

CREATE TRIGGER on_Yearly_update
AFTER UPDATE ON Salary
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total + (New.Yearly -OLD.Yearly)
WHERE expense_name = 'budget';


UPDATE Salary
SET Hourly_Pay =99
WHERE Employee_ID =1;

SELECT * FROM expenses;
SELECT * FROM Salary;

DELETE FROM Salary WHERE Employee_ID=1;

