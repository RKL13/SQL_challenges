/*

https://platform.stratascratch.com/coding/9868-find-the-five-highest-salaries

Find the five highest salaries

Amazon ID 9868

Find the five highest salaries.

Table: worker

worker

worker_id:int
first_name:varchar
last_name:varchar
salary:int
joining_date:datetime
department:varchar

*/

SELECT DISTINCT
    salary 
FROM worker
ORDER BY salary DESC
limit 5