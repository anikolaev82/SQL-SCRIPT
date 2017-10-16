select distinct 
        sess.sid
       ,sess.username
       ,sess.osuser
       ,sess.PROCESS
       ,sess.MACHINE
       ,sess.TERMINAL
       ,sess.PROGRAM
       ,sess.STATUS
       ,blocker.sid blocker
       ,blocked.sid blocked
       ,blocker.lmode --удерживает блокировку если не (0, 1)
       ,blocker.request --запрашивает блокировку если не (0, 1)
       ,blocker.block  --блокирует ресурс
     --  ,dbalock.mode_held --Режим блокировки. 
            /*Режим блокировки:1 (null),
                               2 (row share), 3 (row exclusive),
                               4 (share), 5 (share row exclusive),
                               6 (exclusive)*/
      -- ,listagg(sql_curr.SQL_TEXT) WITHIN GROUP (order by sql_curr.piece) over(partition by sql_curr.SQL_ID)
       ,obj.object_name
       ,obj.object_type
       ,sess.SQL_ID
       ,sess.PREV_SQL_ID
       ,sess.ROW_WAIT_OBJ#
       ,sess.ROW_WAIT_ROW#
       ,sess.SECONDS_IN_WAIT
from  v$session sess
     ,v$sqltext sql_curr
     ,all_objects obj
     ,DBA_LOCKS dbalock
     ,v$lock blocker --кто блокирует
     ,v$lock blocked --кого блокируют
     ,v$session_wait sesswait
where      sess.SQL_ID = sql_curr.SQL_ID(+) 
       and sess.ROW_WAIT_OBJ# = obj.object_id(+) 
       and sess.SID = dbalock.session_id
       and sess.sid = blocker.sid
       and blocker.type = 'TX'
       and blocked.type = 'TX'
       and (blocker.id2 = blocked.id2 and  blocker.id1 = blocked.id1 )
       and sess.sid = sesswait.SID
order by blocker.block desc, blocker.lmode, osuser

