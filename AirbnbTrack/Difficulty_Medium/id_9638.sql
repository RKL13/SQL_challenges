/*

https://platform.stratascratch.com/coding/9638-total-searches-for-rooms

Total Searches For Rooms

Airbnb ID 9638

Find the total number of searches for each room type (apartments, private, shared) by city.

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
    SUM(CASE WHEN room_type = 'Private room' THEN 1 ELSE 0 END) AS n_private_room,
    SUM(CASE WHEN room_type = 'Shared room' THEN 1 ELSE 0 END) AS n_shared_room,
    SUM(CASE WHEN room_type = 'Entire home/apt' THEN 1 ELSE 0 END) AS n_entire_home
FROM airbnb_search_details
GROUP BY city