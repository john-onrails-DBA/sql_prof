-- alterando a tabela p/ modo somente leitura
ALTER TABLE hr.dept3 read only;

-- alterando a tabela p/ modo leitura/escrita (modo padrao)
ALTER TABLE hr.dept3 read write;

-- adicionando coluna na tabela
ALTER TABLE hr.emp2 ADD (hiredate DATE);

-- renomeando coluna na tabela
ALTER TABLE hr.emp2 rename column hiredate to hire_date;

-- removendo coluna na tabela
ALTER TABLE hr.emp2 drop column hire_date;

-- criando constraint em uma tabela ja existente
ALTER TABLE hr.dept3 modify dname NOT NULL;

-- removendo constraint
alter table HR.dept2 drop constraint CK_DEPT2_LOC;

