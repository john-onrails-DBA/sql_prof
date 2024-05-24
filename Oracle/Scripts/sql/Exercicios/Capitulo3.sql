/* Instrucao SELECT para retornar:
	- primeiro e ultimo nomes dos empregados em letras maiusculas;
	- salario formatado para exibir os numeros inteiros + 2 decimais;
	- comissao formatada para exibir 0 no lugar de valores nulos;
	- exibir somente empregados que foram contratados no ano de 2004.
*/

select      upper(first_name ||' '|| last_name) as Nome, 
            round(salary,2) as Salario,
            nvl(commission_pct,0) as Comissao
from        hr.employees
where       to_char(hire_date,'YYYY') = '2004';