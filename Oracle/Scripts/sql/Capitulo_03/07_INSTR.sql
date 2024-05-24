-- INSTR retorna a posicao de parte de uma string dentro de uma string maior

-- retorna sempre a posicao da primeira ocorrencia
SELECT  INSTR('FABIO PRADO', 'A')
FROM    DUAL;

SELECT  INSTR('FABIO PRADO', 'BI')
FROM    DUAL;

-- quando nao encontra alguma ocorrencia de parte de uma string, retorna o valor zero 
SELECT  INSTR('FABIO PRADO', 'Z')
FROM    DUAL;