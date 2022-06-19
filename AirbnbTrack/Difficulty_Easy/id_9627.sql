/*

https://platform.stratascratch.com/coding/9627-3-bed-minimum

3 Bed Minimum

Airbnb ID 9627

Find the average number of beds in each neighborhood that has at least 3 beds in total.

Output results along with the neighborhood name and sort the results based on the number of average beds in descending order.

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

SELECT neighbourhood, AVG(beds) 
FROM airbnb_search_details
GROUP BY neighbourhood
HAVING SUM(beds) >= 3
ORDER BY AVG(beds) DESC;