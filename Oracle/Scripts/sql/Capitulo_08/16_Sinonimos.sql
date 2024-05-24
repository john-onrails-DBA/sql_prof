-- criando um sinonimo publico p/ a tabela HR.DEPARTMENTS:
CREATE PUBLIC SYNONYM DEP FOR HR.DEPARTMENTS;

-- acessando a tabela HR.DEPARTMENTS atraves do sinonimo criado no passo anterior
SELECT * FROM DEP;

-- criando um sinonimo privado p/ a tabela HR.EMPLOYEES:
CREATE SYNONYM EMP FOR HR.EMPLOYEES;

-- a instrucao SQL abaixo acessara dados de qual tabela?
SELECT * FROM EMP;

-- apagando um sinonimo publico
DROP PUBLIC SYNONYM DEP;

-- apagando um sinonimo privado
DROP SYNONYM EMP;
