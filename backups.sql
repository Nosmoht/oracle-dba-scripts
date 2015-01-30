SET feedback ON 
set lines 240 
set pages 24
col input_type format a14
col status format a40
col device_type format a14
col start_time format a20 
col end_time format a20 
col run_time format a10
col input_bytes_per_sec format a10
col output_bytes_per_sec format a10
col input_size format a10 
col output_size format a10
SELECT jd.input_type,
  jd.output_device_type AS device_type,
  jd.status,
  TO_CHAR(jd.start_time,'YYYY-MM-DD HH24:MI:SS') AS start_time,
  TO_CHAR(jd.end_time, 'YYYY-MM-DD HH24:MI:SS')  AS end_time,
  jd.time_taken_display                          AS run_time,
  jd.input_bytes_per_Sec_display                 AS input_bytes_per_sec,
  jd.output_bytes_per_sec_display                AS output_bytes_per_sec,
  jd.input_bytes_display                         AS input_size,
  jd.OUTPUT_BYTES_DISPLAY                        AS output_size
FROM V$RMAN_BACKUP_JOB_DETAILS jd
ORDER BY start_time;

select * from v$rman_backup_job_details;