-- ==========================================
-- PROJETO: Sistema de Gerenciamento de Pedidos
-- Banco de Dados: PostgreSQL
-- Arquivo: 02_inserts.sql
-- ==========================================


-- ==========================================
-- CLIENTES
-- ==========================================

INSERT INTO clientes (nome, email, telefone)
VALUES
('João Silva', 'joao@email.com', '(11) 99999-1111'),
('Maria Oliveira', 'maria@email.com', '(11) 99999-2222'),
('Carlos Souza', 'carlos@email.com', '(11) 99999-3333'),
('Ana Costa', 'ana@email.com', '(11) 99999-4444');


-- ==========================================
-- PRODUTOS
-- ==========================================

INSERT INTO produtos (nome, descricao, preco, estoque)
VALUES
('Notebook Dell', 'Notebook Dell Inspiron 15', 3500.00, 10),
('Mouse Logitech', 'Mouse sem fio Logitech', 120.00, 50),
('Teclado Mecânico', 'Teclado mecânico RGB', 280.00, 25),
('Monitor LG 24"', 'Monitor Full HD IPS', 950.00, 15),
('Headset Gamer', 'Headset com microfone', 320.00, 20);

-- ==========================================
-- PEDIDOS
-- ==========================================

INSERT INTO pedidos (id_cliente)
VALUES
(1),
(2),
(3);

-- ==========================================
-- PEDIDOS
-- ==========================================

INSERT INTO pedidos (id_cliente)
VALUES
(1),
(2),
(3);