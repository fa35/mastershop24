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

INSERT INTO `Nutzer` (`idNutzer`, `Name`, `Vorname`, `Strasse`, `HausNr`, `PLZ`, `Ort`, `Email`, `Passwort`, `isAdmin`) VALUES
(1,'Foo', 'Bar', 'XStrasse', '3a', 01234, 'Berlin', 'foo@bar.de', 'foobar', 0);


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
  `ArtikelTitel` VARCHAR(250) NULL,
  `fidUntergruppe` INT NOT NULL,
  `NettoPreis` DECIMAL NULL,
  `MwStSatz` DECIMAL NULL,
  `Beschreibung` VARCHAR(250) NULL,
  `BildLink` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`idArtikel`),
  FOREIGN KEY (`fidUntergruppe`) REFERENCES Untergruppe (`idUntergruppe`))
ENGINE = InnoDB;

INSERT INTO `Artikel` (`idArtikel`, `ArtikelTitel`, `fidUntergruppe`, `NettoPreis`, `MwStSatz`, `Beschreibung`, `BildLink`) VALUES
(1, 'The Dispossed', 2, 7.99 , 7, 'Beschreibung', NULL),
(2, 'Vögel', 1, 2, 7, 'Buch zur Vogelbestimmung', NULL),
(3, 'Toaster', 3, '9', '17', 'Der super-mega Toaster sieht nicht nur super mega aus, nein! er kann auch toasten. Der super-mega Toaster sieht nicht nur super mega aus, nein! er kann auch toasten. Der super-mega Toaster sieht nicht nur super mega aus, nein! er kann auch toasten', 'http://media.elektronik-star.de/images/L/10005177_title_toaster_klarstein_schwarz.jpg'),
(4, 'Toaster - Schwarz - Mega', 3, '9', '17', 'Der super-mega Toaster sieht nicht nur super-mega aus, er ist auch super-mega nützlich. Er kann tatsächlich super-mega cool toasten!!!! ... Der super-mega Toaster sieht nicht nur super-mega aus, er ist auch super-mega nützlich.', 'http://ecx.images-amazon.com/images/I/31B6JA0V84L.jpg'),
(5, 'Kaffeemaschine - Supercross', 3, '20', '29', 'Die crazy crossy mega Kaffeemaschine röstet Ihren Kaffee mit super magic für ein volles Aroma...', 'http://src.discounto.de/pics/product/22495/38420_Rossmann-Ideenwelt-Thermo-Kaffeemaschine-22495_xxl.jpeg'),
(6, 'Die Pfanne', 4, '50', '29', 'Die Pfanne, aus dem Hause Haushaltszubehör, gehört zu den universellsten Küchenhelfern schlecht hin. In jedem Haushalt ist sie zu sehen, selbst die Grossmutter kennt sie noch.', 'zzz:\\\\blalbajb\\alskdfj\\weihr\\lkhe4w5.png');



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
