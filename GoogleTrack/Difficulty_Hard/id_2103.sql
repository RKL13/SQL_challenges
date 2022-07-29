/*

https://platform.stratascratch.com/coding/2103-reviewed-flags-of-top-videos

Reviewed flags of top videos

Amazon ID 2103

For the video (or videos) that received the most user flags, how many of these flags were reviewed by YouTube? 
Output the video ID and the corresponding number of reviewed flags.

Tables: user_flags, flag_review

user_flags

user_firstname:varchar
user_lastname:varchar
video_id:varchar
flag_id:varchar

flag_review

flag_id:varchar
reviewed_by_yt:bool
reviewed_date:datetime
reviewed_outcome:varchar

*/

WITH preprocessed_table
AS (SELECT video_id,
           user_flags.flag_id,
           reviewed_by_yt
    FROM user_flags
    LEFT JOIN flag_review
    ON user_flags.flag_id = flag_review.flag_id),
rank_table
AS (SELECT video_id,
           COUNT(DISTINCT flag_id) n_flag,
           SUM(CASE WHEN reviewed_by_yt = 'TRUE' THEN 1 ELSE 0 END) n_yt,
           RANK() OVER(ORDER BY COUNT(DISTINCT flag_id) DESC) flag_rank
    FROM preprocessed_table
    GROUP BY video_id)

SELECT 
    video_id,2105
    n_flag,	
    n_yt
FROM rank_table
WHERE flag_rank = 1