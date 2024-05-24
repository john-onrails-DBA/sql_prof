BEGIN
-- reconstrói índices de um schema em um tablespace indicado (exceto LOB, IOT e DOMAIN)
-- é necessário que o dono schema tenha privilégios de gravação no tablespace indicado
    dbms_output.enable(null);
    --alter index <index_name> rebuild tablespace <new_tablespace> online nologging:
    FOR cur_tab IN (select  'ALTER INDEX ' || OWNER || '.' || INDEX_NAME || ' REBUILD ONLINE nologging TABLESPACE &NOVO_TABLESPACE_NAME' CMD,
                            OWNER,
                            INDEX_NAME
                    FROM    DBA_INDEXES
                    WHERE   OWNER = UPPER('&SCHEMA_NAME')
                     AND     index_type NOT IN ('IOT - TOP','LOB','DOMAIN')) LOOP
        EXECUTE IMMEDIATE cur_tab.CMD;
        dbms_output.put_line(cur_tab.OWNER || '.' || cur_tab.INDEX_NAME || ' reconstruÃ­do!');
    END LOOP;
END;