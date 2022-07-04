/*

https://platform.stratascratch.com/coding/9857-find-the-second-highest-salary-without-using-order-by

Find the second highest salary without using ORDER BY

Amazon ID 9857

Find the second highest salary without using ORDER BY.



Table: worker

worker

worker_id:int
first_name:varchar
last_name:varchar
salary:int
joining_date:datetime
department:varchar

*/

SELECT MAX(salary) 
FROM worker
WHERE salary NOT IN (SELECT MAX(salary) FROM worker)