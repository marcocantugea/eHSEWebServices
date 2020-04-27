INSERT INTO `ehsewebservices`.`tbl_modules` (`label`, `pathlink`, `title`, `active`, `frontui`) VALUES ('lbl_menu_supervisors', '#', 'Supervisores', '1', '1');
INSERT INTO `ehsewebservices`.`tbl_menus` (`label`, `pathlink`, `title`, `active`, `frontui`) VALUES ('lbl_menu_documentsforsignature', 'index.aspx?p=supervisor/p_docforsig', 'Documentos Para Firma', '1', '1');
insert into rel_profiles_modules_menus values(2,6,3);
