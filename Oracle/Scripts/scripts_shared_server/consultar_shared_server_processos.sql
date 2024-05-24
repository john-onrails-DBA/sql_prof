SELECT      d.name disp,            
            D.NETWORK,
            S.SID session_id,
            S.USERNAME,
            S.TERMINAL,            
            s.program program
FROM        v$dispatcher d,
            v$circuit c,
            v$session s,
            v$process p
WHERE       d.paddr = c.dispatcher(+)
AND         c.saddr = s.saddr(+)
AND         s.paddr = p.addr(+)
ORDER BY    d.network, d.name, s.username;