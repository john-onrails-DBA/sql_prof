-- *** ROUND Arrendonda valores numericos

-- arredonda o valor numerico para somente 2 casas decimais
SELECT  7789.51934124142, ROUND(7789.51934124142, 2)
FROM    DUAL;

-- arredonda o valor numerico para conter somente o valor inteiro
SELECT  7789.51934124142, ROUND(7789.51934124142, 0)
FROM    DUAL;

-- arredonda o valor numerico para o valor da centena
SELECT  7789.51934124142, ROUND(7789.51934124142, -2)
FROM    DUAL;

-- arredonda o valor numerico para o valor da milhar
SELECT  7789.51934124142, ROUND(7789.51934124142, -3)
FROM    DUAL;