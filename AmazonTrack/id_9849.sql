/*

https://platform.stratascratch.com/coding/9849-find-the-duplicate-records-in-the-dataset

Find the duplicate records in the dataset

Amazon ID 9849

Find the rows where (worker title, affected from date) combination occurred more than once
Output the worker title, affected_from date, and the number of times the occurrence happened.

Table: title

title

worker_ref_id:int
worker_title:varchar
affected_from:datetime

*/

WITH table_duplicates_count 
AS (SELECT 
        worker_title, 
        affected_from,
        COUNT(*) AS n_rows
    FROM title
    GROUP BY worker_title, affected_from)

SELECT 
    *
FROM table_duplicates_count
WHERE n_rows > 1 