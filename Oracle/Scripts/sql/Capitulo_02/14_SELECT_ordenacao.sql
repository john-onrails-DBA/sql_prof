-- ordenando (modo crescente) pelo nome da coluna JOB_ID
SELECT      EMPLOYEE_ID, JOB_ID, DEPARTMENT_ID
FROM        HR.EMPLOYEES
WHERE       DEPARTMENT_ID = 60
ORDER BY    JOB_ID;

-- ordenando (modo decrescente) pelo nome da coluna EMPLOYEE_ID
SELECT      EMPLOYEE_ID, JOB_ID, DEPARTMENT_ID
FROM        HR.EMPLOYEES
WHERE       DEPARTMENT_ID = 60
ORDER BY    EMPLOYEE_ID DESC;

-- ordenando por 2 colunas (a primeira pelo apelido e a segunda pela ordem dela na instrucao)
SELECT      FIRST_NAME || ' ' ||LAST_NAME AS NAME,
            JOB_ID, DEPARTMENT_ID
FROM        HR.EMPLOYEES
ORDER BY    NAME, 3;
