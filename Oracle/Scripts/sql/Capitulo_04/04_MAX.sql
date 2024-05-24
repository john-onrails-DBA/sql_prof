-- retorna o maior salario dos empregados
SELECT  MAX(SALARY)
FROM    HR.EMPLOYEES;

-- retorna o maior salario dos empregados, por departamento
SELECT      DEPARTMENT_ID, MAX(SALARY)
FROM        HR.EMPLOYEES
GROUP BY    DEPARTMENT_ID;

-- retorna o maior salario dos empregados, por departamento e cargo
SELECT      DEPARTMENT_ID, JOB_ID, MAX(SALARY)
FROM        HR.EMPLOYEES
GROUP BY    DEPARTMENT_ID, JOB_ID;

-- retorna o maior salario dos empregados, por departamento, considerando somente os MAIORES SALARIOS com valor maior que 10000 mil
SELECT      DEPARTMENT_ID, MAX(SALARY)
FROM        HR.EMPLOYEES
GROUP BY    DEPARTMENT_ID
HAVING      MAX(SALARY) > 10000;

-- retorna o maior salario dos empregados, por departamento, considerando somente os MAIORES SALARIOS com valor maior que 10000 mil,
--    ordenados pelo maior salario e departamento
SELECT      DEPARTMENT_ID, MAX(SALARY)
FROM        HR.EMPLOYEES
GROUP BY    DEPARTMENT_ID
HAVING      MAX(SALARY) > 10000
ORDER BY    1 DESC, 2;
