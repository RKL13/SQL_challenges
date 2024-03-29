/*

https://platform.stratascratch.com/coding/10088-liked-posts

'Liked' Posts

Amazon ID 10088

Find the number of posts which were reacted to with a like.

Tables: facebook_reactions, facebook_posts

facebook_reactions

poster:int
friend:int
reaction:varchar
date_day:int
post_id:int

facebook_posts
post_id:int
poster:int
post_text:varchar
post_keywords:varchar
post_date:datetime

*/

SELECT 
    COUNT(DISTINCT r.post_id)
FROM facebook_reactions r
LEFT JOIN facebook_posts p
ON r.post_id = p.post_id
WHERE reaction = 'like'