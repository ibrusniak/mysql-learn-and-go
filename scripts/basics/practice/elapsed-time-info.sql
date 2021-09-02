

-- Tables
-- b_tasks
-- b_tasks_elapsed_time
-- b_sonet_group
-- b_user

use bitrix_79;

set @date_start = '2021-08-01 00:00:00';
set @date_end = '2021-08-31 23:59:59';
set @group_id = 12;
set @suppot_task_name = 'Тех. підтримка (Серпень)';
set @service_task_name = 'Службові витрати часу (Серпень)';
set @task_id = 34783;

select
    tasks.id `ID`,
    tasks.title `Title`,
    tasks.responsible_id `Responsible ID`,
    concat(users_2.`name`, ' ', users_2.last_name) `Responsible full name`,
    tasks.created_by `Created by ID`,
    concat(users_1.`name`, ' ', users_1.last_name) `Created full name`,
    tasks.created_date `Created date`,
    tasks.group_id `Group ID`,
    g.`name` `Group name`,
    el.created_date `Elapsed created date`,
    el.seconds `Elapsed seconds`,
    el.date_start `Elapsed date start`,
    el.date_stop `Elapsed date stop`,
    el.user_id `Elapsed user id`,
    concat(users_3.`name`, ' ', users_3.last_name) `Elapsed athor full name`,
    el.comment_text `Comment`
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


