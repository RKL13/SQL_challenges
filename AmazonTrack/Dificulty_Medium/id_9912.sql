/*

https://platform.stratascratch.com/coding/9912-lowest-priced-orders

Lowest Priced Orders

Amazon ID 9912

Find the lowest order cost of each customer.
Output the customer id along with the first name and the lowest order price.

For simplicity, you can assume that every first name in the dataset is unique.

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
    first_name,
    MIN(total_order_cost)
FROM customers
LEFT JOIN orders
ON customers.id = orders.cust_id
GROUP BY customers.id, first_name
HAVING MIN(total_order_cost) IS NOT NULL