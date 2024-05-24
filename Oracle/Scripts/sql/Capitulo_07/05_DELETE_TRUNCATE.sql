-- apagando dados do departamento 280
DELETE FROM   HR.DEPARTMENTS
WHERE         department_id = 280;
commit;

-- apagando dados do departamento 290 e 300
DELETE FROM   HR.DEPARTMENTS
WHERE         department_id IN (290, 300);
commit;

-- apagando departamentos que nao possuem funcionarios
DELETE FROM   HR.DEPARTMENTS
WHERE         department_id IN (
                                SELECT  department_id
                                from    HR.departments d
                                where   not exists
                                        ( SELECT  1 
                                          FROM    HR.EMPLOYEES e
                                          WHERE   e.department_id = d.department_id
                                        )
                                );
rollback;

-- criando tabela clone da departamentos para poder fazer um truncate nela
CREATE TABLE HR.DEP AS SELECT * FROM HR.departments;

-- compare o tempo de um delete completo e um truncate
DELETE FROM HR.DEP;
ROLLBACK;
TRUNCATE TABLE HR.DEP;
