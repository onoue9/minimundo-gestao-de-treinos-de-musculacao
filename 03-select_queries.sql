-- Consulta 1: Listar todas as sessões com nome do usuário
SELECT u.nome AS usuario, s.data, r.nome AS rotina
FROM sessao_treino s
JOIN usuario u ON s.usuario_id = u.id
LEFT JOIN rotina r ON s.rotina_id = r.id
ORDER BY s.data DESC;

-- Consulta 2: Evolução de carga no Supino Reto para o usuário 1
SELECT s.data, sr.carga_utilizada
FROM serie_realizada sr
JOIN sessao_treino s ON sr.sessao_treino_id = s.id
JOIN exercicio e ON sr.exercicio_id = e.id
WHERE e.nome = 'Supino Reto' AND s.usuario_id = 1
ORDER BY s.data
LIMIT 5;

-- Consulta 3: Quantidade de séries por exercício nas últimas 2 sessões
SELECT e.nome, COUNT(*) AS total_series
FROM serie_realizada sr
JOIN exercicio e ON sr.exercicio_id = e.id
WHERE sr.sessao_treino_id IN (
    SELECT id FROM sessao_treino WHERE usuario_id = 1 ORDER BY data DESC LIMIT 2
)
GROUP BY e.nome;

-- Consulta 4: Rotinas ativas do usuário 1
SELECT nome, dia_semana
FROM rotina
WHERE usuario_id = 1 AND ativo = TRUE;

-- Consulta 5: Última sessão de cada usuário
SELECT u.nome, MAX(s.data) AS ultima_sessao
FROM usuario u
JOIN sessao_treino s ON u.id = s.usuario_id
GROUP BY u.id, u.nome;