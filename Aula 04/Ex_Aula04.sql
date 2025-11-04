-- 1. Selecionando Todos os Dados de uma Tabela
select * from tabela;

-- 2. Selecionando Dados por Nome Específico
select * from tabela where coluna = 'Jorge';

-- 3. Ordenando Resultados por Nome em Ordem Decrescente
select * from tabela order by nome desc;

-- 4. Selecionando Colunas Específicas de uma Tabela
select coluna1, coluna2 from tabela;

-- 5. Filtrando Dados por Ano Igual ou Anterior a 2016
select * from tabela where ano <= 2016;

-- 6. Usando Operadores Relacionais para Comparar Valores
select * from tabela where ano >= 2016 and ano <= 2020;

-- 7. Filtrando Dados por Intervalo de Valores (BETWEEN)
select * from tabela where  ano between 1980 and 1990;

-- 8. Combinando Condições com AND e OR
select * from tabela where ano <= 2000 or ano >= 2010;

-- 9. Selecionando Registros que Contém um Valor Específico (IN)
select * from tabela where coluna4 in (10, 40);

-- 10. Utilizando o Operador de União (|) para Combinar Resultados
select coluna1, coluna1 from tabela where id >= 2 and id <= 10;

-- 11. Buscando Nomes que Começam com 'Maria' (LIKE e Wildcard)
select * from tabela where coluna1 like 'Maria%';

-- 12. Atualizando o Email de um Aluno Específico
update tabela set email = 'novoemail@exemplo.com' where nome = 'Jorge';

-- 13. Removendo Registros Duplicados (DISTINCT)
select distinct nome from tabela;

-- 14. Contando o Número de Alunos por Curso (COUNT)
select count (alunos) from tabela;

-- 15. Calculando a Média, Máximo e Mínimo de Salários (AVG, MAX, MIN)
select avg (coluna) from tabela;

select max (coluna) from tabela;

select min (coluna) from tabela;