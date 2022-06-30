/*

https://platform.stratascratch.com/coding/9855-find-the-5th-highest-salary-without-using-top-or-limit

Find the 5th highest salary without using TOP or LIMIT

Amazon ID 9855

Find the salary of the 5th highest paid employee without using TOP or LIMIT.

Table: worker

worker

worker_id:int
first_name:varchar
last_name:varchar
salary:int
joining_date:datetime
department:varchar

*/

WITH ranked_table 
AS (SELECT RANK() OVER(ORDER BY salary DESC) rank_salary,
           * 
    FROM worker)
    
SELECT 
    *
FROM ranked_table
WHERE rank_salary = 5