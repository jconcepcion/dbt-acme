--Order is a reserved word so we use the plural
with orders as ( select * from {{ source('subscription', 'order') }} )

select id as id
,cast(customer as number) as account_id
,TO_DATE(EFFECTIVE_ON, 'mm/dd/yy') as effective_on
,TO_DATE(EFFECTIVE_ON, 'mm/dd/yy') as booked_on
,type as type
from orders
where deleted_at IS NULL