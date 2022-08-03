/*

https://platform.stratascratch.com/coding/2124-top-two-media-types

Top Two Media Types

Amazon ID 2124

What are the top two (ranked in decreasing order) single-channel media types that correspond 
to the most money the grocery chain had spent on its promotional campaigns?

Table: facebook_sales_promotions

facebook_sales_promotions

promotion_id:int
start_date:datetime
end_date:datetime
media_type:varchar
cost:int

*/

WITH prepared_table 
AS (SELECT media_type,
           SUM(cost) channel_cost,
           RANK() OVER(ORDER BY SUM(cost) DESC) channel_rank
    FROM facebook_sales_promotions
    GROUP BY media_type)
    
SELECT 
    media_type,
    channel_cost
FROM prepared_table
WHERE channel_rank <= 2
ORDER BY channel_cost DESC