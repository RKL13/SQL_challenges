/*

https://platform.stratascratch.com/coding/9838-find-details-of-workers-excluding-those-with-the-first-name-vipul-or-satish

Find details of workers excluding those with the first name 'Vipul' or 'Satish'

Amazon ID 9838

Find details of workers excluding those with the first name 'Vipul' or 'Satish'

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
WHERE first_name NOT IN ('Vipul', 'Satish')