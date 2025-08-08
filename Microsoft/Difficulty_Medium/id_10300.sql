with t1 as (select * from ms_user_dimension
left join ms_acc_dimension on ms_user_dimension.acc_id = ms_acc_dimension.acc_id),
t2 as (select date, paying_customer, sum(downloads) downloads
from ms_download_facts
left join t1 on ms_download_facts.user_id = t1.user_id
group by date, paying_customer order by date, paying_customer),
t3 as (select date, downloads paid, 
lag(downloads) over (partition by date) unpaid 
from t2 )
select *  from t3
where unpaid is not null and unpaid > paid