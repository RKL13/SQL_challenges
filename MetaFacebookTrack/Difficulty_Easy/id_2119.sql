/*

https://platform.stratascratch.com/coding/2119-most-lucrative-products

Most Lucrative Products

Amazon ID 2119

For the 5 most lucrative products, i.e. products that generated the highest revenue, output their IDs and the total revenue.

Table: facebook_sales

facebook_sales

product_id:int
promotion_id:int
cost_in_dollars:int
customer_id:int
date:datetime
units_sold:int

*/

WITH preprocessed_table 
AS (SELECT product_id,
           SUM(cost_in_dollars) total_cost,
           RANK() OVER(ORDER BY SUM(cost_in_dollars) DESC) rank_total_cost
    FROM facebook_sales
    GROUP BY product_id)
    
SELECT 
    product_id,	
    total_cost
FROM preprocessed_table
WHERE rank_total_cost <= 5
ORDER BY total_cost DESC