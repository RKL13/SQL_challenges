/*

https://platform.stratascratch.com/coding/9781-find-the-rate-of-processed-tickets-for-each-type

Find the rate of processed tickets for each type

Amazon ID 9781

Find the rate of processed tickets for each type.

Table: facebook_complaints

facebook_complaints

complaint_id:int
type:int
processed:bool

*/

SELECT 
    type,
    SUM(CASE WHEN processed = TRUE THEN 1 ELSE 0 END)/COUNT(processed)::FLOAT
FROM facebook_complaints
GROUP BY type