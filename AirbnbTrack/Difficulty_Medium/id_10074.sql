/*

https://platform.stratascratch.com/coding/10074-find-the-average-age-of-guests-reviewed-by-each-host

Find the average age of guests reviewed by each host

Airbnb ID 10074

Find the average age of guests reviewed by each host.
Output the user along with the average age.

Tables: airbnb_reviews, airbnb_guests

airbnb_reviews

from_user:int
to_user:int
from_type:varchar
to_type:varchar
review_score:int

airbnb_guests

guest_id:int
nationality:varchar
gender:varchar
age:int

*/

SELECT
    reviews.from_user,
    AVG(guests.age)
FROM airbnb_reviews reviews
LEFT JOIN airbnb_guests guests
ON reviews.to_user = guests.guest_id
WHERE reviews.from_type = 'host'
GROUP BY reviews.from_user;