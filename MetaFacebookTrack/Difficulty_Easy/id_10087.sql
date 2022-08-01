/*

https://platform.stratascratch.com/coding/10087-find-all-posts-which-were-reacted-to-with-a-heart

Find all posts which were reacted to with a heart

Amazon ID 10087

Find all posts which were reacted to with a heart. For such posts output all columns from facebook_posts table.

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
    DISTINCT 
    p.post_id,
    p.poster,
    p.post_text,
    p.post_keywords,
    p.post_date  
FROM facebook_posts p
LEFT JOIN facebook_reactions r
ON p.post_id = r.post_id
WHERE reaction = 'heart'