
select 
*
from {{ ref('stg_first') }}
where id is not null