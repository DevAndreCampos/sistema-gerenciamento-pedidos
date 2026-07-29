-- ==========================================
-- PROJETO: Sistema de Gerenciamento de Pedidos
-- Banco de Dados: PostgreSQL
-- Arquivo: 07_triggers.sql
-- ==========================================


-- ==========================================
-- FUNCTION
-- REGISTRA LOG APÓS A CRIAÇÃO DE UM PEDIDO
-- ==========================================

CREATE OR REPLACE FUNCTION registrar_log_pedido()
RETURNS TRIGGER
AS $$
BEGIN

    INSERT INTO log_pedidos (
        id_pedido,
        mensagem
    )
    VALUES (
        NEW.id_pedido,
        'Pedido criado no sistema'
    );

    RETURN NEW;

END;
$$ LANGUAGE plpgsql;


-- ==========================================
-- FUNCTION
-- REGISTRA ALTERAÇÃO DE STATUS
-- ==========================================

CREATE OR REPLACE FUNCTION registrar_mudanca_status()
RETURNS TRIGGER
AS $$
BEGIN

    IF OLD.status <> NEW.status THEN

        INSERT INTO historico_status_pedido (
            id_pedido,
            status_antigo,
            status_novo
        )
        VALUES (
            NEW.id_pedido,
            OLD.status,
            NEW.status
        );

    END IF;

    RETURN NEW;

END;
$$ LANGUAGE plpgsql;


-- ==========================================
-- TRIGGER
-- PREENCHE A DATA DO PEDIDO
-- ==========================================

CREATE TRIGGER preencher_data
BEFORE INSERT
ON pedidos
FOR EACH ROW
EXECUTE FUNCTION preencher_data_pedido();


-- ==========================================
-- TRIGGER
-- REGISTRA LOG DO PEDIDO
-- ==========================================

CREATE TRIGGER tgr_log_pedido
AFTER INSERT
ON pedidos
FOR EACH ROW
EXECUTE FUNCTION registrar_log_pedido();


-- ==========================================
-- TRIGGER
-- REGISTRA ALTERAÇÃO DE STATUS
-- ==========================================

CREATE TRIGGER tgr_status_pedido
AFTER UPDATE
ON pedidos
FOR EACH ROW
EXECUTE FUNCTION registrar_mudanca_status();