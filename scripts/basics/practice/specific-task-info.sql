

use bitrix_79;

set @task_id = 34783;

select
    b_tasks.id `Task ID`,
    b_tasks.title `Task title`,
    created_by `Created by ID`,
    concat(u1.`name`, ' ', u1.last_name) `Created full name`,
    responsible_id `Responsible ID`,
    concat(u2.`name`, ' ', u2.last_name) `Responsible full name`,
    created_date `Created date`,
    group_id `Group ID`
from
    b_tasks
    inner join b_user u1 on created_by = u1.id
    inner join b_user u2 on responsible_id = u2.id
    
where
    b_tasks.id = @task_id;

