# Write your MySQL query statement below
select
    u.name,
    sum(t.amount) as balance
from 
    Transactions t
    left join Users u on t.account = u.account
group by t.account
having sum(t.amount) > 10000