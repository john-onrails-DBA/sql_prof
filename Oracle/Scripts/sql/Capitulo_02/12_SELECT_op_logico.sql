--*** Recuperando linhas especificas da tabela EMPLOYEES

-- utilizando operador logico AND
SELECT  *
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID = 60
AND     JOB_ID = 'IT_PROG';

-- utilizando operador logico OR
SELECT  *
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID = 60
OR      JOB_ID = 'IT_PROG';

-- utilizando operador logico NOT
SELECT  *
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID = 60
AND     COMMISSION_PCT IS NOT NULL;

SELECT  *
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID NOT IN (10, 30);

