/*

https://platform.stratascratch.com/coding/9841-find-all-workers-whose-first-name-ends-with-the-letter-a

Find all workers whose first name ends with the letter 'a'

Amazon ID 9841

Find all workers whose first name ends with the letter 'a'.

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
WHERE first_name ILIKE '%a'