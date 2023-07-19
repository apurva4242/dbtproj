WITH RAW_LISTINGS AS (
Select * from {{ source('airbnb', 'listings') }}
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