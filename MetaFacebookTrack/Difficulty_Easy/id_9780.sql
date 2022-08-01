/*

https://platform.stratascratch.com/coding/9780-find-the-overall-friend-acceptance-count-for-a-given-date

Find the overall friend acceptance count for a given date

Amazon ID 9780

Find the overall friend acceptance count for a given date.
Assume the date is 2nd of January 2019.

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
WHERE date_approved = '2019-01-02'