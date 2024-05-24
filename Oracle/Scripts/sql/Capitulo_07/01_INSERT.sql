-- inserindo dados listando todas as colunas
INSERT INTO hr.departments (department_id, department_name, manager_id, location_id)
VALUES                     (290, 'Applications Development', 100, 1700);
commit;

-- omitindo uma coluna (insere NULL) --> nao recomendado
INSERT INTO hr.departments (department_id, department_name, manager_id)
VALUES                     (280, 'Database Administration', 100);
commit;

-- omitindo todas as colunas --> nao recomendado
INSERT INTO hr.departments
VALUES      (300, 'IT Support', NULL, NULL);
commit;

-- consultar departamentos inseridos
select * from hr.departments where department_id IN (280, 290, 300);

-- *** inserindo dados a partir de uma instrucao SELECT
-- a) criando uma tabela clone (vazia) da tabela de departamentos
CREATE TABLE HR.DEP AS SELECT * FROM HR.DEPARTMENTS WHERE 1=0;
-- b) inserindo na tabela clone todos os dados da tabela origem
INSERT INTO HR.DEP (department_id, department_name, manager_id)
SELECT department_id, department_name, manager_id FROM HR.DEPARTMENTS;
COMMIT;

-- *** para inserir valor DEFAULT de colunas basta omitir a coluna na instrucao ou incluir a palavra-chave DEFAULT
ALTER TABLE HR.DEP MODIFY (MANAGER_ID DEFAULT 101);
-- a) inserindo valor default na coluna MANAGER_ID com a palavra-chave DEFAULT
INSERT INTO hr.DEP (department_id, department_name, location_id, manager_id)
VALUES      (400, 'TESTE', null, DEFAULT);
-- confira o valor inserido
SELECT * FROM HR.DEP WHERE department_id = 400;
ROLLBACK;
-- b) inserindo valor default na coluna MANAGER_ID omitindo a coluna na instrucao INSERT
INSERT INTO hr.DEP (department_id, department_name, location_id)
VALUES      (400, 'TESTE', null);
COMMIT;
-- confira o valor inserido
SELECT * FROM HR.DEP WHERE department_id = 400;
