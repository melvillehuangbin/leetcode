# Write your MySQL query statement below

# every odd number use lead
# every even number use lag


with foo as(
    select t.max_id 
    from (
        select 
            max(id) as max_id
        from Seat
    ) t
    where t.max_id % 2 = 1
)

select
    id,
    (case
        when id = (select max_id from foo) then student
        when id % 2 = 0 then lag(student) over(order by id)
        when id % 2 = 1 then lead(student) over(order by id)
    end) as student
from Seat