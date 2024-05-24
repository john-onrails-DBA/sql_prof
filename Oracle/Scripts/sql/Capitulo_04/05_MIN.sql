-- retorna o menor salario dos empregados
SELECT  MIN(SALARY)
FROM    HR.EMPLOYEES;

-- retorna o menor salario dos empregados, por job_id
SELECT      JOB_ID, MIN(SALARY)
FROM        HR.EMPLOYEES
GROUP BY    JOB_ID;

-- retorna o menor salario + total de empregados, por departamento, considerando somente os departamentos que possuem mais que 3 empregados
SELECT       DEPARTMENT_ID, MIN(SALARY), COUNT(EMPLOYEE_ID)
FROM         HR.EMPLOYEES
GROUP BY     DEPARTMENT_ID
HAVING       count(1) > 3;

-- retorna o menor salario + soma do salario dos empregados, por departamento, considerando somente soma de salarios maior que 25 mil
SELECT      DEPARTMENT_ID, MIN(SALARY), SUM(SALARY)
FROM        HR.EMPLOYEES
GROUP BY    DEPARTMENT_ID
HAVING      SUM(SALARY) > 25000;