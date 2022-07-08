/*

https://platform.stratascratch.com/coding/10120-number-of-custom-email-labels

Number Of Custom Email Labels

Amazon ID 10120

Find the number of occurrences of custom email labels for each user receiving an email. 
Output the receiver user id, label, and the corresponding number of occurrences.

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
    to_user,
    label,
    COUNT(*)
FROM google_gmail_emails e
LEFT JOIN google_gmail_labels l
ON e.id = l.email_id
WHERE label ILIKE 'custom%'
GROUP BY to_user, label