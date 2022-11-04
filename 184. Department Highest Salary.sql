# Write your MySQL query statement below

# find highest salary in each of the departments

# join to get relevant columns from Department
with foo as (
    select
        e.id,
        e.name,
        e.salary,
        e.departmentId,
        d.name as 'Department'
    from 
        Employee e
        left join Department d on e.departmentId = d.id
),

foo_2 as (
    select
        id,
        name,
        salary,
        Department,
        dense_rank() over(partition by Department order by salary desc) as salary_rank
    from foo
)

select
    Department,
    name as Employee,
    salary as Salary
from foo_2
where salary_rank = 1