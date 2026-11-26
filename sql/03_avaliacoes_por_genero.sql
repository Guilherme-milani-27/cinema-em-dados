SELECT
    g.genero,
    COUNT(*) AS filmes_cadastrados,
    SUM(
        CASE WHEN f.quantidade_avaliacoes > 0 THEN 1 ELSE 0 END
    ) AS filmes_avaliados,
    SUM(f.quantidade_avaliacoes) AS quantidade_avaliacoes,
    AVG(f.nota_movielens) AS media_por_filme,
    SUM(f.nota_movielens * f.quantidade_avaliacoes)
        / NULLIF(SUM(f.quantidade_avaliacoes), 0)
        AS media_por_avaliacao
FROM generos_movielens AS g
INNER JOIN filmes_movielens AS f
    ON g.movie_id = f.movie_id
GROUP BY g.genero
ORDER BY quantidade_avaliacoes DESC;
