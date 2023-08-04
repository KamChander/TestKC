
With Customers as (
    Select * from {{ ref('stg_Customers')}}
),

  Orders as (

    Select * from {{ ref('stg_Orders')}}
),

customer_orders as (

    Select 
        customerid,
        min(order_date) as FirstOrderDate,
        Max(order_date) as MostRecentOrderDate,
        Count(orderid) as NumberOfOrders

    From orders
    Group by 1
),
Final as (

    Select 
        customers.customerid,
        customers.first_name,
        customers.last_name,
        customer_orders.FirstOrderDate,
        Customer_orders.MostRecentOrderDate,
        Coalesce(customer_orders.numberOfOrders,0) as NumberOfOrders

    From Customers 
    Left Join customer_orders using(customerid)

)
Select * from Final