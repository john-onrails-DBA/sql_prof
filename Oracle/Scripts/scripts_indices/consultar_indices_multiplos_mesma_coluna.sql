select      TABLE_OWNER,
            TABLE_NAME,
            COLUMN_NAME,
            count(1) total_indices
from        dba_ind_columns 
where       COLUMN_POSITION=1
and         TABLE_OWNER not in ('SYS','SYSTEM')
group by    TABLE_OWNER, TABLE_NAME, COLUMN_NAME
having      count(1) > 1 