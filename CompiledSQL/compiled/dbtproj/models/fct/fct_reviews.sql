
WITH  __dbt__cte__src_reviews as (
WITH RAW_REVIEWS AS (
 SELECT
 *
 FROM
 AIRBNB.RAW.RAW_REVIEWS
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
    select * from __dbt__cte__src_reviews
)
select * from src_reviews
where REVIEW_TEXT is not null

AND REVIEW_DATE > ( select max(REVIEW_DATE) from AIRBNB.DEV.fct_reviews)
