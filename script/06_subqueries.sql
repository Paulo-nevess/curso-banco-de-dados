-- ==============================================================================
-- SEÇÃO 9: SUBQUERIES (Consultas dentro de consultas)
-- ==============================================================================

-- MAX em SubQueries: Qual é o nome do produto mais caro?
SELECT nome_produto, preco 
FROM produtos 
WHERE preco = (SELECT MAX(preco) FROM produtos);

-- IN em SubQueries: Quais clientes já fizeram algum pedido com status 'Cancelado'?
SELECT nome, email 
FROM clientes 
WHERE id_cliente IN (SELECT id_cliente FROM pedidos WHERE status = 'Cancelado');

-- ANY em SubQueries: Produtos que custam mais que QUALQUER UM dos produtos da categoria 'Livros'
SELECT nome_produto, preco 
FROM produtos 
WHERE preco > ANY (SELECT preco FROM produtos WHERE categoria = 'Livros');