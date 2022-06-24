/*

https://platform.stratascratch.com/coding/9633-city-with-most-amenities

City With Most Amenities

Airbnb ID 9633

You're given a dataset of searches for properties on Airbnb. 
For simplicity, let's say that each search result (i.e., each row) represents a unique host. 
Find the city with the most amenities across all their host's properties. 
Output the name of the city.

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

WITH table_unnested_amenities
AS (SELECT DISTINCT
        TRIM(UNNEST(regexp_split_to_array(TRIM(amenities, '{}'), ',')), '"') AS cleaned_amenities,
        *
    FROM airbnb_search_details),
table_ranked 
AS (SELECT city,
           COUNT(cleaned_amenities) AS total_amenities,
           RANK() OVER(ORDER BY COUNT(cleaned_amenities) DESC) AS city_rank
    FROM table_unnested_amenities
    GROUP BY city)

SELECT
    city 
FROM table_ranked
WHERE city_rank <= 1