create database proz;

use proz;

create table aluno(
id int auto_increment primary key,
nome varchar(100),
sobrenome varchar(100)
);

create table curso(
id int auto_increment primary key,
id_aluno int not null,
nome_curso varchar(100),
foreign key (id_aluno) references aluno(id)
);

insert into aluno(nome, sobrenome) 
values
("Jean","Pires"),
("João","Pedro"),
("Maria","Fernanda");

insert into curso(id_aluno, nome_curso) 
values
(1,"Front-End"),
(1,"Back-End"),
(2,"Banco de Dados"),
(3, "Banco de Dados");

select a.id as id_aluno,
a.nome, 
a.sobrenome, 
c.id as id_curso,
nome_curso
from aluno a
join
curso c
on a.id = c.id_aluno;


select a.id as id_aluno,
a.nome, 
a.sobrenome, 
c.id as id_curso,
nome_curso
from aluno a
join
curso c
on a.id = c.id_aluno
where nome_curso like "Banco de Dados"