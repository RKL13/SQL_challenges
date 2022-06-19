/*

https://platform.stratascratch.com/coding/10072-guest-or-host-kindness

Guest Or Host Kindness

Airbnb ID 10072

Find whether hosts or guests give higher review scores based on their average review scores. 
Output the higher of the average review score rounded to the 2nd decimal spot (e.g., 5.11).

Table: airbnb_reviews

airbnb_reviews

from_user:int
to_user:int
from_type:varchar
to_type:varchar
review_score:int

*/

SELECT from_type, ROUND(AVG(review_score), 2) FROM airbnb_reviews
GROUP BY from_type
ORDER BY round DESC
LIMIT 1;