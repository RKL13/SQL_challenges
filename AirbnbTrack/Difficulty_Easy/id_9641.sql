/*

https://platform.stratascratch.com/coding/9641-find-the-number-of-users-that-have-done-a-search

Find the number of users that have done a search

Airbnb ID 9641

How many unique users have performed a search?

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

SELECT COUNT(DISTINCT id_user) FROM airbnb_searches;