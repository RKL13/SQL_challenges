/*

https://platform.stratascratch.com/coding/10090-find-the-percentage-of-shipable-orders

Find the percentage of shipable orders

Amazon ID 10090

Find the percentage of shipable orders.
Consider an order is shipable if the customer's address is known.

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

WITH shippable_table 
AS (SELECT (CASE 
                WHEN c.address IS NULL THEN 0 
                ELSE 1 
            END) AS shippable
    FROM orders AS o
    LEFT JOIN customers AS c
    ON o.cust_id = c.id)
    
SELECT 
    (SUM(shippable)/COUNT(*) :: FLOAT)*100 AS pecetange_shippable
FROM shippable_table