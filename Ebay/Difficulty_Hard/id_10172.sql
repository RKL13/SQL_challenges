with t1 as (select description ,
Extract(month from invoicedate) as month,
unitprice * quantity as total_paid 
from online_retail),
t2 as (select description, month, sum(total_paid) total_paid from t1 group by description, month),
t3 as (select *,
rank() over (partition by month order by total_paid desc)
from t2)
select description, month, total_paid
from t3
where rank = 1