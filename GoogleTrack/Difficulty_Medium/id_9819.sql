/*

https://platform.stratascratch.com/coding/9819-sum-of-transportation-numbers

Sum Of Transportation Numbers

Amazon ID 9819

Find the sum of all values between the lowest and highest transportation numbers (i.e., exclude the lowest and highest numbers in your sum).

Your output should have 3 columns: the minimum number, maximum number, and summation.

Table: transportation_numbers

transportation_numbers

index:int
number:int
_system_id:int

*/

SELECT 
    SUM(number),
    (SELECT MAX(number) FROM transportation_numbers) max_number,
    (SELECT MIN(number) FROM transportation_numbers) min_number
FROM transportation_numbers
WHERE number < (SELECT MAX(number) FROM transportation_numbers)
AND number > (SELECT MIN(number) FROM transportation_numbers)

/* Simpler approach */

SELECT 
    SUM(number) - MAX(number) - MIN(number) sum_number,
    MAX(number) max_number,
    MIN(number) min_number
FROM transportation_numbers