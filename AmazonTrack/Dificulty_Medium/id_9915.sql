/*

https://platform.stratascratch.com/coding/9915-highest-cost-orders

Highest Cost Orders

Amazon ID 9915

Find the customer with the highest daily total order cost between 2019-02-01 to 2019-05-01. 
If customer had more than one order on a certain day, sum the order costs on daily basis. 
Output customer's first name, total cost of their items, and the date.

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

WITH ranked_table 
AS (SELECT
        first_name,
        order_date,
        SUM(total_order_cost) AS total_order_cost_day,
        RANK() OVER(ORDER BY SUM(total_order_cost) DESC) AS ranking
    FROM customers
    LEFT JOIN orders
    ON customers.id = orders.cust_id
    WHERE order_date BETWEEN '2019-02-01' AND '2019-05-01'
    GROUP BY first_name, order_date)

SELECT 
    first_name,
    total_order_cost_day,
    order_date
FROM ranked_table
WHERE ranking = 1