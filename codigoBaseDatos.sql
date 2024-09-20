-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab4GTICS
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab4GTICS
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab4GTICS` DEFAULT CHARACTER SET utf8 ;
USE `lab4GTICS` ;

-- -----------------------------------------------------
-- Table `lab4GTICS`.`Tipo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab4GTICS`.`Tipo` (
  `idtipo` INT NOT NULL AUTO_INCREMENT,
  `nombreTipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab4GTICS`.`Color`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab4GTICS`.`Color` (
  `idColor` INT NOT NULL AUTO_INCREMENT,
  `nombreColor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idColor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab4GTICS`.`Ocasion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab4GTICS`.`Ocasion` (
  `idOcasion` INT NOT NULL AUTO_INCREMENT,
  `ocasion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idOcasion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab4GTICS`.`Flor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab4GTICS`.`Flor` (
  `idFlor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `imagen` VARCHAR(255) NULL,
  `precio` DOUBLE NOT NULL,
  `descripcion` TEXT NULL,
  `Tipo_idtipo` INT NOT NULL,
  `Color_idColor` INT NOT NULL,
  `Ocasion_idOcasion` INT NOT NULL,
  PRIMARY KEY (`idFlor`, `Ocasion_idOcasion`),
  INDEX `fk_Flor_Tipo_idx` (`Tipo_idtipo` ASC) VISIBLE,
  INDEX `fk_Flor_Color1_idx` (`Color_idColor` ASC) VISIBLE,
  INDEX `fk_Flor_Ocasion1_idx` (`Ocasion_idOcasion` ASC) VISIBLE,
  CONSTRAINT `fk_Flor_Tipo`
    FOREIGN KEY (`Tipo_idtipo`)
    REFERENCES `lab4GTICS`.`Tipo` (`idtipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flor_Color1`
    FOREIGN KEY (`Color_idColor`)
    REFERENCES `lab4GTICS`.`Color` (`idColor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flor_Ocasion1`
    FOREIGN KEY (`Ocasion_idOcasion`)
    REFERENCES `lab4GTICS`.`Ocasion` (`idOcasion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab4GTICS`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab4GTICS`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nickname` VARCHAR(45) NOT NULL,
  `puntuacion` DOUBLE NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
