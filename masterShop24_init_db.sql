-- SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mastershop24` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mastershop24` ;

-- -----------------------------------------------------
-- Table `mastershop24`.`Nutzer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mastershop24`.`Nutzer` (
  `IdNutzer` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(150) NOT NULL,
  `Vorname` VARCHAR(150) NOT NULL,
  `Strasse` VARCHAR(100) NOT NULL,
  `HausNr` VARCHAR(10) NOT NULL,
  `PLZ` INT NOT NULL,
  `Ort` VARCHAR(150) NOT NULL,
  `Email` VARCHAR(150) NOT NULL,
  `Passwort` VARCHAR(150) NOT NULL,
  `IsAdmin` BIT NOT NULL,
  PRIMARY KEY (`IdNutzer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mastershop24`.`Bestellung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mastershop24`.`Bestellung` (
  `IdBestellung` INT NOT NULL AUTO_INCREMENT,
  `IdNutzer` VARCHAR(150) NOT NULL,
  `Datum` DATETIME NOT NULL,
  `ZahlArt` VARCHAR(150) NULL,
  `R_Name` VARCHAR(150) NULL,
  `R_Vorname` VARCHAR(150) NULL,
  `R_Strasse_Nr` VARCHAR(250) NULL,
  `R_PLZ_ORT` VARCHAR(250) NULL,
  `Bezahlt` BIT NOT NULL,
  PRIMARY KEY (`IdBestellung`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mastershop24`.`BestellungsDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mastershop24`.`BestellungsDetails` (
  `IdBestellungsDetails` INT NOT NULL AUTO_INCREMENT,
  `IdBestellung` INT NOT NULL,
  `ArtikelName` VARCHAR(250) NOT NULL,
  `NettoPreis` DECIMAL NOT NULL,
  `MwSt` DECIMAL NOT NULL,
  `Anzahl` INT NOT NULL,
  PRIMARY KEY (`IdBestellungsDetails`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mastershop24`.`Steuersatz`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mastershop24`.`Steuersatz` (
  `IdSteuersatz` INT NOT NULL AUTO_INCREMENT,
  `Titel` VARCHAR(150) NOT NULL,
  `Steuersatz` DECIMAL NOT NULL,
  PRIMARY KEY (`IdSteuersatz`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mastershop24`.`Artikel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mastershop24`.`Artikel` (
  `IdArtikel` INT NOT NULL AUTO_INCREMENT,
  `Titel` VARCHAR(250) NOT NULL,
  `IdHauptgruppe` INT NOT NULL,
  `IdUntergruppe` INT NULL,
  `NettoPreis` DECIMAL NOT NULL,
  `MwStSatz` DECIMAL NOT NULL,
  `Beschreibung` VARCHAR(250) NULL,
  `BildLink` VARCHAR(250) NULL,
  PRIMARY KEY (`IdArtikel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mastershop24`.`Hauptgruppe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mastershop24`.`Hauptgruppe` (
  `IdHauptgruppe` INT NOT NULL AUTO_INCREMENT,
  `Titel` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`IdHauptgruppe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mastershop24`.`Untergruppe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mastershop24`.`Untergruppe` (
  `IdUntergruppe` INT NOT NULL AUTO_INCREMENT,
  `Titel` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`IdUntergruppe`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
