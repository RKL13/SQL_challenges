/*

https://platform.stratascratch.com/coding/9629-find-the-count-of-verified-and-non-verified-airbnb-hosts

Find the count of verified and non-verified Airbnb hosts

Airbnb ID 9629

Find how many hosts are verified by the Airbnb staff and how many aren't.

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
    host_identity_verified,
    COUNT(host_identity_verified)
FROM airbnb_search_details
GROUP BY host_identity_verified