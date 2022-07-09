/*

https://platform.stratascratch.com/coding/10086-email-details-based-on-sends

Email Details Based On Sends

Amazon ID 10086

Find all records from days when the number of distinct users receiving emails was 
greater than the number of distinct users sending emails

Table: google_gmail_emails

google_gmail_emails

id:int
from_user:varchar
to_user:varchar
day:int

*/

SELECT 
    *
FROM google_gmail_emails
WHERE day IN (SELECT day
              FROM google_gmail_emails
              GROUP BY day
              HAVING COUNT(DISTINCT to_user) > COUNT(DISTINCT from_user))