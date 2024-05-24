/*  Instrucao SELECT para retornar:
        - primeiro e ultimo nome empregados + nome departamento, incluindo empregado(s) sem departamento sem utilizar OUTER JOIN (utilizando o operador de conjunto mais performatico)
        - empregados que nao estao alocados em departamento algum, substituindo o valor nulo do departamento, pela frase “Sem Departamento”;
        - ordenar dados pela ordem crescente de depto., primeiro e ultimo nome.
*/
select      e.first_name || ' ' ||e.last_name as Nome,
            d.department_name as Departamento
from        hr.employees e 
inner join  hr.departments d
    on      e.department_id = d.department_id
where       e.department_id is not null
union all
select      e.first_name ||' '||e.last_name,
            'Sem Departamento'
from        hr.employees e
where       e.department_id is null
order by    2, 1;