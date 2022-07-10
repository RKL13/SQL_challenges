/*

https://platform.stratascratch.com/coding/9890-number-of-users-events

Number Of User's Events

Amazon ID 9890

Find the total number of events a user has triggered and the average number of days between the event 
date and date of when the user activated.

Your output should include the user_id, event name, the number of events , 
and the average date between the event dates and the user's activated date.

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
    e.user_id,
    e.event_name,
    COUNT(*) number_of_events,
    AVG(occurred_at::DATE - activated_at::DATE)
FROM playbook_events e
LEFT JOIN playbook_users u
ON e.user_id = u.user_id
GROUP BY e.user_id, e.event_name