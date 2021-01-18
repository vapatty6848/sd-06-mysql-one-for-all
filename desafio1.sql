
DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.planos(
plano_id INT PRIMARY KEY AUTO_INCREMENT,
plano_nome VARCHAR(20) NOT NULL,
valor VARCHAR(20) NOT NULL
)engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios(
usuario_id INT PRIMARY KEY AUTO_INCREMENT,
usuario_nome VARCHAR(50) NOT NULL,
plano_id INT NOT NULL,
idade INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos (plano_id)
)engine = InnoDB;

CREATE TABLE SpotifyClone.artista(
artista_id INT PRIMARY KEY AUTO_INCREMENT,
artista_nome VARCHAR(50) NOT NULL
)engine = InnoDB;

CREATE TABLE SpotifyClone.usuario_segue(
artista_id INT NOT NULL,
usuario_id INT NOT NULL,
FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios (usuario_id),
FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista (artista_id),
PRIMARY KEY (artista_id, usuario_id)
)engine = InnoDB;

CREATE TABLE SpotifyClone.albuns(
album_id INT PRIMARY KEY AUTO_INCREMENT,
album_nome VARCHAR(50) NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista (artista_id)
)engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes(
cancao_id INT PRIMARY KEY AUTO_INCREMENT,
cancao_nome VARCHAR(50) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns(album_id)
)engine = InnoDB;

CREATE TABLE SpotifyClone.historico_reproducao(
usuario_id INT NOT NULL,
cancao_id INT NOT NULL,
FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios (usuario_id),
FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes(cancao_id),
PRIMARY KEY (usuario_id, cancao_id)
)engine = InnoDB;

INSERT INTO SpotifyClone.planos (plano_nome,valor) VALUES ('Gratuito',0);
INSERT INTO SpotifyClone.planos (plano_nome,valor) VALUES ('Familiar',7.99);
INSERT INTO SpotifyClone.planos (plano_nome,valor) VALUES ('Universitário',5.99);

INSERT INTO SpotifyClone.usuarios (usuario_nome,idade,plano_id) VALUES ('Thati',23,1);
INSERT INTO SpotifyClone.usuarios (usuario_nome,idade,plano_id) VALUES ('Cintia',35,2);
INSERT INTO SpotifyClone.usuarios (usuario_nome,idade,plano_id) VALUES ('Bill',20,3);
INSERT INTO SpotifyClone.usuarios (usuario_nome,idade,plano_id) VALUES ('Roger',45,1);

INSERT INTO SpotifyClone.artista (artista_nome) VALUES ('Walter Phoenix');
INSERT INTO SpotifyClone.artista (artista_nome) VALUES ('Peter Strong');
INSERT INTO SpotifyClone.artista (artista_nome) VALUES ('Lance Day');
INSERT INTO SpotifyClone.artista (artista_nome) VALUES ('Freedie Shannon');

INSERT INTO SpotifyClone.usuario_segue (usuario_id, artista_id) VALUES (1,1);
INSERT INTO SpotifyClone.usuario_segue (usuario_id, artista_id) VALUES (1,4);
INSERT INTO SpotifyClone.usuario_segue (usuario_id, artista_id) VALUES (1,3);
INSERT INTO SpotifyClone.usuario_segue (usuario_id, artista_id) VALUES (2,1);
INSERT INTO SpotifyClone.usuario_segue (usuario_id, artista_id) VALUES (2,3);
INSERT INTO SpotifyClone.usuario_segue (usuario_id, artista_id) VALUES (3,2);
INSERT INTO SpotifyClone.usuario_segue (usuario_id, artista_id) VALUES (3,1);
INSERT INTO SpotifyClone.usuario_segue (usuario_id, artista_id) VALUES (4,4);

INSERT INTO SpotifyClone.albuns (album_nome, artista_id) VALUES ('Envious',1);
INSERT INTO SpotifyClone.albuns (album_nome, artista_id) VALUES ('Exuberant',1);
INSERT INTO SpotifyClone.albuns (album_nome, artista_id) VALUES ('Hallowed Steam',2);
INSERT INTO SpotifyClone.albuns (album_nome, artista_id) VALUES ('Incandescent',3);
INSERT INTO SpotifyClone.albuns (album_nome, artista_id) VALUES ('Temporary Culture',4);

INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id) VALUES ('Soul For Us',1);
INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id) VALUES ('Reflections Of Magic',1);
INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id) VALUES ('Dance With Her Own',1);
INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id) VALUES ('Troubles Of My Inner Fire',2);
INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id) VALUES ('Time Fireworks',2);
INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id) VALUES ('Magic Circus',3);
INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id) VALUES ('Honey, So Do I',3);
INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id) VALUES ("Sweetie, Let's Go Wild",3);
INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id) VALUES ('She Knows',3);
INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id) VALUES ('Fantasy For Me',4);
INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id) VALUES ('Celebration Of More',4);
INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id) VALUES ('Rock His Everything',4);
INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id) VALUES ('Home Forever',4);
INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id) VALUES ('Diamond Power',4);
INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id) VALUES ("Honey, Let's Be Silly",4);
INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id) VALUES ('Thang Of Thunder',5);
INSERT INTO SpotifyClone.cancoes (cancao_nome, album_id) VALUES ('Words Of Her Life',5);

INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id) VALUES (1,1);
INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id) VALUES (1,6);
INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id) VALUES (1,14);
INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id) VALUES (1,16);
INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id) VALUES (2,13);
INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id) VALUES (2,17);
INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id) VALUES (2,2);
INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id) VALUES (2,15);
INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id) VALUES (3,4);
INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id) VALUES (3,16);
INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id) VALUES (3,6);
INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id) VALUES (4,3);
INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id) VALUES (4,18);
INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id) VALUES (4,11);
