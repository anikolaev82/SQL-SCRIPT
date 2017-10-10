select distinct 
        sess.sid
       ,sess.username
       ,sess.osuser
       ,sess.LOCKWAIT
       ,sess.STATUS
       ,sess.schemaname
       ,listagg(sql_curr.SQL_TEXT) WITHIN GROUP (order by sql_curr.piece) over(partition by sql_curr.SQL_ID)
       ,obj.object_name
       ,obj.object_type
       ,sess.PROCESS
       ,sess.MACHINE
       ,sess.PORT
       ,sess.TERMINAL
       ,sess.PROGRAM
       ,sess.MODULE
       ,sess.SQL_ID
       ,sess.PREV_SQL_ID
       ,sess.ROW_WAIT_OBJ#
       ,sess.ROW_WAIT_ROW#
       ,sess.ROW_WAIT_FILE#
       ,sess.ROW_WAIT_BLOCK#
       ,sess.BLOCKING_SESSION_STATUS
       ,sess.STATE
       ,sess.SECONDS_IN_WAIT
       ,sess.WAIT_TIME
       ,sess.WAIT_TIME_MICRO
from v$session sess, v$sqltext sql_curr, all_objects obj
where      sess.SQL_ID = sql_curr.SQL_ID(+) 
       and sess.ROW_WAIT_OBJ# = obj.object_id(+) 
       and osuser = 'anikolaev'

