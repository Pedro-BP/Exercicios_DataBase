create database info_beto
default character set utf8mb4
default collate utf8mb4_general_ci; 
use info_beto;

-- O Banco de Dados Defeituoso (O Problema):

-- Tabela 1: Clientes
CREATE TABLE Clientes (
id_cliente VARCHAR(10), -- Beto disse que o ID podia ser o apelido
nome_completo TEXT,
telefone INT -- Ele achou que número era sempre 'INT'
);
INSERT INTO Clientes (id_cliente, nome_completo, telefone) VALUES
('JOAO', ' joao silva', 99887766),
('maria', 'Maria (vizinha)', 88776655),
('PEDRO', 'PEDRO SOUZA', 77665544),
('JOAO', 'Joao Silva', 99887766), -- ID duplicado, nome diferente?
('ana', 'Ana C.', NULL); -- Telefone nulo

-- Tabela 2: Servicos
CREATE TABLE Servicos (
servico_id INT,
id_cliente_ref VARCHAR(50), -- Chave para o cliente
equipamento VARCHAR(100),
defeito_relatado TEXT,
data_entrada VARCHAR(20), -- Salvo como texto
valor_servico VARCHAR(50) -- Beto colocou "R$" junto
);
INSERT INTO Servicos (servico_id, id_cliente_ref, equipamento, defeito_relatado,
data_entrada, valor_servico) VALUES
(1, 'JOAO', 'Notbook Dell', 'nao liga', '05/10/2024', '150.00'),
(2, 'maria', 'Celular Sansung', 'Tela quebrada', '06/10/2024', 'R$ 300,00'),
(3, 'PEDRO', 'PC Gamer', 'fonte keimada', '06-10-2024', 'R$ 100,00'),
(4, 'JOAO', 'Notbook Dell', 'formatar', '07/10/2024', '120'),
(5, 'paulo', 'Tablet', 'nao carrega', '08/10/2024', 'N/A'); -- Cliente "paulo" não existe em Clientes!

-- Sua Missão: As Tarefas de Correção:

-- Parte 1: Correção da Estrutura (DDL - ALTER TABLE)
-- 		Tabela Clientes:
-- ● Mudar a coluna id_cliente para um tipo numérico (ex: INT ou SERIAL) que seja a
--   PRIMARY KEY (Chave Primária) da tabela e, de preferência, auto-incremental. (Você
--   terá que decidir como lidar com os IDs de texto existentes, como 'JOAO').
update clientes set id_cliente = null;
select * from clientes;
alter table clientes modify column id_cliente int primary key auto_increment;

-- ● Garantir que nome_completo não seja do tipo TEXT (que é ruim para performance de
--   busca) e sim VARCHAR (ex: VARCHAR(255)), e que esta coluna não possa ser nula
--   (NOT NULL).
alter table clientes modify column nome_completo varchar(255) not null;

-- ● Corrigir a coluna telefone para um tipo que realmente armazene números de telefone.
alter table clientes modify column telefone varchar(20);

-- 		Tabela Serviços:
-- ● Mudar a servico_id para ser a PRIMARY KEY da tabela (e talvez auto-incremental).
alter table servicos modify column servico_id int primary key auto_increment;

-- ● Corrigir id_cliente_ref para que ela seja uma FOREIGN KEY (Chave Estrangeira) que
--   realmente aponte para a nova id_cliente da tabela Clientes. (O tipo de dado deve ser o
--   mesmo).
update servicos set id_cliente_ref = null;
alter table servicos modify column id_cliente_ref int;
alter table servicos add constraint fk_cliente foreign key (id_cliente_ref) references Clientes(id_cliente);
update servicos set id_cliente_ref = 1 where servico_id = 1;
update servicos set id_cliente_ref = 2 where servico_id = 2;
update servicos set id_cliente_ref = 3 where servico_id = 3;
update servicos set id_cliente_ref = 1 where servico_id = 4;

-- ● Corrigir a data_entrada para o tipo correto: DATE ou DATETIME.
alter table servicos modify column data_entrada date;

-- ● Corrigir valor_servico para um tipo numérico que permita cálculos matemáticos (ex:
--   DECIMAL(10, 2) ou NUMERIC).
alter table servicos modify column valor_servico decimal(10,2);

-- Parte 2: Limpeza dos Dados (DML - UPDATE e INSERT)
-- 		Padronizar Clientes:
-- ● Remover espaços em branco desnecessários dos nomes (ex: TRIM(' joao silva')).
select * from clientes;
update clientes set nome_completo = trim(' joao silva ') where id_cliente = 1;

-- ● Padronizar todos os nomes para uma única formatação (ex: todos em maiúsculas com
--   UPPER() ou apenas a primeira letra maiúscula).
update clientes set nome_completo = 'João Silva' where id_cliente = 1;
update clientes set nome_completo = 'Maria Eduarda' where id_cliente = 2;
update clientes set nome_completo = 'Pedro Souza' where id_cliente = 3;
update clientes set nome_completo = 'João Silva' where id_cliente = 4;
update clientes set nome_completo = 'Ana Catarina' where id_cliente = 5;

-- ● Resolver a duplicidade do cliente 'JOAO'. Você deve decidir a melhor estratégia:
--   Apagar um dos registros? Unificar os serviços dos dois "JOAOs" sob um único ID de
--   cliente?
delete from clientes where id_cliente = 4;
update servicos set id_cliente_ref = 1 where id_cliente_ref = 4; -- colocar todos os servicos do joão para o perfil com o id 1.


-- 		Padronizar Serviços:
-- ● Corrigir os erros gramaticais óbvios em equipamento e defeito_relatado (ex: 'Notbook' ->
--   'Notebook', 'Sansung' -> 'Samsung', 'keimada' -> 'queimada').
update servicos set equipamento = 'Notebook Dell', defeito_relatado = 'Não liga' where servico_id = 1;
update servicos set equipamento = 'Celular Samsung' where servico_id = 2;
update servicos set defeito_relatado = 'Fonte queimada' where servico_id = 3;
update servicos set equipamento = 'Notebook Dell', defeito_relatado = 'Formatar' where servico_id = 4;
update servicos set defeito_relatado = 'Não carrega' where servico_id = 5;

-- ● Converter os valores em valor_servico para um formato numérico limpo. Você deve:
--   Remover 'R$ ' e espaços. Decidir o que fazer com 'N/A' (substituir por 0 ou NULL?).
update servicos set valor_servico = 150 where servico_id = 1;
update servicos set valor_servico = 300 where servico_id = 2;
update servicos set valor_servico = 100 where servico_id = 3;
update servicos set valor_servico = 120 where servico_id = 4;
update servicos set valor_servico = null where servico_id = 5;

-- ● Converter os formatos de data_entrada (ex: '05/10/2024' e '06-10-2024') para o formato
--   padrão do SQL (ex: '2024-10-05') para que possam ser inseridos/atualizados na nova
--   coluna do tipo DATE.
update servicos set data_entrada = '2024-10-05' where servico_id = 1;
update servicos set data_entrada = '2024-10-06' where servico_id = 2;
update servicos set data_entrada = '2024-10-06' where servico_id = 3;
update servicos set data_entrada = '2024-10-07' where servico_id = 4;
update servicos set data_entrada = '2024-10-08' where servico_id = 5;

-- ● Resolver o "problema órfão": O que fazer com o serviço de ID 5 ('paulo'), que não tem
--   um cliente correspondente na tabela Clientes?
-- ● Você deve sugerir e implementar uma solução (ex: apagar o registro? Criar o cliente
--   'paulo' na tabela Clientes?).
select * from servicos;
delete from servicos where servico_id = 5;

-- Resultado Final:
desc clientes;
select * from clientes;
desc servicos;
select * from servicos;