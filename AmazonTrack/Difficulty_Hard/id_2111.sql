/*

https://platform.stratascratch.com/coding/2111-sales-growth-per-territory

Sales Growth per Territory

Amazon ID 2111

Write a query to return Territory and corresponding Sales Growth. Compare growth between periods Q4-2021 vs Q3-2021.

If Territory (say T123) has Sales worth 100inQ3−2021andSalesworth100 in Q3-2021 and Sales worth 100inQ3−2021andSalesworth110 in Q4-2021, 
then the Sales Growth will be 10% [ i.e. = ((110 - 100)/100) * 100 ]

Output the ID of the Territory and the Sales Growth. Only output these territories that had any sales in both quarters.

Tables: fct_customer_sales, map_customer_territory

fct_customer_sales

cust_id:varchar
prod_sku_id:varchar
order_date:datetime
order_value:int
order_id:varchar

map_customer_territory

cust_id:varchar
territory_id:varchar

*/

WITH preprocessed_table 
AS (SELECT territory_id,
          (CASE WHEN order_date BETWEEN '2021-07-01' AND '2021-09-30'THEN 'Q3'
                WHEN order_date BETWEEN '2021-10-01' AND '2021-12-31'THEN 'Q4'
            ELSE 'Not in Q3-Q4' 
           END) AS period,
          order_value
    FROM fct_customer_sales f
    LEFT JOIN map_customer_territory m
    ON f.cust_id = m.cust_id
    WHERE order_date BETWEEN '2021-07-01' AND '2021-12-31'),
q3_table 
AS (SELECT territory_id,
           period period_3,
           SUM(order_value) AS total_order_value_q3
    FROM preprocessed_table
    GROUP BY territory_id, period
    HAVING period = 'Q3'),
q4_table 
AS (SELECT territory_id,
           period period_4,
           SUM(order_value) AS total_order_value_q4
    FROM preprocessed_table
    GROUP BY territory_id, period
    HAVING period = 'Q4')

SELECT 
    q3.territory_id,
    ((total_order_value_q4::FLOAT-total_order_value_q3::FLOAT)/total_order_value_q3::FLOAT)*100 AS slaes_growth
FROM q3_table q3
LEFT JOIN q4_table q4
ON q3.territory_id = q4.territory_id