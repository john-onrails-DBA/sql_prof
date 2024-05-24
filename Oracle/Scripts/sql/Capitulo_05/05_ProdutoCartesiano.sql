-- CROSS JOIN = produto cartesiano
SELECT          d.department_name,
                e.first_name, e.last_name
FROM            hr.employees e
CROSS JOIN      hr.departments d     
ORDER BY        d.department_name, e.first_name, e.last_name;

-- produto cartesiano gerado porque na query abaixo faltou indicar as colunas de ligacao entre as 2 tabelas: 
SELECT          d.department_name,
                e.first_name, e.last_name
FROM            hr.employees e,
                hr.departments d     
WHERE           d.department_id = 20;