{{ config(materialized='table') }}

with
orders as
(
Select
o.id as order_id,
o.account_id as customer_id,
o.effective_on as order_effecttive_on,
o.booked_on as order_booked_on,
o.type as order_type,
------
op.id as order_product_id,
--o.order_id,
op.product_id,
op.quantity_change,
------
--p.id as product_id,
p.name as product_name,
p.unit,
p.unit_rate,
p.type as product_type,
p.unit_timing,
p.status as product_status

from {{ ref('stg_order') }} o
left join {{ ref('stg_order_product') }} op
on o.id = op.order_id
join stg_product p on op.product_id = p.id
--where op.id is null -- 1+ rows
),

cust_orders as
(
select
a.id as account_id,
a.name as account_name,
a.state,
a.city,
---
o.*
from {{ ref('stg_account') }} a left join orders o
on a.id = o.customer_id
--where o.customer is null -- 0 rows
),

final as
(
select co.*,
CURRENT_TIMESTAMP as runtimestamp from cust_orders co
)

select * from final