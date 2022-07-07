/*

https://platform.stratascratch.com/coding/9807-find-all-companies-with-more-than-10-employees

Find all companies with more than 10 employees. Output all columns.

Amazon ID 9807

Find business types present in the dataset.

Table: google_adwords_earnings

google_adwords_earnings

business_type:varchar
n_employees:int
ear:int
adwords_earnings:int

*/

SELECT 
    * 
FROM google_adwords_earnings
WHERE n_employees > 10