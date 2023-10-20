With payments As (

    Select
        id As paymentid,
        orderid,
        paymentmethod,
        status,
        amount,
        created
    From {{ source('stripe','payment') }}

)

Select * From payments
