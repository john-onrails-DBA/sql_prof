-- retorna total de empregados
SELECT  COUNT(*)
FROM    HR.EMPLOYEES;

-- retorna total de empregados do departamento 100 (* , literal e nome de coluna)
SELECT  COUNT(*)
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID = 100;

SELECT  COUNT(1)
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID = 100;

SELECT  COUNT(EMPLOYEE_ID)
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID = 100;

-- para evitar resultados inesperados, trate os valores nulos 
SELECT  COUNT(COMMISSION_PCT) 
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID = 100;

SELECT  COUNT(NVL(COMMISSION_PCT,0)) 
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID = 100;

