/*

https://platform.stratascratch.com/coding/9634-host-response-rates-with-cleaning-fees

Host Response Rates With Cleaning Fees

Airbnb ID 9634

Find the average host response rate with a cleaning fee for each zipcode. Present the results as a percentage along with the zip code value. 
Convert the column 'host_response_rate' from TEXT to NUMERIC using type casts and string processing (take missing values as NULL). 
Order the result in ascending order based on the average host response rater after cleaning.

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

WITH couple_avg_response_rate_zipcode 
AS (SELECT zipcode,
           AVG(RTRIM(host_response_rate, '%') :: float) as avg_host_response_rate
    FROM airbnb_search_details
    WHERE cleaning_fee = 'TRUE'
    GROUP BY zipcode)
    
SELECT 
    *
FROM couple_avg_response_rate_zipcode
WHERE avg_host_response_rate IS NOT NULL
ORDER BY avg_host_response_rate ASC