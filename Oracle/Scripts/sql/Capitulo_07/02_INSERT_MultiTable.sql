--CRIACAO DE TABELAS CLONE: CONDICAO WHERE 1=2 PARA QUE SEJA COPIADA SOMENTE A ESTRUTURA DA TABELA ORIGINAL
-- TRUNCATE TABLE HR.EMP2;
CREATE TABLE HR.EMP2 AS SELECT * FROM HR.EMPLOYEES WHERE 1=2;
CREATE TABLE HR.EMP3 AS SELECT * FROM HR.EMPLOYEES WHERE 1=2;
CREATE TABLE HR.EMP4 AS SELECT * FROM HR.EMPLOYEES WHERE 1=2;

--2: INSERT MULTITABLE: inserindo dados em 3 tabelas diferentes conforme condicoes previamente testadas
INSERT FIRST
   WHEN salary > 10000 THEN INTO hr.emp2 
            VALUES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
   WHEN manager_id > 200 THEN INTO hr.emp3 
            VALUES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
   ELSE INTO hr.emp4 
            VALUES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
SELECT  *
FROM    hr.employees;    
COMMIT;

-- conferindo qtde de linhas inseridas em cada tabela
SELECT COUNT(1) FROM HR.EMP2
UNION ALL 
SELECT COUNT(1) FROM HR.EMP3
UNION ALL 
SELECT COUNT(1) FROM HR.EMP4;

    