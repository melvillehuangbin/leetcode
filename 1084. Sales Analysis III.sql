# # Write your MySQL query statement below


##### solution using window function #####
with foo as (
    select
        s.product_id,
        p.product_name,
        sum(case when s.sale_date between '2019-01-01' and '2019-03-31' then 0 else 1 end) over(partition by product_id) as check_sales
    from 
        Sales s
        left join Product p on s.product_id = p.product_id
)

select distinct product_id, product_name from foo where check_sales = 0

##### solution using Having #####
select
    s.product_id,
    p.product_name
from 
    Sales s
    left join Product p on s.product_id = p.product_id
group by s.product_id
having min(s.sale_date) >= '2019-01-01' and max(s.sale_date) <= '2019-03-31'