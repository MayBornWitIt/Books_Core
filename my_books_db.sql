-- MySQL Script generated by MySQL Workbench
-- Sun Jul  2 18:48:29 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema books
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema books
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `books` DEFAULT CHARACTER SET utf8 ;
USE `books` ;

-- -----------------------------------------------------
-- Table `books`.`author`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `books`.`author` (
  `author_id` INT NOT NULL,
  `author_name` VARCHAR(45) NULL,
  PRIMARY KEY (`author_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `books`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `books`.`books` (
  `book_id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  `author_id` INT NULL,
  `author_author_id` INT NOT NULL,
  PRIMARY KEY (`book_id`),
  INDEX `fk_books_author1_idx` (`author_author_id` ASC) VISIBLE,
  CONSTRAINT `fk_books_author1`
    FOREIGN KEY (`author_author_id`)
    REFERENCES `books`.`author` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `books`.`favorites`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `books`.`favorites` (
  `fav_id` FLOAT NOT NULL,
  `user_id` INT NOT NULL,
  `book_id` INT NOT NULL,
  PRIMARY KEY (`fav_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `books`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `books`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `created_at` DATETIME NULL DEFAULT NOW(),
  `updated_at` DATETIME NULL DEFAULT NOW() ON UPDATE NOW(),
  `books_book_id` INT NOT NULL,
  `books_author_author_id` INT NOT NULL,
  `favorites_fav_id` FLOAT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_books1_idx` (`books_book_id` ASC, `books_author_author_id` ASC) VISIBLE,
  INDEX `fk_users_favorites1_idx` (`favorites_fav_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_books1`
    FOREIGN KEY (`books_book_id`)
    REFERENCES `books`.`books` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_favorites1`
    FOREIGN KEY (`favorites_fav_id`)
    REFERENCES `books`.`favorites` (`fav_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;