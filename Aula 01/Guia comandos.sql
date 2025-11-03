create database cadastro -- Criar DataBase
default character set utf8mb4 -- faz o DataBase aceitar caracteres especiais
default collate utf8mb4_general_ci; -- faz o DataBase aceitar acentuação

use cadastro;

create table pessoas( -- Criar tabela
id int not null auto_increment, -- vai ser incrementado um valor automáticamente
nome varchar(50) not null,
nascimento date, -- faz um formato de data
sexo enum('M','F','O'), -- só aceira se uma das opções
peso decimal(5,2), -- pega o total de numeros e coloca a virgula
altura decimal(3,2),
nacionalidade varchar(20) default 'Brasil',
primary key (id) -- algo único
)default charset = utf8mb4; 

desc pessoas; -- describe (descrição da tabela)
select * from pessoas; -- selecionando todas as informações da tabela pessoas

drop table pessoas; -- exclui uma tabela
drop database cadastro; -- exclui uma database

-- INSERINDO DADOS
-- 1º Maneira Padrão
insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default, 'Jailson', '1995-12-30', 'M', '80.5', '1.80', default);

-- 2º Maneira Simplificada
insert into pessoas values
(default, 'Paulo Guina', '1998-03-05', 'M', '90.4', '1.95', default);

-- 3º Maneira Dinâmica
insert into pessoas values
(default, 'Pedro', '2007-08-03', 'M', '85.5', '1.68', default),
(default, 'Marcus', '1996-03-05', 'M', '75.5', '1.85', default),
(default, 'Joana', '2012-06-15', 'F', '65', '1.55', default),
(default, 'Paola', '2000-08-25', 'F', '75.8', '1.6', default),
(default, 'Gabriela', '2007-03-05', 'F', '78', '1.65', default);
