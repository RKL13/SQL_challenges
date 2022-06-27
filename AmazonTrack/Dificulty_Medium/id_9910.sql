/*

https://platform.stratascratch.com/coding/9910-favorite-customer

Favorite Customer

Amazon ID 9910

Find "favorite" customers based on the order count and the total cost of orders.
A customer is considered as a favorite if he or she has placed more than 3 orders and with the total cost of orders more than $100.

Output the customer's first name, city, number of orders, and total cost of orders.

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
    city,
    COUNT(orders.id) AS count_orders,
    SUM(total_order_cost) AS sum_total_order_cost 
FROM customers
LEFT JOIN orders
ON customers.id = orders.cust_id
GROUP BY customers.id, first_name, city
HAVING SUM(total_order_cost) >= 100
AND COUNT(DISTINCT orders.id) > 3 