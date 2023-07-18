{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}
WITH src_reviews AS (
    select * from {{ref('src_reviews')}}
)
select * from src_reviews
where REVIEW_TEXT is not null
{% if is_incremental() %}
AND REVIEW_DATE > ( select max(REVIEW_DATE) from {{this}})
{% endif %}