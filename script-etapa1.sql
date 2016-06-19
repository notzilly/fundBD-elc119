CREATE SCHEMA IF NOT EXISTS `dominios` DEFAULT CHARACTER SET utf8 ;
USE `dominios` ;

-- -----------------------------------------------------
-- Table `dominios`.`tabelao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dominios`.`tabelao` (
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


-- -----------------------------------------------------
-- Table `dominios`.`localidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dominios`.`localidade` (
  `id_localidade` INT NOT NULL AUTO_INCREMENT,
  `uf` VARCHAR(2) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `cep` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`id_localidade`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `dominios`.`instituicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dominios`.`instituicao` (
  `id_instituicao` INT NOT NULL AUTO_INCREMENT,
  `documento` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `id_localidade` INT NOT NULL,
  PRIMARY KEY (`id_instituicao`),
  INDEX `fk_instituicao_localidade1_idx` (`id_localidade` ASC),
  CONSTRAINT `fk_instituicao_localidade1`
    FOREIGN KEY (`id_localidade`)
    REFERENCES `dominios`.`localidade` (`id_localidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = ' ';


-- -----------------------------------------------------
-- Table `dominios`.`dominio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dominios`.`dominio` (
  `id_dominio` INT NOT NULL AUTO_INCREMENT,
  `dominio` VARCHAR(100) NOT NULL,
  `data_cadastro` VARCHAR(20) NOT NULL,
  `ultima_atualizacao` VARCHAR(20) NOT NULL,
  `ticket` INT NOT NULL,
  `id_instituicao` INT NOT NULL,
  PRIMARY KEY (`id_dominio`),
  INDEX `fk_dominios_instituicao_idx` (`id_instituicao` ASC),
  CONSTRAINT `fk_dominios_instituicao`
    FOREIGN KEY (`id_instituicao`)
    REFERENCES `dominios`.`instituicao` (`id_instituicao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;