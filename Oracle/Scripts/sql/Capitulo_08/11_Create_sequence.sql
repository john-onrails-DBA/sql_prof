-- criando uma sequencia:
CREATE SEQUENCE HR.SQ_EMPLOYEES
    MINVALUE 1 MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 300 
    CACHE 20 NOCYCLE;
    
-- inserindo dados utilizando a sequencia
INSERT INTO HR.EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES      (HR.SQ_EMPLOYEES.NEXTVAL, 'JOSE', 'SILVA', 'JOSE.SILVA', 12345678, SYSDATE, 'IT_PROG', 1000, NULL, NULL, 60);

-- veja o valor da sequence que foi utilizada na instrucao anterior
SELECT HR.SQ_EMPLOYEES.CURRVAL FROM DUAL;

-- veja a linha inserida fornecendo o valor recuperado no passo anterior
SELECT *  FROM HR.employees
WHERE     employee_id = &employee_id;

-- desfaca a insercao
ROLLBACK;

-- insira novamente os dados
INSERT INTO HR.EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES      (HR.SQ_EMPLOYEES.NEXTVAL, 'JOSE', 'SILVA', 'JOSE.SILVA', 12345678, SYSDATE, 'IT_PROG', 1000, NULL, NULL, 60);

-- veja se o valor atual da sequence mudou
SELECT HR.SQ_EMPLOYEES.CURRVAL FROM DUAL;

-- desfaca a insercao
ROLLBACK;

-------------------------------------------------------------------------
-- criando uma sequencia:
CREATE SEQUENCE HR.SQ_EMP2
    MINVALUE 1 MAXVALUE 9999999999999999999999999999 
    INCREMENT BY 1 
    START WITH 1
    CACHE 20 NOCYCLE;
    
-- tente verificar o valor atual dela:
SELECT HR.SQ_EMP2.CURRVAL FROM DUAL;
    