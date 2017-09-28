create database calendarioacademicodb;
use calendarioacademicodb;

CREATE TABLE `calendarioacademicodb`.`evento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `horas` INT NOT NULL,
  `semanaacademica` BOOLEAN NOT NULL,
  `autor` VARCHAR(100) NOT NULL,
  `lat` DOUBLE,
  `lon` DOUBLE,
  `data` DATETIME NOT NULL,
  `documento` LONGBLOB,
  PRIMARY KEY (`id`));
  
CREATE TABLE `calendarioacademicodb`.`eventofilho` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idevento` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `tipo` VARCHAR(100) NOT NULL,
  `data` DATETIME NOT NULL,
  FOREIGN KEY (`idevento`) REFERENCES `calendarioacademicodb`.`evento` (`id`),
  PRIMARY KEY (`id`));

CREATE TABLE `calendarioacademicodb`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `nivelacesso` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  UNIQUE KEY `email_UNIQUE` (`email`));
  
  CREATE TABLE `calendarioacademicodb`.`participacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idusuario` INT NOT NULL,
  `idevento` INT NOT NULL,
  `feedback` VARCHAR(500),
  FOREIGN KEY (`idusuario`) REFERENCES `calendarioacademicodb`.`usuario` (`id`),
  FOREIGN KEY (`idevento`) REFERENCES `calendarioacademicodb`.`evento` (`id`),
  PRIMARY KEY (`id`));
  
  CREATE TABLE `calendarioacademicodb`.`profatendimento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idprofessor` INT NOT NULL,
  `datainicio` DATETIME NOT NULL,
  `datafim` DATETIME NOT NULL,
  FOREIGN KEY (`idprofessor`) REFERENCES `calendarioacademicodb`.`usuario` (`id`),
  PRIMARY KEY (`id`));
  
  CREATE TABLE `calendarioacademicodb`.`reuniaoprofessor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idusuario` INT NOT NULL,
  `idprofatendimento` INT NOT NULL,
  `feedback` VARCHAR(500),
  FOREIGN KEY (`idusuario`) REFERENCES `calendarioacademicodb`.`usuario` (`id`),
  FOREIGN KEY (`idprofatendimento`) REFERENCES `calendarioacademicodb`.`profatendimento` (`id`),
  PRIMARY KEY (`id`));

CREATE TABLE `calendarioacademicodb`.`logadmin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(50) NOT NULL,
  `modificacao` VARCHAR(250) NOT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`id`));
  
  CREATE TABLE `calendarioacademicodb`.`loginscricao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(50) NOT NULL,
  `modificacao` VARCHAR(250) NOT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`id`));
