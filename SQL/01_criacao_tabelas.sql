
-- ==========================================
-- PROJETO: Sistema de Gerenciamento de Pedidos
-- Banco de Dados: PostgreSQL
-- Arquivo: 01_criacao_tabelas.sql
-- ==========================================


-- ==========================================
-- TABELA: CLIENTES
-- ==========================================


Tabela 1 - clientes

CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    data_cadastro DATE DEFAULT CURRENT_DATE
);


-- ==========================================
-- TABELA: PRODUTOS
-- ==========================================

CREATE TABLE produtos (
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    estoque INTEGER NOT NULL
);

-- ==========================================
-- TABELA: PEDIDOS
-- ==========================================

CREATE TABLE pedidos (
    id_pedido SERIAL PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    data_pedido DATE DEFAULT CURRENT_DATE,
    status VARCHAR(20) DEFAULT 'Pendente',

    CONSTRAINT fk_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
);

-- ==========================================
-- TABELA: ITENS_PEDIDO
-- ==========================================

CREATE TABLE itens_pedido (
    id_item SERIAL PRIMARY KEY,
    id_pedido INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,

    CONSTRAINT fk_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido),

    CONSTRAINT fk_produto
        FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto)
);
-- ==========================================
-- TABELA: HISTORICO_PEDIDOS
-- ==========================================

CREATE TABLE historico_pedidos (
    id_historico SERIAL PRIMARY KEY,
    mensagem TEXT NOT NULL,
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_pedido INTEGER
);

-- ==========================================
-- TABELA: HISTORICO_PEDIDOS
-- ==========================================

CREATE TABLE log_pedidos (
    id_log SERIAL PRIMARY KEY,
    mensagem TEXT NOT NULL,
    data_log TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_pedido INTEGER
);

Tabela 7 - historico_status_pedido

CREATE TABLE historico_status_pedido (
    id_historico SERIAL PRIMARY KEY,
    id_pedido INTEGER NOT NULL,
    status_antigo VARCHAR(20),
    status_novo VARCHAR(20),
    data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);