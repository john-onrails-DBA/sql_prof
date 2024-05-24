-- semi-join com clausula IN: retorna lista de departamentos incluindo somente aqueles que possuem empregados
SELECT          department_name                
FROM            hr.departments
WHERE           department_id IN (SELECT    department_id
                                   FROM     hr.employees)
ORDER BY        department_name;

-- retorna lista de empregados com salario maior que qq salario dos empregados com cargo SA_REP, que nao sejam os proprios SA_REP
SELECT    employee_id, last_name, job_id, salary
FROM      hr.employees
WHERE     salary > ANY  ( SELECT  salary
                          FROM    hr.employees
                          WHERE   job_id = 'SA_REP')
AND       job_id <> 'SA_REP';

-- retorna lista de empregados SOMENTE com salario maior que os salarios dos empregados com cargo SA_REP, que nao sejam os proprios SA_REP.
-- Nesta lista so ira retornar os empregados que possuem salarios maior que o maior salario de um SA_REP. que tenham cargos diferentes
SELECT    employee_id, last_name, job_id, salary
FROM      hr.employees
WHERE     salary > ALL  ( SELECT  salary
                          FROM    hr.employees
                          WHERE   job_id = 'SA_REP')
AND       job_id <> 'SA_REP';

-- semi-join com clausula EXISTS: retorna lista de departamentos incluindo somente aqueles que possuem empregados
SELECT          d.department_name                
FROM            hr.departments d
WHERE           EXISTS (SELECT 1
                        FROM     hr.employees e
                        where    e.department_id = d.department_id)
ORDER BY        d.department_name;