/*

https://platform.stratascratch.com/coding/9617-find-all-searches-for-accommodations-with-an-equal-number-of-bedrooms-bathrooms

Find all searches for accommodations with an equal number of bedrooms bathrooms

Airbnb ID 9617

Find all searches for accommodations with an equal number of bedrooms bathrooms

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

SELECT * FROM airbnb_search_details
WHERE bathrooms = bedrooms;