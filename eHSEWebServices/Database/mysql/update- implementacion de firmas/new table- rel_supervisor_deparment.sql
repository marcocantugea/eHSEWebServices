CREATE TABLE `ehsewebservices`.`rel_supervisor_deparment` (
  `idRelSupervisorDep` INT NOT NULL AUTO_INCREMENT,
  `userid` INT NULL,
  `idDeparment` INT NULL,
  PRIMARY KEY (`idRelSupervisorDep`),
  INDEX `FK_userid_idx` (`userid` ASC),
  INDEX `FK_iddeparment_idx` (`idDeparment` ASC),
  CONSTRAINT `FK_userid`
    FOREIGN KEY (`userid`)
    REFERENCES `ehsewebservices`.`tbl_userslogin` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_iddeparment`
    FOREIGN KEY (`idDeparment`)
    REFERENCES `ehsewebservices`.`tbl_deparments` (`idDeparment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin2
COMMENT = 'tabla de relacion supervisor departamento';
