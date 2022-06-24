/*

https://platform.stratascratch.com/coding/9874-find-the-top-ten-hotels-with-the-highest-ratings

Find the top ten hotels with the highest ratings

Airbnb ID 9874

Find the top ten hotels with the highest ratings.
Output the hotel name along with the corresponding average score.
Sort records based on the average score in descending order.

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
    hotel_name,
    max_average_score
FROM (SELECT hotel_name,
             MAX(average_score) AS max_average_score,
             RANK() OVER(ORDER BY MAX(average_score) DESC) AS desc_rank
      FROM hotel_reviews
      GROUP BY hotel_name) 
AS tuple_name_score_rank
WHERE desc_rank <= 10;