-- 1. Crie um banco de dados chamado "escola" com suporte a caracteres acentuados.
create database escola
default character set utf8mb4
default collate utf8mb4_general_ci;

use escola;

-- 2. Crie uma tabela "alunos" com as colunas: id (chave primária com auto incremento), nome, data_nascimento, turma e email.
create table alunos(
id int not null auto_increment,
nome varchar(50) not null,
data_nascimento date,
turma varchar(3) not null, 
email varchar(50),
primary key (id)
)default charset = utf8mb4;

select * from alunos;

-- 3. Insira um aluno na tabela "alunos" com os seguintes dados: nome = "João Silva", data_nascimento = '2005-03-15', turma =
-- "8A", email = "joao.silva@email.com".
insert into alunos values
(default, 'João Silva', '2005-03-15', '8A', 'joao.silva@email.com');

select * from alunos;

-- 4. Crie uma tabela "professores" com as colunas: id (chave primária com auto incremento), nome, disciplina e salário 
-- (tipo decimal com 5 casas decimais, sendo 2 após a vírgula).
create table professores(
id int not null auto_increment,
nome varchar(50) not null,
disciplina varchar(50), 
salario decimal(5,2),
primary key (id)
)default charset = utf8mb4;

select * from professores;

-- 5. Insira dois professores na tabela "professores".
insert into professores values
(default, 'Helena Duarte', 'Biologia', '999.99'),
(default, 'Marcos Vinícius Almeida', 'Matemática', '999.99');

select * from professores;

-- 6. Crie um banco de dados chamado "biblioteca".
create database biblioteca
default character set utf8mb4
default collate utf8mb4_general_ci;

use biblioteca;

-- 7. Crie uma tabela "livros" com as colunas: id (chave primária com auto incremento), titulo, autor, ano_publicacao e 
-- disponivel (tipo booleano).
create table livros(
id int not null auto_increment,
titulo varchar(50),
autor varchar(50),
ano_publicacao int,
disponivel bool,
primary key (id)
)default charset = utf8mb4;

select * from livros;

-- 8. Insira três livros na tabela "livros", sendo que o primeiro livro está disponível e os outros dois não.
insert into livros values
(default, 'Dom Casmurro', 'Machado de Assis', 1899, true),
(default, '1984', 'George Orwell', 1949, false),
(default, 'O Senhor dos Anéis: A Sociedade do Anel', 'J. R. R. Tolkien', 1954, false);

select * from livros;

-- 9. Crie um banco de dados chamado "empresa".
create database empresa
default character set utf8mb4
default collate utf8mb4_general_ci;

use empresa;

-- 10. Crie uma tabela "funcionarios" com as colunas: id (chave primária com auto incremento), nome, cargo, salario e 
-- data_admissao.
create table funcionarios(
id int not null auto_increment,
nome varchar(50),
cargo varchar(50),
salario decimal(6,2),
data_admissao date,
primary key (id)
)default charset = utf8mb4;

select * from funcionario;

-- 11. Insira um funcionário na tabela "funcionarios".
insert into funcionarios values
(default, 'Pedro', 'Gerente', '5000.00', '2025-10-10');

select * from funcionarios;

-- 12. Crie um banco de dados chamado "cinema".
create database cinema
default character set utf8mb4
default collate utf8mb4_general_ci;

use cinema;

-- 13. Crie uma tabela "filmes" com as colunas: id (chave primária com auto incremento), titulo, diretor, genero, duracao 
-- (em minutos) e classificacao_etaria.
create table filmes(
id int not null auto_increment,
titulo varchar(50),
diretor varchar(50),
genero varchar(50),
duração int,
classificacao_etaria enum('L', '10', '12', '14', '16', '18'),
primary key (id)
)default charset = utf8mb4;

select * from filmes;

-- 14. Insira dois filmes na tabela "filmes".
insert into filmes values
(default, 'Sombras do Amanhã', 'Lucas Mendonça', 'Ficção científica / Ação', '135', '14'),
(default, 'Corações em Chamas', 'Helena Prado', 'Romance / Drama', '110', '12');

select * from filmes;

-- 15. Crie um banco de dados chamado "musica".
create database musica
default character set utf8mb4
default collate utf8mb4_general_ci;

use musica;

-- 16. Crie uma tabela "albuns" com as colunas: id (chave primária com auto incremento), nome, artista, ano_lancamento e 
-- genero.
create table albuns(
id int not null auto_increment,
nome varchar(50),
artista varchar(50),
ano_lancamento int,
genero enum('M', 'F'),
primary key (id)
)default charset = utf8mb4;

select * from albuns;