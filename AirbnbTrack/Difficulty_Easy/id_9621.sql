/*

https://platform.stratascratch.com/coding/9621-find-all-searches-for-san-francisco-with-a-flexible-cancellation-policy-and-a-review-score-rating

Find all searches for San Francisco with a flexible cancellation policy and a review score rating

Airbnb ID 9621

Find all searches for San Francisco with a flexible cancellation policy and a review score rating. 
Sort the results by the review score in the descending order.

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
    city = 'SF' AND
    cancellation_policy = 'flexible' AND 
    review_scores_rating IS NOT NULL
ORDER BY 
    review_scores_rating DESC;