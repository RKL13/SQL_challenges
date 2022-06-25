/*

https://platform.stratascratch.com/coding/9830-print-the-first-name-after-removing-white-spaces-from-the-right-side

Print the first name after removing white spaces from the right side

Amazon ID 9830

Print the first name after removing white spaces from the right side.

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
    RTRIM(first_name) r_trimmed_first_name
FROM worker