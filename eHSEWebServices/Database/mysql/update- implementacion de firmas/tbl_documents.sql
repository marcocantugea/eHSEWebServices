ALTER TABLE `tbl_documents` ADD `idDocumentStatus` INT(1) NOT NULL AFTER `userid`, ADD `locked` BOOLEAN NOT NULL AFTER `idDocumentStatus`;
ALTER TABLE `tbl_documents` CHANGE `idDocumentStatus` `idDocumentStatus` INT NOT NULL DEFAULT '1';
update `tbl_documents` set idDocumentStatus=1 WHERE idDocument>0;