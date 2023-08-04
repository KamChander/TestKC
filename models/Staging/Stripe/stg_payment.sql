With payments as (

    Select 
        id as paymentid,
        orderid,
        paymentmethod,
        status,
        amount,
        created
    From {{ source('stripe','payment')}}

)
Select * from payments