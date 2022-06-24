/*

https://platform.stratascratch.com/coding/9624-accommodates-to-bed-ratio

Accommodates-To-Bed Ratio

Airbnb ID 9624

Find the average accommodates-to-beds ratio for shared rooms in each city. Sort your results by listing cities with the highest ratios first.

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

SELECT 
    city,
    AVG(cast(accommodates AS float)/cast(beds AS float)) AS accomodates_to_bed_ratio
FROM airbnb_search_details
WHERE room_type = 'Shared room' 
GROUP BY city 
ORDER BY accomodates_to_bed_ratio DESC 