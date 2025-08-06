select city,
count(distinct customers.id) customers,
count(distinct orders.id) orders,
sum(total_order_cost) total_order_cost
from customers 
left join orders on customers.id = orders.cust_id
group by city
having count(distinct orders.id) >= 5