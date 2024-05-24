-- self-join para recuperar na mesma linha os dados de um empregado e do seu chefe
SELECT          e.employee_id,
                E.FIRST_NAME || ' ' || E.LAST_NAME EMPLOYEE_NAME,
                JE.JOB_TITLE,              
                JM.JOB_TITLE AS MANAGER_JOB,
                M.FIRST_NAME || ' ' || M.LAST_NAME MANAGER_NAME
FROM            HR.EMPLOYEES E
INNER JOIN      HR.EMPLOYEES M
    ON          E.manager_id = M.EMPLOYEE_ID
INNER JOIN      HR.JOBS JE
    ON          E.JOB_ID = JE.JOB_ID
INNER JOIN      HR.JOBS JM
    ON          M.JOB_ID = JM.JOB_ID;

-- query hierarquica para recuperar na mesma linha os dados de um empregado e do seu chefe    
SELECT        e.employee_id, 
              E.FIRST_NAME || ' ' || E.LAST_NAME EMPLOYEE_NAME, 
              J.JOB_TITLE,
              LEVEL,  -- level indica o nivel do cargo na hierarquia  
			  PRIOR E.FIRST_NAME || ' ' || PRIOR E.LAST_NAME AS MANAGER_NAME, -- prior retorna dados do empregado no cargo imediatamente acima na hierarquia                
              PRIOR J.JOB_TITLE AS MANAGER_JOB,
              PRIOR E.FIRST_NAME || ' ' || PRIOR E.LAST_NAME AS MANAGER_NAME
FROM          HR.EMPLOYEES E
INNER JOIN    HR.JOBS J
  ON          E.JOB_ID = J.JOB_ID
START WITH   e.manager_id  IS NULL  -- start with indica onde come?a a montar a hierarquia     
CONNECT BY PRIOR  E.EMPLOYEE_ID = E.MANAGER_ID; -- connect by prior indica colunas de relacionamento da hierarquia (TOP DOWN)