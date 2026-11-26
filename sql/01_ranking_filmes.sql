SELECT
    f.movie_id,
    f.titulo,
    COUNT(*) AS quantidade_avaliacoes,
    AVG(a.nota) AS nota_media
FROM filmes_movielens AS f
INNER JOIN avaliacoes AS a
    ON f.movie_id = a.movie_id
GROUP BY
    f.movie_id,
    f.titulo
HAVING COUNT(*) >= 50
ORDER BY
    nota_media DESC,
    quantidade_avaliacoes DESC,
    f.movie_id ASC
LIMIT 10;
