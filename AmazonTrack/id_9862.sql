/*

https://platform.stratascratch.com/coding/9862-find-the-last-record-of-the-dataset-without-using-limit-or-order-by

Find the last record of the dataset without using LIMIT or ORDER BY

Amazon ID 9862

Find the last record of the dataset without using LIMIT or ORDER BY.

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
WHERE joining_date = (SELECT DISTINCT LAST_VALUE(joining_date) OVER() FROM worker)