/*

https://platform.stratascratch.com/coding/9842-find-all-workers-whose-first-name-contains-6-letters-and-also-ends-with-the-letter-h

Find all workers whose first name contains 6 letters and also ends with the letter 'h'

Amazon ID 9842

Find all workers whose first name contains 6 letters and also ends with the letter 'h'.

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
WHERE first_name ILIKE '%h' 
AND LENGTH(first_name) = 6