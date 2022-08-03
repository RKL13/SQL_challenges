/*

https://platform.stratascratch.com/coding/9766-find-the-complaint-id-for-the-processed-complaints-of-type-1

Find the complaint id for the processed complaints of type 1

Amazon ID 9766

Find the complaint id for the processed complaints of type 1.

Table: facebook_complaints

facebook_complaints

complaint_id:int
type:int
processed:bool

*/

SELECT 
   DISTINCT complaint_id
FROM facebook_complaints
WHERE type = 1
AND processed = True