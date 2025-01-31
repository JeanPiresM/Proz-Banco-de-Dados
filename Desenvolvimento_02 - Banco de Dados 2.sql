create database proz;

use proz;

create table aluno(
id int auto_increment primary key,
nome varchar(100),
sobrenome varchar(100),
data_nascimento date
);


create table lembrete(
id int auto_increment primary key,
id_aluno int,
mensagem varchar(255),
foreign key (id_aluno) references aluno(id)
);


DELIMITER $$

CREATE TRIGGER inserir_dados 
AFTER INSERT 
ON aluno
FOR EACH ROW
BEGIN
    IF NEW.data_nascimento IS NULL THEN
        INSERT INTO lembrete(id_aluno, mensagem)
        VALUES(NEW.id, CONCAT('Olá ', NEW.nome, ', atualize sua data de nascimento'));
    END IF;
END$$

insert into aluno(nome,sobrenome) values ("Jean", "Pires");

select * from lembrete;



