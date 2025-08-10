with t1 as (select user_id,
case when event_type in ('video call received', 'video call sent', 'voice call received', 'voice call sent') then 1 else 0 end as specific_event
from fact_events),
users_t as (select user_id from t1 group by user_id having sum(specific_event)/count(*)::numeric >= 0.5)
select client_id
from fact_events
where user_id in (select * from users_t)
group by client_id
order by count(*) desc limit 1