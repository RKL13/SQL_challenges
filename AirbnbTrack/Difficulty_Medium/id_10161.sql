/*

https://platform.stratascratch.com/coding/10161-ranking-hosts-by-beds

Ranking Hosts By Beds

Airbnb ID 10161

Rank each host based on the number of beds they have listed. 
The host with the most beds should be ranked 1 and the host with the least number of beds should be ranked last. 
Hosts that have the same number of beds should have the same rank but there should be no gaps between ranking values. 
A host can also own multiple properties. 
Output the host ID, number of beds, and rank from highest rank to lowest.

Tables: airbnb_apartments

airbnb_apartments

host_id:int
apartment_id:varchar
apartment_type:varchar
n_beds:int
n_bedrooms:int
country:varchar
city:varchar

*/

SELECT 
    host_id,
    SUM(n_beds) AS total_n_beds,
    DENSE_RANK() OVER(ORDER BY sum(n_beds) DESC) as rank
FROM airbnb_apartments
GROUP BY host_id
ORDER BY total_n_beds DESC;