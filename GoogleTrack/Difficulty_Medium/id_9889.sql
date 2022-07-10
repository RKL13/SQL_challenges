/*

https://platform.stratascratch.com/coding/9889-find-how-many-logins-spanish-speakers-made-by-country

Find how many logins Spanish speakers made by country

Amazon ID 9889

Find how many logins Spanish speakers made by country.
Output the country along with the corresponding number of logins.
Order records by the number of logins in descending order.

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

SELECT 
    location,
    COUNT(*) NUMBER8OF8LOGINS
FROM playbook_events e
LEFT JOIN playbook_users u
ON e.user_id = u.user_id
WHERE language = 'spanish'
AND event_name = 'login'
GROUP BY location