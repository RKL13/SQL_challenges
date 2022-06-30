/*

https://platform.stratascratch.com/coding/9864-find-the-last-five-records-of-the-dataset

Find the last five records of the dataset.

Amazon ID 9864

Find the last five records of the dataset.

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
ORDER BY worker_id DESC
LIMIT 5