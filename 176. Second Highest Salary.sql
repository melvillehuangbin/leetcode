# Write your MySQL query statement below

-- second highest salary, no second highest report null
-- to detect whether second highest salary exists, we need to check if count(salary) > 2
-- if count(salary) > 2, report second highest salary
-- else null

-- take note of the difference between rank, dense_rank and row_number window functions


with foo as (
    select
        id,
        salary,
        dense_rank() over(order by salary desc) as salary_rank
    from Employee
)

select
    (case
        when count(salary) >= 2 then (select distinct salary from foo where salary_rank = 2)
        else null
    end) as SecondHighestSalary
from foo

