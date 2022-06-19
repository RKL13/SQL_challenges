/*

https://platform.stratascratch.com/coding/10123-list-first-5-entries-of-a-joined-contacts-and-searches-tables

List first 5 entries of a joined contacts and searches tables

Airbnb ID 10123

Find the first 5 rows by joining search details and contacts datasets.

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

SELECT * FROM airbnb_searches AS searches
INNER JOIN airbnb_contacts AS contacts
    ON searches.id_user = contacts.id_guest
LIMIT 5;