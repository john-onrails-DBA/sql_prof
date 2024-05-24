-- Adicionando comentario em tabela
COMMENT ON TABLE HR.EMP is 'Tabela de empregados do sistema de RH';

-- Adicionando comentarios em colunas
COMMENT ON COLUMN HR.EMP.FIRST_NAME Is 'Primeiro nome do empregado';
COMMENT ON COLUMN HR.EMP.LAST_NAME Is 'Ultimo nome do empregado';

-- Pesquisando comentarios de tabela
SELECT * FROM all_tab_comments WHERE OWNER = 'HR' AND table_name = 'EMP';

-- Pesquisando comentarios de colunas
SELECT * FROM all_col_comments WHERE OWNER = 'HR' AND table_name = 'EMP';