
with recursive cte (a) as (
    select 1 union all
    select a + 1 from cte where a < 10
)
select * from cte;

# Error Code: 3636. Recursive query aborted after 1001 iterations.
# Try increasing @@cte_max_recursion_depth to a larger value.
with recursive t (a) as (
    select 1 union all
    select a + 1 from t
)
select * from t;

with recursive cte (accum) as (
    select 1 union all
    select accum + 1 from cte where accum < 50
)
select accum from cte;

-- factorial
with recursive f (fact, num) as (
    select 1, 5 union all
    select fact * num, num - 1 from f where num > 1
)
select fact, num from f order by fact desc limit 1;
