/*

https://platform.stratascratch.com/coding/9843-find-all-workers-whose-salary-lies-between-100000-and-500000

Find all workers whose salary lies between 100000 and 500000

Amazon ID 9843

Find all workers whose salary lies between 100000 and 500000.

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
    * 
FROM worker
WHERE salary BETWEEN 100000 AND 500000