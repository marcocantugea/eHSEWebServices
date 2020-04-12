-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 11-04-2020 a las 19:06:55
-- Versión del servidor: 5.6.34-log
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ehsewebservices`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rel_profiles_modules_menus`
--

CREATE TABLE `rel_profiles_modules_menus` (
  `idprofile` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categoy`
--

CREATE TABLE `tbl_categoy` (
  `idcategory` int(11) NOT NULL,
  `Category_ES` varchar(255) NOT NULL,
  `Category_EN` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Volcado de datos para la tabla `tbl_categoy`
--

INSERT INTO `tbl_categoy` (`idcategory`, `Category_ES`, `Category_EN`, `active`) VALUES
(1, 'Superintendente de Plataforma', 'Rig Superintendent', 1),
(2, 'Especialista Tecnico de Perforacion', 'Senior Toolpusher', 1),
(3, 'Inspector Tecnico de Perforacion', 'Tool Pusher', 1),
(4, 'Perforador', 'Driller', 1),
(5, 'Asistente de Perforador', 'Assistant Driller', 1),
(6, 'Bombero de Perforacion', 'Pump Man', 1),
(7, 'Chango', 'Derrick Man', 1),
(8, 'Ayudante de Piso de Perforacion', 'Roughneck', 1),
(9, 'Ayudante de Trabajos de Perforacion', 'Roustabout', 1),
(10, 'Supervisor ROV', 'ROV Supervisor', 1),
(11, 'Operador ROV', 'ROV Operator', 1),
(12, 'Especialista Subsea', 'Senior Subsea Engineer', 1),
(13, 'Ingeniero Subsea', 'Subsea Engineer', 1),
(14, 'Asistente Subsea', 'Subsea Assistant', 1),
(15, 'Jefe de Mantenimiento', 'Chief Engineer', 1),
(16, 'Primer Ingeniero', 'First Engineer', 1),
(17, 'Segundo Ingeniero', 'Second Engineer', 1),
(18, 'Tercer Ingeniero', 'Third Engineer', 1),
(19, 'Motorista', 'Motorman', 1),
(20, 'Tornero', 'Lathe Operator', 1),
(21, 'Soldador', 'Welder', 1),
(22, 'Planeador de Mantenimiento', 'Maintenance Planner', 1),
(23, 'Supervisor Electrico', 'Electrical Supervisor', 1),
(24, 'Tecnico Electronico e Instrumentista', 'Electronic Instrument Technician', 1),
(25, 'Asistente de Tec Electrnico e Instrument', 'Electronic Instrument Assistant', 1),
(26, 'Electricista                            ', 'Electrician', 1),
(27, 'Asistente de Electricista', 'Electrician Assistant', 1),
(28, 'Tecnico en Informatica', 'Information Technology Technician', 1),
(29, 'Tecnico Hidraulico', 'Hydraulic Technician', 1),
(30, 'Asistente de Tecnico Hidraulico', 'Hydraulic Assistant', 1),
(31, 'Mecanico', 'Rig Mechanic', 1),
(32, 'Asistente de Mecanico', 'Rig Mechanic Assistant', 1),
(33, 'Almacenista', 'Storekeeper', 1),
(34, 'Asistente de Almacenista', 'Storekeeper Assistant', 1),
(35, 'Capitan', 'Captain', 1),
(36, 'Jefe de Cubierta', 'Chief Mate', 1),
(37, 'Oficial de Dia', 'Day Mate', 1),
(38, 'Especialista de Posicionamiento Dinamico', 'Senior DPO', 1),
(39, 'Operador de Posicionamiento Dinamico', 'DPO', 1),
(40, 'Oficial de Proteccion del Buque', 'Ship Security Officer', 1),
(41, 'Mayordomo', 'Campboss', 1),
(42, 'Medico', 'Medic', 1),
(43, 'Supervisor de Proteccion Ambiental', 'Environmental Officer', 1),
(44, 'Operador de Grua', 'Crane Operator', 1),
(45, 'Asistente de Operador de Grua', 'Crane Operator Assistant', 1),
(46, 'Oficial de Operaciones Aereas', 'Helicopter Landing Officer', 1),
(47, 'Tecnico Despachador de Combustible', 'Helicopter Fuel Dispatcher', 1),
(48, 'Bombero Contraincendio', 'Firefighter', 1),
(49, 'Radio Operador', 'Radio Operator', 1),
(50, 'Supervisor de Pintura', 'Painter Supervisor', 1),
(51, 'Pintor', 'Painter', 1),
(52, 'Andamiero', 'Scaffolder', 1),
(53, 'Contramaestre', 'Bosun', 1),
(54, 'Marinero', 'Sea Man', 1),
(55, 'Supervisor en Seguridad y Salud Ocupnal ', 'Rig Safety and Training Coordinator', 1),
(56, 'Otro', 'Other', 1),
(57, 'Compa&ntilde;ia Externa', 'Third Party', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_company`
--

CREATE TABLE `tbl_company` (
  `idCompany` int(11) NOT NULL,
  `CompanyName` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Volcado de datos para la tabla `tbl_company`
--

INSERT INTO `tbl_company` (`idCompany`, `CompanyName`, `active`) VALUES
(1, 'Grupo R Exploracion Marina', 1),
(2, 'Schlumberger', 1),
(3, 'Halliburton', 1),
(4, 'Shell', 1),
(5, 'Otra / Other', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_deparments`
--

CREATE TABLE `tbl_deparments` (
  `idDeparment` int(11) NOT NULL,
  `DeparmentName` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `cDep_Id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Volcado de datos para la tabla `tbl_deparments`
--

INSERT INTO `tbl_deparments` (`idDeparment`, `DeparmentName`, `active`, `cDep_Id`) VALUES
(1, 'Marine', 1, 2),
(2, 'Maintenance', 1, 3),
(3, 'Electrical', 1, 6),
(4, 'Drilling', 1, 7),
(5, 'Subsea', 1, 8),
(6, 'Third Party', 1, 11),
(7, 'Hydraulic/Mechanic', 1, 12),
(8, 'HSE', 1, -1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_infouser`
--

CREATE TABLE `tbl_infouser` (
  `idInfoUser` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `apellido_pat` varchar(255) NOT NULL,
  `apellido_mat` varchar(255) NOT NULL,
  `fecha_nac` date NOT NULL,
  `RFC` varchar(255) NOT NULL,
  `telefono_movil` varchar(150) NOT NULL,
  `phone_emergency` varchar(255) NOT NULL,
  `name_emerg_contanct` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Volcado de datos para la tabla `tbl_infouser`
--

INSERT INTO `tbl_infouser` (`idInfoUser`, `Nombre`, `apellido_pat`, `apellido_mat`, `fecha_nac`, `RFC`, `telefono_movil`, `phone_emergency`, `name_emerg_contanct`, `direccion`) VALUES
(8, 'Marco Antonio', 'Cantu', 'Gea', '1981-11-20', 'CAGM8111209i9', '2281097384', '2281097384', 'Noely Flores Huerta', 'Mar Antillano 225'),
(12, 'Ernesto', 'Rivera', 'Mazias', '1991-07-27', 'RIME910727', '+523221132810', '2281097384', '', 'una direcion x'),
(13, 'ABEL', 'JIMENEZ', 'SOSA', '0000-00-00', '', '', '', '', ''),
(14, 'ANTONIO', 'GUTIERREZ', '', '0000-00-00', '', '', '', '', ''),
(15, 'ALBINO', 'TIZNADO', '', '0000-00-00', '', '', '', '', ''),
(16, 'AMADO', 'DOMINGUEZ', '', '0000-00-00', '', '', '', '', ''),
(17, 'TIM', 'STONE', '', '0000-00-00', '', '', '', '', ''),
(18, 'ANDRES', 'BUSTAMANTE', '', '0000-00-00', '', '', '', '', ''),
(19, 'LUIS MANUEL', 'JIMENEZ', 'SEGURA', '0000-00-00', '', '', '', '', ''),
(20, 'MAXIMO', 'GARCIA', 'NOSE', '0000-00-00', '', '', '', '', ''),
(21, 'JAIMITO', 'EL CARTER', '', '0000-00-00', '', '', '', '', ''),
(22, 'ALBERTO', 'MANDEZ', 'APEN', '1991-11-15', 'MAAA911115', '3221039076', '443345345', 'Ninguno', 'Mar Antillano 225\r\nCol. Villas Vallarta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_menus`
--

CREATE TABLE `tbl_menus` (
  `id_menu` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `pathlink` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_modules`
--

CREATE TABLE `tbl_modules` (
  `id_module` int(11) NOT NULL,
  `label` varchar(255) NOT NULL,
  `pathlink` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_profiles`
--

CREATE TABLE `tbl_profiles` (
  `idprofile` int(11) NOT NULL,
  `profile` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Volcado de datos para la tabla `tbl_profiles`
--

INSERT INTO `tbl_profiles` (`idprofile`, `profile`, `active`) VALUES
(1, 'Public', 1),
(2, 'Supervisor', 1),
(3, 'Administrator', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_userinfocompany`
--

CREATE TABLE `tbl_userinfocompany` (
  `idinfocompany` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `guard` varchar(10) NOT NULL,
  `employeenum` varchar(150) NOT NULL,
  `idWorkUnit` int(11) NOT NULL,
  `idCompany` int(11) NOT NULL,
  `idDeparment` int(11) NOT NULL,
  `idcategory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Volcado de datos para la tabla `tbl_userinfocompany`
--

INSERT INTO `tbl_userinfocompany` (`idinfocompany`, `category`, `guard`, `employeenum`, `idWorkUnit`, `idCompany`, `idDeparment`, `idcategory`) VALUES
(8, '', 'G', '10009825', 1, 3, 4, 8),
(9, '', 'A', '10009861', 1, 1, 2, 16),
(10, '', 'F', '10010035', 1, 1, 7, 31),
(11, '', '', '10009827', 0, 0, 0, 0),
(12, '', 'A', '10009837', 1, 1, 2, 16),
(13, '', '', '10009796', 0, 0, 0, 0),
(14, '', '', 'tstone', 0, 0, 0, 0),
(15, '', '', 'abustamante', 0, 0, 0, 0),
(16, '', '', '10009921', 1, 1, 0, 0),
(17, '', '', 'maxgarcia', 1, 1, 0, 0),
(18, '', '', 'jaime12', 1, 1, 0, 0),
(19, '', 'B', 'amandez', 1, 4, 2, 21);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usersignature`
--

CREATE TABLE `tbl_usersignature` (
  `idsignature` int(11) NOT NULL,
  `password` text NOT NULL,
  `signaturepath` varchar(255) NOT NULL,
  `iduser` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Volcado de datos para la tabla `tbl_usersignature`
--

INSERT INTO `tbl_usersignature` (`idsignature`, `password`, `signaturepath`, `iduser`) VALUES
(9, 'aL3B0KwumRokNgvG7yUWUf1K7GLnXlx2KNmLGaskyIE=', 'TWFyY28gQW50b25pbyBDYW50dSBHZWEyMDIwMDQxMA==.dat', 0),
(10, 'aL3B0KwumRokNgvG7yUWUf1K7GLnXlx2KNmLGaskyIE=', 'TWFyY28gQW50b25pbyBDYW50dSBHZWEyMDIwMDQxMQ==.dat', 0),
(11, 'aL3B0KwumRokNgvG7yUWUf1K7GLnXlx2KNmLGaskyIE=', 'TWFyY28gQW50b25pbyBDYW50dSBHZWEyMDIwMDQxMTAyMjk=.dat', 0),
(12, 'aL3B0KwumRokNgvG7yUWUf1K7GLnXlx2KNmLGaskyIE=', 'TWFyY28gQW50b25pbyBDYW50dSBHZWEyMDIwMDQxMTAzMDI=.dat', 0),
(13, 'aL3B0KwumRokNgvG7yUWUf1K7GLnXlx2KNmLGaskyIE=', 'TWFyY28gQW50b25pbyBDYW50dSBHZWEyMDIwMDQxMTAzMDU=.dat', 0),
(14, 'aL3B0KwumRokNgvG7yUWUf1K7GLnXlx2KNmLGaskyIE=', 'TWFyY28gQW50b25pbyBDYW50dSBHZWEyMDIwMDQxMTAzMDg=.dat', 0),
(15, 'aL3B0KwumRokNgvG7yUWUf1K7GLnXlx2KNmLGaskyIE=', 'TWFyY28gQW50b25pbyBDYW50dSBHZWEyMDIwMDQxMTAzMTE=.dat', 0),
(16, 'aL3B0KwumRokNgvG7yUWUf1K7GLnXlx2KNmLGaskyIE=', 'TWFyY28gQW50b25pbyBDYW50dSBHZWEyMDIwMDQxMTAzMTU=.dat', 0),
(17, 'aL3B0KwumRokNgvG7yUWUf1K7GLnXlx2KNmLGaskyIE=', 'TWFyY28gQW50b25pbyBDYW50dSBHZWEyMDIwMDQxMTAzMTY=.dat', 0),
(18, 'aL3B0KwumRokNgvG7yUWUf1K7GLnXlx2KNmLGaskyIE=', 'TWFyY28gQW50b25pbyBDYW50dSBHZWEyMDIwMDQxMTAzMTc=.dat', 0),
(19, 'aL3B0KwumRokNgvG7yUWUf1K7GLnXlx2KNmLGaskyIE=', 'TWFyY28gQW50b25pbyBDYW50dSBHZWEyMDIwMDQxMTAzMjE=.dat', 0),
(20, 'aL3B0KwumRokNgvG7yUWUf1K7GLnXlx2KNmLGaskyIE=', 'TWFyY28gQW50b25pbyBDYW50dSBHZWEyMDIwMDQxMTAzMjI=.dat', 0),
(21, 'aL3B0KwumRokNgvG7yUWUf1K7GLnXlx2KNmLGaskyIE=', 'TWFyY28gQW50b25pbyBDYW50dSBHZWEyMDIwMDQxMTAzMjQ=.dat', 0),
(22, 'aL3B0KwumRokNgvG7yUWUf1K7GLnXlx2KNmLGaskyIE=', 'TWFyY28gQW50b25pbyBDYW50dSBHZWEyMDIwMDQxMTAzNTY=.dat', 0),
(23, 'aL3B0KwumRokNgvG7yUWUf1K7GLnXlx2KNmLGaskyIE=', 'TWFyY28gQW50b25pbyBDYW50dSBHZWEyMDIwMDQxMTA2MTg=.dat', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_userslogin`
--

CREATE TABLE `tbl_userslogin` (
  `userid` int(11) NOT NULL,
  `user_login` varchar(20) NOT NULL,
  `user_pwd` varchar(255) NOT NULL,
  `user_email` varchar(150) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `idprofile` int(11) NOT NULL,
  `idInfoUser` int(11) NOT NULL,
  `idinfocompany` int(11) NOT NULL,
  `AgreeSignatureTerms` tinyint(1) NOT NULL,
  `idsignature` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Volcado de datos para la tabla `tbl_userslogin`
--

INSERT INTO `tbl_userslogin` (`userid`, `user_login`, `user_pwd`, `user_email`, `active`, `idprofile`, `idInfoUser`, `idinfocompany`, `AgreeSignatureTerms`, `idsignature`) VALUES
(3, '10009825', 'GkimhQVOPns=', 'marco.cantu.g@gmail.com', 1, 3, 8, 8, 0, 0),
(4, '10009861', 'nk4f6Gs21cw=', 'marco.cantu.g@gmail.com', 1, 1, 12, 9, 0, 0),
(5, '10010035', 'nk4f6Gs21cw=', 'marco.cantu.g@gmail.com', 1, 1, 13, 10, 0, 0),
(6, '10009827', 'nk4f6Gs21cw=', 'marco.cantu.g@gmail.com', 1, 1, 14, 11, 0, 0),
(7, '10009837', 'nk4f6Gs21cw=', 'marco.cantu.g@gmail.com', 1, 1, 15, 12, 0, 0),
(8, '10009796', 'nk4f6Gs21cw=', 'email@server.com', 1, 1, 16, 13, 0, 0),
(9, 'tstone', 'nk4f6Gs21cw=', 'timstone@timstone', 1, 1, 17, 14, 0, 0),
(10, 'abustamante', 'nk4f6Gs21cw=', 'bustos@server.com', 1, 1, 18, 15, 0, 0),
(11, '10009921', 'NXwZ+hEWIuVOCF/+lMhYCw==', 'ejimenez@servidor.com', 1, 1, 19, 16, 0, 0),
(12, 'maxgarcia', 'nk4f6Gs21cw=', 'masdaks@server.com', 1, 1, 20, 17, 0, 0),
(13, 'jaime12', 'nk4f6Gs21cw=', 'jaime@gmaill.com', 1, 1, 21, 18, 0, 0),
(14, 'amandez', 'nk4f6Gs21cw=', 'alberto.m.a@gmail.com', 1, 1, 22, 19, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_workunit`
--

CREATE TABLE `tbl_workunit` (
  `idWorkUnit` int(11) NOT NULL,
  `UnitName` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin2;

--
-- Volcado de datos para la tabla `tbl_workunit`
--

INSERT INTO `tbl_workunit` (`idWorkUnit`, `UnitName`, `active`) VALUES
(1, 'PSSP La Muralla IV', 1),
(2, 'PSSP Bicentenario', 1),
(3, 'PSSP Centenario', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_categoy`
--
ALTER TABLE `tbl_categoy`
  ADD PRIMARY KEY (`idcategory`);

--
-- Indices de la tabla `tbl_company`
--
ALTER TABLE `tbl_company`
  ADD PRIMARY KEY (`idCompany`);

--
-- Indices de la tabla `tbl_deparments`
--
ALTER TABLE `tbl_deparments`
  ADD PRIMARY KEY (`idDeparment`);

--
-- Indices de la tabla `tbl_infouser`
--
ALTER TABLE `tbl_infouser`
  ADD PRIMARY KEY (`idInfoUser`);

--
-- Indices de la tabla `tbl_menus`
--
ALTER TABLE `tbl_menus`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indices de la tabla `tbl_modules`
--
ALTER TABLE `tbl_modules`
  ADD PRIMARY KEY (`id_module`);

--
-- Indices de la tabla `tbl_profiles`
--
ALTER TABLE `tbl_profiles`
  ADD PRIMARY KEY (`idprofile`);

--
-- Indices de la tabla `tbl_userinfocompany`
--
ALTER TABLE `tbl_userinfocompany`
  ADD PRIMARY KEY (`idinfocompany`);

--
-- Indices de la tabla `tbl_usersignature`
--
ALTER TABLE `tbl_usersignature`
  ADD PRIMARY KEY (`idsignature`);

--
-- Indices de la tabla `tbl_userslogin`
--
ALTER TABLE `tbl_userslogin`
  ADD PRIMARY KEY (`userid`);

--
-- Indices de la tabla `tbl_workunit`
--
ALTER TABLE `tbl_workunit`
  ADD PRIMARY KEY (`idWorkUnit`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_categoy`
--
ALTER TABLE `tbl_categoy`
  MODIFY `idcategory` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT de la tabla `tbl_company`
--
ALTER TABLE `tbl_company`
  MODIFY `idCompany` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `tbl_deparments`
--
ALTER TABLE `tbl_deparments`
  MODIFY `idDeparment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `tbl_infouser`
--
ALTER TABLE `tbl_infouser`
  MODIFY `idInfoUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `tbl_menus`
--
ALTER TABLE `tbl_menus`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_modules`
--
ALTER TABLE `tbl_modules`
  MODIFY `id_module` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbl_profiles`
--
ALTER TABLE `tbl_profiles`
  MODIFY `idprofile` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tbl_userinfocompany`
--
ALTER TABLE `tbl_userinfocompany`
  MODIFY `idinfocompany` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT de la tabla `tbl_usersignature`
--
ALTER TABLE `tbl_usersignature`
  MODIFY `idsignature` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT de la tabla `tbl_userslogin`
--
ALTER TABLE `tbl_userslogin`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `tbl_workunit`
--
ALTER TABLE `tbl_workunit`
  MODIFY `idWorkUnit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
