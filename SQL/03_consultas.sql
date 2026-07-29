-- ==========================================
-- PROJETO: Sistema de Gerenciamento de Pedidos
-- Banco de Dados: PostgreSQL
-- Arquivo: 03_consultas.sql
-- ==========================================


-- ==========================================
-- CONSULTAS BÁSICAS
-- ==========================================

SELECT * FROM clientes;

SELECT * FROM produtos;

SELECT * FROM pedidos;

SELECT * FROM itens_pedido;

-- ==========================================
-- WHERE
-- ==========================================

SELECT *
FROM produtos
WHERE preco >= 150;

SELECT *
FROM clientes
WHERE nome = 'João Silva';

-- ==========================================
-- LIKE
-- ==========================================

SELECT *
FROM clientes
WHERE nome LIKE 'João%';

SELECT *
FROM clientes
WHERE nome LIKE '%Silva';

-- ==========================================
-- ORDER BY
-- ==========================================

SELECT *
FROM produtos
ORDER BY nome;

SELECT *
FROM produtos
ORDER BY preco DESC;

-- ==========================================
-- INNER JOIN
-- ==========================================

SELECT
    c.nome AS cliente,
    p.id_pedido
FROM pedidos p
INNER JOIN clientes c
    ON p.id_cliente = c.id_cliente;

    -- ==========================================
-- LEFT JOIN
-- ==========================================

SELECT
    c.nome,
    p.id_pedido
FROM clientes c
LEFT JOIN pedidos p
    ON c.id_cliente = p.id_cliente;

    -- ==========================================
-- COUNT
-- ==========================================

SELECT COUNT(*) AS total_produtos
FROM produtos;

-- ==========================================
-- SUM
-- ==========================================

SELECT SUM(preco) AS valor_total_produtos
FROM produtos;

-- ==========================================
-- AVG
-- ==========================================

SELECT AVG(preco) AS preco_medio
FROM produtos;

-- ==========================================
-- GROUP BY
-- ==========================================

SELECT
    id_cliente,
    COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY id_cliente;

-- ==========================================
-- HAVING
-- ==========================================

SELECT
    id_cliente,
    COUNT(*) AS total_pedidos
FROM pedidos
GROUP BY id_cliente
HAVING COUNT(*) >= 2;

-- ==========================================
-- SUBQUERY
-- ==========================================

SELECT *
FROM produtos
WHERE preco = (
    SELECT MIN(preco)
    FROM produtos
);

-- ==========================================
-- PEDIDOS COM CLIENTES
-- ==========================================

SELECT
    p.id_pedido,
    c.nome,
    p.status,
    p.data_pedido
FROM pedidos p
INNER JOIN clientes c
    ON p.id_cliente = c.id_cliente
ORDER BY p.id_pedido;