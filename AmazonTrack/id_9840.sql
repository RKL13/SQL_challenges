/*

https://platform.stratascratch.com/coding/9840-find-all-workers-whose-first-name-contains-the-letter-a

Find all workers whose first name contains the letter 'a'

Amazon ID 9840

Find all workers whose first name contains the letter 'a'. Output all columns for such workers.

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
WHERE first_name ILIKE '%a%'