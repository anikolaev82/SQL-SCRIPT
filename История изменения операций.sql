select m.class_id
      ,m.short_name
      ,row_number() over(partition by dm.modified order by dm.modified desc) row_num
      ,m.name
      ,lag(dm.user_modified, 1) over(order by dm.modified) prev_user
      ,lead(dm.user_modified, 1) over(order by dm.modified) next_user
      ,lead(dm.modified, 1) over(order by dm.modified) prev_modified
      ,lag(dm.modified, 1) over(order by dm.modified) next_modified
      ,lead(dm.modified, 1) over(order by dm.modified) - lag(dm.modified, 1) over(order by dm.modified) date_diff
      ,count(dm.method_id) ucompile
      ,dm.user_modified
      ,dm.modified
      ,m.status
      ,m.result_class_id
      ,m.flags  type_operation
      ,m.created
      ,m.user_created
from  methods m
     ,(
         select trunc(time) modified
               ,substr(user_id, 5) user_modified
               ,method_id method_id
               ,action
         from diary_methods 
      ) dm
where m.id = dm.method_id and 
      dm.action = 'COMPILE' and 
--    m.class_id = 'class_name' and 
--    m.short_name = 'name_operation' 
--    and dm.user_modified = 'user_login'
group by m.class_id
      ,m.short_name
      ,m.name
      ,m.created
      ,m.user_created
      ,m.status
      ,m.result_class_id
      ,m.flags
      ,dm.user_modified
      ,dm.modified
order by dm.modified  desc, created desc, row_num


