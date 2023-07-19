select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      /*SELECT F.LISTING_ID,
       F.REVIEW_DATE,
       D.CREATED_AT,
       D.LISTING_ID 
 FROM AIRBNB.DEV.FCT_REVIEWS F
 LEFT JOIN AIRBNB.DEV.DIM_LISTINGS_CLEANSED D
 ON (f.listing_id = d.listing_id)
 WHERE F.REVIEW_DATE < D.CREATED_AT
 LIMIT 10*/

 --JINJA NINJA:
SELECT * FROM AIRBNB.DEV.dim_listings_cleansed l
INNER JOIN AIRBNB.DEV.fct_reviews r
USING (listing_id)
WHERE l.created_at >= r.review_date
      
    ) dbt_internal_test