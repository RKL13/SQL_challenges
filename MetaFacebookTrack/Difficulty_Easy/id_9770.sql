/*

https://platform.stratascratch.com/coding/9770-find-the-number-of-views-each-post-has

Find the number of views each post has

Amazon ID 9770

Find the number of views each post has.

Output the post id along with the number of views.

Order records by post id in ascending order.

Table: facebook_post_views

facebook_post_views

post_id:int
viewer_id:int

*/

SELECT 
    post_id,
    COUNT(post_id)
FROM facebook_post_views
GROUP BY post_id
ORDER BY post_id ASC