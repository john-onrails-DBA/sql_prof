-- retorna lista de departamentos diferentes do departamento do empregado com codigo 100
SELECT          department_name, department_id
FROM            hr.departments
WHERE           department_id != (SELECT    department_id
                                   FROM     hr.employees
                                   WHERE    employee_id = 100)
ORDER BY        department_name;