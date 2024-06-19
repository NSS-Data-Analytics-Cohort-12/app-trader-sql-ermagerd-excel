-- select *
-- From play_store_apps;


-- -- for the play apps as they don't round
-- SELECT ROUND((rating * 2) / 2,1) AS rounded_rating
-- FROM app_store_apps

-- -- for apple apps as they already round
-- SELECT *, (rating * 2 +1) * 5000 AS gross




-- ### App Trader

-- Your team has been hired by a new company called App Trader to help them explore and gain insights from apps that are made available through the Apple App Store and Android Play Store. App Trader is a broker that purchases the rights to apps from developers in order to market the apps and offer in-app purchase. 

-- Unfortunately, the data for Apple App Store apps and Android Play Store Apps is located in separate tables with no referential integrity.
-- Need some way to combine and compare them UNION perhaps John may have already done this 
-- #### 1. Loading the data
-- a. Launch PgAdmin and create a new database called app_trader.  

-- b. Right-click on the app_trader database and choose `Restore...`  

-- c. Use the default values under the `Restore Options` tab. 

-- d. In the `Filename` section, browse to the backup file `app_store_backup.backup` in the data folder of this repository.  

-- e. Click `Restore` to load the database.  

-- f. Verify that you have two tables:  
--     - `app_store_apps` with 7197 rows  
--     - `play_store_apps` with 10840 rows

-- #### 2. Assumptions

-- Based on research completed prior to launching App Trader as a company, you can assume the following:

-- a. App Trader will purchase apps for 10,000 times the price of the app. For apps that are priced from free up to $1.00, the purchase price is $10,000.
    -- create table of purchase price for apptrader. should be if price <=1 then 10k otherwise 10k times price
-- - For example, an app that costs $2.00 will be purchased for $20,000.
    
-- - The cost of an app is not affected by how many app stores it is on. A $1.00 app on the Apple app store will cost the same as a $1.00 app on both stores. 
    
-- - If an app is on both stores, it's purchase price will be calculated based off of the highest app price between the two stores. 
-- if app count name play to apple <> 0 and cap count name apple to name play <> 0 MAX(price name app in a union all) 


--INTERSECT on appname between two tables max each price for each app for this
-- SELECT name, CAST(price AS FLOAT) AS price
-- FROM app_store_apps
-- INTERSECT
-- SELECT name, CAST(REPLACE(price, '$', '') AS FLOAT) AS price
-- FROM play_store_apps
-- ORDER BY price DESC
-- LIMIT 200;
WITH Both_stores AS (SELECT name, price::money AS price
FROM app_store_apps
INTERSECT
SELECT name, price::money AS price
FROM play_store_apps
ORDER BY price DESC)
WITH One_stores AS (SELECT name, price::money AS price
FROM app_store_apps
INTERSECT
SELECT name, price::money AS price
FROM play_store_apps
ORDER BY price DESC)

--this is me adding a thing
-- b. Apps earn $5000 per month, per app store it is on, from in-app advertising and in-app purchases, regardless of the price of the app.
    --if app on apple and play then 10k per month otherwise 5k per month
-- SELECT *, (rating * 2 +1) * 5000 AS gross

-- - An app that costs $200,000 will make the same per month as an app that costs $1.00. 

-- - An app that is on both app stores will make $10,000 per month. 

-- c. App Trader will spend an average of $1000 per month to market an app regardless of the price of the app. If App Trader owns rights to the app in both stores, it can market the app for both stores for a single cost of $1000 per month.
    -- if in interesct table cost table 1k per month otherwise price 1k per month 
-- - An app that costs $200,000 and an app that costs $1.00 will both cost $1000 a month for marketing, regardless of the number of stores it is in.

-- d. For every half point that an app gains in rating, its projected lifespan increases by one year. In other words, an app with a rating of 0 can be expected to be in use for 1 year, an app with a rating of 1.0 can be expected to last 3 years, and an app with a rating of 4.0 can be expected to last 9 years.
    --if apprating = 0 then 1 
-- (apprating +.5) /2


-- as lifespan
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
-- 	ORDER BY review_count DESC, rating DESC;
-- - App store ratings should be calculated by taking the average of the scores from both app stores and rounding to the nearest 0.5.

-- e. App Trader would prefer to work with apps that are available in both the App Store and the Play Store since they can market both for the same $1000 per month.


-- #### 3. Deliverables

-- a. Develop some general recommendations as to the price range, genre, content rating, or anything else for apps that the company should target.

-- b. Develop a Top 10 List of the apps that App Trader should buy.

-- c. Submit a report based on your findings. All analysis work must be done using PostgreSQL, however you may export query results to create charts in Excel for your report. 

-- updated 2/18/2023