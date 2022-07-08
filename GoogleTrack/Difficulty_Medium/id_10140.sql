/*

https://platform.stratascratch.com/coding/10140-macbook-pro-events

MacBook Pro Events

Amazon ID 10140

Find how many events happened on MacBook-Pro per company in Argentina from users that do not speak Spanish.

Output the company id, language of users, and the number of events performed by users.
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
    company_id,
    language,
    COUNT(event_name) n_events
FROM playbook_events pe
LEFT JOIN playbook_users pu
ON pe.user_id = pu.user_id
WHERE location = 'Argentina' 
AND language <> 'spanish'
AND device = 'macbook pro'
GROUP BY company_id, language