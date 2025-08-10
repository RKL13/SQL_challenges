with t1 as (select user_id, 
date_part('month', time_id) as month
from fact_events),
t2 as (select user_id, month
from t1 
group by user_id, month
order by user_id, month),
t3 as (select 
*,
case when (rank() over (partition by user_id order by month)) = 1 then 0 else 1 end as start
from t2)
select month,
(count(*) - sum(start))/count(*)::numeric, sum(start)/count(*)::numeric as start_sum
from t3
group by month 
order by month