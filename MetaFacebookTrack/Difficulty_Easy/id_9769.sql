/*

https://platform.stratascratch.com/coding/9769-find-all-friends-who-liked-a-post

Find all users who liked a post

Amazon ID 9769

Find all users who liked one or more posts

Table: facebook_reactions

facebook_reactions

poster:int
friend:int
reaction:varchar
date_day:int
post_id:int

*/

SELECT 
    friend 
FROM facebook_reactions
WHERE reaction = 'like'
GROUP BY friend