/*

https://platform.stratascratch.com/coding/9782-customer-revenue-in-march

Customer Revenue In March

Amazon ID 9782

Calculate the total revenue from each customer in March 2019. Include only customers who were active in March 2019.

Output the revenue along with the customer id and sort the results based on the revenue in descending order.

Table: orders

orders

id:int
cust_id:int
order_date:datetime
order_details:varchar
total_order_cost:int

*/

SELECT 
    cust_id,
    SUM(total_order_cost) total_revenues
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2019
AND EXTRACT(MONTH FROM order_date) = 3
GROUP BY cust_id
ORDER BY total_revenues DESC