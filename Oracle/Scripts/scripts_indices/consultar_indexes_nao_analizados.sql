 select distinct 'analyze table '||i.owner || '.' ||i.table_name||
                ' estimate statistics sample 25 percent;'
--select    'Index '||i.index_name||' not analyzed but table '||
          --i.owner || '.' || i.table_name||' is.'
  from    dba_tables t, dba_indexes i
 where    t.table_name    =      i.table_name
   and    t.num_rows      is not null
   and    i.distinct_keys is     null
order by 1;