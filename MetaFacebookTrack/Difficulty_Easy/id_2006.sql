/*

https://platform.stratascratch.com/coding/2006-users-activity-per-month-day

Users Activity Per Month Day

Amazon ID 2006

Return a distribution of users activity per day of the month

Table: facebook_posts

facebook_posts

post_id:int
poster:int
post_text:varchar
post_keywords:varchar
post_date:datetime

*/

SELECT 
    DATE_PART('day', post_date),
    COUNT(*)
FROM facebook_posts
GROUP BY post_date