-- criando uma tabela com valor default em 1 coluna
CREATE TABLE hr.dept
            (deptno NUMBER(2),
            dname VARCHAR2(14),
            loc VARCHAR2(13),
            create_date DATE DEFAULT SYSDATE);

-- criando uma tabela com nome entre aspas duplas (nao recomendado)
CREATE TABLE HR."dept table@!"
            (deptno NUMBER(2),
            dname VARCHAR2(14),
            loc VARCHAR2(13),
            create_date DATE DEFAULT SYSDATE);

-- veja a estrutura das tabelas com o comando DESCRIBE (DESC)
DESC hr.dept;
            
-- inserindo dados na primeira tabela
INSERT INTO hr.dept (deptno, dname, loc) VALUES (1, 'TI', 'SP');
INSERT INTO hr.dept (deptno, dname, loc) VALUES (2, 'RH', NULL);
INSERT INTO hr.dept (deptno, dname) VALUES (3, 'CT');
COMMIT;

-- inserindo dados na segunda tabela
INSERT INTO hr."dept table@!" (deptno, dname, loc) VALUES (1, 'TI', 'SP');
INSERT INTO hr."dept table@!" (deptno, dname, loc) VALUES (2, 'RH', NULL);
INSERT INTO hr."dept table@!" (deptno, dname) VALUES (3, 'CT');
COMMIT;

-- Veja os dados das tabelas
SELECT * FROM hr.DEPT;
SELECT * FROM hr."dept table@!";

-- eh possivel criar uma tabela a partir de uma instrucao select (CTAS)
CREATE TABLE HR.DEPT_CTAS AS SELECT * FROM HR.DEPT;