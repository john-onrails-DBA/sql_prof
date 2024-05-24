-- criando uma visao simples
CREATE OR REPLACE VIEW HR.VW_EMP2
AS
  SELECT      employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM        HR.EMPLOYEES E
  where       E.DEPARTMENT_ID = 90;

-- inserindo dados atraves da visao (c/ departamento nao incluso no escopo da visao)
INSERT INTO HR.VW_EMP2 (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES      (1000, 'FABIO', 'PRADO', 'fbifabio@gmail.com', 12345678, SYSDATE, 'IT_PROG', 1000, NULL, NULL, 60);

-- desfaca a insercao
ROLLBACK;

--------------------------------------------------------------------------------------------------
-- alterando a visao simples p/ conter a clausula WITH CHECK OPTION
CREATE OR REPLACE VIEW HR.VW_EMP2
AS
  SELECT      employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id
  FROM        HR.EMPLOYEES E
  where       E.DEPARTMENT_ID = 90
WITH CHECK OPTION CONSTRAINT CK_DEPARTMENTID;

-- tentando inserir dados novamente por meio da visao c/ departamento nao incluso no escopo da visao (nao funciona)
INSERT INTO HR.VW_EMP2 (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES      (1000, 'FABIO', 'PRADO', 'fbifabio@gmail.com', 12345678, SYSDATE, 'IT_PROG', 1000, NULL, NULL, 60);

-- tentando inserir dados novamente por meio  visao c/ departamento incluso no escopo da visao (funciona)
INSERT INTO HR.VW_EMP2 (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES      (1000, 'FABIO', 'PRADO', 'fbifabio@gmail.com', 12345678, SYSDATE, 'IT_PROG', 1000, NULL, NULL, 90);

-- desfaca a insercao
ROLLBACK;