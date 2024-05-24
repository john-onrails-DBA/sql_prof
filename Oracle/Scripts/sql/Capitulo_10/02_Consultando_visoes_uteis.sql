-- Entre com o usuario HR e execute as consultas abaixo:

-- Consultando tabelas
SELECT * FROM USER_TABLES;
SELECT * FROM ALL_TABLES;
SELECT * FROM ALL_TABLES WHERE OWNER = 'HR';
SELECT * FROM DBA_TABLES;

-- Consultando colunas de tabelas
SELECT * FROM USER_tab_columns WHERE table_name = 'EMPLOYEES';
SELECT * FROM ALL_tab_columns WHERE OWNER = 'HR' AND table_name = 'EMPLOYEES';

-- Consultando indices
SELECT      i.owner, i.index_name, i.index_type,
            i.table_owner, i.table_name, c.column_name
FROM        all_indexes i 
iNNER JOIN  all_ind_columns c
    on      i.owner = c.index_owner
    and     i.index_name = c.index_name
WHERE       i.oWNER = 'HR' AND i.TABLE_NAME = 'EMPLOYEES';

-- Consultando constraints de tabelas
SELECT * FROM all_constraints WHERE OWNER = 'HR' AND TABLE_NAME = 'EMPLOYEES';

-- Consultando visoes
SELECT * FROM all_views WHERE OWNER = 'HR';

-- Consultando sequencias
SELECT * FROM all_sequences WHERE sequence_oWNER = 'HR';

-- Consultando sinonimos
SELECT * FROM ALL_synonyms;


