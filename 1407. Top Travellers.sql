# Write your MySQL query statement below

###### solution 1 ###### 

select
    t1.name,
    coalesce(t2.travelled_distance, 0) travelled_distance
from 
    Users t1
    left join (
        select
            user_id,
            sum(distance) as travelled_distance
        from Rides
        group by user_id
    ) t2 on t1.id = t2.user_id
order by t2.travelled_distance desc, t1.name asc

###### solution 2 ######
select
    t1.name,
    ifnull(sum(t2.distance), 0) travelled_distance
from
    Users t1
    left join Rides t2 on t1.id = t2.user_id
group by t1.id
order by travelled_distance desc, name asc