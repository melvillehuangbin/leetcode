with cte as (
    select
        d.name,
        e.name as e_name,
        e.salary,
        dense_rank() over(partition by e.departmentId, d.name order by e.salary desc) as rank_salary
    from Employee e
    left join Department d on e.departmentId = d.id
)

select
    name as Department,
    e_name as Employee,
    salary as Salary
from cte
where rank_salary <= 3