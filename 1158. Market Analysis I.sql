# Write your MySQL query statement below

with orders as (
    select
        buyer_id,
        count(order_id) as orders_in_2019
    from Orders
    where year(order_date) = 2019
    group by 1
)

select
    u.user_id as buyer_id, 
    u.join_date,
    coalesce(o.orders_in_2019, 0) as orders_in_2019
from
    Users u
    left join Orders o on u.user_id = o.buyer_id