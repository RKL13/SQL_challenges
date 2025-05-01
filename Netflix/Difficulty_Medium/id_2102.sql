 /* Flags per Video

For each video, find how many unique users flagged it. A unique user can be identified using the combination of their 
first name and last name. Do not consider rows in which there is no flag ID.

user_flags
flag_id:text
user_firstname:text
user_lastname:text
video_id:text */

with table1 as (select 
    COALESCE(user_firstname, 'NA') || '_' || COALESCE(user_lastname, 'NA') as user_full_name, 
    video_id,
    flag_id
from user_flags
where flag_id is not null)
select 
    video_id,
    count(distinct user_full_name)
from table1
group by video_id