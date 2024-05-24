-- consulta TAMANHO dos indices conforme estatísticas do BD (ver data última análise na coluna "Last Analyzed")
-- se desejar ver todas as tabelas de todos os schemas não informar valor para o parametro OWNER
SELECT    i.owner,
          i.index_name AS "Index Name", 
          nvl(i.num_rows,0) AS "Rows", 
          --i.avg_row_len AS "Avg Row Len (bytes)", 
          ROUND((nvl(i.leaf_blocks,0) * p.value)/1024/1024,2) AS "Size MB", 
          i.last_analyzed AS "Last Analyzed"
FROM      dba_indexes i,
          v$parameter p
WHERE     i.owner = UPPER(NVL('&OWNER',i.owner))
AND       p.name = 'db_block_size'
ORDER by  4 desc;