/*

https://platform.stratascratch.com/coding/9879-find-the-countries-with-the-most-positive-reviews

Find the countries with the most positive reviews

Airbnb ID 9879

Find the countries with the most positive reviews.
Output the country along with the number of positive reviews.
Sort records based on the number of positive reviews in descending order.

Table: hotel_reviews

hotel_reviews

hotel_address:varchar
additional_number_of_scoring:int
review_date:datetime
average_score:float
hotel_name:varchar
reviewer_nationality:varchar
negative_review:varchar
review_total_negative_word_counts:int
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

SELECT
    reviewer_nationality,
    COUNT(positive_review) AS n_positive_reviews
FROM hotel_reviews
WHERE NOT positive_review = 'No Positive'
GROUP BY reviewer_nationality
ORDER BY n_positive_reviews DESC;