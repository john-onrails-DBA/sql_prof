-- alterando a sequencia:
ALTER SEQUENCE HR.SQ_EMPLOYEES INCREMENT BY 2;
    
-- inserindo dados utilizando a sequencia
INSERT INTO HR.EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES      (HR.SQ_EMPLOYEES.NEXTVAL, 'JOSE', 'SILVA', 'JOSE.SILVA', 12345678, SYSDATE, 'IT_PROG', 1000, NULL, NULL, 60);

-- veja o valor da sequencia 
SELECT HR.SQ_EMPLOYEES.CURRVAL FROM DUAL;

-- desfaca a insercao
ROLLBACK;

-- insira novamente os dados
INSERT INTO HR.EMPLOYEES (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES      (HR.SQ_EMPLOYEES.NEXTVAL, 'JOSE', 'SILVA', 'JOSE.SILVA', 12345678, SYSDATE, 'IT_PROG', 1000, NULL, NULL, 60);

-- veja qto foi o incremento da sequencia 
SELECT HR.SQ_EMPLOYEES.CURRVAL FROM DUAL;

ROLLBACK;