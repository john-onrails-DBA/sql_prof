select      OWNER,
            TABLE_NAME,
            COUNT(1) index_count
from        dba_indexes 
where       OWNER not in ('SYS','SYSTEM')
group by    OWNER, TABLE_NAME 
having      COUNT(1) > 5 
order by    COUNT(1) desc, OWNER, TABLE_NAME
