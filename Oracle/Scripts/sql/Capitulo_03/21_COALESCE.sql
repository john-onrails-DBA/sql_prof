-- *** COALESCE retorna o primeiro valor nao nulo
SELECT  COALESCE(NULL, NULL, NULL, 1)
FROM    DUAL;

SELECT  COALESCE(NULL, 2, NULL, 1)
FROM    DUAL;
