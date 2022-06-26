/*

https://platform.stratascratch.com/coding/2107-primary-key-violation

Primary Key Violation

Amazon ID 2107

Write a query to return all Customers (cust_id) who are violating primary key constraints 
in the Customer Dimension (dim_customer) i.e. those Customers who are present more than once in the Customer Dimension. 
For example if cust_id 'C123' is present thrice then the query should return 'C123' | '3' as output.

Table: dim_customer

dim_customer

cust_id:varchar
cust_name:varchar
cust_city:varchar
cust_dob:datetime
cust_pin_code:int

*/

SELECT 
    cust_id,
    COUNT(cust_id) AS count_cust_id
FROM dim_customer
GROUP BY cust_id
HAVING COUNT(cust_id) > 1