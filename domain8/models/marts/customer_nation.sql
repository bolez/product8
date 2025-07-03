
with customer as (

    select * from {{ ref('TPCH_SF1_CUSTOMER') }}

),

nation as (

    select * from {{ ref('TPCH_SF1_NATION') }}

),


final as (

    select c.*, n.n_name from customer as c join nation as n on c.c_nationkey=n.n_nationkey
)

select *
from final