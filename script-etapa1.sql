CREATE DATABASE IF NOT EXISTS dominios;
USE dominios;

CREATE TABLE IF NOT EXISTS `tabelao` (
  `idtabelao` INT NOT NULL AUTO_INCREMENT,
  `dominio` VARCHAR(100) NOT NULL,
  `documento` VARCHAR(30) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `uf` VARCHAR(2) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  `data_cadastro` VARCHAR(20) NOT NULL,
  `ultima_atualizacao` VARCHAR(20) NOT NULL,
  `ticket` INT NOT NULL,
  PRIMARY KEY (`idtabelao`))
ENGINE = InnoDB;


