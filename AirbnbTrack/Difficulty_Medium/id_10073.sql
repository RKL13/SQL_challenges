/*

https://platform.stratascratch.com/coding/10073-favorite-host-nationality

Favorite Host Nationality

Airbnb ID 10073

For each guest reviewer, find the nationality of the reviewer’s favorite host based on the guest’s highest review score given to a host. Output the user ID of the guest along with their favorite host’s nationality. In case there is more than one favorite host from the same country, list that country only once (remove duplicates).

Both the from_user and to_user columns are user IDs.

Tables: airbnb_reviews, airbnb_hosts

airbnb_reviews

from_user:int
to_user:int
from_type:varchar
to_type:varchar
review_score:int

airbnb_hosts

host_id:int
nationality:varchar
gender:varchar
age:int

*/

SELECT DISTINCT
    reviews.from_user,
    nationality
FROM (SELECT 
        reviews.from_user,
        MAX(reviews.review_score) AS max_review
      FROM airbnb_reviews reviews
      WHERE reviews.from_type = 'guest'
      GROUP BY reviews.from_user) AS couple_guest_max_review
LEFT JOIN airbnb_reviews reviews 
ON reviews.review_score = couple_guest_max_review.max_review
AND reviews.from_user = couple_guest_max_review.from_user
LEFT JOIN airbnb_hosts hosts
ON reviews.to_user = hosts.host_id
WHERE reviews.from_type = 'guest'
GROUP BY reviews.from_user, nationality
ORDER BY reviews.from_user