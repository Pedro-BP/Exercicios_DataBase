create database videolocadora;

create table usuarios(
id int not null auto_increment,
nome varchar(255) not null,
primary key(id)
)default charset = utf8mb4;

create table filmes(
idfilme int not null auto_increment,
nome varchar(255) not null,
ano year,
primary key(idfilme)
)default charset = utf8mb4;

insert into usuarios (nome) values
('Perigo'),('Ryan'),('João');

insert into filmes (nome,ano) values
('O Senhor dos Anéis',2001),('Matrix',1999),('A Origem',2010);

alter table usuarios add column filme_preferido int;

-- FOREING KEY: Chave estrangeira

update usuarios set filme_preferido = '2' where id = '1';

alter table usuarios
add foreign key(filme_preferido) references filmes(idfilme);

select * from usuarios;
select * from filmes;

-- INNER JOIN: Combinar as tabelas
select u.nome, f.nome, f.ano from 
usuarios as u inner join filmes as f	-- Combinando as tabelas.
on f.idfilme = u.filme_preferido;		-- Exibe apenas os u que possuem filmes preferidos.

-- LEFT JOIN: Inclui todos os usuários 
select u.nome, u.filme_preferido, f.nome, f.ano
from usuarios as u left join filmes as f
on f.idfilme = u.filme_preferido;

-- RIGHT JOIN: Incluir todos os filmes
select u.nome, u.filme_preferido, f.nome, f.ano
from usuarios as u right join filmes as f
on f.idfilme = u.filme_preferido;

create table usuario_assiste_filme(
id int not null auto_increment,
date date,
idusuario int,
idfilme int,
primary key(id),
foreign key(idusuario) references usuarios(id),
foreign key(idfilme) references filmes(idfilme)
)default charset = utf8mb4;

insert into usuario_assiste_filme values
(default,'2004-03-01','1','2'),
(default,'2023-05-10','1','3'),
(default,'2022-12-25','2','3'),
(default,'2021-08-15','3','2'),
(default,'2020-06-30','3','1');

select * from usuario_assiste_filme;

-- Combinando 3 tabelas para exibir o nome do usuário e o nome
select u.nome,f.nome from usuarios u join usuario_assiste_filme uaf
on u.id = uaf.idusuario join filmes f
on f.idfilme = uaf.idfilme;