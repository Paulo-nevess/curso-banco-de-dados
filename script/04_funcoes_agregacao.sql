-- ==============================================================================
-- SEÇÃO 7: FUNÇÕES DE AGREGAÇÃO
-- ==============================================================================
-- Nota: No MySQL, FIRST() e LAST() geralmente são substituídos por ORDER BY com LIMIT 1.

-- SUM(), AVG(), MAX(), MIN(), COUNT()
SELECT 
    COUNT(id_pedido) AS total_de_pedidos,
    SUM(valor_total) AS faturamento_total,
    AVG(valor_total) AS ticket_medio,
    MAX(valor_total) AS venda_mais_cara,
    MIN(valor_total) AS venda_mais_barata
FROM pedidos;

-- FIRST() / LAST() (Simulação no MySQL usando ORDER BY e LIMIT)
-- Simulando FIRST(): O primeiro cliente a se cadastrar
SELECT nome FROM clientes ORDER BY data_cadastro ASC LIMIT 1;

-- Simulando LAST(): O último cliente a se cadastrar
SELECT nome FROM clientes ORDER BY data_cadastro DESC LIMIT 1;

-- HAVING e ORDER BY: Filtra os resultados após o agrupamento (GROUP BY)
-- Exibe apenas estados com mais de 10 clientes cadastrados
SELECT estado, COUNT(id_cliente) AS total_clientes
FROM clientes
GROUP BY estado
HAVING total_clientes > 10
ORDER BY total_clientes DESC;