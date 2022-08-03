/*

https://platform.stratascratch.com/coding/9765-list-all-interactions-of-user-wth-id-4-on-either-day-0-or-2

List all interactions of user wth id 4 on either day 0 or 2

Amazon ID 9765

List all interactions of user with id 4 on either day 0 or 2.

Table: facebook_user_interactions

facebook_user_interactions

day:int
user1:int
user2:int

*/

SELECT 
    * 
FROM facebook_user_interactions
WHERE (user1 = 4 OR user2 = 4)
AND (day=0 OR day = 2)