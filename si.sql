set lines 240
col sid format 9999
col serial# format 999999
col username format a30
col state format a17
col module format a30
col action format a32
col client_info format a30

define USERNAME = &USERNAME

select s.sid, s.serial#, s.username, s.state, s.module, s.action, s.client_info 
from v$session s where nvl2('&USERNAME.', s.username, -1) = nvl2('&USERNAME.', '&USERNAME.', -1);
