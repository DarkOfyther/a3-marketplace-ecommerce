
-- =====================================================
-- PROJETO A3 - MARKETPLACE DE E-COMMERCE
-- Arquivo: 01_ddl.sql
-- Banco de dados: PostgreSQL
-- =====================================================

-- Remove as tabelas anteriores, caso existam
DROP TABLE IF EXISTS
    pagamento_cartao,
    pagamento_pix,
    pagamentos,
    itens_pedido,
    avaliacoes,
    produto_categoria,
    estoque,
    pedidos,
    produtos,
    categorias,
    vendedores,
    clientes
CASCADE;

-- 1. CLIENTES
CREATE TABLE clientes (
    id_cliente INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    endereco VARCHAR(250),
    data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 2. VENDEDORES
CREATE TABLE vendedores (
    id_vendedor INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_loja VARCHAR(120) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    documento_ficticio VARCHAR(30) NOT NULL UNIQUE,
    data_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- 3. CATEGORIAS
CREATE TABLE categorias (
    id_categoria INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_categoria_pai INTEGER,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,

    CONSTRAINT fk_categoria_pai
        FOREIGN KEY (id_categoria_pai)
        REFERENCES categorias(id_categoria),

    CONSTRAINT ck_categoria_nao_pode_ser_pai_dela_mesma
        CHECK (id_categoria_pai IS NULL OR id_categoria_pai <> id_categoria)
);

-- 4. PRODUTOS
CREATE TABLE produtos (
    id_produto INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_vendedor INTEGER NOT NULL,
    nome VARCHAR(150) NOT NULL,
    descricao TEXT,
    preco NUMERIC(12,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT fk_produto_vendedor
        FOREIGN KEY (id_vendedor)
        REFERENCES vendedores(id_vendedor),

    CONSTRAINT ck_produto_preco
        CHECK (preco >= 0)
);

-- 5. PRODUTO_CATEGORIA
CREATE TABLE produto_categoria (
    id_produto INTEGER NOT NULL,
    id_categoria INTEGER NOT NULL,

    PRIMARY KEY (id_produto, id_categoria),

    CONSTRAINT fk_pc_produto
        FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto),

    CONSTRAINT fk_pc_categoria
        FOREIGN KEY (id_categoria)
        REFERENCES categorias(id_categoria)
);

-- 6. ESTOQUE
CREATE TABLE estoque (
    id_estoque INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_produto INTEGER NOT NULL UNIQUE,
    quantidade_disponivel INTEGER NOT NULL DEFAULT 0,
    quantidade_reservada INTEGER NOT NULL DEFAULT 0,
    ultima_atualizacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_estoque_produto
        FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto),

    CONSTRAINT ck_estoque_quantidades
        CHECK (
            quantidade_disponivel >= 0
            AND quantidade_reservada >= 0
        )
);

-- 7. PEDIDOS
CREATE TABLE pedidos (
    id_pedido INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    data_pedido TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(30) NOT NULL DEFAULT 'AGUARDANDO_PAGAMENTO',
    valor_total NUMERIC(12,2) NOT NULL,

    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    CONSTRAINT ck_pedido_valor
        CHECK (valor_total >= 0),

    CONSTRAINT ck_pedido_status
        CHECK (status IN (
            'AGUARDANDO_PAGAMENTO',
            'PAGO',
            'EM_SEPARACAO',
            'ENVIADO',
            'ENTREGUE',
            'CANCELADO'
        ))
);

-- 8. ITENS_PEDIDO
CREATE TABLE itens_pedido (
    id_item INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_pedido INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    preco_unitario NUMERIC(12,2) NOT NULL,

    CONSTRAINT fk_item_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido),

    CONSTRAINT fk_item_produto
        FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto),

    CONSTRAINT ck_item_quantidade
        CHECK (quantidade > 0),

    CONSTRAINT ck_item_preco
        CHECK (preco_unitario >= 0)
);

-- 9. PAGAMENTOS
CREATE TABLE pagamentos (
    id_pagamento INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_pedido INTEGER NOT NULL UNIQUE,
    metodo VARCHAR(20) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'PENDENTE',
    valor NUMERIC(12,2) NOT NULL,
    data_pagamento TIMESTAMP,

    CONSTRAINT fk_pagamento_pedido
        FOREIGN KEY (id_pedido)
        REFERENCES pedidos(id_pedido),

    CONSTRAINT ck_pagamento_metodo
        CHECK (metodo IN ('CARTAO', 'PIX')),

    CONSTRAINT ck_pagamento_status
        CHECK (status IN ('PENDENTE', 'APROVADO', 'RECUSADO', 'ESTORNADO')),

    CONSTRAINT ck_pagamento_valor
        CHECK (valor >= 0)
);

-- 10. PAGAMENTO_CARTAO
CREATE TABLE pagamento_cartao (
    id_pagamento INTEGER PRIMARY KEY,
    bandeira VARCHAR(30) NOT NULL,
    ultimos_quatro_digitos CHAR(4) NOT NULL,
    parcelas INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT fk_cartao_pagamento
        FOREIGN KEY (id_pagamento)
        REFERENCES pagamentos(id_pagamento),

    CONSTRAINT ck_cartao_digitos
        CHECK (ultimos_quatro_digitos ~ '^[0-9]{4}$'),

    CONSTRAINT ck_cartao_parcelas
        CHECK (parcelas BETWEEN 1 AND 12)
);

-- 11. PAGAMENTO_PIX
CREATE TABLE pagamento_pix (
    id_pagamento INTEGER PRIMARY KEY,
    identificador_transacao VARCHAR(120) NOT NULL UNIQUE,
    data_expiracao TIMESTAMP,

    CONSTRAINT fk_pix_pagamento
        FOREIGN KEY (id_pagamento)
        REFERENCES pagamentos(id_pagamento)
);

-- 12. AVALIACOES
CREATE TABLE avaliacoes (
    id_avaliacao INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    nota INTEGER NOT NULL,
    comentario TEXT,
    data_avaliacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_avaliacao_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    CONSTRAINT fk_avaliacao_produto
        FOREIGN KEY (id_produto)
        REFERENCES produtos(id_produto),

    CONSTRAINT ck_avaliacao_nota
        CHECK (nota BETWEEN 1 AND 5),

    CONSTRAINT uq_avaliacao_cliente_produto
        UNIQUE (id_cliente, id_produto)
);
