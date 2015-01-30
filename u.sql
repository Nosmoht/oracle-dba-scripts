set lines 240

col username format a30
col account_status format a16
col default_tablespace for a30
col temporary_tablespace for a30
select username, account_status, default_tablespace, temporary_tablespace from dba_users order by username;