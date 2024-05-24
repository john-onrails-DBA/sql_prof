--Exercicio 1: instrucao SELECT para retornar a quantidade de empregados, por cargo, que possuem salario maior que 10 mil
select      count(1),
            job_id 
from        HR.employees
where       salary > 10000
group by    job_id;

-- Exercicio 2: instrucao SELECT p/ retornar a qtde. de empregados, por departamento, 
--                          somente departamentos que possuem media salarial > 10 mil
select      count(1),
            department_id 
from        HR.employees
having      avg(salary) > 10000
group by    department_id;