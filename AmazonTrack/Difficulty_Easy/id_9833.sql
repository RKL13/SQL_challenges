/*

https://platform.stratascratch.com/coding/9833-replace-the-letter-a-with-a-in-the-first-name

Replace the letter 'a' with 'A' in the first name

Amazon ID 9833

Replace the letter 'a' with 'A' in the first name.

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
    REPLACE(first_name, 'a', 'A') 
FROM worker