/*

https://platform.stratascratch.com/coding/10133-requests-acceptance-rate

Requests Acceptance Rate

Airbnb ID 10133

Find the acceptance rate of requests which is defined as the ratio of accepted contacts vs all contacts. 
Multiply the ratio by 100 to get the rate.

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

SELECT 100*SUM(CASE 
                    WHEN ts_accepted_at IS NULL THEN 0
                    ELSE 1
                END)/COUNT(*) AS acceptance_rate_perc
FROM airbnb_contacts;