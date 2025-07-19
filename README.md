
# Oficina - Projeto de Banco de Dados Lógico

Projeto desenvolvido com foco em modelagem e implementação de um banco de dados lógico utilizando MySQL. O objetivo foi representar o sistema de controle de ordens de serviço de uma oficina mecânica, com criação de tabelas, relacionamentos, inserção de dados e consultas SQL avançadas.

---

## Descrição do Projeto

O projeto contempla a construção do **modelo lógico relacional** baseado no esquema conceitual previamente elaborado. Inclui a criação do banco de dados, inserção de dados de teste e execução de consultas SQL com diferentes cláusulas.

### 🔧 Contexto do Sistema

- Clientes levam veículos à oficina para conserto ou revisão.
- Cada veículo é atribuído a uma equipe de mecânicos.
- Os serviços executados são registrados em uma ordem de serviço (OS).
- Os valores da OS são calculados com base em serviços e peças utilizadas.
- Mecânicos têm código, nome, especialidade e endereço.
- A OS possui número, data de emissão, valor, status e data de entrega.

---

## Modelo Lógico

As principais entidades e relacionamentos implementados:

- **clientes**: dados dos clientes da oficina.
- **veiculos**: veículos associados a clientes.
- **mecanicos**: equipe técnica da oficina.
- **equipes**: grupo de mecânicos designados às ordens.
- **ordens_servico**: controle das OS emitidas.
- **servicos**: tabela com serviços e valores de mão-de-obra.
- **pecas**: peças utilizadas nas ordens.
- **relacionamentos**: tabelas associativas `equipe_mecanicos`, `os_servicos` e `os_pecas`.

---

## Scripts

### 🔹 Criação do Banco de Dados
O script para criação do banco está no arquivo:

📄 [`oficina_modelo_logico.sql`](oficina_modelo_logico.sql)

### 🔹 Inserção de Dados
Para testes, utilize o script com dados fictícios:

📄 [`oficina_inserts_teste.sql`](oficina_inserts_teste.sql)

---

## Consultas SQL

### 1. Recuperações simples

```sql
SELECT * FROM clientes;
SELECT * FROM veiculos;
```

### 2. Filtros com WHERE

```sql
SELECT * FROM ordens_servico WHERE status = 'Concluída';
```

### 3. Atributos derivados

```sql
SELECT id_os, valor, valor * 0.1 AS taxa_servico FROM ordens_servico;
```

### 4. Ordenação dos dados

```sql
SELECT * FROM ordens_servico ORDER BY data_entrega DESC;
```

### 5. HAVING – filtros em grupos

```sql
SELECT id_cliente, COUNT(*) AS total_os
FROM veiculos v
JOIN ordens_servico os ON v.id_veiculo = os.id_veiculo
GROUP BY id_cliente
HAVING total_os > 1;
```

### 6. Junções entre tabelas

```sql
-- Relação de OS com cliente e equipe
SELECT c.nome AS cliente, os.id_os, os.status, os.data_entrega
FROM clientes c
JOIN veiculos v ON c.id_cliente = v.id_cliente
JOIN ordens_servico os ON v.id_veiculo = os.id_veiculo;
```

```sql
-- Relação de mecânicos e equipes
SELECT e.id_equipe, m.nome AS mecanico
FROM equipes e
JOIN equipe_mecanicos em ON e.id_equipe = em.id_equipe
JOIN mecanicos m ON em.id_mecanico = m.id_mecanico;
```

---

## Teste Online

Você pode testar o projeto diretamente no [DB Fiddle (MySQL 8.0)](https://www.db-fiddle.com/):

1. Cole o conteúdo de `oficina_modelo_logico.sql` e clique em **"Build Schema"**
2. Depois, cole os `INSERTs` e clique em **"Run"**
3. Por fim, teste as queries!

---

## Resultado Esperado

✅ Criação do modelo lógico relacional  
✅ Scripts SQL (estrutura e inserts)  
✅ Consultas SQL com todas as cláusulas solicitadas  
✅ Repositório pronto para entrega do desafio

---

## Desafio DIO - Banco de Dados Lógico

Este repositório faz parte do desafio proposto no módulo de modelagem lógica e implementação de banco de dados com MySQL na DIO.
