-- retornando somente empregando que possuem comissao 
SELECT  FIRST_NAME, LAST_NAME,
        SALARY,
        COMMISSION_PCT,
        COMMISSION_PCT * SALARY AS VAL_COMM
FROM    HR.EMPLOYEES
WHERE   COMMISSION_PCT IS NOT NULL;

-- retornando empregando que nao possuem comissao (observar retorno do calculo de valor da comissao)
SELECT  FIRST_NAME, LAST_NAME,
        SALARY,
        COMMISSION_PCT,
        COMMISSION_PCT * SALARY AS VAL_COMM
FROM    HR.EMPLOYEES
WHERE   COMMISSION_PCT IS NULL;

