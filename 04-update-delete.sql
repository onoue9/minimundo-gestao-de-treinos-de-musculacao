-- UPDATE 1: Atualizar carga inicial do Supino na Rotina A
UPDATE item_rotina
SET carga_inicial = 65.00
WHERE rotina_id = 1 AND exercicio_id = 1;

-- UPDATE 2: Marcar rotina como inativa
UPDATE rotina
SET ativo = FALSE
WHERE id = 2;

-- UPDATE 3: Corrigir repetições realizadas em uma série
UPDATE serie_realizada
SET repeticoes_realizadas = 10
WHERE id = 4;

-- DELETE 1: Remover todas as séries de uma sessão específica
DELETE FROM serie_realizada
WHERE sessao_treino_id = 2;

-- DELETE 2: Remover sessão após exclusão de séries (CASCADE já cuida, mas exemplo explícito)
DELETE FROM sessao_treino
WHERE id = 2;

-- DELETE 3: Remover exercício que não está em uso
DELETE FROM exercicio
WHERE id = 3 AND id NOT IN (
    SELECT DISTINCT exercicio_id FROM item_rotina
    UNION
    SELECT DISTINCT exercicio_id FROM serie_realizada
);