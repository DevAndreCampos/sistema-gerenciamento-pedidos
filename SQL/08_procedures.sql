-- ==========================================
-- PROJETO: Sistema de Gerenciamento de Pedidos
-- Banco de Dados: PostgreSQL
-- Arquivo: 08_procedures.sql
-- ==========================================


-- ==========================================
-- PROCEDURE
-- CRIA UM NOVO PEDIDO
-- ==========================================

CREATE OR REPLACE PROCEDURE criar_pedido(
    cliente_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    cliente_existe BOOLEAN;
    novo_pedido INT;
BEGIN

    SELECT EXISTS (
        SELECT 1
        FROM clientes
        WHERE id_cliente = cliente_id
    )
    INTO cliente_existe;

    IF cliente_existe THEN

        INSERT INTO pedidos (id_cliente)
        VALUES (cliente_id)
        RETURNING id_pedido INTO novo_pedido;

        RAISE NOTICE 'Pedido criado com sucesso. ID: %', novo_pedido;

    ELSE

        RAISE EXCEPTION 'Cliente % não existe.', cliente_id;

    END IF;

END;
$$;


-- ==========================================
-- PROCEDURE
-- CANCELA UM PEDIDO
-- ==========================================

CREATE OR REPLACE PROCEDURE cancelar_pedido(
    pedido_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    pedido_existe BOOLEAN;
BEGIN

    SELECT EXISTS (
        SELECT 1
        FROM pedidos
        WHERE id_pedido = pedido_id
    )
    INTO pedido_existe;

    IF pedido_existe THEN

        UPDATE pedidos
        SET status = 'Cancelado'
        WHERE id_pedido = pedido_id;

        RAISE NOTICE 'Pedido % cancelado com sucesso.', pedido_id;

    ELSE

        RAISE EXCEPTION 'Pedido % não existe.', pedido_id;

    END IF;

END;
$$;