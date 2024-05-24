-- consulta TAMANHO (físico) das tabelas conforme estatísticas do BD (ver data última análise na coluna "Last Analyzed")
-- informe o nome de um schema para pesquisar as tabelas de um schema especifico ou não informe nome de schema para pesquisar todas as tabelas do BD
SELECT    t.owner,
          t.table_name AS "Table Name", 
          t.num_rows AS "Rows", 
          t.avg_row_len AS "Avg Row Len (bytes)", 
          ROUND((t.blocks * p.value)/1024/1024,2) AS "Size MB", 
          t.last_analyzed AS "Last Analyzed"
FROM      dba_tables t,
          v$parameter p
WHERE     t.owner = NVL(UPPER('&P_OWNER'),t.owner)
AND       p.name = 'db_block_size'
AND       t.num_rows is not null
AND       t.blocks is not null
ORDER by  5 desc;


