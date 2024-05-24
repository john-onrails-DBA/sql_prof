-- execute as instrucoes abaixo
UPDATE  HR.CONTA
SET     SALDO = 10000
WHERE   ID = 1;

UPDATE  HR.CONTA
SET     SALDO = 2000
WHERE   ID = 2;

-- abra uma nova sessao de usuario no sqlplus e veja os dados da tabela
SELECT * FROM HR.CONTA;

-- na 1a sessao de usuario, execute um COMMIT
COMMIT;

-- volte para a sessao do sqlplus e veja se agora vc enxerga as mudancas
SELECT * FROM HR.CONTA;