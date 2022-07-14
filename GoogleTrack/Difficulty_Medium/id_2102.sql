/*

https://platform.stratascratch.com/coding/2102-flags-per-video

Flags per Video

Amazon ID 2102

For each video, find how many unique users flagged it. 
A unique user can be identified using the combination of their first name and last name. 
Do not consider rows in which there is no flag ID.

Table: user_flags

user_flags

user_firstname:varchar
user_lastname:varchar
video_id:varchar
flag_id:varchar

*/

WITH preprocessed_table 
AS (SELECT *,
           CONCAT(user_firstname, ' ' ,user_lastname) AS user_id
    FROM user_flags
    WHERE flag_id IS NOT NULL)
    
SELECT 
    video_id,
     COUNT(DISTINCT user_id)
FROM preprocessed_table
GROUP BY video_id