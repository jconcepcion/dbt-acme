with account as ( select * from {{ source('subscription', 'account') }} )

select CAST(id as number) as id
,name
,city
,state
from account
where deleted_at IS NULL