------Criado Tabelas-----

CREATE TABLE usuario (
    nome varchar(30) constraint nm_usu_nn not null,
    senha varchar(11) constraint sen_usu_nn not null,
    email varchar(45) constraint eml_usu_nn not null,
    id_usuario number(10) constraint id_usu_pk PRIMARY KEY
);

create table personagem(
    ID_PERSONAGEM varchar(4) constraint id_per_pk primary key,
    NOME varchar(30) constraint nm_per_nn not null,
    NIVEL varchar(2) constraint nv_per_nn not null,
    SALDO varchar(10) constraint sal_per_nn not null
);
 

create table obtem(
    FK_ITEMS_ID_ITEM NUMBER(11) not null,
    FK_PERSONAGEM_ID_PERSONAGEM varchar(4) not null references PERSONAGEM
);

CREATE TABLE items (
    id_item number(11) constraint id_itm_pk PRIMARY KEY,
    quantidade number(10) constraint qtd_itm_nn not null,
    valor number(10,2) constraint val_itm_nn not null
);

create table compra(
    FK_IPOS_ID_IPO NUMBER(5) not null,
    FK_PERSONAGEM_ID_PERSONAGEM varchar(4) not null references PERSONAGEM
);

CREATE TABLE IPOs (
    nome varchar(80) constraint nom_ipo_nn not null,
    Prospecto varchar(500) constraint pro_ipo_nn not null,
    idIpo number(5) constraint id_ipo_pk PRIMARY KEY
);

-------Inserindo dados-------

INSERT INTO usuario VALUES(1,'Gustavo','gustavo@gmail.com','123456');
INSERT INTO usuario VALUES(2,'Mario','mario@gmail.com','78910');
INSERT INTO usuario VALUES(3,'Maria','maria@gmail.com','1515');
INSERT INTO usuario VALUES(4,'Joao','joao@gmail.com','358469');
INSERT INTO usuario VALUES(5,'Fabiana','fabi@gmail.com','4165156');
INSERT INTO usuario VALUES(6,'Lucas','lucas@gmail.com','abc123');
INSERT INTO usuario VALUES(7,'Ana','ana@gmail.com','def456');
INSERT INTO usuario VALUES(8,'Pedro','pedro@gmail.com','ghi789');
INSERT INTO usuario VALUES(9,'Carla','carla@gmail.com','jkl012');
INSERT INTO usuario VALUES(10,'Marcelo','marcelo@gmail.com','mno345');
INSERT INTO usuario VALUES(11,'Julia','julia@gmail.com','pqr678');
INSERT INTO usuario VALUES(12,'Rafaela','rafaela@gmail.com','stu901');
commit;

INSERT INTO personagem VALUES('personagem1',20,5000.00,1);
INSERT INTO personagem VALUES('personagem2',23,4000.00,2);
INSERT INTO personagem VALUES('personagem3',15,7500.00,3);
INSERT INTO personagem VALUES('personagem4',43,8000.00,4);
INSERT INTO personagem VALUES('personagem5',12,1000.00,5);
INSERT INTO personagem VALUES ('personagem6',30,9000.00,6);
INSERT INTO personagem VALUES ('personagem7',18,5500.00,7);
INSERT INTO personagem VALUES ('personagem8',27,6000.00,8);
INSERT INTO personagem VALUES ('personagem9',10,2000.00,9);
INSERT INTO personagem VALUES ('personagem10',35,10000.00,10);
INSERT INTO personagem VALUES ('personagem11',50,15000.00,11);
INSERT INTO personagem VALUES ('personagem12',15,3000.00,12);
commit;

INSERT INTO items VALUES(1,10,20.00,1);
INSERT INTO items VALUES(2,10,30.00,2);
INSERT INTO items VALUES(3,10,45.00,3);
INSERT INTO items VALUES(4,10,50.00,4);
INSERT INTO items VALUES(5,10,100.00,5);
INSERT INTO items VALUES (6,5,10.00,6);
INSERT INTO items VALUES (7,7,25.00,7);
INSERT INTO items VALUES (8,12,40.00,8);
INSERT INTO items VALUES (9,15,60.00,9);
INSERT INTO items VALUES (10,20,100.00,10);
INSERT INTO items VALUES (11,3,200.00,11);
INSERT INTO items VALUES (12,8,30.00,12);
commit;

INSERT INTO ipos VALUES(1,20.00,10,1);
INSERT INTO ipos VALUES(2,30.00,7,2);
INSERT INTO ipos VALUES(3,45.00,13,3);
INSERT INTO ipos VALUES(4,50.00,20,4);
INSERT INTO ipos VALUES(5,100.00,14,5);
INSERT INTO ipos VALUES (6,10.00,15,6);
INSERT INTO ipos VALUES (7,25.00,20,7);
INSERT INTO ipos VALUES (8,40.00,17,8);
INSERT INTO ipos VALUES (9,60.00,14,9);
INSERT INTO ipos VALUES (10,100.00,18,10);
INSERT INTO ipos VALUES (11,200.00,47,11);
INSERT INTO ipos VALUES (12,30.00,13,12);
commit;

------Retat�rios-----

1-
SELECT nome, nivel 
FROM personagem
ORDER BY nivel DESC;

2-
SELECT SUM(quantidade) as total_itens
FROM items;

3-
SELECT fk_personagem_id_personagem, COUNT(*) as total_tarefas
FROM IPOS
GROUP BY fk_personagem_id_personagem;

4-
SELECT nome
FROM usuario
WHERE id_usuario IN (
    SELECT fk_usuario_id_usuario 
    FROM saves s 
    INNER JOIN personagem p ON s.id_save = p.id_personagem
    WHERE p.nivel > (
        SELECT AVG(nivel) 
        FROM personagem
    )
);

5-
SELECT s.nome_save, p.nome, p.nivel
FROM saves s
INNER JOIN personagem p ON s.id_save = p.id_personagem
ORDER BY s.nome_save;