-- *** LPAD acrescenta a esquerda de uma string outra string especificada ou caracteres em branco (quando nao especificada)

-- acrescenta a esquerda caracteres em branco na palavra 'FABIO PRADO', ate a palavra final ter tamanho igual a 20
SELECT  LPAD('FABIO PRADO', 20)
FROM    DUAL;

-- acrescenta a esquerda caracteres * na palavra 'FABIO PRADO', ate a palavra final ter tamanho igual a 20
SELECT  LPAD('FABIO PRADO', 20, '*')
FROM    DUAL;

-- acrescenta a esquerda caracteres * na palavra 'FABIO PRADO', ate a palavra final ter tamanho igual a 5. Como o tamanho 5 eh menor que o da palavra inicial,
-- ocorrera um truncamento dela
SELECT  LPAD('FABIO PRADO', 5, '*')
FROM    DUAL;

-- *** RPAD trabalha de forma igual ao LPAD, substituindo o lado esquerdo pelo direito

-- acrescenta a direita caracteres em branco na palavra 'FABIO PRADO', ate a palavra final ter tamanho igual a 20
SELECT  RPAD('FABIO PRADO', 20)
FROM    DUAL;

-- acrescenta a direita caracteres * na palavra 'FABIO PRADO', ate a palavra final ter tamanho igual a 20
SELECT  RPAD('FABIO PRADO', 20, '*')
FROM    DUAL;

-- acrescenta a direita caracteres * na palavra 'FABIO PRADO', ate a palavra final ter tamanho igual a 5. Como o tamanho 5 eh menor que o da palavra inicial,
-- ocorrera um truncamento dela
SELECT  RPAD('FABIO PRADO', 5, '*')
FROM    DUAL;