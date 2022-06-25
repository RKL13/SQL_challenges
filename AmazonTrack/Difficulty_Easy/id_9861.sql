/*

https://platform.stratascratch.com/coding/9861-find-the-number-of-employees-in-each-department

Find the number of employees in each department

Amazon ID 9861

Find the number of employees in each department.
Output the department name along with the corresponding number of employees.

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
    COUNT(worker_id)
FROM worker
GROUP BY department