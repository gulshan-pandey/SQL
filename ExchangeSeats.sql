

Table: Seat
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| student     | varchar |
+-------------+---------+
id is the primary key (unique value) column for this table.
Each row of this table indicates the name and the ID of a student.
The ID sequence always starts from 1 and increments continuously.
 

Write a solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by id in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output: 
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation: 
Note that if the number of students is odd, there is no need to change the last one's seat.




SOLUTION

Approach: LAG looks at the previous row's student
            For ID 2, it gets student from ID 1
            For ID 4, it gets student from ID 3

        LEAD looks at the next rows student
        COALESCE handles the last student if odd number of students

            For ID 1, it gets student from ID 2
            For ID 3, it gets student from ID 4
            For last ID (if odd), keeps original student (due to COALESCE)



select id,
case when id%2=0 then lag(student) over(order by id)
else coalesce(lead(student) over(order by id),student)
end as student
from seat;