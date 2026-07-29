-- ==========================================
-- PROJETO: Sistema de Gerenciamento de Pedidos
-- Banco de Dados: PostgreSQL
-- Arquivo: 09_testes.sql
-- ==========================================

-- ==========================================
-- CONSULTAR TABELAS
-- ==========================================

SELECT * FROM clientes;

SELECT * FROM produtos;

SELECT * FROM pedidos;

SELECT * FROM itens_pedido;


-- ==========================================
-- TESTAR A VIEW
-- ==========================================

SELECT * FROM vw_pedidos;


-- ==========================================
-- TESTAR A PROCEDURE DE CRIAÇÃO
-- ==========================================

CALL criar_pedido(1);

SELECT *
FROM pedidos
ORDER BY id_pedido DESC;


-- ==========================================
-- TESTAR A PROCEDURE DE CANCELAMENTO
-- ==========================================

CALL cancelar_pedido(1);

SELECT *
FROM pedidos
WHERE id_pedido = 1;


-- ==========================================
-- VERIFICAR HISTÓRICO DE STATUS
-- ==========================================

SELECT *
FROM historico_status_pedido
ORDER BY data_alteracao DESC;


-- ==========================================
-- VERIFICAR LOG DE PEDIDOS
-- ==========================================

SELECT *
FROM log_pedidos
ORDER BY data_log DESC;


-- ==========================================
-- TESTAR A VIEW NOVAMENTE
-- ==========================================

SELECT *
FROM vw_pedidos;


-- ==========================================
-- TESTAR O ÍNDICE
-- ==========================================

EXPLAIN ANALYZE
SELECT *
FROM clientes
WHERE nome = 'João Silva';