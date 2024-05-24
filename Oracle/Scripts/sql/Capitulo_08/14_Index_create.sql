-- criando um indice b-tree p/ otimizar consultas com filtro na coluna HIRE_DATE
CREATE INDEX HR.IX_EMPLOYEES_HIREDATE ON HR.EMPLOYEES(HIRE_DATE);

-- criando um indice BITMAP p/ otimizar consultas com filtro na coluna SEXO
alter table hr.employees add sexo char(1) constraint CK_EMPLOYEES_SEXO check (sexo in ('F','M'));
-- *** o comando abaixo soh funciona em Oracle Enterprise Edition *** :
CREATE BITMAP INDEX HR.IX_EMPLOYEES_SEXO ON HR.EMPLOYEES(SEXO);