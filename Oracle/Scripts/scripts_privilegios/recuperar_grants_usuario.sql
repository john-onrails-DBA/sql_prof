/*
 Permite recuperar todos os privil�gios de objeto, sistema e roles de um usu�rio e, se desejado, atribuir os privil�gios para outro usu�rio. 
 �til para clonar privil�gios de usu�rios. 
 Possui os par�metros USUARIO_ORIGEM e USUARIO_DESTINO. Para somente recuperar os privil�gios de um determinado usu�rio, forne�a o mesmo nome de usu�rio para os 2 par�metros.
*/
undefine USUARIO_ORIGEM;
undefine USUARIO_DESTINO;

SELECT  'GRANT ' || LOWER(privilege) || ' ON ' || LOWER(OWNER || '.' || table_name) ||
        ' TO ' || LOWER('&&USUARIO_DESTINO') || DECODE(grantable, 'YES', ' WITH grant OPTION') || ';' "SQL"
FROM dba_TAB_privs
WHERE grantee = UPPER('&&USUARIO_ORIGEM')
union all
SELECT  'GRANT ' || LOWER(privilege) || ' TO ' || LOWER('&&USUARIO_DESTINO') 
        || DECODE(ADMIN_OPTION, 'YES', ' WITH ADMIN OPTION') || ';' "SQL"
FROM  dba_SYS_privs
WHERE grantee = UPPER('&&USUARIO_ORIGEM')
union all
SELECT  'GRANT ' || LOWER(GRANTED_ROLE) || ' TO ' || LOWER('&&USUARIO_DESTINO') 
        || DECODE(ADMIN_OPTION, 'YES', ' WITH ADMIN OPTION') || ';' "SQL"
FROM dba_ROLE_privs
WHERE grantee = UPPER('&&USUARIO_ORIGEM')
ORDER BY 1;

