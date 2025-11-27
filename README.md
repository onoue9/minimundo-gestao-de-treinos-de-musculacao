# 💪 Minimundo - Gestão de Treinos de Musculação

Este repositório contém o modelo de banco de dados relacional para um **aplicativo de gestão de treinos de musculação**, desenvolvido como parte de um projeto de modelagem de dados (minimundo).

O sistema permite:
- Criar e gerenciar rotinas de treino
- Registrar sessões e séries realizadas
- Acompanhar a evolução de carga, repetições e frequência

O modelo está **normalizado até a 3ª Forma Normal (3FN)** e inclui scripts de exemplo para criação, inserção, consulta, atualização e exclusão.

---

## 🗃️ Entidades Principais

- **Usuário**: Pessoa que utiliza o sistema
- **Exercício**: Catálogo de movimentos (ex: agachamento, supino)
- **Rotina**: Treino modelo criado pelo usuário
- **Item da Rotina**: Exercícios com parâmetros dentro de uma rotina
- **Sessão de Treino**: Registro de uma sessão prática
- **Série Realizada**: Dados detalhados de cada série executada

---

## ⚙️ Como Executar

### Pré-requisitos
- [PostgreSQL](https://www.postgresql.org/download/) ou [MySQL](https://dev.mysql.com/downloads/) instalado
- Cliente SQL (ex: `psql`, `mysql`, DBeaver, pgAdmin)

### Passo a passo

1. **Crie um banco de dados vazio**  
   ```sql
   CREATE DATABASE minimundo_treino;
   ```

2. **Execute os scripts na ordem abaixo**:
   ```bash
   psql -U seu_usuario -d minimundo_treino -f 01_create_tables.sql
   psql -U seu_usuario -d minimundo_treino -f 02_insert_data.sql
   psql -U seu_usuario -d minimundo_treino -f 03_select_queries.sql
   psql -U seu_usuario -d minimundo_treino -f 04_update_delete.sql
   ```
   > ⚠️ Para MySQL, use o cliente `mysql`:
   > ```bash
   > mysql -u seu_usuario -p minimundo_treino < 01_create_tables.sql
   > ```

3. **Consulte os resultados** diretamente no seu cliente SQL.

> ✅ **Compatibilidade**: Os scripts usam sintaxe ANSI SQL. Funcionam em **PostgreSQL, MySQL, MariaDB e SQLite** com ajustes mínimos (ex: `datetime` → `timestamp` em alguns SGBDs).

---

## 📜 Scripts Disponíveis

| Arquivo | Descrição |
|--------|----------|
| `01_create_tables.sql` | Criação das 6 tabelas com chaves primárias e estrangeiras |
| `02_insert_data.sql` | Inserção de dados de exemplo para todas as tabelas |
| `03_select_queries.sql` | 5 consultas com JOIN, WHERE, ORDER BY, LIMIT |
| `04_update_delete.sql` | 3 UPDATEs e 3 DELETEs com condições realistas |

---

## 📊 Modelo Conceitual

Veja o DER no [dbdiagram.io](https://dbdiagram.io/d/6928da1da0c4ebcc2b101940)

---

## 📝 Autor

- **Filipe Lira Onoue Melo**
- Repositório criado para fins acadêmicos e demonstração de modelagem relacional.
```