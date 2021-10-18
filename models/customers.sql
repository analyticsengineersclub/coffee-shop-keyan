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
   analytics-engineers-club.coffee_shop.customers
   INNER JOIN analytics-engineers-club.coffee_shop.orders ON customers.id = orders.customer_id
GROUP BY
   customer_id,
    name,
    email