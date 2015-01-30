set lines 240
col inst_id format 99
col sid format 999999
col serial# format 999999
col state format a10
col instance_name format a8
col username format a30
col machine format a30
col osuser format a10
col program format a20
SELECT 
  s.inst_id,
  s.sid,
  s.serial#,
  DECODE(l.block,0,'Blocking','Waiting') AS state,
  l.ctime,
  (SELECT i.instance_name FROM gv$instance i WHERE i.inst_id=l.inst_id
  ) AS instance_name,
  s.username,
  s.osuser,
  s.machine,
  s.program,
  DECODE (l.TYPE,'RT', 'Redo Log Buffer','TD', 'Dictionary' ,'TM', 'DML','TS', 'Temp Segments','TX', 'Transaction' ,'UL', 'User','RW', 'Row Wait',l.TYPE) lock_type,
  DECODE (l.lmode,0, 'None',1, 'Null',2, 'Row Share',3, 'Row Excl.' ,4, 'Share',5, 'S/Row Excl.',6, 'Exclusive' ,LTRIM (TO_CHAR (lmode, '990'))) lock_mode,
  o.owner
  || '.'
  || o.object_name AS object_name
FROM gv$lock l
JOIN gv$session s
ON (s.inst_id =l.inst_id
AND s.sid     =l.sid)
JOIN gv$locked_object lo
ON (lo.inst_id = l.inst_id
AND l.sid      =lo.session_id)
JOIN dba_objects o
ON (lo.object_id = o.object_id)
WHERE --s.username IS NOT NULL AND
 (l.id1, l.id2, l.TYPE) IN
  (SELECT id1, id2, TYPE FROM gv$lock WHERE request > 0
  )
ORDER BY l.block;
