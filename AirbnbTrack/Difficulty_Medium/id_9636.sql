/*

https://platform.stratascratch.com/coding/9636-cheapest-neighborhoods-with-real-beds-and-internet

Cheapest Neighborhoods With Real Beds And Internet

Airbnb ID 9636

Find neighborhoods where you can sleep on a real bed in a villa with internet while paying the lowest price possible.

Table: airbnb_search_details

airbnb_search_details

id:int
price:float
property_type:varchar
room_type:varchar
amenities:varchar
accommodates:int
bathrooms:int
bed_type:varchar
cancellation_policy:varchar
cleaning_fee:bool
city:varchar
host_identity_verified:varchar
host_response_rate:varchar
host_since:datetime
neighbourhood:varchar
number_of_reviews:int
review_scores_rating:float
zipcode:int
bedrooms:int
beds:int

*/

WITH couple_neighborhood_price 
AS (SELECT neighbourhood,
           MIN(price) as min_price,
           RANK() OVER(ORDER BY MIN(price)) rank_by_price
    FROM airbnb_search_details
    WHERE property_type = 'Villa'
    AND bed_type = 'Real Bed'
    AND amenities ILIKE '%Internet%'
    GROUP BY neighbourhood)
    
SELECT 
    neighbourhood
FROM couple_neighborhood_price
WHERE rank_by_price <= 1