SET lines 240 col owner for a30 col tablespace_name for a30 col segment_Type for a20 col mb FOR 99999999
SELECT owner,
  tablespace_name,
  segment_type,
  SUM(bytes)/1024/1024 AS mb
FROM dba_segments
GROUP BY owner,
  tablespace_name,
  segment_type
ORDER BY owner,
  tablespace_name,
  segment_type;