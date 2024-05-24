-- ver top events nos ultimos 30 minutos (linha com valor NULL eh o tempo que a sessao nao teve wait time
-- p/ consultar a V$ACTIVE_SESSION_HISTORY precisa ter a licenca da option "Diagnostics Pack"
SELECT    EVENT,
          sum(WAIT_TIME) / 1000000 total_cpu_sec,
          sum(TIME_WAITED) / 1000000 total_wait_sec,
          SUM(WAIT_TIME + TIME_WAITED) / 1000000 TOTAL_sec
FROM      V$ACTIVE_SESSION_HISTORY
WHERE     SAMPLE_TIME > to_timestamp(sysdate - 30/60/24)
GROUP BY  EVENT
order by  TOTAL_sec desc;