select class_id, id, short_name, name, created, user_created, modified, user_modified, status, result_class_id, flags  type_operation
from methods
where user_modified = 'anikolaev'
order by modified desc

