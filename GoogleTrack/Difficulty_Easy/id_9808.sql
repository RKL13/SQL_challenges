/*

https://platform.stratascratch.com/coding/9808-find-business-types-present-in-the-dataset

Find business types present in the dataset

Amazon ID 9808

Find business types present in the dataset.

Table: google_adwords_earnings

google_adwords_earnings

business_type:varchar
n_employees:int
ear:int
adwords_earnings:int

*/

SELECT 
    DISTINCT business_type
FROM google_adwords_earnings