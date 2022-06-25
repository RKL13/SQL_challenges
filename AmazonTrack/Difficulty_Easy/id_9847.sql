/*

https://platform.stratascratch.com/coding/9846-find-the-full-name-of-workers-whose-salaries-50000-and-100000

Find the full name of workers whose salaries >= 50000 and <= 100000

Amazon ID 9846

Find the full name of workers whose salaries >= 50000 and <= 100000
Output the worker's first name and last name in one column along with their salaries

Table: worker

worker

worker_id:int
first_name:varchar
last_name:varchar
salary:int
joining_date:datetime
department:varchar

*/

SELECT 
    CONCAT(first_name, ' ' ,last_name),
    salary
FROM worker
WHERE salary BETWEEN 50000 AND 100000