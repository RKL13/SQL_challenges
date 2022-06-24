/*

https://platform.stratascratch.com/coding/10136-find-workers-with-an-odd-number-for-worker-id

Find workers with an odd number for worker id

Amazon ID 10136

Find workers and their corresponding information from the table with an odd number for their worker id.

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
WHERE MOD(worker_id, 2) <> 0