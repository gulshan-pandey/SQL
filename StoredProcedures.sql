-- Stored Procedure -- is a prepared SQL code that you can save, great if there is a query that you write often. These are reusable code used to perform a specific task

CREATE DATABASE StoredPrsdr;

USE StoredPrsdr;
DROP DATABASE StoredPrsdr;
CREATE TABLE Em(
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    Department VARCHAR(255),
    Salary DECIMAL(10, 2)
);

INSERT INTO Em (EmployeeID, Name, Department, Salary)
VALUES
(1, 'John Doe', 'HR', 50000.00),
(2, 'Jane Doe', 'Marketing', 60000.00),
(3, 'Bob Smith', 'IT', 70000.00);

SELECT  * FROM Em;

DELIMITER $$

CREATE PROCEDURE sp_GetAllEmployees()
BEGIN
    SELECT * FROM Em;
END $$

DELIMITER ;

CALL sp_GetAllEmployees();

DROP PROCEDURE sp_GetAllEmployees;


DELIMITER $$
CREATE PROCEDURE findem(IN id INT)
BEGIN
	SELECT * 
    FROM Em
    WHERE EmployeeID =id;
END $$
DELIMITER ;

CALL findem(3);

DROP PROCEDURE findem;



DELIMITER $$
CREATE PROCEDURE changeSal(IN f_name VARCHAR(50), 
							IN  Sal DECIMAL(10, 2))
BEGIN
	UPDATE Em
    SET Salary = Sal
    WHERE Name = f_name;
END $$
DELIMITER ;

Call changeSal('Bob Smith',110000);

DROP PROCEDURE changename;