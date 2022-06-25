/*

https://platform.stratascratch.com/coding/9836-sort-workers-in-ascending-order-by-the-first-name-and-in-descending-order-by-department-name

Sort workers in ascending order by the first name and in descending order by department name

Amazon ID 9836

Sort workers in ascending order by the first name and in descending order by department name.

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
ORDER BY first_name ASC, department DESC