/*

https://platform.stratascratch.com/coding/9620-find-searches-with-no-data-for-the-host_response_rate-column

Find searches with no data for the host_response_rate column

Airbnb ID 9620

Find all search details where data is missing from the host_response_rate column.

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

select * from airbnb_search_details
WHERE host_response_rate IS NULL