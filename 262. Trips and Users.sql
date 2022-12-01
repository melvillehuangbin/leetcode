with cte as (
    select
        t.request_at,
        t.status,
        u1.banned as client_banned,
        u2.banned as driver_banned
    from
        Trips t
        left join Users u1 on t.client_id = u1.users_id
        left join Users u2 on t.driver_id = u2.users_id
    where u1.banned <> "Yes"
    and u2.banned <> "Yes"
)


select
    request_at as Day,
    round(sum(case when status like "%cancelled%" then 1 else 0 end)/count(status), 2) as "Cancellation Rate"
from cte
where request_at between '2013-10-01' and '2013-10-03'
group by request_at


