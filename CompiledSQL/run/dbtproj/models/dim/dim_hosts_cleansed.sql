
  create or replace   view AIRBNB.DEV.dim_hosts_cleansed
  
   as (
    
WITH  __dbt__cte__src_hosts as (
WITH RAW_HOSTS AS (
 SELECT
 *
 FROM
AIRBNB.raw.raw_hosts
)
SELECT
 id AS host_id,
 NAME AS host_name,
 is_superhost,
 created_at,
 updated_at
FROM
 raw_hosts
),src_hosts AS (
 SELECT
 *
 FROM
 __dbt__cte__src_hosts
)
SELECT
 host_id,
NVL(host_name,'Anonymous') As HOST_NAME,
 is_superhost,
 created_at,
 updated_at
FROM
 src_hosts
  );

