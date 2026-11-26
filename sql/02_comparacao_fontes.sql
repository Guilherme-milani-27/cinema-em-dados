SELECT
    ml.movie_id,
    t.tmdb_id,
    ml.titulo AS titulo_movielens,
    t.titulo AS titulo_tmdb,
    ml.quantidade_avaliacoes,
    ml.nota_movielens,
    t.quantidade_votos_tmdb,
    t.nota_tmdb
FROM correspondencias AS c
INNER JOIN filmes_movielens AS ml
    ON c.movie_id = ml.movie_id
INNER JOIN filmes_tmdb AS t
    ON c.tmdb_id = t.tmdb_id
WHERE ml.quantidade_avaliacoes >= 50
  AND t.quantidade_votos_tmdb >= 100
  AND ml.nota_movielens IS NOT NULL
  AND t.nota_tmdb IS NOT NULL
ORDER BY ml.movie_id;
