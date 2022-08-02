/*

https://platform.stratascratch.com/coding/9768-find-all-posts-with-the-keyword-nba

Posts with 'nba' substring in keyword

Amazon ID 9768

Find all posts with a keyword that contains 'nba' substring.

Table: facebook_posts

facebook_posts

post_id:int
poster:int
post_text:varchar
post_keywords:varchar
post_date:datetime

*/

SELECT 
    * 
FROM facebook_posts
WHERE post_keywords ILIKE '%nba%'