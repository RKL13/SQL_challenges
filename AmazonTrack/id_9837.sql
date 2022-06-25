/*

https://platform.stratascratch.com/coding/9837-find-details-of-workers-with-the-first-name-of-either-vipul-or-satish

Find details of workers with the first name of either 'Vipul' or 'Satish'

Amazon ID 9837

Find details of workers with the first name of either 'Vipul' or 'Satish'.

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
WHERE first_name IN ('Vipul', 'Satish')