/*

https://platform.stratascratch.com/coding/9899-percentage-of-total-spend

Percentage Of Total Spend

Amazon ID 9899

Calculate the percentage of the total spend a customer spent on each order. 
Output the customer’s first name, order details, and percentage of the order cost to their total spend across all orders. 

Assume each customer has a unique first name (i.e., there is only 1 customer named Karen in the dataset) 
and that customers place at most only 1 order a day.

Percentages should be represented as decimals

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

/* Stared for OVER(PARTITION BY) */

SELECT 
    first_name,
    order_details,
    total_order_cost / SUM(total_order_cost) OVER(PARTITION BY first_name) :: float
FROM orders
LEFT JOIN customers
ON orders.cust_id = customers.id