-- aumentando em U$10 o salario dos programadores
UPDATE      HR.EMPLOYEES
SET         SALARY = SALARY + 10
WHERE       JOB_ID = 'IT_PROG';

-- decrementando U$10 do salario dos programadores e alterando o telefone deles
UPDATE      HR.EMPLOYEES
SET         SALARY = SALARY - 10,
            PHONE_NUMBER = 11118888
WHERE       JOB_ID = 'IT_PROG';

-- alterando o salario dos programadores para todos terem salario igual ao do salario maior da empresa
UPDATE      HR.EMPLOYEES
SET         SALARY = (SELECT MAX(SALARY) FROM HR.EMPLOYEES)
WHERE       JOB_ID = 'IT_PROG';

-- alterando o salario dos empregados com o cargo igual ao do empregado 101, para ficar com salario igual do maior salario da empresa
UPDATE      HR.EMPLOYEES
SET         SALARY = (SELECT MAX(SALARY) FROM HR.EMPLOYEES)
WHERE       JOB_ID = (SELECT JOB_ID FROM HR.EMPLOYEES
                      WHERE EMPLOYEE_ID = 101);

-- alterando o salario dos empregados com o cargo 'IT_PROG' para ficar com salario igual do maior salario do seu departamento (atraves de subquerie correlacionada)
UPDATE      HR.EMPLOYEES a
SET         SALARY = (SELECT  MAX(SALARY) FROM HR.EMPLOYEES b
                      WHERE   b.department_id = a.department_id)
WHERE       JOB_ID = 'IT_PROG';

-- consultar empregado
select * from hr.employees where job_id = 'IT_PROG';

-- limpando o telefone dos empregados 'IT_PROG'
UPDATE      HR.EMPLOYEES
SET         PHONE_NUMBER = NULL
WHERE       JOB_ID = 'IT_PROG';

-- Apos conferir todas as atualizacoes, desfaca a transacao:
ROLLBACK;
