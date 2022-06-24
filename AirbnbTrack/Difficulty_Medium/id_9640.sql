/*

https://platform.stratascratch.com/coding/9640-find-the-average-number-of-searches-from-each-user

Find the average number of searches from each user

Airbnb ID 9640

Find the average number of searches made by each user and present the result with their corresponding user id.

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

SELECT
    id_user,
    AVG(n_searches)
FROM airbnb_searches
GROUP BY id_user