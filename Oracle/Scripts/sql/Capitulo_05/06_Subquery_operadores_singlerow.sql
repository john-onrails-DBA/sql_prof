-- retorna departamento igual ao departamento do empregado com codigo 100
SELECT          department_name, department_id
FROM            hr.departments
WHERE           department_id = (SELECT    department_id
                                   FROM     hr.employees
                                   WHERE    employee_id = 100)
ORDER BY        department_name;

-- retorna total de departamentos incluindo somente aqueles com id maior que o do departamento do empregado com codigo 100
SELECT          count(1)
FROM            hr.departments
WHERE           department_id > (SELECT    department_id
                                   FROM     hr.employees
                                   WHERE    employee_id = 100)
ORDER BY        department_name;

-- retorna total de departamentos incluindo somente aqueles com id maior que o do departamento do empregado com codigo 100
SELECT          count(1)
FROM            hr.departments
WHERE           department_id >= (SELECT    department_id
                                   FROM     hr.employees
                                   WHERE    employee_id = 100)
ORDER BY        department_name;