-- retorna total de empregados por faixa salarial: maior que 2000, entre 2001 e 4000 e maior que 4000
SELECT COUNT (CASE WHEN salary < 2000 
                   THEN 1 ELSE null END) count1, 
       COUNT (CASE WHEN salary BETWEEN 2001 AND 4000 
                   THEN 1 ELSE null END) count2, 
       COUNT (CASE WHEN salary > 4000 
                   THEN 1 ELSE NULL END) COUNT3 
FROM  HR.EMPLOYEES;