-- retorna lista de departamentos incluindo somente aqueles que NAO possuem empregados
--    Para retornar um resultado valido, elimine as linhas que retornam valores nulos na clausula NOT IN
SELECT          department_name                
FROM            hr.departments
WHERE           department_id NOT IN (SELECT    department_id
                                       FROM     hr.employees where department_id is not null)
ORDER BY        department_name;

-- retorna lista de departamentos incluindo somente aqueles que NAO possuem empregados
SELECT          d.department_name                
FROM            hr.departments d
WHERE           NOT EXISTS (SELECT 1
                        FROM     hr.employees e
                        where    e.department_id = d.department_id)
ORDER BY        d.department_name;