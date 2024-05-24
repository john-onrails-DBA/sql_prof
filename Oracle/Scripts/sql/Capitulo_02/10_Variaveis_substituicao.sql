-- utilizando variaveis de substituicao como valor numerico
SELECT  FIRST_NAME || ' ' || LAST_NAME AS NAME,
        JOB_ID,
        SALARY        
FROM    HR.EMPLOYEES
WHERE   DEPARTMENT_ID = &DEPARTMENT_ID;

-- utilizando variaveis de substituicao como valor alfanumerico (string)
SELECT  FIRST_NAME || ' ' || LAST_NAME AS NAME,
        JOB_ID,
        SALARY        
FROM    HR.EMPLOYEES
WHERE   JOB_ID = '&JOB_ID';


-- compare as diferencas entre as 2 instrucoes abaixo (var sub local X global):
SELECT  FIRST_NAME || ' ' || LAST_NAME AS NAME,
        '&JOB_ID',
        SALARY        
FROM    HR.EMPLOYEES
WHERE   JOB_ID = '&JOB_ID';

UNDEFINE JOB_ID
SELECT  FIRST_NAME || ' ' || LAST_NAME AS NAME,
        '&&JOB_ID',
        SALARY        
FROM    HR.EMPLOYEES
WHERE   JOB_ID = '&&JOB_ID';