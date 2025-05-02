 /* Viewers Turned Streamers

Return the number of streamer sessions for each user whose very first session was as a viewer.

Include only those users whose earliest session (by session_start) was of type 'viewer'. Return the user ID and the number of streamer sessions they had, ordered by number of sessions descending, then user ID ascending.

session_end:timestamp without time zone
session_id:bigint
session_start:timestamp without time zone
session_type:textuser_id:bigint
 */

with table1 as (select 
    *,
    min(session_start) over(partition by user_id) = session_start first_session,
    sum(case when session_type = 'streamer' then 1 else 0 end) over(partition by user_id) number_of_streamer_session
from twitch_sessions)
select user_id, number_of_streamer_session from table1 where (first_session = TRUE) and (session_type = 'viewer') 
and (number_of_streamer_session != 0)
order by number_of_streamer_session desc, user_id asc