/*

https://platform.stratascratch.com/coding/9771-find-all-actions-which-occurred-more-than-once-in-the-weblog

Find all actions which occurred more than once in the weblog

Amazon ID 9771

Find all actions which occurred more than once in the weblog.

Table: facebook_web_log

facebook_web_log

user_id:int
timestamp:datetime
action:varchar

*/

SELECT 
    action,
    COUNT(*)
FROM facebook_web_log
GROUP BY action
HAVING COUNT(*) > 1 