{% snapshot FactOrders %}

    {% set new_schema = target.schema + "_snapshot" %}


    {{
        config(
            target_database="Analytics",
            target_schema=new_schema,
            unique_key="orderid",
            strategy="timestamp",
            updated_at="OrderUpdatedDate",
        )
    }}

    select *
    from analytics.{{ target.schema }}.FactOrders

{% endsnapshot %}
