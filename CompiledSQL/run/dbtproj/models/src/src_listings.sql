
  create or replace   view AIRBNB.DEV.src_listings
  
   as (
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
  );

