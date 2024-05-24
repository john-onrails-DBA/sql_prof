/*
Permite gerar um conjunto de comandos para atribuir todos os privilégios possíveis em todos os objetos de um determinado schema.
Possui os parâmetros OWNER e USER_NAME. Se desejar apenas recuperar todos os privilégios possíveis dos objetos de um schema forneça o mesmo valor para os 2 parâmetros. Se além de recuperar for desejado atribuir os privilégios para outro usuário, forneça o nome do usuário correspondente para o parâmetro USER_NAME.
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