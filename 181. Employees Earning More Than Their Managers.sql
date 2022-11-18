# Write your MySQL query statement below
with raw as (
    select
        t1.name,
        t1.salary,
        t2.salary as manager_salary
    from 
        Employee t1
        left join Employee t2 on t1.managerId = t2.id
)

select
    name as Employee
from raw
where salary > manager_salary