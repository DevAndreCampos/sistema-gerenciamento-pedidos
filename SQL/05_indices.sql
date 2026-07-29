-- ==========================================
-- PROJETO: Sistema de Gerenciamento de Pedidos
-- Banco de Dados: PostgreSQL
-- Arquivo: 05_indices.sql
-- ==========================================


-- ==========================================
-- ÍNDICE PARA PESQUISA POR NOME DO CLIENTE
-- ==========================================

CREATE INDEX idx_clientes_nome
ON clientes(nome);


-- ==========================================
-- TESTE DO ÍNDICE
-- ==========================================

EXPLAIN ANALYZE
SELECT *
FROM clientes
WHERE nome = 'João Silva';


-- ==========================================
-- ÍNDICE PARA PESQUISA POR NOME DO PRODUTO
-- ==========================================

CREATE INDEX idx_produtos_nome
ON produtos(nome);


-- ==========================================
-- TESTE DO ÍNDICE
-- ==========================================

EXPLAIN ANALYZE
SELECT *
FROM produtos
WHERE nome = 'Notebook Dell';