select * from antiquario 	-- Retorna todos os registros e todas as colunas da tabela especificada 
order by ano;            	-- Ordena os resultados da consulta com base em uma ou mais colunas
							-- ASC: ordem crescente (padrão)
                            -- DESC: ordem decrescente

-- WHERE
select * from antiquario
where ano >= 1985;			-- Mostra apenas as informações que batem o pré requisito

select * from antiquario;

select categoria,quantidade -- Seleciona uma coluna específica para mostrar
from antiquario;

-- where com duas informações (AND / OR)
select * from antiquario
where quantidade > 20 and ano > 1960;

-- BETWEEN
select * from antiquario
where  ano between 1980 and 1990	-- Entre a e b
order by ano desc;

-- IN
select * from antiquario
where quantidade in (10, 40); 		-- Mostra apenas os que tem essa informação exata

-- LIKE COM WILDCARD ('_' underline)
select * from antiquario
where categoria like 'lui_';

-- DISTINCT (Quando quero apenas listar usuários registrados)
select distinct quantidade from antiquario;

-- // FUNÇÕES DE AGRAGAÇÃO //

-- COUNT
select count(*) from antiquario;

-- MÁX: Valor máximo em uma determinada coluna
select MAX(ano) from antiquario;

-- SUM: Somar valores de um campo numérico
select SUM(quantidade) from antiquario;

-- MIN: Valor mínimo de uma determinada coluna
select MIN(quantidade) from antiquario;

-- AVG: Média dos valores de um campo numérico
select AVG(quantidade) from antiquario;

-- // Agrupamento //
select categoria, quantidade from antiquario
group by categoria, quantidade;

select categoria, sum(quantidade) from antiquario
group by categoria;

-- GROUP BY com HAVING
select categoria, avg(quantidade)
from antiquario group by categoria
having avg(quantidade) <= 40;