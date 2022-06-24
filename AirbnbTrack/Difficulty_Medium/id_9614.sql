/*

https://platform.stratascratch.com/coding/9614-find-the-average-difference-between-booking-and-check-in-dates

Find the average difference between booking and check-in dates

Airbnb ID 9614

Find the average number of days between the booking and check-in dates for AirBnB hosts. 
Order the results based on the average number of days in descending order.
avg_days_between_booking_and_checkin DESC

Table: airbnb_contacts

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

*/

SELECT 
    id_host,
    AVG(ds_checkin :: DATE - ts_booking_at :: DATE) AS avg_days_between_booking_and_checkin 
FROM airbnb_contacts
GROUP BY id_host
HAVING AVG(ds_checkin :: DATE - ts_booking_at :: DATE) >= 0
ORDER BY avg_days_between_booking_and_checkin DESC