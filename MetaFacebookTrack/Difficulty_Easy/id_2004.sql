/*

https://platform.stratascratch.com/coding/2004-number-of-comments-per-user-in-past-30-days

Number of Comments Per User in 30 days before 2020-02-10

Amazon ID 2004

Return the total number of comments received for each user in the 30 or less days before 2020-02-10. 
Don't output users who haven't received any comment in the defined time period.

Table: fb_comments_count

fb_comments_count

user_id:int
created_at:datetime
number_of_comments:int

*/

SELECT 
    user_id,
    SUM(number_of_comments) total_comments
FROM fb_comments_count
WHERE created_at BETWEEN '2020-02-10'::DATE - 30 * INTERVAL '1 day' AND '2020-02-10'
GROUP BY user_id