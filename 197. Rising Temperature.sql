# Write your MySQL query statement below


with prev_temp as (
    select
        id,
        recordDate,
        recordDate - interval '1' day as prevDate,
        temperature
    from Weather
    order by recordDate asc 
),

temp_diff as (
    select
        id,
        temperature,
        (case
            when datediff(recordDate, lag(recordDate) over(order by recordDate asc)) = 1 then lag(temperature) over(order by recordDate asc)
            else "no previous temperature"
        end) as prev_temperature
    from prev_temp
)

select
    id
from temp_diff
where temperature > prev_temperature
and prev_temperature != "no previous temperature"
