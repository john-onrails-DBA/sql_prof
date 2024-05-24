-- criando uma conta de usuario para um determinado sistema
CREATE USER ECOMMERCE IDENTIFIED BY ecommerce DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

 -- atribuindo os privilegios de sistema necessarios p/ o usuario se conectar no BD e criar objetos necessarios p/ a aplicacao
GRANT CREATE SESSION, CREATE TABLE, CREATE SEQUENCE TO ECOMMERCE;
GRANT CREATE VIEW TO ECOMMERCE;
GRANT CREATE PROCEDURE TO ECOMMERCE;

-- sem desconectar o SYS, crie uma nova conexao com o usuario ECOMMERCE e crie uma tabela
CREATE TABLE TESTE (COL1 NUMBER, COL2 NUMBER);

-- na conexao do usuario SYS revogue o privilegio CREATE TABLE do usuario ECOMMERCE
REVOKE CREATE TABLE FROM ECOMMERCE;

-- na conexao do usuario ECOMMERCE tente criar uma nova tabela e veja o que acontece
CREATE TABLE TESTE2 (COL1 NUMBER);