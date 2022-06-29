/*

https://platform.stratascratch.com/coding/9865-highest-salaried-employees

Highest Salaried Employees

Amazon ID 9865

Find the employee with the highest salary in each department.
Output the department name, employee's first name, and the salary.

worker

worker_id:int
first_name:varchar
last_name:varchar
salary:int
joining_date:datetime
department:varchar

*/

WITH ranked_dpt_salaries
AS (SELECT 
    department,
    first_name, 
    salary,
    DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_per_department
FROM worker
GROUP BY department, first_name, salary)

SELECT 
    *
FROM ranked_dpt_salaries
WHERE rank_per_department = 1