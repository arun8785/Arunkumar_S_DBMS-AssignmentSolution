/* Q3 */
SELECT PASS_GENDER, COUNT(pass_gender) AS PASS_TRAV_DIS_600 
FROM passenger, price
WHERE passenger.PRICE_ID = price.PRICE_ID
AND DISTANCE >= 600
GROUP BY PASS_GENDER;
/* Q4 */
SELECT BUS_TYPE, min(PRICE) AS MIN_SL_PRICE 
FROM bustraveldetails.price
WHERE BUS_TYPE = 'Sleeper'
GROUP BY BUS_TYPE;
/* Q5 */
SELECT PASSENGER_NAME 
FROM bustraveldetails.passenger
WHERE UPPER(PASSENGER_NAME) LIKE 'S%';
/* Q6 */
SELECT PASSENGER_NAME, BOARDING_CITY, DESTINATION_CITY, PRICE
FROM passenger JOIN price
ON passenger.PRICE_ID = price.PRICE_ID;
/* Q7 */
SELECT PASSENGER_NAME, PRICE 
FROM price 
JOIN passenger 
ON price.PRICE_ID = passenger.PRICE_ID
WHERE DISTANCE = 1000
AND BUS_TYPE = 'Sitting';
/* Q8 - We do not have any travel for Pallavi from Bangalore to Panaji but the
		distance is same as Panaji to Bangalore, so we used the distance of 
        Panaji to Bangalore to show the price of sleeper and sitting */
SELECT BUS_TYPE, PRICE FROM price
WHERE DISTANCE = (SELECT PR.DISTANCE FROM price AS PR, passenger AS PA
				  WHERE PA.PRICE_ID = PR.PRICE_ID
				  AND PA.PASSENGER_NAME = 'Pallavi');
/* Q9 */
SELECT price.DISTANCE
FROM passenger JOIN price
ON passenger.PRICE_ID = price.PRICE_ID
GROUP BY price.DISTANCE
ORDER BY price.DISTANCE DESC;
/* Q10 */
SELECT passenger.PASSENGER_NAME, 
price.DISTANCE * 100 / (SELECT SUM(DISTANCE) FROM passenger
JOIN price
ON passenger.PRICE_ID = price.PRICE_ID) AS PASS_DIS_PERCENTAGE
FROM passenger
JOIN price
ON passenger.PRICE_ID = price.PRICE_ID;
/* Q11 */
SELECT DISTANCE, PRICE,
CASE
	WHEN PRICE > 1000 THEN 'Expensive'
    WHEN (PRICE > 500 AND PRICE < 1000) THEN 'Average'
    ELSE 'Cheap'
END AS TRAVEL_COST
FROM price;