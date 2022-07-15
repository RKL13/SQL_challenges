/*

https://platform.stratascratch.com/coding/10069-correlation-between-e-mails-and-activity-time

Correlation Between E-mails And Activity Time

Amazon ID 10069

There are two tables with user activities. The 'google_gmail_emailstable contains information about emails being sent to users. 
Each row in that table represents a message with an unique identifier in theidfield. Thegoogle_fit_location` table contains user 
activity logs from the Google Fit app.

Find the correlation between the number of emails received and the total exercise per day. 
The total exercise per day is calculated by counting the number of user sessions per day.

Tables: google_gmail_emails, google_fit_location

google_gmail_emails

id:int
from_user:varchar
to_user:varchar
day:int

google_fit_location

user_id:varchar
session_id:int
step_id:int
day:int
latitude:float
longitude:float
altitude:float

*/

WITH g_email_day_count 
AS (SELECT to_user,
           day,
           COUNT(DISTINCT id) n_emails
    FROM google_gmail_emails
    GROUP BY to_user, day),
g_location AS (SELECT user_id, 
                      day,
               COUNT(DISTINCT session_id) n_sessions
               FROM google_fit_location
               GROUP BY user_id, day)
    
SELECT 
    CORR(n_emails, n_sessions) 
FROM g_email_day_count e
INNER JOIN g_location l
ON e.to_user = l.user_id
AND e.day = l.day