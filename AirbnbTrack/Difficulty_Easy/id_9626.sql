/*

https://platform.stratascratch.com/coding/9626-find-all-neighborhoods-present-in-this-dataset

Find all neighborhoods present in this dataset

Airbnb ID 9626

Find all neighbourhoods present in this dataset.

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

SELECT DISTINCT neighbourhood FROM airbnb_search_details;