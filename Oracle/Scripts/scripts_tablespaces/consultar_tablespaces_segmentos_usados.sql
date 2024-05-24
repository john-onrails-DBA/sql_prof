select  owner,  segment_name, blocks, extents,  bytes/1024 KBYTES 
from    dba_segments  
where   tablespace_name = '&TABLESPACE_NAME';
-- objetos na recycle bin aparecem aqui: para limpar recycle bin digite PURGE RECYCLEBIN;