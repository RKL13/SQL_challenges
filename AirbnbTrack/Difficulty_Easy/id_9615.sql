/*

https://platform.stratascratch.com/coding/9615-find-out-search-details-for-apartments-designed-for-a-sole-person-stay

Find out search details for apartments designed for a sole-person stay

Airbnb ID 9615

Find the search details made by people who searched for apartments designed for a single-person stay.

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

SELECT * 
FROM airbnb_search_details
WHERE 
    accommodates = 1 AND
    property_type = 'Apartment';