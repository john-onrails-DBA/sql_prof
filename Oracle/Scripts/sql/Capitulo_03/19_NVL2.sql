-- *** NVL2 substitui valor nao nulo e valor nulo, se primeiro valor eh nulo, usa segundo valor, caso contrario, usa o ultimo valor

-- se comissao nao for nula, calcula salario com 10% de comissao, se for nula, calcula com 0 de comissao
SELECT  FIRST_NAME || ' ' || LAST_NAME, 
        SALARY, COMMISSION_PCT,
        SALARY + (SALARY * NVL2(COMMISSION_PCT ,0.10, 0)) AS TOTAL_SALARY
FROM    HR.EMPLOYEES;

select nvl2(2500, 1, 0) , nvl2(null, 1, 0) from dual;