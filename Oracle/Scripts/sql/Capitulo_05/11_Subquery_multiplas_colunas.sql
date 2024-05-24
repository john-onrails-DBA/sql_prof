-- *** PREFIRA A QUERY2 AO INVES DA QUERY1 ***

-- query1: retorna lista de empregados que pertencem ao mesmo departamento e cargo do historico de cargo do empregado 101
SELECT          e.first_name, 
                e.last_name,
                e.department_id,
                e.job_id               
FROM            hr.employees e
WHERE           e.department_id IN (SELECT       d.department_id
                                    FROM         hr.departments d
                                    INNER JOIN   hr.job_history j
                                        ON       j.department_id = d.department_id
                                    WHERE        j.employee_id = 101)

AND             e.job_id        IN (SELECT       j.job_id
                                    FROM         hr.departments d
                                    INNER JOIN   hr.job_history j
                                         ON      j.department_id = d.department_id
                                    WHERE        j.employee_id = 101)
ORDER BY        1, 2;

-- query2: retorna lista de empregados que pertencem ao mesmo departamento e cargo do historico de cargo do empregado 101
SELECT          e.first_name, 
                e.last_name,
                e.department_id,
                e.job_id               
FROM            hr.employees e
WHERE           (e.department_id, e.job_id) IN 
                              (SELECT       d.department_id, j.job_id
                               FROM         hr.departments d
                               INNER JOIN   hr.job_history j
                                    ON      j.department_id = d.department_id
                               WHERE        j.employee_id = 101)
ORDER BY        1, 2;