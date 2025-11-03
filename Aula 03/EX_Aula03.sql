-- 1. Crie um banco de dados chamado "ecommerce" com suporte a caracteres acentuados.
create database ecommerce
default character set utf8mb4
default collate utf8mb4_general_ci;
use ecommerce;

-- 2. Crie uma tabela "produtos" com as colunas: id (chave primária com auto incremento), nome e preco.
create table produtos(
id int not null auto_increment,
nome varchar(50) not null,
preco decimal(6,2),
primary key (id)
) default charset = utf8mb4;
select * from produtos;

-- 3. Adicione uma coluna "descricao" à tabela "produtos" após a coluna "nome".
alter table produtos
add column descricao varchar(50) after nome;
select * from produtos;

-- 4. Insira um produto na tabela "produtos" com os seguintes dados: nome = "Camiseta", descricao = "Camiseta de algodão, 
-- tamanho M", preco = 29.90.
insert into produtos values
(default, 'Camiseta', 'Camiseta de algodão, tamanho M', 29.90);
select * from produtos;

-- 5. Remova a coluna "descricao" da tabela "produtos".
alter table produtos
drop column descricao;
select * from produtos;

-- 6. Crie uma tabela "clientes" com as colunas: id (chave primária com auto incremento) e nome.
create table clientes (
id int not null auto_increment,
nome varchar(50),
primary key (id)
) default charset = utf8mb4;
select * from clientes;

-- 7. Adicione as colunas "email" e "telefone" à tabela "clientes", sendo "email" a primeira coluna e "telefone" após o "nome".
alter table clientes
add column email varchar(50) first,
add column telefone int(9) after nome;
select * from clientes; 

-- 8. Modifique a coluna "telefone" para aceitar apenas valores positivos.
alter table clientes 
modify column telefone int(9) unsigned;
select * from clientes;

-- 9. Insira dois clientes na tabela "clientes".
insert into clientes values
('jorgeborba1998@gmail.com', default, 'Jorge Borba', 984758214),
('carlaflores2000@gmail.com', default, 'Carla Flores', 994575687);
select * from clientes;

-- 10. Renomeie a tabela "clientes" para "usuarios".
alter table clientes
rename to usuarios;
select * from usuarios;

-- 11. Crie um banco de dados chamado "livraria".
create database livraria
default character set utf8mb4
default collate utf8mb4_general_ci;
use livraria;

-- 12. Crie uma tabela "livros" com as colunas: titulo, autor e ano_publicacao.
create table livros(
titulo varchar(50),
autor varchar(50),
ano_publicacao int(4)
) default charset = utf8mb4;
select * from livros;

-- 13. Adicione uma coluna "id" como chave primária com auto incremento no início da tabela "livros".
alter table livros
add column id int not null auto_increment first,
add primary key (id);
select * from livros;

-- 14. Adicione uma coluna "estoque" (tipo int) à tabela "livros" com valor padrão 0.
alter table livros
add column estoque int default(0);
select * from livros;

-- 15. Insira três livros na tabela "livros".
insert into livros values
(default, 'Don Quixote', 'Miguel de Cervantes', 1605, 2),
(default, 'A Tale of Two Cities', 'Charles Dickens', '1859', 1);
insert into livros values
(default, 'One Hundred Years of Solitude', 'Gabriel García Márquez', 1967, 1);
select * from livros;

-- 16. Remova a tabela "livros" se ela existir.
drop table livros;

-- 17. Crie um banco de dados chamado "rh".
create database rh
default character set utf8mb4
default collate utf8mb4_general_ci;
use rh;

-- 18. Crie uma tabela "funcionarios" com as colunas: nome, cargo e salario.
create table funcionarios(
nome varchar(50),
cargo varchar(50),
salario decimal(6,2)
) default charset = utf8mb4;
select * from funcionarios;

-- 19. Adicione uma coluna "id" como chave primária com auto incremento no início da tabela "funcionarios".
alter table funcionarios
add column id int not null auto_increment first,
add primary key (id);
select * from funcionarios;

-- 20. Insira um funcionário na tabela "funcionarios".
insert into funcionarios values
(default, 'Pablo Pereira', 'ADM', 3500.00);
select * from funcionarios;

-- 21. Renomeie a coluna "salario" para "remuneracao" na tabela "funcionarios".
alter table funcionarios
change column salario remuneracao decimal(6,2);
select * from funcionarios;

-- 22. Crie um banco de dados chamado "streaming".
create database streaming
default character set utf8mb4
default collate utf8mb4_general_ci;
use streaming;

-- 23. Crie uma tabela "series" com as colunas: id, titulo, genero e num_temporadas. Defina a coluna "id" como 
-- chave primária com auto incremento e a coluna "titulo" como única.
create table series(
id int not null auto_increment,
titulo varchar(50) unique,
genero varchar(50),
num_temporadas int(3),
primary key (id)
) default charset = utf8mb4;
select * from series;

-- 24. Insira duas séries na tabela "series".
insert into series values
(default, 'Breaking Bad', 'Drama / Crime / Suspense', 5),
(default, 'Stranger Things', 'Ficção científica / Terror / Aventura', 4);
select * from series;

-- 25. Crie um banco de dados chamado "restaurante".
create database restaurante
default character set utf8mb4
default collate utf8mb4_general_ci;
use restaurante;

-- 26. Crie uma tabela "pratos" com as colunas: nome, descricao e preco.
create table pratos(
nome varchar(50),
descricao varchar(50),
preco decimal(6, 2)
) default charset = utf8mb4;
select * from pratos;

-- 27. Adicione uma coluna "id" como chave primária com auto incremento no início da tabela "pratos".
alter table pratos
add column id int not null auto_increment first,
add primary key (id);
select * from pratos;