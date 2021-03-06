-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema yuckoryay
-- -----------------------------------------------------
-- database for yuckoryay team - created from entity relationship diagram

-- -----------------------------------------------------
-- Schema yuckoryay
--
-- database for yuckoryay team - created from entity relationship diagram
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `yuckoryay` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `yuckoryay` ;

-- -----------------------------------------------------
-- Table `yuckoryay`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yuckoryay`.`post` (
  `idpost` INT NOT NULL,
  PRIMARY KEY (`idpost`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yuckoryay`.`like/up`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yuckoryay`.`like/up` (
  `idlike/up` INT NOT NULL AUTO_INCREMENT,
  `like/up_idlike/up` INT NOT NULL,
  PRIMARY KEY (`idlike/up`),
  INDEX `fk_like/up_like/up1_idx` (`like/up_idlike/up` ASC),
  CONSTRAINT `fk_like/up_like/up1`
    FOREIGN KEY (`like/up_idlike/up`)
    REFERENCES `yuckoryay`.`like/up` (`idlike/up`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yuckoryay`.`down_vote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yuckoryay`.`down_vote` (
  `iddown_vote` INT NOT NULL,
  PRIMARY KEY (`iddown_vote`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yuckoryay`.`share/rt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yuckoryay`.`share/rt` (
  `idshare/rt` INT NOT NULL,
  PRIMARY KEY (`idshare/rt`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yuckoryay`.`topic`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yuckoryay`.`topic` (
  `idTopics` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idTopics`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yuckoryay`.`school_office`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yuckoryay`.`school_office` (
  `idschool_office` INT NOT NULL,
  `school_officecol` VARCHAR(100) NULL,
  PRIMARY KEY (`idschool_office`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yuckoryay`.`buildings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yuckoryay`.`buildings` (
  `idDorms` INT NOT NULL AUTO_INCREMENT,
  `building_name` VARCHAR(100) NULL,
  `Buildingscol` VARCHAR(45) NULL,
  PRIMARY KEY (`idDorms`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yuckoryay`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yuckoryay`.`event` (
  `idevent` INT NOT NULL,
  PRIMARY KEY (`idevent`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yuckoryay`.`sentiment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yuckoryay`.`sentiment` (
  `idsentiment` INT NOT NULL,
  `sentimentcol` VARCHAR(45) NULL,
  PRIMARY KEY (`idsentiment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yuckoryay`.`about`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yuckoryay`.`about` (
  `idabout` INT NOT NULL,
  `topic_idTopics` INT NOT NULL,
  `school_office_idschool_office` INT NOT NULL,
  `buildings_idDorms` INT NOT NULL,
  `event_idevent` INT NOT NULL,
  `sentiment_idsentiment` INT NOT NULL,
  PRIMARY KEY (`idabout`),
  INDEX `fk_about_topic1_idx` (`topic_idTopics` ASC),
  INDEX `fk_about_school_office1_idx` (`school_office_idschool_office` ASC),
  INDEX `fk_about_buildings1_idx` (`buildings_idDorms` ASC),
  INDEX `fk_about_event1_idx` (`event_idevent` ASC),
  INDEX `fk_about_sentiment1_idx` (`sentiment_idsentiment` ASC),
  CONSTRAINT `fk_about_topic1`
    FOREIGN KEY (`topic_idTopics`)
    REFERENCES `yuckoryay`.`topic` (`idTopics`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_about_school_office1`
    FOREIGN KEY (`school_office_idschool_office`)
    REFERENCES `yuckoryay`.`school_office` (`idschool_office`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_about_buildings1`
    FOREIGN KEY (`buildings_idDorms`)
    REFERENCES `yuckoryay`.`buildings` (`idDorms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_about_event1`
    FOREIGN KEY (`event_idevent`)
    REFERENCES `yuckoryay`.`event` (`idevent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_about_sentiment1`
    FOREIGN KEY (`sentiment_idsentiment`)
    REFERENCES `yuckoryay`.`sentiment` (`idsentiment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yuckoryay`.`tweet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yuckoryay`.`tweet` (
  `idTweets` INT NOT NULL AUTO_INCREMENT,
  `post_idpost` INT NOT NULL,
  `like/up_idlike/up` INT NOT NULL,
  `share/rt_idshare/rt` INT NOT NULL,
  `about_idabout` INT NOT NULL,
  PRIMARY KEY (`idTweets`),
  INDEX `fk_tweet_post1_idx` (`post_idpost` ASC),
  INDEX `fk_tweet_like/up1_idx` (`like/up_idlike/up` ASC),
  INDEX `fk_tweet_share/rt1_idx` (`share/rt_idshare/rt` ASC),
  INDEX `fk_tweet_about1_idx` (`about_idabout` ASC),
  CONSTRAINT `fk_tweet_post1`
    FOREIGN KEY (`post_idpost`)
    REFERENCES `yuckoryay`.`post` (`idpost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tweet_like/up1`
    FOREIGN KEY (`like/up_idlike/up`)
    REFERENCES `yuckoryay`.`like/up` (`idlike/up`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tweet_share/rt1`
    FOREIGN KEY (`share/rt_idshare/rt`)
    REFERENCES `yuckoryay`.`share/rt` (`idshare/rt`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tweet_about1`
    FOREIGN KEY (`about_idabout`)
    REFERENCES `yuckoryay`.`about` (`idabout`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yuckoryay`.`profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yuckoryay`.`profile` (
  `idProfile` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `first_name` VARCHAR(45) NULL,
  `post_idpost` INT NOT NULL,
  `like/up_idlike/up` INT NOT NULL,
  `down_vote_iddown_vote` INT NOT NULL,
  `tweet_idTweets` INT NOT NULL,
  `sentiment_idsentiment` INT NOT NULL,
  PRIMARY KEY (`idProfile`),
  INDEX `fk_profile_post1_idx` (`post_idpost` ASC),
  INDEX `fk_profile_like/up1_idx` (`like/up_idlike/up` ASC),
  INDEX `fk_profile_down_vote1_idx` (`down_vote_iddown_vote` ASC),
  INDEX `fk_profile_tweet1_idx` (`tweet_idTweets` ASC),
  INDEX `fk_profile_sentiment1_idx` (`sentiment_idsentiment` ASC),
  CONSTRAINT `fk_profile_post1`
    FOREIGN KEY (`post_idpost`)
    REFERENCES `yuckoryay`.`post` (`idpost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_like/up1`
    FOREIGN KEY (`like/up_idlike/up`)
    REFERENCES `yuckoryay`.`like/up` (`idlike/up`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_down_vote1`
    FOREIGN KEY (`down_vote_iddown_vote`)
    REFERENCES `yuckoryay`.`down_vote` (`iddown_vote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_tweet1`
    FOREIGN KEY (`tweet_idTweets`)
    REFERENCES `yuckoryay`.`tweet` (`idTweets`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_profile_sentiment1`
    FOREIGN KEY (`sentiment_idsentiment`)
    REFERENCES `yuckoryay`.`sentiment` (`idsentiment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yuckoryay`.`yack`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yuckoryay`.`yack` (
  `idYacks` INT NOT NULL AUTO_INCREMENT,
  `Yackscol` TIMESTAMP NULL,
  `Yackscol1` VARCHAR(45) NULL,
  `down_vote_iddown_vote` INT NOT NULL,
  `like/up_idlike/up` INT NOT NULL,
  `post_idpost` INT NOT NULL,
  `about_idabout` INT NOT NULL,
  PRIMARY KEY (`idYacks`),
  INDEX `fk_yack_down_vote1_idx` (`down_vote_iddown_vote` ASC),
  INDEX `fk_yack_like/up1_idx` (`like/up_idlike/up` ASC),
  INDEX `fk_yack_post1_idx` (`post_idpost` ASC),
  INDEX `fk_yack_about1_idx` (`about_idabout` ASC),
  CONSTRAINT `fk_yack_down_vote1`
    FOREIGN KEY (`down_vote_iddown_vote`)
    REFERENCES `yuckoryay`.`down_vote` (`iddown_vote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_yack_like/up1`
    FOREIGN KEY (`like/up_idlike/up`)
    REFERENCES `yuckoryay`.`like/up` (`idlike/up`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_yack_post1`
    FOREIGN KEY (`post_idpost`)
    REFERENCES `yuckoryay`.`post` (`idpost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_yack_about1`
    FOREIGN KEY (`about_idabout`)
    REFERENCES `yuckoryay`.`about` (`idabout`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yuckoryay`.`fbstatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yuckoryay`.`fbstatus` (
  `idfbstatus` INT NOT NULL AUTO_INCREMENT,
  `fbstatuscol` VARCHAR(45) NULL,
  `like/up_idlike/up` INT NOT NULL,
  `share/rt_idshare/rt` INT NOT NULL,
  `post_idpost` INT NOT NULL,
  `about_idabout` INT NOT NULL,
  PRIMARY KEY (`idfbstatus`),
  INDEX `fk_fbstatus_like/up1_idx` (`like/up_idlike/up` ASC),
  INDEX `fk_fbstatus_share/rt1_idx` (`share/rt_idshare/rt` ASC),
  INDEX `fk_fbstatus_post1_idx` (`post_idpost` ASC),
  INDEX `fk_fbstatus_about1_idx` (`about_idabout` ASC),
  CONSTRAINT `fk_fbstatus_like/up1`
    FOREIGN KEY (`like/up_idlike/up`)
    REFERENCES `yuckoryay`.`like/up` (`idlike/up`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fbstatus_share/rt1`
    FOREIGN KEY (`share/rt_idshare/rt`)
    REFERENCES `yuckoryay`.`share/rt` (`idshare/rt`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fbstatus_post1`
    FOREIGN KEY (`post_idpost`)
    REFERENCES `yuckoryay`.`post` (`idpost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fbstatus_about1`
    FOREIGN KEY (`about_idabout`)
    REFERENCES `yuckoryay`.`about` (`idabout`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `yuckoryay`.`organization`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `yuckoryay`.`organization` (
  `idorg` INT NOT NULL AUTO_INCREMENT,
  `org_name` VARCHAR(200) NULL,
  `about_idabout` INT NOT NULL,
  PRIMARY KEY (`idorg`),
  INDEX `fk_organization_about1_idx` (`about_idabout` ASC),
  CONSTRAINT `fk_organization_about1`
    FOREIGN KEY (`about_idabout`)
    REFERENCES `yuckoryay`.`about` (`idabout`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
