SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP DATABASE mydb;

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
  `fidUntergruppe` INT NULL,
  `NettoPreis` DECIMAL NULL,
  `MwStSatz` DECIMAL NULL,
  `Beschreibung` VARCHAR(250) NULL,
  `BildLink` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idArtikel`),
  FOREIGN KEY (`fidUntergruppe`) REFERENCES Untergruppe (`idUntergruppe`))
ENGINE = InnoDB;

INSERT INTO `Artikel` (`idArtikel`, `Titel`, `fidUntergruppe`, `NettoPreis`, `MwStSatz`, `Beschreibung`, `BildLink`) VALUES
(1, 'Foo', NULL, 2.00 , NULL, 'Beschreibung', NULL),
(2, 'Vögel', 0, 2, 7, 'Buch zur Vogelbestimmung', NULL),
(3, 'Toaster', 1, '9', '17', 'Der super-mega Toaster sieht nicht nur super mega aus, nein! er kann auch toasten. Der super-mega Toaster sieht nicht nur super mega aus, nein! er kann auch toasten. Der super-mega Toaster sieht nicht nur super mega aus, nein! er kann auch toasten', 'zzz:\\data\\lol\\BitfunKopie\\Bsdfpx\\Vsdfws\\Sasdfhared.png'),
(4, 'Toaster - Schwarz - Mega', 1, '9', '17', 'Der super-mega Toaster sieht nicht nur super-mega aus, er ist auch super-mega nützlich. Er kann tatsächlich super-mega cool toasten!!!! ... Der super-mega Toaster sieht nicht nur super-mega aus, er ist auch super-mega nützlich.', 'zzz:\\\\blalbajb\\alskdfj\\weihr\\awer.png'),
(5, 'Kaffeemaschine - Supercross', 1, '20', '29', 'Die crazy crossy mega Kaffeemaschine röstet Ihren Kaffee mit super magic für ein volles Aroma...', 'zzz:\\\\blalbajb\\alskdfj\\weihr\\24ajskdhfr.png'),
(6, 'Die Pfanne', 1, '50', '29', 'Die Pfanne, aus dem Hause Haushaltszubehör, gehört zu den universellsten Küchenhelfern schlecht hin. In jedem Haushalt ist sie zu sehen, selbst die Grossmutter kennt sie noch.', 'zzz:\\\\blalbajb\\alskdfj\\weihr\\lkhe4w5.png');



-- -----------------------------------------------------
-- Table `mydb`.`Hauptgruppe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Hauptgruppe` (
  `idHauptgruppe` INT NOT NULL AUTO_INCREMENT,
  `Titel` VARCHAR(150) NULL,
  PRIMARY KEY (`idHauptgruppe`))
ENGINE = InnoDB;

INSERT INTO `Hauptgruppe` (`idHauptgruppe`, `Titel`) VALUES
(1, 'Literatur'),
(2, 'Haushaltsgeräte');


-- -----------------------------------------------------
-- Table `mydb`.`Untergruppe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Untergruppe` (
  `idUntergruppe` INT NOT NULL AUTO_INCREMENT,
  `Titel` VARCHAR(150) NULL,
  `fidHauptgruppe` INT NOT NULL,
  PRIMARY KEY (`idUntergruppe`),
  FOREIGN KEY (`fidHauptgruppe`) REFERENCES Hauptgruppe (`idHauptgruppe`))
ENGINE = InnoDB;

INSERT INTO `Untergruppe` (`idUntergruppe`, `Titel`, `fidHauptgruppe`) VALUES
(1, 'Sachbücher', 1),
(2, 'Romane', 1),
(3, 'Elektrogeräte', 2),
(4, 'Kochgeschirr', 2);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
