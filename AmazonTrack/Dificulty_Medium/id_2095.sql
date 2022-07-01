/*

https://platform.stratascratch.com/coding/2095-three-purchases

Three Purchases

Amazon ID 2095

List the IDs of customers who made at least 3 orders in both 2020 and 2021.

Table: amazon_orders

amazon_orders

id:int
user_id:varchar
order_date:datetime
order_total:float

*/

WITH table_filtered 
AS (SELECT EXTRACT(year FROM order_date) AS year, 
            *
    FROM amazon_orders
    WHERE EXTRACT(year FROM order_date) IN (2020, 2021)),
table_n_order_per_year 
AS  (SELECT user_id, 
            year,
            COUNT(id) AS n_order
    FROM table_filtered
    GROUP BY user_id, year
    HAVING COUNT(id) >= 3)
    
SELECT 
    user_id
FROM table_n_order_per_year
GROUP BY user_id
HAVING SUM(n_order) >= 6