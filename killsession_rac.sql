SET LINES 240
SET HEADING OFF ECHO OFF FEEDBACK ON TIMING OFF

SELECT 'ALTER SYSTEM KILL SESSION '''
  || sid
  || ','
  || serial#
  || ',@'
  || inst_id
  || ''';'
FROM gv$session
WHERE username = '&USERNAME.';

