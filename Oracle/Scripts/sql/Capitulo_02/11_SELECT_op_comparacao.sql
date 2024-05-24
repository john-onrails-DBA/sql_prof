--*** Recuperando linhas especificas da tabela EMPLOYEES

-- Filtrando com operador de igualdade
SELECT  *
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID = 10;

-- Filtrando com operador de maior
SELECT  *
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID > 10;

-- Filtrando com operador de maior ou igual
SELECT  *
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID >= 10;

-- Filtrando com operador de menor
SELECT  *
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID < 10;

-- Filtrando com operador de menor ou igual
SELECT  *
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID <= 10;

-- Filtrando com operador diferente
SELECT  *
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID <> 10;

-- Filtrando com operador between
SELECT  *
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID BETWEEN 10 AND 30;

-- Filtrando com operador IN
SELECT  *
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID IN (10, 30, 40);

-- Filtrando com operador LIKE
SELECT  *
FROM    HR.EMPLOYEES
WHERE   FIRST_NAME LIKE 'J%';

-- Filtrando com operador IS NULL
SELECT  *
FROM    HR.EMPLOYEES
WHERE   COMMISSION_PCT IS NULL;