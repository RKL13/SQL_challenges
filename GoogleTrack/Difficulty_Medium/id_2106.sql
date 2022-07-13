/*

https://platform.stratascratch.com/coding/2106-rows-with-missing-values

Rows With Missing Values

Amazon ID 2106

The data engineering team at YouTube want to clean the dataset user_flags. 
In particular, they want to examine rows that have missing values in more than one column. 
List these rows.

Table: user_flags

user_flags

user_firstname:varchar
user_lastname:varchar
video_id:varchar
flag_id:varchar

*/

WITH binarized_table 
AS  (SELECT ROW_NUMBER() OVER(),
            *,
            CASE WHEN user_firstname IS NOT NULL THEN 1 ELSE 0 END AS bin_user_firstname,
            CASE WHEN user_lastname IS NOT NULL THEN 1 ELSE 0 END AS bin_user_lastname,
            CASE WHEN video_id IS NOT NULL THEN 1 ELSE 0 END AS bin_video_id,
            CASE WHEN flag_id IS NOT NULL THEN 1 ELSE 0 END AS bin_flag_id
    FROM user_flags)
    
SELECT
    *,
    bin_user_firstname + bin_user_lastname + bin_video_id + bin_flag_id AS n_not_null
FROM binarized_table
WHERE bin_user_firstname + bin_user_lastname + bin_video_id + bin_flag_id < 3