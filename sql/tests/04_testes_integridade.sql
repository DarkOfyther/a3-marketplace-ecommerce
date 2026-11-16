
-- =====================================================
-- PROJETO A3 - E-COMMERCE / MARKETPLACE
-- Arquivo: 04_testes_integridade.sql
-- Objetivo: Validar a integridade dos dados
-- Banco de dados: PostgreSQL / Supabase
-- =====================================================


-- TESTE 1: Verificar se existem pedidos sem cliente
SELECT
    p.id_pedido,
    p.id_cliente
FROM pedidos p
LEFT JOIN clientes c
    ON p.id_cliente = c.id_cliente
WHERE c.id_cliente IS NULL;


-- TESTE 2: Verificar se existem produtos sem vendedor
SELECT
    p.id_produto,
    p.nome,
    p.id_vendedor
FROM produtos p
LEFT JOIN vendedores v
    ON p.id_vendedor = v.id_vendedor
WHERE v.id_vendedor IS NULL;


-- TESTE 3: Verificar se existem pagamentos sem pedido
SELECT
    pg.id_pagamento,
    pg.id_pedido
FROM pagamentos pg
LEFT JOIN pedidos p
    ON pg.id_pedido = p.id_pedido
WHERE p.id_pedido IS NULL;


-- TESTE 4: Verificar se existem avaliações com notas inválidas
SELECT
    id_avaliacao,
    id_produto,
    nota
FROM avaliacoes
WHERE nota < 1 OR nota > 5;


-- TESTE 5: Verificar se o banco rejeita notas inválidas
DO $$
BEGIN
    UPDATE avaliacoes
    SET nota = 0
    WHERE id_avaliacao = (
        SELECT MIN(id_avaliacao)
        FROM avaliacoes
    );

    RAISE EXCEPTION 'FALHA: o banco aceitou uma nota inválida';

EXCEPTION
    WHEN check_violation THEN
        RAISE NOTICE 'APROVADO: o banco rejeitou a nota inválida';
END;
$$;


-- TESTE 6: Verificar se o banco rejeita parcelas inválidas
DO $$
BEGIN
    UPDATE pagamento_cartao
    SET parcelas = 13
    WHERE id_pagamento = (
        SELECT MIN(id_pagamento)
        FROM pagamento_cartao
    );

    RAISE EXCEPTION 'FALHA: o banco aceitou 13 parcelas';

EXCEPTION
    WHEN check_violation THEN
        RAISE NOTICE 'APROVADO: o banco rejeitou 13 parcelas';
END;
$$;


-- TESTE 7: Verificar se o banco rejeita métodos de pagamento inválidos
DO $$
BEGIN
    UPDATE pagamentos
    SET metodo = 'BOLETO'
    WHERE id_pagamento = (
        SELECT MIN(id_pagamento)
        FROM pagamentos
    );

    RAISE EXCEPTION 'FALHA: o banco aceitou método inválido';

EXCEPTION
    WHEN check_violation THEN
        RAISE NOTICE 'APROVADO: o banco rejeitou método inválido';
END;
$$;


-- TESTE 8: Verificar se o banco impede avaliações duplicadas
DO $$
BEGIN
    INSERT INTO avaliacoes (
        id_cliente,
        id_produto,
        nota,
        comentario
    )
    SELECT
        id_cliente,
        id_produto,
        5,
        'Teste de duplicidade'
    FROM avaliacoes
    LIMIT 1;

    RAISE EXCEPTION 'FALHA: o banco aceitou uma avaliação duplicada';

EXCEPTION
    WHEN unique_violation THEN
        RAISE NOTICE 'APROVADO: o banco rejeitou a avaliação duplicada';
END;
$$;
