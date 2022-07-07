/*

https://platform.stratascratch.com/coding/9806-find-all-records-with-words-that-start-with-the-letter-g

Find all records with words that start with the letter 'g'

Amazon ID 9806

Find all records with words that start with the letter 'g'.

Output words1 and words2 if any of them satisfies the condition.

Table: google_word_lists

google_word_lists

words1:varchar
words2:varchar

*/

SELECT 
    * 
FROM google_word_lists
WHERE words1 ILIKE 'g%' 
OR words2 ILIKE 'g%'
OR words1 ILIKE '%,g%'
OR words2 ILIKE '%,g%'