{{ config(materialized='view') }}

with account as ( select * from {{ source('subscription', 'account') }} )

select 
CAST(id as number) as id,
name,
city,
state,
CURRENT_TIMESTAMP as runtimestamp
from account
where deleted_at IS NULL