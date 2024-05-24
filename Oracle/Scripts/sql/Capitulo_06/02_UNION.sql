SELECT          first_name || ' ' ||last_name as complete_name,
                department_id
FROM            hr.employees
WHERE           department_id = 10
UNION 
SELECT          first_name || ' ' ||last_name as complete_name,
                department_id
FROM            hr.employees
WHERE           department_id = 20
UNION
SELECT          first_name || ' ' ||last_name as complete_name,
                department_id
FROM            hr.employees
WHERE           department_id = 10;