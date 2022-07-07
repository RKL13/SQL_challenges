/*

https://platform.stratascratch.com/coding/10141-apple-product-counts

Apple Product Counts

Amazon ID 10141

Find the number of Apple product users and the number of total users with a device and group the counts by language. 
Assume Apple products are only MacBook-Pro, iPhone 5s, and iPad-air. 
Output the language along with the total number of Apple users and users with any device. 
Order your results based on the number of total users in descending order.

Tables: playbook_events, playbook_users

playbook_events

user_id:int
occurred_at:datetime
event_type:varchar
event_name:varchar
location:varchar
device:varchar

playbook_users

user_id:int
created_at:datetime
company_id:int
language:varchar
activated_at:datetime
state:varchar

*/

/* Starred for : COUNT(DISTINCT CASE WHEN device IN ('macbook pro', 'iphone 5s', 'ipad air') THEN pe.user_id ELSE NULL END) */ 

SELECT 
    language,
    COUNT(DISTINCT pe.user_id) AS all_users,
    COUNT(DISTINCT CASE WHEN device IN ('macbook pro', 'iphone 5s', 'ipad air') THEN pe.user_id ELSE NULL END) AS mac_user
FROM playbook_events pe
LEFT JOIN playbook_users pu
ON pe.user_id = pu.user_id
GROUP BY language 
ORDER BY all_users DESC