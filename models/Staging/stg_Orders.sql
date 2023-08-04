With Orders as(
    Select
        id as orderid,
        user_id as customerid,
        order_date,
        status,
        OrderCreatedDate,
        OrderUpdatedDate
    From {{ source('jaffle_shop','orders')}}
)
Select * from Orders