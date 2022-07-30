-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema aulavirtual
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aulavirtual
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aulavirtual` DEFAULT CHARACTER SET utf8mb4 ;
USE `aulavirtual` ;

-- -----------------------------------------------------
-- Table `aulavirtual`.`bimestre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulavirtual`.`bimestre` (
  `IdBimestre` INT(11) NOT NULL,
  `nombreBimestre` VARCHAR(15) NOT NULL,
  `activo` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`IdBimestre`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `aulavirtual`.`grado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulavirtual`.`grado` (
  `IdGrado` INT(11) NOT NULL,
  `numGrado` VARCHAR(8) NOT NULL,
  `activo` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`IdGrado`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `aulavirtual`.`estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulavirtual`.`estudiante` (
  `estudiante_id` INT(11) NOT NULL AUTO_INCREMENT,
  `dni` CHAR(8) NOT NULL,
  `nombre` VARCHAR(25) NOT NULL,
  `apellidoMaterno` VARCHAR(15) NOT NULL,
  `apellidoPaterno` VARCHAR(15) NOT NULL,
  `correo` VARCHAR(40) NOT NULL,
  `Grado_IdGrado` INT(11) NOT NULL,
  `activo` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`estudiante_id`),
  INDEX `fk_Estudiante_Grado1_idx` (`Grado_IdGrado` ASC),
  CONSTRAINT `fk_Estudiante_Grado1`
    FOREIGN KEY (`Grado_IdGrado`)
    REFERENCES `aulavirtual`.`grado` (`IdGrado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 882
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `aulavirtual`.`bimestre_has_estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulavirtual`.`bimestre_has_estudiante` (
  `Bimestre_IdBimestre` INT(11) NOT NULL,
  `Estudiante_estudiante_id` INT(11) NOT NULL,
  PRIMARY KEY (`Bimestre_IdBimestre`, `Estudiante_estudiante_id`),
  INDEX `fk_Bimestre_has_Estudiante_Estudiante1_idx` (`Estudiante_estudiante_id` ASC),
  INDEX `fk_Bimestre_has_Estudiante_Bimestre_idx` (`Bimestre_IdBimestre` ASC),
  CONSTRAINT `fk_Bimestre_has_Estudiante_Bimestre`
    FOREIGN KEY (`Bimestre_IdBimestre`)
    REFERENCES `aulavirtual`.`bimestre` (`IdBimestre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Bimestre_has_Estudiante_Estudiante1`
    FOREIGN KEY (`Estudiante_estudiante_id`)
    REFERENCES `aulavirtual`.`estudiante` (`estudiante_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `aulavirtual`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulavirtual`.`curso` (
  `IdCurso` INT(11) NOT NULL AUTO_INCREMENT,
  `nombreCurso` VARCHAR(100) NOT NULL,
  `activo` VARCHAR(45) NOT NULL DEFAULT '1',
  PRIMARY KEY (`IdCurso`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `aulavirtual`.`curso_has_grado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulavirtual`.`curso_has_grado` (
  `idCursoGrado` INT(11) NOT NULL AUTO_INCREMENT,
  `Curso_IdCurso` INT(11) NOT NULL,
  `Grado_IdGrado` INT(11) NOT NULL,
  `activo` BIT(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`idCursoGrado`),
  INDEX `fk_Curso_has_Grado_Grado1_idx` (`Grado_IdGrado` ASC),
  INDEX `fk_Curso_has_Grado_Curso1_idx` (`Curso_IdCurso` ASC),
  CONSTRAINT `fk_Curso_has_Grado_Curso1_idx`
    FOREIGN KEY (`Curso_IdCurso`)
    REFERENCES `aulavirtual`.`curso` (`IdCurso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Curso_has_Grado_Grado1`
    FOREIGN KEY (`Grado_IdGrado`)
    REFERENCES `aulavirtual`.`grado` (`IdGrado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 38
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `aulavirtual`.`docente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulavirtual`.`docente` (
  `IdDocente` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(16) NOT NULL,
  `apellidos` VARCHAR(75) NOT NULL,
  `Sexo` CHAR(1) NOT NULL,
  `DNI` VARCHAR(8) NOT NULL,
  `password` VARCHAR(8) NOT NULL,
  `Grado_IdGrado` INT(11) NOT NULL,
  PRIMARY KEY (`IdDocente`),
  INDEX `fk_Docente_Grado1_idx` (`Grado_IdGrado` ASC),
  CONSTRAINT `fk_Docente_Grado1`
    FOREIGN KEY (`Grado_IdGrado`)
    REFERENCES `aulavirtual`.`grado` (`IdGrado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `aulavirtual`.`nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aulavirtual`.`nota` (
  `IdNota` INT(11) NOT NULL AUTO_INCREMENT,
  `numNota` INT(11) NOT NULL,
  `IdBimestre` INT(11) NOT NULL,
  `estudiante_id` INT(11) NOT NULL,
  `IdCurso` INT(11) NOT NULL,
  `IdGrado` INT(11) NOT NULL,
  `activo` BIT(1) NOT NULL DEFAULT b'1',
  `posNota` INT(11) NOT NULL,
  PRIMARY KEY (`IdNota`),
  INDEX `fk_Nota_Bimestre_has_Estudiante1_idx` (`IdBimestre` ASC),
  INDEX `fk_Nota_Estudiante1_idx` (`estudiante_id` ASC),
  INDEX `fk_Nota_Grado1_idx` (`IdGrado` ASC),
  CONSTRAINT `fk_Nota_Bimestre1_idx`
    FOREIGN KEY (`IdBimestre`)
    REFERENCES `aulavirtual`.`bimestre` (`IdBimestre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Nota_Estudiante1_idx`
    FOREIGN KEY (`estudiante_id`)
    REFERENCES `aulavirtual`.`estudiante` (`estudiante_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Nota_Grado1_idx`
    FOREIGN KEY (`IdGrado`)
    REFERENCES `aulavirtual`.`grado` (`IdGrado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `` (`IdDocente`,`nombre`,`apellidos`,`Sexo`,`DNI`,`password`,`Grado_IdGrado`) VALUES (1,'Alexandra','Bobadilla','F','12345678','@12345',1);

INSERT INTO `` (`IdBimestre`,`nombreBimestre`,`activo`) VALUES (1,'I Bimestre','1');
INSERT INTO `` (`IdBimestre`,`nombreBimestre`,`activo`) VALUES (2,'II Bimestre','1');
INSERT INTO `` (`IdBimestre`,`nombreBimestre`,`activo`) VALUES (3,'III Bimestre','1');
INSERT INTO `` (`IdBimestre`,`nombreBimestre`,`activo`) VALUES (4,'IV Bimestre','1');

INSERT INTO `` (`IdCurso`,`nombreCurso`,`activo`) VALUES (1,'Matemática','1');
INSERT INTO `` (`IdCurso`,`nombreCurso`,`activo`) VALUES (2,'Comunicación','1');
INSERT INTO `` (`IdCurso`,`nombreCurso`,`activo`) VALUES (3,'Ciencia y Ambiente','1');
INSERT INTO `` (`IdCurso`,`nombreCurso`,`activo`) VALUES (4,'Personal Social','1');
INSERT INTO `` (`IdCurso`,`nombreCurso`,`activo`) VALUES (5,'Computación','1');
INSERT INTO `` (`IdCurso`,`nombreCurso`,`activo`) VALUES (6,'Inglés','1');

INSERT INTO `` (`IdGrado`,`numGrado`,`activo`) VALUES (1,'1° Grado','1');
INSERT INTO `` (`IdGrado`,`numGrado`,`activo`) VALUES (2,'2° Grado','1');
INSERT INTO `` (`IdGrado`,`numGrado`,`activo`) VALUES (3,'3° Grado','1');
INSERT INTO `` (`IdGrado`,`numGrado`,`activo`) VALUES (4,'4° Grado','1');
INSERT INTO `` (`IdGrado`,`numGrado`,`activo`) VALUES (5,'5° Grado','1');
INSERT INTO `` (`IdGrado`,`numGrado`,`activo`) VALUES (6,'6° Grado','1');

INSERT INTO `` (`estudiante_id`,`dni`,`nombre`,`apellidoMaterno`,`apellidoPaterno`,`correo`,`Grado_IdGrado`,`activo`) VALUES (1,'78289469','Claudiaaa','Farfan','Bobadilla','claudia@hotmail.com',1,'1');
INSERT INTO `` (`estudiante_id`,`dni`,`nombre`,`apellidoMaterno`,`apellidoPaterno`,`correo`,`Grado_IdGrado`,`activo`) VALUES (3,'13123','Maria f','Maria','Maria','maria@hotmail.com',1,'1');
INSERT INTO `` (`estudiante_id`,`dni`,`nombre`,`apellidoMaterno`,`apellidoPaterno`,`correo`,`Grado_IdGrado`,`activo`) VALUES (5,'1231313','Piero','p','p','piero@hotmail.com',1,'0');
INSERT INTO `` (`estudiante_id`,`dni`,`nombre`,`apellidoMaterno`,`apellidoPaterno`,`correo`,`Grado_IdGrado`,`activo`) VALUES (19,'123123','Corina','C','C','corina@hotmail.com',1,'0');
INSERT INTO `` (`estudiante_id`,`dni`,`nombre`,`apellidoMaterno`,`apellidoPaterno`,`correo`,`Grado_IdGrado`,`activo`) VALUES (879,'12222','pruebaa','pruebaa','pruebaa','prueba@gmail.com',1,'0');
INSERT INTO `` (`estudiante_id`,`dni`,`nombre`,`apellidoMaterno`,`apellidoPaterno`,`correo`,`Grado_IdGrado`,`activo`) VALUES (880,'64567637','pruebitaa','prprpr','prprp','prprp@gmail.com',1,'1');
INSERT INTO `` (`estudiante_id`,`dni`,`nombre`,`apellidoMaterno`,`apellidoPaterno`,`correo`,`Grado_IdGrado`,`activo`) VALUES (881,'13123','Maria f','Maria','Maria','maria@hotmail.com',1,'1');

INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (1,1,1,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (3,2,1,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (4,3,1,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (5,4,1,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (6,5,1,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (7,6,1,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (8,1,2,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (9,2,2,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (10,3,2,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (11,4,2,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (12,5,2,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (13,6,2,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (14,1,3,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (15,2,3,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (16,3,3,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (17,4,3,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (18,5,3,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (19,6,3,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (20,1,4,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (21,2,4,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (22,3,4,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (23,4,4,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (24,5,4,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (25,6,4,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (26,1,5,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (27,2,5,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (28,3,5,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (29,4,5,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (30,5,5,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (31,6,5,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (32,1,6,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (33,2,6,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (34,3,6,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (35,4,6,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (36,5,6,'1');
INSERT INTO `` (`idCursoGrado`,`Curso_IdCurso`,`Grado_IdGrado`,`activo`) VALUES (37,6,6,'1');
