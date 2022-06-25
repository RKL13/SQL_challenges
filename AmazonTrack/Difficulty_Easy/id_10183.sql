/*

https://platform.stratascratch.com/coding/10183-total-cost-of-orders

Total Cost Of Orders

Amazon ID 10183

Find the total cost of each customer's orders. 
Output customer's id, first name, and the total order cost. Order records by customer's first name alphabetically.

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
    customers.id,
    customers.first_name,
    SUM(orders.total_order_cost) AS total_cost
FROM customers
INNER JOIN orders
ON customers.id = orders.cust_id
GROUP BY customers.id, customers.first_name
ORDER BY customers.first_name ASC