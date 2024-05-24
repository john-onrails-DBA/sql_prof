-- SUBSTR retorna parte de uma string recebida como argumento. Aceita 2 ou 3 argumentos

-- retorna string a partir da posicao 6
SELECT  SUBSTR('FABIO PRADO', 6)
FROM    DUAL;

-- retorna string a partir da posicao 6 com tamanho 2
SELECT  SUBSTR('FABIO PRADO', 6, 2)
FROM    DUAL;