# Write your MySQL query statement below

# if we define the count_no_trans as summing transaction_ids
select
    v.customer_id,
    sum(case when t.transaction_id is null then 1 else 0 end) as count_no_trans
from 
    Visits v
    left join Transactions t on v.visit_id = t.visit_id
where t.transaction_id is null
group by customer_id

# if we define the count_no_trans as counting number of customers
select
    v.customer_id,
    count(v.customer_id) as count_no_trans
from 
    Visits v
    left join Transactions t on v.visit_id = t.visit_id
where t.transaction_id is null
group by customer_id