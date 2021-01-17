USE SpotifyClone
DELIMITER $$
CREATE TRIGGER trigger_usuario_delete
BEFORE DELETE ON usuarios
FOR EACH ROW
BEGIN
DELETE FROM historico
WHERE usuario_id = OLD.usuario_id;
DELETE FROM seguindo
WHERE usuario_id = OLD.usuario_id;
END
DELIMITER ;

DELETE FROM usuarios
WHERE usuario_name = 'Thati';
