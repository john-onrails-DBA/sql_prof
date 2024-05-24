--Exercicio 1: atualize os e-mails de todos os empregados dos departamentos 10, 20 e 30, 
--        acrescentando ao final do e-mail a seguinte string: '@fabioprado.net'
update  hr.employees
set     email = email || '@fabioprado.net'
where   department_id in (10,20,30);
commit;

/* Exercicio 2: Limpe as tabelas EMP2, EMP3 e EMP4 com o comando mais indicado p/ zerar a tabela. 
                Depois, insira dados nestas tabelas utilizando o comando mais indicado p/ esta finalidade, seguindo as regras abaixo:
                    - empregados do departamento 10 na EMP2;
                    - empregados com cargo IT_PROG na EMP3;
                    - empregados sem comissão na EMP4.   
*/

Truncate table HR.emp2;
Truncate table HR.emp3;
Truncate table HR.emp4;

INSERT FIRST
   WHEN department_id = 10 THEN INTO hr.emp2 
            VALUES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
   WHEN job_id = 'IT_PROG' THEN INTO hr.emp3 
            VALUES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
   WHEN commission_pct is null THEN INTO hr.emp4
            VALUES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID)
SELECT  *
FROM    hr.employees;    
COMMIT;