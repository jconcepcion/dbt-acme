with product as ( select * from {{ source('subscription', 'product') }} )

select Id as id
,name as name
,unit as unit
,CAST(replace(unit_rate,',','') as number) as unit_rate
,type as type 
,unit_timing as unit_timing
,CASE WHEN status = 'Activ' THEN 'Active' ELSE status END as status
from product
where deleted_at is null
and status != 'Archived'