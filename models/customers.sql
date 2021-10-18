{{ config(
    materialized='table'
) }}

SELECT
    customer_id,
    name,
    email,
   COUNT(*) AS orders,
   MIN(orders.created_at) AS first_order_at
FROM
   {{source ('coffee_shop', 'orders')}}
   INNER JOIN {{source ('coffee_shop', 'customers')}} ON customers.id = orders.customer_id
GROUP BY
   customer_id,
    name,
    email