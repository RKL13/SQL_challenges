with t1 as (select product_id, sum(quantity) quantity
from marketing_campaign
group by product_id)
select *,
case when quantity >= 30 then 'Outstanding'
when quantity >= 20 and quantity <= 29 then 'Satisfactory'
when quantity >= 10 and quantity <= 19 then 'Unsatisfactory'
when quantity >= 1 and quantity <= 9 then 'Poor'
end
from t1
order by quantity desc