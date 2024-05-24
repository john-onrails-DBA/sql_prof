/*
    Escrever uma instrucao SELECT para recuperar uma lista de empregados do departamento com codigo 30, ordenados pela data de contratacao. 
    A lista devera retornar somente primeiro e ultimo nomes do empregado, cargo, salario e data de contratacao.
*/
select      first_name,
            last_name,
            job_id,
            salary,
            hire_date 
from        hr.employees
where       department_id = 30
order by    hire_date;