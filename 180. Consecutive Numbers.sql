
# Write your MySQL query statement below

# get lag with offset 1 to get previous row number
with foo as (
    select
        id,
        num,
        lag(num) over (order by id asc) as prev_id_num
    from Logs
),

# 0 if number = previous_number, 1 if number != previous number to create the grouping with sum over id
# id = 1 is excluded
foo_2 as (
    select
        id,
        num,
        sum(case when (num = prev_id_num) or (id = 1) then 0 else 1 end) over(order by id) as grp
    from foo
),

# count the consecutive numbers that appear by grouping grp,num
foo_3 as (
    select 
        grp,
        num,
        count(num) as consecutive_numbers
    from foo_2
    group by num, grp
    order by grp
)

select distinct
    num as ConsecutiveNums
from foo_3
where consecutive_numbers != 0
and consecutive_numbers >= 3


