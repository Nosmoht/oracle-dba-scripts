set lines 240 feedback on
col owner format a30
col index_name format a30
col status format a10
col tablespace_name format a30
col partition_name format a30
col subpartition_name format a30
SELECT i.owner,
  i.index_name,
  i.status,
  i.tablespace_name,
  NULL AS partition_name,
  NULL AS subpartition_name
FROM dba_indexes i
WHERE i.status NOT IN ('VALID', 'N/A')
UNION ALL
SELECT ip.index_owner,
  ip.index_name,
  ip.status,
  ip.tablespace_name,
  ip.partition_name,
  NULL AS subpartition_name
FROM dba_ind_partitions ip
WHERE ip.status NOT IN ('USABLE', 'N/A')
UNION ALL
SELECT sp.index_owner,
  sp.index_name,
  sp.status,
  sp.tablespace_name,
  sp.partition_name,
  sp.subpartition_name
FROM dba_ind_subpartitions sp
WHERE sp.status NOT IN ('USABLE','N/A')
ORDER BY 1,2;
