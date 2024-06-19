-- Categorizing the longevity by ratings
-- SELECT 
--     name, 
--     price, 
--     rating,
--     CASE 
--         WHEN app_store_apps.rating BETWEEN 4.1 AND 4.5 THEN '10'
--         WHEN app_store_apps.rating BETWEEN 3.6 AND 4.0 THEN '9'
--         WHEN app_store_apps.rating BETWEEN 3.1 AND 3.5 THEN '8'
--         WHEN app_store_apps.rating BETWEEN 2.6 AND 3.0 THEN '7'
--         WHEN app_store_apps.rating BETWEEN 2.1 AND 2.5 THEN '6'
--         WHEN app_store_apps.rating BETWEEN 1.6 AND 2.0 THEN '5'
--         WHEN app_store_apps.rating BETWEEN 1.1 AND 1.5 THEN '4'
--         WHEN app_store_apps.rating BETWEEN 0.6 AND 1.0 THEN '3'
--         WHEN app_store_apps.rating BETWEEN 0.1 AND 0.5 THEN '2'
--         WHEN app_store_apps.rating = 0.0 THEN '1'
--         ELSE 'Unknown'
--     END AS Longevity
-- FROM 
--     app_store_apps
-- 	ORDER BY Longevity DESC;

-- SELECT *, (rating * 2 +1) * 5000 AS gross
-- FROM play_store_apps;

-- SELECT 
--     name, 
--     price, 
--     rating,
-- 	review_count,
--     CASE
-- 		WHEN play_store_apps.rating BETWEEN 4.6 AND 5.0 THEN '11'
--         WHEN play_store_apps.rating BETWEEN 4.1 AND 4.5 THEN '10'
--         WHEN play_store_apps.rating BETWEEN 3.6 AND 4.0 THEN '9'
--         WHEN play_store_apps.rating BETWEEN 3.1 AND 3.5 THEN '8'
--         WHEN play_store_apps.rating BETWEEN 2.6 AND 3.0 THEN '7'
--         WHEN play_store_apps.rating BETWEEN 2.1 AND 2.5 THEN '6'
--         WHEN play_store_apps.rating BETWEEN 1.6 AND 2.0 THEN '5'
--         WHEN play_store_apps.rating BETWEEN 1.1 AND 1.5 THEN '4'
--         WHEN play_store_apps.rating BETWEEN 0.6 AND 1.0 THEN '3'
--         WHEN play_store_apps.rating BETWEEN 0.1 AND 0.5 THEN '2'
--         WHEN play_store_apps.rating = 0.0 THEN '1'
--         ELSE 'Unknown'
--     END AS Longevity
-- FROM 
--     play_store_apps
-- WHERE rating IS NOT NULL
-- 	ORDER BY longevity, review_count DESC;

--Trying to intersect for apps that appear in both tables.
SELECT name, price::money AS price
FROM app_store_apps
INTERSECT
SELECT name, price::money AS price
FROM play_store_apps
ORDER BY price 

--Still Trying to intersect for apps that appear in both tables.
SELECT name, CAST(price AS FLOAT) AS price
FROM app_store_apps
INTERSECT
SELECT name, CAST(REPLACE(price, '$', '') AS FLOAT) AS price
FROM play_store_apps
ORDER BY price DESC
LIMIT 200;