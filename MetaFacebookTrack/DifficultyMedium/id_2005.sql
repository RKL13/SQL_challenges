/*

https://platform.stratascratch.com/coding/2005-share-of-active-users

Share of Active Users

Amazon ID 2005

Output share of US users that are active. Active users are the ones with an "open" status in the table.

Output the feature id along with its maximum step.

Table: fb_active_users

fb_active_users

user_id:int
name:varchar
status:varchar
country:varchar

*/

SELECT 
    SUM(CASE 
        WHEN  status = 'open' THEN 1
        ELSE 0
    END)::FLOAT/COUNT(*)::FLOAT AS share
FROM fb_active_users
WHERE country = 'USA'