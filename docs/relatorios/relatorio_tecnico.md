\# RELATÓRIO TÉCNICO

\## Projeto A3 – Sistema de E-commerce / Marketplace



\*\*Disciplina:\*\* Banco de Dados  

\*\*Tecnologia:\*\* PostgreSQL / Supabase  

\*\*Data de desenvolvimento:\*\* Novembro de 2026  

\*\*Data de entrega:\*\* 01/12/2026



\---



\## 1. INTRODUÇÃO



Este projeto tem como objetivo desenvolver a estrutura de um banco de dados relacional para um sistema de e-commerce no modelo marketplace, no qual diferentes vendedores podem anunciar produtos e comercializá-los para clientes por meio de uma plataforma digital.



O banco de dados foi desenvolvido utilizando PostgreSQL, com hospedagem e gerenciamento por meio da plataforma Supabase.



O projeto contempla a modelagem das entidades, definição dos relacionamentos, criação das tabelas, inserção de dados fictícios, elaboração de consultas SQL e execução de testes de integridade.



A proposta busca representar operações comuns de um marketplace, garantindo organização das informações e consistência dos relacionamentos entre as entidades.



\## 2. OBJETIVOS



\### 2.1 Objetivo geral



Desenvolver um banco de dados relacional capaz de armazenar e organizar as principais informações de um sistema de marketplace, permitindo consultas e análises relacionadas a clientes, vendedores, produtos, pedidos, pagamentos e avaliações.



\### 2.2 Objetivos específicos



\- Elaborar o modelo entidade-relacionamento (DER).

\- Identificar as entidades e seus relacionamentos.

\- Criar tabelas utilizando comandos DDL.

\- Definir chaves primárias e estrangeiras.

\- Aplicar restrições de integridade.

\- Inserir dados fictícios utilizando comandos DML.

\- Desenvolver consultas SQL utilizando DQL.

\- Validar a integridade dos dados.

\- Documentar a estrutura e os testes realizados.



\## 3. TECNOLOGIAS E FERRAMENTAS



As seguintes tecnologias e ferramentas foram utilizadas:



| Tecnologia/Ferramenta | Finalidade |

|---|---|

| PostgreSQL | Sistema gerenciador de banco de dados relacional |

| Supabase | Hospedagem e gerenciamento do banco de dados |

| SQL | Criação, manipulação e consulta dos dados |

| Mermaid | Elaboração do diagrama entidade-relacionamento |

| Git/GitHub | Versionamento e organização do projeto |

| Visual Studio Code / Bloco de Notas | Edição dos arquivos do projeto |



\## 4. MODELAGEM DO BANCO DE DADOS



O banco de dados foi estruturado para representar as principais operações de um marketplace.



O modelo contempla 12 tabelas, organizadas para representar os diferentes elementos do sistema e seus relacionamentos.



\### 4.1 Entidades implementadas



| Tabela | Descrição |

|---|---|

| clientes | Armazena os dados dos clientes |

| vendedores | Armazena os dados dos vendedores e lojas |

| categorias | Organiza os produtos por categorias |

| produtos | Armazena os produtos anunciados |

| estoque | Controla as quantidades disponíveis e reservadas |

| produto\_categoria | Relaciona produtos com categorias |

| pedidos | Registra os pedidos realizados pelos clientes |

| itens\_pedido | Armazena os produtos e quantidades de cada pedido |

| pagamentos | Registra os pagamentos associados aos pedidos |

| pagamento\_cartao | Armazena informações específicas de pagamentos com cartão |

| pagamento\_pix | Armazena informações específicas de pagamentos via PIX |

| avaliacoes | Registra as avaliações dos clientes sobre os produtos |



\### 4.2 Relacionamentos



O modelo apresenta os seguintes relacionamentos principais:



\- Um cliente pode realizar vários pedidos.

\- Um vendedor pode anunciar vários produtos.

\- Um produto possui um registro de estoque no conjunto de dados utilizado.

\- Um produto pode pertencer a diferentes categorias.

\- Uma categoria pode possuir diversos produtos.

\- Um pedido contém um ou mais itens.

\- Um produto pode aparecer em diferentes itens de pedidos.

\- Um pedido pode possuir um pagamento.

\- Um pagamento pode possuir informações complementares de cartão ou PIX.

\- Um cliente pode realizar avaliações de diferentes produtos.

\- Um produto pode receber avaliações de diferentes clientes.

\- As categorias permitem uma estrutura hierárquica por meio de uma referência à própria tabela.



\### 4.3 Diagrama entidade-relacionamento



O DER foi desenvolvido utilizando Mermaid e exportado nos formatos editável e de imagem.



Arquivos:



\- `docs/diagramas/der\_marketplace.mmd`

\- `docs/diagramas/der\_marketplace.png`



O diagrama representa visualmente as entidades e os relacionamentos definidos para o banco de dados.



\## 5. IMPLEMENTAÇÃO DO BANCO DE DADOS



A implementação foi realizada no PostgreSQL, utilizando o ambiente Supabase.



O desenvolvimento foi dividido em scripts SQL para facilitar a organização e a manutenção.



\### 5.1 DDL – Data Definition Language



O arquivo `sql/01\_ddl.sql` contém os comandos responsáveis pela criação da estrutura do banco de dados.



Foram implementados:



\- Criação das 12 tabelas.

\- Definição das chaves primárias.

\- Definição das chaves estrangeiras.

\- Restrições de unicidade.

\- Restrições CHECK.

\- Definição de campos obrigatórios.

\- Valores padrão para determinados atributos.

\- Relacionamentos entre as entidades.



Entre as regras implementadas, destacam-se:



\- Preços de produtos não podem ser negativos.

\- Quantidades de estoque não podem ser negativas.

\- Quantidade de itens de pedidos deve ser maior que zero.

\- Notas de avaliações devem estar entre 1 e 5.

\- Parcelamentos no cartão devem estar entre 1 e 12.

\- Métodos de pagamento devem respeitar os valores permitidos: CARTAO e PIX.

\- Uma avaliação não pode ser repetida para o mesmo cliente e produto.

\- O identificador da transação PIX deve ser único.



\### 5.2 DML – Data Manipulation Language



O arquivo `sql/02\_dml.sql` contém os comandos de inserção dos dados fictícios utilizados para popular o banco.



Foram inseridos registros nas 12 tabelas.



| Tabela | Registros |

|---|---:|

| Clientes | 10 |

| Vendedores | 5 |

| Categorias | 8 |

| Produtos | 30 |

| Estoque | 30 |

| Produto\_categoria | 40 |

| Pedidos | 20 |

| Itens\_pedido | 40 |

| Pagamentos | 20 |

| Pagamento\_cartao | 10 |

| Pagamento\_pix | 10 |

| Avaliacoes | 15 |

| \*\*Total\*\* | \*\*238\*\* |



Os dados utilizados são fictícios e foram desenvolvidos para simular operações de um marketplace.



Durante a validação, foram realizados ajustes diretamente no banco para compatibilizar os valores dos itens, pedidos e pagamentos.



Esses ajustes foram importantes para garantir a consistência dos valores armazenados. Para reproduzir integralmente o estado final do banco em uma nova execução, os ajustes realizados diretamente no ambiente também devem ser incorporados ao script de carga.



\## 6. CONSULTAS SQL – DQL



O arquivo `sql/03\_dql.sql` contém oito consultas desenvolvidas para extrair informações relevantes do marketplace.



\### 6.1 Produtos mais vendidos



Identifica os produtos com maior quantidade vendida e apresenta o faturamento calculado a partir dos itens dos pedidos.



\### 6.2 Faturamento por vendedor



Apresenta a quantidade de pedidos, unidades vendidas e faturamento associado aos produtos de cada vendedor.



\### 6.3 Vendas por mês



Agrupa os pedidos por mês, apresentando a quantidade de pedidos, o faturamento total registrado e o ticket médio.



\### 6.4 Produtos com estoque baixo



Identifica produtos cujo estoque livre, calculado pela diferença entre quantidade disponível e reservada, é igual ou inferior a 10 unidades.



\### 6.5 Clientes que mais compraram



Apresenta os clientes com maior valor total associado aos pedidos registrados, considerando também a quantidade de pedidos.



\### 6.6 Vendas por categoria



Apresenta a quantidade de produtos vendidos e o faturamento agrupados por categoria.



\### 6.7 Média de avaliações dos produtos



Calcula a quantidade de avaliações e a média das notas recebidas pelos produtos.



\### 6.8 Pedidos aguardando pagamento



Identifica os pedidos que possuem pagamentos com status PENDENTE, apresentando informações do cliente, pedido e pagamento.



\*\*Observação:\*\* as consultas de faturamento e compras consideram os pedidos registrados, sem aplicar necessariamente um filtro de pagamentos aprovados ou pedidos concluídos. Dessa forma, os resultados representam os dados registrados no banco, e não exclusivamente valores efetivamente recebidos.



\## 7. TESTES DE INTEGRIDADE



O arquivo `sql/tests/04\_testes\_integridade.sql` contém oito testes desenvolvidos para verificar a consistência dos dados e o funcionamento das restrições implementadas.



\### 7.1 Testes de identificação de inconsistências



\*\*Teste 1 – Pedidos sem cliente\*\*



Verifica se existem pedidos associados a clientes inexistentes.



\*\*Teste 2 – Produtos sem vendedor\*\*



Verifica se existem produtos sem um vendedor correspondente.



\*\*Teste 3 – Pagamentos sem pedido\*\*



Verifica se existem pagamentos sem um pedido relacionado.



\*\*Teste 4 – Avaliações com notas inválidas\*\*



Identifica avaliações com notas inferiores a 1 ou superiores a 5.



Os quatro testes foram executados sem retornar registros, indicando ausência das inconsistências pesquisadas.



\### 7.2 Testes de restrições do banco



\*\*Teste 5 – Rejeição de notas inválidas\*\*



Tenta atualizar uma avaliação para nota zero, verificando se a restrição CHECK impede a operação.



\*\*Teste 6 – Rejeição de parcelamento inválido\*\*



Tenta registrar 13 parcelas, verificando o limite definido para pagamentos com cartão.



\*\*Teste 7 – Rejeição de método de pagamento inválido\*\*



Tenta utilizar o método BOLETO, que não está entre os métodos permitidos.



\*\*Teste 8 – Rejeição de avaliações duplicadas\*\*



Tenta inserir uma avaliação repetida para o mesmo cliente e produto, verificando a restrição UNIQUE.



Os testes foram executados por meio de blocos PL/pgSQL com tratamento de exceções. As operações inválidas são interceptadas, evitando que os dados de teste sejam mantidos no banco.



\### 7.3 Resultado geral



O script completo de testes foi executado no Supabase com retorno de execução bem-sucedida (`Success. No rows returned`).



Também foi realizada uma consulta posterior para verificar a preservação dos registros principais, mantendo as quantidades esperadas de clientes, produtos, pedidos, pagamentos e avaliações.



\## 8. ORGANIZAÇÃO DO PROJETO



Os arquivos foram organizados da seguinte maneira:



```text

a3-marketplace-ecommerce/

│

├── docs/

│   ├── apresentacao/

│   ├── diagramas/

│   │   ├── der\_marketplace.mmd

│   │   └── der\_marketplace.png

│   └── relatorios/

│       └── relatorio\_tecnico.md

│

├── evidencias/

│   ├── 01\_estrutura\_banco.png

│   ├── 02\_dados\_clientes.png

│   ├── 03\_consulta\_produtos\_mais\_vendidos.png

│   └── 04\_testes\_integridade.png

│

├── sql/

│   ├── tests/

│   │   └── 04\_testes\_integridade.sql

│   ├── 01\_ddl.sql

│   ├── 02\_dml.sql

│   └── 03\_dql.sql

│

├── .gitignore

└── README.md

```



A organização permite identificar separadamente os scripts de implementação, os documentos técnicos, o diagrama e as evidências de execução.



\## 9. SEGURANÇA E PROTEÇÃO DOS DADOS



O projeto utiliza dados fictícios, evitando a exposição de informações pessoais reais.



Foram implementadas restrições de integridade para impedir determinadas operações inválidas e manter a consistência dos registros.



Entretanto, é importante destacar que o Row Level Security (RLS) ainda não foi habilitado nas tabelas do Supabase.



Em um ambiente de produção, seria necessário configurar políticas de acesso, autenticação, autorização, proteção das informações, backups e demais mecanismos de segurança.



Também devem ser consideradas as boas práticas previstas na Lei Geral de Proteção de Dados (LGPD), especialmente em relação ao tratamento e à proteção de dados pessoais.



\## 10. CONCLUSÃO



O desenvolvimento do projeto possibilitou aplicar conceitos fundamentais de banco de dados relacionais, desde a modelagem até a implementação e validação de uma estrutura utilizando PostgreSQL.



A construção das 12 tabelas permitiu representar diferentes operações de um marketplace, estabelecendo relacionamentos e regras de integridade entre os dados.



A inserção de 238 registros fictícios possibilitou simular operações de clientes, vendedores, produtos, pedidos, pagamentos e avaliações.



As oito consultas SQL permitiram explorar os dados e gerar informações relevantes para análises comerciais e operacionais.



Por fim, os oito testes de integridade contribuíram para verificar a consistência dos registros e o funcionamento de restrições importantes do banco de dados.



Dessa forma, o projeto atingiu seu objetivo acadêmico de desenvolver e documentar uma estrutura de banco de dados relacional para um sistema de e-commerce/marketplace, demonstrando a aplicação prática dos conceitos estudados na disciplina.



\---



\*\*Projeto A3 – E-commerce / Marketplace\*\*  

\*\*Banco de Dados – PostgreSQL / Supabase\*\*  

\*\*Novembro de 2026\*\*

