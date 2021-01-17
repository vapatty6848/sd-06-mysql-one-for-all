DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE IF NOT EXISTS financeiro (
  financeiro_id INT PRIMARY KEY auto_increment,
  plano VARCHAR(100) NOT NULL,
  valor_plano DECIMAL(3, 2)
)engine=InnoDB;

CREATE TABLE IF NOT EXISTS usuarios (
  usuario_id INT PRIMARY KEY auto_increment,
  nome varchar(255) NOT NULL,
  idade int NOT NULL,
  financeiro_id INT NOT NULL,
  FOREIGN KEY(financeiro_id) REFERENCES financeiro (financeiro_id)
)engine=InnoDB;

CREATE TABLE IF NOT EXISTS artistas (
  artista_id INT PRIMARY KEY auto_increment,
  artista varchar(255) NOT NULL
)engine=InnoDB;

CREATE TABLE IF NOT EXISTS albums (
  album_id INT PRIMARY KEY auto_increment,
  album varchar(255) NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY(artista_id) REFERENCES artistas (artista_id)
)engine=InnoDB;

CREATE TABLE IF NOT EXISTS cancoes (
  cancoes_id INT PRIMARY KEY auto_increment,
  cancao varchar(255) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albums (album_id)
)engine=InnoDB;

CREATE TABLE IF NOT EXISTS seguindo_artistas (
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY(usuario_id, artista_id),
  FOREIGN KEY(usuario_id) REFERENCES usuarios (usuario_id),
  FOREIGN KEY(artista_id) REFERENCES artistas (artista_id)
)engine=InnoDB;

CREATE TABLE IF NOT EXISTS historico_de_reproducoes (
  usuario_id INT NOT NULL,
  cancoes_id INT NOT NULL,
  PRIMARY KEY (usuario_id, cancoes_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
  FOREIGN KEY (cancoes_id) REFERENCES cancoes(cancoes_id)
)engine=InnoDB;

INSERT INTO financeiro (plano, valor_plano)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitario', 5.99);

INSERT INTO usuarios(nome, idade, financeiro_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO artistas(artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shanno');

  INSERT INTO albums (album, artista_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO cancoes(cancao, album_id)
VALUES
  ('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ('Sweet, Let’s Go Wild', 3),
  ('She Knows', 3),
  ('Fantasy For Me', 4),
  ('Celebration Of More', 4),
  ('Rock His Everything', 4),
  ('Home Forever', 4),
  ('Diamond Power', 4),
  ('Honey, Let’s Be Silly', 4),
  ('Thang Of Thunder', 5),
  ('Words Of Her Life', 5),
  ('Without My Streets', 5);

  INSERT INTO historico_de_reproducoes(usuario_id, cancoes_id)
VALUES
  (1, 1),
  (1, 6),
  (1, 14),
  (1, 16),
  (2, 13),
  (2, 17),
  (2, 2),
  (2, 15),
  (3, 4),
  (3, 16),
  (3, 6),
  (4, 3),
  (4, 18),
  (4, 11);

INSERT INTO seguindo_artistas(usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);
