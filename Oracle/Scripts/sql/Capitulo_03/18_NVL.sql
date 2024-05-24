-- NVL substitui um valor nulo por outro
SELECT  FIRST_NAME || ' ' || LAST_NAME, 
        SALARY + (SALARY * NVL(COMMISSION_PCT ,0)) AS TOTAL_SALARY
FROM    HR.EMPLOYEES;