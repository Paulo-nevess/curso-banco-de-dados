-- ==============================================================================
-- SEÇÃO 11: FUNÇÕES ESSENCIAIS (Manipulação de Strings e Condicionais)
-- ==============================================================================
USE sistema_vendas;

-- ------------------------------------------------------------------------------
-- ALTERANDO O TAMANHO DA CAIXA (Maiúsculas e Minúsculas)
-- ------------------------------------------------------------------------------
-- UCASE() ou UPPER(): Transforma tudo em maiúsculo
-- LCASE() ou LOWER(): Transforma tudo em minúsculo
SELECT 
    nome, 
    UCASE(nome) AS nome_maiusculo, 
    LCASE(email) AS email_minusculo 
FROM clientes;

-- ------------------------------------------------------------------------------
-- EXTRAINDO PARTES DE UM TEXTO
-- ------------------------------------------------------------------------------
-- LEFT(): Pega os primeiros caracteres da esquerda
-- RIGHT(): Pega os últimos caracteres da direita
SELECT 
    telefone, 
    LEFT(telefone, 2) AS ddd, 
    RIGHT(telefone, 4) AS final_telefone 
FROM clientes;

-- LENGTH(): Conta a quantidade de caracteres de uma string
SELECT nome, LENGTH(nome) AS qtd_caracteres_nome 
FROM clientes;

-- LOCATE(): Encontra a posição de um caractere específico (ex: onde está o '@' do email)
SELECT email, LOCATE('@', email) AS posicao_do_arroba 
FROM clientes;

-- ------------------------------------------------------------------------------
-- LIMPANDO ESPAÇOS E CARACTERES INDESEJADOS (TRIM)
-- ------------------------------------------------------------------------------
-- LTRIM(): Remove espaços da esquerda
-- RTRIM(): Remove espaços da direita
-- TRIM(): Remove espaços de ambos os lados
SELECT 
    '   Texto com espaços   ' AS original,
    LTRIM('   Texto com espaços   ') AS sem_espaco_esquerda,
    RTRIM('   Texto com espaços   ') AS sem_espaco_direita,
    TRIM('   Texto com espaços   ') AS limpo;

-- TRIM avançado: Removendo caracteres específicos
SELECT TRIM(LEADING '0' FROM '0001234500') AS remove_zeros_iniciais;  -- Resultado: 1234500
SELECT TRIM(TRAILING '0' FROM '0001234500') AS remove_zeros_finais;   -- Resultado: 00012345
SELECT TRIM(BOTH 'x' FROM 'xxxPRODUTOxxx') AS limpa_x_dos_dois_lados; -- Resultado: PRODUTO

-- ------------------------------------------------------------------------------
-- OUTRAS FUNÇÕES ÚTEIS
-- ------------------------------------------------------------------------------
-- REPEAT(): Repete um texto/caractere várias vezes
SELECT REPEAT('*', 10) AS separador_estrelas;

-- CASE: Cria lógicas condicionais (como o IF/ELSE na programação)
-- Exemplo: Classificando clientes pelo seu número de pontos
SELECT 
    nome, 
    pontos,
    CASE
        WHEN pontos >= 1000 THEN 'Cliente VIP (Ouro)'
        WHEN pontos >= 500 AND pontos < 1000 THEN 'Cliente Frequente (Prata)'
        ELSE 'Cliente Padrão (Bronze)'
    END AS categoria_cliente
FROM clientes;