-- NATURAL JOIN: no exemplo abaixo a ligacao eh feita pela coluna department_id, que tem o mesmo nome e tipo de dado em ambas as tabelas
SELECT          department_name,
                first_name || ' ' ||last_name as complete_name                
FROM            hr.employees
NATURAL JOIN    hr.departments
ORDER BY        department_name, complete_name;

-- USING: no exemplo abaixo a ligacao eh feita pela coluna department_id, que tem o mesmo nome e que NAO PRECISA ter o mesmo tipo de dado em ambas as tabelas
SELECT          department_name,
                first_name || ' ' ||last_name as complete_name                
FROM            hr.employees
INNER JOIN      hr.departments
     USING      (department_id)  -- nao qualifique a coluna
ORDER BY        department_name, complete_name;

-- ON: no exemplo abaixo a ligacao eh feita pelas colunas referenciadas nas tabelas (NAO PRECISA ter mesmo nome e NEM mesmo tipo de dado)
SELECT          d.department_name,
                e.first_name || ' ' || e.last_name as complete_name                
FROM            hr.employees e
INNER JOIN      hr.departments d
     ON         (e.department_id = d.department_id)
ORDER BY        d.department_name, complete_name;

-- Apesar de nao ser recomendado, eh possivel filtrar dados na clausula ON. O recomendado eh filtrar somente na clausula WHERE
SELECT          d.department_name,
                e.first_name || ' ' || e.last_name as complete_name                
FROM            hr.employees e
INNER JOIN      hr.departments d
     ON         (e.department_id = d.department_id)
     AND        d.department_id = 20
ORDER BY        d.department_name, complete_name;