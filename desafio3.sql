CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.nome AS 'usuario',
c.nome AS 'nome'
FROM SpotifyClone.usuario AS u
INNER JOIN SpotifyClone.historico_de_reproducoes AS h ON u.id = h.id_usuario
INNER JOIN SpotifyClone.cancoes AS c ON h.id_cancao = c.id
ORDER BY usuario, nome;
