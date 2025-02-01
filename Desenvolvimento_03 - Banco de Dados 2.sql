use proz;


create table produtos(
id int auto_increment primary key,
nome_produto varchar(250)
);

create table vendas(
id int auto_increment primary key,
id_produto int,
quantidade_vendida int,
data_venda date,
foreign key (id_produto) references produtos(id)
 );

insert into produtos(nome_produto) values
('Notebook'),
('Mouse'),
('Teclado'),
('Monitor');

insert into vendas(id_produto, quantidade_vendida, data_venda) values
( 1, 5, '2024-01-30'),
(2, 10, '2024-01-30'),
(3, 7, '2024-01-31'),
(4, 5, '2024-01-31'),
( 1, 9, '2024-01-30');

DELIMITER $$
 
create procedure quantidade_diaria_vendida(data_da_venda date)
begin
select p.nome_produto, v.data_venda,sum(quantidade_vendida) as quantidade_diaria_vendida
from vendas v
join produtos p
on p.id = v.id_produto
where v.data_venda = data_da_venda
group by p.nome_produto, v.data_venda;
END $$;

DELIMITER ;


Call quantidade_diaria_vendida('2024-01-31');
 

