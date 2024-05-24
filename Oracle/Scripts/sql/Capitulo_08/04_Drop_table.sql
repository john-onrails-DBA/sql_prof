-- alterando a tabela indo p/ a lixeira
drop TABLE hr.dept3;

-- alterando a tabela sem ir p/ a lixeira
drop TABLE hr.dep2 purge;

-- recuperando uma tabela da lixeira
flashback table hr.dept3 to before drop;