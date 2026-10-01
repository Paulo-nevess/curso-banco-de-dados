-- ==============================================================================
-- SEÇÃO 5: JOIN (Relacionamentos entre tabelas)
-- ==============================================================================

-- INNER JOIN e ALIAS: Traz apenas os registros que possuem correspondência nas duas tabelas
-- 'p' e 'c' são os ALIAS (apelidos) para encurtar o código
SELECT p.id_pedido, c.nome, p.valor_total
FROM pedidos AS p
INNER JOIN clientes AS c 
  ON p.id_cliente = c.id_cliente;

-- JOIN (MÚLTIPLAS TABELAS): Unindo três tabelas de uma vez (Pedidos, Clientes e Produtos)
SELECT c.nome, prod.nome_produto, ped.data_compra
FROM pedidos ped
JOIN clientes c ON ped.id_cliente = c.id_cliente
JOIN produtos prod ON ped.id_produto = prod.id_produto;

-- UNION: Junta o resultado de duas consultas diferentes em uma única coluna
-- (Ex: Pegar todos os emails de clientes e também de fornecedores)
SELECT email FROM clientes
UNION
SELECT email_contato FROM fornecedores;