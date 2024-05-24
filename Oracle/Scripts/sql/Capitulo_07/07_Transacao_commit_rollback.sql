-- criando tabela para testes
CREATE TABLE HR.CONTA (id NUMBER, saldo NUMBER);

-- inserindo dados na tabela
INSERT INTO HR.CONTA (id, saldo) VALUES (1, 10000);
INSERT INTO HR.CONTA (id, saldo) VALUES (2, 2000);

-- execute a instrucao abaixo para verificar se os dados foram inseridos
SELECT * FROM HR.CONTA;

-- execute a instrucao abaixo para desfazer a transacao
ROLLBACK;

-- execute a instrucao abaixo para verificar se a transacao foi desfeita
SELECT * FROM HR.CONTA;

-- inserindo dados novamente na tabela
INSERT INTO HR.CONTA (id, saldo) VALUES (1, 10000);
INSERT INTO HR.CONTA (id, saldo) VALUES (2, 2000);

-- efetive a transacao
COMMIT;

-- execute a instrucao abaixo para verificar se a transacao foi efetivada
SELECT * FROM HR.CONTA;
