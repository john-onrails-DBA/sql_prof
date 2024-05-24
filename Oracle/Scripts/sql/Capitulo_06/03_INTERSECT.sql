SELECT          first_name || ' ' ||last_name as complete_name,
                department_id
FROM            hr.employees
WHERE           department_id = 10
INTERSECT 
SELECT          first_name || ' ' ||last_name as complete_name,
                department_id
FROM            hr.employees
WHERE           department_id = 20;

SELECT          first_name || ' ' ||last_name as complete_name,
                department_id
FROM            hr.employees
WHERE           department_id = 10
INTERSECT
SELECT          first_name || ' ' ||last_name as complete_name,
                department_id
FROM            hr.employees
WHERE           department_id = 10;