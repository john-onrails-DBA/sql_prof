/* d) Crie 2 sinonimos privados no schema do usuario RHAPP que deverao referenciar as tabelas do schema RH e que deverao ter os seguintes nomes: EMP e DEP;
      Crie 1 visao no schema do usuario RHAPP com o nome VW_EMPREGADOS, que devera acessar por meio dos sinonimos os seguintes dados: nome completo dos empregados (em 1 única coluna), data de contrataçao, email e nome do departamento. Liste todos os
empregados (inclusive empregados sem departamento).                
*/

--Logado com o Usuario "sys"
GRANT CREATE SYNONYM TO RHAPP;

-- Logado com o Usuario "rhapp"
--Criando os Sinonimos
CREATE SYNONYM DEP FOR rh.departamentos;
CREATE SYNONYM EMP FOR rh.empregados;

--Criando a View
create view vw_empregados
as  
select      e.first_name || ' ' ||e.last_name as Nome,             
            hire_date as data_contratacao,
            email,
            nvl(d.department_name,'Sem Departamento') as Departamento
from        emp e
left join   dep d
    on      e.department_id = d.department_id;

-- Testando a visao    
select * from vw_empregados;