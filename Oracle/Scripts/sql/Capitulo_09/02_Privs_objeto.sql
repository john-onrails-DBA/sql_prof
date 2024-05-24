-- atribuindo privilegios na tabela TESTE para o usuario HR
GRANT SELECT, INSERT, DELETE ON ECOMMERCE.TESTE TO HR;

-- atribuindo privilegios de atualizacao em colunas especificas da tabela TESTE para o usuario HR
GRANT UPDATE (COL1) ON ECOMMERCE.TESTE TO HR;

-- se o usuario GRANTOR (aquele que concede o priv) quiser permitir que o GRANTEE (aquele que recebe o priv)
--      tenha poder para repassar o privilegio a outros usuarios, conceda o priv com a opcao WITH GRANT OPTION
GRANT SELECT, INSERT, DELETE ON ECOMMERCE.TESTE TO HR WITH GRANT OPTION;

-- para permitir que todos os usuarios do BD facam select na tabela TESTE
GRANT SELECT ON ECOMMERCE.TESTE TO PUBLIC;

-- para revogar privilegios publicos de select na tabela TESTE
REVOKE SELECT ON ECOMMERCE.TESTE FROM PUBLIC;