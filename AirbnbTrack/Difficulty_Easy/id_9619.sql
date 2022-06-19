/*

https://platform.stratascratch.com/coding/9619-find-the-search-details-for-villas-and-houses-with-wireless-internet-access

Find the search details for villas and houses with wireless internet access

Airbnb ID 9619

Find the search details for villas and houses with wireless internet access.

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

/* Originaly submitted (works) */

SELECT * FROM airbnb_search_details
WHERE 
    amenities ILIKE '%Wireless Internet%' AND
    (property_type = 'House' OR property_type = 'Villa');

/* More elegant */

SELECT
    *
FROM airbnb_search_details
WHERE
    amenities ILIKE '%Wireless Internet%' AND
    property_type IN ('House', 'Villa')