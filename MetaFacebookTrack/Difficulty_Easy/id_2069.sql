/*

https://platform.stratascratch.com/coding/2069-sales-with-valid-promotion

Sales with Valid Promotion

Amazon ID 2069

To improve sales, the marketing department runs various types of promotions. 
The marketing manager would like to analyze the effectiveness of these promotional campaigns. 
In particular, what percentage of sales had a valid promotion applied? 
Only the promotions found in the facebook_promotions table are valid.

Tables: facebook_promotions, facebook_sales

facebook_promotions

promotion_id:int

facebook_sales

product_id:int
promotion_id:int
cost_in_dollars:int
customer_id:int

*/

SELECT 
    COUNT(CASE WHEN p.promotion_id IS NOT NULL THEN p.promotion_id ELSE NULL END)::FLOAT/COUNT(*)::FLOAT*100 percentage_valid_campaign
FROM facebook_sales s
LEFT JOIN facebook_promotions p
ON s.promotion_id = p.promotion_id