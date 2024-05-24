-- convertendo data em formato de visualizacao amigavel (conforme padroes brasileiros)
SELECT  TO_CHAR(HIRE_DATE, 'dd/mm/yyyy') as hire_date
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID = 100;

-- convertendo numeros: a mascara 9 indica exibicao de valor opcional, mas apos D de digito, vira obrigatorio
SELECT TO_CHAR(15.00,'9999D999') from dual;

-- convertendo numeros: a mascara 0 indica exibicao de valor obrigatoria
SELECT TO_CHAR(15.00,'0000D000') from dual;