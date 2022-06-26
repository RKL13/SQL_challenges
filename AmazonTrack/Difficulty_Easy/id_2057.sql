/*

https://platform.stratascratch.com/coding/2057-weight-for-first-shipment

Weight For First Shipment

Amazon ID 2057

Write a query to find the weight for each shipment's earliest shipment date. Output the shipment id along with the weight.

Table: amazon_shipment

amazon_shipment

shipment_id:int
sub_id:int
weight:int
shipment_date:datetime
add:datetime

*/

WITH couple_shipment_earliest 
AS (SELECT shipment_id,
           MIN(shipment_date) AS earliest_shpiment 
    FROM amazon_shipment
    GROUP BY shipment_id)
    
SELECT 
    * 
FROM amazon_shipment
INNER JOIN couple_shipment_earliest
ON couple_shipment_earliest.shipment_id = amazon_shipment.shipment_id
AND couple_shipment_earliest.earliest_shpiment = amazon_shipment.shipment_date