
-- =====================================================
-- PROJETO A3 - MARKETPLACE DE E-COMMERCE
-- Arquivo: 02_dml.sql
-- Objetivo: inserir dados ficticios para testes
-- Banco: PostgreSQL / Supabase
-- =====================================================

-- 1. CLIENTES (10)
INSERT INTO clientes
(id_cliente, nome, email, telefone, endereco, data_cadastro)
OVERRIDING SYSTEM VALUE
VALUES
(1, 'Ana Souza', 'ana@email.com', '11999990001', 'Sao Paulo - SP', NOW()),
(2, 'Bruno Lima', 'bruno@email.com', '11999990002', 'Santo Andre - SP', NOW()),
(3, 'Carla Mendes', 'carla@email.com', '11999990003', 'Sao Bernardo - SP', NOW()),
(4, 'Daniel Costa', 'daniel@email.com', '11999990004', 'Santos - SP', NOW()),
(5, 'Eduarda Alves', 'eduarda@email.com', '11999990005', 'Campinas - SP', NOW()),
(6, 'Felipe Rocha', 'felipe@email.com', '11999990006', 'Curitiba - PR', NOW()),
(7, 'Gabriela Martins', 'gabriela@email.com', '11999990007', 'Rio de Janeiro - RJ', NOW()),
(8, 'Henrique Santos', 'henrique@email.com', '11999990008', 'Belo Horizonte - MG', NOW()),
(9, 'Isabela Ferreira', 'isabela@email.com', '11999990009', 'Sorocaba - SP', NOW()),
(10, 'Joao Pedro', 'joao@email.com', '11999990010', 'Osasco - SP', NOW());

-- 2. VENDEDORES (5)
INSERT INTO vendedores
(id_vendedor, nome_loja, email, documento_ficticio, data_cadastro)
OVERRIDING SYSTEM VALUE
VALUES
(1, 'Tech Store', 'tech@email.com', 'DOC-FICT-001', NOW()),
(2, 'Casa Moderna', 'casa@email.com', 'DOC-FICT-002', NOW()),
(3, 'Esporte Total', 'esporte@email.com', 'DOC-FICT-003', NOW()),
(4, 'Moda Express', 'moda@email.com', 'DOC-FICT-004', NOW()),
(5, 'Livraria Central', 'livros@email.com', 'DOC-FICT-005', NOW());

-- 3. CATEGORIAS (8)
INSERT INTO categorias
(id_categoria, id_categoria_pai, nome, descricao)
OVERRIDING SYSTEM VALUE
VALUES
(1, NULL, 'Eletronicos', 'Produtos eletronicos'),
(2, NULL, 'Casa e Decoracao', 'Produtos para casa'),
(3, NULL, 'Esportes', 'Artigos esportivos'),
(4, NULL, 'Moda', 'Roupas e acessorios'),
(5, NULL, 'Livros', 'Livros e materiais de leitura'),
(6, 1, 'Informatica', 'Computadores e perifericos'),
(7, 1, 'Audio e Video', 'Equipamentos de audio e video'),
(8, 2, 'Utensilios', 'Utensilios domesticos');

-- 4. PRODUTOS (30)
INSERT INTO produtos
(id_produto, id_vendedor, nome, descricao, preco, ativo)
OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'Notebook Pro', 'Notebook para trabalho', 3500.00, TRUE),
(2, 1, 'Mouse Sem Fio', 'Mouse ergonomico', 89.90, TRUE),
(3, 1, 'Teclado Mecanico', 'Teclado para computador', 249.90, TRUE),
(4, 1, 'Monitor 24', 'Monitor Full HD', 899.90, TRUE),
(5, 1, 'Webcam HD', 'Camera para videoconferencia', 159.90, TRUE),
(6, 1, 'Fone Bluetooth', 'Fone sem fio', 199.90, TRUE),
(7, 2, 'Liquidificador', 'Liquidificador 500W', 149.90, TRUE),
(8, 2, 'Cafeteira', 'Cafeteira eletrica', 219.90, TRUE),
(9, 2, 'Jogo de Panelas', 'Conjunto de panelas', 399.90, TRUE),
(10, 2, 'Luminaria LED', 'Luminaria de mesa', 79.90, TRUE),
(11, 2, 'Aspirador', 'Aspirador de po', 499.90, TRUE),
(12, 2, 'Organizador', 'Organizador domestico', 59.90, TRUE),
(13, 3, 'Bola de Futebol', 'Bola oficial', 129.90, TRUE),
(14, 3, 'Chuteira', 'Chuteira esportiva', 289.90, TRUE),
(15, 3, 'Halteres', 'Par de halteres', 179.90, TRUE),
(16, 3, 'Colchonete', 'Colchonete para exercicios', 69.90, TRUE),
(17, 3, 'Bicicleta', 'Bicicleta aro 29', 1899.90, TRUE),
(18, 3, 'Garrafa Termica', 'Garrafa para atividades', 49.90, TRUE),
(19, 4, 'Camiseta Basica', 'Camiseta de algodao', 49.90, TRUE),
(20, 4, 'Calca Jeans', 'Calca jeans tradicional', 139.90, TRUE),
(21, 4, 'Tenis Casual', 'Tenis para uso diario', 229.90, TRUE),
(22, 4, 'Mochila', 'Mochila urbana', 119.90, TRUE),
(23, 4, 'Jaqueta', 'Jaqueta casual', 199.90, TRUE),
(24, 4, 'Bone', 'Bone ajustavel', 39.90, TRUE),
(25, 5, 'Livro SQL', 'Fundamentos de SQL', 89.90, TRUE),
(26, 5, 'Livro Python', 'Programacao com Python', 99.90, TRUE),
(27, 5, 'Livro Java', 'Desenvolvimento Java', 109.90, TRUE),
(28, 5, 'Livro Redes', 'Fundamentos de redes', 79.90, TRUE),
(29, 5, 'Livro Engenharia', 'Engenharia de software', 119.90, TRUE),
(30, 5, 'Livro Banco de Dados', 'Modelagem de dados', 95.90, TRUE);

-- 5. PRODUTO_CATEGORIA (40 associacoes)
INSERT INTO produto_categoria (id_produto, id_categoria)
VALUES
(1, 1), (1, 6),
(2, 1), (2, 6),
(3, 1), (3, 6),
(4, 1), (4, 7),
(5, 1), (5, 7),
(6, 1), (6, 7),
(7, 2), (7, 8),
(8, 2), (8, 8),
(9, 2), (9, 8),
(10, 2), (10, 8),
(11, 2), (11, 8),
(12, 2), (12, 8),
(13, 3), (14, 3),
(15, 3), (16, 3),
(17, 3), (18, 3),
(19, 4), (20, 4),
(21, 4), (22, 4),
(23, 4), (24, 4),
(25, 5), (26, 5),
(27, 5), (28, 5);

-- 6. ESTOQUE (30)
INSERT INTO estoque
(id_estoque, id_produto, quantidade_disponivel,
 quantidade_reservada, ultima_atualizacao)
OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 10, 0, NOW()),
(2, 2, 25, 0, NOW()),
(3, 3, 18, 0, NOW()),
(4, 4, 12, 0, NOW()),
(5, 5, 20, 0, NOW()),
(6, 6, 15, 0, NOW()),
(7, 7, 30, 0, NOW()),
(8, 8, 14, 0, NOW()),
(9, 9, 8, 0, NOW()),
(10, 10, 22, 0, NOW()),
(11, 11, 9, 0, NOW()),
(12, 12, 35, 0, NOW()),
(13, 13, 16, 0, NOW()),
(14, 14, 11, 0, NOW()),
(15, 15, 20, 0, NOW()),
(16, 16, 28, 0, NOW()),
(17, 17, 5, 0, NOW()),
(18, 18, 40, 0, NOW()),
(19, 19, 50, 0, NOW()),
(20, 20, 25, 0, NOW()),
(21, 21, 13, 0, NOW()),
(22, 22, 17, 0, NOW()),
(23, 23, 10, 0, NOW()),
(24, 24, 32, 0, NOW()),
(25, 25, 20, 0, NOW()),
(26, 26, 18, 0, NOW()),
(27, 27, 15, 0, NOW()),
(28, 28, 21, 0, NOW()),
(29, 29, 12, 0, NOW()),
(30, 30, 19, 0, NOW());

-- 7. PEDIDOS (20)
INSERT INTO pedidos
(id_pedido, id_cliente, data_pedido, status, valor_total)
OVERRIDING SYSTEM VALUE
VALUES
(1, 1, NOW() - INTERVAL '20 days', 'PAGO', 3589.90),
(2, 2, NOW() - INTERVAL '19 days', 'ENTREGUE', 449.80),
(3, 3, NOW() - INTERVAL '18 days', 'PAGO', 369.80),
(4, 4, NOW() - INTERVAL '17 days', 'ENVIADO', 339.80),
(5, 5, NOW() - INTERVAL '16 days', 'ENTREGUE', 139.70),
(6, 6, NOW() - INTERVAL '15 days', 'PAGO', 249.80),
(7, 7, NOW() - INTERVAL '14 days', 'ENTREGUE', 459.80),
(8, 8, NOW() - INTERVAL '13 days', 'PAGO', 1949.80),
(9, 9, NOW() - INTERVAL '12 days', 'ENVIADO', 189.80),
(10, 10, NOW() - INTERVAL '11 days', 'PAGO', 259.70),
(11, 1, NOW() - INTERVAL '10 days', 'ENTREGUE', 339.80),
(12, 2, NOW() - INTERVAL '9 days', 'PAGO', 559.80),
(13, 3, NOW() - INTERVAL '8 days', 'PAGO', 179.80),
(14, 4, NOW() - INTERVAL '7 days', 'AGUARDANDO_PAGAMENTO', 159.80),
(15, 5, NOW() - INTERVAL '6 days', 'PAGO', 239.80),
(16, 6, NOW() - INTERVAL '5 days', 'CANCELADO', 139.80),
(17, 7, NOW() - INTERVAL '4 days', 'PAGO', 175.80),
(18, 8, NOW() - INTERVAL '3 days', 'ENTREGUE', 189.80),
(19, 9, NOW() - INTERVAL '2 days', 'PAGO', 179.80),
(20, 10, NOW() - INTERVAL '1 day', 'AGUARDANDO_PAGAMENTO', 109.80);


-- 8. ITENS_PEDIDO (40)
INSERT INTO itens_pedido
(id_item, id_pedido, id_produto, quantidade, preco_unitario)
OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 1, 3500.00), (2, 1, 2, 1, 89.90),
(3, 2, 3, 1, 249.90), (4, 2, 6, 1, 89.90),
(5, 3, 7, 1, 149.90), (6, 3, 8, 1, 219.90),
(7, 4, 14, 1, 289.90), (8, 4, 18, 1, 0.00),
(9, 5, 19, 2, 49.90), (10, 5, 24, 1, 130.00),
(11, 6, 6, 1, 199.90), (12, 6, 18, 1, 0.00),
(13, 7, 9, 1, 399.90), (14, 7, 12, 1, 0.00),
(15, 8, 17, 1, 1899.90), (16, 8, 18, 1, 0.00),
(17, 9, 20, 1, 139.90), (18, 9, 19, 1, 0.00),
(19, 10, 25, 2, 89.90), (20, 10, 28, 1, 0.00),
(21, 11, 3, 1, 249.90), (22, 11, 2, 1, 0.00),
(23, 12, 11, 1, 499.90), (24, 12, 12, 1, 0.00),
(25, 13, 13, 1, 129.90), (26, 13, 18, 1, 0.00),
(27, 14, 22, 1, 119.90), (28, 14, 24, 1, 0.00),
(29, 15, 23, 1, 199.90), (30, 15, 24, 1, 0.00),
(31, 16, 10, 1, 79.90), (32, 16, 12, 1, 0.00),
(33, 17, 30, 1, 95.90), (34, 17, 28, 1, 0.00),
(35, 18, 27, 1, 109.90), (36, 18, 28, 1, 0.00),
(37, 19, 26, 1, 89.90), (38, 19, 28, 1, 0.00),
(39, 20, 12, 1, 59.90), (40, 20, 18, 1, 0.00);

-- 9. PAGAMENTOS (20)
INSERT INTO pagamentos
(id_pagamento, id_pedido, metodo, status, valor, data_pagamento)
OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 'CARTAO', 'APROVADO', 3590.00, NOW() - INTERVAL '20 days'),
(2, 2, 'PIX', 'APROVADO', 339.80, NOW() - INTERVAL '19 days'),
(3, 3, 'CARTAO', 'APROVADO', 529.80, NOW() - INTERVAL '18 days'),
(4, 4, 'PIX', 'APROVADO', 289.90, NOW() - INTERVAL '17 days'),
(5, 5, 'CARTAO', 'APROVADO', 229.80, NOW() - INTERVAL '16 days'),
(6, 6, 'PIX', 'APROVADO', 199.90, NOW() - INTERVAL '15 days'),
(7, 7, 'CARTAO', 'APROVADO', 399.90, NOW() - INTERVAL '14 days'),
(8, 8, 'PIX', 'APROVADO', 1899.90, NOW() - INTERVAL '13 days'),
(9, 9, 'CARTAO', 'APROVADO', 139.90, NOW() - INTERVAL '12 days'),
(10, 10, 'PIX', 'APROVADO', 179.80, NOW() - INTERVAL '11 days'),
(11, 11, 'CARTAO', 'APROVADO', 249.90, NOW() - INTERVAL '10 days'),
(12, 12, 'PIX', 'APROVADO', 499.90, NOW() - INTERVAL '9 days'),
(13, 13, 'CARTAO', 'APROVADO', 129.90, NOW() - INTERVAL '8 days'),
(14, 14, 'PIX', 'PENDENTE', 119.90, NULL),
(15, 15, 'CARTAO', 'APROVADO', 199.90, NOW() - INTERVAL '6 days'),
(16, 16, 'PIX', 'ESTORNADO', 79.90, NOW() - INTERVAL '5 days'),
(17, 17, 'CARTAO', 'APROVADO', 95.90, NOW() - INTERVAL '4 days'),
(18, 18, 'PIX', 'APROVADO', 109.90, NOW() - INTERVAL '3 days'),
(19, 19, 'CARTAO', 'APROVADO', 89.90, NOW() - INTERVAL '2 days'),
(20, 20, 'PIX', 'PENDENTE', 59.90, NULL);

-- 10. PAGAMENTO_CARTAO (10)
INSERT INTO pagamento_cartao
(id_pagamento, bandeira, ultimos_quatro_digitos, parcelas)
VALUES
(1, 'Visa', '1234', 3),
(3, 'Mastercard', '2345', 1),
(5, 'Visa', '3456', 2),
(7, 'Elo', '4567', 1),
(9, 'Mastercard', '5678', 1),
(11, 'Visa', '6789', 2),
(13, 'Elo', '7890', 1),
(15, 'Visa', '8901', 3),
(17, 'Mastercard', '9012', 1),
(19, 'Visa', '0123', 1);

-- 11. PAGAMENTO_PIX (10)
INSERT INTO pagamento_pix
(id_pagamento, identificador_transacao, data_expiracao)
VALUES
(2, 'PIX-FICTICIO-002', NOW() + INTERVAL '30 minutes'),
(4, 'PIX-FICTICIO-004', NOW() + INTERVAL '30 minutes'),
(6, 'PIX-FICTICIO-006', NOW() + INTERVAL '30 minutes'),
(8, 'PIX-FICTICIO-008', NOW() + INTERVAL '30 minutes'),
(10, 'PIX-FICTICIO-010', NOW() + INTERVAL '30 minutes'),
(12, 'PIX-FICTICIO-012', NOW() + INTERVAL '30 minutes'),
(14, 'PIX-FICTICIO-014', NOW() + INTERVAL '30 minutes'),
(16, 'PIX-FICTICIO-016', NOW() + INTERVAL '30 minutes'),
(18, 'PIX-FICTICIO-018', NOW() + INTERVAL '30 minutes'),
(20, 'PIX-FICTICIO-020', NOW() + INTERVAL '30 minutes');

-- 12. AVALIACOES (15)
INSERT INTO avaliacoes
(id_avaliacao, id_cliente, id_produto, nota, comentario, data_avaliacao)
OVERRIDING SYSTEM VALUE
VALUES
(1, 1, 1, 5, 'Excelente produto', NOW()),
(2, 2, 3, 4, 'Boa qualidade', NOW()),
(3, 3, 7, 5, 'Muito bom', NOW()),
(4, 4, 14, 4, 'Atendeu as expectativas', NOW()),
(5, 5, 19, 5, 'Otimo custo beneficio', NOW()),
(6, 6, 6, 4, 'Bom funcionamento', NOW()),
(7, 7, 9, 5, 'Recomendo', NOW()),
(8, 8, 17, 5, 'Produto de qualidade', NOW()),
(9, 9, 20, 3, 'Produto razoavel', NOW()),
(10, 10, 25, 5, 'Conteudo excelente', NOW()),
(11, 1, 2, 4, 'Muito pratico', NOW()),
(12, 2, 8, 5, 'Funcionou perfeitamente', NOW()),
(13, 3, 13, 4, 'Boa compra', NOW()),
(14, 4, 22, 5, 'Muito util', NOW()),
(15, 5, 30, 5, 'Livro muito completo', NOW());

-- =====================================================
-- AJUSTE DAS SEQUENCIAS DE IDENTIDADE
-- Necessario porque os IDs foram inseridos manualmente
-- =====================================================

SELECT setval(pg_get_serial_sequence('public.clientes', 'id_cliente'),
              (SELECT MAX(id_cliente) FROM clientes), TRUE);

SELECT setval(pg_get_serial_sequence('public.vendedores', 'id_vendedor'),
              (SELECT MAX(id_vendedor) FROM vendedores), TRUE);

SELECT setval(pg_get_serial_sequence('public.categorias', 'id_categoria'),
              (SELECT MAX(id_categoria) FROM categorias), TRUE);

SELECT setval(pg_get_serial_sequence('public.produtos', 'id_produto'),
              (SELECT MAX(id_produto) FROM produtos), TRUE);

SELECT setval(pg_get_serial_sequence('public.estoque', 'id_estoque'),
              (SELECT MAX(id_estoque) FROM estoque), TRUE);

SELECT setval(pg_get_serial_sequence('public.pedidos', 'id_pedido'),
              (SELECT MAX(id_pedido) FROM pedidos), TRUE);

SELECT setval(pg_get_serial_sequence('public.itens_pedido', 'id_item'),
              (SELECT MAX(id_item) FROM itens_pedido), TRUE);

SELECT setval(pg_get_serial_sequence('public.pagamentos', 'id_pagamento'),
              (SELECT MAX(id_pagamento) FROM pagamentos), TRUE);

SELECT setval(pg_get_serial_sequence('public.avaliacoes', 'id_avaliacao'),
              (SELECT MAX(id_avaliacao) FROM avaliacoes), TRUE);
