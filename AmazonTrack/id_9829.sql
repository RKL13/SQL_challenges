/*

https://platform.stratascratch.com/coding/9829-positions-of-letter-a

Positions Of Letter 'a'

Amazon ID 9829

Find the position of the letter 'a' in the first name of the worker 'Amitah'. Use 1-based indexing, e.g. position of second letter is 2.

Table: worker

worker

worker_id:int
first_name:varchar
last_name:varchar
salary:int
joining_date:datetime
department:varchar

*/

/* PostgreSQL */

SELECT 
    POSITION('a' IN first_name)
FROM worker
WHERE first_name = 'Amitah'

/* MySQL */

SELECT 
    POSITION('a' IN BINARY first_name)
FROM worker
WHERE first_name = 'Amitah'

