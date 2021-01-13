DROP SCHEMA IF EXISTS `SpotifyClone` ;

-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SpotifyClone` ;
USE `SpotifyClone` ;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`plano`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`plano` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plano` (
  `id` INT NOT NULL,
  `nome` VARCHAR(30) NOT NULL,
  `valor` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`plano` (`id`, `nome`, `valor`) VALUES
(1, 'gratuito', 0),
(2, 'familiar', 7.99),
(3, 'universitário', 5.99);

-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`usuario` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario` (
  `id` INT NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `idade` INT NOT NULL,
  `id_plano` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuario_plano1_idx` (`id_plano` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_plano1`
    FOREIGN KEY (`id_plano`)
    REFERENCES `SpotifyClone`.`plano` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`usuario` (`id`, `nome`, `idade`, `id_plano`) VALUES
(1, 'Thati', 23, 1),
(2, 'Cintia', 35, 2),
(3, 'Bill', 20, 3),
(4, 'Roger', 45, 1);

-- -----------------------------------------------------
-- Table `SpotifyClone`.`artista`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`artista` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artista` (
  `id` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`artista` (`id`, `nome`) VALUES
(1, 'Walter Phoenix'),
(2, 'Peter Strong'),
(3, 'Lance Day'),
(4, 'Freedie Shannon');

-- -----------------------------------------------------
-- Table `SpotifyClone`.`album`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`album` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `id_artista` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_album_1_idx` (`id_artista` ASC) VISIBLE,
  CONSTRAINT `fk_album_artista`
    FOREIGN KEY (`id_artista`)
    REFERENCES `SpotifyClone`.`artista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`album` (`id`, `nome`, `id_artista`) VALUES
(1, 'Envious', 1),
(2, 'Exuberant', 1),
(3, 'Hallowed', 2),
(4, 'Incandescent', 3),
(5, 'Temporary Culture', 4);

-- -----------------------------------------------------
-- Table `SpotifyClone`.`cancoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`cancoes` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancoes` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `id_album` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cancoes_album_idx` (`id_album` ASC) VISIBLE,
  CONSTRAINT `fk_cancoes_album`
    FOREIGN KEY (`id_album`)
    REFERENCES `SpotifyClone`.`album` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`cancoes` (`id`, `nome`, `id_album`) VALUES
(1, 'Soul For Us', 1),
(2, 'Reflections Of Magic', 1),
(3, 'Dance With Her Own', 1),
(4, 'Troubles Of My Inner Fire', 2),
(5, 'Time Fireworks', 2),
(6, 'Magic Circus', 3),
(7, 'Honey, So Do I', 3),
(8, "Sweetie Let's Go Wild", 3),
(9, 'She Knows', 3),
(10, 'Fantasy For Me', 4),
(11, 'Celebration Of More', 4),
(12, 'Rock His Everything', 4),
(13, 'Home Forever', 4),
(14, 'Diamond Power', 4),
(15, "Honey, Let's Be Silly", 4),
(16, 'Thang Of Thunder', 5),
(17, 'Words Of Her Life', 5),
(18, 'Without My Streets', 4);

-- -----------------------------------------------------
-- Table `SpotifyClone`.`historico_de_reproducoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`historico_de_reproducoes` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico_de_reproducoes` (
  `id_usuario` INT NOT NULL,
  `id_cancao` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_cancao`),
  INDEX `fk_historico_de_reproducoes_cancoes_idx` (`id_cancao` ASC) VISIBLE,
  CONSTRAINT `fk_historico_de_reproducoes_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `SpotifyClone`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_historico_de_reproducoes_cancoes`
    FOREIGN KEY (`id_cancao`)
    REFERENCES `SpotifyClone`.`cancoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`historico_de_reproducoes` (`id_usuario`, `id_cancao`) VALUES
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

-- -----------------------------------------------------
-- Table `SpotifyClone`.`seguindo_artistas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`seguindo_artistas` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguindo_artistas` (
  `id_usuario` INT NOT NULL,
  `id_artista` INT NOT NULL,
  INDEX `fk_seguindo_artistas_usuario_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_seguindo_artistas_artista_idx` (`id_artista` ASC) VISIBLE,
  PRIMARY KEY (`id_usuario`, `id_artista`),
  CONSTRAINT `fk_seguindo_artistas_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `SpotifyClone`.`usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seguindo_artistas_artista`
    FOREIGN KEY (`id_artista`)
    REFERENCES `SpotifyClone`.`artista` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`seguindo_artistas` (`id_usuario`, `id_artista`) VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
