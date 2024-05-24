-- SYSDATE retorna data e hora atual (no formato de visualizacao padrao a hora eh omitida)
SELECT  SYSDATE
FROM    DUAL;

-- MONTHS_BETWEEN retorna a quantidade de meses entre 2 datas
SELECT  HIRE_DATE, SYSDATE, 
        MONTHS_BETWEEN(SYSDATE, HIRE_DATE)
FROM    HR.EMPLOYEES
WHERE   ROWNUM <= 5;

-- ADD_MONTHS acrescenta N meses a uma determinada data
SELECT  SYSDATE, ADD_MONTHS(SYSDATE, 5)
FROM    DUAL;

-- NEXT_DAY retorna o proximo dia da semana depois de uma determinada data
SELECT  SYSDATE, NEXT_DAY(SYSDATE, 'DOMINGO')
FROM    DUAL;

-- LAST_DAY retorna o ultimo dia do mes de uma determinada data
SELECT  SYSDATE, LAST_DAY(SYSDATE)
FROM    DUAL;