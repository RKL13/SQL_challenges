/*

https://platform.stratascratch.com/coding/2105-videos-removed-on-latest-date

Videos Removed on Latest Date

Amazon ID 2105

For each unique user in the dataset, find the latest date when their flags got reviewed. 
Then, find total number of distinct videos that were removed on that date (by any user).

Output the the first and last name of the user (in two columns), the date and the number of removed videos. 
Only include these users who had at least one of their flags reviewed. If no videos got removed on a certain date, output 0.

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

WITH max_review_date_table
AS (SELECT user_firstname, 
           user_lastname,
           MAX(reviewed_date) max_review_date 
    FROM user_flags uf
    LEFT JOIN flag_review fr
    ON uf.flag_id = fr.flag_id
    GROUP BY user_firstname, user_lastname
    HAVING MAX(reviewed_date) IS NOT NULL)
    
SELECT 
    mr.user_firstname,	
    mr.user_lastname,
    mr.max_review_date,
    COUNT(DISTINCT CASE WHEN fr.reviewed_outcome = 'REMOVED' THEN uf.video_id ELSE NULL END)
FROM max_review_date_table mr
LEFT JOIN flag_review fr
ON mr.max_review_date = fr.reviewed_date
LEFT JOIN user_flags uf
ON fr.flag_id = uf.flag_id
GROUP BY mr.user_firstname,	mr.user_lastname, mr.max_review_date