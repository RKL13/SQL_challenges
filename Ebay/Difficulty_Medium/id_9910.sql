select  max(first_name) first_name, max(city) city, count(*), sum(total_order_cost) total_order_cost 
from customers
left join orders on orders.cust_id = customers.id
group by customers.id
having sum(total_order_cost) >= 100 and count(*) > 3