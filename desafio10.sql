-- aqui definimos que iremos usar o db SpotifyClone
USE SpotifyClone;

-- aqui criamos a funcao que retornara a qtdade de musicas no historico
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(id VARCHAR(50))
RETURNS INT READS SQL DATA
BEGIN

DECLARE Quantidade INT;
SELECT
COUNT(cancao_id)
FROM reproducoes
WHERE id = usuario_id
INTO Quantidade;
RETURN Quantidade;

END $$
DELIMITER ;
