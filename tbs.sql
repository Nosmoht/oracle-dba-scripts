COL "Tablespace" for a22
COL "Used MB" for 99,999,999
COL "Free MB" for 99,999,999
COL "Total MB" for 99,999,999
SET PAGES 100 LINES 80

SELECT df.tablespace_name "Tablespace",
  totalusedspace "Used MB",
  (df.totalspace - tu.totalusedspace) "Free MB",
  df.totalspace "Total MB",
  ROUND(100 * ( (df.totalspace - tu.totalusedspace)/ df.totalspace)) "Pct. Free"
FROM
  (SELECT tablespace_name,
    ROUND(SUM(DECODE(autoextensible, 'YES', maxbytes, bytes)) / 1048576) TotalSpace
  FROM dba_data_files
  GROUP BY tablespace_name
  ) df
LEFT OUTER JOIN
  (SELECT ROUND(SUM(bytes)/(1024*1024)) totalusedspace,
    tablespace_name
  FROM dba_segments
  GROUP BY tablespace_name
  ) tu
ON(df.tablespace_name = tu.tablespace_name)
ORDER BY df.tablespace_name;

