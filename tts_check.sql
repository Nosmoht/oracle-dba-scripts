EXECUTE SYS.DBMS_TTS.TRANSPORT_SET_CHECK('&TBS_LIST.', TRUE);

SELECT * FROM SYS.TRANSPORT_SET_VIOLATIONS;
