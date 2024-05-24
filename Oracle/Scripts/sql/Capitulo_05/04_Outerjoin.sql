-- LEFT JOIN: retorna registros que combinam + registros que nao combinam da tabela a ESQUERDA, ou seja,
--    empregados que nao estao alocados em departamento algum (ver linhas onde DEPARTMENT_NAME tem o valor NULL)
SELECT          d.department_name,
                e.first_name, e.last_name
FROM            hr.employees e
LEFT JOIN       hr.departments d
     ON         (e.department_id = d.department_id)
ORDER BY        d.department_name, e.first_name, e.last_name;

-- RIGHT JOIN: retorna registros que combinam + registros que nao combinam da tabela a DIREITA, ou seja,
--    departamentos que nao possuem empregados (ver linhas onde FIRST_NAME e LAST_NAME tem o valor NULL)
SELECT          d.department_name,
                e.first_name, e.last_name
FROM            hr.employees e
RIGHT JOIN      hr.departments d
     ON         (e.department_id = d.department_id)
ORDER BY        d.department_name, e.first_name, e.last_name;

-- FULL JOIN: retorna registros que combinam + registros que nao combinam das 2 tabelas (igual LEFT JOIN + RIGHT JOIN)
SELECT          d.department_name,
                e.first_name, e.last_name
FROM            hr.employees e
FULL JOIN       hr.departments d
     ON         (e.department_id = d.department_id)
ORDER BY        d.department_name, e.first_name, e.last_name;