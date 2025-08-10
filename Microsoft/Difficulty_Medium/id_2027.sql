with user_id_table as (select user_id from (select user_id,
sum(case when client_id = 'mobile' then 1 else 0 end) desktop 
from fact_events
group by user_id)
where desktop = 0)
select customer_id from (select customer_id, rank() over (order by count(distinct user_id)) rnk from fact_events where user_id in (select * from user_id_table) group by customer_id) where rnk = 1