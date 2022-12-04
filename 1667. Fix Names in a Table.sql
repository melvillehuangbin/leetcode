# Write your MySQL query statement below
select
    user_id,
    concat(upper(substring(name, 1, 1)), lower(substring(lower(name), 2, character_length(name)-1))) as name
from Users       
order by user_id