-- retorna valor total de salarios dos empregados
SELECT  SUM(SALARY)
FROM    HR.EMPLOYEES;

-- retorna valor total de salarios dos empregados do departamento 100
SELECT  SUM(SALARY)
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID = 100;

-- retorna valor total de salarios dos empregados, por departamento
SELECT      DEPARTMENT_ID, SUM(SALARY)
FROM        HR.EMPLOYEES
GROUP BY    DEPARTMENT_ID;

-- retorna valor total de salarios dos empregados, por departamento, somente dos departamentos 10 e 100
SELECT      DEPARTMENT_ID, SUM(SALARY)
FROM        HR.EMPLOYEES
WHERE       DEPARTMENT_ID IN (10,100)
GROUP BY    DEPARTMENT_ID;