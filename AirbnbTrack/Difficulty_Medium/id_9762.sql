/*

https://platform.stratascratch.com/coding/9762-find-the-day-of-the-week-that-most-people-check-in

Find the day of the week that most people check-in

Airbnb ID 9762

Find the day of the week that most people want to check-in.
Output the day of the week alongside the corresponding check-incount.

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

/* POSTGRE */

SELECT
    day_of_week,
    n_dow
FROM(SELECT DATE_PART('dow', ds_checkin) AS day_of_week,
            COUNT(DATE_PART('day', ds_checkin)) AS n_dow,
            RANK() OVER(ORDER BY COUNT(DATE_PART('day', ds_checkin)) DESC) AS rank_desc
     FROM airbnb_contacts
     GROUP BY day_of_week) 
AS tuple_dow_count_rank
WHERE rank_desc <= 1;

/* MySQL */

SELECT 
   day_of_week,
    n_dow
FROM(SELECT WEEKDAY(ds_checkin) + 1 AS day_of_week,
     COUNT(WEEKDAY(ds_checkin) + 1) AS n_dow,
     RANK() OVER(ORDER BY COUNT(WEEKDAY(ds_checkin) + 1) DESC) AS rank_desc
     FROM airbnb_contacts
     GROUP BY WEEKDAY(ds_checkin) + 1)
AS tuple_dow_count_rank
WHERE rank_desc <= 1;

/* 

Sunday (0) to Saturday (6) postgre dow 
Sunday (6) to Saturday (5) mysql WEEKDAY() hence WEEKDAY() + 1
Sunday (1) to Saturday (7) mysql DAYOFWEEK() should have been DAYOFWEEK() - 1 

*/ 