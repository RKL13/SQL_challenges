/*

https://platform.stratascratch.com/coding/9867-find-the-three-lowest-salaries

Find the three lowest salaries

Amazon ID 9867

Find the three lowest salaries.
Order records based on the salary in ascending order.

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
ORDER BY salary ASC
LIMIT 3