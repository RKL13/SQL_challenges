/*

https://platform.stratascratch.com/coding/9845-find-the-number-of-employees-working-in-the-admin-department

Find the number of employees working in the Admin department

Amazon ID 9845

Find the number of employees working in the Admin department.

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
    COUNT(*) 
FROM worker
WHERE department = 'Admin'