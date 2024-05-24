-- inserindo dados na tabela
INSERT INTO HR.CONTA (id, saldo) VALUES (1, 10000);
INSERT INTO HR.CONTA (id, saldo) VALUES (2, 2000);

-- criando tabela clone da tabela de testes 
CREATE TABLE HR.CONTA2 AS SELECT * FROM HR.CONTA;

-- execute a instrucao abaixo para desfazer a transacao
ROLLBACK;

-- execute a instrucao abaixo para verificar se a transacao foi desfeita ou nao
SELECT * FROM HR.CONTA;