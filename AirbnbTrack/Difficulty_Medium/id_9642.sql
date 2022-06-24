/*

https://platform.stratascratch.com/coding/9642-find-the-number-of-unique-properties

Find the unique room types

Airbnb ID 9642

Find the unique room types(filter room types column). Output each unique room types in its own row.

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

WITH cte as (SELECT UNNEST(regexp_split_to_array(filter_room_types, ',')) AS unique_room_types
             FROM airbnb_searches
             GROUP BY unique_room_types)
SELECT *
FROM cte
WHERE unique_room_types <> ''