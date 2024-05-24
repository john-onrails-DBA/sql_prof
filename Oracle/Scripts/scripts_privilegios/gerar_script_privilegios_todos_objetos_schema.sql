/*
Permite gerar um conjunto de comandos para atribuir todos os privil�gios poss�veis em todos os objetos de um determinado schema.
Possui os par�metros OWNER e USER_NAME. Se desejar apenas recuperar todos os privil�gios poss�veis dos objetos de um schema forne�a o mesmo valor para os 2 par�metros. Se al�m de recuperar for desejado atribuir os privil�gios para outro usu�rio, forne�a o nome do usu�rio correspondente para o par�metro USER_NAME.
*/                        
undefine OWNER;
undefine USER_NAME;
DEFINE OWNER='&_OWNER'
DEFINE USER_NAME='&_USERNAME'

select  'GRANT SELECT, INSERT, UPDATE, DELETE ON ' || owner || '.' || object_name || ' TO &&USER_NAME;'
from    dba_objects o
where   owner = UPPER('&&owner')
and     object_type = 'TABLE'
and     (owner, object_name) not in (select owner, mview_name from dba_mviews m where m.owner = o.owner)
union all
select  'GRANT SELECT ON ' || owner || '.' || object_name || ' TO &&USER_NAME;'
from    dba_objects
where   owner = UPPER('&&owner')
and     object_type IN ('VIEW','MATERIALIZED VIEW')
UNION ALL
select  'GRANT SELECT ON ' || owner || '.' || object_name || ' TO &&USER_NAME;'
from    dba_objects
where   owner = UPPER('&&owner')
and     object_type = 'SEQUENCE'
union all
select  'GRANT EXECUTE ON ' || owner || '.' || object_name || ' TO &&USER_NAME;'
from    dba_objects
where   owner = UPPER('&&owner')
and     object_type in ('PROCEDURE','PACKAGE')