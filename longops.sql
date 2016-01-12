SET LINES 240

SELECT opname,
  username,
  TO_CHAR(start_time,'DD-MON-YYYY HH24:MI:SS') start_time,
  (sofar/totalwork)*100 AS pct,
  time_remaining
FROM v$session_longops
WHERE time_remaining>0;

