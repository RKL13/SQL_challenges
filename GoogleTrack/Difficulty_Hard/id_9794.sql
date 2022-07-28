/*

https://platform.stratascratch.com/coding/9794-words-with-two-vowels

Words With Two Vowels

Amazon ID 9794

Find all words which contain exactly two vowels in any list in the table.

Table: google_word_lists

google_word_lists

words1:varchar
words2:varchar

*/

WITH word_list 
AS (SELECT DISTINCT unnest(regexp_split_to_array(CONCAT(words1, ',' ,words2), ',')) words
    FROM google_word_lists),
n_vowels_table
AS (SELECT words,
           LENGTH(TRANSLATE(words, '[bcdfghjklmnpqrstvwxz]' , '')) n_vowels
    FROM word_list)
    
SELECT 
    words
FROM n_vowels_table
WHERE n_vowels = 2