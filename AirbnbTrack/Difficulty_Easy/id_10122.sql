/*

https://platform.stratascratch.com/coding/10122-find-the-total-number-of-searches-for-houses-westlake-neighborhood-with-a-tv

Find the total number of searches for houses Westlake neighborhood with a TV

Airbnb ID 10122

Find the total number of searches for houses in Westlake neighborhood with a TV among the amenities.

Table: airbnb_search_details

airbnb_search_details

id:intprice:float
property_type:varchar
room_type:varchar
amenities:varchar
accommodates:int
bathrooms:int
bed_type:varchar
cancellation_policy:varchar
cleaning_fee:boolcity:varchar
host_identity_verified:varchar
host_response_rate:varchar
host_since:datetime
neighbourhood:varchar
number_of_reviews:int
review_scores_rating:float
zipcode:in
tbedrooms:int
beds:int

*/

SELECT COUNT(id) FROM airbnb_search_details
WHERE neighbourhood = 'Westlake' AND amenities ~ 'TV';