/*

https://platform.stratascratch.com/coding/9789-find-the-total-number-of-approved-friendship-requests-in-january-and-february

Find the total number of approved friendship requests in January and February

Amazon ID 9789

Find the total number of approved friendship requests in January and February.

Table: facebook_friendship_requests

facebook_friendship_requests

sender:int
receiver:int
date_sent:datetime
date_approved:datetime

*/

SELECT 
    COUNT(*)
FROM facebook_friendship_requests
WHERE DATE_PART('month', date_approved) IN (1,2)