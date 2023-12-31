-- MySQL Script generated by MySQL Workbench
-- Thu Oct 19 12:17:17 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`czytelnik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`czytelnik` (
  `id_czytelnika` INT NOT NULL,
  `imie` VARCHAR(45) NOT NULL,
  `ulica` VARCHAR(45) NOT NULL,
  `miejscowosc` VARCHAR(45) NOT NULL,
  `kod pocztowy` VARCHAR(45) NOT NULL,
  `nazwisko` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_czytelnika`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ksiazka`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ksiazka` (
  `ISBN` INT NOT NULL,
  `tytuł` VARCHAR(45) NULL,
  `wydawnictwo` VARCHAR(45) NULL,
  PRIMARY KEY (`ISBN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`autor` (
  `nazwisko` VARCHAR(45) NOT NULL,
  `imie` VARCHAR(45) NOT NULL,
  `stan` ENUM('wypozyczona', 'niewypozyczona') NULL,
  `biblioteka_nazwa` INT NOT NULL,
  PRIMARY KEY (`nazwisko`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`czytelnik_has_ksiazka`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`czytelnik_has_ksiazka` (
  `czytelnik_nazwisko` INT NOT NULL,
  `ksiazka_ISBN` INT NOT NULL,
  `termin` VARCHAR(45) NOT NULL,
  `data_wypozyczenia` VARCHAR(45) NULL,
  `data_zwrotu` VARCHAR(45) NULL,
  PRIMARY KEY (`czytelnik_nazwisko`, `ksiazka_ISBN`),
  INDEX `fk_czytelnik_has_ksiazka_ksiazka1_idx` (`ksiazka_ISBN` ASC) VISIBLE,
  INDEX `fk_czytelnik_has_ksiazka_czytelnik1_idx` (`czytelnik_nazwisko` ASC) VISIBLE,
  CONSTRAINT `fk_czytelnik_has_ksiazka_czytelnik1`
    FOREIGN KEY (`czytelnik_nazwisko`)
    REFERENCES `mydb`.`czytelnik` (`id_czytelnika`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_czytelnik_has_ksiazka_ksiazka1`
    FOREIGN KEY (`ksiazka_ISBN`)
    REFERENCES `mydb`.`ksiazka` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`autor_has_ksiazka`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`autor_has_ksiazka` (
  `autor_nazwisko` VARCHAR(45) NOT NULL,
  `ksiazka_ISBN` INT NOT NULL,
  PRIMARY KEY (`autor_nazwisko`, `ksiazka_ISBN`),
  INDEX `fk_autor_has_ksiazka_ksiazka1_idx` (`ksiazka_ISBN` ASC) VISIBLE,
  INDEX `fk_autor_has_ksiazka_autor1_idx` (`autor_nazwisko` ASC) VISIBLE,
  CONSTRAINT `fk_autor_has_ksiazka_autor1`
    FOREIGN KEY (`autor_nazwisko`)
    REFERENCES `mydb`.`autor` (`nazwisko`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_autor_has_ksiazka_ksiazka1`
    FOREIGN KEY (`ksiazka_ISBN`)
    REFERENCES `mydb`.`ksiazka` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`autor_has_ksiazka1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`autor_has_ksiazka1` (
  `autor_nazwisko` VARCHAR(45) NOT NULL,
  `ksiazka_ISBN` INT NOT NULL,
  PRIMARY KEY (`autor_nazwisko`, `ksiazka_ISBN`),
  INDEX `fk_autor_has_ksiazka1_ksiazka1_idx` (`ksiazka_ISBN` ASC) VISIBLE,
  INDEX `fk_autor_has_ksiazka1_autor1_idx` (`autor_nazwisko` ASC) VISIBLE,
  CONSTRAINT `fk_autor_has_ksiazka1_autor1`
    FOREIGN KEY (`autor_nazwisko`)
    REFERENCES `mydb`.`autor` (`nazwisko`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_autor_has_ksiazka1_ksiazka1`
    FOREIGN KEY (`ksiazka_ISBN`)
    REFERENCES `mydb`.`ksiazka` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
