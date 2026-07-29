-- ==========================================
-- PROJETO: Sistema de Gerenciamento de Pedidos
-- Banco de Dados: PostgreSQL
-- Arquivo: 06_functions.sql
-- ==========================================


-- ==========================================
-- FUNCTION
-- PREENCHE AUTOMATICAMENTE A DATA DO PEDIDO
-- ==========================================

CREATE OR REPLACE FUNCTION preencher_data_pedido()
RETURNS TRIGGER
AS $$
BEGIN

    IF NEW.data_pedido IS NULL THEN
        NEW.data_pedido := CURRENT_DATE;
    END IF;

    RETURN NEW;

END;
$$ LANGUAGE plpgsql;