SET lines 240 col tablespace_name FOR a30 col block_size FOR 99999 col max_size_gb FOR 9999 col contents FOR a12 col allocation_type for a10 col ssm for a10;

SELECT tablespace_name,
  block_size,
  round((max_size * block_size)/1024/1024/1024) AS max_size_gb,
  contents, logging, allocation_type, segment_space_management as ssm
FROM dba_tablespaces
order by tablespace_name;

select