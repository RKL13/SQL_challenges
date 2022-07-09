/*

https://platform.stratascratch.com/coding/10068-user-email-labels

User Email Labels

Amazon ID 10068

Find the number of emails received by each user under each built-in email label. 
The email labels are: 'Promotion', 'Social', and 'Shopping'. 
Output the user along with the number of promotion, social, and shopping mails count,.

Tables: google_gmail_emails, google_gmail_labels

google_gmail_emails

id:int
from_user:varchar
to_user:varchar
day:int

google_gmail_labels

email_id:int
label:varchar

*/

SELECT 
    e.to_user,
    SUM(CASE WHEN label = 'Promotion' THEN 1
             ELSE 0 END) AS promotion_count,
    SUM(CASE WHEN label = 'Social' THEN 1
             ELSE 0 END) AS social_count,
    SUM(CASE WHEN label = 'Shopping' THEN 1
             ELSE 0 END) AS shopping_count
FROM google_gmail_emails e
LEFT JOIN google_gmail_labels l
ON l.email_id = e.id
GROUP BY e.to_user