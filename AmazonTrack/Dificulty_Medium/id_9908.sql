/*

https://platform.stratascratch.com/coding/9908-customer-orders-and-details

Customer Orders and Details

Amazon ID 9908

Find the number of orders, the number of customers, and the total cost of orders for each city. 
Only include cities that have made at least 5 orders and count all customers in each city even if they did not place an order.

Output each calculation along with the corresponding city name.

Tables: customers, orders

customers

id:int
first_name:varchar
last_name:varchar
city:varchar
address:varchar
phone_number:varchar

orders

id:int
cust_id:int
order_date:datetime
order_details:varchar
total_order_cost:int

*/

SELECT 
    city,
    COUNT(orders.id) AS number_of_orders,
    COUNT(DISTINCT customers.id) AS number_of_customers,
    SUM(orders.total_order_cost) AS sum_total_order_cost 
FROM customers
LEFT JOIN orders
ON customers.id = orders.cust_id
GROUP BY city
HAVING COUNT(orders.id) >= 5