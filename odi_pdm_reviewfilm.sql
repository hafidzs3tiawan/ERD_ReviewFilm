-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_reviewfilm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_reviewfilm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_reviewfilm` DEFAULT CHARACTER SET utf8 ;
USE `db_reviewfilm` ;

-- -----------------------------------------------------
-- Table `db_reviewfilm`.`profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_reviewfilm`.`profile` (
  `idprofile` VARCHAR(15) NOT NULL,
  `age` INT NULL,
  `biodata` VARCHAR(50) NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`idprofile`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_reviewfilm`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_reviewfilm`.`user` (
  `iduser` VARCHAR(15) NOT NULL,
  `username` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `profile_idprofile` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`iduser`),
  INDEX `fk_user_profile1_idx` (`profile_idprofile` ASC) VISIBLE,
  CONSTRAINT `fk_user_profile1`
    FOREIGN KEY (`profile_idprofile`)
    REFERENCES `db_reviewfilm`.`profile` (`idprofile`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_reviewfilm`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_reviewfilm`.`review` (
  `idreview` VARCHAR(15) NOT NULL,
  `rating` VARCHAR(30) NULL,
  `critics` VARCHAR(50) NULL,
  `user_iduser` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idreview`),
  INDEX `fk_review_user1_idx` (`user_iduser` ASC) VISIBLE,
  CONSTRAINT `fk_review_user1`
    FOREIGN KEY (`user_iduser`)
    REFERENCES `db_reviewfilm`.`user` (`iduser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_reviewfilm`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_reviewfilm`.`genre` (
  `idgenre` VARCHAR(15) NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idgenre`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_reviewfilm`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_reviewfilm`.`movie` (
  `idmovie` VARCHAR(15) NOT NULL,
  `title` VARCHAR(45) NULL,
  `summary` VARCHAR(45) NULL,
  `poster` VARCHAR(100) NULL,
  `year` INT NULL,
  `review_idreview` VARCHAR(15) NOT NULL,
  `genre_idgenre` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idmovie`),
  INDEX `fk_movie_review1_idx` (`review_idreview` ASC) VISIBLE,
  INDEX `fk_movie_genre1_idx` (`genre_idgenre` ASC) VISIBLE,
  CONSTRAINT `fk_movie_review1`
    FOREIGN KEY (`review_idreview`)
    REFERENCES `db_reviewfilm`.`review` (`idreview`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movie_genre1`
    FOREIGN KEY (`genre_idgenre`)
    REFERENCES `db_reviewfilm`.`genre` (`idgenre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_reviewfilm`.`cast`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_reviewfilm`.`cast` (
  `idcast` VARCHAR(15) NOT NULL,
  `name` VARCHAR(45) NULL,
  `age` INT NULL,
  `biodata` VARCHAR(50) NULL,
  PRIMARY KEY (`idcast`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_reviewfilm`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_reviewfilm`.`role` (
  `idrole` VARCHAR(15) NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idrole`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_reviewfilm`.`mcr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_reviewfilm`.`mcr` (
  `movie_idmovie` VARCHAR(15) NOT NULL,
  `cast_idcast` VARCHAR(15) NOT NULL,
  `role_idrole` VARCHAR(15) NOT NULL,
  INDEX `fk_mcr_movie1_idx` (`movie_idmovie` ASC) VISIBLE,
  INDEX `fk_mcr_cast1_idx` (`cast_idcast` ASC) VISIBLE,
  INDEX `fk_mcr_role1_idx` (`role_idrole` ASC) VISIBLE,
  CONSTRAINT `fk_mcr_movie1`
    FOREIGN KEY (`movie_idmovie`)
    REFERENCES `db_reviewfilm`.`movie` (`idmovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mcr_cast1`
    FOREIGN KEY (`cast_idcast`)
    REFERENCES `db_reviewfilm`.`cast` (`idcast`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mcr_role1`
    FOREIGN KEY (`role_idrole`)
    REFERENCES `db_reviewfilm`.`role` (`idrole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
