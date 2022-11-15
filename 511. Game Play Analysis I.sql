# Write your MySQL query statement below

# window function approach
select
    t1.player_id,
    t1.event_date as first_login
from (
    select
        player_id,
        event_date,
        row_number() over(partition by player_id order by event_date asc) as date_rank
    from Activity
) t1
where t1.date_rank = 1

# aggregation approach, faster approach
# select
#     player_id,
#     min(event_date) first_login
# from Activity
# group by player_id