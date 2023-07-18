
        WITH  __dbt__cte__src_listings as (
WITH RAW_LISTINGS AS (
Select * from AIRBNB.RAW.RAW_LISTINGS
)
Select 
    ID as LISTING_ID,
	LISTING_URL,
	NAME as LISTING_NAME,
	ROOM_TYPE,
	MINIMUM_NIGHTS,
	HOST_ID,
	PRICE as PRICE_STR,
	CREATED_AT,
	UPDATED_AT
FROM
    RAW_LISTINGS
),src_listings AS (
        SELECT * FROM __dbt__cte__src_listings
)
SELECT
 listing_id,
 listing_name,
 room_type,
 CASE
 WHEN minimum_nights = 0 THEN 1
 ELSE minimum_nights
 END AS minimum_nights,
 host_id,
 REPLACE(
 price_str,
 '$'
 ) :: NUMBER(
 10,
 2
 ) AS price,
 created_at,
 updated_at
FROM
 src_listings