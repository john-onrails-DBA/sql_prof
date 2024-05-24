-- V$SYS_TIME_MODEL mostra tempo (em microsegundos) acumulado de sistema para varias operacoes no BD
select    stat_name, value, round(value/1000000,2) time_second 
from      V$SYS_TIME_MODEL 
order by  2 desc;


/* algumas estatisticas sao filhas de outras, que contem o valor acumulado, como detalhado na lista abaixo
1) background elapsed time
      2) background cpu time
1) DB time
    2) DB CPU
    2) connection management call elapsed time
    2) sequence load elapsed time
    2) sql execute elapsed time
    2) parse time elapsed
          3) hard parse elapsed time
                4) hard parse (sharing criteria) elapsed time
                    5) hard parse (bind mismatch) elapsed time
          3) failed parse elapsed time
                4) failed parse (out of shared memory) elapsed time
    2) PL/SQL execution elapsed time
    2) inbound PL/SQL rpc elapsed time
    2) PL/SQL compilation elapsed time
    2) Java execution elapsed time
/*