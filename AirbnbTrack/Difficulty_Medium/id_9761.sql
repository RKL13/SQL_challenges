/*

https://platform.stratascratch.com/coding/9761-find-the-number-of-nights-that-are-searching-for-when-trying-to-book-a-host

Find the number of nights that are searching for when trying to book a host

Airbnb ID 9761

Find the number of nights that are searched by most people when trying to book a host.
Output the number of nights alongside the total searches.
Order records based on the total searches in descending order.

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
    n_nights,
    SUM(n_searches) total_n_searches
FROM airbnb_searches
GROUP BY n_nights
ORDER BY total_n_searches