/*

https://platform.stratascratch.com/coding/9818-file-contents-shuffle

File Contents Shuffle

Amazon ID 9818

Sort the words alphabetically in 'final.txt' and make a new file named 'wacky.txt'. 
Output the file contents in one column and the filename 'wacky.txt' in another column. Lowercase all the words. 
To simplify the question, there is no need to remove the punctuation marks.

Table: google_file_store

google_file_store

filename:varchar
contents:varchar

*/

WITH file_txt_content_table 
AS (SELECT contents file_txt_content
    FROM google_file_store
    WHERE filename = 'final.txt'),
words_table 
AS (SELECT unnest(regexp_split_to_array(file_txt_content, ' ')) words
    FROM file_txt_content_table
    ORDER BY words)
    
SELECT
    'wacky.txt' filename,
    array_to_string(array_agg(lower(words)), ' ') 
FROM words_table