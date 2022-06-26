/*

https://platform.stratascratch.com/coding/2058-total-shipment-weight

Total Shipment Weight

Amazon ID 2058

Calculate the total weight for each shipment and add it as a new column. 
Your output needs to have all the existing rows and columns in addition to the  new column that shows the total weight for each shipment.
One shipment can have multiple rows.

Table: amazon_shipment

amazon_shipment

shipment_id:int
sub_id:int
weight:int
shipment_date:datetime
add:datetime

*/

WITH sum_weight_table 
AS (SELECT
        shipment_id,
        SUM(weight) AS sum_weight_by_shipment
    FROM amazon_shipment
    GROUP BY shipment_id)
    
SELECT 
    *
FROM amazon_shipment
LEFT JOIN sum_weight_table 
ON amazon_shipment.shipment_id = sum_weight_table.shipment_id