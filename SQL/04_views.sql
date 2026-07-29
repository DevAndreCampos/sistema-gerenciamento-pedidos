-- ==========================================
-- PROJETO: Sistema de Gerenciamento de Pedidos
-- Banco de Dados: PostgreSQL
-- Arquivo: 04_views.sql
-- ==========================================

-- ==========================================
-- VIEW: PEDIDOS
-- Exibe cliente, produto e data do pedido
-- ==========================================

CREATE OR REPLACE VIEW vw_pedidos AS
SELECT
    c.nome AS cliente,
    pr.nome AS produto,
    p.data_pedido,
    p.status
FROM pedidos p
INNER JOIN clientes c
    ON p.id_cliente = c.id_cliente
INNER JOIN itens_pedido ip
    ON p.id_pedido = ip.id_pedido
INNER JOIN produtos pr
    ON ip.id_produto = pr.id_produto;

    -- ==========================================
-- CONSULTA DA VIEW
-- ==========================================

SELECT *
FROM vw_pedidos;