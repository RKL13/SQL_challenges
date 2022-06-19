/*

https://platform.stratascratch.com/coding/10166-reviews-of-hotel-arena

Reviews of Hotel Arena

Airbnb ID 10166

Find the number of reviews for each review score earned by 'Hotel Arena'. 
Output the hotel name (which should be 'Hotel Arena'), review score along with the corresponding 
number of reviews with that score for the specified hotel.

Table: hotel_reviews

hotel_address:varchar
additional_number_of_scoring:int
review_date:datetime
average_score:float
hotel_name:varchar
reviewer_nationality:varchar
negative_review:varcharr
eview_total_negative_word_counts:int
total_number_of_reviews:int
positive_review:varchar
review_total_positive_word_counts:int
total_number_of_reviews_reviewer_has_given:int
reviewer_score:float
tags:varchar
days_since_review:varchar
lat:float
lng:float

*/

SELECT hotel_name, reviewer_score, COUNT(reviewer_score)
FROM hotel_reviews
WHERE hotel_name = 'Hotel Arena'
GROUP BY reviewer_score, hotel_name;