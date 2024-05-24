-- funcoes de grupo ignoram valores nulos
SELECT    COUNT(COMMISSION_PCT) 
FROM      HR.EMPLOYEES;

-- colunas da lista de retorno devem estar inclusas no GROUP BY
SELECT      JOB_ID, DEPARTMENT_ID, AVG(SALARY) 
FROM        HR.EMPLOYEES
GROUP BY    JOB_ID, DEPARTMENT_ID;

-- apelido de coluna nao pode ser usado no group by
SELECT      JOB_ID AS CARGO, DEPARTMENT_ID, AVG(SALARY)
FROM        HR.EMPLOYEES
GROUP BY    CARGO, DEPARTMENT_ID
ORDER BY    CARGO, DEPARTMENT_ID;

-- HAVING para filtrar utilizando funcoes de grupo
SELECT      DEPARTMENT_ID, MAX(SALARY)
FROM        HR.EMPLOYEES
GROUP BY    DEPARTMENT_ID
HAVING      MAX(SALARY) > 10000;

-- aninhamento de funcoes de grupo
SELECT    COUNT(NVL(COMMISSION_PCT,0)) 
FROM      HR.EMPLOYEES
WHERE     DEPARTMENT_ID = 100;
