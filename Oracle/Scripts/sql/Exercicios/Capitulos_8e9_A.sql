/*  a) Crie 2 usuarios no BD:
        O primeiro com o nome RH, devera conter os seguintes privilegios: conectar no BD, criar tabelas e visoes;
        O segundo com o nome RHAPP, devera conter privilegios apenas para se conectar no BD;
        Ambos deverão ter USERS como tablespace padrao de dados e deverao ter cotas ilimitadas de gravacao neste tablespace.
*/

create user RH identified by rh default tablespace users QUOTA UNLIMITED ON USERS;
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW TO RH;

create user RHAPP identified by rhapp default tablespace users QUOTA UNLIMITED ON USERS;
GRANT CREATE SESSION TO RHAPP;