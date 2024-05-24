-- TESTAR ROLLBACK PARA OS VARIOS PONTOS DE SALVAMENTO

-- ********** inicio da transacao de transferencia 
SET SERVEROUTPUT ON
DECLARE
  V_SALDO NUMBER;
  V_VLR_TRANSF NUMBER := 3000;
  V_CONTA_ORIGEM NUMBER := 1;
  V_CONTA_DESTINO NUMBER := 2;
BEGIN
  -- recupera valor de saldo da conta origem
  SELECT  SALDO INTO V_SALDO
  FROM    HR.CONTA
  WHERE   ID = V_CONTA_ORIGEM;
  
  -- verifica se o saldo da conta origem eh maior que o valor da transferencia
  IF V_SALDO >= V_VLR_TRANSF THEN
      SAVEPOINT PONTO_A;
      
      -- retira valor da conta origem
      UPDATE  HR.CONTA
      SET     SALDO = SALDO - V_VLR_TRANSF
      WHERE   ID = V_CONTA_ORIGEM;
      
      -- credita valor na conta destino
      UPDATE  HR.CONTA
      SET     SALDO = SALDO + V_VLR_TRANSF
      WHERE   ID = V_CONTA_DESTINO;      
      
      SAVEPOINT PONTO_B;
      RAISE_APPLICATION_ERROR(-20001, 'Erro na transferencia. Transacao abortada!');
  END IF;
  
  COMMIT;
  dbms_output.put_line('Transacao executada com sucesso!');
EXCEPTION
  -- quando acontecer algum erro faz rollback na transacao
  WHEN OTHERS THEN
    ROLLBACK TO PONTO_A;
    --ROLLBACK TO PONTO_B;
    dbms_output.put_line('A transacao falhou.');
END;

-- verificar saldo das contas
SELECT * FROM HR.CONTA;
ROLLBACK;
SELECT * FROM HR.CONTA;




