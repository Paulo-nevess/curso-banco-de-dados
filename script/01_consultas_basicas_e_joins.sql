-- ==============================================================================
-- 🛒 SCRIPT 01: PRÁTICA DE SINTAXE BÁSICA, OPERADORES E JOINS
-- ==============================================================================

-- 1. Criação e seleção do banco de dados (USE)
CREATE DATABASE IF NOT EXISTS loja_db;
USE loja_db;

-- 2. Criando tabelas de exemplo para as consultas
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    estado VARCHAR(2),
    pontos INT,
    telefone VARCHAR(20)
);

CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    valor_total DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- 3. Inserindo dados falsos (Manipulação básica)
INSERT INTO clientes (nome, estado, pontos, telefone) VALUES
('Ana Souza', 'SP', 150, '11999999999'),
('Bruno Lima', 'MG', 500, NULL),
('Carlos Silva', 'RJ', 300, '21988888888'),
('Daniela Costa', 'SP', 50, '11977777777'),
('Eduardo Melo', 'MG', 1200, '31966666666');

INSERT INTO pedidos (cliente_id, valor_total, status) VALUES
(1, 250.00, 'Enviado'),
(2, 800.50, 'Pendente'),
(3, 150.00, 'Cancelado'),
(5, 120.00, 'Enviado');

-- ==============================================================================
-- 🔍 CONSULTAS SQL (APLICAÇÃO DOS CONCEITOS)
-- ==============================================================================

-- 4. SELECT Básico, ORDER BY e LIMIT
-- Busca todos os clientes, ordena pelos pontos (do maior para o menor) e limita a 3 resultados
SELECT * 
FROM clientes
ORDER BY pontos DESC
LIMIT 3;

-- 5. WHERE, IN, LIKE e Operadores Lógicos (AND/OR)
-- Busca clientes de SP ou MG cujo nome comece com a letra 'A' ou 'B'
SELECT nome, estado 
FROM clientes
WHERE estado IN ('SP', 'MG') 
  AND (nome LIKE 'A%' OR nome LIKE 'B%');

-- 6. Operadores Matemáticos e BETWEEN
-- Calcula um desconto de 10% (*) e filtra valores resultantes entre 100 e 500
SELECT id, cliente_id, valor_total, (valor_total * 0.90) AS valor_com_desconto
FROM pedidos
WHERE (valor_total * 0.90) BETWEEN 100 AND 500;

-- 7. IS NULL e NOT
-- Busca clientes que NÃO possuem pontuação zerada e cujo telefone seja NULO
SELECT nome, telefone, pontos
FROM clientes
WHERE pontos IS NOT NULL 
  AND telefone IS NULL;

-- 8. REGEXP (Expressões Regulares)
-- Busca clientes cujo nome termine com 'a' ou 'o' (o '$' indica o final da string)
SELECT nome 
FROM clientes
WHERE nome REGEXP '[ao]$';

-- 9. INNER JOIN e ALIAS (Apelidos para as tabelas e colunas)
-- Junta as tabelas para exibir o nome do cliente ao lado do valor do pedido
-- 'c' é o apelido para clientes e 'p' é o apelido para pedidos
SELECT c.nome, p.valor_total, p.status
FROM clientes c
INNER JOIN pedidos p 
    ON c.id = p.cliente_id
WHERE p.status = 'Enviado';