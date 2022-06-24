/*

https://platform.stratascratch.com/coding/9875-find-the-ten-hotels-with-the-lowest-ratings

Find the ten hotels with the lowest ratings

Airbnb ID 9875

Find the ten hotels with the lowest ratings.
Output the hotel name along with the corresponding average score.

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
    min_average_score
FROM(SELECT hotel_name,
            MIN(average_score) AS min_average_score,
            RANK() OVER(ORDER BY MIN(average_score) ASC) AS rank_asc
     FROM hotel_reviews
     GROUP BY hotel_name) 
AS tuple_name_score_rank
WHERE rank_asc <= 10