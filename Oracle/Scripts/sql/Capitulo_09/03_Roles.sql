-- Concendendo privilegios da role connect para o usuario ecommerce
GRANT CONNECT TO ECOMMERCE;

-- criando a role HR_OPERATOR
CREATE ROLE HR_OPERATOR;

-- Atribuindo privilegios para a role HR_OPERATOR
GRANT SELECT ON HR.EMPLOYEES TO HR_OPERATOR;
GRANT SELECT ON HR.DEPARTMENTS TO HR_OPERATOR;
GRANT SELECT ON HR.JOB_HISTORY TO HR_OPERATOR;

-- Concedendo os privilegios da role HR_OPERATOR ao usuario ECOMMERCE
GRANT HR_OPERATOR TO ECOMMERCE;

-- Revogando os privilegios da role HR_OPERATOR do usuario ECOMMERCE
REVOKE HR_OPERATOR FROM ECOMMERCE;

-- Apagando a role HR_OPERATOR
DROP ROLE HR_OPERATOR;