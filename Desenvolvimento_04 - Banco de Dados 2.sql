use proz;

create table clientes(
id int auto_increment primary key,
primeiro_nome varchar(75),
sobrenome varchar(75),
data_cadastro date
);

insert into clientes(primeiro_nome, sobrenome, data_cadastro) 
values 
("Jean", "Pires", "2025-01-31"),
("Maria", "Pereira", "2025-01-30"),
("João", "Pedro", "2025-01-31"),
("Fernanda", "Ribeiro", "2025-01-31");


DELIMITER $$
create function contagem_cadastros(data_do_cadastro date)
returns int
READS SQL DATA
begin
	declare quantidade int;

	select count(*) into quantidade
	from clientes
	where data_cadastro = data_do_cadastro;
	return quantidade;
end $$;

DELIMITER ;

select contagem_cadastros("2025-01-31")