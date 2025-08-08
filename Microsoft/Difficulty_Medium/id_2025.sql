with t1 as (select user_id, count(distinct client_id) as n_client from fact_events group by user_id) 
select client_id, count(distinct user_id) from fact_events where user_id in (select user_id from t1 where n_client = 1) 
group by client_id