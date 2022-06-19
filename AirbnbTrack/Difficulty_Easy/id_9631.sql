/*

https://platform.stratascratch.com/coding/9631-find-neighborhoods-that-have-properties-with-a-parking-space-and-no-cleaning-fees

Find neighborhoods that have properties with a parking space and no cleaning fees

Airbnb ID 9631

Find all neighborhoods that have properties with a parking space and don't charge for cleaning fees. 

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
host_identity_verified:varcha
host_response_rate:varchar
host_since:datetime
neighbourhood:varchar
number_of_reviews:int
review_scores_rating:float
zipcode:intbedrooms:int
beds:int

*/

/* This was my original response that worked */

SELECT neighbourhood FROM airbnb_search_details
WHERE cleaning_fee = False 
    AND amenities ~ 'Free parking on premises'
GROUP BY neighbourhood;

/* But this is a more elegant alternative */

SELECT DISTINCT neighbourhood FROM airbnb_search_details
WHERE 
    cleaning_fee is False AND
    amenities ILIKE '%Free parking on premises%'