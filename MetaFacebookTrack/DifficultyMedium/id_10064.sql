/*

https://platform.stratascratch.com/coding/10064-highest-energy-consumption

Highest Energy Consumption

Amazon ID 10064

Find the date with the highest total energy consumption from the Meta/Facebook data centers. 
Output the date along with the total energy consumption across all data centers.

Tables: fb_eu_energy, fb_asia_energy, fb_na_energy

fb_eu_energy

date:datetime
consumption:int

fb_asia_energy

date:datetime
consumption:int

fb_na_energy

date:datetime
consumption:int

*/

WITH table_all 
AS (SELECT * FROM fb_eu_energy
    UNION ALL
    SELECT * FROM fb_asia_energy
    UNION ALL
    SELECT * FROM fb_na_energy),
ranked_consumption_table
AS (SELECT date,
           SUM(consumption) total_consumption,
           RANK() OVER(ORDER BY SUM(consumption) DESC) rank_consumption
    FROM table_all
    GROUP BY date)
    
SELECT 
    date,	
    total_consumption
FROM ranked_consumption_table
WHERE rank_consumption = 1