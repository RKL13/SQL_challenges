/*

https://platform.stratascratch.com/coding/10089-find-the-number-of-customers-without-an-order

Find the number of customers without an order

Amazon ID 10089

Tables: orders, customers

orders

id:int
cust_id:int
order_date:datetime
order_details:varchar
total_order_cost:int

customers

id:int
first_name:varchar
last_name:varchar
city:varchar
address:varchar
phone_number:varchar

*/

SELECT
    COUNT(DISTINCT customers.id)
FROM orders
RIGHT JOIN customers
ON orders.cust_id = customers.id
WHERE total_order_cost IS NULL