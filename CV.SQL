-- 1. Consulta para selecionar dados de uma tabela
SELECT 
    id, 
    nome, 
    data_nascimento 
FROM 
    funcionarios 
WHERE 
    departamento = 'Vendas';

-- 2. Consulta para realizar uma junção entre duas tabelas
SELECT 
    f.nome AS funcionario, 
    d.nome AS departamento 
FROM 
    funcionarios f 
JOIN 
    departamentos d ON f.departamento_id = d.id;

-- 3. Consulta com agregação e agrupamento
SELECT 
    departamento_id, 
    COUNT(*) AS total_funcionarios 
FROM 
    funcionarios 
GROUP BY 
    departamento_id 
HAVING 
    COUNT(*) > 5;

-- 4. Consulta com subconsulta
SELECT 
    nome 
FROM 
    funcionarios 
WHERE 
    salario > (SELECT AVG(salario) FROM funcionarios);

-- 5. Consulta para inserir novos dados em uma tabela
INSERT INTO funcionarios (nome, salario, departamento_id) 
VALUES ('João Silva', 4500.00, 2);

-- 6. Consulta para atualizar dados em uma tabela
UPDATE funcionarios 
SET salario = salario * 1.10 
WHERE departamento_id = 3;

-- 7. Consulta para deletar dados de uma tabela
DELETE FROM funcionarios 
WHERE data_demissao IS NOT NULL;

-- 8. Criação de uma tabela
CREATE TABLE departamentos (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL
);

-- 9. Criação de um índice em uma tabela
CREATE INDEX idx_departamento ON funcionarios(departamento_id);

-- 10. Consulta para mostrar dados de várias tabelas usando CTE (Common Table Expression)
WITH funcionarios_ativos AS (
    SELECT 
        * 
    FROM 
        funcionarios 
    WHERE 
        data_demissao IS NULL
)
SELECT 
    f.nome, 
    d.nome AS departamento 
FROM 
    funcionarios_ativos f 
JOIN 
    departamentos d ON f.departamento_id = d.id;
