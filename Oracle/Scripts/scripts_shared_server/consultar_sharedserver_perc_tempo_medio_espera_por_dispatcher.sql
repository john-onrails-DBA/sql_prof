/*
Permite recuperar o tempo médio percentual de espera que um usuário leva para ser atendido por um dispatcher. Um percentual de tempo muito alto pode indicar que mais Dispatchers devem ser criados na configuração de Shared Server.
*/
select  name,
        network "Protocol",
        status "Status",
        sum(owned) "Clients",
        sum(busy)*100/(sum(busy)+sum(idle)) "Busy Rate"
FROM    v$dispatcher
GROUP BY name, network, status;