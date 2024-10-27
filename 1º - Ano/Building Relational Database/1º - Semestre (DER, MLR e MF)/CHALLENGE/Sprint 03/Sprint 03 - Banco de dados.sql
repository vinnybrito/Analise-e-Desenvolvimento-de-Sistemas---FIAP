create table usuario (
    id_usuario number(10) constraint id_user_pk primary key,
    nome varchar(30) constraint nm_user_nn not null,
    email varchar(45) constraint email_user_nn not null,
    senha varchar(11)constraint senha_user_nn not null);
    
create table save (
    id_save number (11) constraint id_save_pk primary key,
    tempo_total date constraint temp_save_nn not null,
    nome_save varchar(15)constraint nm_save_nn not null,
    fk_usuario_id_usuario number(11)constraint fk_save_nn not null
    REFERENCES usuario(id_usuario));
  
create table personagem (
    nome varchar(30) constraint nome_personagem_nn not null,
    nivel number (4) constraint nivel_personagem_nn not null,
    saldo number (10,2) constraint saldo_personagem_nn not null,
    id_personagem number (11) constraint is_personagem_pk primary key
    REFERENCES save1 (id_save));
    
create table tarefa (
    id_tarefa number (11) constraint id_tar_pk primary key,
    conquista varchar (15) constraint conq_tar_nn not null,
    fk_personagem_id_personagem number (11) constraint fk_tar_nn not null
    REFERENCES personagem (id_personagem));
    
create table items (
    id_item number (11) constraint id_itm_pk primary key,
    quantidade number (10,2) constraint qtd_itm_nn not null,
    valor number (12,2) constraint vl_itm_nn not null,
    fk_personagem_id_personagem number (11) constraint fkid_itm_nn not null
    REFERENCES personagem (id_personagem));
    
    
-------INSERINDO DADOS--------

insert into usuario values(1,'Gustavo','gustavo@gmail.com','123456');
insert into usuario values(2,'Mario','mario@gmail.com','78910');
insert into usuario values(3,'Maria','maria@gmail.com','1515');
insert into usuario values(4,'Joao','joao@gmail.com','358469');
insert into usuario values(5,'Fabiana','fabi@gmail.com','4165156');
commit;

insert into save values(6,'14-dec-09','save1','156');
insert into save values(7,'15-dec-09','save2','187');
insert into save values(8,'16-dec-09','save3','264');
insert into save values(9,'17-dec-09','save4,'257');
insert into save values(10,'18-dec-09','save5','198');
commit;

insert into personagem values('joao','10','1000,00','15');
insert into personagem values('marcos','11','100,00','16');
insert into personagem values('kaique','7','1009,00','17');
insert into personagem values('natan','5','2000,00','18');
insert into personagem values('felipe','9','1589,50','19');
commit;

insert into tarefa values('10','cp1','20');
insert into tarefa values('11','cp3','21');
insert into tarefa values('12','cp1','22');
insert into tarefa values('13','cp6','23');
insert into tarefa values('14','cp7','24');
commit;

insert into items values('10','15','1000');
insert into items values('11','16','2000');
insert into items values('12','17','3300');
insert into items values('13','18','50000');
insert into items values('14','19','1056');
commit;
    