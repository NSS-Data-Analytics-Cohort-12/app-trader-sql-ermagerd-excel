SELECT rating,
	review_count::INT,
	name,
	price,
	content_rating
FROM app_store_apps
WHERE rating >= '4'
	ORDER BY review_count DESC

SELECT rating,
	review_count,
	DISTINCT,name,
	price::money,
	content_rating
FROM play_store_apps
WHERE rating >='4'
	ORDER BY review_count DESC

SELECT rating,
	(rating*2+1)*5000 AS gross,
	review_count,
	DISTINCT(name),
	price::money,
	CASE WHEN play_store_apps.rating >= (rating*2+1)*5000 THEN 'succescful' END AS apps
FROM play_store_apps
	ORDER BY review_count DESC
 

SELECT *
FROM app_store_apps
ORDER BY price DESC

	
SELECT 
    name, 
    price::money, 
    rating,
    CASE 
        WHEN app_store_apps.rating BETWEEN 4.1 AND 4.5 THEN '10'
        WHEN app_store_apps.rating BETWEEN 3.6 AND 4.0 THEN '9'
        WHEN app_store_apps.rating BETWEEN 3.1 AND 3.5 THEN '8'
        WHEN app_store_apps.rating BETWEEN 2.6 AND 3.0 THEN '7'
        WHEN app_store_apps.rating BETWEEN 2.1 AND 2.5 THEN '6'
        WHEN app_store_apps.rating BETWEEN 1.6 AND 2.0 THEN '5'
        WHEN app_store_apps.rating BETWEEN 1.1 AND 1.5 THEN '4'
        WHEN app_store_apps.rating BETWEEN 0.6 AND 1.0 THEN '3'
        WHEN app_store_apps.rating BETWEEN 0.1 AND 0.5 THEN '2'
        WHEN app_store_apps.rating = 0.0 THEN '1'
        ELSE 'Unknown'
    END AS Longevity
FROM 
    app_store_apps
	ORDER BY Longevity DESC;





SELECT 
	DISTINCT(name::varchar),
    price::money, 
    rating,
	review_count,
    CASE
		WHEN play_store_apps.rating BETWEEN 4.6 AND 5.0 THEN '11'
        WHEN play_store_apps.rating BETWEEN 4.1 AND 4.5 THEN '10'
        WHEN play_store_apps.rating BETWEEN 3.6 AND 4.0 THEN '9'
        WHEN play_store_apps.rating BETWEEN 3.1 AND 3.5 THEN '8'
        WHEN play_store_apps.rating BETWEEN 2.6 AND 3.0 THEN '7'
        WHEN play_store_apps.rating BETWEEN 2.1 AND 2.5 THEN '6'
        WHEN play_store_apps.rating BETWEEN 1.6 AND 2.0 THEN '5'
        WHEN play_store_apps.rating BETWEEN 1.1 AND 1.5 THEN '4'
        WHEN play_store_apps.rating BETWEEN 0.6 AND 1.0 THEN '3'
        WHEN play_store_apps.rating BETWEEN 0.1 AND 0.5 THEN '2'
        WHEN play_store_apps.rating = 0.0 THEN '1'
        ELSE 'Unknown'
    END AS Longevity
FROM play_store_apps
WHERE rating IS NOT NULL
ORDER BY review_count DESC, rating DESC;

SELECT name, app_store_apps.price::money AS priceA, 
FROM app_store_apps
INTERSECT
SELECT name, price::money AS price
FROM play_store_apps
ORDER BY price DESC

Today

Brian  to  Everyone 6:02 PM
Wooooo Math!

Brandon Coughlin  to  Everyone 6:13 PM
Thanks Amanda! Good to meet ya!

Shane Botelho  to  Everyone 6:14 PM
86 here outside of Nashville!

Shane Botelho  to  Everyone 6:16 PM
my green beans i planted a week or so ago are all sprouting, so that's pretty exciting

Brian  to  Everyone 6:24 PM
All your base are belong to us?

Griffin Ziegler  to  Everyone 6:26 PM
i can haz data
Me gusta SQL
Ermagerd Excel

Brian  to  Everyone 6:45 PM
You mean you're not going to be king o the pirates?

Abraham Fongnaly  to  Everyone 6:46 PM
STRANGER DANGER

Amanda  to  Everyone 6:51 PM
sucking up encouraged

Brian  to  Everyone 6:55 PM
We can use the wayback machine

Griffin Ziegler  to  Everyone 6:55 PM
darn i was hyped for seeing the flashlight app metrics

Griffin Ziegler  to  Everyone 7:13 PM
price * 10000 as revenue
^ *purchase price

Brian  to  Everyone 7:16 PM
This is what I was looking at https://www.sitepoint.com/collaborative-coding-tools-for-remote-pair-programming/. 
looks like codesandbox may be good

Griffin Ziegler  to  Everyone 7:24 PM
SELECT ROUND((rating * 2) / 2,1) AS rounded_rating
FROM app_store_apps

Griffin Ziegler  to  Everyone 7:34 PM
SELECT *, rating * 2 +1 AS lifespan
formula for lifespan

Brian  to  Everyone 7:38 PM
https://www.pgadmin.org/docs/pgadmin4/development/preferences.html

Lauren Shipman-Dorrance  to  Everyone 7:55 PM
SELECT 
    name, 
    price, 
    rating,
    CASE 
        WHEN app_store_apps.rating BETWEEN 4.1 AND 4.5 THEN '10'
        WHEN app_store_apps.rating BETWEEN 3.6 AND 4.0 THEN '9'
        WHEN app_store_apps.rating BETWEEN 3.1 AND 3.5 THEN '8'
        WHEN app_store_apps.rating BETWEEN 2.6 AND 3.0 THEN '7'
        WHEN app_store_apps.rating BETWEEN 2.1 AND 2.5 THEN '6'
        WHEN app_store_apps.rating BETWEEN 1.6 AND 2.0 THEN '5'
        WHEN app_store_apps.rating BETWEEN 1.1 AND 1.5 THEN '4'
        WHEN app_store_apps.rating BETWEEN 0.6 AND 1.0 THEN '3'
        WHEN app_store_apps.rating BETWEEN 0.1 AND 0.5 THEN '2'
        WHEN app_store_apps.rating = 0.0 THEN '1'
        ELSE 'Unknown'
    END AS Longevity
FROM 
    app_store_apps
	ORDER BY Longevity DESC;

Griffin Ziegler  to  Everyone 8:02 PM
SELECT *, (rating * 2 +1) * 5000 AS gross

Griffin Ziegler  to  Everyone 8:33 PM
SELECT 
    name, 
    price, 
    rating,
	review_count,
    CASE
		WHEN play_store_apps.rating BETWEEN 4.6 AND 5.0 THEN '11'
        WHEN play_store_apps.rating BETWEEN 4.1 AND 4.5 THEN '10'
        WHEN play_store_apps.rating BETWEEN 3.6 AND 4.0 THEN '9'
        WHEN play_store_apps.rating BETWEEN 3.1 AND 3.5 THEN '8'
        WHEN play_store_apps.rating BETWEEN 2.6 AND 3.0 THEN '7'
        WHEN play_store_apps.rating BETWEEN 2.1 AND 2.5 THEN '6'
        WHEN play_store_apps.rating BETWEEN 1.6 AND 2.0 THEN '5'
        WHEN play_store_apps.rating BETWEEN 1.1 AND 1.5 THEN '4'
        WHEN play_store_apps.rating BETWEEN 0.6 AND 1.0 THEN '3'
        WHEN play_store_apps.rating BETWEEN 0.1 AND 0.5 THEN '2'
        WHEN play_store_apps.rating = 0.0 THEN '1'
        ELSE 'Unknown'
    END AS Longevity
FROM 
    play_store_apps
WHERE rating IS NOT NULL
	ORDER BY review_count DESC, rating DESC;

Brian  to  Everyone 9:12 PM
SELECT name, CAST(price AS FLOAT) AS price
FROM app_store_apps
INTERSECT
SELECT name, CAST(REPLACE(price, '$', '') AS FLOAT) AS price
FROM play_store_apps
ORDER BY price DESC
LIMIT 200;

You 9:13 PM
SELECT name, price::money AS price
FROM app_store_apps
INTERSECT
SELECT name, price::money AS price
FROM play_store_apps
ORDER BY price DESC