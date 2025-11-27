INSERT INTO usuario (nome, email, senha_hash) VALUES
('Filipe', 'filipe@example.com', 'hash123'),
('Ana', 'ana@example.com', 'hash456');

INSERT INTO exercicio (nome, grupo_muscular, tipo, descricao) VALUES
('Supino Reto', 'Peito', 'Livre', 'Banco plano com barra'),
('Agachamento Livre', 'Pernas', 'Livre', 'Barra nas costas, agachamento completo'),
('Remada Curvada', 'Costas', 'Livre', 'Tronco inclinado, puxada com barra');

INSERT INTO rotina (usuario_id, nome, dia_semana) VALUES
(1, 'Treino A - Peito/Tríceps', 'segunda'),
(1, 'Treino B - Costas/Bíceps', 'quarta');

INSERT INTO item_rotina (rotina_id, exercicio_id, ordem, series_planejadas, repeticoes_planejadas, carga_inicial) VALUES
(1, 1, 1, 4, 10, 60.00),
(1, 2, 2, 3, 12, 80.00),
(2, 3, 1, 4, 8, 70.00);

INSERT INTO sessao_treino (usuario_id, rotina_id, data, duracao_minutos) VALUES
(1, 1, '2025-11-24 18:30:00', 60),
(1, 2, '2025-11-26 19:00:00', 65);

INSERT INTO serie_realizada (sessao_treino_id, exercicio_id, numero_serie, repeticoes_realizadas, carga_utilizada) VALUES
(1, 1, 1, 10, 60.00),
(1, 1, 2, 10, 60.00),
(1, 1, 3, 9, 60.00),
(1, 1, 4, 8, 60.00),
(2, 3, 1, 8, 70.00);