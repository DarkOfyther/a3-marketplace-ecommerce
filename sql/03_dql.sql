
-- =====================================================
-- PROJETO A3 - E-COMMERCE / MARKETPLACE
-- Arquivo: 03_dql.sql
-- Descrição: Consultas SQL (DQL)
-- Banco de dados: PostgreSQL / Supabase
-- =====================================================


-- CONSULTA 1: Produtos mais vendidos
SELECT
    p.id_produto,
    p.nome AS produto,
    SUM(ip.quantidade) AS quantidade_vendida,
    SUM(ip.quantidade * ip.preco_unitario) AS faturamento
FROM produtos p
INNER JOIN itens_pedido ip ON p.id_produto = ip.id_produto
GROUP BY p.id_produto, p.nome
ORDER BY quantidade_vendida DESC;


-- CONSULTA 2: Faturamento por vendedor
SELECT
    v.id_vendedor,
    v.nome_loja AS vendedor,
    COUNT(DISTINCT pe.id_pedido) AS quantidade_pedidos,
    SUM(ip.quantidade) AS unidades_vendidas,
    SUM(ip.quantidade * ip.preco_unitario) AS faturamento_total
FROM vendedores v
INNER JOIN produtos p ON v.id_vendedor = p.id_vendedor
INNER JOIN itens_pedido ip ON p.id_produto = ip.id_produto
INNER JOIN pedidos pe ON ip.id_pedido = pe.id_pedido
GROUP BY v.id_vendedor, v.nome_loja
ORDER BY faturamento_total DESC;


-- CONSULTA 3: Vendas por mês
SELECT
    DATE_TRUNC('month', data_pedido)::DATE AS mes,
    COUNT(*) AS quantidade_pedidos,
    SUM(valor_total) AS faturamento_total,
    ROUND(AVG(valor_total), 2) AS ticket_medio
FROM pedidos
GROUP BY DATE_TRUNC('month', data_pedido)
ORDER BY mes;


-- CONSULTA 4: Produtos com estoque baixo
SELECT
    p.id_produto,
    p.nome AS produto,
    e.quantidade_disponivel,
    e.quantidade_reservada,
    (e.quantidade_disponivel - e.quantidade_reservada) AS estoque_livre
FROM produtos p
INNER JOIN estoque e ON p.id_produto = e.id_produto
WHERE e.quantidade_disponivel - e.quantidade_reservada <= 10
ORDER BY estoque_livre ASC;


-- CONSULTA 5: Clientes que mais compraram
SELECT
    c.id_cliente,
    c.nome AS cliente,
    COUNT(DISTINCT p.id_pedido) AS quantidade_pedidos,
    SUM(p.valor_total) AS total_gasto
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY total_gasto DESC;


-- CONSULTA 6: Vendas por categoria
SELECT
    c.id_categoria,
    c.nome AS categoria,
    SUM(ip.quantidade) AS quantidade_vendida,
    SUM(ip.quantidade * ip.preco_unitario) AS faturamento
FROM categorias c
INNER JOIN produto_categoria pc ON c.id_categoria = pc.id_categoria
INNER JOIN produtos p ON pc.id_produto = p.id_produto
INNER JOIN itens_pedido ip ON p.id_produto = ip.id_produto
GROUP BY c.id_categoria, c.nome
ORDER BY quantidade_vendida DESC;


-- CONSULTA 7: Média de avaliações dos produtos
SELECT
    p.id_produto,
    p.nome AS produto,
    COUNT(a.id_avaliacao) AS quantidade_avaliacoes,
    ROUND(AVG(a.nota), 2) AS media_avaliacao
FROM produtos p
LEFT JOIN avaliacoes a ON p.id_produto = a.id_produto
GROUP BY p.id_produto, p.nome
HAVING COUNT(a.id_avaliacao) > 0
ORDER BY media_avaliacao DESC, quantidade_avaliacoes DESC;


-- CONSULTA 8: Pedidos aguardando pagamento
SELECT
    pe.id_pedido,
    c.nome AS cliente,
    pe.data_pedido,
    pe.status AS status_pedido,
    pg.metodo AS metodo_pagamento,
    pg.status AS status_pagamento,
    pg.valor AS valor_pagamento
FROM pedidos pe
INNER JOIN clientes c ON pe.id_cliente = c.id_cliente
INNER JOIN pagamentos pg ON pe.id_pedido = pg.id_pedido
WHERE pg.status = 'PENDENTE'
ORDER BY pe.data_pedido DESC;
