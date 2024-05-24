-- exibir somente primeiros nomes unicos
SELECT  DISTINCT FIRST_NAME        
FROM    HR.EMPLOYEES;

-- verificar quantas linhas tem na tabela
SELECT  COUNT(1)
FROM    HR.EMPLOYEES;

-- verificar quantos nomes unicos tem na tabela
SELECT  COUNT(DISTINCT FIRST_NAME)
FROM    HR.EMPLOYEES;
