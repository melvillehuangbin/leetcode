# Write your MySQL query statement below
#1965. Employees With Missing Information

select distinct
    t.employee_id
from (
    select
        employee_id
    from Employees
    where employee_id not in (select employee_id from Employees)
    or employee_id not in (select employee_id from Salaries)

    union

    select
        employee_id
    from Salaries
    where employee_id not in (select employee_id from Employees)
    or employee_id not in (select employee_id from Salaries)
) t
order by t.employee_id
