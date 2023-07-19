
WITH  __dbt__cte__src_reviews as (
WITH RAW_REVIEWS AS (
 SELECT
 *
 FROM
AIRBNB.raw.raw_reviews
)
SELECT
LISTING_ID,
DATE as REVIEW_DATE,
REVIEWER_NAME,
COMMENTS AS REVIEW_TEXT,
SENTIMENT AS REVIEW_SENTIMENT
FROM
RAW_REVIEWS
),src_reviews AS (
 SELECT * FROM __dbt__cte__src_reviews
)
SELECT
 md5(cast(coalesce(cast(listing_id as TEXT), '') || '-' || coalesce(cast(review_date as TEXT), '') || '-' || coalesce(cast(reviewer_name as TEXT), '') || '-' || coalesce(cast(review_text as TEXT), '') as TEXT))
 AS review_id,
 *
 FROM src_reviews
WHERE review_text is not null
