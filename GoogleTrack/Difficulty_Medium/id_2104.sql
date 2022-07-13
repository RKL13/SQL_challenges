/*

https://platform.stratascratch.com/coding/2104-user-with-most-approved-flags

User with Most Approved Flags

Amazon ID 2104

Which user flagged the most distinct videos that ended up approved by YouTube? 
Output, in one column, their full name or names in case of a tie. In the user's full name, include a
space between the first and the last name.

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
AS (SELECT user_firstname, 
           user_lastname, 
           COUNT(DISTINCT video_id)
    FROM user_flags f
    LEFT JOIN flag_review r
    ON f.flag_id = r.flag_id
    WHERE reviewed_outcome = 'APPROVED'
    GROUP BY user_firstname, 
             user_lastname),
ranked_table AS (SELECT *,
                        DENSE_RANK() OVER(ORDER BY count DESC) AS rank_flags
                 FROM preprocessed_table)
                 
SELECT 
    CONCAT(user_firstname, ' ', user_lastname) 
FROM ranked_table
WHERE rank_flags = 1