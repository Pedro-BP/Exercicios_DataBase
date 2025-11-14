-- MANIPULADORES DE LINHAS: UPDATE, DELETE E TRUNCATE

create database megabazar;
use megabazar;

create table antiquario(
id int not null auto_increment primary key,
categoria varchar(30),
tipo varchar(30),
quantidade int,
ano year
) default charset = utf8mb4;

insert into antiquario values
(default,'Múzica','Disco de Viniu',40,1960),
(default,'Espelio','Vrido',20,1980),
(default,'Vingo James','Fita k7','10',1990),
(default,'Xícara','Argila',40,1985),
(default,'Bebidja','Vodica',10,1991);

select * from antiquario;

-- Ex: update tabela set coluna = 'novo valor' where id = 'id';
update antiquario set categoria = 'Música' where id = '1';

update antiquario set categoria = 'Espelho', quantidade = 40, ano = 1999, tipo = 'Vidro' where id = 22;

-- =========================================================================================================================

delete from antiquario where ano > 1990 limit 1;

truncate table antiquario;