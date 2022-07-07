/*

https://platform.stratascratch.com/coding/9649-count-the-number-of-accounts-used-for-logins-in-2016

Count the number of accounts used for logins in 2016

Amazon ID 9649

How many accounts have performed a login in the year 2016?

Table: product_logins

product_logins

account_id:int
employer_key:varchar
login_date:datetime

*/

SELECT 
    COUNT(DISTINCT account_id) n_account_id
FROM product_logins
WHERE login_date BETWEEN '2016-01-01' AND '2016-12-31'