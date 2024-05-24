-- Consultando todos os objetos acessiveis do DD
SELECT * FROM DICTIONARY;

-- Consultando todos os objetos que fornecem informacoes sobre tabelas do BD
SELECT * FROM DICTIONARY
WHERE   UPPER(COMMENTS) LIKE '%DESCRIPTION%TABLE%';

-- Consultando todos os objetos que fornecem informacoes sobre colunas de tabelas
SELECT * FROM DICTIONARY
WHERE   UPPER(COMMENTS) LIKE '%COLUMNS%';

-- Consultando todos os objetos que fornecem informacoes sobre indices
SELECT * FROM DICTIONARY
WHERE   UPPER(COMMENTS) LIKE '%DESCRIPTION%INDEX%';