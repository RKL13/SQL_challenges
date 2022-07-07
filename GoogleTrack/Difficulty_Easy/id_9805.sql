/*

https://platform.stratascratch.com/coding/9805-find-drafts-which-contains-the-word-optimism

Find drafts which contains the word 'optimism'

Amazon ID 9805

Find drafts which contains the word 'optimism'.

Table: google_file_store

google_file_store

filename:varchar
contents:varchar

*/

SELECT 
    * 
FROM google_file_store
WHERE contents ILIKE '%optimism%'
AND filename ILIKE '%draft%'