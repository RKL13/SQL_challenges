/*

https://platform.stratascratch.com/coding/9913-order-details

Order Details

Amazon ID 9913

Find order details made by Jill and Eva.
Consider the Jill and Eva as first names of customers.
Output the order date, details and cost along with the first name.
Order records based on the customer id in ascending order.

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
    first_name,
    order_date,
    order_details,
    total_order_cost
FROM customers
INNER JOIN orders
ON customers.id = orders.cust_id 
WHERE first_name in ('Jill', 'Eva')
ORDER BY customers.id ASC