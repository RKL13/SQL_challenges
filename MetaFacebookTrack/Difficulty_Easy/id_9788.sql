/*

https://platform.stratascratch.com/coding/9788-find-the-total-number-of-interactions-on-days-0-and-2

Find the total number of interactions on days 0 and 2

Amazon ID 9788

Find the total number of interactions on days 0 and 2.

Output the result alongside the day.

Table: facebook_user_interactions

facebook_user_interactions

day:int
user1:int
user2:int

*/

SELECT 
    day,
    COUNT(day)
FROM facebook_user_interactions
WHERE day IN (0,2)
GROUP BY day