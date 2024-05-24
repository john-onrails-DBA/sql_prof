-- retorna a media + variancia + desvio padrao dos salarios de empregados do departamento 100
SELECT  AVG(SALARY) as media,
        AVG(SALARY) / COUNT(SALARY) AS desvio,
        VARIANCE(SALARY) variancia,
        STDDEV(SALARY) "desvio padrao"
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID = 100;

-- retorna arredondando em formato moeda (inteiros + 2 decimais no maximo), a media + variancia + desvio padrao dos salarios de empregados do departamento 100
SELECT    ROUND(AVG(SALARY),2) as media,          
          ROUND(VARIANCE(SALARY),2) variancia,
          ROUND(STDDEV(SALARY),2) "desvio padrao"
FROM      HR.EMPLOYEES
WHERE     DEPARTMENT_ID = 100;
