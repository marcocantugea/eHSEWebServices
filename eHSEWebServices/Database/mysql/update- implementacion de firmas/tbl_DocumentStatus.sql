CREATE TABLE `ehsewebservices`. ( `idDocumentStatus` INT NOT NULL AUTO_INCREMENT , `status` VARCHAR(100) NOT NULL , `active` BOOLEAN NOT NULL , PRIMARY KEY (`idDocumentStatus`)) ENGINE = InnoDB;
ALTER TABLE `tbl_DocumentStatus` ADD `label` VARCHAR(100) NOT NULL AFTER `active`;
INSERT INTO `tbl_DocumentStatus` (`idDocumentStatus`, `status`, `active`, `label`) VALUES (NULL, 'Draft', '1', 'lbl_statusdocument_draft');
INSERT INTO `tbl_DocumentStatus` (`idDocumentStatus`, `status`, `active`, `label`) VALUES (NULL, 'For Signature', '1', 'lbl_statusdocument_forsignature');
INSERT INTO `tbl_DocumentStatus` (`idDocumentStatus`, `status`, `active`, `label`) VALUES (NULL, 'Signed', '1', 'lbl_statusdocument_signed');
