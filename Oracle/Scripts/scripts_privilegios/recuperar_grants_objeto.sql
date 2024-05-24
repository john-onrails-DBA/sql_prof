/*
Permite recuperar todos os privil�gios que os usu�rios possuem sobre ou mais objetos de banco de dados.
              Possui os par�metros SCHEMA_NAME e TABLE_NAME, que permitem filtrar por nome do schema e/ou nome do objeto. Se n�o desejar utilizar algum dos par�metros de filtro, n�o forne�a valor para eles quando for solicitado, ao executar o script.
*/
SELECT  'GRANT ' || LOWER(privilege) || ' ON ' || LOWER(owner || '.' || table_name) ||
        ' TO ' || LOWER(grantee) || DECODE(grantable, 'YES', ' WITH grant OPTION') || ';' "SQL"
FROM      DBA_TAB_PRIVS
WHERE     OWNER = NVL(UPPER('&SCHEMA_NAME'), OWNER)
AND       table_name = NVL(UPPER('&TABLE_NAME'),TABLE_NAME)
ORDER BY 1;