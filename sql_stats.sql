set lines 240

col inst_id format 99 head 'Inst'
col child_number format 99 head 'Child|Number'
col executions format 999999999 head 'executions'
col disk_reads format 999999999 head 'disk reads'
col avg_disk_reads format 99999 head 'disk reads|(avg)'
col buffer_gets format 999999999 head 'buffer gets'
col avg_buffer_gets format 99999 head 'buffer gets|(avg)'
col rows_processed format 999999999 head 'rows processed'
col avg_rows_processed format 99999 head 'rows processes|(avg)'
col user_io_wait_time format 999999 head 'user io|wait time'
col avg_user_io_wait format 99999 head 'user io|wait time (avg)'

SELECT s.inst_id,
  s.child_number,
  s.executions,
  s.disk_reads,
  ROUND(s.disk_reads/s.executions) AS avg_disk_reads,
  s.buffer_gets,
  ROUND(s.buffer_gets/s.executions) AS avg_buffer_gets,
  s.rows_processed,
  ROUND(s.rows_processed/s.executions) AS avg_rows_processed,
  s.user_io_wait_time,
  ROUND(s.user_io_wait_time/s.executions) AS avg_user_io_wait
FROM gv$sql s
WHERE s.sql_id = '&SQL_ID.'
ORDER BY s.executions DESC,
  s.child_number,
  s.inst_id;
