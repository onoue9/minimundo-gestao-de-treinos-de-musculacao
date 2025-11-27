CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE exercicio (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    grupo_muscular VARCHAR(50) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    descricao TEXT
);

CREATE TABLE rotina (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    nome VARCHAR(100) NOT NULL,
    dia_semana VARCHAR(20),
    ativo BOOLEAN DEFAULT TRUE,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);

CREATE TABLE item_rotina (
    id SERIAL PRIMARY KEY,
    rotina_id INTEGER NOT NULL,
    exercicio_id INTEGER NOT NULL,
    ordem INTEGER NOT NULL,
    series_planejadas INTEGER NOT NULL,
    repeticoes_planejadas INTEGER NOT NULL,
    carga_inicial DECIMAL(5,2),
    FOREIGN KEY (rotina_id) REFERENCES rotina(id) ON DELETE CASCADE,
    FOREIGN KEY (exercicio_id) REFERENCES exercicio(id)
);

CREATE TABLE sessao_treino (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    rotina_id INTEGER,
    data TIMESTAMP NOT NULL,
    duracao_minutos INTEGER,
    observacoes TEXT,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (rotina_id) REFERENCES rotina(id)
);

CREATE TABLE serie_realizada (
    id SERIAL PRIMARY KEY,
    sessao_treino_id INTEGER NOT NULL,
    exercicio_id INTEGER NOT NULL,
    numero_serie INTEGER NOT NULL,
    repeticoes_realizadas INTEGER NOT NULL,
    carga_utilizada DECIMAL(5,2) NOT NULL,
    observacao_serie TEXT,
    FOREIGN KEY (sessao_treino_id) REFERENCES sessao_treino(id) ON DELETE CASCADE,
    FOREIGN KEY (exercicio_id) REFERENCES exercicio(id)
);