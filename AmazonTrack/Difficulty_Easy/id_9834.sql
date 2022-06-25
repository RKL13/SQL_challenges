/*

https://platform.stratascratch.com/coding/9834-combine-the-first-and-last-names-of-workers

Combine the first and last names of workers

Amazon ID 9834

Combine the first and last names of workers with a space inbetween.

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
    CONCAT(first_name, ' ', last_name) AS full_name
FROM worker