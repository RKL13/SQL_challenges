/*

https://platform.stratascratch.com/coding/2061-users-with-many-searches

Users with Many Searches

Amazon ID 2061

Count the number of users who made more than 5 searches in August 2021.

Table: fb_searches

fb_searches

date:datetime
search_id:int
user_id:int
age_group:varchar
search_query:varchar

*/

WITH preprocessed_table
AS (SELECT user_id
    FROM fb_searches
    WHERE date BETWEEN '2021-08-01' AND '2021-08-31'
    GROUP BY user_id
    HAVING COUNT(DISTINCT search_id) >+ 5)
    
SELECT 
    COUNT(DISTINCT user_id) 
FROM preprocessed_table