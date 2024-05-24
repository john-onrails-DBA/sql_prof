-- *** NULLIF retorna NULL se 2 expressoes sao iguais ou retorna 1a. expressao
SELECT  NULLIF('FABIO','FABIO')
FROM    DUAL;

SELECT  NULLIF('FABIO','PRADO')
FROM    DUAL;