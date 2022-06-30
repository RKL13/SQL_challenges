/*

https://platform.stratascratch.com/coding/9859-find-the-first-50-records-of-the-dataset

Find the first 50% records of the dataset

Amazon ID 9859

Find the first 50% records of the dataset.

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
WHERE worker_id <= (SELECT COUNT(*)/2 AS fifty_percent FROM worker)