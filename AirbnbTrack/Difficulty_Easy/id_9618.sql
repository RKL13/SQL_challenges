/*

https://platform.stratascratch.com/coding/9618-find-distinct-searches-for-los-angeles-neighborhoods

Find distinct searches for Los Angeles neighborhoods. Output neighborhoods and remove duplicates.

Airbnb ID 9618

Find searches for Los Angeles neighborhoods.

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
bedrooms:intbeds:int

*/

SELECT DISTINCT neighbourhood
FROM airbnb_search_details
WHERE city = 'LA';