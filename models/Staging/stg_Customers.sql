with
customers as (
    select
        id as customerid,
        first_name,
        last_name
    from {{ source("jaffle_shop", "customers") }}

)

select *
from customers
