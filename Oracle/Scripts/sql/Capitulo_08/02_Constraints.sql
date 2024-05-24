-- criando constraints no nivel da coluna
CREATE TABLE hr.dept2
            (
            deptno NUMBER(2) 
                        CONSTRAINT pk_dept2_deptno PRIMARY KEY,
            dname VARCHAR2(14) NOT NULL,
            loc VARCHAR2(13) 
                        CONSTRAINT CK_DEPT2_LOC CHECK(loc in ('SP', 'RJ', 'MG')),
            create_date DATE DEFAULT SYSDATE
                        CONSTRAINT PK_DEPT2_CREATEDATE UNIQUE    
            );

-- criando constraints no nivel da tabela
CREATE TABLE hr.dept3
            (
            deptno NUMBER(2),                         
            dname VARCHAR2(14),
            loc VARCHAR2(13),                        
            create_date DATE DEFAULT SYSDATE,
            CONSTRAINT pk_dept3_deptno PRIMARY KEY(deptno)
            );
            
-- criando constraint fk
CREATE TABLE hr.emp2
            (
            empno NUMBER(2) 
                        CONSTRAINT pk_emp_empno PRIMARY KEY,
            ename VARCHAR2(50) NOT NULL,
            deptno NUMBER(2),                        
            CONSTRAINT FK_EMP2_DEPT2 FOREIGN KEY(deptno) REFERENCES HR.DEPT2(deptno)
            );            
  
