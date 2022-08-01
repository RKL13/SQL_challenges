/*

https://platform.stratascratch.com/coding/9787-user-scroll-up-events

User Scroll Up Events

Amazon ID 9787

Find all users that have performed at least one scroll_up event.

Output the result alongside the day.

Table: facebook_web_log

facebook_web_log

user_id:int
timestamp:datetime
action:varchar

*/

SELECT DISTINCT user_id
FROM facebook_web_log
WHERE action = 'scroll_up'