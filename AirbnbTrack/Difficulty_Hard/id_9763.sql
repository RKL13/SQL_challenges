/*

https://platform.stratascratch.com/coding/9763-most-popular-room-types

Most Popular Room Types

Airbnb ID 9763

Find the room types that are searched by most people. 
Output the room type alongside the number of searches for it. 
If the filter for room types has more than one room type, consider each unique room type as a separate row.
 Sort the result based on the number of searches in descending order.

Table: airbnb_searches

airbnb_searches

ds:datetime
id_user:varchar
ds_checkin:datetime
ds_checkout:datetime
n_searches:int
n_nights:float
n_guests_min:int
n_guests_max:int
origin_country:varchar
filter_price_min:float
filter_price_max:float
filter_room_types:varchar
filter_neighborhoods:datetime

*/

WITH unnested_table 
AS (SELECT DISTINCT
        *,
        UNNEST(regexp_split_to_array(LTRIM(filter_room_types, ','), ',')) AS unnested_filter_room
    FROM airbnb_searches)
    
SELECT 
    unnested_filter_room,
    SUM(n_searches) AS total_searches
FROM unnested_table
GROUP BY unnested_filter_room