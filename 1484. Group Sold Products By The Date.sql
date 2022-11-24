# Write your MySQL query statement below

select
    sell_date,
    count(distinct product) num_sold,
    group_concat(distinct product separator ',') products
from Activities
group by sell_date