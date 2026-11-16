# A3 - Marketplace E-commerce

Projeto acadêmico de Banco de Dados Relacional, desenvolvido como parte da avaliação A3.

## Sobre o Projeto

Desenvolvimento de um banco de dados relacional para um marketplace de comércio eletrônico multivendedor.

O sistema contempla o gerenciamento de clientes, vendedores, produtos, categorias, pedidos, pagamentos, estoque e avaliações.

O projeto aplica conceitos de modelagem de dados, normalização, integridade referencial, manipulação de dados e consultas SQL utilizando PostgreSQL.

## Objetivos

- Desenvolver o Diagrama Entidade-Relacionamento (DER).
- Construir o modelo lógico do banco de dados.
- Implementar o banco utilizando PostgreSQL.
- Criar scripts DDL, DML e DQL.
- Aplicar restrições de integridade e regras de negócio.
- Desenvolver consultas para análise de vendas e operações do marketplace.
- Realizar testes de integridade dos dados.
- Documentar a estrutura e as funcionalidades do banco.

## Tecnologias

- PostgreSQL
- Supabase
- SQL
- Mermaid
- Git e GitHub

## Estrutura do Projeto

```text
a3-marketplace-ecommerce/
├── docs/
│   ├── diagramas/
│   │   ├── der_marketplace.mmd
│   │   └── der_marketplace.png
│   └── relatorios/
│       └── relatorio_tecnico.md
├── evidencias/
│   ├── 01_estrutura_banco.png
│   ├── 02_dados_clientes.png
│   ├── 03_consulta_produtos_mais_vendidos.png
│   └── 04_testes_integridade.png
├── sql/
│   ├── tests/
│   │   └── 04_testes_integridade.sql
│   ├── 01_ddl.sql
│   ├── 02_dml.sql
│   └── 03_dql.sql
├── .gitignore
└── README.md
```

## Entidades principais

O banco de dados possui 12 tabelas:

1. Clientes
2. Vendedores
3. Categorias
4. Produtos
5. Estoque
6. Produto_Categoria
7. Pedidos
8. Itens_Pedido
9. Pagamentos
10. Pagamento_Cartao
11. Pagamento_PIX
12. Avaliacoes

## Implementações realizadas

### DDL — Data Definition Language

- Criação das 12 tabelas.
- Definição de chaves primárias e estrangeiras.
- Aplicação de restrições CHECK, UNIQUE e NOT NULL.
- Definição dos relacionamentos entre entidades.

### DML — Data Manipulation Language

- Inserção de dados fictícios para popular o marketplace.
- 238 registros distribuídos entre as 12 tabelas.
- Preparação de registros para simular operações de vendas.

### DQL — Data Query Language

Desenvolvimento de 8 consultas SQL para análise de:

- Produtos mais vendidos.
- Faturamento por vendedor.
- Vendas por mês.
- Produtos com estoque baixo.
- Clientes que mais compraram.
- Vendas por categoria.
- Média de avaliações dos produtos.
- Pedidos aguardando pagamento.

### Testes de integridade

Desenvolvimento de 8 testes para validar:

- Relacionamentos entre clientes, pedidos, vendedores e produtos.
- Integridade dos pagamentos.
- Validação de notas de avaliações.
- Limites de parcelamento.
- Métodos de pagamento permitidos.
- Prevenção de avaliações duplicadas.

## Documentação e evidências

- [Relatório Técnico](docs/relatorios/relatorio_tecnico.md)
- [Diagrama DER — PNG](docs/diagramas/der_marketplace.png)
- [Diagrama DER — Mermaid](docs/diagramas/der_marketplace.mmd)

A pasta `evidencias/` contém capturas de tela da estrutura do banco, dos dados inseridos, de consultas SQL e dos testes de integridade.

## Segurança e LGPD

O projeto utiliza dados fictícios, evitando a exposição de informações pessoais reais.

Foram implementadas restrições de integridade para proteger a consistência dos dados.

**Observação:** o Row Level Security (RLS) ainda não foi habilitado nas tabelas do Supabase. A configuração de políticas de acesso, autenticação, autorização e backups é uma melhoria necessária para um ambiente de produção.

## Entrega

- **Data:** 01/12/2026
- **SGBD:** PostgreSQL
- **Plataforma:** Supabase
- **Avaliação:** Projeto A3 — Banco de Dados Relacional