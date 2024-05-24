/*
 Permite recuperar todos os privilégios de objeto, sistema e roles de um usuário e, se desejado, atribuir os privilégios para outro usuário. 
 Útil para clonar privilégios de usuários. 
 Possui os parâmetros USUARIO_ORIGEM e USUARIO_DESTINO. Para somente recuperar os privilégios de um determinado usuário, forneça o mesmo nome de usuário para os 2 parâmetros.
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

