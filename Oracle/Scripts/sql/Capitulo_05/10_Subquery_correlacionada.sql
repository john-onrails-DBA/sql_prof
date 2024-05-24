-- retorna empregados com maior salario em cada departamento
SELECT          e.department_id,
                e.first_name || ' ' || e.last_name as name,
                e.salary                
FROM            hr.employees e
WHERE           e.salary = (SELECT  max(salary)
                            FROM    HR.EMPLOYEES s
                            WHERE   e.department_id = s.department_id)
ORDER BY        1;

-- retorna id dos empregados que trocaram de cargo pelo menos 1 vez
SELECT    e.employee_id
FROM      hr.employees e
WHERE     1 <= (SELECT  COUNT(1)
                FROM    hr.job_history j
                WHERE   j.employee_id = e.employee_id);