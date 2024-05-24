ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY HH24:MI:SS';

-- ano atual = 2015 entao se ano da data eh entre 50 e 99, formata seculo como seculo anterior em RR
SELECT  SYSDATE, TO_DATE('15/09/97', 'DD/MM/RR') as formato_RR, TO_DATE('15/09/97', 'DD/MM/YY') as formato_YY
FROM    DUAL;

-- ano atual = 2015 entao se ano da data eh entre 0 e 49, formata seculo como seculo atual em RR
SELECT  SYSDATE, TO_DATE('15/09/47', 'DD/MM/RR') as formato_RR, TO_DATE('15/09/47', 'DD/MM/YY') as formato_YY
FROM    DUAL;

-- utilizando modelos de formatacao
SELECT  TO_CHAR(SYSDATE, 'DD') || ' DE ' ||        
        TO_CHAR(SYSDATE, 'MONTH') || 'DE ' || TO_CHAR(SYSDATE, 'YYYY') as data_extenso,
        to_char(sysdate, 'DD Mon YYYY, DAY') as data_e_diasemana
FROM    DUAL;