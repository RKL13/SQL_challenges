/*

https://platform.stratascratch.com/coding/2098-world-tours

World Tours

Amazon ID 2098

A group of travelers embark on world tours starting with their home cities. 
Each traveler has an undecided itinerary that evolves over the course of the tour. 
Some travelers decide to abruptly end their journey mid-travel and live in their last destination.
Given the dataset of dates on which they travelled between different pairs of cities, can you find out how many 
travellers ended back in their home city? For simplicity, you can assume that each traveler made at most one trip between 
two cities in a day.

Table: travel_history

travel_history

traveler:varchar
start_city:varchar
end_city:varchar
date:datetime

*/

WITH traveler_journey_dates
AS (SELECT DISTINCT 
           traveler,
           MAX(date) OVER(PARTITION BY traveler) traveler_max_date,
           MIN(date) OVER(PARTITION BY traveler) traveler_min_date
    FROM travel_history),
journey_start_end_cities 
AS (SELECT tjd.traveler,
           thm.start_city journey_start_city,
           thx.end_city journey_end_city
    FROM traveler_journey_dates tjd
    LEFT JOIN travel_history thm
    ON tjd.traveler = thm.traveler
    AND tjd.traveler_min_date = thm.date
    LEFT JOIN travel_history thx
    ON tjd.traveler = thx.traveler
    AND tjd.traveler_max_date = thx.date)

SELECT 
    COUNT(*) 
FROM journey_start_end_cities
WHERE journey_start_city = journey_end_city