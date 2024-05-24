-- *** REPLACE substitui caracteres especificados ou remove caracteres em uma string

-- removendo caractere "a" do nome dos empregados
SELECT  FIRST_NAME, REPLACE(FIRST_NAME,'a')
FROM    HR.EMPLOYEES;

-- substituindo caractere "a" por "*" no nome dos empregados
SELECT  FIRST_NAME, REPLACE(FIRST_NAME,'a', '*')
FROM    HR.EMPLOYEES;