With Customers as (
    Select 
        id as customerid,
        first_name,
        last_name
    From {{ source('jaffle_shop','customers')}}
    
)
Select * from Customers