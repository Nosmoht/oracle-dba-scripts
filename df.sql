set lines 240
col file_name format a80
col tablespace_name format a30

select 
	file_name, 
	tablespace_name, 
	bytes, 
	maxbytes, 
	case when maxbytes <> 0 then round(bytes/maxbytes*100) else 0 end as pct_used
from dba_data_files;
