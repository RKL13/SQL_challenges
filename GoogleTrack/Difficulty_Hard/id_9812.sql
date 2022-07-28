/*

https://platform.stratascratch.com/coding/9812-count-the-number-of-words-per-row-in-both-words-lists

Count the number of words per row in both words lists

Amazon ID 9814

Count the number of words per row in both words lists.

google_word_lists

words1:varchar
words2:varchar

*/

SELECT 
    CARDINALITY(regexp_split_to_array(CONCAT(words1, ',', words2), ','))
FROM google_word_lists