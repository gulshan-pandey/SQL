-- Indexing: Indexing creates a lookup table with column and the pointer to the memory location of the row, contiaining this column

-- Interview question: you are given a table, in which you have 100 rows... but in the future you will have 1million rows, then how will you retrieve(optimized retriving ) data form that table
-- Ans: The answer will be we will use indexing on the column, so earlier it was O(n) but after indexing it will retrieve in O(logn)

-- Next qustion: what is indexing, and what it does, and what it is used for : 
-- Ans: Indexing creates a seperate memory location , in that memory that specific column gets stored in the sorted manner, and side by side it also saves the pointer for memmory location, for that memory location 
--      B-tree data structure is used to store the indexing as it is a multilevel format of tree-based indexing which has balanced binary search tree 
--      Indexing is mainly used in read intensive database (means the database where mainly read queries are used ), 
--      If the table where there is Insertion, update,write intensive , we should not use Indexing 



-- Interview question: What is a clustered index, and how is it different from a non-clustered index?
-- Ans: A clustered index determines the physical order of the data in the table. A table can only have one clustered index, as data rows can only be sorted in one order. A non-clustered index, on the other hand, creates a separate structure from the data rows, and the index contains pointers to the physical data locations.

-- Interview question: What are composite indexes, and when should you use them?
-- Ans: A composite index is an index on two or more columns. It is useful when you often query multiple columns together in the WHERE clause. For example, creating an index on (first_name, last_name) is helpful for queries like `SELECT * FROM employees WHERE first_name = 'John' AND last_name = 'Doe'`.

-- Interview question: What is a covering index, and how does it improve query performance?
-- Ans: A covering index is an index that contains all the columns needed to answer a query, so the database can retrieve all necessary data from the index itself, without having to look up the actual rows in the table. This reduces disk I/O, thus improving query performance.

-- Interview question: What is the difference between a primary key and a unique key?
-- Ans: A primary key uniquely identifies each row in a table and cannot be NULL, while a unique key also ensures uniqueness but allows for NULL values. A table can only have one primary key but can have multiple unique keys.

-- Interview question: What is the difference between DELETE, TRUNCATE, and DROP commands?
-- Ans: 
-- DELETE: Removes rows from a table based on a condition, but it can be rolled back.
-- TRUNCATE: Removes all rows from a table, cannot be rolled back, but retains the structure of the table.
-- DROP: Removes the entire table from the database, including its structure and data, and cannot be rolled back.

-- Interview question: How do you optimize a query that is running slow?
-- Ans: 
-- 1. Check and optimize the query execution plan.
-- 2. Add proper indexes on frequently used columns in WHERE, JOIN, and ORDER BY clauses.
-- 3. Use LIMIT to reduce result set size.
-- 4. Avoid using SELECT *, instead, select only the columns you need.
-- 5. Decompose complex queries into simpler ones or use proper JOINs.
-- 6. Analyze and partition large tables if necessary.

-- Interview question: What is database normalization, and why is it important?
-- Ans: Database normalization is the process of organizing data in a database to minimize redundancy and dependency. The goal is to ensure that data is stored efficiently and consistently. The common normal forms (1NF, 2NF, 3NF) help to eliminate data anomalies like update, insert, and delete anomalies.

-- Interview question: Explain the difference between INNER JOIN, LEFT JOIN, and RIGHT JOIN.
-- Ans:
-- INNER JOIN: Returns records that have matching values in both tables.
-- LEFT JOIN: Returns all records from the left table, and the matched records from the right table. Unmatched records will contain NULLs.
-- RIGHT JOIN: Returns all records from the right table, and the matched records from the left table. Unmatched records will contain NULLs.

-- Interview question: What is SQL injection, and how can you prevent it?
-- Ans: SQL injection is a code injection technique where attackers can execute arbitrary SQL queries on a database through input fields. It can be prevented by:
-- 1. Using parameterized queries or prepared statements.
-- 2. Validating and sanitizing user inputs.
-- 3. Limiting database user privileges.

-- Interview question: What is the difference between UNION and UNION ALL?
-- Ans: 
-- UNION: Combines the result sets of two or more SELECT queries and removes duplicates.
-- UNION ALL: Combines the result sets of two or more SELECT queries without removing duplicates, making it faster than UNION.
