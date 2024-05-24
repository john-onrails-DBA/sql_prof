-- criando uma visao
CREATE OR REPLACE VIEW HR.VW_EMPREGADOS
AS
  SELECT      E.FIRST_NAME || ' ' || E.LAST_NAME AS COMPLETE_NAME,
              E.EMAIL,
              J.JOB_TITLE,
              D.DEPARTMENT_NAME
  FROM        HR.EMPLOYEES E
  LEFT JOIN   HR.departments D
      ON      D.DEPARTMENT_ID = E.DEPARTMENT_ID
  INNER JOIN  HR.jobs J
      ON      J.JOB_ID = E.JOB_ID;

-- selecionando dados da visao            
SELECT * FROM HR.vw_empregados;
DESC HR.vw_empregados

-- atualizando dados atraves da view simples
update hr.vw_empregados set email = email;

-- atualizando dados atraves da view simples (funciona)
UPDATE  HR.vw_empregados
SET     FIRST_NAME = 'TESTE'
WHERE   EMAIL = 'SKING';

-- atualizando dados atraves da view simples (nao funciona)
UPDATE  HR.vw_empregados
SET     COMPLETE_NAME = 'TESTE'
WHERE   EMAIL = 'TESTE';

rollback;
