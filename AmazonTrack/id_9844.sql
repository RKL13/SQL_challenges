/*

https://platform.stratascratch.com/coding/9844-find-all-workers-who-joined-on-february-2014

Find all workers who joined on February 2014

Amazon ID 9844

Find all workers who joined on February 2014.

Table: worker

worker

worker_id:int
first_name:varchar
last_name:varchar
salary:int
joining_date:datetime
department:varchar

*/

/* Originaly */

SELECT 
    * 
FROM worker
WHERE joining_date BETWEEN '2014-02-01' AND '2014-02-28'

