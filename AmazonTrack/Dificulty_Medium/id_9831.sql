/*

https://platform.stratascratch.com/coding/9831-formatting-names

Formatting Names

Amazon ID 9831

Print the first name after removing white spaces from the left side.

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
    LTRIM(first_name)
FROM worker