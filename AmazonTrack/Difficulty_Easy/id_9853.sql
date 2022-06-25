/*

https://platform.stratascratch.com/coding/9853-find-the-top-5-highest-salaries

Find the top 5 highest paid workers

Amazon ID 9853

Find the top 5 highest paid workers. Output all information about workers whose salaries are among top 5 paid ones.

Table: worker

worker

worker_id:int
first_name:varchar
last_name:varchar
salary:int
joining_date:datetime
department:varchar

*/

WITH table_ranked_by_salary 
AS (SELECT 
        *,
        RANK() OVER(ORDER BY salary DESC) AS salary_rank
    FROM worker)
    
SELECT 
    * 
FROM table_ranked_by_salary
WHERE salary_rank <= 5