-- *** TRIM remove caracteres especificados (ou caracteres em branco) do inicio e/ou fim de uma string

-- remove espacos em branco do inicio e fim da string 
SELECT  TRIM('    FABIO    PRADO    ')
FROM    DUAL;

-- remove caractere * do inicio e fim da string
SELECT  TRIM('*' FROM '***  FABIO**PRADO ***')
FROM    DUAL;

-- remove caractere * do inicio e fim da string (mesmo resultado que exemplo anterior)
SELECT  TRIM(both '*' FROM '***  FABIO**PRADO ***')
FROM    DUAL;

-- remove caractere * somente do inicio da string 
SELECT  TRIM(LEADING '*' FROM '***  FABIO**PRADO ***')
FROM    DUAL;

-- remove caractere * somente do fim da string 
SELECT  TRIM(TRAILING '*' FROM '***  FABIO**PRADO ***')
FROM    DUAL;