/*

https://platform.stratascratch.com/coding/2062-questions-in-second-quarter

Questions in Second Quarter

Amazon ID 2062

How many searches were there in the second quarter of 2021?

Table: fb_searches

fb_searches

date:datetime
search_id:int
user_id:int
age_group:varchar
search_query:varchar

*/

SELECT 
    COUNT(DISTINCT search_id) n_searches
FROM fb_searches
WHERE date BETWEEN '2021-04-01' AND '2021-06-30'