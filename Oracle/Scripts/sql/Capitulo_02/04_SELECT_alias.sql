--*** Recuperando linhas especificas da tabela EMPLOYEES

-- Utilizando apelido de coluna
SELECT  FIRST_NAME AS PRIMEIRO_NOME, JOB_ID AS CARGO
FROM    HR.EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'AD_VP');

-- Utilizando um apelido de coluna contendo palavra reservada ou caracteres especiais (sem usar AS)
SELECT  FIRST_NAME "PRIMEIRO NOME", JOB_ID "CARGO"
FROM    HR.EMPLOYEES
WHERE   JOB_ID IN ('IT_PROG', 'AD_VP');

-- Utilizando um apelido de tabela 
SELECT  E.FIRST_NAME, E.LAST_NAME, E.JOB_ID
FROM    HR.EMPLOYEES E
WHERE   E.JOB_ID IN ('IT_PROG', 'AD_VP');