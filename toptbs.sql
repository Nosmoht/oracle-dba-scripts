SET linesize  1024
SET trimspool  ON
SET trimspool OFF
SET pages    3000
SET echo      OFF
SET feedback  OFF
 
COLUMN ts_name format  a30                HEAD "Tablespace"  
column datafile format a60                HEAD "Datafile"
COLUMN stat_reads format   99,99,99,99,999 HEAD "Phys Reads"
COLUMN stat_writes format  99,99,99,99,999 HEAD "Phys Writes"
COLUMN stat_breads format  99,99,99,99,999 HEAD "Phys Blk Reads"
COLUMN stat_bwrites format 99,99,99,99,999 HEAD "Phys Blk Writes"
BREAK ON ts_name
 
SELECT   t.name ts_name,
         f.name datafile,
         s.phyrds stat_reads,
         s.phyblkrd stat_breads,
         s.phywrts stat_writes,
         s.phyblkwrt stat_bwrites
FROM     v$tablespace t, v$datafile f, v$filestat s
WHERE    t.ts# = f.ts#
AND      f.file# = s.file#
ORDER BY s.phyrds DESC, s.phywrts DESC;

