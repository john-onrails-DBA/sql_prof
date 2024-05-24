create or replace Type T_VARCHAR IS TABLE OF VARCHAR2(48);
/

create or replace PACKAGE PKG_ENVIA_EMAIL
  IS 
-- Objeto:       PKG_ENVIA_EMAIL 
-- Descricao:    Package utilizado para enviar E-mail (Com Anexo(s) ou Não) 
-- Autor:        Fábio Prado (http://www.fabioprado.net
-- Data:         17/07/2012 
  -- 
  PROCEDURE SP_ENVIAR_EMAIL_COM_ANEXO ( P_ASSUNTO VARCHAR2, P_MSG VARCHAR2, P_EMAIL_ORIGEM VARCHAR2, P_EMAIL_DESTINO VARCHAR2, P_EMAIL_CC_DESTINO VARCHAR2,
              P_EMAIL_CCO_DESTINO VARCHAR2, P_FILENAME IN VARCHAR2, P_ANEXO CLOB, P_ATTACH_MIME IN VARCHAR2 DEFAULT 'text/plain; charset=iso-8859-1', 
              P_SMTP_SERVER VARCHAR2 DEFAULT 'smtp.empresa.com.br',  p_smtp_port IN NUMBER DEFAULT 25);
                                    
  PROCEDURE SP_ENVIAR_EMAIL (P_ASSUNTO VARCHAR2, P_MSG VARCHAR2, P_EMAIL_ORIGEM VARCHAR2, P_EMAIL_DESTINO VARCHAR2, P_EMAIL_CC_DESTINO VARCHAR2,
              P_EMAIL_CCO_DESTINO VARCHAR2, P_ATTACH_MIME IN VARCHAR2 DEFAULT 'text/plain; charset=iso-8859-1');
 
END;
/

create or replace PACKAGE BODY PKG_ENVIA_EMAIL
IS
   FUNCTION FC_GERAR_ARRAY_STRING (P_ARR_VALORES VARCHAR2 ) RETURN T_VARCHAR 
  IS
    V_VARCHAR         T_VARCHAR := T_VARCHAR();
    V_TEMP_ARR        VARCHAR2(4000):= P_ARR_VALORES;
    V_TEMP_ROW        VARCHAR2(4000);
    v_count           number :=0;
    v_count_temp      number :=0;
  BEGIN
   --------------------------------------------------------------------------------
    -- FUNCTION: FC_GERAR_ARRAY_STRING
    --------------------------------------------------------------------------------
    -- Data: 17/07/2012
    -- Nome: Fabio Prado 
    -- Descricao: Formata array com valores oriundos de uma string contendo múltiplos valores separados pelo caractere ","
    --------------------------------------------------------------------------------
    -- PARAMETROS 
    --------------------------------------------------------------------------------
    -- P_ARR_VALORES -> entrada -> Valores separados pelo caractere "," que serão convertidos em objeto array
    -- T_VARCHAR -> saída -> Objeto array contendo os múltiplos valores convertidos a partir do parametro P_ARR_VALORES
    --------------------------------------------------------------------------------
    --      HISTORICO DE ALTERACOES
    --------------------------------------------------------------------------------
    -- 17/01/2013 [Fábio Prado] -> Foi substituída a função REGEXP_COUNT por outra rotina para dar suporte a BDs anteriores ao 11G
    --------------------------------------------------------------------------------   
        -- verifica se parametro P_ARR_VALORES não está nulo
    IF P_ARR_VALORES IS NOT NULL THEN
        -- conta a qtde. de caracteres "," existentes na var P_ARR_VALORES
        for i in 1..length(P_ARR_VALORES)
        loop
          if substr(P_ARR_VALORES, i, 1) = ',' then
            v_count := v_count + 1;
          end if;
        end loop;
    
        -- verifica se existe apenas 1 valor em P_ARR_VALORES e grava o valor no array V_VARCHAR
        --IF REGEXP_COUNT(P_ARR_VALORES,',') = 0 THEN            
        IF V_COUNT = 0 THEN
            V_VARCHAR.EXTEND;
            V_VARCHAR(1):=  P_ARR_VALORES;
        ELSE
            -- percorre todos os valores contidos na string P_ARR_VALORES
            --FOR i IN 1..REGEXP_COUNT(P_ARR_VALORES,',')
            FOR i in 1..V_COUNT
            LOOP                
                -- recupera primeiro valor do array
                V_TEMP_ROW:=SUBSTR(V_TEMP_ARR,1,INSTR(V_TEMP_ARR,',')-1);
                      
                -- atualiza array excluindo valor recuperado anteriormente
                V_TEMP_ARR:=SUBSTR(V_TEMP_ARR,INSTR(V_TEMP_ARR,',')+1);
                
                -- Grava valor no objeto array V_VARCHAR
                V_VARCHAR.EXTEND;          
                V_VARCHAR(I):=  V_TEMP_ROW;
                
                 -- conta a qtde. de caracteres "," existentes na var V_TEMP_ARR
                for i in 1..length(V_TEMP_ARR)
                loop
                  if substr(V_TEMP_ARR, i, 1) = ',' then
                    v_count_temp := v_count_temp + 1;
                  end if;
                end loop;
                
                -- Grava último valor existente em V_TEMP_ARR no objeto array V_VARCHAR
                IF v_count_temp = 0 THEN                  
                  V_VARCHAR.EXTEND;          
                  V_VARCHAR(I+1):=  V_TEMP_ARR;
                END IF;
             END LOOP;     
        END IF;
    ELSE 
        RETURN NULL;
    END IF;
      
    RETURN V_VARCHAR;
  END FC_GERAR_ARRAY_STRING;
  
  PROCEDURE SP_ENVIAR_EMAIL (P_ASSUNTO VARCHAR2, P_MSG VARCHAR2, P_EMAIL_ORIGEM VARCHAR2, P_EMAIL_DESTINO VARCHAR2, P_EMAIL_CC_DESTINO VARCHAR2,
              P_EMAIL_CCO_DESTINO VARCHAR2, P_ATTACH_MIME IN VARCHAR2 DEFAULT 'text/plain; charset=iso-8859-1' )
  IS      
  BEGIN    
    --------------------------------------------------------------------------------
    -- PROCEDURE: SP_ENVIAR_EMAIL
    --------------------------------------------------------------------------------
    -- Data: 17/07/2012
    -- Nome: Fabio Prado (http://www.fabioprado.net)
    -- Descricao: Envia e-mail sem anexo utilizando package UTL_MAIL. É necessário configurar previamente o parametro da instancia SMTP_OUT_SERVER    
    --------------------------------------------------------------------------------
    -- PARAMETROS 
    --------------------------------------------------------------------------------
    -- P_ASSUNTO -> entrada -> Assunto do e-mail
    -- P_MSG -> entrada -> Mensagem do e-mail
    -- P_EMAIL_ORIGEM -> entrada -> E-mail do remetente
    -- P_EMAIL_DESTINO -> Destinatário do e-mail
    -- P_EMAIL_CC_DESTINO -> Destinatários copiados no e-mail
    -- P_EMAIL_CCO_DESTINO -> Destinatários com cópia oculta do e-mail
    -- P_ATTACH_MIME -> Mime type do texto do assunto (define formato e conjuntos de caracteres do assunto)
    --------------------------------------------------------------------------------
    --      HISTORICO DE ALTERACOES
    --------------------------------------------------------------------------------
    --------------------------------------------------------------------------------        
        -- Envia mensagem por e-mail. 
          UTL_MAIL.SEND(SENDER => P_EMAIL_ORIGEM, 
                  RECIPIENTS => P_EMAIL_DESTINO,
                  CC => P_EMAIL_CC_DESTINO,
                  BCC => P_EMAIL_CCO_DESTINO,
                  SUBJECT => P_ASSUNTO,
                  MESSAGE => P_MSG,                  
                  MIME_TYPE => P_ATTACH_MIME);                  
  EXCEPTION
      WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE('Erro: ' || sqlerrm);
  END SP_ENVIAR_EMAIL;
  
  PROCEDURE SP_ENVIAR_EMAIL_COM_ANEXO ( P_ASSUNTO VARCHAR2, P_MSG VARCHAR2, P_EMAIL_ORIGEM VARCHAR2, P_EMAIL_DESTINO VARCHAR2, P_EMAIL_CC_DESTINO VARCHAR2,
              P_EMAIL_CCO_DESTINO VARCHAR2, P_FILENAME IN VARCHAR2, P_ANEXO CLOB,  
              P_ATTACH_MIME IN VARCHAR2 DEFAULT 'text/plain; charset=iso-8859-1', 
              P_SMTP_SERVER VARCHAR2 DEFAULT 'smtp.empresa.com.br',  P_SMTP_PORT IN NUMBER DEFAULT 25)
  AS
    l_mail_conn   UTL_SMTP.connection;
    l_boundary    VARCHAR2(50) := '----=*#abc1234321cba#*=';
    L_STEP        PLS_INTEGER  := 24573;
    v_dest        VARCHAR2(4000) := '';
     V_ARR_EMAIL_DESTINO T_VARCHAR := T_VARCHAR();
    V_ARR_EMAIL_CC_DESTINO T_VARCHAR := T_VARCHAR();
    V_ARR_EMAIL_CCO_DESTINO T_VARCHAR := T_VARCHAR();
  BEGIN
  --------------------------------------------------------------------------------
    -- PROCEDURE: SP_ENVIAR_EMAIL
    --------------------------------------------------------------------------------
    -- Data: 17/07/2012
    -- Nome: Fabio Prado (http://www.fabioprado.net)
    -- Descricao: Envia e-mail com anexo utilizando package UTL_SMTP. Não utiliza package UTL_MAIL pq ela tem limitação para anexar 
    --  arquivos de no máximo 32k
    --------------------------------------------------------------------------------
    -- PARAMETROS 
    --------------------------------------------------------------------------------
    -- P_ASSUNTO -> entrada -> Assunto do e-mail
    -- P_MSG -> entrada -> Mensagem do e-mail
    -- P_EMAIL_ORIGEM -> entrada -> E-mail do remetente
    -- P_EMAIL_DESTINO -> String contendo destinatário(s) do e-mail (múltiplos valores devem ser separados pelo caracteres ",")
    -- P_EMAIL_CC_DESTINO -> String contendo destinatário(s) copiados no e-mail (múltiplos valores devem ser separados pelo caracteres ",")
    -- P_EMAIL_CCO_DESTINO -> String contendo destinatário(s) com cópia oculta do e-mail (múltiplos valores devem ser separados pelo caracteres ",")
    -- P_FILENAME -> Nome dado ao arquivo que será anexado
    -- P_ANEXO -> texto CLOB contendo mensagem a ser anexada
    -- P_ATTACH_MIME -> Mime type do assunto e do arquivo anexo
    -- P_SMTP_SERVER -> Endereço do servidor SMTP p/ envio do email
    -- P_SMTP_PORT -> Porta do servidor SMTP p/ envio do email
    --------------------------------------------------------------------------------
    --      HISTORICO DE ALTERACOES
    --------------------------------------------------------------------------------
    --------------------------------------------------------------------------------       
     V_ARR_EMAIL_DESTINO := FC_GERAR_ARRAY_STRING(P_EMAIL_DESTINO);
     V_ARR_EMAIL_CC_DESTINO := FC_GERAR_ARRAY_STRING(P_EMAIL_CC_DESTINO);
     V_ARR_EMAIL_CCO_DESTINO := FC_GERAR_ARRAY_STRING(P_EMAIL_CCO_DESTINO);
    
    l_mail_conn := UTL_SMTP.open_connection(P_SMTP_SERVER, p_smtp_port);
    UTL_SMTP.helo(l_mail_conn, P_SMTP_SERVER);
    UTL_SMTP.MAIL(L_MAIL_CONN, P_EMAIL_ORIGEM);    
    
    -- Acrescenta email(s) destino
    FOR I IN V_ARR_EMAIL_DESTINO.FIRST .. V_ARR_EMAIL_DESTINO.LAST
    LOOP       
      UTL_SMTP.RCPT(L_MAIL_CONN,V_ARR_EMAIL_DESTINO(i));
    END LOOP;
    
    -- Acrescenta email(s) destino com cópia
    IF V_ARR_EMAIL_CC_DESTINO IS NOT NULL THEN    
        FOR I IN V_ARR_EMAIL_CC_DESTINO.FIRST .. V_ARR_EMAIL_CC_DESTINO.LAST
        LOOP 
          UTL_SMTP.RCPT(L_MAIL_CONN,V_ARR_EMAIL_CC_DESTINO(I));
        END LOOP;
    end if;
    
    -- Acrescenta email(s) destino com cópia oculta
    IF V_ARR_EMAIL_CCO_DESTINO IS NOT NULL THEN        
        FOR I IN V_ARR_EMAIL_CCO_DESTINO.FIRST .. V_ARR_EMAIL_CCO_DESTINO.LAST
        LOOP 
          UTL_SMTP.RCPT(L_MAIL_CONN,V_ARR_EMAIL_CCO_DESTINO(I));
        END LOOP;
    END IF;
          
    UTL_SMTP.OPEN_DATA(L_MAIL_CONN);        
    UTL_SMTP.WRITE_DATA(L_MAIL_CONN, 'From: ' || P_EMAIL_ORIGEM || UTL_TCP.CRLF);  
    
    IF V_ARR_EMAIL_DESTINO IS NOT NULL THEN
        IF V_ARR_EMAIL_DESTINO.COUNT = 1 THEN
          UTL_SMTP.WRITE_DATA(L_MAIL_CONN,'To: ' || V_ARR_EMAIL_DESTINO(1) || UTL_TCP.CRLF);
        ELSE 
          FOR I IN V_ARR_EMAIL_DESTINO.FIRST .. V_ARR_EMAIL_DESTINO.LAST
          LOOP                 
            v_dest := v_dest || V_ARR_EMAIL_DESTINO(i) || ',';
          END LOOP;
          V_DEST := SUBSTR(V_DEST,1,LENGTH(V_DEST)-1);                
          
          UTL_SMTP.WRITE_DATA(L_MAIL_CONN,'To: ' || V_DEST || UTL_TCP.CRLF);
        END IF;
    end if;
    
    IF V_ARR_EMAIL_CC_DESTINO IS NOT NULL THEN 
          IF V_ARR_EMAIL_CC_DESTINO.COUNT = 1 THEN
            UTL_SMTP.WRITE_DATA(L_MAIL_CONN,'Cc: ' || V_ARR_EMAIL_CC_DESTINO(1) || UTL_TCP.CRLF);
          ELSE 
            FOR I IN V_ARR_EMAIL_CC_DESTINO.FIRST .. V_ARR_EMAIL_CC_DESTINO.LAST
            LOOP         
              UTL_SMTP.WRITE_DATA(L_MAIL_CONN,'Cc: ' || V_ARR_EMAIL_CC_DESTINO(i) || UTL_TCP.CRLF);        
            END LOOP;
          END IF;
    end if;
    
     IF V_ARR_EMAIL_CCO_DESTINO IS NOT NULL THEN 
          IF V_ARR_EMAIL_CCO_DESTINO.COUNT = 1 THEN
            UTL_SMTP.WRITE_DATA(L_MAIL_CONN,'BCC: ' || V_ARR_EMAIL_CCO_DESTINO(1) || UTL_TCP.CRLF);
          ELSE 
            FOR I IN V_ARR_EMAIL_CCO_DESTINO.FIRST .. V_ARR_EMAIL_CCO_DESTINO.LAST
            LOOP         
              UTL_SMTP.WRITE_DATA(L_MAIL_CONN,'BCC: ' || V_ARR_EMAIL_CCO_DESTINO(i) || UTL_TCP.CRLF);        
            END LOOP;
          END IF;
    end if;
        
    UTL_SMTP.WRITE_RAW_DATA(L_MAIL_CONN,UTL_RAW.CAST_TO_RAW('Subject: ' || P_ASSUNTO || UTL_TCP.CRLF));
    UTL_SMTP.write_data(l_mail_conn, 'Reply-To: ' || P_EMAIL_ORIGEM || UTL_TCP.crlf);
    UTL_SMTP.write_data(l_mail_conn, 'MIME-Version: 1.0' || UTL_TCP.crlf);
    UTL_SMTP.write_data(l_mail_conn, 'Content-Type: multipart/mixed; boundary="' || l_boundary || '"' || UTL_TCP.crlf || UTL_TCP.crlf);
    
    IF p_msg IS NOT NULL THEN
      UTL_SMTP.write_data(l_mail_conn, '--' || l_boundary || UTL_TCP.crlf);
      UTL_SMTP.write_data(l_mail_conn, 'Content-Type: ' || P_ATTACH_MIME ||  UTL_TCP.crlf || UTL_TCP.crlf);
      UTL_SMTP.WRITE_RAW_DATA(L_MAIL_CONN,UTL_RAW.CAST_TO_RAW(P_MSG));
      UTL_SMTP.write_data(l_mail_conn, UTL_TCP.crlf || UTL_TCP.crlf);
    END IF;
  
    IF P_FILENAME IS NOT NULL THEN
      UTL_SMTP.write_data(l_mail_conn, '--' || l_boundary || UTL_TCP.crlf);
      UTL_SMTP.WRITE_DATA(L_MAIL_CONN, 'Content-Type: ' || P_ATTACH_MIME || '; name="' || P_FILENAME || '"' || UTL_TCP.CRLF);
      --UTL_SMTP.WRITE_DATA(L_MAIL_CONN, 'Content-Transfer-Encoding: 8bit');
      UTL_SMTP.write_data(l_mail_conn, 'Content-Disposition: attachment; filename="' || P_FILENAME || '"' || UTL_TCP.crlf || UTL_TCP.crlf);
   
      FOR I IN 0 .. TRUNC((DBMS_LOB.GETLENGTH(P_ANEXO) - 1 )/L_STEP) LOOP        
        UTL_SMTP.WRITE_RAW_DATA(L_MAIL_CONN,UTL_RAW.CAST_TO_RAW(DBMS_LOB.SUBSTR(P_ANEXO, L_STEP, I * L_STEP + 1)));
      END LOOP;
  
      UTL_SMTP.write_data(l_mail_conn, UTL_TCP.crlf || UTL_TCP.crlf);
    END IF;
    
    UTL_SMTP.write_data(l_mail_conn, '--' || l_boundary || '--' || UTL_TCP.crlf);
    UTL_SMTP.close_data(l_mail_conn);  
    UTL_SMTP.quit(l_mail_conn);
  END;
       
END;
/

-- O código abaixo deve ser utilizado apenas p/ testar o envio de e-mails. Altere o valor dos parâmetros de acordo com a sua necessidade
BEGIN
    SP_ENVIAR_EMAIL_COM_ANEXO (P_ASSUNTO => 'Assunto do e-mail', 
                    P_MSG => 'Mensagem', 
                    P_EMAIL_ORIGEM => 'oracle@oracle.com', 
                    P_EMAIL_DESTINO 'fbifabio@gmail.com, jack@oracle.com',     
                    P_EMAIL_CC_DESTINO => 'fulano@oracle.com, ciclano@oracle.com', 
                    P_EMAIL_CCO_DESTINO => null,
                    P_FILENAME => 'arquivo.txt',
                    P_ANEXO => v_CLOB,
                    P_ATTACH_MIME => 'text/plain; charset=iso-8859-1', 
                    P_SMTP_SERVER => 'smtp.empresa.com.br',
                    P_SMTP_PORT => 25);
END;