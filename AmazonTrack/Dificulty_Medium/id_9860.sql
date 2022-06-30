/*

https://platform.stratascratch.com/coding/9860-find-departments-with-less-than-5-employees

Find departments with less than 5 employees

Amazon ID 9860

Find departments with less than 5 employees.
Output the department along with the corresponding number of workers.

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
    department,
    COUNT(DISTINCT worker_id) AS count_employee_dpt
FROM worker
GROUP BY department
HAVING COUNT(DISTINCT worker_id) < 5