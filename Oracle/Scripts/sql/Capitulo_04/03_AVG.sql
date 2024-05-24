-- retorna a media de salarios dos empregados
SELECT    AVG(SALARY)
FROM      HR.EMPLOYEES;

-- retorna a media de salarios dos empregados do departamento 100
SELECT    AVG(SALARY)
FROM      HR.EMPLOYEES
WHERE     DEPARTMENT_ID = 100;

-- retorna a media de salarios, por cargo e departamento
SELECT      JOB_ID, DEPARTMENT_ID, AVG(SALARY) 
FROM        HR.EMPLOYEES
GROUP BY    JOB_ID, DEPARTMENT_ID;

-- retorna a media de salarios, por cargo e departamento, ordenados por cargo e departamento
SELECT      JOB_ID, DEPARTMENT_ID, AVG(SALARY)
FROM        HR.EMPLOYEES
GROUP BY    JOB_ID, DEPARTMENT_ID
ORDER BY    JOB_ID, DEPARTMENT_ID;

-- retorna a media de salarios, por cargo e departamento, ordenados por MEDIAS mais altas
SELECT      JOB_ID, DEPARTMENT_ID, AVG(SALARY)
FROM        HR.EMPLOYEES
GROUP BY    JOB_ID, DEPARTMENT_ID
ORDER BY    AVG(SALARY) DESC;