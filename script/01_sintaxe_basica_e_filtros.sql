-- ==============================================================================
-- SEÇÃO 4: SQL (Sintaxe Básica e Filtros)
-- ==============================================================================

-- USE: Seleciona o banco de dados que será utilizado
USE sistema_vendas;

-- SELECT e LIMIT: Busca colunas específicas limitando a 5 resultados
SELECT nome, email FROM clientes LIMIT 5;

-- ORDER BY: Ordena os resultados pelo preço do maior para o menor
SELECT nome_produto, preco FROM produtos ORDER BY preco DESC;

-- WHERE, AND, OR e NOT: Filtros combinados e operadores lógicos
SELECT * FROM produtos 
WHERE categoria = 'Eletrônicos' 
  AND (preco < 2000 OR estoque > 50)
  AND NOT marca = 'Genérica';

-- IN: Busca registros que correspondam a uma lista exata de valores
SELECT nome, estado FROM clientes 
WHERE estado IN ('SP', 'MG', 'RJ');

-- BETWEEN: Busca valores dentro de um intervalo (inclusive)
SELECT nome_produto, preco FROM produtos 
WHERE preco BETWEEN 100.00 AND 500.00;

-- LIKE: Busca por padrões (nomes que começam com 'João')
SELECT nome FROM clientes 
WHERE nome LIKE 'João%';

-- IS NULL: Busca registros que não possuem valor preenchido em uma coluna
SELECT id_pedido, data_envio FROM pedidos 
WHERE data_envio IS NULL;

-- REGEXP: Expressões regulares (nomes que começam com A, B ou C)
SELECT nome FROM clientes 
WHERE nome REGEXP '^[ABC]';

-- OPERADORES MATEMÁTICOS E DE COMPARAÇÃO (+, -, *, /, =, <>, >, <)
SELECT nome_produto, (preco * 0.90) AS preco_com_10_desconto 
FROM produtos 
WHERE estoque <> 0; -- <> significa diferente