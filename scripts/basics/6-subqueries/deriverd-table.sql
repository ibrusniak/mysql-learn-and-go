
select
    d.num
from
    (select 2 num) d;

select
    *
from
    (select 2 num, 'dt1' tabname) dt1
    left join
    (select 2 num, 'dt2' tabname) dt2 using (num)
    left join
    (select 3 num, 'dt3' tabname) dt3 using (num)
    left join
    (select 2 num, 'dt4' tabname union all
    select 2, 'dt4') dt4 using(num);

select
    dt1.n
from (
    select
        n
    from (
        select
            n
        from (
            select
                n
            from
                (select 2 n) dt4
            ) dt3
        ) dt2
    ) dt1;


