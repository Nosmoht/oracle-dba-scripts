SET pages 3000 
SET LINES  240
SET trimspool ON
SET trimout   ON
 
COLUMN sql_text FORMAT a120 word_wrapped HEAD 'SQL|Text'
COLUMN cpu_time format 999999999         HEAD 'CPU|Time'
COLUMN elapsed_time format 9999999999    HEAD 'Elapsed|Time'
COLUMN disk_reads format 9999999999      HEAD 'Disk|Reads'
COLUMN buffer_gets format 999999999999   HEAD 'Buffer|Gets'
COLUMN rows_processed format 999999999   HEAD 'Rows|Processed'
COLUMN sql_text format a80 HEAD 'SQL text'
 
TTITLE 'SQL-Statements nach CPU-Nutzung'
 
SELECT * FROM 
     (SELECT cpu_time/1000000 cpu_time, 
             elapsed_time/1000000 elapsed_time, 
             disk_reads, 
             buffer_gets, 
             rows_processed,
             sql_id,
             sql_text
      FROM   v$sqlarea 
      ORDER BY cpu_time DESC
) 
WHERE rownum <=25;
