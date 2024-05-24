-- c) Conceda privilegios de INSERT, UPDATE e SELECT nas tabelas do usuario RH p/ o usuario RHAPP.

-- descobrir quais sao as tabelas do usuario RH:
SELECT * FROM DBA_TABLES WHERE OWNER = 'RH';

GRANT INSERT, UPDATE, SELECT ON RH.DEPARTAMENTOS TO RHAPP;
GRANT INSERT, UPDATE, SELECT ON RH.EMPREGADOS TO RHAPP;

--Testando com o Usuario "RHAPP"
select * from rh.departamentos;
select * from rh.empregados;