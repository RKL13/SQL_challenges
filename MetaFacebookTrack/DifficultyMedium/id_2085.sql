/*

https://platform.stratascratch.com/coding/2085-average-number-of-requests
Blocked Users

Amazon ID 2085

What was the average number of friend requests sent by users in the second week of December 2021?

Hint: the second week of December 2021 is the 49th week of the year.

Table: fb_requests

fb_requests

sender_id:varchar
receiver_id:varchar
sent_date:datetime
is_accepted:bool

*/

WITH preprocessed_table
AS (SELECT sender_id,
           COUNT(*) n_sent
    FROM fb_requests
    WHERE DATE_PART('week', sent_date) = 49
    AND DATE_PART('year', sent_date) = 2021
    GROUP BY sender_id)

SELECT 
    AVG(n_sent) avg_sent
FROM preprocessed_table