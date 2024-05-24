-- CONCAT retorna em modo concatenado 2 conjuntos de caracteres. Pode ser utilizado no lugar do operador ||
SELECT  CONCAT(FIRST_NAME, ' ') || LAST_NAME AS NAME
FROM    HR.EMPLOYEES;