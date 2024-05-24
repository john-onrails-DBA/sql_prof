-- ao inves de:
CREATE OR REPLACE FUNCTION HR.FC_SALARY_RANK(p_departmentid NUMBER, p_salary NUMBER) RETURN NUMBER
AS
  V_TEMP_DEPTID NUMBER;
  V_CONTADOR NUMBER:=0;
BEGIN
    FOR LINHA IN (SELECT      DISTINCT SALARY
                  FROM        HR.EMPLOYEES
                  WHERE       DEPARTMENT_ID = p_departmentid
                  ORDER BY  1 DESC)
    LOOP        
        V_CONTADOR := V_CONTADOR + 1;
        IF LINHA.SALARY = p_salary THEN
            RETURN V_CONTADOR;
        END IF;
    END LOOP;
    
    RETURN -1;
END;

SELECT    employee_id,
          first_name||' '||last_name,
          DEPARTMENT_ID,
          SALARY,
          HR.FC_SALARY_RANK(DEPARTMENT_ID, SALARY) AS RANK
FROM      HR.EMPLOYEES
WHERE       DEPARTMENT_ID IS NOT NULL
ORDER BY  RANK, SALARY DESC;

-- avg como funcao analitica p/ mostrar empregado + salario + media salarial, por departamento
SELECT      employee_id,
            first_name||' '||last_name,
            DEPARTMENT_ID,
            SALARY,
            RANK() OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) AS RANK
FROM        HR.EMPLOYEES E
WHERE       DEPARTMENT_ID IS NOT NULL
ORDER BY    RANK, SALARY DESC;