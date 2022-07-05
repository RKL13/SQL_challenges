/*

https://platform.stratascratch.com/coding/2112-product-market-share

Product Market Share

Amazon ID 2112

Write a query to find the Market Share at the Product Brand level for each Territory, for Time Period Q4-2021. 
Market Share is the number of Products of a certain Product Brand brand sold in a territory, 
divided by the total number of Products sold in this Territory.

Output the ID of the Territory, name of the Product Brand and the corresponding Market Share in percentages. 
Only include these Product Brands that had at least one sale in a given territory.

Tables: fct_customer_sales, map_customer_territory, dim_product

fct_customer_sales

cust_id:varchar
prod_sku_id:varchar
order_date:datetime
order_value:int
order_id:varchar

map_customer_territory

cust_id:varchar
territory_id:varchar

dim_product

prod_sku_id:varchar
prod_sku_name:varchar
prod_brand:varchar
market_name:varchar

*/

WITH q4_territory_brand 
AS (SELECT territory_id,
           prod_brand,
           COUNT(*) OVER(PARTITION BY territory_id) AS total_territory,
           COUNT(*) OVER(PARTITION BY territory_id, prod_brand) brand_territory_count
    FROM fct_customer_sales f
    LEFT JOIN map_customer_territory m
    ON f.cust_id = m.cust_id
    LEFT JOIN dim_product d
    ON f.prod_sku_id = d.prod_sku_id
    WHERE order_date BETWEEN '2021-10-01' AND '2021-12-31')

SELECT DISTINCT
    territory_id,	
    prod_brand,
    (brand_territory_count :: FLOAT/total_territory :: FLOAT)*100 :: FLOAT AS market_share
FROM q4_territory_brand
ORDER BY territory_id