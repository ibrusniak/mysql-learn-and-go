
use bitrix_79;

set @date_start = '2021-08-01 00:00:00';
set @date_end = '2021-08-31 23:59:59';


select
    tasks.id `ID`,
    tasks.title `Title`,
    g.`name` `Group name`,
    tasks.created_date `Created date`,
    el.created_date `Elapsed created date`,
    el.seconds `Elapsed seconds`,
    el.minutes `Elapsed minutes`,
    concat(users_3.`name`, ' ', users_3.last_name) `Elapsed user full name`
from
    b_tasks tasks
    inner join b_sonet_group g on tasks.group_id = g.id
    inner join b_user users_1 on tasks.created_by = users_1.id
    inner join b_user users_2 on tasks.responsible_id = users_2.id
    inner join b_tasks_elapsed_time el on tasks.id = el.task_id
    inner join b_user users_3 on el.user_id = users_3.id
where
    el.created_date between @date_start and @date_end
    and
    el.user_id in (789, 1657, 1658, 1672, 1748, 1754)
order by
    tasks.id,
    el.created_date;


