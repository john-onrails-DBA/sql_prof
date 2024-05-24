-- ver mais info detalhadas sobre os top sql executados no ultimos 30 minutos
select      * 
from        v$sqlstats
where       last_active_time  > TO_TIMESTAMP(sysdate - 30/60/24)
order by    elapsed_time desc;