
-- Use the `ref` function to select from other models
{{ config(materialized='table') }}

select 
*,
CURRENT_TIMESTAMP AS runtimestamp
from {{ ref('stg_second') }}
where id = 1