-- *** Utilizando funcoes aninhadas

-- retorna em maiusculo nomes a partir do 2o. caractere
SELECT  SUBSTR(UPPER(FIRST_NAME),2)
FROM    HR.EMPLOYEES;

-- retorna somente empregados que a 2a. letra do nome eh igual a 'A'
SELECT  *
FROM    HR.EMPLOYEES
WHERE   INSTR(SUBSTR(UPPER(FIRST_NAME),2), 'A') = 1;