-- criando uma visao simples c/ a clausula WITH READ ONLY
CREATE OR REPLACE VIEW HR.VW_EMP2
AS
  SELECT      employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM        HR.EMPLOYEES E
  where       E.DEPARTMENT_ID = 90
WITH READ ONLY;

-- tentando inserir dados da visao (nao funciona)
INSERT INTO HR.VW_EMP2 (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES      (1000, 'FABIO', 'PRADO', 'fbifabio@gmail.com', 12345678, SYSDATE, 'IT_PROG', 1000, NULL, NULL, 90);

