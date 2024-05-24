-- ver estatisticas de sistema acumuladas (desde o startup)
SELECT      S.name, S.value
FROM        v$sysstat s
order by    value desc;