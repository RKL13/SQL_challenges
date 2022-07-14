# SQL_challenges :honey_pot: :honey_pot: :honey_pot: 

We solve daily between 2 to 5 SQL challenges (starting 06-19-2022) from real SQL interview questions.

Easy | Medium | Hard | Track
:---:| :---:|:---:| ---
✅| ✅| ✅| [AirBnB](https://github.com/RKL13/SQL_challenges/tree/main/AirbnbTrack)
✅| ✅| ✅| [Amazon](https://github.com/RKL13/SQL_challenges/tree/main/AmazonTrack)
✅| ✅| ⬜️| [Google](https://github.com/RKL13/SQL_challenges/tree/main/GoogleTrack)



### Cheat Sheet of SQL's interesting funtions, tricks and challenges :wrench:

This section gather some SQL's functions, tricks and challenges we found interesting.

+ ##### Functions :loop:

	+ RANK(), DENSE_RANK(), ROW_NUMBER(), WINDOW(), PERCENT_RANK() followed by OVER() clause (below)
	+ OVER( (PARTITION BY (remember that one can put several columns here such as a GROUP BY) clause) (ORDER BY clause) (ROW or RANGE clause) ) 
	+ EXTRACT( FROM )
	+ TO_CHAR() for dates format
	+ COALESCE()
	+ LAG() OVER()
	+ PERCENTILE_CONT ( numeric_literal ) WITHIN GROUP ( ORDER BY order_by_expression) OVER () [id_9611](https://github.com/RKL13/SQL_challenges/blob/main/GoogleTrack/Dificulty_Medium/id_9611_starred.sql)

+ ##### Tricks :stars:

	+ One can join a table on itself to solve problem e.g : [id_10322](https://github.com/RKL13/SQL_challenges/blob/main/AmazonTrack/Dificulty_Medium/id_10322_starred.sql) 

	+ One can use UNION ALL on the same table to duplicates records e.g : [id_9858](https://github.com/RKL13/SQL_challenges/blob/main/AmazonTrack/Dificulty_Medium/id_9858_starred.sql) 

	+ One can use AVG() OVER() to make a moving/rolling average e.g : [id_10314](https://github.com/RKL13/SQL_challenges/blob/main/AmazonTrack/Difficulty_Hard/id_10314_starred.sql)
	
	+ One can use generate_series in PostgreSQL to generate a serie e.g : [id_2089](https://github.com/RKL13/SQL_challenges/blob/main/AmazonTrack/Difficulty_Hard/id_2089.sql)

	+ COUNT(CASE ... END)[id_10141](https://github.com/RKL13/SQL_challenges/blob/main/AmazonTrack/Dificulty_Medium/id_10141_starred.sql)

+ ##### Special Mention Challenges :trophy:

	+ [id_2059.sql](https://github.com/RKL13/SQL_challenges/blob/main/AmazonTrack/Difficulty_Hard/id_2059_starred.sql)



#### On possible difficulty folders imbalance in tracks 

There are often fewer HARD level challenges available on StartaScratch hence the imbalance one can find in between tracks' level folders. 
This imbalance does not come from our part as we tend to resolve all the challenges, whatever their difficulties are. :horse_racing: