/*

https://platform.stratascratch.com/coding/9848-find-all-workers-who-are-also-managers

Find all workers who are also managers

Amazon ID 9848

Find all workers who are also managers.
Output the first name along with the corresponding title.

Tables: worker, title

worker

worker_id:int
first_name:varchar
last_name:varchar
salary:int
joining_date:datetime
department:varchar

title

worker_ref_id:int
worker_title:varcha
raffected_from:datetime

*/

SELECT 
    first_name,
    worker_title
FROM worker
LEFT JOIN title
ON worker.worker_id = title.worker_ref_id
WHERE worker_title = 'Manager'
