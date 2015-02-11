-- SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Nutzer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nutzer` (
  `idNutzer` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(150) NULL,
  `Vorname` VARCHAR(150) NULL,
  `Strasse` VARCHAR(100) NULL,
  `HausNr` VARCHAR(10) NULL,
  `PLZ` INT NULL,
  `Ort` VARCHAR(150) NULL,
  `Email` VARCHAR(150) NULL,
  `Passwort` VARCHAR(150) NULL,
  `IsAdmin` BIT NULL,
  PRIMARY KEY (`idNutzer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bestellungen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bestellungen` (
  `idBestellungen` INT NOT NULL AUTO_INCREMENT,
  `idNutzer` VARCHAR(150) NULL,
  `Datum` DATETIME NULL,
  `ZahlArt` VARCHAR(150) NULL,
  `R_Name` VARCHAR(150) NULL,
  `R_Vorname` VARCHAR(150) NULL,
  `R_Strasse_Nr` VARCHAR(250) NULL,
  `R_PLZ_ORT` VARCHAR(250) NULL,
  `Bezahlt` BIT NULL,
  PRIMARY KEY (`idBestellungen`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BestellungsDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`BestellungsDetails` (
  `idBestellungsDetails` INT NOT NULL AUTO_INCREMENT,
  `idBestellung` INT NULL,
  `ArtikelName` VARCHAR(250) NULL,
  `NettoPreis` DECIMAL NULL,
  `MwSt` DECIMAL NULL,
  `Anzahl` INT NULL,
  PRIMARY KEY (`idBestellungsDetails`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Steuersaetze`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Steuersaetze` (
  `idSteuersaetze` INT NOT NULL AUTO_INCREMENT,
  `Titel` VARCHAR(150) NULL,
  `Steuersatz` DECIMAL NULL,
  PRIMARY KEY (`idSteuersaetze`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Artikel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Artikel` (
  `idArtikel` INT NOT NULL AUTO_INCREMENT,
  `Titel` VARCHAR(250) NULL,
  `idHauptgruppe` INT NULL,
  `NettoPreis` DECIMAL NULL,
  `MwStSatz` DECIMAL NULL,
  `Beschreibung` VARCHAR(250) NULL,
  `idUntergruppe` INT NULL,
  PRIMARY KEY (`idArtikel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Hauptgruppe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Hauptgruppe` (
  `idHauptgruppe` INT NOT NULL AUTO_INCREMENT,
  `Titel` VARCHAR(150) NULL,
  PRIMARY KEY (`idHauptgruppe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Untergruppe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Untergruppe` (
  `idUntergruppe` INT NOT NULL AUTO_INCREMENT,
  `Titel` VARCHAR(150) NULL,
  PRIMARY KEY (`idUntergruppe`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
