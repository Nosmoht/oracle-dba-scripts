SET LINES 240
SET HEADING OFF ECHO OFF FEEDBACK ON TIMING OFF

SELECT 'ALTER SYSTEM KILL SESSION '''
  || sid
  || ','
  || serial#
  || ''';'
FROM v$session
WHERE username = '&USERNAME.';

