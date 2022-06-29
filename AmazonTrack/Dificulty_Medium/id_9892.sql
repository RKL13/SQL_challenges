/*

https://platform.stratascratch.com/coding/9892-second-highest-salary

Second Highest Salary

Amazon ID 9892

Find the second highest salary of employees.

Tables: employee

employee

id:int
first_name:varchar
last_name:varchar
age:int
sex:varchar
employee_title:varchar
department:varchar
salary:int
target:int
bonus:int
email:varchar
city:varchar
address:varchar
manager_id:int

*/

WITH ranked_salaries 
AS (SELECT salary,
           RANK() OVER(ORDER BY salary DESC) AS rank_desc
    FROM employee
    GROUP BY salary)
    
SELECT 
    salary
FROM ranked_salaries
WHERE rank_desc = 2