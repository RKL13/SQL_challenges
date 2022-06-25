/*

https://platform.stratascratch.com/coding/9839-find-all-workers-that-work-in-the-admin-department

Find all workers that work in the Admin department

Amazon ID 9839

Find all workers that work in the Admin department

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
WHERE department = 'Admin'