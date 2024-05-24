--*** Recuperando linhas especificas da tabela EMPLOYEES

-- Filtrando somente empregados que pertencem ao departamento com ID = 10
SELECT  *
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID = 10;

-- Recuperando somente primeiro e ultimo nome dos empregados que possuem o cargo IT_PROG
SELECT  FIRST_NAME, LAST_NAME
FROM    HR.EMPLOYEES
WHERE   JOB_ID = 'IT_PROG';

-- Utilizando filtro com operador logico AND p/ filtrar 2 colunas 
SELECT  FIRST_NAME, LAST_NAME
FROM    HR.EMPLOYEES
WHERE   JOB_ID = 'IT_PROG'
AND     DEPARTMENT_ID = 60;

-- Utilizando filtro com operador logico OR 
SELECT  FIRST_NAME, LAST_NAME, JOB_ID
FROM    HR.EMPLOYEES
WHERE   JOB_ID = 'IT_PROG'
OR      JOB_ID = 'AD_VP';  -- WHERE JOB_ID IN ('IT_PROG', 'AD_VP');