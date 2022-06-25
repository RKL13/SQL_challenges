/*

https://platform.stratascratch.com/coding/9869-find-the-total-salary-of-each-department

Find the total salary of each department

Amazon ID 9869

Find the total salary of each department.
Output the salary along with the corresponding department.

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
    SUM(salary) AS total_salary,
    department 
FROM worker
GROUP BY department