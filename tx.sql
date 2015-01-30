set lines 240
col username format a30
col machine format a40
col status format a10

SELECT s.sid ,
  s.serial# ,
  s.username ,
  s.machine ,
  s.status ,
  s.lockwait ,
  t.used_ublk ,
  t.used_urec ,
  t.start_time
FROM v$transaction t
INNER JOIN v$session s
ON t.addr = s.taddr;
