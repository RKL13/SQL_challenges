/*

https://platform.stratascratch.com/coding/10124-bookings-vs-non-bookings

Bookings vs Non-Bookings

Airbnb ID 10124

Display the average number of times a user performed a search which led to a successful booking and the average number of 
times a user performed a search but did not lead to a booking. 
The output should have a column named action with values 'does not book' and 'books' as well as a 2nd column 
named average_searches with the average number of searches per action. Consider that the booking did not happen 
if the booking date is null. Be aware that search is connected to the booking only if their check-in dates match.

Tables: airbnb_contacts, airbnb_searches

airbnb_contacts

id_guest:varchar
id_host:varchar
id_listing:varchar
ts_contact_at:datetime
ts_reply_at:datetime
ts_accepted_at:datetime
ts_booking_at:datetime
ds_checkin:datetime
ds_checkout:datetime
n_guests:int
n_messages:int

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
    (CASE 
        WHEN ts_booking_at IS NOT NULL THEN 'books'
        ELSE 'does not book'
     END) AS action,
     AVG(n_searches)
FROM airbnb_searches searches
LEFT JOIN airbnb_contacts contacts
ON searches.ds_checkin = contacts.ds_checkin
AND searches.id_user = contacts.id_guest
GROUP BY action;