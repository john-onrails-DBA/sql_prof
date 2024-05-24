-- consultando privilegios de sistema da role DBA
select  ROLE, PRIVILEGE
from    ROLE_SYS_PRIVS
WHERE   ROLE = 'DBA';

-- recuperar todos os privilegios de objeto, sistema e roles de um usuario
undefine USUARIO
SELECT  'GRANT ' || LOWER(privilege) || ' ON ' || LOWER(OWNER || '.' || table_name) ||
        ' TO ' || GRANTEE || DECODE(grantable, 'YES', ' WITH grant OPTION') || ';' "SQL"
FROM dba_TAB_privs
WHERE grantee = UPPER('&&USUARIO')
union all
SELECT  'GRANT ' || LOWER(privilege) || ' TO ' || LOWER(grantee)
        || DECODE(ADMIN_OPTION, 'YES', ' WITH ADMIN OPTION') || ';' "SQL"
FROM  dba_SYS_privs
WHERE grantee = UPPER('&&USUARIO')
union all
SELECT  'GRANT ' || LOWER(GRANTED_ROLE) || ' TO ' || LOWER(GRANTEE) 
        || DECODE(ADMIN_OPTION, 'YES', ' WITH ADMIN OPTION') || ';' "SQL"
FROM dba_ROLE_privs
WHERE grantee = UPPER('&&USUARIO')
ORDER BY 1;

-- atribua privilegio de SELECT na tabela HR.EMPLOYEES para o usuario ECOMMERCE
GRANT SELECT ON HR.EMPLOYEES TO ECOMMERCE;

/*
recuperar todos os privilegios que os usuarios possuem sobre ou mais objetos de banco de dados.
Possui os parametros SCHEMA_NAME e TABLE_NAME, que permitem filtrar por nome do schema e/ou nome do objeto. Se nao desejar utilizar algum dos parametros de filtro, nao forneça valor para eles quando for solicitado, ao executar o script.
*/
SELECT  'GRANT ' || LOWER(privilege) || ' ON ' || LOWER(owner || '.' || table_name) ||
        ' TO ' || LOWER(grantee) || DECODE(grantable, 'YES', ' WITH grant OPTION') || ';' "SQL"
FROM      DBA_TAB_PRIVS
WHERE     OWNER = NVL(UPPER('&SCHEMA_NAME'), OWNER)
AND       table_name = NVL(UPPER('&TABLE_NAME'),TABLE_NAME)
ORDER BY 1;



