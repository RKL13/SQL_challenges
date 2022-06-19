/*

https://platform.stratascratch.com/coding/9616-apartments-in-new-york-city-and-harlem

Apartments in New York City and Harlem

Airbnb ID 9616

Find the search details of 50 apartment searches the Harlem neighborhood of New York City.

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
    city = 'NYC' AND 
    neighbourhood = 'Harlem' AND 
    property_type = 'Apartment'
LIMIT 50;