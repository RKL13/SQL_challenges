/*

https://platform.stratascratch.com/coding/9828-print-the-first-three-characters-of-the-first-name

Print the first three characters of the first name

Amazon ID 9828

Print the first three characters of the first name.

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
    LEFT(first_name, 3)
FROM worker