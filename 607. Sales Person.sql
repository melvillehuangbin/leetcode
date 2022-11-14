# Write your MySQL query statement below

# no orders from company with name RED
with foo as (
    select
        s.name,
        s.sales_id
    from
        SalesPerson s
        left join Orders o on o.sales_id = s.sales_id
        left join Company c on o.com_id = c.com_id
    where c.name = 'RED'
)

select name 
from SalesPerson 
where sales_id not in (select sales_id from foo)
