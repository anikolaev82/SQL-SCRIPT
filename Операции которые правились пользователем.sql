select class_id
      ,short_name
      ,row_number() over(partition by trunc(modified) order by modified desc) row_num
      ,name
      ,modified
      ,user_modified
      ,created
      ,user_created
      ,status
      ,result_class_id
      ,flags  type_operation
from methods
where user_modified = 'user_login'
order by modified  desc, created desc, row_num

