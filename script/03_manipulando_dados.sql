-- ==============================================================================
-- SEÇÃO 6: MANIPULANDO DADOS (DDL e DML)
-- ==============================================================================

-- CREATE TABLE: Criação de uma tabela nova
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- INSERT: Inserindo dados na tabela
INSERT INTO categorias (nome) VALUES ('Eletrônicos'), ('Móveis'), ('Livros');

-- CREATE TABLE (COPIAR TABELA): Cria uma nova tabela copiando a estrutura e os dados de outra
CREATE TABLE clientes_vip AS 
SELECT * FROM clientes WHERE status = 'VIP';

-- UPDATE SET: Atualiza dados existentes
UPDATE produtos 
SET preco = 2500.00, estoque = 10 
WHERE id_produto = 5;

-- DELETE FROM: Deleta registros específicos
DELETE FROM clientes 
WHERE id_cliente = 10;

-- TRUNCATE TABLE: Limpa todos os dados da tabela, zerando o ID, mas mantém a estrutura
TRUNCATE TABLE logs_de_acesso;

-- DROP TABLE: Exclui a tabela inteira do banco de dados (estrutura e dados)
DROP TABLE categorias_antigas;