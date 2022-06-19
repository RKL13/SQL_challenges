/*

https://platform.stratascratch.com/coding/10167-total-number-of-housing-units

Total Number Of Housing Units

Airbnb ID 10167

Find the total number of housing units completed for each year. Output the year along with the total number of housings. 
Order the result by year in ascending order.

Table: housing_units_completed_us

year:int
month:int
south:float
west:float
midwest:float
northeast:float

*/

SELECT year,
       SUM(south + west + midwest + northeast) AS n_units
FROM housing_units_completed_us
GROUP BY year
ORDER BY year ASC;