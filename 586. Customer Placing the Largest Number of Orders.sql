# Write your MySQL query statement below

with count_orders as (
    select
        customer_number,
        count(order_number) as number_of_orders
    from Orders
    group by customer_number
)

select
    t.customer_number
from (
    select
        customer_number,
        rank() over(order by number_of_orders desc) as rank_orders
    from count_orders
) t
where t.rank_orders = 1
