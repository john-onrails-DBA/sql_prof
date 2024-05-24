/*
Permite recuperar todos os privilégios que os usuários possuem sobre ou mais objetos de banco de dados.
              Possui os parâmetros SCHEMA_NAME e TABLE_NAME, que permitem filtrar por nome do schema e/ou nome do objeto. Se não desejar utilizar algum dos parâmetros de filtro, não forneça valor para eles quando for solicitado, ao executar o script.
*/
SELECT  'GRANT ' || LOWER(privilege) || ' ON ' || LOWER(owner || '.' || table_name) ||
        ' TO ' || LOWER(grantee) || DECODE(grantable, 'YES', ' WITH grant OPTION') || ';' "SQL"
FROM      DBA_TAB_PRIVS
WHERE     OWNER = NVL(UPPER('&SCHEMA_NAME'), OWNER)
AND       table_name = NVL(UPPER('&TABLE_NAME'),TABLE_NAME)
ORDER BY 1;