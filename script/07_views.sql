-- ==============================================================================
-- SEÇÃO 10: VIEWS (Visualizações)
-- ==============================================================================
USE sistema_vendas;

-- 1. Criando uma View simples
-- Objetivo: Salvar uma consulta que traz apenas os clientes do estado de SP
CREATE VIEW vw_clientes_sp AS
SELECT nome, email, telefone 
FROM clientes 
WHERE estado = 'SP';

-- 2. Utilizando a View
-- Agora podemos consultar essa View como se fosse uma tabela real
SELECT * FROM vw_clientes_sp;

-- 3. Criando uma View complexa com JOIN
-- Objetivo: Criar um relatório de vendas pronto para ser consultado rapidamente
CREATE VIEW vw_relatorio_vendas AS
SELECT 
    p.id_pedido, 
    c.nome AS nome_cliente, 
    prod.nome_produto, 
    p.valor_total
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN produtos prod ON p.id_produto = prod.id_produto;

-- Consultando o relatório salvo na View
SELECT * FROM vw_relatorio_vendas ORDER BY valor_total DESC;

-- 4. Atualizando uma View existente (CREATE OR REPLACE)
-- Objetivo: Adicionar a data da compra no nosso relatório sem precisar excluir a View
CREATE OR REPLACE VIEW vw_relatorio_vendas AS
SELECT 
    p.id_pedido, 
    c.nome AS nome_cliente, 
    prod.nome_produto, 
    p.valor_total,
    p.data_compra -- Nova coluna adicionada
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN produtos prod ON p.id_produto = prod.id_produto;

-- 5. Excluindo uma View
DROP VIEW vw_clientes_sp;