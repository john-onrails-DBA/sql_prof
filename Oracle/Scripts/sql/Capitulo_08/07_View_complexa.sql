-- criando uma visao complexa
CREATE OR REPLACE VIEW HR.VW_EMPREGADOS_COMPLEXA
AS
  SELECT      d.DEPARTMENT_NAME,
              round(avg(e.salary),2) media_salarial
  FROM        HR.EMPLOYEES E
  inner JOIN   HR.departments D
      ON      D.DEPARTMENT_ID = E.DEPARTMENT_ID
  GROUP BY    d.DEPARTMENT_NAME;
  
-- selecionando dados da visao complexa          
SELECT * FROM HR.VW_EMPREGADOS_COMPLEXA;

-- tentando atualizar dados atraves da visao complexa (nao funciona)
UPDATE  HR.VW_EMPREGADOS_COMPLEXA
SET     DEPARTMENT_NAME = 'TESTE'
WHERE   DEPARTMENT_NAME = 'IT';
