/*

https://platform.stratascratch.com/coding/9870-highest-salary

Highest Salary

Amazon ID 9870

Find the worker who earns the highest salary. Output the worker's first name along with the salary.

Table: worker

worker

worker_id:int
first_name:varchar
last_name:varchar
salary:int
joining_date:datetime
department:varchar

*/

/* Original response */ 

WITH table_ranked_by_salary 
AS (SELECT 
        *,
        RANK() OVER(ORDER BY salary DESC) AS salary_rank
    FROM worker)
    
SELECT 
    first_name,
    salary
FROM table_ranked_by_salary
WHERE salary_rank <= 1

/* Interesting alternative */

SELECT 
    first_name,
    salary
FROM worker
WHERE salary = (SELECT max(salary) FROM worker)

