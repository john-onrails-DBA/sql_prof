/*   
    Exercicio 1: instrucao SELECT para retornar:
        - primeiro e ultimo nome dos empregados + nome do departamento em que eles estao alocados
        - empregados que ainda nao estao alocados em departamento algum, substituindo nulo do departamento pela frase “Sem Departamento”
        - ordenar dados pela ordem crescente de depto., primeiro e ultimo nome
*/
select      e.first_name || ' ' ||e.last_name as Nome, 
            nvl(d.department_name,'Sem Departamento') as Departamento
from        hr.employees e
left join   hr.departments d
    on      e.department_id = d.department_id
order by    2, 1;

/*
    Exercicio 2: subquery para retornar:  
        - primeiro e último nome dos empregados + e-mail + cargo;
        - empregados que já possuíram o cargo AC_ACCOUNT e que estiveram neste cargo antes de 31/12/2005;
        - usar funcoes somente em valores literais (e nao nas colunas).
*/
SELECT      e.FIRST_NAME AS "Nome",
            e.LAST_NAME  AS "Sobrenome",
            e.EMAIL as "E-mail",
            j.job_title AS "Cargo"
FROM        HR.EMPLOYEES e
INNER JOIN  HR.JOBS j
    ON      e.JOB_ID = j.JOB_ID
WHERE       e.employee_id in ( SELECT   jh.employee_id 
                               FROM     HR.job_history jh
                               WHERE    jh.job_id = 'AC_ACCOUNT'
                               AND      jh.END_DATE < TO_DATE('31/12/2005', 'DD/MM/YYYY')
                              );