CREATE VIEW top_3_artistas AS
SELECT artista AS artista, COUNT(sa.artista_id) AS seguidores
FROM seguindo_artistas AS sa 
INNER JOIN artistas AS a ON sa.artista_id = a.artista_id
GROUP BY sa.artista_id
ORDER BY seguidores DESC, artista
LIMIT 3;
