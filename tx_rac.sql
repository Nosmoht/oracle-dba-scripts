set lines 240
col username format a30
col machine format a40
col status format a10

SELECT s.sid ,
  s.serial# ,
  s.inst_id,
  s.username ,
  s.machine ,
  s.status ,
  s.lockwait ,
  t.used_ublk ,
  t.used_urec ,
  t.start_time
FROM gv$transaction t
INNER JOIN gv$session s
ON t.inst_id = s.inst_id and t.addr = s.taddr;
