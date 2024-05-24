-- Expressoes com operadores aritmeticos
SELECT  FIRST_NAME, LAST_NAME,
        SALARY,
        SALARY + 100                SAL_MAIS_100,
        SALARY - 100                SAL_MENOS_100,
        SALARY + (SALARY/100 * 10)  AS "SAL_AUMENTO_10%"        
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID = 20;

