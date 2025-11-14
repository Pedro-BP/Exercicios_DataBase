-- 1. Atualize a turma do aluno com ID 3 para '9A'

UPDATE alunos
SET turma = '9A'
WHERE id = 3;

-- 2. Remova todos os alunos da turma '8B'

DELETE FROM alunos
WHERE turma = '8B';

-- 3.Remova todos os registros da tabela "alunos"

TRUNCATE TABLE alunos;

-- 4. Atualize o email do aluno com nome 'João Silva' para 'joaosilva@novoemail.com'.

UPDATE alunos
SET email = 'joaosilva@novoemail.com'
WHERE nome = 'João Silva';

-- 5. Remova o aluno com ID 5

DELETE FROM alunos
WHERE id = 5;

-- 6. Atualize a data de nascimento de todos os alunos para um ano antes.

-- Estava sem a tabela para saber as informações exatas, futuramente farei alteraç~eos.

-- 7. Remova todos os alunos que não possuem email cadastrado.

DELETE FROM alunos
WHERE email IS NULL OR email = '';

-- 8. Crie uma tabela "professores" com as colunas: id, nome, disciplina e salario.

CREATE TABLE professores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    disciplina VARCHAR(100),
    salario DECIMAL(10,2)
);

-- 9. Insira no mínimo 4 professores na tabela "professores".

INSERT INTO professores (nome, disciplina, salario) VALUES
('Carlos Andrade', 'Matemática', 4500.00),
('Fernanda Souza', 'Português', 4800.00),
('Rafael Lima', 'História', 5200.00),
('Mariana Torres', 'Inglês', 5000.00);

-- 10. Dê um aumento de 10% para os 2 primeiros funcionários cadastrados na tabela (considerando a ordem de inserção).

UPDATE professores
SET salario = salario * 1.10
WHERE id IN (1, 2);

-- 11. Remova os 3 funcionários com ID de 1 a 3.

DELETE FROM professores
WHERE id BETWEEN 1 AND 3;
		
-- 12. Atualize o cargo dos 2 funcionários com salário acima de 5000 para 'Gerente'.

UPDATE funcionarios
SET cargo = 'Gerente'
WHERE salario > 5000
LIMIT 2;
