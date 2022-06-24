/*

https://platform.stratascratch.com/coding/9637-growth-of-airbnb

Growth of Airbnb

Airbnb ID 9637

Estimate the growth of Airbnb each year using the number of hosts registered as the growth metric. 
The rate of growth is calculated by taking ((number of hosts registered in the current year - number of hosts registered 
in the previous year) / the number of hosts registered in the previous year) * 100.
Output the year, number of hosts in the current year, number of hosts in the previous year, 
and the rate of growth. Round the rate of growth to the nearest percent and order the result in the ascending order based on the year.
Assume that the dataset consists only of unique hosts, meaning there are no duplicate hosts listed.

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

WITH couple_year_count_host 
AS (SELECT DATE_PART('year', host_since) AS year,
           COUNT(id) AS year_count_host
    FROM airbnb_search_details
    GROUP BY year),
couple_year_count_host_prev_year 
AS (SELECT DATE_PART('year', host_since) + 1 AS year,
           COUNT(id) AS year_count_host_prev
    FROM airbnb_search_details
    GROUP BY year)
    
SELECT 
    couple_year_count_host.year,
    year_count_host,
    year_count_host_prev,
    ROUND(((year_count_host :: float - year_count_host_prev :: float) / year_count_host_prev :: float)*100)
FROM couple_year_count_host
LEFT JOIN couple_year_count_host_prev_year
ON couple_year_count_host.year = couple_year_count_host_prev_year.year
ORDER BY couple_year_count_host.year ASC
