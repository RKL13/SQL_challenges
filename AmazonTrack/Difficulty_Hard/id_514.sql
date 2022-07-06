/*

https://platform.stratascratch.com/coding/514-marketing-campaign-success-advanced

Marketing Campaign Success [Advanced]

Amazon ID 514

You have a table of in-app purchases by user. 
Users that make their first in-app purchase are placed in a marketing campaign where they see call-to-actions for more in-app purchases. 
Find the number of users that made additional in-app purchases due to the success of the marketing campaign.

The marketing campaign doesn't start until one day after the initial in-app purchase so users that only made one 
or multiple purchases on the first day do not count, nor do we count users that over time purchase only the products 
they purchased on the first day.

Table: marketing_campaign

marketing_campaign

user_id:int
created_at:datetime
product_id:int
quantity:int
price:int

*/

WITH table_user_first_products 
AS (SELECT user_id,
           product_id first_product
    FROM (SELECT *,
                RANK() OVER(PARTITION BY user_id ORDER BY created_at) AS rank_orders
          FROM marketing_campaign) AS ranked_orders_table
    WHERE rank_orders = 1)
    
SELECT 
    COUNT(DISTINCT mc.user_id)
FROM marketing_campaign mc
LEFT JOIN table_user_first_products fp
ON mc.user_id = fp.user_id
AND mc.product_id = fp.first_product
WHERE fp.user_id IS NULL