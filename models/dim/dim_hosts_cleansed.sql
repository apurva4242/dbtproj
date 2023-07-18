{{
    config(
        materialized = 'view'
    )
}}
WITH src_hosts AS (
 SELECT
 *
 FROM
 {{ref('src_hosts')}}
)
SELECT
 host_id,
NVL(host_name,'Anonymous') As HOST_NAME,
 is_superhost,
 created_at,
 updated_at
FROM
 src_hosts