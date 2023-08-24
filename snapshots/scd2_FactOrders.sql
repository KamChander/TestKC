--- To check check all columns for changes use 'all'
-- To check one than one columns for changes use ['column1','column2']
--updated_at="OrderUpdatedDate", 
{% snapshot FactOrders %}

    {% set new_schema = target.schema + "_snapshot" %}

    {{
        config(
            target_database="Analytics",
            target_schema=new_schema,
            unique_key="orderid",
            strategy="timestamp",
            updated_at="OrderUpdatedDate"
            
        )
    }}

    select *
    from analytics.{{ target.schema }}.FactOrders

{% endsnapshot %}
