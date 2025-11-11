-- Preparando os DataBase

-- DataBase desenhos_animados
create database desenhos_animados;
use desenhos_animados;

create table personagens(
id int not null auto_increment,
nome varchar(255), 
idade int,
desenho_id int,
primary key(id)
)default charset = utf8mb4;

create table desenhos(
id int not null auto_increment,
nome varchar(255), 
criador varchar(255),
ano_lancamento year,
primary key(id)
)default charset = utf8mb4;

alter table personagens add foreign key(desenho_id) references desenhos(id);

use desenhos_animados;

insert into desenhos (nome, criador, ano_lancamento) values
('Bob Esponja', 'Stephen Hillenburg', 1999),
('Os Simpsons', 'Matt Groening', 1989),
('Apenas um Show', 'J. G. Quintel', 2010),
('Hora de Aventura', 'Pendleton Ward', 2010),
('Avatar: A Lenda de Aang', 'Michael Dante DiMartino e Bryan Konietzko', 2005);

insert into personagens (nome, idade, desenho_id) values
('Bob Esponja', 20, 1),
('Patrick Estrela', 20, 1),
('Homer Simpson', 39, 2),
('Bart Simpson', 10, 2),
('Mordecai', 23, 3),
('Rigby', 23, 3),
('Finn', 17, 4),
('Jake', 28, 4),
('Aang', 112, 5),
('Katara', 14, 5);

select * from personagens;
select * from desenhos;

-- DataBase musica
create database musica;
use musica;

create table artistas(
id int not null auto_increment,
nome varchar(255), 
genero enum('F','M'),
primary key(id)
)default charset = utf8mb4;

create table albuns(
id int not null auto_increment,
titulo varchar(255), 
ano_lancamento year,
artista_id int,
primary key(id)
)default charset = utf8mb4;

alter table albuns add foreign key(artista_id) references artistas(id);

use musica;

insert into artistas (nome, genero) values
('Taylor Swift', 'F'),
('Michael Jackson', 'M'),
('Adele', 'F'),
('Eminem', 'M'),
('Beyoncé', 'F');

insert into albuns (titulo, ano_lancamento, artista_id) values
('1989', 2014, 1),
('Reputation', 2017, 1),
('Thriller', 1982, 2),
('Bad', 1987, 2),
('21', 2011, 3),
('25', 2015, 3),
('The Marshall Mathers LP', 2000, 4),
('Recovery', 2010, 4),
('Lemonade', 2016, 5),
('Beyoncé', 2013, 5);

select * from artistas;
select * from albuns;

-- DataBase livros
create database livros;
use livros;

create table autores(
id int not null auto_increment,
nome varchar(255),
nacionalidade varchar(255),
primary key(id)
)default charset = utf8mb4;

create table livros(
id int not null auto_increment,
titulo varchar(255), 
genero varchar(255),
autor_id int,
primary key(id)
)default charset = utf8mb4;

alter table livros add foreign key(autor_id) references autores(id);

use livros;

insert into autores (nome, nacionalidade) values
('George Orwell', 'Britânico'),
('J.K. Rowling', 'Britânica'),
('Machado de Assis', 'Brasileiro'),
('J.R.R. Tolkien', 'Britânico'),
('Agatha Christie', 'Britânica');

insert into livros (titulo, genero, autor_id) values
('1984', 'Distopia', 1),
('A Revolução dos Bichos', 'Sátira política', 1),
('Harry Potter e a Pedra Filosofal', 'Fantasia', 2),
('Harry Potter e a Câmara Secreta', 'Fantasia', 2),
('Dom Casmurro', 'Romance Realista', 3),
('Memórias Póstumas de Brás Cubas', 'Romance Realista', 3),
('O Hobbit', 'Fantasia', 4),
('O Senhor dos Anéis', 'Fantasia', 4),
('O Assassinato no Expresso do Oriente', 'Mistério', 5),
('E Não Sobrou Nenhum', 'Mistério', 5);

-- 	++++++++++++++
-- 	| Exercícios |
-- 	++++++++++++++

-- 1. Listar o nome dos personagens e o nome do desenho a que pertencem.
use desenhos_animados;
select p.nome, d.nome from personagens p join desenhos d on p.desenho_id = d.id;

-- 2. Listar o nome dos álbuns e o nome do artista correspondente.
use musica;
select al.titulo, ar.nome from albuns al join artistas ar on al.artista_id = ar.id;

-- 3. Listar o título dos livros e a nacionalidade do autor.
use livros;
select l.titulo, a.nacionalidade from livros l join autores a on l.autor_id = a.id;

-- 4. Listar todos os personagens, mesmo que não estejam associados a um desenho.
use desenhos_animados;
update personagens set desenho_id = null where nome = 'Bart Simpson';

select p.nome,d.nome from personagens p left outer join desenhos d on p.desenho_id = d.id;

-- 5. Listar todos os desenhos, mesmo que não tenham personagens associados.
use desenhos_animados;
update personagens set desenho_id = null where nome = 'Homer Simpson';

select d.nome,p.nome from desenhos d left join personagens p on d.id = p.desenho_id;

-- 6. Listar todos os álbuns, mesmo que não estejam associados a um artista.
use musica;
update albuns set artista_id = null where artista_id = '4'; 

select al.titulo, ar.nome from albuns al left join artistas ar on al.artista_id = ar.id;

-- 7. Listar todos os artistas, mesmo que não tenham álbuns lançados.
use musica;
select ar.nome, al.titulo from artistas ar left join albuns al on ar.id = al.artista_id;

-- 8. Listar todos os livros, mesmo que não estejam associados a um autor.
use livros;
update livros set autor_id = null where autor_id = '1';

select l.titulo, a.nome from livros l left join autores a on l.autor_id = a.id;

-- 9. Listar todos os autores, mesmo que não tenham livros publicados.
use livros;
select a.nome, l.titulo from autores a left join livros l on a.id = l.autor_id;

-- 10. Listar os nomes dos personagens e dos desenhos, mas apenas para os personagens que têm mais de 18 anos.
use desenhos_animados;
select p.nome, p.idade, d.nome from personagens p join desenhos d on p.desenho_id = d.id where p.idade >= 18;

-- 11. Listar os títulos dos álbuns lançados antes de 2000 e o nome do artista.
use musica;
select al.titulo,ar.nome from álbuns al join artistas ar on al.artista_id = ar.id where al.ano_lancamento <= 2000;

-- 12. Listar os títulos dos livros de autores brasileiros.
use livros;
select l.titulo,a.nome,a.nacionalidade from livros l join autores a on l.autor_id = a.id where a.nacionalidade = 'Brasil';

-- 13. Listar os nomes dos personagens e dos desenhos, ordenados pelo nome do desenho em ordem alfabética. 
use desenhos_animados;
select p,nome,d.nome from personagens p join desenhos d on p.desenho_id = d.id order by d.nome asc;

-- 14. Listar os títulos dos álbuns e o nome do artista, ordenados pelo ano de lançamento do álbum em ordem decrescente. 
use musica;
select al.titulo,ar.nome from álbuns al join artistas ar on al.artista_id = ar.id order by a.ano_lancamento desc;

-- 15. Listar os títulos dos livros e o nome do autor, ordenados pelo título do livro em ordem alfabética.
use livros;
select l.titulo,a.nome from livros l join autores a on l.autor_id = a.id order by l.titulo asc;

-- 16. Contar quantos personagens pertencem a cada desenho.
use desenhos_animados;
select d.nome, count(p.id) as quantidade_personagens from desenhos d join personagens p on p.desenho_id = d.id group by d.id, d.nome order by quantidade_personagens desc;

-- 17. Calcular a média de idade dos personagens de cada desenho. 
use desenhos_animados;
select d.nome, avg(p.idade) as media_idade_personagens from desenhos d left join personagens p on p.desenho_id = d.id group by d.id, d.nome order by media_idade_personagens asc;

-- 18. Listar os artistas que possuem mais de 3 álbuns lançados. 
use musica;
select ar.nome, count(al.id) as quantidade_albuns from artistas ar join albuns al on al.artista_id = ar.id group by ar.id,ar.nome having count(a.id) >= 3;

-- 19. Listar os autores que possuem livros publicados em mais de um gênero. 
use livros;
select a.nome, count(distinct l.genero) from autores a join livros l on l.autor_id = a.id group by a.id,a.nome having count(distinct l.genero) > 1;

-- 20. Listar os desenhos que possuem personagens com idade média maior que 30 anos.
use desenhos_animados;
select d.nome, avg(p.idade) from desenhos d join personagens p on p.desenho_id = d.id group by d.id,d.nome having avg(p.idade) > 30;