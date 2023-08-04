With orders as (

    Select * from {{ ref('stg_Orders')}}
),

payments as (

    Select * from {{ ref('stg_payment')}}
),

FactOrders as (

    Select
        o.orderid,
        paymentid,
        amount
    From orders as o
    Left Join payments p on o.orderid=p.orderid 

)
Select * from FactOrders