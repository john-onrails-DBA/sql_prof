-- bloqueia no SELECT a linha 101
SELECT  * 
FROM    HR.EMPLOYEES
where   employee_id = 101 FOR UPDATE;

-- ver bloqueio
select SESSION_ID, OWNER, NAME, MODE_HELD from dba_dml_locks;

-- libera bloqueio
COMMIT;

-- executar update em uma 2a. sessao conectada no bd
UPDATE HR.EMPLOYEES
SET    HIRE_DATE = sysdate
where employee_id = 101;

