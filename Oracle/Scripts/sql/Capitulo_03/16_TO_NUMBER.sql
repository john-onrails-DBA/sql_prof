-- em conversoes numericas a mascara serve apenas para ajudar a interpretar o numero e nao aparece na visualizacao
SELECT  TO_NUMBER('15.79', '99.99') 
FROM    DUAL;

-- conversao numerica desconsidera visualizacao dos decimais zerados
SELECT  TO_NUMBER('15.00', '99.99') FROM    DUAL;