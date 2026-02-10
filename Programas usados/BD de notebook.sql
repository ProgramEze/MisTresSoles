-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-02-2026 a las 21:42:59
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `apiinmobiliaria`
--
DROP DATABASE IF EXISTS `apiinmobiliaria`;
CREATE DATABASE IF NOT EXISTS `apiinmobiliaria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `apiinmobiliaria`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `Id` int(11) NOT NULL,
  `InmuebleId` int(11) NOT NULL,
  `InquilinoId` int(11) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `FechaInicio` date NOT NULL,
  `FechaFin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmuebles`
--

CREATE TABLE `inmuebles` (
  `Id` int(11) NOT NULL,
  `PropietarioId` int(11) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Ambientes` int(11) NOT NULL,
  `TipoId` int(11) NOT NULL,
  `UsoId` int(11) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `ImagenUrl` varchar(2000) DEFAULT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inmuebles`
--

INSERT INTO `inmuebles` (`Id`, `PropietarioId`, `Direccion`, `Ambientes`, `TipoId`, `UsoId`, `Precio`, `ImagenUrl`, `Estado`) VALUES
(1, 1, 'Barrio Cerro de la Cruz Manzana 265 Casa 10', 3, 1, 1, 58000.00, NULL, 0),
(2, 2, 'Carranza 1129', 2, 1, 1, 15555.00, NULL, 0),
(3, 6, 'Salta 616', 3, 1, 1, 56000.00, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inquilinos`
--

CREATE TABLE `inquilinos` (
  `Id` int(11) NOT NULL,
  `DNI` varchar(12) NOT NULL,
  `Apellido` varchar(100) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `Id` int(11) NOT NULL,
  `ContratoId` int(11) NOT NULL,
  `NumeroDePago` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Monto` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietarios`
--

CREATE TABLE `propietarios` (
  `Id` int(11) NOT NULL,
  `DNI` varchar(12) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Telefono` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `propietarios`
--

INSERT INTO `propietarios` (`Id`, `DNI`, `Apellido`, `Nombre`, `Telefono`, `Email`, `Password`) VALUES
(1, '12345678', 'Luzza', 'Mariano', '121221224', 'mluzza@gmail.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20='),
(2, '27013989', 'Baigorria', 'Monica Patricia', '2657123455', 'patobaigorria@gmail.com', '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20='),
(6, '34229421', 'Diaz', 'Jorge Ezequiel', '1132185231', 'diazezequiel777@gmail.com', 'j89RIlggONn4/p3ZW/mVffLG0XWa1YeKwvwRGi1Wi0A='),
(7, '37716731', 'Cruceño', 'Federico Ivan', '2657312733', 'a', '3NhEe7xWmOI/rcoD1E87QOXvp/dxtXzdcKYcAKt41tM=');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodeinmueble`
--

CREATE TABLE `tipodeinmueble` (
  `Id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipodeinmueble`
--

INSERT INTO `tipodeinmueble` (`Id`, `nombre`) VALUES
(1, 'Casa'),
(2, 'Departamento'),
(3, 'Local'),
(4, 'Depósito');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usodeinmueble`
--

CREATE TABLE `usodeinmueble` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usodeinmueble`
--

INSERT INTO `usodeinmueble` (`Id`, `Nombre`) VALUES
(1, 'Residencial'),
(2, 'Comercial');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `InmuebleId` (`InmuebleId`),
  ADD KEY `InquilinoId` (`InquilinoId`);

--
-- Indices de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `PropietarioId` (`PropietarioId`),
  ADD KEY `TipoId` (`TipoId`),
  ADD KEY `UsoId` (`UsoId`);

--
-- Indices de la tabla `inquilinos`
--
ALTER TABLE `inquilinos`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ContratoId` (`ContratoId`);

--
-- Indices de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `tipodeinmueble`
--
ALTER TABLE `tipodeinmueble`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `usodeinmueble`
--
ALTER TABLE `usodeinmueble`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `inquilinos`
--
ALTER TABLE `inquilinos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipodeinmueble`
--
ALTER TABLE `tipodeinmueble`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usodeinmueble`
--
ALTER TABLE `usodeinmueble`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `contratos_ibfk_1` FOREIGN KEY (`InmuebleId`) REFERENCES `inmuebles` (`Id`),
  ADD CONSTRAINT `contratos_ibfk_2` FOREIGN KEY (`InquilinoId`) REFERENCES `inquilinos` (`Id`);

--
-- Filtros para la tabla `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD CONSTRAINT `inmuebles_ibfk_1` FOREIGN KEY (`PropietarioId`) REFERENCES `propietarios` (`Id`),
  ADD CONSTRAINT `inmuebles_ibfk_2` FOREIGN KEY (`TipoId`) REFERENCES `tipodeinmueble` (`Id`),
  ADD CONSTRAINT `inmuebles_ibfk_3` FOREIGN KEY (`UsoId`) REFERENCES `usodeinmueble` (`Id`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`ContratoId`) REFERENCES `contratos` (`Id`);
--
-- Base de datos: `apivacunatorio`
--
DROP DATABASE IF EXISTS `apivacunatorio`;
CREATE DATABASE IF NOT EXISTS `apivacunatorio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `apivacunatorio`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agente`
--

CREATE TABLE `agente` (
  `Matricula` int(11) NOT NULL,
  `Clave` varchar(255) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `agente`
--

INSERT INTO `agente` (`Matricula`, `Clave`, `Nombre`, `Apellido`, `Email`, `Estado`) VALUES
(23948512, '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 'Juan', 'Pérez', 'juan.perez@example.com', 1),
(24367895, '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 'Ana', 'Fernández', 'ana.fernandez@example.com', 0),
(25678934, '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 'Miguel', 'Sánchez', 'miguel.sanchez@example.com', 0),
(28765432, '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 'Carlos', 'López', 'carlos.lopez@example.com', 1),
(31098765, '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 'Sofía', 'Rodríguez', 'sofia.rodriguez@example.com', 1),
(34229421, '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 'Jorge Ezequiel', 'Diaz', 'diazezequiel777@gmail.com', 1),
(36274589, '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 'María', 'Gómez', 'maria.gomez@example.com', 0),
(37321456, '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 'Lucía', 'Ramírez', 'lucia.ramirez@example.com', 1),
(38127465, '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 'Luis', 'García', 'luis.garcia@example.com', 1),
(39985674, '3A0G2+zJ3luLnlC44+Xe5HGw/9RWJNoyF2XZACvev20=', 'Laura', 'Martínez', 'laura.martinez@example.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion`
--

CREATE TABLE `aplicacion` (
  `Id` int(11) NOT NULL,
  `LoteProveedorId` int(11) NOT NULL,
  `AgenteId` int(11) DEFAULT NULL,
  `Dosis` int(11) NOT NULL,
  `Estado` enum('Pendiente','Aplicada','Cancelada') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aplicacion`
--

INSERT INTO `aplicacion` (`Id`, `LoteProveedorId`, `AgenteId`, `Dosis`, `Estado`) VALUES
(49, 4, NULL, 1, 'Cancelada'),
(50, 4, NULL, 2, 'Cancelada'),
(51, 4, 34229421, 3, 'Aplicada'),
(52, 4, 34229421, 4, 'Aplicada'),
(53, 4, NULL, 1, 'Cancelada'),
(54, 5, NULL, 5, 'Cancelada'),
(55, 5, NULL, 6, 'Cancelada'),
(56, 4, 34229421, 7, 'Aplicada'),
(57, 9, NULL, 1, 'Pendiente'),
(58, 4, 34229421, 8, 'Aplicada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Pais` varchar(30) NOT NULL,
  `Email` varchar(70) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `laboratorio`
--

INSERT INTO `laboratorio` (`Id`, `Nombre`, `Pais`, `Email`, `Telefono`, `Direccion`, `Estado`) VALUES
(1, 'Pfizer', 'EEUU', 'pfizereeuu@gmail.com', '12345678', 'Av. Los Alamos 1234', 1),
(2, 'Bago', 'Argentina', 'bagoarg@gmail.com', '12345679', 'Av. Siempreviva 4321', 1),
(3, 'Bayer', 'Argentina', 'bayerarg@gmail.com', '12345677', 'Av. San Luis 3241', 1),
(4, 'Laboratorios Puntanos', 'Argentina', 'labpunarg@gmail.com', '12345676', 'Av. Serrania Puntana 2314', 1),
(5, 'Lab Pharma', 'Argentina', 'contacto@labpharma.com', '+54 11 4567 1234', 'Av. Corrientes 1234, Buenos Aires', 1),
(6, 'BioTech', 'Brasil', 'info@biotech.com.br', '+55 21 9876 5432', 'Rua das Flores 567, Rio de Janeiro', 1),
(7, 'HealthCorp', 'Chile', 'ventas@healthcorp.cl', '+56 2 3456 7890', 'Calle O\'Higgins 234, Santiago', 1),
(8, 'MediLife', 'México', 'medilife@correo.mx', '+52 55 1234 5678', 'Paseo de la Reforma 789, Ciudad de México', 1),
(9, 'PharmaPlus', 'Colombia', 'contacto@pharmaplus.co', '+57 1 3456 7890', 'Carrera 7 #89-45, Bogotá', 0),
(10, 'GlobalMed', 'Perú', 'globalmed@peru.com', '+51 1 2345 6789', 'Av. Larco 456, Lima', 1),
(11, 'CureLabs', 'España', 'info@curelabs.es', '+34 91 456 7890', 'Calle Gran Vía 23, Madrid', 1),
(12, 'Salud XXI', 'Uruguay', 'contacto@saludxxi.uy', '+598 2 2345 6789', '18 de Julio 456, Montevideo', 0),
(13, 'InnovaPharm', 'Argentina', 'innova@pharm.com.ar', '+54 11 6789 1234', 'Av. Libertador 987, Buenos Aires', 1),
(14, 'BioLabs', 'Chile', 'contacto@biolabs.cl', '+56 2 5678 1234', 'Calle Las Palmeras 789, Santiago', 1),
(15, 'PharmaCorp', 'México', 'ventas@pharmacorp.mx', '+52 55 6789 1234', 'Insurgentes Sur 456, Ciudad de México', 1),
(16, 'MedSolutions', 'Brasil', 'info@medsolutions.com.br', '+55 11 2345 6789', 'Av. Paulista 123, São Paulo', 1),
(17, 'Salud Global', 'Colombia', 'contacto@saludglobal.co', '+57 1 5678 1234', 'Calle 100 #23-45, Bogotá', 1),
(18, 'VitaLab', 'Perú', 'vitalab@peru.com', '+51 1 5678 4321', 'Av. Grau 567, Lima', 0),
(19, 'Sanitas', 'España', 'info@sanitas.es', '+34 93 2345 6789', 'Paseo de Gracia 123, Barcelona', 1),
(20, 'MediPlus', 'Uruguay', 'contacto@mediplus.uy', '+598 2 6789 1234', 'Av. Italia 789, Montevideo', 1),
(21, 'PharmaHealth', 'Argentina', 'ventas@pharmahealth.com.ar', '+54 341 2345 6789', 'Calle Córdoba 456, Rosario', 1),
(22, 'CuraMed', 'Chile', 'info@curamed.cl', '+56 2 6789 1234', 'Av. Providencia 1234, Santiago', 1),
(23, 'Salud Integral', 'México', 'ventas@saludintegral.mx', '+52 33 1234 5678', 'Av. Vallarta 456, Guadalajara', 1),
(24, 'BioHealth', 'Brasil', 'info@biohealth.com.br', '+55 21 3456 7890', 'Rua da Saúde 123, Rio de Janeiro', 0),
(25, 'PharmaMed', 'España', 'contacto@pharmamed.es', '+34 95 5678 1234', 'Calle Sierpes 456, Sevilla', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteproveedor`
--

CREATE TABLE `loteproveedor` (
  `Id` int(11) NOT NULL,
  `NumeroDeLote` int(11) NOT NULL,
  `LaboratorioId` int(11) NOT NULL,
  `TipoDeVacunaId` int(11) NOT NULL,
  `CantidadDeVacunas` int(11) NOT NULL,
  `FechaDeVencimiento` date NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `loteproveedor`
--

INSERT INTO `loteproveedor` (`Id`, `NumeroDeLote`, `LaboratorioId`, `TipoDeVacunaId`, `CantidadDeVacunas`, `FechaDeVencimiento`, `Estado`) VALUES
(1, 1001, 1, 1, 5000, '2029-09-01', 1),
(2, 1002, 2, 2, 7500, '2030-09-01', 1),
(3, 1003, 3, 3, 6000, '2031-09-01', 1),
(4, 1004, 4, 4, 7989, '2029-09-01', 1),
(5, 1005, 5, 5, 4500, '2030-09-01', 1),
(6, 1006, 6, 6, 5500, '2032-09-01', 1),
(7, 1007, 7, 7, 6200, '2029-09-01', 1),
(8, 1008, 8, 8, 5300, '2031-09-01', 1),
(9, 1009, 9, 9, 7099, '2029-09-01', 1),
(10, 1010, 10, 10, 7600, '2030-09-01', 1),
(11, 1011, 11, 11, 6400, '2031-09-01', 1),
(12, 1012, 12, 12, 8300, '2032-09-01', 1),
(13, 1013, 13, 13, 5000, '2029-09-01', 1),
(14, 1014, 14, 14, 7800, '2030-09-01', 1),
(15, 1015, 15, 15, 6200, '2031-09-01', 1),
(16, 1016, 16, 16, 6800, '2032-09-01', 1),
(17, 1017, 17, 17, 5600, '2029-09-01', 1),
(18, 1018, 18, 18, 5900, '2030-09-01', 1),
(19, 1019, 19, 19, 7400, '2031-09-01', 1),
(20, 1020, 20, 20, 6800, '2032-09-01', 1),
(21, 1021, 21, 1, 5000, '2029-09-01', 1),
(22, 1022, 22, 2, 6000, '2030-09-01', 1),
(23, 1023, 23, 3, 5500, '2031-09-01', 1),
(24, 1024, 24, 4, 6500, '2032-09-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `Id` int(11) NOT NULL,
  `DNI` varchar(15) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `FechaDeNacimiento` date NOT NULL,
  `Genero` enum('Masculino','Femenino','Otro') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`Id`, `DNI`, `Nombre`, `Apellido`, `FechaDeNacimiento`, `Genero`) VALUES
(1, '12345678', 'Juan', 'Pérez', '2007-05-15', 'Masculino'),
(2, '87654321', 'María', 'Gómez', '2008-09-20', 'Femenino'),
(3, '34567890', 'Carlos', 'López', '2009-03-25', 'Masculino'),
(4, '56789012', 'Laura', 'Martínez', '2010-12-10', 'Femenino'),
(5, '23456789', 'Ana', 'Fernández', '2006-07-30', 'Femenino'),
(6, '67890123', 'Luis', 'García', '2009-01-05', 'Masculino'),
(7, '78901234', 'Sofía', 'Rodríguez', '2010-11-11', 'Femenino'),
(8, '89012345', 'Miguel', 'Sánchez', '2008-06-14', 'Masculino'),
(9, '90123456', 'Lucía', 'Ramírez', '2007-04-20', 'Femenino'),
(10, '01234567', 'Diego', 'Silva', '2011-08-08', 'Masculino'),
(11, '23456780', 'Valeria', 'Mendoza', '2006-02-19', 'Femenino'),
(12, '34567801', 'Fernando', 'Castro', '2010-03-12', 'Masculino'),
(13, '45678902', 'Gabriela', 'Morales', '2008-10-25', 'Femenino'),
(14, '56789013', 'Martín', 'Rojas', '2007-05-18', 'Masculino'),
(15, '67890124', 'Camila', 'Ortiz', '2011-09-09', 'Femenino'),
(16, '78901235', 'Javier', 'Guzmán', '2009-07-21', 'Masculino'),
(17, '89012346', 'Paula', 'Flores', '2010-11-30', 'Femenino'),
(18, '90123457', 'Andrés', 'Pereira', '2006-01-22', 'Masculino'),
(19, '01234568', 'Natalia', 'Suárez', '2009-12-15', 'Femenino'),
(20, '12345679', 'Ricardo', 'Herrera', '2011-04-05', 'Masculino'),
(21, '23456781', 'Elena', 'Vega', '2008-02-28', 'Femenino'),
(22, '34567802', 'Hernán', 'Molina', '2010-09-14', 'Masculino'),
(23, '45678903', 'Carla', 'Muñoz', '2011-10-17', 'Femenino'),
(24, '56789014', 'Sebastián', 'Paredes', '2007-03-03', 'Masculino'),
(25, '48456723', 'Enzo', 'Miranda', '2010-05-15', 'Masculino'),
(26, '54951734', 'Ciro', 'Pertusi', '2015-07-25', 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodevacuna`
--

CREATE TABLE `tipodevacuna` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipodevacuna`
--

INSERT INTO `tipodevacuna` (`Id`, `Nombre`, `Descripcion`) VALUES
(1, 'BCG', 'Vacuna contra la tuberculosis.'),
(2, 'Hepatitis B', 'Vacuna contra la hepatitis B.'),
(3, 'Pentavalente', 'Protege contra difteria, tétanos, tos ferina, hepatitis B, e infecciones invasivas por Hib.'),
(4, 'Polio Oral', 'Vacuna contra la poliomielitis.'),
(5, 'Polio Inactivada', 'Vacuna inactivada contra la poliomielitis.'),
(6, 'Rotavirus', 'Protege contra infecciones por rotavirus, que causan diarrea grave.'),
(7, 'Neumococo Conjugada', 'Previene infecciones por neumococo, incluyendo neumonía, meningitis y sepsis.'),
(8, 'Influenza', 'Protege contra la gripe estacional.'),
(9, 'SRP (Triple viral)', 'Vacuna contra sarampión, rubéola y paperas.'),
(10, 'DPT', 'Vacuna contra difteria, tétanos y tos ferina.'),
(11, 'Hepatitis A', 'Vacuna contra la hepatitis A.'),
(12, 'Varicela', 'Protege contra la varicela.'),
(13, 'VPH', 'Vacuna contra el virus del papiloma humano.'),
(14, 'Meningococo', 'Previene infecciones por meningococo, incluyendo meningitis.'),
(15, 'Tétanos', 'Vacuna contra el tétanos.'),
(16, 'Fiebre Amarilla', 'Vacuna contra la fiebre amarilla.'),
(17, 'Antirrábica', 'Vacuna contra la rabia.'),
(18, 'COVID-19', 'Vacuna para prevenir la infección por el virus SARS-CoV-2.'),
(19, 'Zoster', 'Vacuna contra el herpes zóster (culebrilla).'),
(20, 'Dengue', 'Vacuna contra el virus del dengue.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `Id` int(11) NOT NULL,
  `PacienteId` int(11) NOT NULL,
  `TipoDeVacunaId` int(11) NOT NULL,
  `TutorId` int(11) NOT NULL,
  `AgenteId` int(11) NOT NULL,
  `AplicacionId` int(11) DEFAULT NULL,
  `Cita` datetime NOT NULL,
  `RelacionTutor` enum('Madre','Padre','Tutor','Otro') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `turno`
--

INSERT INTO `turno` (`Id`, `PacienteId`, `TipoDeVacunaId`, `TutorId`, `AgenteId`, `AplicacionId`, `Cita`, `RelacionTutor`) VALUES
(29, 2, 4, 6, 34229421, 49, '2024-09-10 14:30:00', 'Madre'),
(30, 2, 4, 6, 34229421, 50, '2024-09-10 15:30:00', 'Madre'),
(31, 2, 4, 6, 34229421, 51, '2024-09-10 14:00:00', 'Madre'),
(32, 2, 4, 6, 34229421, 52, '2024-09-10 15:30:00', 'Madre'),
(33, 3, 4, 6, 34229421, 53, '2024-09-10 15:30:00', 'Madre'),
(34, 2, 5, 6, 34229421, 54, '2024-09-20 14:30:00', 'Madre'),
(35, 2, 5, 6, 34229421, 55, '2024-09-20 14:30:00', 'Madre'),
(36, 2, 4, 6, 34229421, 56, '2024-09-20 14:30:00', 'Madre'),
(37, 1, 9, 5, 34229421, 57, '2024-09-16 09:30:00', 'Madre'),
(38, 2, 4, 6, 34229421, 58, '2024-09-10 14:30:00', 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutor`
--

CREATE TABLE `tutor` (
  `Id` int(11) NOT NULL,
  `DNI` varchar(15) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Email` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tutor`
--

INSERT INTO `tutor` (`Id`, `DNI`, `Nombre`, `Apellido`, `Telefono`, `Email`) VALUES
(1, '12345678', 'María', 'Pérez', '+54 11 2345 6789', 'maria.perez@example.com'),
(2, '23456789', 'Juan', 'Gómez', '+54 11 3456 7890', 'juan.gomez@example.com'),
(3, '34567890', 'Ana', 'López', '+54 11 4567 8901', 'ana.lopez@example.com'),
(4, '45678901', 'Carlos', 'Martínez', '+54 11 5678 9012', 'carlos.martinez@example.com'),
(5, '56789012', 'Laura', 'Fernández', '+54 11 6789 0123', 'laura.fernandez@example.com'),
(6, '67890123', 'Miguel', 'García', '+54 11 7890 1234', 'miguel.garcia@example.com'),
(7, '78901234', 'Sofía', 'Rodríguez', '+54 11 8901 2345', 'sofia.rodriguez@example.com'),
(8, '89012345', 'Luis', 'Sánchez', '+54 11 9012 3456', 'luis.sanchez@example.com'),
(9, '90123456', 'Elena', 'Ramírez', '+54 11 0123 4567', 'elena.ramirez@example.com'),
(10, '01234567', 'Fernando', 'Silva', '+54 11 1234 5678', 'fernando.silva@example.com'),
(11, '29456793', 'Mirinda', 'Juarez', '2657325476', 'mirijua@gmail.com'),
(12, '34229421', 'JORGE EZEQUIEL', 'DIAZ', '1132185230', 'diazezequiel777@gmail.com'),
(13, '34229421', 'JORGE EZEQUIEL', 'DIAZ', '1132185230', 'diazezequiel777@gmail.com'),
(14, '34229420', 'JORGE EZEQUIEL', 'DIAZ', '11321852306', 'diazezequiel777@gmail.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agente`
--
ALTER TABLE `agente`
  ADD PRIMARY KEY (`Matricula`);

--
-- Indices de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `AgenteId` (`AgenteId`),
  ADD KEY `LoteProveedorId` (`LoteProveedorId`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `NumeroDeLote` (`NumeroDeLote`,`LaboratorioId`),
  ADD KEY `LaboratorioId` (`LaboratorioId`),
  ADD KEY `TipoDeVacunaId` (`TipoDeVacunaId`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `tipodevacuna`
--
ALTER TABLE `tipodevacuna`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `AgenteId` (`AgenteId`),
  ADD KEY `PacienteId` (`PacienteId`),
  ADD KEY `TutorId` (`TutorId`),
  ADD KEY `AplicacionId` (`AplicacionId`),
  ADD KEY `TipoDeVacunaId` (`TipoDeVacunaId`);

--
-- Indices de la tabla `tutor`
--
ALTER TABLE `tutor`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `tipodevacuna`
--
ALTER TABLE `tipodevacuna`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `turno`
--
ALTER TABLE `turno`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `tutor`
--
ALTER TABLE `tutor`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD CONSTRAINT `aplicacion_ibfk_1` FOREIGN KEY (`AgenteId`) REFERENCES `agente` (`Matricula`),
  ADD CONSTRAINT `aplicacion_ibfk_2` FOREIGN KEY (`LoteProveedorId`) REFERENCES `loteproveedor` (`Id`);

--
-- Filtros para la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD CONSTRAINT `loteproveedor_ibfk_1` FOREIGN KEY (`LaboratorioId`) REFERENCES `laboratorio` (`Id`),
  ADD CONSTRAINT `loteproveedor_ibfk_2` FOREIGN KEY (`TipoDeVacunaId`) REFERENCES `tipodevacuna` (`Id`);

--
-- Filtros para la tabla `turno`
--
ALTER TABLE `turno`
  ADD CONSTRAINT `turno_ibfk_1` FOREIGN KEY (`AgenteId`) REFERENCES `agente` (`Matricula`),
  ADD CONSTRAINT `turno_ibfk_2` FOREIGN KEY (`PacienteId`) REFERENCES `paciente` (`Id`),
  ADD CONSTRAINT `turno_ibfk_3` FOREIGN KEY (`TutorId`) REFERENCES `tutor` (`Id`),
  ADD CONSTRAINT `turno_ibfk_4` FOREIGN KEY (`AplicacionId`) REFERENCES `aplicacion` (`Id`),
  ADD CONSTRAINT `turno_ibfk_5` FOREIGN KEY (`TipoDeVacunaId`) REFERENCES `tipodevacuna` (`Id`);
--
-- Base de datos: `auditoriabpm`
--
DROP DATABASE IF EXISTS `auditoriabpm`;
CREATE DATABASE IF NOT EXISTS `auditoriabpm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `auditoriabpm`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actividad`
--

CREATE TABLE `actividad` (
  `IdActividad` int(11) NOT NULL,
  `Descripcion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `actividad`
--

INSERT INTO `actividad` (`IdActividad`, `Descripcion`) VALUES
(1, 'Levanta Paquetes'),
(2, 'Retrabajos'),
(3, 'Limpieza'),
(4, 'Alistamiento'),
(5, 'Cambio de Formato'),
(6, 'Técnico'),
(7, 'Contratista'),
(8, 'Maquinista'),
(9, 'Stacker'),
(10, 'Líder'),
(11, 'Cadete'),
(12, 'Relevo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `IdAuditoria` int(11) NOT NULL,
  `IdSupervisor` int(11) NOT NULL,
  `IdOperario` int(11) NOT NULL,
  `IdActividad` int(11) NOT NULL,
  `IdLinea` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Firma` text DEFAULT NULL,
  `NoConforme` tinyint(1) NOT NULL,
  `Comentario` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auditoria`
--

INSERT INTO `auditoria` (`IdAuditoria`, `IdSupervisor`, `IdOperario`, `IdActividad`, `IdLinea`, `Fecha`, `Firma`, `NoConforme`, `Comentario`) VALUES
(8, 1, 3, 8, 5, '2024-10-20', '', 0, NULL),
(9, 1, 3, 8, 5, '2024-10-20', '', 0, 'hola'),
(10, 1, 3, 8, 5, '2024-09-15', '', 0, NULL),
(11, 1, 3, 8, 5, '2024-08-19', '', 0, 'Esta es una auditoría de ejemplo.'),
(12, 1, 3, 8, 5, '2024-08-19', '', 0, 'Esta es una auditoría de ejemplo.'),
(13, 1, 3, 8, 5, '2024-11-03', '', 0, 'Esta es una prueba de la fecha.'),
(16, 1, 3, 8, 5, '2024-11-03', '', 0, 'Esta es una auditoría en Linea 4'),
(23, 1, 3, 3, 4, '2024-11-03', '', 0, 'Esta es una auditoría en Linea 4'),
(24, 1, 3, 1, 6, '2024-11-03', '', 0, 'Esta es una auditoría en Linea 4'),
(25, 1, 3, 7, 2, '2024-11-03', '', 0, 'Esta es una auditoría en Linea 4'),
(26, 1, 3, 7, 2, '2024-11-03', '', 0, 'Esta es una auditoría en Linea 4'),
(27, 1, 3, 7, 2, '2024-11-03', '', 0, 'Esta es una auditoría en Linea 4'),
(28, 1, 3, 7, 2, '2024-11-03', '', 0, 'Esta es una auditoría en Linea 4'),
(29, 1, 3, 8, 5, '2024-11-06', '', 0, 'Comentario de prueba'),
(30, 1, 3, 8, 5, '2024-11-07', '', 0, 'Comentario de prueba'),
(31, 1, 3, 3, 9, '2024-11-07', '', 0, 'Comentario de prueba'),
(32, 1, 3, 8, 5, '2024-11-09', '', 0, 'Comentario de prueba'),
(33, 1, 3, 8, 5, '2024-11-09', '', 0, 'Comentario de prueba'),
(34, 1, 3, 8, 5, '2024-11-09', '', 0, 'Comentario de prueba'),
(35, 1, 3, 8, 5, '2024-11-09', '', 0, 'Comentario de prueba'),
(36, 1, 3, 5, 8, '2024-11-09', '', 0, 'Comentario de prueba'),
(37, 1, 3, 3, 9, '2024-11-09', '', 0, 'Comentario de prueba'),
(38, 1, 3, 1, 6, '2024-11-09', '', 0, 'Comentario de prueba'),
(39, 1, 3, 4, 5, '2024-11-09', '', 0, 'Comentario de prueba'),
(40, 1, 3, 8, 5, '2024-11-09', '', 0, 'Comentario de prueba'),
(41, 1, 3, 8, 5, '2024-11-09', '', 0, 'Comentario de prueba'),
(42, 1, 3, 8, 5, '2024-11-09', '', 0, 'Comentario de prueba'),
(43, 1, 3, 8, 5, '2024-11-09', '', 0, 'Comentario de prueba'),
(44, 1, 3, 8, 5, '2024-11-09', '', 0, 'Comentario de prueba'),
(45, 1, 3, 8, 5, '2024-11-09', '', 0, 'Comentario de prueba'),
(46, 1, 3, 8, 5, '2024-11-09', '', 0, 'Comentario de prueba'),
(47, 1, 3, 8, 5, '2024-11-09', '', 0, 'Comentario de prueba'),
(48, 1, 3, 8, 5, '2024-11-09', '', 0, 'Comentario de prueba'),
(49, 1, 3, 8, 5, '2024-11-09', '', 0, 'Comentario de prueba'),
(50, 1, 3, 8, 5, '2024-11-09', '', 0, 'Comentario de prueba'),
(51, 1, 3, 3, 9, '2024-11-09', '', 0, 'Comentario de prueba'),
(52, 1, 3, 8, 5, '2024-11-09', '', 0, 'Comentario de prueba'),
(53, 1, 3, 8, 5, '2024-11-10', '', 0, 'Comentario de prueba'),
(54, 1, 4, 3, 8, '2024-11-10', '', 0, 'Comentario de prueba'),
(55, 1, 3, 8, 5, '2024-11-10', '', 0, 'Comentario de prueba'),
(56, 1, 4, 10, 7, '2024-11-10', '', 0, 'Comentario de prueba'),
(57, 1, 4, 10, 7, '2024-11-10', '', 0, 'Comentario de prueba'),
(58, 1, 4, 10, 7, '2024-11-10', '', 0, 'Comentario de prueba'),
(59, 1, 4, 10, 7, '2024-11-10', '', 0, 'Comentario de prueba'),
(60, 1, 4, 10, 7, '2024-11-10', '', 0, 'Comentario de prueba'),
(61, 1, 3, 8, 5, '2024-11-10', '', 0, 'Hola que tal, como va? SSSSShhhhhh'),
(62, 1, 3, 8, 5, '2024-11-10', '', 0, ''),
(63, 1, 3, 8, 5, '2024-11-10', '', 0, ''),
(64, 1, 3, 8, 5, '2024-11-10', '', 0, ''),
(65, 1, 3, 8, 5, '2024-11-10', '', 0, ''),
(66, 1, 3, 8, 5, '2024-11-10', '', 0, ''),
(67, 1, 3, 3, 9, '2024-11-11', '', 0, ''),
(68, 1, 3, 1, 3, '2024-11-11', '', 0, 'De que te reis'),
(69, 1, 3, 1, 9, '2024-11-11', '', 0, 'Tener Cuidado!!!'),
(70, 1, 3, 2, 2, '2024-11-11', '', 0, ''),
(71, 1, 3, 3, 2, '2024-11-12', '', 0, 'Nuevo Comentario'),
(72, 1, 3, 8, 5, '2024-11-13', '', 0, 'Funciona?'),
(73, 1, 3, 5, 4, '2024-11-13', '', 0, 'Otro comentario'),
(74, 1, 3, 8, 5, '2025-01-29', '', 0, ''),
(75, 1, 3, 8, 5, '2025-02-02', '', 0, ''),
(76, 1, 3, 8, 5, '2025-02-02', '', 0, ''),
(77, 1, 3, 8, 5, '2025-02-02', '', 0, ''),
(78, 1, 4, 10, 7, '2025-02-02', '', 0, ''),
(79, 1, 4, 10, 7, '2025-02-02', '', 0, ''),
(80, 1, 4, 10, 7, '2025-02-02', '', 0, ''),
(81, 1, 4, 10, 7, '2025-02-02', '', 0, ''),
(82, 1, 4, 10, 7, '2025-02-02', '', 0, ''),
(83, 1, 4, 10, 7, '2025-02-02', '', 0, ''),
(84, 1, 4, 10, 7, '2025-02-02', '', 0, ''),
(85, 1, 4, 10, 7, '2025-02-02', '', 0, ''),
(86, 1, 4, 10, 7, '2025-02-02', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-lineca', 1, ''),
(87, 1, 3, 8, 5, '2025-02-02', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-lineca', 0, ''),
(88, 1, 3, 8, 5, '2025-02-02', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-lineca', 0, ''),
(91, 1, 4, 10, 7, '2025-02-02', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-lineca', 0, ''),
(92, 1, 4, 10, 7, '2025-02-04', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-lineca', 0, ''),
(93, 1, 4, 10, 7, '2025-02-04', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-lineca', 1, ''),
(94, 1, 4, 10, 7, '2025-02-04', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-lineca', 0, ''),
(95, 1, 4, 10, 7, '2025-02-04', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-lineca', 0, ''),
(96, 1, 3, 8, 5, '2025-02-04', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-lineca', 0, ''),
(97, 1, 3, 8, 5, '2025-02-04', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-lineca', 0, ''),
(98, 1, 3, 3, 3, '2025-02-04', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-lineca', 1, ''),
(99, 1, 4, 10, 7, '2025-02-23', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-lineca', 1, ''),
(100, 1, 3, 8, 5, '2025-02-23', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-lineca', 0, ''),
(101, 1, 4, 10, 7, '2025-03-06', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"500\" width=\"920\" viewBox=\"0 0 920 500\"><g stroke-linejoin=\"round\" stroke-lineca', 1, ''),
(102, 1, 4, 10, 7, '2025-03-06', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"500\" width=\"920\" viewBox=\"0 0 920 500\"><g stroke-linejoin=\"round\" stroke-lineca', 1, ''),
(103, 1, 3, 8, 5, '2025-03-06', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"500\" width=\"920\" viewBox=\"0 0 920 500\"><g stroke-linejoin=\"round\" stroke-lineca', 1, ''),
(104, 1, 3, 8, 5, '2025-03-06', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-lineca', 0, 'yyyyy'),
(105, 1, 3, 8, 5, '2025-03-11', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"500\" width=\"920\" viewBox=\"0 0 920 500\"><g stroke-linejoin=\"round\" stroke-lineca', 1, ''),
(106, 1, 3, 8, 5, '2025-04-21', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-lineca', 0, ''),
(107, 1, 4, 10, 7, '2025-04-21', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M427,93c0,0 0,0 0,0 \"/><path stroke-width=\"14\" d=\"M427,93c2,12 3,12 5,24 \"/><path stroke-width=\"9\" d=\"M432,117c2,12 1,12 2,25 \"/><path stroke-width=\"8\" d=\"M434,142c3,20 4,20 7,41 3,22 3,22 5,44 3,22 2,22 5,44 3,19 4,19 7,39 2,16 2,16 5,32 1,11 0,11 2,22 \"/><path stroke-width=\"9\" d=\"M465,364c1,5 1,5 3,11 \"/><path stroke-width=\"12\" d=\"M468,375c0,1 2,3 1,2 \"/><path stroke-width=\"15\" d=\"M469,377c-5,-2 -6,-4 -13,-7 \"/><path stroke-width=\"13\" d=\"M456,370c-8,-3 -9,-2 -17,-5 \"/><path stroke-width=\"9\" d=\"M439,365c-10,-5 -10,-6 -20,-11 \"/><path stroke-width=\"8\" d=\"M419,354c-10,-6 -10,-6 -22,-11 -18,-8 -19,-8 -38,-15 -8,-3 -8,-1 -16,-5 -9,-4 -9,-4 -17,-9 -8,-5 -8,-6 -15,-11 \"/><path stroke-width=\"9\" d=\"M311,303c-4,-4 -4,-6 -9,-9 \"/><path stroke-width=\"12\" d=\"M302,294c-1,0 -3,4 -2,3 \"/><path stroke-width=\"15\" d=\"M300,297c7,-4 8,-8 18,-12 \"/><path stroke-width=\"12\" d=\"M318,285c7,-4 7,-3 15,-4 \"/><path stroke-width=\"9\" d=\"M333,281c13,-3 13,-2 26,-4 \"/><path stroke-width=\"8\" d=\"M359,277c26,-3 26,-2 53,-6 29,-5 29,-6 59,-11 31,-6 31,-7 62,-12 34,-5 34,-6 68,-10 36,-4 36,-3 72,-7 31,-4 31,-5 63,-8 11,0 11,1 22,1 9,0 9,0 18,0 \"/><path stroke-width=\"10\" d=\"M776,224c5,0 5,0 9,0 \"/><path stroke-width=\"13\" d=\"M785,224c2,0 3,0 4,0 \"/></g></svg></svg>', 0, ''),
(108, 1, 3, 8, 5, '2025-04-21', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M245,159c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M245,159c0,2 0,2 0,3 \"/><path stroke-width=\"13\" d=\"M245,162c0,7 -1,7 0,14 \"/><path stroke-width=\"9\" d=\"M245,176c2,9 3,9 6,17 \"/><path stroke-width=\"8\" d=\"M251,193c4,13 4,13 9,26 5,12 5,11 11,23 8,14 8,14 16,28 4,9 4,9 8,18 8,15 8,15 16,30 9,16 8,16 18,32 6,11 8,10 14,20 \"/><path stroke-width=\"10\" d=\"M343,370c3,4 1,5 3,8 \"/><path stroke-width=\"13\" d=\"M346,378c1,1 2,1 3,0 \"/><path stroke-width=\"15\" d=\"M349,378c3,-3 4,-3 6,-7 \"/><path stroke-width=\"12\" d=\"M355,371c4,-9 3,-10 6,-20 \"/><path stroke-width=\"8\" d=\"M361,351c2,-9 3,-9 5,-17 \"/><path stroke-width=\"9\" d=\"M366,334c2,-7 3,-7 4,-14 2,-8 1,-9 2,-17 \"/><path stroke-width=\"8\" d=\"M372,303c3,-10 4,-10 6,-20 2,-10 2,-11 3,-21 2,-12 2,-12 3,-24 2,-13 2,-13 2,-27 0,-14 -1,-14 0,-28 1,-14 1,-14 3,-27 2,-15 3,-15 5,-29 \"/><path stroke-width=\"9\" d=\"M394,127c1,-6 0,-6 1,-12 \"/><path stroke-width=\"11\" d=\"M395,115c2,-4 2,-4 4,-7 \"/><path stroke-width=\"13\" d=\"M399,108c1,-2 2,-3 2,-3 \"/><path stroke-width=\"16\" d=\"M479,354c0,0 0,0 0,0 0,-5 -1,-5 0,-10 \"/><path stroke-width=\"12\" d=\"M479,344c1,-8 3,-8 5,-16 \"/><path stroke-width=\"9\" d=\"M484,328c2,-9 2,-9 3,-18 \"/><path stroke-width=\"8\" d=\"M487,310c2,-13 2,-13 2,-26 \"/><path stroke-width=\"9\" d=\"M489,284c1,-7 0,-7 0,-14 0,-16 -1,-16 0,-32 \"/><path stroke-width=\"8\" d=\"M489,238c1,-16 2,-16 3,-32 1,-18 0,-18 0,-36 0,-13 0,-13 0,-25 \"/><path stroke-width=\"9\" d=\"M492,145c0,-7 0,-7 0,-13 \"/><path stroke-width=\"12\" d=\"M492,132c0,-2 -1,-2 0,-4 \"/><path stroke-width=\"15\" d=\"M492,128c1,-1 2,-3 3,-2 \"/><path stroke-width=\"16\" d=\"M495,126c3,3 2,5 5,10 \"/><path stroke-width=\"14\" d=\"M500,136c2,3 3,3 5,7 \"/><path stroke-width=\"12\" d=\"M505,143c2,3 1,3 3,7 1,5 1,6 3,10 \"/><path stroke-width=\"11\" d=\"M511,160c2,5 3,5 5,9 3,4 3,4 6,8 \"/><path stroke-width=\"12\" d=\"M522,177c2,3 2,3 5,6 \"/><path stroke-width=\"11\" d=\"M527,183c4,4 6,3 9,7 3,4 0,7 2,10 \"/><path stroke-width=\"13\" d=\"M538,200c1,1 3,-2 3,-1 3,3 3,7 4,9 \"/><path stroke-width=\"14\" d=\"M545,208c1,1 0,-3 1,-3 \"/><path stroke-width=\"16\" d=\"M546,205c3,-1 5,1 8,0 \"/><path stroke-width=\"14\" d=\"M554,205c3,-1 3,-3 5,-6 \"/><path stroke-width=\"11\" d=\"M559,199c6,-6 7,-6 12,-13 \"/><path stroke-width=\"8\" d=\"M571,186c7,-11 7,-11 13,-23 4,-8 3,-8 6,-16 \"/><path stroke-width=\"9\" d=\"M590,147c3,-7 3,-7 5,-14 4,-12 4,-12 7,-24 \"/><path stroke-width=\"10\" d=\"M602,109c1,-4 0,-4 1,-8 \"/><path stroke-width=\"12\" d=\"M603,101c1,-4 0,-5 1,-8 \"/><path stroke-width=\"13\" d=\"M604,93c1,-2 2,-2 3,-2 \"/><path stroke-width=\"15\" d=\"M607,91c2,-1 3,1 3,0 \"/><path stroke-width=\"16\" d=\"M610,91c1,-1 -1,-3 -1,-3 \"/><path stroke-width=\"15\" d=\"M609,88c0,1 2,2 3,5 \"/><path stroke-width=\"12\" d=\"M612,93c2,6 2,6 2,12 \"/><path stroke-width=\"10\" d=\"M614,105c1,9 -1,9 0,19 \"/><path stroke-width=\"8\" d=\"M614,124c1,13 2,13 3,27 1,8 0,8 1,16 2,14 3,14 4,29 \"/><path stroke-width=\"9\" d=\"M622,196c1,6 0,6 0,12 1,13 1,13 2,26 \"/><path stroke-width=\"8\" d=\"M624,234c1,9 1,9 1,17 \"/><path stroke-width=\"9\" d=\"M625,251c0,7 -1,8 0,15 1,8 2,8 3,16 \"/><path stroke-width=\"10\" d=\"M628,282c0,6 0,6 0,12 \"/><path stroke-width=\"11\" d=\"M628,294c0,4 -1,4 0,8 \"/><path stroke-width=\"12\" d=\"M628,302c1,5 2,4 4,9 \"/><path stroke-width=\"11\" d=\"M632,311c1,5 1,5 2,10 \"/><path stroke-width=\"13\" d=\"M634,321c0,2 -1,2 -1,4 \"/><path stroke-width=\"15\" d=\"M633,325c0,1 0,1 0,2 0,2 0,2 0,4 0,1 0,1 0,3 0,1 -1,1 0,2 1,2 2,2 3,4 \"/><path stroke-width=\"13\" d=\"M636,340c1,4 0,4 0,8 \"/><path stroke-width=\"15\" d=\"M636,348c0,2 0,2 0,3 \"/></g></svg></svg>', 0, ''),
(109, 1, 5, 10, 9, '2025-04-21', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M318,175c0,0 0,0 0,0 \"/><path stroke-width=\"18\" d=\"M318,175c1,0 3,1 3,0 \"/><path stroke-width=\"16\" d=\"M321,175c-2,-3 -3,-5 -8,-8 \"/><path stroke-width=\"14\" d=\"M313,167c-2,-1 -2,0 -4,0 \"/><path stroke-width=\"13\" d=\"M309,167c-5,0 -5,0 -9,0 \"/><path stroke-width=\"12\" d=\"M300,167c-6,0 -6,0 -11,0 \"/><path stroke-width=\"11\" d=\"M289,167c-5,0 -5,0 -9,0 -7,0 -7,0 -14,0 \"/><path stroke-width=\"10\" d=\"M266,167c-6,0 -6,-1 -11,0 \"/><path stroke-width=\"11\" d=\"M255,167c-6,1 -6,0 -11,3 -4,2 -3,3 -6,6 -6,3 -6,2 -12,5 \"/><path stroke-width=\"10\" d=\"M226,181c-5,4 -5,4 -10,8 \"/><path stroke-width=\"11\" d=\"M216,189c-4,3 -4,3 -8,6 -3,3 -3,3 -5,6 -4,5 -4,5 -6,11 \"/><path stroke-width=\"12\" d=\"M197,212c-1,3 0,3 -1,6 \"/><path stroke-width=\"13\" d=\"M196,218c-1,4 -1,4 -2,8 \"/><path stroke-width=\"11\" d=\"M194,226c-1,6 -2,5 -3,11 \"/><path stroke-width=\"10\" d=\"M191,237c-1,7 0,8 0,15 0,6 0,6 0,12 \"/><path stroke-width=\"11\" d=\"M191,264c0,5 0,5 0,10 0,7 0,7 0,14 \"/><path stroke-width=\"10\" d=\"M191,288c0,5 0,5 0,10 \"/><path stroke-width=\"11\" d=\"M191,298c0,5 0,5 0,10 0,5 -1,6 0,11 1,5 2,5 3,9 1,7 0,8 2,14 1,3 4,2 6,6 \"/><path stroke-width=\"12\" d=\"M202,348c1,3 -1,4 0,8 \"/><path stroke-width=\"11\" d=\"M202,356c3,7 3,8 7,13 3,3 4,1 7,3 \"/><path stroke-width=\"13\" d=\"M216,372c2,2 2,2 3,4 3,4 2,5 6,8 \"/><path stroke-width=\"12\" d=\"M225,384c3,2 4,1 8,2 \"/><path stroke-width=\"11\" d=\"M233,386c6,1 6,1 12,3 \"/><path stroke-width=\"10\" d=\"M245,389c6,1 6,2 11,3 7,1 7,0 14,0 \"/><path stroke-width=\"9\" d=\"M270,392c9,0 9,0 18,0 10,0 10,0 20,0 \"/><path stroke-width=\"8\" d=\"M308,392c10,0 10,0 19,0 14,0 14,0 27,0 8,0 8,0 16,0 \"/><path stroke-width=\"10\" d=\"M370,392c5,0 5,1 10,0 \"/><path stroke-width=\"11\" d=\"M380,392c5,-2 5,-4 10,-7 \"/><path stroke-width=\"12\" d=\"M390,385c2,-1 2,-1 5,-2 \"/><path stroke-width=\"13\" d=\"M395,383c2,-1 2,-2 5,-3 \"/><path stroke-width=\"14\" d=\"M400,380c2,-1 3,-1 4,-2 \"/><path stroke-width=\"15\" d=\"M404,378c1,-1 -1,-2 0,-3 1,-1 2,-1 3,-2 1,0 2,-1 2,-1 \"/><path stroke-width=\"17\" d=\"M487,156c0,0 0,0 0,0 0,1 0,1 0,3 \"/><path stroke-width=\"14\" d=\"M487,159c0,5 0,5 0,10 \"/><path stroke-width=\"10\" d=\"M487,169c1,15 1,15 2,29 \"/><path stroke-width=\"8\" d=\"M489,198c1,9 1,9 2,18 2,14 3,14 4,29 1,9 -1,9 0,17 1,13 2,13 3,26 1,14 -1,14 0,28 0,9 1,9 2,19 0,9 -1,9 0,18 \"/><path stroke-width=\"9\" d=\"M500,353c1,6 1,6 3,12 \"/><path stroke-width=\"12\" d=\"M503,365c1,3 2,3 3,5 \"/><path stroke-width=\"15\" d=\"M492,140c0,0 0,0 0,0 \"/><path stroke-width=\"16\" d=\"M492,140c8,0 8,0 16,0 \"/><path stroke-width=\"12\" d=\"M508,140c10,0 10,0 20,0 \"/><path stroke-width=\"8\" d=\"M528,140c11,0 11,0 21,0 9,0 9,-1 18,0 \"/><path stroke-width=\"10\" d=\"M567,140c5,1 5,1 9,4 \"/><path stroke-width=\"11\" d=\"M576,144c5,2 6,1 9,5 \"/><path stroke-width=\"12\" d=\"M585,149c4,6 2,7 4,14 \"/><path stroke-width=\"11\" d=\"M589,163c2,6 2,6 4,11 \"/><path stroke-width=\"10\" d=\"M593,174c2,8 2,8 5,16 1,6 2,6 3,12 \"/><path stroke-width=\"11\" d=\"M601,202c1,4 0,4 0,7 0,7 0,7 0,14 0,4 0,4 0,8 \"/><path stroke-width=\"12\" d=\"M601,231c0,3 0,3 0,7 \"/><path stroke-width=\"13\" d=\"M601,238c0,3 0,3 0,6 \"/><path stroke-width=\"14\" d=\"M601,244c0,2 0,2 0,4 0,3 2,5 0,6 \"/><path stroke-width=\"13\" d=\"M601,254c-2,1 -4,-2 -7,-1 \"/><path stroke-width=\"12\" d=\"M594,253c-5,0 -5,1 -9,3 \"/><path stroke-width=\"13\" d=\"M585,256c-1,1 -1,2 -3,3 -4,1 -4,-1 -8,0 \"/><path stroke-width=\"11\" d=\"M574,259c-6,1 -6,2 -11,3 -6,1 -7,-1 -12,0 -4,0 -5,0 -8,2 \"/><path stroke-width=\"12\" d=\"M543,264c-4,2 -4,4 -8,4 \"/><path stroke-width=\"11\" d=\"M535,268c-5,1 -5,0 -11,-1 \"/><path stroke-width=\"14\" d=\"M524,267c0,0 0,0 0,0 \"/><path stroke-width=\"16\" d=\"M524,267c-1,0 -1,0 -3,0 -2,0 -2,-1 -4,0 -2,1 -1,1 -3,3 \"/><path stroke-width=\"15\" d=\"M514,270c-1,1 -1,1 -2,1 \"/><path stroke-width=\"16\" d=\"M512,271c0,1 -2,1 -1,1 5,4 6,5 13,8 \"/><path stroke-width=\"12\" d=\"M524,280c7,3 8,1 16,3 \"/><path stroke-width=\"9\" d=\"M540,283c14,3 14,4 27,8 \"/><path stroke-width=\"8\" d=\"M567,291c15,4 14,5 29,9 9,3 10,2 17,5 \"/><path stroke-width=\"11\" d=\"M613,305c2,0 1,2 1,3 \"/><path stroke-width=\"14\" d=\"M614,308c2,3 2,2 4,5 1,2 1,2 2,4 1,2 1,2 3,4 \"/><path stroke-width=\"13\" d=\"M623,321c3,3 4,2 7,5 1,1 1,2 2,2 \"/><path stroke-width=\"15\" d=\"M632,328c1,1 0,-1 1,-1 \"/><path stroke-width=\"16\" d=\"M633,327c1,0 2,1 3,2 \"/><path stroke-width=\"15\" d=\"M636,329c2,3 1,3 3,6 1,2 2,1 3,3 \"/><path stroke-width=\"13\" d=\"M642,338c2,4 0,5 2,9 1,1 2,0 3,1 \"/><path stroke-width=\"15\" d=\"M647,348c1,2 0,2 1,4 1,2 1,2 2,3 1,1 2,1 3,1 \"/></g></svg></svg>', 0, ''),
(110, 1, 5, 10, 9, '2025-04-23', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M411,159c0,0 0,0 0,0 0,-2 0,-2 0,-4 \"/><path stroke-width=\"15\" d=\"M411,155c0,-1 1,-2 0,-2 \"/><path stroke-width=\"12\" d=\"M411,153c-6,-6 -7,-5 -14,-11 \"/><path stroke-width=\"10\" d=\"M397,142c-4,-3 -4,-4 -9,-7 -7,-6 -7,-6 -15,-10 \"/><path stroke-width=\"9\" d=\"M373,125c-7,-4 -7,-3 -14,-7 \"/><path stroke-width=\"10\" d=\"M359,118c-6,-3 -6,-4 -12,-6 \"/><path stroke-width=\"11\" d=\"M347,112c-4,-1 -5,1 -10,0 -4,-1 -4,-2 -8,-3 \"/><path stroke-width=\"12\" d=\"M329,109c-3,-1 -3,-2 -6,-2 \"/><path stroke-width=\"13\" d=\"M323,107c-4,-1 -4,0 -7,0 \"/><path stroke-width=\"11\" d=\"M316,107c-8,0 -8,0 -16,0 \"/><path stroke-width=\"10\" d=\"M300,107c-5,0 -5,0 -11,0 \"/><path stroke-width=\"11\" d=\"M289,107c-5,0 -6,-1 -11,1 \"/><path stroke-width=\"10\" d=\"M278,108c-7,2 -6,4 -12,7 \"/><path stroke-width=\"9\" d=\"M266,115c-9,4 -10,2 -17,7 \"/><path stroke-width=\"8\" d=\"M249,122c-9,5 -9,6 -17,13 -8,5 -8,5 -15,11 -6,6 -6,6 -11,13 \"/><path stroke-width=\"9\" d=\"M206,159c-5,7 -6,7 -9,15 \"/><path stroke-width=\"10\" d=\"M197,174c-3,6 -1,6 -3,12 \"/><path stroke-width=\"9\" d=\"M194,186c-4,10 -7,9 -9,19 -2,7 2,8 1,15 -2,8 -5,8 -7,16 -1,8 1,8 1,16 0,8 0,8 0,17 0,9 0,9 0,18 0,7 0,7 0,15 0,11 -2,11 0,22 \"/><path stroke-width=\"8\" d=\"M180,324c1,9 2,9 5,17 \"/><path stroke-width=\"9\" d=\"M185,341c3,7 3,7 5,14 3,8 1,10 6,17 5,7 8,5 14,12 \"/><path stroke-width=\"10\" d=\"M210,384c3,3 2,4 5,8 \"/><path stroke-width=\"11\" d=\"M215,392c4,4 4,5 8,8 5,3 5,3 10,5 5,2 5,2 11,4 6,1 6,1 12,2 \"/><path stroke-width=\"10\" d=\"M256,411c9,1 9,1 18,2 \"/><path stroke-width=\"8\" d=\"M274,413c11,0 11,0 21,0 13,0 13,0 27,0 11,0 11,0 22,0 14,-1 14,1 27,-2 9,-2 9,-4 17,-7 \"/><path stroke-width=\"9\" d=\"M388,404c6,-3 6,-2 11,-6 \"/><path stroke-width=\"11\" d=\"M399,398c4,-2 3,-3 6,-6 \"/><path stroke-width=\"10\" d=\"M405,392c7,-8 7,-9 15,-16 \"/><path stroke-width=\"9\" d=\"M420,376c5,-4 7,-2 12,-7 5,-6 4,-7 7,-15 \"/><path stroke-width=\"11\" d=\"M439,354c2,-3 1,-4 3,-7 \"/><path stroke-width=\"13\" d=\"M442,347c1,-1 2,-2 2,-2 \"/><path stroke-width=\"16\" d=\"M498,115c0,0 0,0 0,0 1,6 1,6 2,13 \"/><path stroke-width=\"12\" d=\"M500,128c1,8 2,8 3,15 \"/><path stroke-width=\"9\" d=\"M503,143c2,13 2,13 4,25 \"/><path stroke-width=\"8\" d=\"M507,168c2,13 2,13 3,26 1,13 1,13 1,27 \"/><path stroke-width=\"9\" d=\"M511,221c0,7 0,7 0,14 1,16 1,16 3,31 \"/><path stroke-width=\"8\" d=\"M514,266c1,14 2,14 3,28 1,11 -1,12 0,23 1,11 2,11 2,22 1,13 -1,13 0,26 \"/><path stroke-width=\"10\" d=\"M519,365c0,3 2,3 3,6 \"/><path stroke-width=\"13\" d=\"M522,371c0,2 0,2 0,3 \"/><path stroke-width=\"16\" d=\"M522,374c0,1 0,1 0,1 \"/><path stroke-width=\"17\" d=\"M506,115c0,0 0,0 0,0 \"/><path stroke-width=\"18\" d=\"M506,115c1,0 1,0 2,0 \"/><path stroke-width=\"15\" d=\"M508,115c2,-2 2,-4 4,-5 \"/><path stroke-width=\"14\" d=\"M512,110c2,0 2,2 3,2 \"/><path stroke-width=\"15\" d=\"M515,112c1,0 1,-1 2,-2 \"/><path stroke-width=\"14\" d=\"M517,110c4,-3 4,-3 9,-4 \"/><path stroke-width=\"11\" d=\"M526,106c6,-2 6,-1 12,-2 \"/><path stroke-width=\"9\" d=\"M538,104c10,-2 10,-3 20,-5 6,-1 6,-1 13,-2 8,-2 8,-3 17,-4 \"/><path stroke-width=\"10\" d=\"M588,93c6,-1 6,0 12,0 \"/><path stroke-width=\"12\" d=\"M600,93c3,0 3,0 6,0 \"/><path stroke-width=\"14\" d=\"M606,93c1,0 1,0 1,0 \"/><path stroke-width=\"17\" d=\"M607,93c1,0 1,-1 2,0 \"/><path stroke-width=\"16\" d=\"M609,93c3,2 3,3 5,6 \"/><path stroke-width=\"14\" d=\"M614,99c2,3 1,3 3,7 \"/><path stroke-width=\"12\" d=\"M617,106c2,5 3,4 5,9 \"/><path stroke-width=\"11\" d=\"M622,115c2,4 2,4 3,9 1,5 1,5 2,11 \"/><path stroke-width=\"12\" d=\"M627,135c0,2 0,2 1,5 1,5 2,4 3,10 \"/><path stroke-width=\"11\" d=\"M631,150c1,5 0,5 0,11 \"/><path stroke-width=\"12\" d=\"M631,161c0,3 0,3 0,6 0,4 0,4 0,9 \"/><path stroke-width=\"14\" d=\"M631,176c0,1 0,1 0,2 \"/><path stroke-width=\"15\" d=\"M631,178c0,2 0,2 0,3 \"/><path stroke-width=\"14\" d=\"M631,181c0,3 0,3 0,6 \"/><path stroke-width=\"15\" d=\"M631,187c0,2 0,2 0,4 \"/><path stroke-width=\"16\" d=\"M631,191c-1,2 -1,2 -2,5 \"/><path stroke-width=\"14\" d=\"M629,196c-2,2 -1,3 -3,5 \"/><path stroke-width=\"13\" d=\"M626,201c-2,2 -3,2 -6,4 -3,2 -3,2 -6,5 -2,2 -2,1 -5,3 \"/><path stroke-width=\"12\" d=\"M609,213c-6,4 -6,3 -12,7 \"/><path stroke-width=\"11\" d=\"M597,220c-3,2 -2,3 -4,5 \"/><path stroke-width=\"12\" d=\"M593,225c-5,3 -5,2 -10,5 -2,1 -3,1 -5,3 \"/><path stroke-width=\"13\" d=\"M578,233c-2,1 -2,2 -4,4 -2,2 -2,2 -4,3 \"/><path stroke-width=\"14\" d=\"M570,240c-2,1 -3,-1 -4,0 -3,1 -3,1 -5,3 -2,2 -1,4 -3,4 0,1 0,-1 -1,-2 \"/><path stroke-width=\"16\" d=\"M557,245c-1,-1 -1,-1 -2,0 \"/><path stroke-width=\"15\" d=\"M555,245c-2,2 -2,2 -5,4 \"/><path stroke-width=\"14\" d=\"M550,249c0,1 0,2 -1,3 -2,1 -4,0 -6,1 \"/><path stroke-width=\"15\" d=\"M543,253c-1,1 2,2 1,3 -1,1 -3,-1 -5,0 -1,1 0,2 -1,3 \"/><path stroke-width=\"16\" d=\"M538,259c-2,1 -3,-1 -4,0 -1,0 -1,1 -1,3 0,1 -1,1 0,1 \"/><path stroke-width=\"17\" d=\"M533,263c4,1 5,0 10,-1 1,0 1,0 2,0 \"/><path stroke-width=\"15\" d=\"M545,262c3,0 3,0 5,0 \"/><path stroke-width=\"13\" d=\"M550,262c4,0 4,0 8,0 2,0 2,-1 3,0 \"/><path stroke-width=\"14\" d=\"M561,262c3,1 2,2 5,3 2,1 3,-1 5,0 \"/><path stroke-width=\"13\" d=\"M571,265c3,2 3,3 6,5 \"/><path stroke-width=\"12\" d=\"M577,270c4,3 4,4 9,7 \"/><path stroke-width=\"10\" d=\"M586,277c6,4 6,4 13,8 \"/><path stroke-width=\"11\" d=\"M599,285c3,2 4,1 7,4 \"/><path stroke-width=\"13\" d=\"M606,289c1,1 -1,2 0,3 2,3 3,2 6,5 1,1 1,2 2,3 \"/><path stroke-width=\"15\" d=\"M614,300c1,1 2,0 4,2 \"/><path stroke-width=\"14\" d=\"M618,302c1,2 0,3 1,5 1,2 2,1 2,2 2,3 1,4 2,6 \"/><path stroke-width=\"13\" d=\"M623,315c2,3 2,3 4,5 2,3 2,3 4,6 \"/><path stroke-width=\"14\" d=\"M631,326c1,1 1,1 2,3 \"/><path stroke-width=\"15\" d=\"M633,329c0,1 -1,1 0,3 1,1 2,1 3,2 \"/><path stroke-width=\"14\" d=\"M636,334c2,3 1,3 3,6 1,1 1,1 2,3 \"/><path stroke-width=\"15\" d=\"M641,343c0,1 -1,2 0,3 1,2 2,1 4,2 \"/><path stroke-width=\"14\" d=\"M645,348c2,2 2,2 3,4 \"/><path stroke-width=\"15\" d=\"M648,352c1,2 1,2 1,4 1,2 0,3 1,4 1,2 3,0 4,1 \"/><path stroke-width=\"14\" d=\"M654,361c1,2 0,3 1,5 \"/><path stroke-width=\"15\" d=\"M655,366c0,1 0,1 0,2 \"/><path stroke-width=\"14\" d=\"M655,368c2,3 2,4 5,7 \"/><path stroke-width=\"13\" d=\"M660,375c1,1 3,-2 4,0 3,3 2,4 3,9 \"/><path stroke-width=\"14\" d=\"M667,384c1,1 0,1 0,2 \"/><path stroke-width=\"15\" d=\"M667,386c1,2 1,3 2,3 1,1 2,-1 3,0 1,1 0,2 1,3 \"/><path stroke-width=\"16\" d=\"M673,392c0,1 1,1 1,1 0,2 0,2 0,3 0,1 0,2 0,2 \"/></g></svg>', 0, ''),
(111, 1, 5, 10, 9, '2025-04-23', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M362,74c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M362,74c-6,0 -6,0 -11,0 \"/><path stroke-width=\"14\" d=\"M351,74c-6,0 -6,-1 -11,0 \"/><path stroke-width=\"11\" d=\"M340,74c-5,1 -5,3 -10,4 \"/><path stroke-width=\"12\" d=\"M330,78c-3,2 -3,1 -7,2 \"/><path stroke-width=\"11\" d=\"M323,80c-7,1 -7,1 -14,3 \"/><path stroke-width=\"10\" d=\"M309,83c-6,2 -6,2 -12,4 -7,3 -7,3 -14,6 -6,2 -6,2 -12,4 -5,3 -5,3 -10,7 -5,3 -4,3 -9,7 -6,5 -6,5 -11,9 \"/><path stroke-width=\"11\" d=\"M241,120c-4,3 -4,2 -7,6 \"/><path stroke-width=\"10\" d=\"M234,126c-4,6 -4,7 -7,14 \"/><path stroke-width=\"9\" d=\"M227,140c-2,7 -1,8 -4,14 \"/><path stroke-width=\"10\" d=\"M223,154c-4,6 -7,5 -9,11 -2,6 1,7 1,14 0,7 0,7 0,15 -1,7 -2,7 -2,14 \"/><path stroke-width=\"9\" d=\"M213,208c-1,10 0,10 0,20 0,6 0,6 0,12 \"/><path stroke-width=\"10\" d=\"M213,240c0,7 0,7 0,14 \"/><path stroke-width=\"11\" d=\"M213,254c0,5 0,5 0,9 0,6 -1,6 0,11 1,5 1,5 3,9 3,6 3,6 6,12 2,3 3,3 6,6 4,6 3,7 8,13 3,3 4,1 8,3 \"/><path stroke-width=\"12\" d=\"M244,317c2,2 1,3 4,5 \"/><path stroke-width=\"11\" d=\"M248,322c7,4 7,4 15,8 \"/><path stroke-width=\"10\" d=\"M263,330c6,3 6,4 12,6 7,2 7,1 14,3 6,1 6,2 13,4 6,2 6,1 13,3 \"/><path stroke-width=\"11\" d=\"M315,346c4,1 4,1 8,2 \"/><path stroke-width=\"13\" d=\"M323,348c3,0 3,-1 5,0 4,1 4,2 7,3 \"/><path stroke-width=\"12\" d=\"M335,351c4,1 4,0 9,0 \"/><path stroke-width=\"10\" d=\"M344,351c8,0 8,0 17,0 \"/><path stroke-width=\"9\" d=\"M361,351c8,0 8,0 16,0 9,0 9,1 18,0 7,-1 7,-3 14,-5 \"/><path stroke-width=\"11\" d=\"M409,346c4,-1 4,0 7,-2 5,-2 5,-3 9,-7 \"/><path stroke-width=\"12\" d=\"M425,337c2,-2 2,-3 4,-4 \"/><path stroke-width=\"14\" d=\"M429,333c1,-1 1,-1 3,-1 \"/><path stroke-width=\"16\" d=\"M432,332c0,0 1,0 1,0 1,-1 1,-1 2,-3 \"/><path stroke-width=\"17\" d=\"M435,329c0,-1 0,-1 0,-2 \"/><path stroke-width=\"17\" d=\"M511,80c0,0 0,0 0,0 0,5 0,5 0,10 \"/><path stroke-width=\"14\" d=\"M511,90c0,3 0,3 0,5 \"/><path stroke-width=\"13\" d=\"M511,95c0,5 0,5 0,9 \"/><path stroke-width=\"11\" d=\"M511,104c0,9 0,9 0,18 \"/><path stroke-width=\"9\" d=\"M511,122c0,8 0,8 0,17 \"/><path stroke-width=\"10\" d=\"M511,139c0,5 0,5 0,11 \"/><path stroke-width=\"9\" d=\"M511,150c0,10 0,10 0,20 \"/><path stroke-width=\"10\" d=\"M511,170c0,5 0,5 0,9 0,9 0,9 0,18 \"/><path stroke-width=\"9\" d=\"M511,197c0,10 0,10 0,20 0,8 0,8 0,17 0,6 0,6 0,12 \"/><path stroke-width=\"11\" d=\"M511,246c0,4 0,4 0,8 0,6 0,6 0,12 \"/><path stroke-width=\"10\" d=\"M511,266c0,7 0,7 0,14 \"/><path stroke-width=\"11\" d=\"M511,280c0,4 0,4 0,8 \"/><path stroke-width=\"12\" d=\"M511,288c0,4 0,4 0,8 \"/><path stroke-width=\"13\" d=\"M511,296c0,2 0,2 0,4 \"/><path stroke-width=\"15\" d=\"M511,300c0,1 0,1 0,3 0,3 0,3 0,7 \"/><path stroke-width=\"14\" d=\"M511,310c0,3 0,3 0,6 0,2 0,2 0,3 0,3 0,3 0,6 \"/><path stroke-width=\"16\" d=\"M519,80c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M519,80c0,-2 -1,-3 0,-3 \"/><path stroke-width=\"14\" d=\"M519,77c5,-1 6,0 12,0 \"/><path stroke-width=\"10\" d=\"M531,77c7,0 7,-1 14,0 \"/><path stroke-width=\"9\" d=\"M545,77c11,2 11,4 22,7 \"/><path stroke-width=\"8\" d=\"M567,84c17,5 18,3 33,9 11,4 9,7 19,12 8,5 9,4 17,8 \"/><path stroke-width=\"9\" d=\"M636,113c6,3 9,3 12,6 \"/><path stroke-width=\"12\" d=\"M648,119c1,1 -4,1 -4,2 \"/><path stroke-width=\"14\" d=\"M644,121c0,1 2,1 3,2 1,3 -1,4 0,6 1,2 2,1 3,2 \"/><path stroke-width=\"15\" d=\"M650,131c1,1 0,2 1,4 \"/><path stroke-width=\"14\" d=\"M651,135c0,3 1,3 1,6 \"/><path stroke-width=\"13\" d=\"M652,141c0,3 0,3 0,5 \"/><path stroke-width=\"14\" d=\"M652,146c0,3 0,3 0,5 \"/><path stroke-width=\"13\" d=\"M652,151c0,4 0,4 0,9 0,2 1,3 0,5 \"/><path stroke-width=\"12\" d=\"M652,165c-2,4 -3,4 -6,8 -2,2 -2,2 -4,4 -4,3 -4,3 -8,5 \"/><path stroke-width=\"11\" d=\"M634,182c-4,2 -4,2 -9,4 \"/><path stroke-width=\"12\" d=\"M625,186c-4,1 -5,0 -9,1 \"/><path stroke-width=\"11\" d=\"M616,187c-7,3 -7,4 -14,6 -4,1 -4,0 -8,1 -5,1 -5,3 -10,5 -6,2 -7,0 -13,3 -4,2 -4,4 -8,5 -4,1 -5,0 -9,0 \"/><path stroke-width=\"12\" d=\"M554,207c-4,0 -5,-1 -9,0 \"/><path stroke-width=\"11\" d=\"M545,207c-5,1 -5,2 -9,3 \"/><path stroke-width=\"13\" d=\"M536,210c-2,0 -2,0 -4,0 \"/><path stroke-width=\"16\" d=\"M532,210c-1,0 -3,-1 -2,0 \"/><path stroke-width=\"17\" d=\"M530,210c5,4 6,6 13,9 \"/><path stroke-width=\"13\" d=\"M543,219c9,2 10,-1 19,1 \"/><path stroke-width=\"8\" d=\"M562,220c15,3 15,4 30,8 16,4 16,5 33,9 7,2 8,0 15,3 \"/><path stroke-width=\"10\" d=\"M640,240c4,2 3,4 6,7 \"/><path stroke-width=\"12\" d=\"M646,247c3,3 2,3 5,6 \"/><path stroke-width=\"14\" d=\"M651,253c2,2 3,1 5,4 2,3 1,4 2,7 1,2 1,1 2,3 2,3 2,3 3,5 0,2 -1,2 0,3 1,4 1,4 3,7 1,1 3,0 3,1 \"/><path stroke-width=\"16\" d=\"M669,283c1,3 0,3 0,6 0,1 0,1 0,2 \"/><path stroke-width=\"15\" d=\"M669,291c0,4 0,4 0,7 \"/><path stroke-width=\"14\" d=\"M669,298c0,1 0,1 0,3 \"/><path stroke-width=\"16\" d=\"M669,301c0,1 0,1 0,2 \"/><path stroke-width=\"15\" d=\"M669,303c0,3 0,3 0,7 0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M669,310c0,1 0,1 0,3 0,1 0,1 0,3 \"/><path stroke-width=\"16\" d=\"M669,316c0,2 0,2 2,5 0,0 1,0 1,1 0,1 -1,1 -1,3 0,2 -1,2 0,3 1,1 2,0 3,1 1,2 -1,3 0,6 \"/><path stroke-width=\"15\" d=\"M674,335c1,4 1,4 3,8 \"/></g></svg></svg>', 0, ''),
(112, 1, 5, 10, 9, '2025-04-23', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M373,145c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M373,145c0,-3 0,-3 0,-7 \"/><path stroke-width=\"15\" d=\"M373,138c0,-3 1,-4 0,-6 \"/><path stroke-width=\"13\" d=\"M373,132c-1,-2 -2,-1 -5,-2 \"/><path stroke-width=\"12\" d=\"M368,130c-6,-3 -6,-4 -12,-6 \"/><path stroke-width=\"10\" d=\"M356,124c-6,-2 -6,-1 -12,-3 \"/><path stroke-width=\"11\" d=\"M344,121c-4,-1 -4,-1 -9,-3 -6,-3 -5,-5 -11,-6 \"/><path stroke-width=\"10\" d=\"M324,112c-6,-2 -6,0 -12,0 \"/><path stroke-width=\"12\" d=\"M312,112c-3,0 -3,0 -6,0 \"/><path stroke-width=\"13\" d=\"M306,112c-4,0 -4,0 -7,0 \"/><path stroke-width=\"11\" d=\"M299,112c-8,0 -8,-2 -15,0 \"/><path stroke-width=\"10\" d=\"M284,112c-7,1 -6,3 -13,6 \"/><path stroke-width=\"9\" d=\"M271,118c-8,3 -8,3 -16,7 -6,3 -6,3 -11,7 \"/><path stroke-width=\"10\" d=\"M244,132c-5,5 -5,5 -9,11 \"/><path stroke-width=\"9\" d=\"M235,143c-5,7 -5,7 -10,14 -5,6 -5,5 -9,11 \"/><path stroke-width=\"10\" d=\"M216,168c-5,6 -6,5 -9,12 \"/><path stroke-width=\"9\" d=\"M207,180c-4,7 -3,8 -5,16 -2,9 -2,9 -3,18 -2,9 -2,9 -3,19 -1,6 -2,6 -2,13 -1,10 0,10 0,20 \"/><path stroke-width=\"8\" d=\"M194,266c0,9 0,9 0,19 0,9 0,9 0,18 \"/><path stroke-width=\"10\" d=\"M194,303c0,6 0,6 0,12 0,8 -1,9 1,16 \"/><path stroke-width=\"9\" d=\"M195,331c2,8 4,7 7,14 \"/><path stroke-width=\"10\" d=\"M202,345c2,5 1,6 4,10 \"/><path stroke-width=\"11\" d=\"M206,355c4,5 4,5 9,9 2,2 3,1 6,3 \"/><path stroke-width=\"12\" d=\"M221,367c3,2 2,4 6,6 \"/><path stroke-width=\"11\" d=\"M227,373c7,4 8,4 16,5 \"/><path stroke-width=\"9\" d=\"M243,378c10,2 10,-1 21,0 \"/><path stroke-width=\"8\" d=\"M264,378c14,1 14,2 28,3 9,0 9,0 18,0 11,0 11,-1 22,0 9,1 9,2 19,3 \"/><path stroke-width=\"10\" d=\"M351,384c4,0 4,0 9,0 \"/><path stroke-width=\"12\" d=\"M360,384c4,0 4,1 8,1 \"/><path stroke-width=\"13\" d=\"M368,385c3,1 3,1 5,1 4,0 4,0 7,0 2,0 2,0 4,0 \"/><path stroke-width=\"14\" d=\"M384,386c4,0 4,0 7,0 2,0 2,0 3,0 \"/><path stroke-width=\"15\" d=\"M394,386c2,-1 3,-1 3,-2 1,-2 -1,-3 0,-4 1,0 3,2 4,1 \"/><path stroke-width=\"16\" d=\"M401,381c0,-1 -2,-2 -1,-3 \"/><path stroke-width=\"17\" d=\"M400,378c1,-1 1,0 3,0 \"/><path stroke-width=\"18\" d=\"M481,118c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M481,118c0,2 0,2 0,5 \"/><path stroke-width=\"14\" d=\"M481,123c0,4 0,4 0,8 \"/><path stroke-width=\"11\" d=\"M481,131c0,8 0,8 0,17 \"/><path stroke-width=\"9\" d=\"M481,148c0,10 0,10 0,20 \"/><path stroke-width=\"8\" d=\"M481,168c0,11 0,11 0,21 0,10 0,10 0,20 0,16 0,16 0,31 0,18 0,18 0,35 0,15 0,15 0,29 0,8 0,8 0,16 \"/><path stroke-width=\"9\" d=\"M481,320c0,7 0,7 0,13 \"/><path stroke-width=\"11\" d=\"M481,333c0,5 0,5 0,9 \"/><path stroke-width=\"13\" d=\"M481,342c0,2 0,2 0,4 \"/><path stroke-width=\"15\" d=\"M481,346c0,1 0,1 0,1 \"/><path stroke-width=\"17\" d=\"M481,347c0,1 0,1 0,1 \"/><path stroke-width=\"16\" d=\"M481,348c0,2 0,2 0,4 \"/><path stroke-width=\"14\" d=\"M481,352c0,2 0,2 0,4 \"/><path stroke-width=\"15\" d=\"M481,356c0,2 0,2 0,3 \"/><path stroke-width=\"17\" d=\"M479,112c0,0 0,0 0,0 \"/><path stroke-width=\"18\" d=\"M479,112c0,-1 -1,-2 0,-2 \"/><path stroke-width=\"17\" d=\"M479,110c0,-1 1,0 2,0 \"/><path stroke-width=\"13\" d=\"M481,110c9,0 9,0 18,0 \"/><path stroke-width=\"10\" d=\"M499,110c6,0 6,0 13,0 \"/><path stroke-width=\"9\" d=\"M512,110c10,0 10,0 21,0 \"/><path stroke-width=\"8\" d=\"M533,110c9,0 9,0 18,0 \"/><path stroke-width=\"10\" d=\"M551,110c3,0 3,0 7,0 \"/><path stroke-width=\"14\" d=\"M558,110c1,0 1,0 3,0 \"/><path stroke-width=\"15\" d=\"M561,110c1,1 2,1 3,2 1,1 0,1 1,2 \"/><path stroke-width=\"13\" d=\"M565,114c4,7 5,6 9,13 \"/><path stroke-width=\"11\" d=\"M574,127c2,4 3,4 4,8 \"/><path stroke-width=\"12\" d=\"M578,135c1,3 0,4 1,7 2,4 3,4 4,9 2,4 1,4 1,8 0,5 0,5 0,9 \"/><path stroke-width=\"11\" d=\"M584,168c0,5 0,5 0,10 0,5 0,5 0,9 \"/><path stroke-width=\"13\" d=\"M584,187c0,3 0,3 0,5 \"/><path stroke-width=\"14\" d=\"M584,192c0,3 0,3 0,5 \"/><path stroke-width=\"13\" d=\"M584,197c-1,4 0,4 -2,7 -2,3 -3,2 -5,4 -2,2 -1,3 -3,4 -3,3 -3,2 -5,5 -2,2 -2,2 -4,4 \"/><path stroke-width=\"14\" d=\"M565,221c-1,0 -2,-1 -3,0 -4,2 -3,3 -7,5 -1,1 -2,-1 -3,0 -3,1 -2,3 -5,4 -1,1 -1,-2 -2,-1 -3,1 -3,3 -6,4 \"/><path stroke-width=\"13\" d=\"M539,233c-2,1 -2,0 -5,0 -3,0 -3,1 -6,1 \"/><path stroke-width=\"12\" d=\"M528,234c-5,0 -5,0 -9,0 \"/><path stroke-width=\"13\" d=\"M519,234c-3,0 -3,-1 -5,0 \"/><path stroke-width=\"14\" d=\"M514,234c-2,1 -2,1 -3,2 \"/><path stroke-width=\"15\" d=\"M511,236c-1,1 1,2 0,2 \"/><path stroke-width=\"17\" d=\"M511,238c-1,1 -2,-2 -3,-1 -1,0 -1,2 0,3 3,3 4,3 8,4 \"/><path stroke-width=\"12\" d=\"M516,244c13,4 14,2 27,6 \"/><path stroke-width=\"8\" d=\"M543,250c17,5 16,5 33,11 12,5 12,6 24,11 8,3 9,2 17,6 \"/><path stroke-width=\"9\" d=\"M617,278c7,3 7,4 14,8 \"/><path stroke-width=\"10\" d=\"M631,286c5,3 5,3 9,6 \"/><path stroke-width=\"12\" d=\"M640,292c2,2 2,2 4,5 \"/><path stroke-width=\"13\" d=\"M644,297c2,3 2,3 3,6 \"/><path stroke-width=\"12\" d=\"M647,303c2,5 2,5 4,10 \"/><path stroke-width=\"11\" d=\"M651,313c2,5 1,5 3,10 1,5 3,5 4,9 1,6 0,6 1,12 \"/><path stroke-width=\"10\" d=\"M659,344c2,6 2,6 4,13 2,6 2,6 3,12 \"/><path stroke-width=\"11\" d=\"M666,369c1,4 0,4 0,8 0,6 -1,6 0,12 1,4 4,4 5,8 2,6 0,6 0,12 0,6 0,6 0,12 \"/><path stroke-width=\"13\" d=\"M671,421c0,1 0,1 0,2 \"/><path stroke-width=\"15\" d=\"M671,423c0,2 0,2 0,3 \"/><path stroke-width=\"16\" d=\"M671,426c0,1 0,1 0,2 0,1 -1,2 0,2 1,0 1,0 3,0 \"/></g></svg></svg>', 0, ''),
(113, 1, 5, 10, 9, '2025-04-23', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M378,150c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M378,150c-3,-1 -2,-2 -5,-2 \"/><path stroke-width=\"15\" d=\"M373,148c-3,-1 -3,0 -7,0 \"/><path stroke-width=\"12\" d=\"M366,148c-6,-1 -6,-2 -12,-3 \"/><path stroke-width=\"10\" d=\"M354,145c-7,-2 -7,-2 -13,-3 -6,-1 -6,0 -11,0 \"/><path stroke-width=\"11\" d=\"M330,142c-7,0 -7,0 -13,0 \"/><path stroke-width=\"10\" d=\"M317,142c-8,0 -8,-2 -15,0 -6,1 -6,2 -11,5 -7,4 -7,4 -15,8 -5,3 -6,2 -11,5 -7,4 -8,4 -14,9 \"/><path stroke-width=\"9\" d=\"M251,169c-6,5 -5,6 -11,12 -7,6 -8,4 -15,11 -4,5 -4,5 -8,11 -5,9 -6,8 -9,18 \"/><path stroke-width=\"8\" d=\"M208,221c-3,9 -1,9 -2,19 -2,10 -3,10 -4,20 -1,11 0,11 0,22 0,10 0,10 0,20 0,11 0,11 0,22 0,14 -1,14 0,27 \"/><path stroke-width=\"9\" d=\"M202,351c0,7 0,7 2,13 3,13 5,12 9,25 \"/><path stroke-width=\"8\" d=\"M213,389c3,10 2,10 5,20 4,9 5,8 9,16 \"/><path stroke-width=\"9\" d=\"M227,425c3,6 2,6 6,11 \"/><path stroke-width=\"10\" d=\"M233,436c4,6 4,6 8,11 5,6 4,6 10,11 \"/><path stroke-width=\"11\" d=\"M251,458c3,2 3,2 6,3 \"/><path stroke-width=\"12\" d=\"M257,461c6,2 5,3 11,4 \"/><path stroke-width=\"11\" d=\"M268,465c6,1 6,0 12,0 \"/><path stroke-width=\"9\" d=\"M280,465c13,0 13,0 26,0 \"/><path stroke-width=\"8\" d=\"M306,465c14,-1 14,-1 29,-3 13,-1 13,-2 25,-5 10,-2 11,-1 21,-3 8,-2 8,-2 17,-6 \"/><path stroke-width=\"9\" d=\"M398,448c7,-2 7,-2 14,-6 \"/><path stroke-width=\"10\" d=\"M412,442c6,-2 6,-2 11,-5 5,-4 5,-4 9,-9 \"/><path stroke-width=\"11\" d=\"M432,428c3,-3 3,-3 5,-6 5,-6 5,-6 9,-12 2,-3 2,-3 3,-6 \"/><path stroke-width=\"12\" d=\"M449,404c2,-5 2,-5 4,-9 \"/><path stroke-width=\"13\" d=\"M453,395c1,-2 1,-2 1,-4 0,-4 0,-6 0,-8 \"/><path stroke-width=\"15\" d=\"M470,140c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M470,140c1,1 2,0 3,2 \"/><path stroke-width=\"13\" d=\"M473,142c3,7 2,8 4,16 \"/><path stroke-width=\"9\" d=\"M477,158c1,10 1,10 2,21 1,8 0,8 1,17 \"/><path stroke-width=\"8\" d=\"M480,196c2,12 3,12 5,25 4,19 3,19 6,39 4,29 4,29 8,58 2,14 1,14 3,28 3,21 3,21 6,43 2,18 4,18 6,36 1,14 -1,14 0,28 1,9 2,9 3,17 \"/><path stroke-width=\"9\" d=\"M517,470c1,7 -1,7 0,13 \"/><path stroke-width=\"12\" d=\"M517,483c0,3 1,3 2,5 \"/><path stroke-width=\"15\" d=\"M519,488c0,0 0,1 0,1 \"/><path stroke-width=\"16\" d=\"M519,489c-1,-11 -1,-12 -2,-24 \"/><path stroke-width=\"16\" d=\"M465,142c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M465,142c5,0 5,0 9,-1 \"/><path stroke-width=\"13\" d=\"M474,141c6,0 6,-1 12,-1 \"/><path stroke-width=\"9\" d=\"M486,140c13,-1 13,-1 26,-2 \"/><path stroke-width=\"8\" d=\"M512,138c9,0 9,-1 19,-1 9,0 9,0 19,0 \"/><path stroke-width=\"9\" d=\"M550,137c8,0 8,0 16,0 \"/><path stroke-width=\"11\" d=\"M566,137c3,0 4,-1 7,0 \"/><path stroke-width=\"14\" d=\"M573,137c1,0 0,2 1,3 2,3 4,2 5,5 \"/><path stroke-width=\"12\" d=\"M579,145c3,5 1,6 3,11 \"/><path stroke-width=\"10\" d=\"M582,156c2,6 2,6 5,12 3,6 4,5 5,11 \"/><path stroke-width=\"9\" d=\"M592,179c3,10 2,11 3,21 \"/><path stroke-width=\"10\" d=\"M595,200c0,4 0,4 0,8 \"/><path stroke-width=\"11\" d=\"M595,208c0,5 0,5 0,10 0,7 0,7 0,13 \"/><path stroke-width=\"10\" d=\"M595,231c0,6 0,6 0,13 0,5 1,6 0,11 -2,10 -4,9 -8,19 -1,3 -1,4 -3,7 -5,7 -5,7 -11,14 \"/><path stroke-width=\"9\" d=\"M573,295c-4,5 -5,5 -9,11 \"/><path stroke-width=\"10\" d=\"M564,306c-5,6 -4,6 -9,12 -3,4 -4,3 -8,8 \"/><path stroke-width=\"12\" d=\"M547,326c-1,1 -1,1 -3,3 \"/><path stroke-width=\"13\" d=\"M544,329c-2,4 -2,5 -5,7 0,1 -1,0 -2,0 \"/><path stroke-width=\"14\" d=\"M537,336c-3,0 -3,0 -5,1 \"/><path stroke-width=\"13\" d=\"M532,337c-4,1 -4,2 -7,4 \"/><path stroke-width=\"14\" d=\"M525,341c-2,1 -1,1 -3,2 \"/><path stroke-width=\"15\" d=\"M522,343c-2,0 -2,0 -5,0 \"/><path stroke-width=\"16\" d=\"M517,343c0,0 0,0 0,0 \"/><path stroke-width=\"15\" d=\"M517,343c-3,0 -3,0 -7,0 -1,0 -3,0 -2,0 \"/><path stroke-width=\"16\" d=\"M508,343c8,0 10,0 20,0 \"/><path stroke-width=\"12\" d=\"M528,343c10,0 10,0 19,0 \"/><path stroke-width=\"8\" d=\"M547,343c16,0 16,-2 31,0 16,3 16,4 33,10 9,3 9,3 17,7 \"/><path stroke-width=\"9\" d=\"M628,360c5,3 5,3 10,6 \"/><path stroke-width=\"11\" d=\"M638,366c4,3 4,3 8,7 \"/><path stroke-width=\"10\" d=\"M646,373c4,5 4,5 8,11 \"/><path stroke-width=\"11\" d=\"M654,384c3,4 3,3 6,8 3,5 3,5 6,10 2,4 1,5 3,9 2,7 3,7 5,14 \"/><path stroke-width=\"10\" d=\"M674,425c2,5 1,5 3,11 2,7 2,8 5,15 \"/><path stroke-width=\"9\" d=\"M682,451c3,8 4,8 7,17 2,7 0,7 2,14 \"/><path stroke-width=\"10\" d=\"M691,482c2,6 4,6 5,12 2,8 1,9 1,17 1,5 0,5 1,10 \"/><path stroke-width=\"11\" d=\"M698,521c1,5 2,5 3,10 \"/><path stroke-width=\"13\" d=\"M701,531c0,2 0,3 0,3 \"/></g></svg>', 0, '');
INSERT INTO `auditoria` (`IdAuditoria`, `IdSupervisor`, `IdOperario`, `IdActividad`, `IdLinea`, `Fecha`, `Firma`, `NoConforme`, `Comentario`) VALUES
(114, 1, 5, 10, 9, '2025-04-23', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M362,134c0,0 0,0 0,0 \"/><path stroke-width=\"18\" d=\"M362,134c-1,-2 0,-3 -2,-4 \"/><path stroke-width=\"15\" d=\"M360,130c-3,-3 -4,-2 -8,-3 \"/><path stroke-width=\"12\" d=\"M352,127c-3,-2 -3,-3 -6,-4 -5,-2 -5,-1 -11,-2 -3,0 -3,0 -6,0 \"/><path stroke-width=\"11\" d=\"M329,121c-7,-1 -7,-2 -15,-4 \"/><path stroke-width=\"12\" d=\"M314,117c-1,0 0,1 -1,1 \"/><path stroke-width=\"14\" d=\"M313,118c-4,0 -4,0 -8,0 \"/><path stroke-width=\"13\" d=\"M305,118c-4,0 -4,-1 -8,0 \"/><path stroke-width=\"12\" d=\"M297,118c-4,1 -4,1 -8,4 \"/><path stroke-width=\"11\" d=\"M289,122c-4,2 -4,3 -8,6 -4,2 -5,2 -9,5 \"/><path stroke-width=\"12\" d=\"M272,133c-3,2 -3,2 -6,5 \"/><path stroke-width=\"10\" d=\"M266,138c-9,8 -10,7 -17,16 -2,2 0,3 -1,6 \"/><path stroke-width=\"11\" d=\"M248,160c-2,8 -3,8 -6,15 \"/><path stroke-width=\"10\" d=\"M242,175c-3,6 -3,6 -5,11 \"/><path stroke-width=\"11\" d=\"M237,186c-2,5 -2,5 -4,10 \"/><path stroke-width=\"10\" d=\"M233,196c-2,12 0,13 -4,24 \"/><path stroke-width=\"8\" d=\"M229,220c-3,9 -7,8 -8,17 \"/><path stroke-width=\"9\" d=\"M221,237c-2,8 2,9 2,17 \"/><path stroke-width=\"8\" d=\"M223,254c0,10 -2,10 -2,20 -1,9 0,9 0,18 \"/><path stroke-width=\"9\" d=\"M221,292c0,6 0,6 0,13 0,10 0,10 0,20 0,8 0,8 0,17 0,8 0,8 0,16 0,7 -1,8 0,14 \"/><path stroke-width=\"10\" d=\"M221,372c1,8 3,7 5,14 \"/><path stroke-width=\"9\" d=\"M226,386c3,8 2,8 7,15 3,6 5,5 9,11 \"/><path stroke-width=\"10\" d=\"M242,412c3,5 1,6 4,11 \"/><path stroke-width=\"11\" d=\"M246,423c2,3 3,2 6,4 \"/><path stroke-width=\"13\" d=\"M252,427c2,2 2,2 5,3 3,1 3,0 6,0 3,0 3,0 6,0 \"/><path stroke-width=\"12\" d=\"M269,430c6,0 6,0 12,0 \"/><path stroke-width=\"11\" d=\"M281,430c4,0 4,0 7,0 \"/><path stroke-width=\"12\" d=\"M288,430c5,0 6,1 11,0 \"/><path stroke-width=\"11\" d=\"M299,430c5,-2 4,-4 9,-6 4,-2 5,0 9,-2 5,-4 4,-5 8,-10 \"/><path stroke-width=\"12\" d=\"M325,412c1,-1 2,0 3,-1 \"/><path stroke-width=\"13\" d=\"M328,411c4,-4 4,-5 9,-9 \"/><path stroke-width=\"12\" d=\"M337,402c2,-2 3,-2 5,-4 3,-3 3,-3 5,-6 \"/><path stroke-width=\"14\" d=\"M347,392c1,0 2,1 3,0 3,-2 3,-2 5,-5 \"/><path stroke-width=\"15\" d=\"M355,387c1,0 0,0 1,-1 2,0 3,1 4,0 \"/><path stroke-width=\"13\" d=\"M360,386c3,-2 2,-3 3,-7 \"/><path stroke-width=\"14\" d=\"M363,379c1,-2 1,-2 2,-4 \"/><path stroke-width=\"15\" d=\"M365,375c1,-2 2,-2 3,-3 0,-1 -1,-1 -1,-2 0,-2 0,-2 1,-3 1,-1 2,0 3,0 \"/><path stroke-width=\"16\" d=\"M371,367c2,-1 1,-1 2,-2 \"/><path stroke-width=\"18\" d=\"M375,365c0,0 0,0 0,0 \"/><path stroke-width=\"18\" d=\"M441,118c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M441,118c0,2 0,2 0,5 \"/><path stroke-width=\"13\" d=\"M441,123c0,6 1,6 0,12 \"/><path stroke-width=\"11\" d=\"M441,135c-1,6 -2,6 -3,12 \"/><path stroke-width=\"10\" d=\"M438,147c-1,7 0,7 0,13 \"/><path stroke-width=\"9\" d=\"M438,160c0,10 1,10 0,20 \"/><path stroke-width=\"8\" d=\"M438,180c-1,14 -4,14 -5,27 0,11 2,11 2,22 0,15 0,15 0,31 \"/><path stroke-width=\"9\" d=\"M435,260c0,6 0,6 0,12 0,10 1,10 0,20 \"/><path stroke-width=\"8\" d=\"M435,292c-1,10 -2,10 -3,19 -1,9 0,9 0,18 \"/><path stroke-width=\"10\" d=\"M432,329c0,5 0,5 0,10 \"/><path stroke-width=\"12\" d=\"M432,339c0,3 0,3 0,7 \"/><path stroke-width=\"14\" d=\"M432,346c0,1 0,1 0,2 \"/><path stroke-width=\"16\" d=\"M432,348c0,1 0,1 0,3 \"/><path stroke-width=\"17\" d=\"M432,351c0,3 0,3 0,6 \"/><path stroke-width=\"16\" d=\"M432,357c0,2 0,2 0,4 \"/><path stroke-width=\"14\" d=\"M432,361c0,2 0,2 0,5 0,2 0,2 0,3 \"/><path stroke-width=\"16\" d=\"M432,369c0,1 0,1 0,1 \"/><path stroke-width=\"17\" d=\"M432,370c0,1 0,1 0,3 0,1 0,1 0,2 \"/><path stroke-width=\"15\" d=\"M432,375c0,2 0,3 0,4 \"/><path stroke-width=\"16\" d=\"M449,107c0,0 0,0 0,0 \"/><path stroke-width=\"18\" d=\"M449,107c0,-2 -1,-3 1,-3 \"/><path stroke-width=\"15\" d=\"M450,104c2,-1 3,0 7,0 \"/><path stroke-width=\"11\" d=\"M457,104c10,0 10,0 19,0 \"/><path stroke-width=\"10\" d=\"M476,104c5,0 5,0 11,0 \"/><path stroke-width=\"11\" d=\"M487,104c5,0 6,-1 11,0 4,0 4,0 7,2 \"/><path stroke-width=\"13\" d=\"M505,106c2,1 2,2 3,3 \"/><path stroke-width=\"15\" d=\"M508,109c0,1 -1,2 0,2 2,1 5,-1 6,1 \"/><path stroke-width=\"13\" d=\"M514,112c2,3 -1,5 0,9 \"/><path stroke-width=\"12\" d=\"M514,121c1,3 4,2 5,5 \"/><path stroke-width=\"13\" d=\"M519,126c1,2 -1,3 0,5 \"/><path stroke-width=\"12\" d=\"M519,131c2,5 4,5 6,10 1,2 0,3 0,6 1,5 1,5 2,11 1,4 1,4 2,8 0,4 1,4 1,8 0,3 0,3 0,7 \"/><path stroke-width=\"13\" d=\"M530,181c0,3 0,3 0,7 \"/><path stroke-width=\"12\" d=\"M530,188c0,5 1,5 0,10 -1,4 -2,3 -3,7 \"/><path stroke-width=\"13\" d=\"M527,205c-1,2 -1,2 -2,5 -1,3 -2,3 -3,5 -2,4 -2,5 -4,7 \"/><path stroke-width=\"14\" d=\"M518,222c-1,0 -1,-2 -2,-1 -3,1 -3,2 -5,5 -1,1 -1,2 -2,3 -1,2 -1,2 -3,4 -1,1 -1,0 -3,1 -2,1 -2,2 -4,3 -2,0 -2,-1 -4,0 \"/><path stroke-width=\"13\" d=\"M495,237c-4,1 -4,2 -8,3 -3,1 -3,0 -6,0 -3,0 -3,-1 -5,0 -4,1 -4,2 -8,3 -2,0 -2,0 -5,0 \"/><path stroke-width=\"14\" d=\"M463,243c-2,0 -2,0 -5,1 -1,1 -1,2 -3,2 \"/><path stroke-width=\"16\" d=\"M455,246c0,0 0,-1 -1,-1 \"/><path stroke-width=\"17\" d=\"M454,245c-2,1 -3,4 -3,4 0,1 1,-1 3,-1 \"/><path stroke-width=\"14\" d=\"M454,248c7,-1 8,0 15,0 \"/><path stroke-width=\"9\" d=\"M469,248c11,0 11,-1 22,0 \"/><path stroke-width=\"8\" d=\"M491,248c12,1 12,1 24,4 9,2 9,2 18,5 \"/><path stroke-width=\"9\" d=\"M533,257c6,2 6,3 12,5 \"/><path stroke-width=\"10\" d=\"M545,262c5,2 6,1 10,4 \"/><path stroke-width=\"12\" d=\"M555,266c3,2 2,3 4,5 \"/><path stroke-width=\"13\" d=\"M559,271c2,3 3,3 5,5 2,2 2,2 3,4 2,3 2,3 4,6 1,2 1,2 3,5 \"/><path stroke-width=\"12\" d=\"M574,291c2,5 3,5 5,11 1,3 -1,3 0,6 \"/><path stroke-width=\"11\" d=\"M579,308c1,8 2,8 4,16 1,3 0,3 1,7 2,6 3,5 4,11 \"/><path stroke-width=\"10\" d=\"M588,342c2,7 1,7 2,14 1,6 2,6 3,12 1,6 0,6 0,12 \"/><path stroke-width=\"11\" d=\"M593,380c0,4 0,4 0,8 \"/><path stroke-width=\"13\" d=\"M593,388c0,3 0,3 0,6 0,4 0,4 0,9 0,2 0,2 0,5 \"/><path stroke-width=\"14\" d=\"M593,408c0,1 0,1 0,2 \"/><path stroke-width=\"16\" d=\"M593,410c0,1 0,1 0,1 \"/></g></svg>', 0, ''),
(115, 1, 3, 8, 5, '2025-04-23', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M180,131c0,0 0,0 0,0 4,8 4,8 8,16 \"/><path stroke-width=\"12\" d=\"M188,147c4,7 5,7 8,14 \"/><path stroke-width=\"9\" d=\"M196,161c5,11 4,11 8,23 3,6 3,6 6,13 8,18 8,18 17,36 \"/><path stroke-width=\"8\" d=\"M227,233c7,15 9,14 15,29 8,20 6,21 13,41 7,17 8,17 14,34 5,13 4,14 9,27 3,10 3,10 7,20 \"/><path stroke-width=\"9\" d=\"M285,384c2,6 3,5 5,11 \"/><path stroke-width=\"11\" d=\"M290,395c2,3 2,4 2,6 \"/><path stroke-width=\"15\" d=\"M292,401c0,0 -1,0 -1,-1 \"/><path stroke-width=\"17\" d=\"M291,400c1,-3 2,-3 3,-6 \"/><path stroke-width=\"15\" d=\"M294,394c1,-5 -1,-5 0,-10 \"/><path stroke-width=\"11\" d=\"M294,384c1,-6 2,-6 3,-12 \"/><path stroke-width=\"9\" d=\"M297,372c2,-11 1,-12 3,-23 \"/><path stroke-width=\"8\" d=\"M300,349c1,-8 1,-8 2,-17 2,-12 2,-12 3,-25 1,-14 1,-14 2,-28 0,-12 1,-12 1,-24 0,-13 0,-13 0,-26 0,-16 0,-16 0,-33 \"/><path stroke-width=\"9\" d=\"M308,196c0,-7 0,-7 0,-14 \"/><path stroke-width=\"10\" d=\"M308,182c0,-5 0,-5 0,-10 \"/><path stroke-width=\"11\" d=\"M308,172c0,-7 0,-7 0,-13 0,-4 0,-4 0,-8 \"/><path stroke-width=\"13\" d=\"M308,151c0,-2 0,-2 0,-3 \"/><path stroke-width=\"14\" d=\"M308,148c0,-4 0,-4 0,-7 \"/><path stroke-width=\"13\" d=\"M308,141c0,-3 -1,-3 0,-5 \"/><path stroke-width=\"14\" d=\"M308,136c1,-2 2,-1 3,-2 \"/><path stroke-width=\"15\" d=\"M311,134c0,-2 -1,-2 -1,-4 0,-1 0,-1 0,-2 \"/><path stroke-width=\"16\" d=\"M310,128c0,-2 0,-2 0,-5 0,-1 -1,-2 0,-2 1,0 1,1 3,2 \"/><path stroke-width=\"16\" d=\"M367,365c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M367,365c1,-6 2,-6 3,-12 \"/><path stroke-width=\"12\" d=\"M370,353c2,-10 2,-10 4,-20 \"/><path stroke-width=\"8\" d=\"M374,333c3,-12 5,-11 7,-23 2,-13 2,-13 3,-26 1,-17 0,-17 2,-34 1,-10 3,-9 4,-19 1,-14 -1,-14 -1,-28 0,-19 0,-19 0,-38 0,-14 0,-14 0,-27 0,-12 0,-12 0,-23 \"/><path stroke-width=\"9\" d=\"M389,115c0,-5 0,-5 0,-10 \"/><path stroke-width=\"12\" d=\"M389,105c0,-3 0,-3 0,-5 \"/><path stroke-width=\"13\" d=\"M389,100c0,-3 -1,-6 0,-6 \"/><path stroke-width=\"15\" d=\"M389,94c2,2 2,6 5,11 \"/><path stroke-width=\"13\" d=\"M394,105c4,10 4,10 8,20 \"/><path stroke-width=\"8\" d=\"M402,125c7,15 7,15 14,31 \"/><path stroke-width=\"9\" d=\"M416,156c3,6 3,6 6,11 7,13 6,13 14,26 3,6 4,5 8,11 \"/><path stroke-width=\"11\" d=\"M444,204c2,2 2,2 3,4 \"/><path stroke-width=\"14\" d=\"M447,208c1,1 1,2 3,3 \"/><path stroke-width=\"16\" d=\"M450,211c0,0 1,-1 1,-1 \"/><path stroke-width=\"17\" d=\"M451,210c0,1 -1,3 0,3 \"/><path stroke-width=\"15\" d=\"M451,213c2,0 4,-1 7,-4 \"/><path stroke-width=\"10\" d=\"M458,209c6,-7 5,-8 11,-17 \"/><path stroke-width=\"8\" d=\"M469,192c6,-11 7,-10 11,-21 \"/><path stroke-width=\"9\" d=\"M480,171c3,-7 2,-8 4,-15 3,-11 3,-11 5,-23 \"/><path stroke-width=\"8\" d=\"M489,133c3,-16 2,-16 6,-32 \"/><path stroke-width=\"9\" d=\"M495,101c1,-4 2,-4 3,-8 \"/><path stroke-width=\"11\" d=\"M498,93c1,-5 0,-5 0,-10 \"/><path stroke-width=\"12\" d=\"M498,83c0,-3 -1,-3 0,-6 \"/><path stroke-width=\"13\" d=\"M498,77c0,-3 2,-6 2,-5 \"/><path stroke-width=\"15\" d=\"M500,72c1,1 -1,5 0,10 \"/><path stroke-width=\"13\" d=\"M500,82c2,8 4,8 6,16 \"/><path stroke-width=\"9\" d=\"M506,98c1,8 -1,8 0,17 \"/><path stroke-width=\"10\" d=\"M506,115c0,6 1,6 2,11 2,8 2,8 3,15 \"/><path stroke-width=\"9\" d=\"M511,141c3,15 2,15 5,30 \"/><path stroke-width=\"8\" d=\"M516,171c4,17 5,17 8,35 2,10 0,11 1,21 1,11 2,11 3,21 \"/><path stroke-width=\"9\" d=\"M528,248c1,8 1,8 2,15 1,10 0,11 2,20 \"/><path stroke-width=\"8\" d=\"M532,283c2,9 4,8 5,17 \"/><path stroke-width=\"9\" d=\"M537,300c2,8 0,8 1,17 1,7 2,7 3,14 \"/><path stroke-width=\"11\" d=\"M541,331c0,3 0,3 0,5 \"/><path stroke-width=\"12\" d=\"M541,336c1,5 1,5 2,10 \"/><path stroke-width=\"11\" d=\"M543,346c1,6 1,6 1,11 \"/><path stroke-width=\"13\" d=\"M544,357c0,1 0,1 0,3 \"/><path stroke-width=\"15\" d=\"M544,360c0,2 0,2 0,3 \"/><path stroke-width=\"16\" d=\"M544,363c0,1 0,1 0,2 \"/></g></svg>', 0, ''),
(116, 1, 5, 10, 9, '2025-04-27', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M351,96c0,0 0,0 0,0 \"/><path stroke-width=\"18\" d=\"M351,96c0,-2 1,-3 0,-3 \"/><path stroke-width=\"16\" d=\"M351,93c-2,-1 -3,0 -5,0 \"/><path stroke-width=\"13\" d=\"M346,93c-5,0 -6,0 -11,0 \"/><path stroke-width=\"12\" d=\"M335,93c-4,-1 -4,-2 -8,-2 -4,-1 -4,0 -7,0 \"/><path stroke-width=\"13\" d=\"M320,91c-3,0 -3,0 -6,0 -4,0 -4,0 -9,0 \"/><path stroke-width=\"12\" d=\"M305,91c-3,0 -3,0 -7,0 \"/><path stroke-width=\"13\" d=\"M298,91c-2,0 -2,0 -4,0 -4,1 -4,1 -8,2 \"/><path stroke-width=\"12\" d=\"M286,93c-4,1 -4,1 -8,3 -3,1 -3,1 -6,3 -4,2 -4,2 -8,4 \"/><path stroke-width=\"11\" d=\"M264,103c-4,3 -5,2 -10,5 \"/><path stroke-width=\"12\" d=\"M254,108c-3,2 -2,2 -5,5 \"/><path stroke-width=\"11\" d=\"M249,113c-5,4 -5,4 -9,9 -3,3 -3,3 -6,5 \"/><path stroke-width=\"12\" d=\"M234,127c-3,4 -4,4 -7,8 \"/><path stroke-width=\"11\" d=\"M227,135c-2,4 -1,5 -3,9 \"/><path stroke-width=\"12\" d=\"M224,144c-2,3 -2,3 -3,5 -3,6 -3,6 -6,12 \"/><path stroke-width=\"11\" d=\"M215,161c-1,4 -1,4 -2,8 \"/><path stroke-width=\"10\" d=\"M213,169c-3,9 -3,9 -6,17 \"/><path stroke-width=\"9\" d=\"M207,186c-2,6 -3,6 -3,11 \"/><path stroke-width=\"11\" d=\"M204,197c-1,5 0,6 0,11 \"/><path stroke-width=\"10\" d=\"M204,208c-1,9 -1,9 -2,17 0,5 0,5 0,10 \"/><path stroke-width=\"11\" d=\"M202,235c0,6 0,6 0,13 \"/><path stroke-width=\"10\" d=\"M202,248c0,6 0,6 0,12 0,8 0,8 0,16 \"/><path stroke-width=\"11\" d=\"M202,276c0,3 0,3 0,5 \"/><path stroke-width=\"13\" d=\"M202,281c0,4 0,4 0,7 0,3 0,3 0,5 0,4 -1,4 0,7 0,2 1,2 2,5 1,3 2,2 3,5 \"/><path stroke-width=\"12\" d=\"M207,310c3,4 1,5 4,9 3,2 4,1 6,3 \"/><path stroke-width=\"13\" d=\"M217,322c3,2 2,3 3,5 3,3 3,3 5,5 \"/><path stroke-width=\"12\" d=\"M225,332c5,3 5,3 10,6 \"/><path stroke-width=\"10\" d=\"M235,338c6,3 6,3 13,6 \"/><path stroke-width=\"11\" d=\"M248,344c4,2 4,2 7,4 \"/><path stroke-width=\"12\" d=\"M255,348c4,2 4,2 8,4 4,2 4,1 7,3 4,2 4,3 8,4 \"/><path stroke-width=\"11\" d=\"M278,359c6,1 7,-1 13,0 \"/><path stroke-width=\"10\" d=\"M291,359c8,1 7,3 15,3 \"/><path stroke-width=\"9\" d=\"M306,362c10,1 10,-1 20,0 6,1 6,3 12,4 \"/><path stroke-width=\"10\" d=\"M338,366c7,1 7,-1 14,-1 \"/><path stroke-width=\"11\" d=\"M352,365c5,0 5,0 10,0 4,0 4,0 8,0 \"/><path stroke-width=\"13\" d=\"M370,365c2,0 2,1 4,0 \"/><path stroke-width=\"14\" d=\"M374,365c3,-2 2,-3 5,-5 \"/><path stroke-width=\"13\" d=\"M379,360c2,-1 2,-1 5,-1 \"/><path stroke-width=\"14\" d=\"M384,359c1,0 2,1 3,0 2,-1 2,-2 4,-4 1,-2 1,-2 2,-3 3,-2 3,-1 6,-3 1,-1 2,-1 2,-3 2,-2 1,-3 2,-6 \"/><path stroke-width=\"12\" d=\"M403,340c3,-4 3,-4 6,-7 \"/><path stroke-width=\"13\" d=\"M409,333c1,-1 2,-1 3,-2 \"/><path stroke-width=\"16\" d=\"M412,331c0,-1 -1,-1 -1,-2 \"/><path stroke-width=\"17\" d=\"M411,329c0,-1 1,-1 2,-2 \"/><path stroke-width=\"18\" d=\"M465,93c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M465,93c0,1 0,1 0,3 \"/><path stroke-width=\"14\" d=\"M465,96c0,5 -1,5 0,10 \"/><path stroke-width=\"11\" d=\"M465,106c1,5 2,5 3,10 \"/><path stroke-width=\"10\" d=\"M468,116c1,9 0,9 1,18 \"/><path stroke-width=\"8\" d=\"M469,134c2,15 2,15 4,30 2,15 2,15 3,29 1,10 -1,10 0,19 1,14 1,14 2,28 2,13 2,13 3,26 0,10 0,10 0,20 0,9 0,9 0,17 \"/><path stroke-width=\"10\" d=\"M481,303c0,4 -1,5 0,9 \"/><path stroke-width=\"12\" d=\"M481,312c1,3 4,2 4,5 \"/><path stroke-width=\"14\" d=\"M485,317c1,2 -1,2 -1,5 \"/><path stroke-width=\"15\" d=\"M484,322c0,1 0,3 0,3 \"/><path stroke-width=\"16\" d=\"M470,93c0,0 0,0 0,0 16,0 16,0 31,0 \"/><path stroke-width=\"11\" d=\"M501,93c12,0 12,0 24,0 \"/><path stroke-width=\"9\" d=\"M525,93c6,0 6,0 13,0 \"/><path stroke-width=\"10\" d=\"M538,93c6,0 6,-1 11,0 \"/><path stroke-width=\"12\" d=\"M549,93c2,0 1,2 3,4 \"/><path stroke-width=\"15\" d=\"M552,97c3,2 3,1 6,3 1,2 0,3 2,4 \"/><path stroke-width=\"13\" d=\"M560,104c3,3 4,2 7,4 \"/><path stroke-width=\"14\" d=\"M567,108c1,1 1,1 1,2 \"/><path stroke-width=\"16\" d=\"M568,110c0,1 -1,2 0,3 \"/><path stroke-width=\"15\" d=\"M568,113c1,2 1,3 3,3 \"/><path stroke-width=\"14\" d=\"M571,116c1,1 3,-2 4,-1 \"/><path stroke-width=\"15\" d=\"M575,115c0,1 -1,3 -1,6 \"/><path stroke-width=\"14\" d=\"M574,121c0,3 -1,3 0,5 \"/><path stroke-width=\"15\" d=\"M574,126c0,3 2,3 2,5 \"/><path stroke-width=\"13\" d=\"M576,131c1,5 0,5 0,10 0,2 0,2 0,3 \"/><path stroke-width=\"14\" d=\"M576,144c0,4 0,4 0,8 \"/><path stroke-width=\"13\" d=\"M576,152c0,3 0,3 0,5 -1,5 0,6 -2,9 \"/><path stroke-width=\"12\" d=\"M574,166c-2,2 -4,0 -6,3 -2,3 -1,4 -3,8 -2,3 -3,3 -5,6 \"/><path stroke-width=\"13\" d=\"M560,183c-1,2 0,2 0,4 \"/><path stroke-width=\"15\" d=\"M560,187c0,1 0,1 0,2 \"/><path stroke-width=\"14\" d=\"M560,189c-2,3 -2,4 -5,6 \"/><path stroke-width=\"12\" d=\"M555,195c-4,4 -4,4 -9,6 \"/><path stroke-width=\"11\" d=\"M546,201c-4,2 -4,1 -9,2 \"/><path stroke-width=\"12\" d=\"M537,203c-3,1 -3,2 -6,3 -4,1 -4,0 -8,1 -5,1 -5,1 -11,3 \"/><path stroke-width=\"11\" d=\"M512,210c-5,1 -5,2 -11,3 \"/><path stroke-width=\"13\" d=\"M501,213c-1,0 -1,0 -3,0 -4,1 -4,2 -9,3 -1,0 -1,-2 -2,-1 \"/><path stroke-width=\"14\" d=\"M487,215c-2,1 -2,3 -5,4 -1,1 -1,-1 -3,-1 \"/><path stroke-width=\"16\" d=\"M479,218c0,0 0,0 -1,0 -2,0 -4,0 -4,0 2,0 5,-1 9,0 \"/><path stroke-width=\"13\" d=\"M483,218c7,1 7,1 14,2 \"/><path stroke-width=\"10\" d=\"M497,220c7,2 7,2 13,4 \"/><path stroke-width=\"11\" d=\"M510,224c5,1 5,0 9,2 \"/><path stroke-width=\"12\" d=\"M519,226c4,1 4,1 8,3 3,2 3,2 7,4 7,3 7,3 14,6 \"/><path stroke-width=\"11\" d=\"M548,239c7,3 7,3 14,6 \"/><path stroke-width=\"9\" d=\"M562,245c7,3 7,3 14,8 \"/><path stroke-width=\"10\" d=\"M576,253c3,2 3,3 6,6 \"/><path stroke-width=\"11\" d=\"M582,259c6,5 7,4 12,9 \"/><path stroke-width=\"10\" d=\"M594,268c3,3 2,4 5,8 \"/><path stroke-width=\"13\" d=\"M599,276c1,2 1,1 2,3 \"/><path stroke-width=\"14\" d=\"M601,279c1,2 2,2 2,5 \"/><path stroke-width=\"12\" d=\"M603,284c1,5 0,5 0,10 0,4 -1,4 0,7 1,5 2,5 3,10 \"/><path stroke-width=\"11\" d=\"M606,311c2,6 2,6 3,12 1,5 0,5 0,11 \"/><path stroke-width=\"12\" d=\"M609,334c0,2 0,2 0,4 \"/><path stroke-width=\"14\" d=\"M609,338c0,2 -1,3 0,5 \"/><path stroke-width=\"13\" d=\"M609,343c1,4 3,7 4,7 \"/><path stroke-width=\"14\" d=\"M613,350c2,0 1,-3 1,-7 \"/></g></svg>', 0, ''),
(121, 1, 8, 9, 6, '2025-04-27', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M294,69c0,0 0,0 0,0 \"/><path stroke-width=\"15\" d=\"M294,69c0,3 1,3 0,6 \"/><path stroke-width=\"12\" d=\"M294,75c-1,5 -2,5 -3,11 \"/><path stroke-width=\"10\" d=\"M291,86c-2,9 0,9 -3,18 \"/><path stroke-width=\"8\" d=\"M288,104c-3,14 -5,14 -9,28 -4,16 -4,16 -8,33 -3,13 -2,13 -6,26 -3,13 -3,13 -7,26 -5,18 -6,18 -11,35 -6,19 -5,19 -11,37 -6,17 -7,16 -12,32 -5,17 -4,17 -9,34 -2,9 -2,9 -5,18 \"/><path stroke-width=\"9\" d=\"M210,373c-2,7 -4,6 -6,13 \"/><path stroke-width=\"11\" d=\"M204,386c-1,4 1,4 0,8 \"/><path stroke-width=\"13\" d=\"M204,394c-1,4 -3,4 -4,8 -1,4 -1,4 -1,9 0,2 0,2 0,4 \"/><path stroke-width=\"15\" d=\"M199,415c0,1 0,1 0,1 \"/><path stroke-width=\"17\" d=\"M289,64c0,0 0,0 0,0 0,3 -1,3 0,5 \"/><path stroke-width=\"13\" d=\"M289,69c2,6 3,6 6,12 \"/><path stroke-width=\"11\" d=\"M295,81c1,4 0,4 2,8 \"/><path stroke-width=\"10\" d=\"M297,89c4,10 5,10 9,21 \"/><path stroke-width=\"8\" d=\"M306,110c3,9 2,9 5,18 4,11 4,11 7,22 6,17 7,17 12,34 5,18 4,18 9,36 4,17 4,17 8,35 6,22 6,22 11,44 2,9 2,9 3,17 3,14 3,14 6,27 \"/><path stroke-width=\"9\" d=\"M367,343c1,7 1,7 3,13 \"/><path stroke-width=\"11\" d=\"M370,356c1,3 2,3 3,6 \"/><path stroke-width=\"13\" d=\"M373,362c1,3 1,3 3,5 1,3 2,3 3,6 \"/><path stroke-width=\"14\" d=\"M379,373c0,1 -1,1 -1,2 \"/><path stroke-width=\"15\" d=\"M378,375c0,3 0,3 0,6 \"/><path stroke-width=\"12\" d=\"M378,381c1,7 1,7 3,13 \"/><path stroke-width=\"11\" d=\"M381,394c1,3 3,2 4,4 \"/><path stroke-width=\"13\" d=\"M385,398c1,5 1,6 1,11 \"/><path stroke-width=\"14\" d=\"M386,409c0,2 -1,2 0,3 \"/><path stroke-width=\"15\" d=\"M386,412c1,2 2,1 3,3 \"/><path stroke-width=\"14\" d=\"M389,415c1,2 -1,3 0,5 \"/><path stroke-width=\"15\" d=\"M389,420c1,2 1,1 3,2 \"/><path stroke-width=\"18\" d=\"M251,297c0,0 0,0 0,0 0,-2 -1,-3 0,-3 \"/><path stroke-width=\"15\" d=\"M251,294c6,-3 7,-2 15,-3 \"/><path stroke-width=\"10\" d=\"M266,291c11,-2 11,-2 23,-2 \"/><path stroke-width=\"8\" d=\"M289,289c11,-1 11,0 21,0 13,0 13,1 25,0 \"/><path stroke-width=\"10\" d=\"M335,289c4,0 3,-2 7,-3 \"/><path stroke-width=\"13\" d=\"M342,286c1,0 2,0 2,0 \"/><path stroke-width=\"16\" d=\"M571,104c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M571,104c0,-1 0,-1 0,-2 \"/><path stroke-width=\"14\" d=\"M571,102c0,-5 1,-5 -1,-10 \"/><path stroke-width=\"12\" d=\"M570,92c-1,-4 -1,-4 -4,-7 \"/><path stroke-width=\"14\" d=\"M566,85c-1,-1 -1,0 -3,0 \"/><path stroke-width=\"12\" d=\"M563,85c-7,-2 -7,-3 -14,-5 \"/><path stroke-width=\"9\" d=\"M549,80c-9,-2 -10,-2 -19,-3 \"/><path stroke-width=\"10\" d=\"M530,77c-4,-1 -4,0 -8,0 \"/><path stroke-width=\"12\" d=\"M522,77c-5,0 -5,-2 -9,0 \"/><path stroke-width=\"10\" d=\"M513,77c-8,3 -7,5 -15,9 \"/><path stroke-width=\"9\" d=\"M498,86c-5,3 -6,2 -10,6 \"/><path stroke-width=\"11\" d=\"M488,92c-4,4 -2,6 -6,10 -4,4 -5,3 -9,8 \"/><path stroke-width=\"9\" d=\"M473,110c-7,7 -7,8 -12,17 \"/><path stroke-width=\"10\" d=\"M461,127c-2,2 -1,2 -2,5 -4,10 -5,10 -8,20 \"/><path stroke-width=\"8\" d=\"M451,152c-5,15 -5,15 -8,30 -3,12 -3,12 -5,24 -1,10 0,10 0,20 0,10 0,10 0,20 0,9 0,9 0,17 \"/><path stroke-width=\"9\" d=\"M438,263c0,7 -1,8 0,14 \"/><path stroke-width=\"10\" d=\"M438,277c1,6 3,6 5,11 \"/><path stroke-width=\"11\" d=\"M443,288c1,4 -1,5 0,9 \"/><path stroke-width=\"12\" d=\"M443,297c1,4 2,4 3,8 \"/><path stroke-width=\"13\" d=\"M446,305c1,3 -1,3 0,5 \"/><path stroke-width=\"12\" d=\"M446,310c1,5 1,5 3,10 1,2 1,2 2,5 2,4 1,4 3,9 \"/><path stroke-width=\"11\" d=\"M454,334c2,5 2,5 4,10 2,5 1,5 4,9 \"/><path stroke-width=\"13\" d=\"M462,353c1,1 3,-1 4,1 \"/><path stroke-width=\"12\" d=\"M466,354c4,4 3,5 7,9 2,3 3,2 5,3 4,2 4,3 9,4 \"/><path stroke-width=\"11\" d=\"M487,370c6,2 7,1 13,3 4,2 4,4 8,5 4,1 5,0 9,0 \"/><path stroke-width=\"12\" d=\"M517,378c4,0 4,0 9,0 \"/><path stroke-width=\"13\" d=\"M526,378c1,0 1,0 3,0 \"/><path stroke-width=\"15\" d=\"M529,378c1,0 1,0 2,0 \"/><path stroke-width=\"16\" d=\"M531,378c1,0 1,0 2,0 2,0 2,0 4,0 \"/><path stroke-width=\"14\" d=\"M537,378c2,0 2,0 5,0 \"/><path stroke-width=\"15\" d=\"M542,378c2,0 2,0 4,0 3,-1 4,0 6,-2 \"/><path stroke-width=\"14\" d=\"M552,376c2,-1 2,-1 3,-3 2,-2 1,-2 3,-5 \"/><path stroke-width=\"13\" d=\"M558,368c2,-3 2,-2 4,-6 1,-2 0,-2 1,-4 \"/><path stroke-width=\"14\" d=\"M563,358c1,-3 2,-3 3,-5 \"/><path stroke-width=\"13\" d=\"M566,353c2,-4 3,-6 3,-8 \"/></g></svg>', 0, ''),
(124, 1, 7, 1, 2, '2025-04-27', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M150,145c0,0 0,0 0,0 \"/><path stroke-width=\"13\" d=\"M150,145c0,13 -1,13 0,26 \"/><path stroke-width=\"9\" d=\"M150,171c1,7 2,7 4,14 3,16 3,16 5,33 \"/><path stroke-width=\"8\" d=\"M159,218c2,19 0,19 2,38 2,27 3,27 6,54 3,23 2,23 5,45 3,21 4,21 5,41 1,17 -1,18 0,34 \"/><path stroke-width=\"9\" d=\"M177,430c0,6 1,6 2,11 \"/><path stroke-width=\"11\" d=\"M179,441c1,5 1,5 1,9 \"/><path stroke-width=\"13\" d=\"M180,450c0,2 0,2 0,4 \"/><path stroke-width=\"15\" d=\"M180,454c0,1 -1,2 0,3 \"/><path stroke-width=\"16\" d=\"M180,457c1,2 1,1 3,3 \"/><path stroke-width=\"17\" d=\"M61,161c0,0 0,0 0,0 \"/><path stroke-width=\"16\" d=\"M61,161c3,-1 2,-1 5,-2 \"/><path stroke-width=\"12\" d=\"M66,159c8,-2 8,-3 17,-3 \"/><path stroke-width=\"9\" d=\"M83,156c10,-1 10,0 20,0 \"/><path stroke-width=\"8\" d=\"M103,156c10,0 10,-1 20,0 12,1 12,0 23,4 15,5 15,7 30,14 13,7 14,6 26,14 17,13 16,14 32,28 14,13 14,13 28,27 15,16 17,15 29,32 7,9 5,10 10,20 3,8 3,8 7,15 \"/><path stroke-width=\"9\" d=\"M308,310c4,8 5,8 8,17 \"/><path stroke-width=\"10\" d=\"M316,327c2,5 2,5 2,10 \"/><path stroke-width=\"11\" d=\"M318,337c1,6 0,6 0,13 \"/><path stroke-width=\"12\" d=\"M318,350c0,3 0,3 1,7 1,5 1,5 2,11 \"/><path stroke-width=\"10\" d=\"M321,368c1,6 0,6 0,13 \"/><path stroke-width=\"11\" d=\"M321,381c0,5 0,5 0,10 0,6 1,6 0,12 \"/><path stroke-width=\"10\" d=\"M321,403c-1,6 -2,6 -5,11 \"/><path stroke-width=\"11\" d=\"M316,414c-3,5 -2,5 -6,9 -3,4 -3,3 -7,6 -4,3 -4,4 -9,6 -5,2 -6,1 -11,3 -6,1 -6,2 -11,3 \"/><path stroke-width=\"10\" d=\"M272,441c-7,1 -8,0 -15,0 \"/><path stroke-width=\"9\" d=\"M257,441c-10,0 -10,0 -19,0 -10,0 -10,0 -19,0 -6,0 -6,0 -12,0 \"/><path stroke-width=\"11\" d=\"M207,441c-5,0 -5,0 -10,0 \"/><path stroke-width=\"12\" d=\"M197,441c-2,0 -2,0 -5,0 \"/><path stroke-width=\"13\" d=\"M192,441c-3,0 -3,0 -6,0 \"/><path stroke-width=\"15\" d=\"M186,441c0,0 0,0 -1,0 -2,0 -2,0 -5,0 \"/><path stroke-width=\"14\" d=\"M180,441c-2,0 -2,0 -5,0 -1,0 -1,0 -3,0 \"/><path stroke-width=\"15\" d=\"M172,441c-2,0 -2,0 -5,0 0,0 0,0 -1,0 -3,0 -3,0 -5,0 \"/><path stroke-width=\"14\" d=\"M161,441c-3,0 -3,0 -6,0 \"/><path stroke-width=\"15\" d=\"M155,441c-2,0 -2,0 -4,0 -1,0 -1,0 -3,0 \"/><path stroke-width=\"17\" d=\"M148,441c0,0 0,0 0,0 \"/><path stroke-width=\"18\" d=\"M557,177c0,0 0,0 0,0 \"/><path stroke-width=\"15\" d=\"M557,177c-5,-3 -4,-4 -9,-6 \"/><path stroke-width=\"11\" d=\"M548,171c-7,-3 -7,-3 -15,-3 \"/><path stroke-width=\"9\" d=\"M533,168c-9,-1 -9,1 -18,1 -10,0 -10,0 -20,0 -8,0 -8,0 -17,0 \"/><path stroke-width=\"8\" d=\"M478,169c-11,0 -11,0 -23,0 -9,0 -9,-1 -19,0 -10,1 -10,2 -19,5 \"/><path stroke-width=\"9\" d=\"M417,174c-6,2 -6,2 -11,6 \"/><path stroke-width=\"10\" d=\"M406,180c-7,4 -7,4 -13,8 -5,5 -5,5 -10,10 -3,4 -3,4 -6,8 \"/><path stroke-width=\"11\" d=\"M377,206c-3,5 -4,5 -6,11 \"/><path stroke-width=\"10\" d=\"M371,217c-3,6 -4,6 -6,14 \"/><path stroke-width=\"9\" d=\"M365,231c-2,11 -1,12 -3,23 \"/><path stroke-width=\"8\" d=\"M362,254c-1,10 -1,10 -3,20 -2,10 -3,10 -5,20 \"/><path stroke-width=\"10\" d=\"M354,294c0,4 2,4 2,7 1,20 0,20 0,39 \"/><path stroke-width=\"8\" d=\"M356,340c0,9 0,9 0,17 0,10 -1,10 1,20 5,17 7,16 14,33 3,9 2,10 7,18 \"/><path stroke-width=\"9\" d=\"M378,428c5,7 6,6 12,11 6,6 5,7 11,11 \"/><path stroke-width=\"10\" d=\"M401,450c4,3 5,2 10,3 9,3 9,3 18,4 \"/><path stroke-width=\"9\" d=\"M429,457c8,1 8,0 16,0 12,0 12,0 25,0 \"/><path stroke-width=\"8\" d=\"M470,457c9,0 9,0 19,0 17,0 17,2 34,0 15,-2 14,-4 29,-7 15,-2 16,-1 30,-4 10,-2 11,-2 20,-7 8,-3 8,-4 15,-9 \"/><path stroke-width=\"10\" d=\"M617,430c3,-2 2,-2 5,-6 \"/><path stroke-width=\"12\" d=\"M622,424c2,-3 3,-3 4,-8 3,-6 3,-6 5,-13 2,-5 1,-5 2,-11 \"/><path stroke-width=\"9\" d=\"M633,392c2,-13 2,-13 3,-25 \"/><path stroke-width=\"10\" d=\"M636,367c0,-3 0,-3 0,-6 \"/><path stroke-width=\"11\" d=\"M636,361c0,-8 0,-8 0,-15 \"/><path stroke-width=\"10\" d=\"M636,346c0,-7 0,-7 0,-13 0,-8 0,-8 0,-16 0,-7 0,-7 -2,-13 -1,-7 -2,-7 -5,-14 \"/><path stroke-width=\"9\" d=\"M629,290c-4,-9 -4,-9 -8,-18 \"/><path stroke-width=\"10\" d=\"M621,272c-2,-4 -2,-4 -4,-7 \"/><path stroke-width=\"12\" d=\"M617,265c-1,-3 -1,-3 -3,-6 \"/><path stroke-width=\"11\" d=\"M614,259c-4,-6 -4,-6 -8,-12 \"/><path stroke-width=\"10\" d=\"M606,247c-2,-4 -1,-5 -4,-9 \"/><path stroke-width=\"11\" d=\"M602,238c-4,-5 -6,-4 -10,-9 \"/><path stroke-width=\"12\" d=\"M592,229c-1,-1 1,-2 0,-4 \"/><path stroke-width=\"15\" d=\"M592,225c0,-1 -1,0 -2,-1 \"/><path stroke-width=\"14\" d=\"M590,224c-3,-4 -2,-5 -5,-9 \"/><path stroke-width=\"13\" d=\"M585,215c-1,-2 -1,-2 -3,-4 -2,-3 -2,-3 -5,-5 -2,-2 -2,-1 -4,-3 -2,-3 -2,-3 -4,-6 -1,-2 -1,-2 -2,-4 \"/><path stroke-width=\"14\" d=\"M567,193c-2,-2 -2,-2 -4,-4 -2,-1 -3,0 -5,-2 -2,-2 -1,-3 -2,-5 \"/><path stroke-width=\"15\" d=\"M556,182c0,-1 0,-1 -1,-2 -2,-2 -1,-3 -3,-4 \"/><path stroke-width=\"14\" d=\"M552,176c-2,-1 -3,1 -5,1 \"/><path stroke-width=\"15\" d=\"M547,177c-1,0 0,-1 -1,-1 \"/><path stroke-width=\"16\" d=\"M546,176c-1,-1 -1,-1 -2,-1 0,0 0,0 -1,0 -1,0 -1,0 -2,0 \"/></g></svg>', 0, ''),
(134, 1, 9, 1, 1, '2025-04-27', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M169,348c0,0 0,0 0,0 \"/><path stroke-width=\"13\" d=\"M169,348c1,-29 2,-29 3,-57 \"/><path stroke-width=\"9\" d=\"M172,291c0,-6 0,-6 0,-12 0,-28 0,-28 0,-55 \"/><path stroke-width=\"8\" d=\"M172,224c0,-34 0,-34 0,-68 0,-7 0,-7 0,-15 0,-13 0,-13 0,-26 \"/><path stroke-width=\"9\" d=\"M172,115c0,-6 0,-6 0,-11 \"/><path stroke-width=\"12\" d=\"M172,104c0,-3 0,-3 0,-5 \"/><path stroke-width=\"13\" d=\"M172,99c0,-3 0,-3 0,-6 \"/><path stroke-width=\"15\" d=\"M172,93c0,-1 0,-1 0,-2 \"/><path stroke-width=\"17\" d=\"M172,91c0,0 0,0 0,0 1,0 1,0 3,0 \"/><path stroke-width=\"15\" d=\"M175,91c4,0 5,-1 9,1 \"/><path stroke-width=\"12\" d=\"M184,92c5,3 4,4 8,8 2,2 2,2 4,4 4,4 3,4 8,8 \"/><path stroke-width=\"10\" d=\"M204,112c12,10 13,9 25,19 \"/><path stroke-width=\"8\" d=\"M229,131c8,7 7,9 16,14 \"/><path stroke-width=\"9\" d=\"M245,145c7,4 9,1 14,5 8,5 5,9 12,13 \"/><path stroke-width=\"10\" d=\"M271,163c4,3 6,1 11,1 \"/><path stroke-width=\"13\" d=\"M282,164c1,0 1,0 2,0 \"/><path stroke-width=\"15\" d=\"M284,164c5,0 5,0 9,0 \"/><path stroke-width=\"16\" d=\"M293,164c1,0 1,0 2,0 \"/><path stroke-width=\"15\" d=\"M295,164c3,-2 4,-1 6,-4 \"/><path stroke-width=\"10\" d=\"M301,160c8,-8 7,-9 14,-18 \"/><path stroke-width=\"8\" d=\"M315,142c5,-7 6,-6 10,-14 \"/><path stroke-width=\"9\" d=\"M325,128c5,-7 3,-8 7,-17 2,-5 3,-5 6,-11 4,-8 5,-8 9,-16 \"/><path stroke-width=\"10\" d=\"M347,84c1,-5 0,-5 1,-9 \"/><path stroke-width=\"11\" d=\"M348,75c1,-6 2,-6 3,-11 \"/><path stroke-width=\"12\" d=\"M351,64c1,-3 0,-3 1,-6 \"/><path stroke-width=\"14\" d=\"M352,58c1,-1 1,-1 2,-2 \"/><path stroke-width=\"15\" d=\"M354,56c0,-1 0,-3 0,-3 \"/><path stroke-width=\"16\" d=\"M354,53c1,6 2,7 3,14 \"/><path stroke-width=\"13\" d=\"M357,67c0,9 -1,9 -1,18 \"/><path stroke-width=\"9\" d=\"M356,85c0,9 0,10 0,19 \"/><path stroke-width=\"8\" d=\"M356,104c0,10 0,10 2,20 2,18 4,18 5,35 2,11 0,11 1,22 3,24 5,23 8,47 2,13 0,14 1,27 1,10 1,10 2,20 1,13 1,13 2,26 \"/><path stroke-width=\"9\" d=\"M377,301c0,6 0,6 1,11 \"/><path stroke-width=\"10\" d=\"M378,312c1,6 4,6 5,11 0,6 -1,7 -2,13 \"/><path stroke-width=\"13\" d=\"M381,336c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M381,336c0,1 0,1 0,1 \"/><path stroke-width=\"18\" d=\"M593,77c0,0 0,0 0,0 \"/><path stroke-width=\"16\" d=\"M593,77c-3,-3 -3,-3 -6,-5 \"/><path stroke-width=\"14\" d=\"M587,72c-2,-2 -2,-2 -5,-3 \"/><path stroke-width=\"12\" d=\"M582,69c-5,-2 -5,-3 -12,-4 \"/><path stroke-width=\"11\" d=\"M570,65c-3,-1 -3,0 -6,-1 \"/><path stroke-width=\"12\" d=\"M564,64c-6,-1 -6,-2 -11,-3 -3,-1 -3,0 -7,0 -4,0 -4,0 -8,0 \"/><path stroke-width=\"13\" d=\"M538,61c-3,0 -3,0 -5,0 -3,0 -3,0 -6,0 \"/><path stroke-width=\"15\" d=\"M527,61c-1,0 -1,0 -2,0 \"/><path stroke-width=\"14\" d=\"M525,61c-3,0 -3,0 -7,0 \"/><path stroke-width=\"13\" d=\"M518,61c-2,0 -3,-1 -5,0 -3,1 -3,2 -6,4 -2,1 -2,1 -3,3 \"/><path stroke-width=\"14\" d=\"M504,68c-2,2 -2,1 -3,3 \"/><path stroke-width=\"13\" d=\"M501,71c-2,3 -1,4 -3,7 -2,3 -3,3 -5,6 \"/><path stroke-width=\"12\" d=\"M493,84c-3,2 -3,2 -6,5 \"/><path stroke-width=\"14\" d=\"M487,89c0,1 0,1 0,2 \"/><path stroke-width=\"16\" d=\"M487,91c0,1 1,2 0,3 -1,1 -2,0 -3,2 \"/><path stroke-width=\"15\" d=\"M484,96c-1,1 0,2 0,4 0,1 0,1 0,3 \"/><path stroke-width=\"16\" d=\"M484,103c0,1 0,1 0,1 0,3 0,3 0,6 0,1 0,1 0,1 \"/><path stroke-width=\"15\" d=\"M484,111c2,4 2,5 5,7 \"/><path stroke-width=\"13\" d=\"M489,118c5,4 7,4 12,6 0,0 -2,-1 -1,-1 \"/><path stroke-width=\"12\" d=\"M500,123c14,3 15,3 30,8 \"/><path stroke-width=\"8\" d=\"M530,131c16,6 15,8 30,14 \"/><path stroke-width=\"10\" d=\"M560,145c3,1 4,-1 7,0 \"/><path stroke-width=\"11\" d=\"M567,145c8,2 8,2 15,5 \"/><path stroke-width=\"10\" d=\"M582,150c6,3 6,2 11,6 \"/><path stroke-width=\"12\" d=\"M593,156c2,2 1,3 3,4 \"/><path stroke-width=\"13\" d=\"M596,160c2,3 2,3 5,5 1,2 1,2 3,3 \"/><path stroke-width=\"14\" d=\"M604,168c1,1 3,2 3,2 \"/><path stroke-width=\"16\" d=\"M606,172c0,0 0,0 0,0 \"/><path stroke-width=\"15\" d=\"M606,172c-2,2 -2,2 -3,4 \"/><path stroke-width=\"13\" d=\"M603,176c-2,3 -1,3 -3,5 \"/><path stroke-width=\"15\" d=\"M600,181c-1,1 -1,1 -2,2 \"/><path stroke-width=\"17\" d=\"M598,183c0,0 0,0 0,0 \"/><path stroke-width=\"16\" d=\"M598,183c0,2 0,3 0,5 \"/><path stroke-width=\"15\" d=\"M598,188c0,2 0,2 0,3 0,2 0,2 0,5 0,4 0,4 0,9 \"/><path stroke-width=\"16\" d=\"M598,205c0,1 0,1 0,2 \"/><path stroke-width=\"15\" d=\"M598,207c0,2 0,2 0,4 0,2 0,2 0,4 0,3 0,3 0,5 \"/><path stroke-width=\"12\" d=\"M598,220c0,6 0,6 0,11 \"/><path stroke-width=\"13\" d=\"M598,231c0,2 0,2 0,4 -1,4 -2,4 -3,9 \"/><path stroke-width=\"11\" d=\"M595,244c-1,6 0,6 0,12 \"/><path stroke-width=\"10\" d=\"M595,256c-1,8 -1,8 -2,15 \"/><path stroke-width=\"11\" d=\"M593,271c-1,4 -1,4 -2,8 \"/><path stroke-width=\"12\" d=\"M591,279c-1,3 0,3 -1,6 -2,5 -3,5 -5,9 -1,3 0,4 -2,7 \"/><path stroke-width=\"14\" d=\"M583,301c-1,1 -2,1 -2,2 \"/><path stroke-width=\"15\" d=\"M581,303c0,1 1,2 0,3 \"/><path stroke-width=\"13\" d=\"M581,306c-3,6 -3,6 -7,11 \"/><path stroke-width=\"12\" d=\"M574,317c-2,2 -3,0 -5,2 \"/><path stroke-width=\"13\" d=\"M569,319c-2,2 0,3 -2,6 -2,3 -2,3 -5,5 \"/><path stroke-width=\"11\" d=\"M562,330c-6,4 -6,4 -13,6 -4,2 -4,0 -9,1 -6,1 -6,2 -11,3 -10,2 -10,2 -19,2 \"/><path stroke-width=\"10\" d=\"M510,342c-12,1 -13,1 -25,1 \"/><path stroke-width=\"9\" d=\"M485,343c-6,0 -6,0 -13,0 \"/><path stroke-width=\"10\" d=\"M472,343c-8,0 -8,1 -16,0 \"/><path stroke-width=\"11\" d=\"M456,343c-3,-1 -3,-2 -6,-4 \"/><path stroke-width=\"14\" d=\"M450,339c-1,-1 0,-1 -1,-2 \"/><path stroke-width=\"16\" d=\"M449,337c-1,-1 -2,-1 -3,-2 \"/><path stroke-width=\"13\" d=\"M446,335c-2,-4 -2,-4 -3,-9 \"/><path stroke-width=\"12\" d=\"M443,326c-1,-3 -2,-3 -3,-7 \"/><path stroke-width=\"13\" d=\"M440,319c-1,-6 -2,-6 -2,-12 -1,-7 0,-7 0,-14 \"/><path stroke-width=\"11\" d=\"M438,293c0,-10 0,-10 0,-19 0,-2 -1,-2 0,-4 \"/><path stroke-width=\"15\" d=\"M438,270c1,-2 3,-3 4,-5 \"/><path stroke-width=\"17\" d=\"M443,264c0,0 0,0 0,0 \"/></g></svg>', 0, ''),
(135, 1, 9, 1, 1, '2025-04-27', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M251,424c0,0 0,0 0,0 -2,-9 -3,-9 -3,-17 \"/><path stroke-width=\"11\" d=\"M248,407c-1,-16 1,-16 0,-32 \"/><path stroke-width=\"8\" d=\"M248,375c0,-8 -2,-8 -2,-17 -1,-12 0,-12 -1,-24 -1,-14 -2,-14 -3,-29 -1,-15 -1,-15 -2,-31 -1,-14 -2,-14 -3,-27 -1,-13 0,-13 0,-26 0,-14 0,-14 0,-29 0,-12 0,-12 0,-24 0,-12 0,-12 0,-24 0,-9 0,-9 0,-19 \"/><path stroke-width=\"9\" d=\"M237,125c0,-5 0,-5 0,-11 \"/><path stroke-width=\"12\" d=\"M237,114c0,-3 0,-3 0,-6 \"/><path stroke-width=\"14\" d=\"M237,108c0,-2 0,-2 0,-4 \"/><path stroke-width=\"15\" d=\"M237,104c0,-1 0,-2 0,-2 \"/><path stroke-width=\"16\" d=\"M237,102c0,4 -2,6 0,11 \"/><path stroke-width=\"12\" d=\"M237,113c7,16 9,16 17,32 \"/><path stroke-width=\"9\" d=\"M254,145c3,5 2,6 5,11 6,9 7,8 15,17 \"/><path stroke-width=\"8\" d=\"M274,173c5,7 4,8 11,14 \"/><path stroke-width=\"9\" d=\"M285,187c5,5 6,4 12,7 \"/><path stroke-width=\"10\" d=\"M297,194c4,2 3,4 8,5 \"/><path stroke-width=\"11\" d=\"M305,199c6,1 6,0 12,0 \"/><path stroke-width=\"13\" d=\"M317,199c0,0 1,0 1,0 \"/><path stroke-width=\"14\" d=\"M318,199c5,-1 6,0 11,-2 \"/><path stroke-width=\"10\" d=\"M329,197c7,-5 7,-6 14,-13 \"/><path stroke-width=\"9\" d=\"M343,184c6,-7 5,-8 11,-15 5,-5 7,-4 11,-10 4,-4 3,-5 5,-11 \"/><path stroke-width=\"10\" d=\"M370,148c3,-6 2,-6 5,-12 \"/><path stroke-width=\"11\" d=\"M375,136c3,-5 4,-4 6,-9 \"/><path stroke-width=\"12\" d=\"M381,127c1,-3 -1,-4 0,-7 \"/><path stroke-width=\"13\" d=\"M381,120c1,-2 3,-1 4,-3 1,-3 1,-8 1,-7 \"/><path stroke-width=\"15\" d=\"M386,110c0,1 0,6 0,11 \"/><path stroke-width=\"12\" d=\"M386,121c0,13 0,13 0,26 \"/><path stroke-width=\"8\" d=\"M386,147c0,15 0,15 0,29 0,20 0,20 0,40 0,23 0,23 0,46 0,17 0,17 0,35 0,16 0,16 0,31 0,12 0,12 0,24 \"/><path stroke-width=\"9\" d=\"M386,352c0,4 0,4 0,9 \"/><path stroke-width=\"11\" d=\"M386,361c0,6 0,6 0,12 \"/><path stroke-width=\"13\" d=\"M386,373c0,1 0,1 0,2 \"/><path stroke-width=\"14\" d=\"M386,375c1,4 2,4 3,7 \"/><path stroke-width=\"15\" d=\"M389,382c0,1 0,1 0,2 \"/><path stroke-width=\"17\" d=\"M389,384c0,1 -1,1 0,2 1,2 1,2 3,3 \"/><path stroke-width=\"13\" d=\"M392,389c2,1 2,0 5,0 \"/><path stroke-width=\"12\" d=\"M631,123c0,0 0,0 0,0 \"/><path stroke-width=\"15\" d=\"M631,123c0,-2 1,-3 0,-5 \"/><path stroke-width=\"13\" d=\"M631,118c-4,-2 -5,-1 -11,-3 \"/><path stroke-width=\"11\" d=\"M620,115c-5,-1 -5,-2 -10,-3 -5,-1 -5,0 -10,0 -6,0 -6,0 -12,0 \"/><path stroke-width=\"10\" d=\"M588,112c-8,0 -8,0 -17,0 -5,0 -5,0 -11,0 \"/><path stroke-width=\"11\" d=\"M560,112c-5,0 -5,0 -9,0 -7,0 -7,-1 -13,0 \"/><path stroke-width=\"10\" d=\"M538,112c-6,1 -6,2 -12,3 \"/><path stroke-width=\"12\" d=\"M526,115c-3,0 -4,-1 -6,0 \"/><path stroke-width=\"13\" d=\"M520,115c-3,1 -2,3 -5,5 -1,2 -2,1 -4,2 \"/><path stroke-width=\"16\" d=\"M511,122c0,1 0,1 0,1 \"/><path stroke-width=\"15\" d=\"M511,123c-2,3 -2,3 -3,6 \"/><path stroke-width=\"12\" d=\"M508,129c-2,5 -2,5 -3,10 0,2 1,2 1,5 0,5 0,5 -1,10 \"/><path stroke-width=\"11\" d=\"M505,154c-2,5 -4,4 -5,9 -1,6 0,6 0,11 \"/><path stroke-width=\"13\" d=\"M500,174c0,2 0,2 0,4 \"/><path stroke-width=\"14\" d=\"M500,178c0,2 0,2 0,4 \"/><path stroke-width=\"12\" d=\"M500,182c0,7 0,7 0,14 0,3 -1,3 0,6 1,5 1,5 4,9 \"/><path stroke-width=\"11\" d=\"M504,211c4,5 4,5 9,9 \"/><path stroke-width=\"10\" d=\"M513,220c5,4 5,4 11,8 \"/><path stroke-width=\"9\" d=\"M524,228c12,7 12,7 24,13 \"/><path stroke-width=\"10\" d=\"M548,241c4,2 4,1 8,3 \"/><path stroke-width=\"12\" d=\"M556,244c2,2 2,3 4,4 \"/><path stroke-width=\"11\" d=\"M560,248c17,10 17,10 34,19 \"/><path stroke-width=\"8\" d=\"M594,267c12,5 12,5 23,11 12,6 12,6 23,14 \"/><path stroke-width=\"11\" d=\"M640,292c1,1 0,1 1,2 \"/><path stroke-width=\"12\" d=\"M641,294c3,5 4,4 7,9 \"/><path stroke-width=\"11\" d=\"M648,303c2,6 2,6 3,12 \"/><path stroke-width=\"10\" d=\"M651,315c1,6 1,6 1,12 0,7 0,7 0,13 0,8 0,8 0,16 \"/><path stroke-width=\"9\" d=\"M652,356c0,8 0,8 0,16 \"/><path stroke-width=\"10\" d=\"M652,372c0,5 0,5 0,11 \"/><path stroke-width=\"12\" d=\"M652,383c0,3 0,3 0,5 0,5 1,5 0,9 -1,4 -1,5 -3,9 \"/><path stroke-width=\"13\" d=\"M649,406c-1,1 -1,1 -2,2 -4,3 -4,5 -9,6 \"/><path stroke-width=\"11\" d=\"M638,414c-6,1 -7,-3 -13,-1 -4,1 -2,6 -6,7 \"/><path stroke-width=\"10\" d=\"M619,420c-7,2 -8,-1 -15,-1 \"/><path stroke-width=\"9\" d=\"M604,419c-9,0 -9,0 -19,0 \"/><path stroke-width=\"8\" d=\"M585,419c-10,0 -10,0 -21,0 \"/><path stroke-width=\"10\" d=\"M564,419c-3,0 -3,0 -5,0 \"/><path stroke-width=\"12\" d=\"M559,419c-6,0 -6,1 -12,0 \"/><path stroke-width=\"11\" d=\"M547,419c-4,-1 -4,-2 -8,-5 -5,-4 -5,-4 -10,-8 \"/><path stroke-width=\"10\" d=\"M529,406c-4,-5 -4,-5 -7,-9 \"/><path stroke-width=\"11\" d=\"M522,397c-4,-4 -4,-3 -7,-7 \"/><path stroke-width=\"12\" d=\"M515,390c-3,-3 -3,-3 -5,-7 -1,-3 -1,-3 -2,-7 \"/><path stroke-width=\"13\" d=\"M508,376c-1,-2 1,-3 0,-5 \"/><path stroke-width=\"14\" d=\"M508,371c-1,-2 -2,-2 -3,-2 \"/></g></svg>', 0, ''),
(136, 1, 9, 1, 1, '2025-04-27', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M150,142c0,0 0,0 0,0 \"/><path stroke-width=\"14\" d=\"M150,142c0,6 -1,6 0,13 \"/><path stroke-width=\"9\" d=\"M150,155c2,15 4,15 7,30 \"/><path stroke-width=\"8\" d=\"M157,185c2,13 2,13 4,25 3,15 2,16 5,31 4,18 5,18 9,37 4,21 2,21 6,42 3,13 3,13 6,25 2,10 2,10 4,19 \"/><path stroke-width=\"9\" d=\"M191,364c2,8 4,8 5,16 1,7 -1,7 0,14 \"/><path stroke-width=\"11\" d=\"M196,394c0,2 2,2 3,4 \"/><path stroke-width=\"12\" d=\"M199,398c2,4 3,5 4,9 \"/><path stroke-width=\"14\" d=\"M203,407c0,1 0,0 -1,1 \"/><path stroke-width=\"17\" d=\"M202,411c0,0 0,0 0,0 \"/><path stroke-width=\"18\" d=\"M158,142c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M158,142c5,6 5,6 10,12 \"/><path stroke-width=\"12\" d=\"M168,154c6,8 5,9 13,16 \"/><path stroke-width=\"8\" d=\"M181,170c17,18 17,17 36,33 7,5 7,4 14,10 \"/><path stroke-width=\"9\" d=\"M231,213c7,4 6,5 13,10 \"/><path stroke-width=\"11\" d=\"M244,223c2,1 2,0 5,1 \"/><path stroke-width=\"15\" d=\"M249,224c1,0 1,0 2,0 3,-2 2,-3 5,-5 \"/><path stroke-width=\"12\" d=\"M256,219c4,-2 5,-1 8,-4 \"/><path stroke-width=\"11\" d=\"M264,215c4,-3 3,-4 6,-8 \"/><path stroke-width=\"10\" d=\"M270,207c6,-9 6,-9 11,-18 \"/><path stroke-width=\"11\" d=\"M281,189c1,-2 2,-2 2,-4 \"/><path stroke-width=\"14\" d=\"M283,185c1,-1 -1,-1 0,-3 \"/><path stroke-width=\"12\" d=\"M283,182c3,-9 4,-8 8,-17 \"/><path stroke-width=\"10\" d=\"M291,165c2,-5 1,-5 3,-9 \"/><path stroke-width=\"11\" d=\"M294,156c1,-4 2,-4 3,-8 \"/><path stroke-width=\"13\" d=\"M297,148c1,-2 0,-3 0,-5 \"/><path stroke-width=\"14\" d=\"M297,143c0,-3 0,-3 1,-5 1,-1 2,-1 2,-3 \"/><path stroke-width=\"16\" d=\"M300,135c0,0 -1,-2 -1,-1 \"/><path stroke-width=\"17\" d=\"M299,134c1,2 2,3 4,7 \"/><path stroke-width=\"12\" d=\"M303,141c3,11 3,11 5,22 \"/><path stroke-width=\"8\" d=\"M308,163c5,25 4,25 8,50 \"/><path stroke-width=\"9\" d=\"M316,213c1,8 1,8 3,15 1,8 2,8 3,15 4,25 3,25 6,50 \"/><path stroke-width=\"8\" d=\"M328,293c3,18 4,18 7,35 2,13 2,13 5,25 1,9 2,9 3,17 \"/><path stroke-width=\"10\" d=\"M343,370c1,6 -1,6 0,11 \"/><path stroke-width=\"11\" d=\"M343,381c1,5 2,4 3,9 \"/><path stroke-width=\"12\" d=\"M346,390c1,3 0,3 0,6 \"/><path stroke-width=\"14\" d=\"M346,396c0,2 0,2 0,4 0,2 0,2 0,5 \"/><path stroke-width=\"13\" d=\"M346,405c1,3 0,5 2,6 \"/><path stroke-width=\"15\" d=\"M348,411c3,2 4,0 8,0 \"/><path stroke-width=\"17\" d=\"M519,131c0,0 0,0 0,0 \"/><path stroke-width=\"18\" d=\"M519,131c-1,-1 -1,-2 -2,-2 \"/><path stroke-width=\"13\" d=\"M517,129c-8,-3 -9,-3 -17,-4 \"/><path stroke-width=\"9\" d=\"M500,125c-8,-2 -8,-1 -15,-2 \"/><path stroke-width=\"10\" d=\"M485,123c-6,-1 -6,-2 -12,-2 -6,-1 -6,0 -12,0 \"/><path stroke-width=\"11\" d=\"M461,121c-4,0 -4,0 -8,0 \"/><path stroke-width=\"13\" d=\"M453,121c-2,0 -2,-1 -4,0 \"/><path stroke-width=\"15\" d=\"M449,121c-2,1 -2,1 -5,3 -1,2 -1,3 -3,4 \"/><path stroke-width=\"14\" d=\"M441,128c-1,2 -1,1 -3,3 -1,2 -2,1 -3,4 \"/><path stroke-width=\"13\" d=\"M435,135c-3,4 -3,4 -4,8 \"/><path stroke-width=\"12\" d=\"M431,143c-1,4 0,4 -1,7 -1,5 -2,5 -3,9 -1,4 0,4 0,7 \"/><path stroke-width=\"13\" d=\"M427,166c0,3 0,3 0,7 \"/><path stroke-width=\"14\" d=\"M427,173c0,4 -1,4 0,8 0,3 1,3 3,5 \"/><path stroke-width=\"12\" d=\"M430,186c3,4 3,5 7,7 \"/><path stroke-width=\"10\" d=\"M437,193c8,5 9,3 18,6 4,2 4,3 8,4 \"/><path stroke-width=\"11\" d=\"M463,203c11,4 12,3 23,7 \"/><path stroke-width=\"10\" d=\"M486,210c8,3 8,3 16,7 \"/><path stroke-width=\"9\" d=\"M502,217c6,3 6,4 12,7 \"/><path stroke-width=\"10\" d=\"M514,224c7,3 7,2 14,6 6,3 7,2 12,7 \"/><path stroke-width=\"12\" d=\"M540,237c2,1 0,3 1,4 \"/><path stroke-width=\"14\" d=\"M541,241c1,1 2,0 3,1 \"/><path stroke-width=\"13\" d=\"M544,242c4,3 4,3 6,7 \"/><path stroke-width=\"12\" d=\"M550,249c2,3 1,4 2,7 2,5 3,5 4,10 1,2 1,2 1,5 \"/><path stroke-width=\"13\" d=\"M557,271c1,5 0,5 0,10 \"/><path stroke-width=\"12\" d=\"M557,281c0,3 0,3 0,7 \"/><path stroke-width=\"11\" d=\"M557,288c0,8 0,8 0,16 0,4 0,4 0,8 \"/><path stroke-width=\"12\" d=\"M557,312c0,5 0,5 0,9 \"/><path stroke-width=\"11\" d=\"M557,321c0,6 0,6 0,12 0,6 0,6 -1,11 \"/><path stroke-width=\"12\" d=\"M556,344c0,3 -1,3 -2,5 \"/><path stroke-width=\"14\" d=\"M554,349c-1,2 -2,2 -4,3 \"/><path stroke-width=\"15\" d=\"M550,352c0,1 0,1 -1,2 -2,1 -2,1 -4,3 -2,1 -1,2 -2,3 \"/><path stroke-width=\"14\" d=\"M543,360c-3,4 -2,5 -6,7 \"/><path stroke-width=\"13\" d=\"M537,367c-2,1 -3,-1 -5,0 \"/><path stroke-width=\"14\" d=\"M532,367c-2,0 -1,2 -2,3 \"/><path stroke-width=\"13\" d=\"M530,370c-4,2 -4,0 -9,2 \"/><path stroke-width=\"12\" d=\"M521,372c-3,1 -3,2 -6,3 \"/><path stroke-width=\"14\" d=\"M515,375c-2,0 -2,0 -4,0 -2,0 -2,0 -5,0 \"/><path stroke-width=\"15\" d=\"M506,375c-1,0 -1,0 -3,0 -3,0 -3,0 -7,0 \"/><path stroke-width=\"14\" d=\"M496,375c-1,0 -1,0 -3,0 \"/><path stroke-width=\"16\" d=\"M493,375c0,0 0,0 -1,0 \"/><path stroke-width=\"14\" d=\"M492,375c-4,-1 -4,-2 -8,-3 \"/><path stroke-width=\"13\" d=\"M484,372c-2,-1 -2,-1 -4,-2 -3,-3 -3,-4 -6,-8 -2,-4 -1,-6 -4,-9 \"/><path stroke-width=\"14\" d=\"M470,353c-1,-1 -1,2 -2,1 \"/><path stroke-width=\"15\" d=\"M468,354c-2,0 -1,-1 -3,-3 -1,-1 -1,-1 -2,-2 -1,-1 -1,-1 -1,-3 0,-3 0,-3 0,-6 \"/></g></svg>', 0, ''),
(137, 1, 9, 1, 1, '2025-04-27', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M253,432c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M253,432c-2,-2 -3,-1 -3,-3 \"/><path stroke-width=\"15\" d=\"M250,429c-1,-2 2,-3 1,-5 \"/><path stroke-width=\"11\" d=\"M251,424c-2,-9 -4,-9 -6,-18 \"/><path stroke-width=\"9\" d=\"M245,406c-1,-8 1,-8 0,-16 -1,-10 -2,-10 -4,-20 \"/><path stroke-width=\"8\" d=\"M241,370c-4,-17 -5,-16 -9,-33 -2,-11 -2,-11 -4,-23 -1,-10 1,-10 0,-19 -2,-20 -3,-20 -6,-39 -2,-20 -1,-20 -4,-40 -2,-14 -4,-14 -5,-28 -1,-11 1,-11 0,-22 -1,-9 -2,-9 -3,-17 \"/><path stroke-width=\"11\" d=\"M210,149c0,-2 0,-2 0,-5 \"/><path stroke-width=\"14\" d=\"M210,144c0,-1 0,-1 0,-3 \"/><path stroke-width=\"16\" d=\"M210,141c0,0 0,0 0,-1 0,-2 -1,-2 0,-3 1,-2 2,-4 4,-3 \"/><path stroke-width=\"13\" d=\"M214,134c6,4 6,6 13,12 \"/><path stroke-width=\"9\" d=\"M227,146c6,6 6,6 12,13 6,8 6,8 12,16 \"/><path stroke-width=\"8\" d=\"M251,175c6,6 7,6 12,12 \"/><path stroke-width=\"9\" d=\"M263,187c5,6 4,6 9,12 \"/><path stroke-width=\"10\" d=\"M272,199c3,4 4,4 6,8 \"/><path stroke-width=\"11\" d=\"M278,207c2,4 0,6 3,9 3,4 5,2 9,5 5,4 4,5 10,10 3,2 3,1 6,3 \"/><path stroke-width=\"12\" d=\"M306,234c3,2 3,2 7,4 3,2 3,5 6,3 \"/><path stroke-width=\"14\" d=\"M319,241c4,-2 5,-4 8,-9 \"/><path stroke-width=\"13\" d=\"M327,232c2,-5 1,-6 2,-11 \"/><path stroke-width=\"10\" d=\"M329,221c3,-11 4,-11 6,-22 \"/><path stroke-width=\"8\" d=\"M335,199c2,-8 1,-9 2,-18 1,-10 1,-10 3,-20 2,-10 2,-10 4,-21 \"/><path stroke-width=\"9\" d=\"M344,140c1,-5 2,-5 2,-11 \"/><path stroke-width=\"10\" d=\"M346,129c0,-7 0,-7 0,-13 \"/><path stroke-width=\"11\" d=\"M346,116c0,-4 -1,-7 0,-8 \"/><path stroke-width=\"14\" d=\"M346,108c1,-1 4,2 5,5 \"/><path stroke-width=\"12\" d=\"M351,113c4,10 3,10 6,21 \"/><path stroke-width=\"8\" d=\"M357,134c4,14 4,14 7,27 3,12 4,12 6,25 1,8 0,8 2,16 2,11 3,11 5,23 3,17 3,17 6,34 3,15 3,15 6,30 2,12 2,11 4,23 \"/><path stroke-width=\"9\" d=\"M393,312c2,7 1,7 2,13 2,15 1,15 3,29 \"/><path stroke-width=\"10\" d=\"M398,354c1,4 2,4 2,8 \"/><path stroke-width=\"12\" d=\"M400,362c0,5 -1,6 0,11 \"/><path stroke-width=\"13\" d=\"M400,373c1,2 3,2 4,3 \"/><path stroke-width=\"15\" d=\"M555,134c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M555,134c0,-2 1,-2 0,-3 \"/><path stroke-width=\"16\" d=\"M555,131c-1,-1 -1,-2 -3,-2 \"/><path stroke-width=\"15\" d=\"M552,129c-2,-1 -2,0 -4,0 \"/><path stroke-width=\"14\" d=\"M548,129c-2,0 -3,1 -5,0 \"/><path stroke-width=\"12\" d=\"M543,129c-5,-2 -5,-4 -10,-6 -3,-1 -4,1 -7,0 -6,-1 -5,-3 -10,-4 \"/><path stroke-width=\"11\" d=\"M516,119c-4,-1 -5,-1 -9,-1 \"/><path stroke-width=\"12\" d=\"M507,118c-4,0 -4,0 -8,0 \"/><path stroke-width=\"11\" d=\"M499,118c-6,0 -6,0 -12,0 -6,0 -6,0 -11,0 -4,0 -5,-1 -8,0 \"/><path stroke-width=\"12\" d=\"M468,118c-5,1 -5,1 -9,4 \"/><path stroke-width=\"11\" d=\"M459,122c-5,2 -5,2 -10,5 \"/><path stroke-width=\"12\" d=\"M449,127c-2,2 -2,3 -4,5 \"/><path stroke-width=\"13\" d=\"M445,132c-2,3 -4,2 -5,4 \"/><path stroke-width=\"14\" d=\"M440,136c-1,2 1,3 1,5 0,3 0,3 0,6 \"/><path stroke-width=\"13\" d=\"M441,147c0,5 0,5 0,9 \"/><path stroke-width=\"11\" d=\"M441,156c0,6 0,6 0,12 0,6 -2,6 0,12 \"/><path stroke-width=\"10\" d=\"M441,180c3,8 4,9 10,16 \"/><path stroke-width=\"8\" d=\"M451,196c10,11 11,12 23,20 14,9 15,7 30,14 13,6 12,8 26,11 15,4 15,2 30,5 14,2 14,3 28,6 10,2 10,1 20,4 \"/><path stroke-width=\"9\" d=\"M608,256c6,2 6,3 11,4 \"/><path stroke-width=\"13\" d=\"M619,260c1,1 0,-1 1,-1 \"/><path stroke-width=\"16\" d=\"M620,259c2,1 3,1 5,3 \"/><path stroke-width=\"14\" d=\"M625,262c2,2 2,3 3,5 \"/><path stroke-width=\"13\" d=\"M628,267c2,2 4,2 4,4 1,4 -1,4 -1,9 \"/><path stroke-width=\"14\" d=\"M631,280c0,1 1,1 1,2 1,4 1,4 1,9 \"/><path stroke-width=\"12\" d=\"M633,291c0,4 0,4 0,8 \"/><path stroke-width=\"11\" d=\"M633,299c0,6 0,6 0,12 0,4 0,4 0,7 \"/><path stroke-width=\"12\" d=\"M633,318c0,6 0,6 0,12 0,3 1,3 0,7 \"/><path stroke-width=\"11\" d=\"M633,337c-2,7 -2,7 -5,14 -2,4 -3,3 -5,7 \"/><path stroke-width=\"12\" d=\"M623,358c-2,5 -1,5 -3,9 -2,3 -1,4 -3,7 \"/><path stroke-width=\"13\" d=\"M617,374c-2,1 -3,0 -4,1 \"/><path stroke-width=\"14\" d=\"M613,375c-2,1 -1,3 -2,4 -2,2 -2,1 -4,2 -3,1 -2,2 -5,3 \"/><path stroke-width=\"13\" d=\"M602,384c-3,1 -3,0 -6,0 -4,0 -4,1 -7,0 \"/><path stroke-width=\"12\" d=\"M589,384c-5,-1 -5,-1 -9,-3 \"/><path stroke-width=\"11\" d=\"M580,381c-6,-3 -5,-4 -11,-6 \"/><path stroke-width=\"10\" d=\"M569,375c-6,-2 -7,0 -12,-2 \"/><path stroke-width=\"11\" d=\"M557,373c-4,-2 -3,-5 -8,-6 -6,-2 -7,1 -12,0 \"/><path stroke-width=\"12\" d=\"M537,367c-3,-1 -2,-3 -5,-5 -3,-3 -2,-3 -6,-6 \"/><path stroke-width=\"11\" d=\"M526,356c-4,-4 -5,-3 -9,-7 \"/><path stroke-width=\"12\" d=\"M517,349c-2,-1 -1,-1 -3,-2 \"/><path stroke-width=\"14\" d=\"M514,347c-3,-1 -4,0 -6,-2 -1,-1 0,-2 -1,-4 -2,-2 -2,-2 -4,-4 -2,-2 -3,-2 -5,-3 \"/></g></svg>', 0, '');
INSERT INTO `auditoria` (`IdAuditoria`, `IdSupervisor`, `IdOperario`, `IdActividad`, `IdLinea`, `Fecha`, `Firma`, `NoConforme`, `Comentario`) VALUES
(139, 1, 3, 8, 5, '2025-04-27', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M169,121c0,0 0,0 0,0 \"/><path stroke-width=\"14\" d=\"M169,121c0,12 0,12 0,24 \"/><path stroke-width=\"9\" d=\"M169,145c0,14 0,14 0,27 0,7 0,7 0,13 0,17 0,17 0,34 \"/><path stroke-width=\"8\" d=\"M169,219c0,22 -2,22 0,44 1,15 2,15 6,30 5,22 6,22 11,44 5,20 3,21 8,41 \"/><path stroke-width=\"9\" d=\"M194,378c2,6 3,6 5,12 \"/><path stroke-width=\"10\" d=\"M199,390c2,6 1,6 3,12 \"/><path stroke-width=\"12\" d=\"M202,402c1,3 1,3 2,5 \"/><path stroke-width=\"14\" d=\"M204,407c0,1 -1,2 0,2 \"/><path stroke-width=\"16\" d=\"M204,409c2,3 3,2 5,5 \"/><path stroke-width=\"14\" d=\"M209,414c3,3 3,4 6,6 \"/><path stroke-width=\"13\" d=\"M215,420c2,2 2,1 4,2 \"/><path stroke-width=\"15\" d=\"M219,422c2,0 2,1 3,0 \"/><path stroke-width=\"16\" d=\"M222,422c4,-4 5,-5 8,-10 \"/><path stroke-width=\"13\" d=\"M230,412c3,-9 0,-10 3,-18 \"/><path stroke-width=\"9\" d=\"M233,394c4,-11 6,-11 10,-22 \"/><path stroke-width=\"8\" d=\"M243,372c5,-14 4,-14 8,-29 3,-12 2,-12 5,-24 4,-15 5,-15 9,-30 2,-9 1,-9 2,-18 \"/><path stroke-width=\"9\" d=\"M267,271c1,-8 2,-8 3,-16 2,-14 1,-14 4,-27 \"/><path stroke-width=\"8\" d=\"M274,228c4,-13 5,-13 9,-25 3,-13 3,-13 6,-26 2,-8 1,-8 3,-15 \"/><path stroke-width=\"9\" d=\"M292,162c2,-9 4,-9 6,-18 \"/><path stroke-width=\"10\" d=\"M298,144c2,-4 0,-5 1,-9 \"/><path stroke-width=\"11\" d=\"M299,135c2,-6 4,-5 6,-11 1,-4 -1,-4 0,-8 \"/><path stroke-width=\"12\" d=\"M305,116c1,-4 3,-3 5,-8 2,-3 2,-4 3,-8 \"/><path stroke-width=\"11\" d=\"M313,100c2,-6 2,-7 4,-13 \"/><path stroke-width=\"13\" d=\"M317,87c1,-1 2,0 2,0 \"/><path stroke-width=\"15\" d=\"M319,87c0,-1 -2,-2 -1,-3 1,-2 3,-1 4,-2 \"/><path stroke-width=\"14\" d=\"M322,82c1,-1 -1,-2 -1,-4 \"/><path stroke-width=\"16\" d=\"M321,78c0,0 0,0 0,-1 \"/><path stroke-width=\"17\" d=\"M416,392c0,0 0,0 0,0 \"/><path stroke-width=\"15\" d=\"M416,392c0,-10 -2,-10 0,-20 \"/><path stroke-width=\"11\" d=\"M416,372c1,-8 3,-8 5,-16 \"/><path stroke-width=\"9\" d=\"M421,356c4,-14 3,-14 6,-28 \"/><path stroke-width=\"8\" d=\"M427,328c1,-8 1,-8 2,-16 2,-17 3,-17 5,-33 2,-22 1,-22 3,-44 3,-30 3,-30 5,-60 2,-19 0,-19 2,-39 2,-20 3,-20 5,-41 1,-16 1,-16 2,-32 0,-10 0,-10 0,-19 \"/><path stroke-width=\"10\" d=\"M451,44c0,-4 0,-4 0,-7 \"/><path stroke-width=\"13\" d=\"M451,37c0,-2 0,-5 0,-4 \"/><path stroke-width=\"15\" d=\"M451,33c2,6 2,9 5,18 \"/><path stroke-width=\"12\" d=\"M456,51c2,9 2,9 5,18 \"/><path stroke-width=\"10\" d=\"M461,69c2,6 3,6 4,12 \"/><path stroke-width=\"9\" d=\"M465,81c4,13 2,14 6,27 \"/><path stroke-width=\"8\" d=\"M471,108c3,7 5,6 9,13 \"/><path stroke-width=\"10\" d=\"M480,121c2,5 2,5 4,10 \"/><path stroke-width=\"11\" d=\"M484,131c2,4 2,6 5,9 \"/><path stroke-width=\"12\" d=\"M489,140c2,2 4,0 6,2 \"/><path stroke-width=\"14\" d=\"M495,142c1,1 -1,2 0,3 \"/><path stroke-width=\"15\" d=\"M495,145c1,1 2,0 3,0 2,0 2,0 3,0 \"/><path stroke-width=\"14\" d=\"M501,145c4,0 4,1 7,0 \"/><path stroke-width=\"12\" d=\"M508,145c6,-2 6,-2 10,-6 \"/><path stroke-width=\"11\" d=\"M518,139c5,-3 4,-4 8,-8 \"/><path stroke-width=\"9\" d=\"M526,131c8,-8 9,-7 16,-16 \"/><path stroke-width=\"8\" d=\"M542,115c6,-8 6,-8 12,-17 7,-11 8,-10 13,-22 6,-14 3,-15 9,-29 4,-10 6,-9 11,-20 \"/><path stroke-width=\"9\" d=\"M587,27c3,-6 3,-6 4,-13 3,-8 1,-10 4,-17 \"/><path stroke-width=\"11\" d=\"M595,-3c1,-3 3,-1 5,-3 \"/><path stroke-width=\"14\" d=\"M600,-6c1,-1 2,-4 2,-3 \"/><path stroke-width=\"15\" d=\"M602,-9c1,3 -1,6 -1,11 \"/><path stroke-width=\"12\" d=\"M601,2c1,21 3,21 5,41 \"/><path stroke-width=\"9\" d=\"M606,43c0,8 0,8 0,15 0,15 -1,15 0,31 \"/><path stroke-width=\"8\" d=\"M606,89c2,20 4,20 6,41 2,20 1,20 2,40 2,26 2,26 4,51 1,20 2,20 4,40 2,27 0,27 3,53 2,23 4,22 6,44 2,21 0,21 2,41 1,13 3,13 4,25 0,9 -1,9 -1,19 \"/><path stroke-width=\"9\" d=\"M636,443c0,5 -1,5 0,10 \"/><path stroke-width=\"11\" d=\"M636,453c1,5 2,4 3,9 \"/><path stroke-width=\"12\" d=\"M639,462c1,4 0,4 0,8 \"/><path stroke-width=\"13\" d=\"M639,470c0,2 0,2 0,4 \"/><path stroke-width=\"14\" d=\"M639,474c1,3 1,3 2,5 \"/></g></svg></svg>', 0, ''),
(141, 1, 4, 10, 7, '2025-04-27', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M454,45c0,0 0,0 0,0 0,2 0,2 0,5 \"/><path stroke-width=\"11\" d=\"M454,50c0,9 0,9 0,18 \"/><path stroke-width=\"8\" d=\"M454,68c0,11 0,11 0,21 0,13 0,13 0,26 0,15 1,15 2,29 0,10 1,10 1,20 0,22 -1,22 0,44 0,12 2,12 3,24 2,20 1,20 2,40 1,15 1,15 3,30 1,14 2,14 3,27 1,9 0,9 0,17 \"/><path stroke-width=\"10\" d=\"M468,346c0,5 0,5 0,10 \"/><path stroke-width=\"11\" d=\"M468,356c0,6 0,6 0,11 0,5 0,5 0,9 \"/><path stroke-width=\"12\" d=\"M468,376c0,4 0,4 0,7 \"/><path stroke-width=\"14\" d=\"M468,383c0,1 0,1 0,2 \"/><path stroke-width=\"15\" d=\"M468,385c0,2 0,2 0,3 \"/><path stroke-width=\"16\" d=\"M468,388c0,1 1,2 0,2 -1,1 -2,0 -3,-1 \"/><path stroke-width=\"12\" d=\"M465,389c-13,-10 -12,-12 -25,-21 \"/><path stroke-width=\"8\" d=\"M440,368c-14,-9 -15,-9 -30,-16 -10,-6 -11,-5 -22,-10 -18,-9 -18,-8 -36,-17 -18,-9 -18,-10 -36,-20 -18,-9 -18,-9 -35,-19 -18,-10 -18,-10 -35,-20 -13,-8 -13,-8 -26,-16 -11,-6 -12,-5 -22,-11 \"/><path stroke-width=\"9\" d=\"M198,239c-5,-3 -4,-4 -9,-7 \"/><path stroke-width=\"12\" d=\"M189,232c-1,-1 -1,-1 -3,-2 \"/><path stroke-width=\"15\" d=\"M186,230c0,-1 -1,-1 -1,-3 \"/><path stroke-width=\"16\" d=\"M185,227c0,-1 0,-2 1,-2 \"/><path stroke-width=\"14\" d=\"M186,225c6,-2 6,0 13,-1 \"/><path stroke-width=\"10\" d=\"M199,224c8,-1 7,-2 15,-3 \"/><path stroke-width=\"9\" d=\"M214,221c11,-2 11,-2 22,-3 \"/><path stroke-width=\"8\" d=\"M236,218c16,-1 16,0 32,0 28,0 28,0 57,0 33,0 33,0 67,0 41,0 41,0 82,0 39,0 39,0 78,0 32,0 32,0 63,0 15,0 15,0 30,0 \"/><path stroke-width=\"10\" d=\"M645,218c2,0 3,0 3,0 \"/></g></svg></svg>', 0, ''),
(142, 1, 5, 10, 9, '2025-04-27', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M321,153c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M321,153c0,-2 0,-2 0,-5 \"/><path stroke-width=\"16\" d=\"M321,148c0,-2 1,-3 0,-5 -1,-1 -2,-1 -4,-2 \"/><path stroke-width=\"14\" d=\"M317,141c-3,-2 -3,-3 -6,-4 \"/><path stroke-width=\"11\" d=\"M311,137c-7,-1 -7,0 -14,0 \"/><path stroke-width=\"10\" d=\"M297,137c-5,0 -5,0 -11,0 -10,0 -10,0 -21,0 \"/><path stroke-width=\"8\" d=\"M265,137c-9,0 -9,0 -18,0 \"/><path stroke-width=\"10\" d=\"M247,137c-5,0 -5,-1 -11,0 \"/><path stroke-width=\"9\" d=\"M236,137c-10,1 -11,0 -20,5 -5,2 -4,5 -9,9 \"/><path stroke-width=\"10\" d=\"M207,151c-5,4 -6,3 -11,8 \"/><path stroke-width=\"9\" d=\"M196,159c-7,8 -7,9 -13,18 -5,7 -6,6 -9,13 -4,11 -3,12 -6,23 \"/><path stroke-width=\"8\" d=\"M168,213c-6,18 -7,18 -12,37 -3,11 -2,11 -3,23 -1,10 0,10 0,21 0,10 -1,10 0,19 \"/><path stroke-width=\"9\" d=\"M153,313c0,7 0,8 2,14 \"/><path stroke-width=\"10\" d=\"M155,327c1,5 3,4 5,9 5,9 4,10 10,19 2,3 3,2 5,4 \"/><path stroke-width=\"11\" d=\"M175,359c7,5 7,5 13,11 2,2 1,3 2,4 \"/><path stroke-width=\"15\" d=\"M190,374c1,0 1,-1 1,-1 \"/><path stroke-width=\"13\" d=\"M191,373c6,3 6,4 12,8 \"/><path stroke-width=\"10\" d=\"M203,381c6,4 6,3 12,7 \"/><path stroke-width=\"11\" d=\"M215,388c3,2 3,3 6,5 \"/><path stroke-width=\"10\" d=\"M221,393c8,4 8,3 16,7 \"/><path stroke-width=\"9\" d=\"M237,400c10,5 9,7 18,10 \"/><path stroke-width=\"11\" d=\"M255,410c2,1 2,-2 4,-2 12,-1 13,0 25,0 \"/><path stroke-width=\"9\" d=\"M284,408c7,0 7,0 14,0 \"/><path stroke-width=\"10\" d=\"M298,408c7,0 7,0 13,0 \"/><path stroke-width=\"9\" d=\"M311,408c9,0 9,0 18,0 \"/><path stroke-width=\"10\" d=\"M329,408c4,0 5,1 8,0 \"/><path stroke-width=\"11\" d=\"M337,408c6,-3 6,-5 12,-9 3,-2 3,-1 6,-3 \"/><path stroke-width=\"13\" d=\"M355,396c3,-2 3,-1 5,-3 \"/><path stroke-width=\"14\" d=\"M360,393c1,-2 1,-2 2,-4 \"/><path stroke-width=\"15\" d=\"M362,389c0,-1 -1,-1 0,-2 \"/><path stroke-width=\"16\" d=\"M362,387c1,-1 2,0 3,-1 1,-1 1,-2 2,-2 \"/><path stroke-width=\"17\" d=\"M367,384c1,-1 2,1 3,0 \"/><path stroke-width=\"16\" d=\"M370,384c3,-3 2,-4 4,-8 \"/><path stroke-width=\"15\" d=\"M374,376c1,-1 2,-2 2,-3 \"/><path stroke-width=\"16\" d=\"M376,373c0,0 -1,0 -1,0 \"/><path stroke-width=\"17\" d=\"M375,373c2,0 3,0 6,0 \"/><path stroke-width=\"17\" d=\"M435,134c0,0 0,0 0,0 \"/><path stroke-width=\"16\" d=\"M435,134c2,2 3,1 3,3 \"/><path stroke-width=\"13\" d=\"M438,137c1,4 0,4 0,9 \"/><path stroke-width=\"11\" d=\"M438,146c0,6 1,6 2,13 \"/><path stroke-width=\"9\" d=\"M440,159c1,15 1,15 3,30 \"/><path stroke-width=\"8\" d=\"M443,189c2,17 4,17 6,33 1,12 0,12 0,23 0,13 -1,13 0,25 0,12 1,12 2,23 1,14 2,14 3,29 \"/><path stroke-width=\"9\" d=\"M454,322c0,6 -1,6 0,12 \"/><path stroke-width=\"10\" d=\"M454,334c1,6 2,5 3,11 \"/><path stroke-width=\"11\" d=\"M457,345c1,5 0,5 0,11 \"/><path stroke-width=\"12\" d=\"M457,356c0,3 0,3 0,6 \"/><path stroke-width=\"15\" d=\"M457,362c0,3 0,3 0,5 0,2 0,2 0,4 \"/><path stroke-width=\"16\" d=\"M457,371c0,1 0,1 0,2 \"/><path stroke-width=\"17\" d=\"M446,131c0,0 0,0 0,0 6,-3 6,-3 12,-5 \"/><path stroke-width=\"12\" d=\"M458,126c10,-3 10,-3 21,-4 \"/><path stroke-width=\"8\" d=\"M479,122c9,-1 9,1 19,1 \"/><path stroke-width=\"10\" d=\"M498,123c5,0 5,0 10,0 \"/><path stroke-width=\"11\" d=\"M508,123c5,0 5,0 10,1 \"/><path stroke-width=\"12\" d=\"M518,124c3,2 3,3 6,5 \"/><path stroke-width=\"13\" d=\"M524,129c2,2 3,2 5,4 \"/><path stroke-width=\"12\" d=\"M529,133c3,4 3,4 6,8 \"/><path stroke-width=\"10\" d=\"M535,141c5,7 5,7 9,14 3,5 3,5 4,11 \"/><path stroke-width=\"11\" d=\"M548,166c2,4 -1,5 1,8 \"/><path stroke-width=\"12\" d=\"M549,174c1,2 3,0 4,2 3,6 3,7 4,14 0,2 0,2 0,5 \"/><path stroke-width=\"13\" d=\"M557,195c0,4 0,4 0,9 \"/><path stroke-width=\"12\" d=\"M557,204c0,4 0,4 0,8 \"/><path stroke-width=\"13\" d=\"M557,212c0,2 0,2 0,4 0,4 1,4 0,8 \"/><path stroke-width=\"12\" d=\"M557,224c-1,5 0,5 -2,9 -3,5 -4,5 -8,8 \"/><path stroke-width=\"14\" d=\"M547,241c-2,1 -2,1 -4,2 \"/><path stroke-width=\"13\" d=\"M543,243c-9,4 -9,5 -19,8 \"/><path stroke-width=\"11\" d=\"M524,251c-4,2 -5,0 -10,2 \"/><path stroke-width=\"12\" d=\"M514,253c-5,2 -4,4 -9,6 \"/><path stroke-width=\"14\" d=\"M505,259c-2,1 -2,0 -5,0 \"/><path stroke-width=\"15\" d=\"M500,259c-1,0 -1,0 -2,0 -1,0 -1,0 -3,0 -2,0 -2,0 -4,0 \"/><path stroke-width=\"14\" d=\"M491,259c-3,0 -3,0 -6,0 \"/><path stroke-width=\"13\" d=\"M485,259c-4,0 -4,0 -8,0 -4,0 -4,0 -7,0 \"/><path stroke-width=\"14\" d=\"M470,259c-1,0 -2,-1 -3,0 -2,1 -4,4 -4,4 \"/><path stroke-width=\"15\" d=\"M463,263c1,1 4,-1 7,-1 \"/><path stroke-width=\"14\" d=\"M470,262c6,0 6,1 11,2 \"/><path stroke-width=\"10\" d=\"M481,264c22,5 23,3 43,10 \"/><path stroke-width=\"9\" d=\"M524,274c6,2 5,4 10,7 9,5 9,4 18,8 \"/><path stroke-width=\"8\" d=\"M552,289c16,8 17,7 32,16 \"/><path stroke-width=\"9\" d=\"M584,305c5,3 4,4 9,7 \"/><path stroke-width=\"10\" d=\"M593,312c6,5 7,4 12,10 7,9 6,10 12,21 \"/><path stroke-width=\"9\" d=\"M617,343c5,9 4,9 9,19 3,5 4,4 6,9 \"/><path stroke-width=\"10\" d=\"M632,371c4,9 3,9 6,18 \"/><path stroke-width=\"9\" d=\"M638,389c2,6 1,7 3,13 \"/><path stroke-width=\"10\" d=\"M641,402c2,6 3,6 5,12 2,6 2,7 4,13 2,7 2,7 5,14 \"/><path stroke-width=\"12\" d=\"M655,441c0,1 0,1 0,2 \"/><path stroke-width=\"14\" d=\"M655,443c1,6 1,6 2,13 \"/><path stroke-width=\"13\" d=\"M657,456c1,2 1,2 2,5 \"/><path stroke-width=\"15\" d=\"M659,461c1,0 1,0 1,1 \"/><path stroke-width=\"16\" d=\"M660,462c0,1 0,1 0,3 0,1 0,1 0,1 \"/><path stroke-width=\"17\" d=\"M660,466c0,1 0,1 0,2 1,3 0,4 2,7 \"/><path stroke-width=\"15\" d=\"M662,475c2,3 4,3 5,5 \"/><path stroke-width=\"13\" d=\"M667,480c1,1 0,1 -1,1 \"/></g></svg>', 0, ''),
(143, 1, 3, 1, 2, '2025-11-14', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M65,182c0,0 0,0 0,0 \"/><path stroke-width=\"14\" d=\"M65,182c5,4 6,4 11,9 \"/><path stroke-width=\"10\" d=\"M76,191c4,3 4,3 7,7 \"/><path stroke-width=\"11\" d=\"M83,198c5,4 5,3 8,8 \"/><path stroke-width=\"10\" d=\"M91,206c5,4 5,5 10,10 4,4 5,3 9,6 \"/><path stroke-width=\"11\" d=\"M110,222c5,4 4,4 8,8 \"/><path stroke-width=\"10\" d=\"M118,230c6,6 6,6 12,12 4,3 5,2 9,6 7,6 7,6 12,14 \"/><path stroke-width=\"9\" d=\"M151,262c5,7 4,8 9,16 4,6 4,6 8,12 5,8 5,8 10,16 3,5 4,5 6,10 \"/><path stroke-width=\"11\" d=\"M184,316c2,4 1,4 3,8 \"/><path stroke-width=\"12\" d=\"M187,324c1,3 1,3 2,6 \"/><path stroke-width=\"15\" d=\"M189,330c0,0 0,1 0,1 3,-4 5,-5 8,-10 \"/><path stroke-width=\"11\" d=\"M197,321c9,-19 9,-20 17,-39 \"/><path stroke-width=\"8\" d=\"M214,282c9,-24 7,-25 18,-49 13,-29 13,-29 29,-56 11,-20 14,-18 26,-37 9,-14 7,-15 16,-29 \"/><path stroke-width=\"9\" d=\"M303,111c3,-5 4,-5 8,-10 \"/><path stroke-width=\"12\" d=\"M311,101c1,-1 1,-1 3,-1 \"/><path stroke-width=\"15\" d=\"M314,100c1,0 1,0 1,0 \"/><path stroke-width=\"17\" d=\"M290,341c0,0 0,0 0,0 \"/><path stroke-width=\"16\" d=\"M290,341c5,-4 7,-3 11,-8 \"/><path stroke-width=\"11\" d=\"M301,333c10,-13 9,-14 18,-29 \"/><path stroke-width=\"8\" d=\"M319,304c12,-20 13,-20 22,-41 12,-27 11,-28 19,-56 6,-20 2,-21 9,-40 5,-15 8,-14 14,-28 3,-7 2,-8 5,-15 \"/><path stroke-width=\"9\" d=\"M388,124c3,-7 4,-7 8,-13 \"/><path stroke-width=\"10\" d=\"M396,111c2,-4 2,-5 4,-7 \"/><path stroke-width=\"13\" d=\"M400,104c2,-2 4,-3 5,-1 4,8 4,9 7,19 \"/><path stroke-width=\"10\" d=\"M412,122c7,25 8,25 13,50 \"/><path stroke-width=\"8\" d=\"M425,172c4,18 2,19 5,37 3,19 3,19 6,39 \"/><path stroke-width=\"9\" d=\"M436,248c1,6 0,11 2,12 \"/><path stroke-width=\"12\" d=\"M438,260c2,2 5,-3 7,-7 \"/><path stroke-width=\"11\" d=\"M445,253c8,-20 6,-21 14,-41 \"/><path stroke-width=\"8\" d=\"M459,212c7,-17 6,-17 14,-35 10,-22 9,-23 21,-45 7,-13 7,-13 16,-24 \"/><path stroke-width=\"9\" d=\"M510,108c4,-5 4,-5 9,-8 \"/><path stroke-width=\"11\" d=\"M519,100c3,-2 4,-4 5,-2 \"/><path stroke-width=\"13\" d=\"M524,98c9,8 9,10 15,22 \"/><path stroke-width=\"10\" d=\"M539,120c7,12 6,12 12,25 \"/><path stroke-width=\"8\" d=\"M551,145c6,13 6,13 12,27 4,10 4,10 8,21 3,9 3,9 6,17 \"/><path stroke-width=\"9\" d=\"M577,210c2,9 2,9 4,19 \"/><path stroke-width=\"8\" d=\"M581,229c2,11 2,11 3,22 1,12 0,12 0,24 0,13 0,13 0,26 0,14 0,14 0,27 \"/><path stroke-width=\"9\" d=\"M584,328c0,6 0,6 0,11 \"/><path stroke-width=\"12\" d=\"M584,339c0,2 0,3 0,3 \"/></g></svg></svg>', 0, ''),
(144, 1, 3, 8, 5, '2025-11-14', '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M269,251c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M269,251c-3,-5 -2,-5 -5,-10 \"/><path stroke-width=\"13\" d=\"M264,241c-4,-7 -5,-7 -8,-14 \"/><path stroke-width=\"9\" d=\"M256,227c-4,-8 -4,-8 -6,-17 \"/><path stroke-width=\"10\" d=\"M250,210c-1,-5 0,-5 0,-11 \"/><path stroke-width=\"11\" d=\"M250,199c0,-4 0,-4 0,-8 \"/><path stroke-width=\"13\" d=\"M250,191c0,-3 0,-3 0,-6 \"/><path stroke-width=\"14\" d=\"M250,185c0,-2 -1,-3 0,-5 \"/><path stroke-width=\"16\" d=\"M250,180c0,0 1,0 2,0 \"/><path stroke-width=\"15\" d=\"M252,180c4,0 4,-1 7,1 \"/><path stroke-width=\"12\" d=\"M259,181c6,2 5,4 10,7 \"/><path stroke-width=\"9\" d=\"M269,188c14,8 14,8 29,16 \"/><path stroke-width=\"8\" d=\"M298,204c12,7 12,8 24,13 13,4 14,3 27,5 11,2 11,2 21,3 \"/><path stroke-width=\"9\" d=\"M370,225c7,1 7,0 13,0 \"/><path stroke-width=\"11\" d=\"M383,225c4,0 5,2 8,0 6,-4 4,-6 10,-11 \"/><path stroke-width=\"9\" d=\"M401,214c13,-10 15,-8 27,-19 \"/><path stroke-width=\"8\" d=\"M428,195c12,-10 10,-12 21,-23 10,-11 11,-10 21,-21 11,-12 10,-13 21,-24 \"/><path stroke-width=\"9\" d=\"M491,127c5,-5 7,-4 11,-8 \"/><path stroke-width=\"12\" d=\"M502,119c1,-1 0,-4 0,-3 \"/><path stroke-width=\"13\" d=\"M502,116c-3,8 -3,11 -7,22 \"/><path stroke-width=\"10\" d=\"M495,138c-8,20 -8,20 -17,39 \"/><path stroke-width=\"8\" d=\"M478,177c-10,20 -11,19 -21,40 -11,24 -10,25 -21,50 -9,21 -10,21 -19,42 -9,20 -8,20 -16,40 -3,8 -3,8 -7,17 \"/><path stroke-width=\"9\" d=\"M394,366c-1,5 -2,5 -3,11 \"/><path stroke-width=\"13\" d=\"M391,377c0,1 0,3 0,2 \"/><path stroke-width=\"16\" d=\"M391,379c0,-1 0,-3 0,-7 \"/><path stroke-width=\"14\" d=\"M391,372c0,-4 -2,-5 0,-8 \"/><path stroke-width=\"10\" d=\"M391,364c5,-9 6,-9 14,-16 \"/><path stroke-width=\"8\" d=\"M405,348c8,-6 8,-6 17,-10 15,-8 16,-6 32,-13 11,-5 11,-5 22,-10 \"/><path stroke-width=\"9\" d=\"M476,315c6,-3 7,-2 13,-6 \"/><path stroke-width=\"10\" d=\"M489,309c3,-2 2,-5 6,-6 \"/><path stroke-width=\"14\" d=\"M495,303c2,-1 2,1 5,2 \"/><path stroke-width=\"13\" d=\"M500,305c7,3 7,3 14,6 \"/><path stroke-width=\"10\" d=\"M514,311c5,3 6,2 10,6 \"/><path stroke-width=\"12\" d=\"M524,317c2,1 0,4 2,4 \"/><path stroke-width=\"15\" d=\"M526,321c1,1 2,-1 4,-1 \"/><path stroke-width=\"16\" d=\"M530,320c1,0 3,0 2,0 -3,0 -5,-1 -10,1 \"/><path stroke-width=\"12\" d=\"M522,321c-10,3 -10,4 -19,10 \"/><path stroke-width=\"8\" d=\"M503,331c-9,6 -9,6 -17,13 \"/><path stroke-width=\"9\" d=\"M486,344c-7,5 -7,4 -13,10 -7,6 -7,7 -12,14 \"/><path stroke-width=\"10\" d=\"M461,368c-3,5 -3,5 -5,10 \"/><path stroke-width=\"11\" d=\"M456,378c-2,3 -3,3 -4,7 \"/><path stroke-width=\"13\" d=\"M452,385c-1,2 0,3 0,5 \"/><path stroke-width=\"15\" d=\"M452,390c0,1 0,1 0,1 \"/><path stroke-width=\"14\" d=\"M452,391c4,0 5,1 9,0 \"/><path stroke-width=\"10\" d=\"M461,391c14,-2 14,-2 28,-5 \"/><path stroke-width=\"8\" d=\"M489,386c12,-2 12,-3 23,-5 \"/><path stroke-width=\"9\" d=\"M512,381c7,-2 7,-2 14,-3 \"/><path stroke-width=\"12\" d=\"M526,378c2,0 4,-1 3,0 \"/><path stroke-width=\"15\" d=\"M529,378c-3,2 -6,2 -11,5 \"/><path stroke-width=\"12\" d=\"M518,383c-12,6 -12,7 -25,13 \"/><path stroke-width=\"8\" d=\"M493,396c-16,9 -18,7 -33,17 -17,11 -17,12 -31,25 -11,11 -11,12 -20,25 -6,8 -8,8 -10,18 -3,10 -2,11 0,22 3,14 2,16 10,28 10,14 12,15 28,24 15,9 16,11 33,13 25,3 28,6 51,-3 34,-13 37,-15 63,-41 17,-17 15,-20 24,-43 8,-20 3,-21 8,-43 2,-9 3,-9 5,-18 2,-8 2,-8 3,-17 \"/><path stroke-width=\"12\" d=\"M624,403c0,-1 0,-1 0,-2 \"/><path stroke-width=\"15\" d=\"M624,401c0,-3 0,-9 0,-7 \"/><path stroke-width=\"14\" d=\"M624,394c0,11 1,16 0,32 \"/><path stroke-width=\"10\" d=\"M624,426c-1,17 -1,17 -3,34 \"/><path stroke-width=\"8\" d=\"M621,460c-2,17 -4,17 -5,34 -1,13 0,13 0,26 \"/><path stroke-width=\"11\" d=\"M616,520c0,2 -1,2 0,4 \"/><path stroke-width=\"14\" d=\"M616,524c1,1 2,3 3,2 \"/><path stroke-width=\"11\" d=\"M619,526c11,-9 13,-10 22,-23 \"/><path stroke-width=\"8\" d=\"M641,503c23,-33 22,-34 42,-69 24,-42 24,-42 46,-85 22,-43 21,-44 43,-87 20,-40 22,-39 40,-80 9,-21 7,-27 13,-44 \"/><path stroke-width=\"10\" d=\"M825,138c1,-2 1,3 0,7 -6,20 -6,20 -14,41 \"/><path stroke-width=\"8\" d=\"M811,186c-10,26 -10,26 -21,52 -10,21 -11,21 -21,42 -14,29 -14,29 -26,59 -10,23 -9,23 -18,47 -6,17 -6,17 -11,34 \"/><path stroke-width=\"9\" d=\"M714,420c-1,4 -1,8 0,8 \"/><path stroke-width=\"13\" d=\"M714,428c2,0 3,-5 6,-9 \"/><path stroke-width=\"12\" d=\"M720,419c8,-12 8,-12 17,-23 \"/><path stroke-width=\"8\" d=\"M737,396c7,-8 8,-7 15,-15 7,-8 6,-9 12,-17 \"/><path stroke-width=\"11\" d=\"M764,364c1,-1 2,-1 3,-2 \"/><path stroke-width=\"14\" d=\"M767,362c1,-2 0,-6 0,-5 \"/><path stroke-width=\"13\" d=\"M767,357c0,6 0,10 1,19 \"/><path stroke-width=\"12\" d=\"M768,376c0,3 0,3 1,6 \"/><path stroke-width=\"15\" d=\"M769,382c0,1 0,1 0,1 \"/><path stroke-width=\"16\" d=\"M769,383c1,-1 3,0 3,-2 \"/><path stroke-width=\"12\" d=\"M772,381c6,-25 6,-25 10,-51 \"/><path stroke-width=\"8\" d=\"M782,330c3,-22 2,-23 3,-45 1,-29 1,-29 0,-58 -1,-20 -1,-20 -5,-39 -2,-10 -3,-10 -6,-19 \"/><path stroke-width=\"11\" d=\"M774,169c-1,-1 -1,-3 -2,-2 -7,3 -8,5 -15,11 \"/><path stroke-width=\"8\" d=\"M757,178c-19,20 -20,20 -37,42 -22,29 -23,28 -41,60 -12,21 -10,22 -18,45 -3,8 -3,8 -3,16 \"/><path stroke-width=\"10\" d=\"M658,341c0,4 1,5 3,8 \"/><path stroke-width=\"13\" d=\"M661,349c0,1 1,0 2,0 6,-1 6,-1 11,-3 \"/><path stroke-width=\"10\" d=\"M674,346c7,-3 6,-4 13,-8 \"/><path stroke-width=\"9\" d=\"M687,338c2,-1 2,-1 5,-2 \"/></g></svg></svg>', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoriaitembpm`
--

CREATE TABLE `auditoriaitembpm` (
  `IdAuditoriaItemBPM` int(11) NOT NULL,
  `IdAuditoria` int(11) NOT NULL,
  `IdItemBPM` int(11) NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auditoriaitembpm`
--

INSERT INTO `auditoriaitembpm` (`IdAuditoriaItemBPM`, `IdAuditoria`, `IdItemBPM`, `Estado`) VALUES
(37, 8, 1, 1),
(39, 8, 2, 2),
(40, 8, 6, 3),
(42, 8, 4, 1),
(43, 9, 2, 2),
(44, 16, 1, 1),
(45, 16, 2, 2),
(46, 16, 3, 3),
(47, 16, 4, 1),
(48, 16, 5, 2),
(49, 16, 6, 3),
(50, 16, 7, 1),
(51, 16, 8, 2),
(52, 16, 9, 3),
(53, 16, 10, 2),
(54, 16, 11, 3),
(55, 16, 12, 3),
(56, 23, 1, 1),
(57, 23, 2, 2),
(58, 23, 3, 3),
(59, 23, 4, 1),
(60, 23, 5, 2),
(61, 23, 6, 3),
(62, 23, 7, 1),
(63, 23, 8, 2),
(64, 23, 9, 3),
(65, 23, 10, 2),
(66, 23, 11, 3),
(67, 23, 12, 3),
(68, 24, 1, 1),
(69, 24, 2, 2),
(70, 24, 3, 3),
(71, 24, 4, 1),
(72, 24, 5, 2),
(73, 24, 6, 3),
(74, 24, 7, 1),
(75, 24, 8, 2),
(76, 24, 9, 3),
(77, 24, 10, 2),
(78, 24, 11, 3),
(79, 24, 12, 3),
(80, 25, 1, 1),
(81, 25, 2, 2),
(82, 25, 3, 3),
(83, 25, 4, 1),
(84, 25, 5, 2),
(85, 25, 6, 3),
(86, 25, 7, 1),
(87, 25, 8, 2),
(88, 25, 9, 3),
(89, 25, 10, 2),
(90, 25, 11, 3),
(91, 25, 12, 3),
(92, 26, 1, 1),
(93, 26, 2, 2),
(94, 26, 3, 3),
(95, 26, 4, 1),
(96, 26, 5, 2),
(97, 26, 6, 3),
(98, 26, 7, 1),
(99, 26, 8, 2),
(100, 26, 9, 3),
(101, 26, 10, 2),
(102, 26, 11, 3),
(103, 26, 12, 3),
(104, 27, 1, 1),
(105, 27, 2, 2),
(106, 27, 3, 3),
(107, 27, 4, 1),
(108, 27, 5, 2),
(109, 27, 6, 3),
(110, 27, 7, 1),
(111, 27, 8, 2),
(112, 27, 9, 3),
(113, 27, 10, 2),
(114, 27, 11, 3),
(115, 27, 12, 3),
(116, 28, 1, 1),
(117, 28, 2, 2),
(118, 28, 3, 3),
(119, 28, 4, 1),
(120, 28, 5, 2),
(121, 28, 6, 3),
(122, 28, 7, 1),
(123, 28, 8, 2),
(124, 28, 9, 3),
(125, 28, 10, 2),
(126, 28, 11, 3),
(127, 28, 12, 3),
(128, 35, 1, 1),
(129, 35, 2, 2),
(130, 35, 3, 3),
(131, 35, 4, 2),
(132, 35, 5, 1),
(133, 35, 6, 1),
(134, 35, 7, 2),
(135, 35, 8, 3),
(136, 35, 9, 2),
(137, 35, 10, 1),
(138, 35, 11, 1),
(139, 36, 1, 1),
(140, 36, 2, 2),
(141, 36, 3, 2),
(142, 36, 4, 2),
(143, 36, 5, 1),
(144, 36, 6, 1),
(145, 36, 7, 1),
(146, 36, 8, 2),
(147, 36, 9, 2),
(148, 36, 10, 2),
(149, 36, 11, 3),
(150, 37, 1, 1),
(151, 37, 2, 2),
(152, 37, 3, 3),
(153, 37, 4, 2),
(154, 37, 5, 1),
(155, 37, 6, 2),
(156, 37, 7, 2),
(157, 37, 8, 2),
(158, 37, 9, 2),
(159, 37, 10, 2),
(160, 37, 11, 3),
(161, 38, 1, 1),
(162, 38, 2, 2),
(163, 38, 3, 2),
(164, 38, 4, 2),
(165, 38, 5, 2),
(166, 38, 6, 2),
(167, 38, 7, 1),
(168, 38, 8, 1),
(169, 38, 9, 1),
(170, 38, 10, 3),
(171, 38, 11, 3),
(172, 39, 1, 1),
(173, 39, 2, 2),
(174, 39, 3, 1),
(175, 39, 4, 1),
(176, 39, 5, 1),
(177, 39, 6, 1),
(178, 39, 7, 3),
(179, 39, 8, 3),
(180, 39, 9, 1),
(181, 39, 10, 1),
(182, 39, 11, 1),
(183, 40, 1, 1),
(184, 40, 3, 1),
(185, 40, 4, 1),
(186, 40, 5, 1),
(187, 40, 6, 1),
(188, 40, 7, 1),
(189, 40, 8, 1),
(190, 40, 9, 1),
(191, 40, 10, 1),
(192, 40, 11, 1),
(193, 41, 1, 1),
(194, 41, 2, 2),
(195, 41, 3, 2),
(196, 41, 4, 2),
(197, 41, 5, 2),
(198, 41, 6, 2),
(199, 41, 8, 1),
(200, 41, 9, 1),
(201, 41, 10, 1),
(202, 41, 11, 1),
(203, 42, 1, 1),
(204, 42, 2, 2),
(205, 42, 3, 2),
(206, 42, 4, 2),
(207, 42, 5, 2),
(208, 43, 1, 1),
(209, 43, 2, 1),
(210, 43, 3, 1),
(211, 43, 4, 1),
(212, 43, 5, 1),
(213, 43, 6, 2),
(214, 43, 7, 2),
(215, 43, 8, 2),
(216, 44, 1, 1),
(217, 44, 2, 2),
(218, 44, 3, 2),
(219, 44, 4, 2),
(220, 44, 5, 1),
(221, 45, 1, 1),
(222, 45, 3, 1),
(223, 45, 4, 1),
(224, 45, 6, 1),
(225, 45, 8, 1),
(226, 46, 1, 1),
(227, 46, 2, 1),
(228, 46, 3, 1),
(229, 46, 4, 1),
(230, 46, 5, 1),
(231, 47, 1, 1),
(232, 47, 2, 1),
(233, 47, 3, 1),
(234, 47, 4, 1),
(235, 47, 5, 2),
(236, 47, 6, 2),
(237, 47, 7, 2),
(238, 47, 8, 2),
(239, 48, 1, 1),
(240, 48, 2, 1),
(241, 48, 3, 1),
(242, 48, 4, 2),
(243, 48, 5, 2),
(244, 48, 6, 2),
(245, 49, 1, 1),
(246, 49, 2, 1),
(247, 49, 3, 1),
(248, 50, 1, 1),
(249, 50, 2, 1),
(250, 50, 3, 1),
(251, 50, 4, 1),
(252, 50, 5, 2),
(253, 50, 6, 2),
(254, 50, 7, 2),
(255, 50, 8, 2),
(256, 50, 9, 3),
(257, 50, 10, 3),
(258, 50, 11, 3),
(259, 51, 1, 1),
(260, 51, 2, 2),
(261, 51, 3, 3),
(262, 51, 4, 2),
(263, 51, 5, 1),
(264, 51, 6, 2),
(265, 51, 7, 3),
(266, 51, 8, 2),
(267, 51, 9, 1),
(268, 51, 10, 2),
(269, 51, 11, 3),
(270, 52, 1, 1),
(271, 52, 2, 1),
(272, 52, 3, 1),
(273, 52, 4, 1),
(274, 52, 5, 1),
(275, 52, 6, 1),
(276, 52, 7, 1),
(277, 52, 8, 3),
(278, 52, 9, 3),
(279, 52, 10, 3),
(280, 52, 11, 3),
(281, 53, 1, 1),
(282, 53, 2, 2),
(283, 53, 3, 1),
(284, 53, 4, 1),
(285, 53, 5, 1),
(286, 53, 6, 2),
(287, 53, 7, 2),
(288, 53, 8, 2),
(289, 53, 9, 3),
(290, 53, 10, 3),
(291, 53, 11, 3),
(292, 54, 1, 1),
(293, 54, 2, 2),
(294, 54, 3, 2),
(295, 54, 4, 2),
(296, 54, 5, 2),
(297, 54, 8, 3),
(298, 54, 7, 1),
(299, 54, 6, 1),
(300, 54, 9, 1),
(301, 54, 10, 1),
(302, 54, 11, 1),
(303, 55, 1, 1),
(304, 55, 2, 1),
(305, 55, 3, 1),
(306, 55, 4, 1),
(307, 55, 5, 1),
(308, 55, 6, 1),
(309, 55, 7, 1),
(310, 55, 8, 1),
(311, 55, 9, 1),
(312, 55, 10, 1),
(313, 55, 11, 1),
(314, 56, 1, 1),
(315, 56, 2, 1),
(316, 56, 3, 1),
(317, 56, 4, 1),
(318, 56, 5, 1),
(319, 56, 6, 3),
(320, 56, 7, 3),
(321, 56, 8, 3),
(322, 56, 9, 1),
(323, 56, 10, 1),
(324, 56, 11, 1),
(325, 57, 1, 1),
(326, 57, 2, 1),
(327, 57, 3, 1),
(328, 57, 4, 1),
(329, 57, 5, 3),
(330, 57, 6, 1),
(331, 57, 7, 1),
(332, 57, 8, 3),
(333, 57, 9, 1),
(334, 57, 10, 1),
(335, 57, 11, 1),
(336, 58, 1, 1),
(337, 58, 2, 1),
(338, 58, 3, 1),
(339, 58, 4, 1),
(340, 58, 5, 3),
(341, 58, 6, 1),
(342, 58, 7, 1),
(343, 58, 8, 3),
(344, 58, 9, 1),
(345, 58, 10, 1),
(346, 58, 11, 1),
(347, 59, 1, 1),
(348, 59, 2, 1),
(349, 59, 4, 1),
(350, 59, 3, 1),
(351, 59, 5, 3),
(352, 59, 6, 1),
(353, 59, 7, 1),
(354, 59, 8, 3),
(355, 59, 9, 1),
(356, 59, 10, 1),
(357, 59, 11, 1),
(358, 60, 1, 1),
(359, 60, 2, 1),
(360, 60, 3, 1),
(361, 60, 4, 1),
(362, 60, 5, 1),
(363, 60, 6, 3),
(364, 60, 8, 1),
(365, 60, 9, 1),
(366, 60, 10, 1),
(367, 60, 11, 1),
(368, 60, 7, 1),
(369, 61, 1, 1),
(370, 61, 2, 1),
(371, 61, 3, 1),
(372, 61, 4, 2),
(373, 61, 5, 2),
(374, 61, 6, 2),
(375, 61, 7, 3),
(376, 61, 8, 3),
(377, 61, 9, 3),
(378, 61, 10, 1),
(379, 61, 11, 1),
(380, 62, 1, 1),
(381, 62, 2, 1),
(382, 62, 3, 1),
(383, 62, 4, 1),
(384, 62, 5, 1),
(385, 62, 6, 1),
(386, 62, 7, 1),
(387, 62, 8, 1),
(388, 62, 9, 1),
(389, 62, 10, 1),
(390, 62, 11, 1),
(391, 63, 11, 1),
(392, 63, 10, 1),
(393, 63, 9, 1),
(394, 63, 8, 1),
(395, 63, 7, 1),
(396, 63, 6, 1),
(397, 63, 5, 1),
(398, 63, 4, 1),
(399, 63, 3, 1),
(400, 63, 2, 1),
(401, 63, 1, 1),
(402, 64, 1, 1),
(403, 64, 2, 1),
(404, 64, 3, 1),
(405, 64, 4, 1),
(406, 64, 5, 1),
(407, 64, 6, 1),
(408, 64, 7, 1),
(409, 64, 8, 1),
(410, 64, 9, 1),
(411, 64, 10, 1),
(412, 64, 11, 1),
(413, 65, 1, 1),
(414, 65, 2, 1),
(415, 65, 3, 1),
(416, 65, 5, 1),
(417, 65, 4, 1),
(418, 65, 6, 1),
(419, 65, 7, 1),
(420, 65, 8, 1),
(421, 65, 9, 1),
(422, 65, 10, 1),
(423, 65, 11, 1),
(424, 66, 1, 1),
(425, 66, 2, 1),
(426, 66, 3, 1),
(427, 66, 4, 1),
(428, 66, 5, 1),
(429, 66, 6, 1),
(430, 66, 7, 1),
(431, 66, 8, 1),
(432, 66, 9, 1),
(433, 66, 10, 1),
(434, 66, 11, 1),
(435, 67, 1, 1),
(436, 67, 2, 1),
(437, 67, 3, 1),
(438, 67, 4, 2),
(439, 67, 5, 2),
(440, 67, 6, 3),
(441, 67, 7, 3),
(442, 67, 8, 1),
(443, 67, 9, 1),
(444, 67, 10, 1),
(445, 67, 11, 1),
(446, 68, 1, 1),
(447, 68, 2, 1),
(448, 68, 3, 1),
(449, 68, 4, 2),
(450, 68, 5, 2),
(451, 68, 7, 3),
(452, 68, 8, 3),
(453, 68, 9, 1),
(454, 68, 10, 1),
(455, 68, 11, 1),
(456, 68, 6, 1),
(457, 69, 1, 1),
(458, 69, 2, 1),
(459, 69, 3, 1),
(460, 69, 4, 1),
(461, 69, 5, 1),
(462, 69, 6, 1),
(463, 69, 7, 2),
(464, 69, 8, 2),
(465, 69, 9, 2),
(466, 69, 10, 1),
(467, 69, 11, 1),
(468, 70, 11, 1),
(469, 70, 10, 1),
(470, 70, 9, 1),
(471, 70, 8, 1),
(472, 70, 7, 2),
(473, 70, 6, 2),
(474, 70, 5, 3),
(475, 70, 4, 3),
(476, 70, 3, 1),
(477, 70, 2, 1),
(478, 70, 1, 1),
(479, 71, 1, 1),
(480, 71, 2, 1),
(481, 71, 3, 1),
(482, 71, 4, 1),
(483, 71, 5, 2),
(484, 71, 6, 2),
(485, 71, 7, 3),
(486, 71, 8, 3),
(487, 71, 9, 1),
(488, 71, 10, 1),
(489, 71, 11, 1),
(490, 72, 1, 1),
(491, 72, 2, 1),
(492, 72, 3, 3),
(493, 72, 4, 3),
(494, 72, 5, 2),
(495, 72, 6, 2),
(496, 72, 7, 1),
(497, 72, 8, 1),
(498, 72, 9, 1),
(499, 72, 10, 1),
(500, 72, 11, 1),
(501, 73, 1, 1),
(502, 73, 2, 1),
(503, 73, 3, 1),
(504, 73, 4, 1),
(505, 73, 5, 1),
(506, 73, 6, 1),
(507, 73, 7, 1),
(508, 73, 8, 1),
(509, 73, 9, 1),
(510, 73, 10, 2),
(511, 73, 11, 2),
(512, 74, 1, 1),
(513, 74, 2, 1),
(514, 74, 11, 1),
(515, 74, 10, 1),
(516, 74, 9, 1),
(517, 74, 8, 1),
(518, 74, 6, 1),
(519, 74, 5, 1),
(520, 74, 4, 1),
(521, 74, 3, 1),
(522, 74, 7, 3),
(523, 75, 1, 1),
(524, 75, 2, 1),
(525, 75, 3, 1),
(526, 75, 4, 2),
(527, 75, 5, 3),
(528, 75, 6, 2),
(529, 75, 7, 2),
(530, 75, 8, 2),
(531, 75, 9, 2),
(532, 75, 10, 2),
(533, 75, 11, 2),
(534, 76, 1, 1),
(535, 76, 2, 1),
(536, 76, 3, 1),
(537, 76, 4, 2),
(538, 76, 5, 3),
(539, 76, 6, 2),
(540, 76, 7, 1),
(541, 76, 8, 1),
(542, 76, 9, 1),
(543, 76, 10, 1),
(544, 76, 11, 1),
(545, 77, 1, 1),
(546, 77, 2, 1),
(547, 77, 3, 1),
(548, 77, 4, 1),
(549, 77, 5, 1),
(550, 77, 6, 2),
(551, 77, 7, 2),
(552, 77, 8, 3),
(553, 77, 9, 3),
(554, 77, 10, 3),
(555, 77, 11, 3),
(556, 78, 1, 1),
(557, 78, 2, 1),
(558, 78, 3, 1),
(559, 78, 4, 2),
(560, 78, 5, 2),
(561, 78, 6, 1),
(562, 78, 7, 1),
(563, 78, 8, 3),
(564, 78, 9, 3),
(565, 78, 10, 3),
(566, 78, 11, 3),
(567, 79, 1, 1),
(568, 79, 2, 1),
(569, 79, 3, 1),
(570, 79, 4, 2),
(571, 79, 5, 2),
(572, 79, 6, 3),
(573, 79, 7, 3),
(574, 79, 8, 1),
(575, 79, 9, 1),
(576, 79, 11, 1),
(577, 79, 10, 1),
(578, 80, 1, 1),
(579, 80, 2, 1),
(580, 80, 3, 1),
(581, 80, 4, 2),
(582, 80, 5, 2),
(583, 80, 6, 1),
(584, 80, 7, 1),
(585, 80, 8, 1),
(586, 80, 9, 1),
(587, 80, 10, 1),
(588, 80, 11, 1),
(589, 81, 1, 1),
(590, 81, 2, 1),
(591, 81, 3, 1),
(592, 81, 4, 2),
(593, 81, 5, 2),
(594, 81, 6, 1),
(595, 81, 7, 1),
(596, 81, 8, 1),
(597, 81, 9, 1),
(598, 81, 10, 1),
(599, 81, 11, 1),
(600, 82, 1, 1),
(601, 82, 2, 1),
(602, 82, 3, 1),
(603, 82, 4, 1),
(604, 82, 5, 1),
(605, 82, 6, 2),
(606, 82, 7, 2),
(607, 82, 8, 1),
(608, 82, 9, 1),
(609, 82, 10, 1),
(610, 82, 11, 1),
(611, 83, 1, 1),
(612, 83, 2, 1),
(613, 83, 3, 1),
(614, 83, 4, 2),
(615, 83, 5, 2),
(616, 83, 6, 1),
(617, 83, 7, 1),
(618, 83, 8, 1),
(619, 83, 9, 1),
(620, 83, 10, 2),
(621, 83, 11, 1),
(622, 84, 1, 1),
(623, 84, 2, 1),
(624, 84, 3, 1),
(625, 84, 4, 1),
(626, 84, 5, 1),
(627, 84, 6, 2),
(628, 84, 8, 1),
(629, 84, 9, 1),
(630, 84, 10, 1),
(631, 84, 11, 1),
(632, 84, 7, 2),
(633, 85, 1, 1),
(634, 85, 2, 1),
(635, 85, 3, 1),
(636, 85, 4, 1),
(637, 85, 5, 1),
(638, 85, 7, 1),
(639, 85, 6, 1),
(640, 85, 8, 2),
(641, 85, 9, 2),
(642, 85, 10, 1),
(643, 85, 11, 1),
(644, 86, 1, 2),
(645, 86, 2, 2),
(646, 86, 3, 2),
(647, 86, 4, 1),
(648, 86, 5, 1),
(649, 86, 6, 1),
(650, 86, 7, 1),
(651, 86, 8, 1),
(652, 86, 9, 1),
(653, 86, 10, 1),
(654, 86, 11, 1),
(655, 87, 1, 1),
(656, 87, 2, 1),
(657, 87, 3, 1),
(658, 87, 4, 1),
(659, 87, 5, 3),
(660, 87, 6, 3),
(661, 87, 7, 2),
(662, 87, 8, 1),
(663, 87, 9, 1),
(664, 87, 10, 1),
(665, 87, 11, 1),
(666, 88, 1, 1),
(667, 88, 2, 1),
(668, 88, 3, 1),
(669, 88, 4, 1),
(670, 88, 5, 1),
(671, 88, 6, 1),
(672, 88, 8, 1),
(673, 88, 7, 1),
(674, 88, 9, 1),
(675, 88, 10, 1),
(676, 88, 11, 2),
(677, 91, 1, 1),
(678, 91, 2, 1),
(679, 91, 3, 1),
(680, 91, 4, 1),
(681, 91, 5, 2),
(682, 91, 6, 2),
(683, 91, 7, 1),
(684, 91, 8, 1),
(685, 91, 9, 1),
(686, 91, 10, 1),
(687, 91, 11, 1),
(688, 92, 1, 1),
(689, 92, 2, 1),
(690, 92, 3, 1),
(691, 92, 4, 1),
(692, 92, 5, 1),
(693, 92, 6, 2),
(694, 92, 7, 2),
(695, 92, 8, 1),
(696, 92, 9, 1),
(697, 92, 10, 1),
(698, 92, 11, 1),
(699, 93, 1, 1),
(700, 93, 2, 1),
(701, 93, 3, 1),
(702, 93, 4, 1),
(703, 93, 5, 1),
(704, 93, 6, 3),
(705, 93, 7, 3),
(706, 93, 8, 3),
(707, 93, 9, 1),
(708, 93, 10, 1),
(709, 93, 11, 2),
(710, 94, 1, 1),
(711, 94, 2, 1),
(712, 94, 3, 1),
(713, 94, 4, 1),
(714, 94, 5, 1),
(715, 94, 6, 1),
(716, 94, 7, 1),
(717, 94, 8, 1),
(718, 94, 9, 1),
(719, 94, 10, 1),
(720, 94, 11, 1),
(721, 95, 1, 1),
(722, 95, 2, 1),
(723, 95, 3, 1),
(724, 95, 5, 1),
(725, 95, 4, 1),
(726, 95, 6, 1),
(727, 95, 7, 1),
(728, 95, 8, 1),
(729, 95, 9, 1),
(730, 95, 10, 1),
(731, 95, 11, 1),
(732, 96, 1, 1),
(733, 96, 2, 1),
(734, 96, 3, 1),
(735, 96, 4, 1),
(736, 96, 5, 1),
(737, 96, 6, 1),
(738, 96, 8, 1),
(739, 96, 7, 1),
(740, 96, 9, 1),
(741, 96, 10, 1),
(742, 96, 11, 1),
(743, 97, 1, 1),
(744, 97, 2, 1),
(745, 97, 3, 1),
(746, 97, 4, 1),
(747, 97, 5, 1),
(748, 97, 6, 1),
(749, 97, 7, 1),
(750, 97, 8, 1),
(751, 97, 9, 1),
(752, 97, 10, 1),
(753, 97, 11, 1),
(754, 98, 1, 1),
(755, 98, 2, 1),
(756, 98, 3, 1),
(757, 98, 4, 1),
(758, 98, 6, 1),
(759, 98, 5, 1),
(760, 98, 7, 2),
(761, 98, 8, 2),
(762, 98, 9, 1),
(763, 98, 10, 1),
(764, 98, 11, 1),
(765, 99, 1, 1),
(766, 99, 2, 1),
(767, 99, 3, 1),
(768, 99, 4, 1),
(769, 99, 5, 1),
(770, 99, 6, 1),
(771, 99, 7, 1),
(772, 99, 8, 1),
(773, 99, 9, 1),
(774, 99, 10, 2),
(775, 99, 11, 2),
(776, 100, 1, 1),
(777, 100, 2, 1),
(778, 100, 3, 1),
(779, 100, 4, 1),
(780, 100, 5, 1),
(781, 100, 6, 1),
(782, 100, 7, 1),
(783, 100, 8, 1),
(784, 100, 9, 1),
(785, 100, 10, 1),
(786, 100, 11, 1),
(787, 101, 11, 1),
(788, 101, 10, 1),
(789, 101, 9, 1),
(790, 101, 8, 1),
(791, 101, 6, 1),
(792, 101, 7, 1),
(793, 101, 5, 1),
(794, 101, 4, 1),
(795, 101, 3, 3),
(796, 101, 2, 3),
(797, 101, 1, 3),
(798, 102, 1, 1),
(799, 102, 2, 1),
(800, 102, 3, 1),
(801, 102, 4, 1),
(802, 102, 5, 1),
(803, 102, 7, 1),
(804, 102, 6, 1),
(805, 102, 8, 1),
(806, 102, 9, 1),
(807, 102, 10, 1),
(808, 102, 11, 2),
(809, 103, 1, 1),
(810, 103, 2, 1),
(811, 103, 3, 1),
(812, 103, 4, 1),
(813, 103, 5, 1),
(814, 103, 6, 1),
(815, 103, 7, 1),
(816, 103, 8, 1),
(817, 103, 9, 1),
(818, 103, 10, 1),
(819, 103, 11, 1),
(820, 104, 1, 1),
(821, 104, 2, 1),
(822, 104, 3, 1),
(823, 104, 4, 1),
(824, 104, 5, 1),
(825, 104, 6, 1),
(826, 104, 7, 1),
(827, 104, 8, 1),
(828, 104, 9, 1),
(829, 104, 10, 1),
(830, 104, 11, 1),
(831, 105, 1, 1),
(832, 105, 2, 1),
(833, 105, 3, 1),
(834, 105, 4, 2),
(835, 105, 5, 2),
(836, 105, 6, 3),
(837, 105, 7, 3),
(838, 105, 8, 1),
(839, 105, 9, 1),
(840, 105, 10, 1),
(841, 105, 11, 1),
(842, 106, 1, 1),
(843, 106, 2, 1),
(844, 106, 3, 1),
(845, 106, 4, 1),
(846, 106, 5, 1),
(847, 106, 6, 1),
(848, 106, 7, 1),
(849, 106, 8, 1),
(850, 106, 9, 1),
(851, 106, 10, 1),
(852, 106, 11, 1),
(853, 107, 1, 1),
(854, 107, 2, 1),
(855, 107, 3, 1),
(856, 107, 4, 1),
(857, 107, 5, 1),
(858, 107, 6, 1),
(859, 107, 7, 1),
(860, 107, 8, 1),
(861, 107, 9, 1),
(862, 107, 10, 1),
(863, 107, 11, 1),
(864, 108, 1, 1),
(865, 108, 2, 1),
(866, 108, 3, 1),
(867, 108, 4, 1),
(868, 108, 5, 1),
(869, 108, 6, 1),
(870, 108, 7, 1),
(871, 108, 8, 1),
(872, 108, 9, 3),
(873, 108, 10, 3),
(874, 108, 11, 1),
(875, 109, 1, 1),
(876, 109, 2, 1),
(877, 109, 3, 1),
(878, 109, 4, 1),
(879, 109, 5, 1),
(880, 109, 6, 1),
(881, 109, 7, 1),
(882, 109, 8, 1),
(883, 109, 9, 1),
(884, 109, 10, 1),
(885, 109, 11, 1),
(886, 110, 1, 1),
(887, 110, 2, 1),
(888, 110, 3, 1),
(889, 110, 4, 1),
(890, 110, 5, 1),
(891, 110, 6, 1),
(892, 110, 7, 1),
(893, 110, 8, 1),
(894, 110, 9, 1),
(895, 110, 10, 3),
(896, 110, 11, 3),
(897, 111, 1, 1),
(898, 111, 2, 1),
(899, 111, 3, 1),
(900, 111, 4, 1),
(901, 111, 5, 1),
(902, 111, 6, 1),
(903, 111, 7, 1),
(904, 111, 8, 1),
(905, 111, 9, 1),
(906, 111, 10, 1),
(907, 111, 11, 1),
(908, 112, 1, 1),
(909, 112, 2, 1),
(910, 112, 3, 1),
(911, 112, 4, 1),
(912, 112, 5, 1),
(913, 112, 6, 1),
(914, 112, 7, 1),
(915, 112, 8, 1),
(916, 112, 9, 1),
(917, 112, 10, 1),
(918, 112, 11, 1),
(919, 113, 1, 1),
(920, 113, 2, 1),
(921, 113, 3, 1),
(922, 113, 4, 1),
(923, 113, 5, 1),
(924, 113, 6, 1),
(925, 113, 7, 1),
(926, 113, 8, 1),
(927, 113, 9, 1),
(928, 113, 10, 1),
(929, 113, 11, 1),
(930, 114, 1, 1),
(931, 114, 2, 1),
(932, 114, 3, 1),
(933, 114, 4, 1),
(934, 114, 5, 1),
(935, 114, 6, 1),
(936, 114, 7, 1),
(937, 114, 8, 1),
(938, 114, 10, 1),
(939, 114, 9, 1),
(940, 114, 11, 1),
(941, 115, 1, 1),
(942, 115, 2, 1),
(943, 115, 3, 1),
(944, 115, 4, 1),
(945, 115, 5, 1),
(946, 115, 6, 1),
(947, 115, 7, 1),
(948, 115, 8, 1),
(949, 115, 9, 1),
(950, 115, 10, 1),
(951, 115, 11, 1),
(952, 116, 1, 1),
(953, 116, 2, 1),
(954, 116, 3, 1),
(955, 116, 4, 1),
(956, 116, 5, 1),
(957, 116, 6, 1),
(958, 116, 7, 1),
(959, 116, 8, 1),
(960, 116, 9, 1),
(961, 116, 10, 1),
(962, 116, 11, 3),
(963, 121, 1, 1),
(964, 121, 2, 1),
(965, 121, 3, 1),
(966, 121, 4, 1),
(967, 121, 5, 1),
(968, 121, 6, 2),
(969, 121, 7, 2),
(970, 121, 8, 1),
(971, 121, 9, 1),
(972, 121, 10, 1),
(973, 121, 11, 1),
(974, 124, 1, 1),
(975, 124, 2, 1),
(976, 124, 3, 1),
(977, 124, 4, 1),
(978, 124, 5, 1),
(979, 124, 6, 1),
(980, 124, 7, 1),
(981, 124, 8, 2),
(982, 124, 9, 2),
(983, 124, 10, 1),
(984, 124, 11, 1),
(985, 134, 1, 1),
(986, 134, 2, 1),
(987, 134, 3, 1),
(988, 134, 4, 1),
(989, 134, 5, 1),
(990, 134, 6, 1),
(991, 134, 7, 1),
(992, 134, 8, 1),
(993, 134, 9, 1),
(994, 134, 10, 1),
(995, 134, 11, 1),
(996, 135, 1, 1),
(997, 135, 2, 1),
(998, 135, 3, 1),
(999, 135, 4, 1),
(1000, 135, 5, 1),
(1001, 135, 6, 1),
(1002, 135, 7, 1),
(1003, 135, 8, 1),
(1004, 135, 9, 1),
(1005, 135, 10, 1),
(1006, 135, 11, 2),
(1007, 136, 1, 1),
(1008, 136, 2, 1),
(1009, 136, 3, 1),
(1010, 136, 5, 1),
(1011, 136, 4, 1),
(1012, 136, 6, 1),
(1013, 136, 7, 1),
(1014, 136, 8, 1),
(1015, 136, 9, 1),
(1016, 136, 11, 1),
(1017, 136, 10, 1),
(1018, 137, 1, 1),
(1019, 137, 2, 1),
(1020, 137, 3, 1),
(1021, 137, 4, 1),
(1022, 137, 5, 1),
(1023, 137, 6, 1),
(1024, 137, 7, 1),
(1025, 137, 8, 1),
(1026, 137, 9, 2),
(1027, 137, 10, 2),
(1028, 137, 11, 1),
(1029, 139, 1, 1),
(1030, 139, 2, 1),
(1031, 139, 3, 1),
(1032, 139, 4, 1),
(1033, 139, 5, 1),
(1034, 139, 6, 1),
(1035, 139, 7, 1),
(1036, 139, 8, 1),
(1037, 139, 9, 1),
(1038, 139, 10, 1),
(1039, 139, 11, 1),
(1040, 141, 1, 1),
(1041, 141, 2, 1),
(1042, 141, 3, 1),
(1043, 141, 4, 1),
(1044, 141, 5, 1),
(1045, 141, 6, 1),
(1046, 141, 7, 1),
(1047, 141, 8, 1),
(1048, 141, 9, 1),
(1049, 141, 10, 1),
(1050, 141, 11, 1),
(1051, 142, 1, 1),
(1052, 142, 2, 1),
(1053, 142, 3, 1),
(1054, 142, 4, 1),
(1055, 142, 5, 1),
(1056, 142, 6, 1),
(1057, 142, 7, 1),
(1058, 142, 8, 1),
(1059, 142, 9, 1),
(1060, 142, 10, 1),
(1061, 142, 11, 1),
(1062, 143, 11, 3),
(1063, 143, 1, 1),
(1064, 143, 2, 1),
(1065, 143, 3, 1),
(1066, 143, 4, 1),
(1067, 143, 5, 2),
(1068, 143, 6, 1),
(1069, 143, 7, 1),
(1070, 143, 8, 1),
(1071, 143, 9, 1),
(1072, 143, 10, 1),
(1073, 144, 1, 1),
(1074, 144, 2, 1),
(1075, 144, 3, 1),
(1076, 144, 4, 1),
(1077, 144, 5, 2),
(1078, 144, 6, 1),
(1079, 144, 7, 1),
(1080, 144, 8, 1),
(1081, 144, 9, 1),
(1082, 144, 10, 1),
(1083, 144, 11, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `firma`
--

CREATE TABLE `firma` (
  `IdFirma` int(11) NOT NULL,
  `IdAuditoria` int(11) NOT NULL,
  `NoConforme` tinyint(1) NOT NULL,
  `DatosFirma` text NOT NULL,
  `FechaCreacion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `firma`
--

INSERT INTO `firma` (`IdFirma`, `IdAuditoria`, `NoConforme`, `DatosFirma`, `FechaCreacion`) VALUES
(2, 85, 1, '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox', '2025-02-02T17:48:27.080Z'),
(3, 86, 1, '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox', '2025-02-02T18:04:28.466Z');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `firmapatron`
--

CREATE TABLE `firmapatron` (
  `IdFirmaPatron` int(11) NOT NULL,
  `IdOperario` int(11) NOT NULL,
  `Firma` text NOT NULL,
  `Hash` text NOT NULL,
  `PuntosTotales` int(11) NOT NULL,
  `VelocidadMedia` float NOT NULL,
  `PresionMedia` float NOT NULL,
  `FechaCreacion` date NOT NULL,
  `Activa` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `firmapatron`
--

INSERT INTO `firmapatron` (`IdFirmaPatron`, `IdOperario`, `Firma`, `Hash`, `PuntosTotales`, `VelocidadMedia`, `PresionMedia`, `FechaCreacion`, `Activa`) VALUES
(1, 4, '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-lineca', 'VffGCEzLkTHMlQX4+1zJCSDookVA3Ge7e0QwMIwHP/Q=', 37, 107.843, 1, '2025-02-02', 1),
(2, 3, '<svg xmlns=\"http://www.w3.org/2000/svg\"><?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-lineca', 'CCgWS3lli06mM0uvi77NSbcsKFIJIO8JzWScwxCvh9E=', 121, 44.0163, 1, '2025-02-02', 1),
(3, 5, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M362,134c0,0 0,0 0,0 \"/><path stroke-width=\"18\" d=\"M362,134c-1,-2 0,-3 -2,-4 \"/><path stroke-width=\"15\" d=\"M360,130c-3,-3 -4,-2 -8,-3 \"/><path stroke-width=\"12\" d=\"M352,127c-3,-2 -3,-3 -6,-4 -5,-2 -5,-1 -11,-2 -3,0 -3,0 -6,0 \"/><path stroke-width=\"11\" d=\"M329,121c-7,-1 -7,-2 -15,-4 \"/><path stroke-width=\"12\" d=\"M314,117c-1,0 0,1 -1,1 \"/><path stroke-width=\"14\" d=\"M313,118c-4,0 -4,0 -8,0 \"/><path stroke-width=\"13\" d=\"M305,118c-4,0 -4,-1 -8,0 \"/><path stroke-width=\"12\" d=\"M297,118c-4,1 -4,1 -8,4 \"/><path stroke-width=\"11\" d=\"M289,122c-4,2 -4,3 -8,6 -4,2 -5,2 -9,5 \"/><path stroke-width=\"12\" d=\"M272,133c-3,2 -3,2 -6,5 \"/><path stroke-width=\"10\" d=\"M266,138c-9,8 -10,7 -17,16 -2,2 0,3 -1,6 \"/><path stroke-width=\"11\" d=\"M248,160c-2,8 -3,8 -6,15 \"/><path stroke-width=\"10\" d=\"M242,175c-3,6 -3,6 -5,11 \"/><path stroke-width=\"11\" d=\"M237,186c-2,5 -2,5 -4,10 \"/><path stroke-width=\"10\" d=\"M233,196c-2,12 0,13 -4,24 \"/><path stroke-width=\"8\" d=\"M229,220c-3,9 -7,8 -8,17 \"/><path stroke-width=\"9\" d=\"M221,237c-2,8 2,9 2,17 \"/><path stroke-width=\"8\" d=\"M223,254c0,10 -2,10 -2,20 -1,9 0,9 0,18 \"/><path stroke-width=\"9\" d=\"M221,292c0,6 0,6 0,13 0,10 0,10 0,20 0,8 0,8 0,17 0,8 0,8 0,16 0,7 -1,8 0,14 \"/><path stroke-width=\"10\" d=\"M221,372c1,8 3,7 5,14 \"/><path stroke-width=\"9\" d=\"M226,386c3,8 2,8 7,15 3,6 5,5 9,11 \"/><path stroke-width=\"10\" d=\"M242,412c3,5 1,6 4,11 \"/><path stroke-width=\"11\" d=\"M246,423c2,3 3,2 6,4 \"/><path stroke-width=\"13\" d=\"M252,427c2,2 2,2 5,3 3,1 3,0 6,0 3,0 3,0 6,0 \"/><path stroke-width=\"12\" d=\"M269,430c6,0 6,0 12,0 \"/><path stroke-width=\"11\" d=\"M281,430c4,0 4,0 7,0 \"/><path stroke-width=\"12\" d=\"M288,430c5,0 6,1 11,0 \"/><path stroke-width=\"11\" d=\"M299,430c5,-2 4,-4 9,-6 4,-2 5,0 9,-2 5,-4 4,-5 8,-10 \"/><path stroke-width=\"12\" d=\"M325,412c1,-1 2,0 3,-1 \"/><path stroke-width=\"13\" d=\"M328,411c4,-4 4,-5 9,-9 \"/><path stroke-width=\"12\" d=\"M337,402c2,-2 3,-2 5,-4 3,-3 3,-3 5,-6 \"/><path stroke-width=\"14\" d=\"M347,392c1,0 2,1 3,0 3,-2 3,-2 5,-5 \"/><path stroke-width=\"15\" d=\"M355,387c1,0 0,0 1,-1 2,0 3,1 4,0 \"/><path stroke-width=\"13\" d=\"M360,386c3,-2 2,-3 3,-7 \"/><path stroke-width=\"14\" d=\"M363,379c1,-2 1,-2 2,-4 \"/><path stroke-width=\"15\" d=\"M365,375c1,-2 2,-2 3,-3 0,-1 -1,-1 -1,-2 0,-2 0,-2 1,-3 1,-1 2,0 3,0 \"/><path stroke-width=\"16\" d=\"M371,367c2,-1 1,-1 2,-2 \"/><path stroke-width=\"18\" d=\"M375,365c0,0 0,0 0,0 \"/><path stroke-width=\"18\" d=\"M441,118c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M441,118c0,2 0,2 0,5 \"/><path stroke-width=\"13\" d=\"M441,123c0,6 1,6 0,12 \"/><path stroke-width=\"11\" d=\"M441,135c-1,6 -2,6 -3,12 \"/><path stroke-width=\"10\" d=\"M438,147c-1,7 0,7 0,13 \"/><path stroke-width=\"9\" d=\"M438,160c0,10 1,10 0,20 \"/><path stroke-width=\"8\" d=\"M438,180c-1,14 -4,14 -5,27 0,11 2,11 2,22 0,15 0,15 0,31 \"/><path stroke-width=\"9\" d=\"M435,260c0,6 0,6 0,12 0,10 1,10 0,20 \"/><path stroke-width=\"8\" d=\"M435,292c-1,10 -2,10 -3,19 -1,9 0,9 0,18 \"/><path stroke-width=\"10\" d=\"M432,329c0,5 0,5 0,10 \"/><path stroke-width=\"12\" d=\"M432,339c0,3 0,3 0,7 \"/><path stroke-width=\"14\" d=\"M432,346c0,1 0,1 0,2 \"/><path stroke-width=\"16\" d=\"M432,348c0,1 0,1 0,3 \"/><path stroke-width=\"17\" d=\"M432,351c0,3 0,3 0,6 \"/><path stroke-width=\"16\" d=\"M432,357c0,2 0,2 0,4 \"/><path stroke-width=\"14\" d=\"M432,361c0,2 0,2 0,5 0,2 0,2 0,3 \"/><path stroke-width=\"16\" d=\"M432,369c0,1 0,1 0,1 \"/><path stroke-width=\"17\" d=\"M432,370c0,1 0,1 0,3 0,1 0,1 0,2 \"/><path stroke-width=\"15\" d=\"M432,375c0,2 0,3 0,4 \"/><path stroke-width=\"16\" d=\"M449,107c0,0 0,0 0,0 \"/><path stroke-width=\"18\" d=\"M449,107c0,-2 -1,-3 1,-3 \"/><path stroke-width=\"15\" d=\"M450,104c2,-1 3,0 7,0 \"/><path stroke-width=\"11\" d=\"M457,104c10,0 10,0 19,0 \"/><path stroke-width=\"10\" d=\"M476,104c5,0 5,0 11,0 \"/><path stroke-width=\"11\" d=\"M487,104c5,0 6,-1 11,0 4,0 4,0 7,2 \"/><path stroke-width=\"13\" d=\"M505,106c2,1 2,2 3,3 \"/><path stroke-width=\"15\" d=\"M508,109c0,1 -1,2 0,2 2,1 5,-1 6,1 \"/><path stroke-width=\"13\" d=\"M514,112c2,3 -1,5 0,9 \"/><path stroke-width=\"12\" d=\"M514,121c1,3 4,2 5,5 \"/><path stroke-width=\"13\" d=\"M519,126c1,2 -1,3 0,5 \"/><path stroke-width=\"12\" d=\"M519,131c2,5 4,5 6,10 1,2 0,3 0,6 1,5 1,5 2,11 1,4 1,4 2,8 0,4 1,4 1,8 0,3 0,3 0,7 \"/><path stroke-width=\"13\" d=\"M530,181c0,3 0,3 0,7 \"/><path stroke-width=\"12\" d=\"M530,188c0,5 1,5 0,10 -1,4 -2,3 -3,7 \"/><path stroke-width=\"13\" d=\"M527,205c-1,2 -1,2 -2,5 -1,3 -2,3 -3,5 -2,4 -2,5 -4,7 \"/><path stroke-width=\"14\" d=\"M518,222c-1,0 -1,-2 -2,-1 -3,1 -3,2 -5,5 -1,1 -1,2 -2,3 -1,2 -1,2 -3,4 -1,1 -1,0 -3,1 -2,1 -2,2 -4,3 -2,0 -2,-1 -4,0 \"/><path stroke-width=\"13\" d=\"M495,237c-4,1 -4,2 -8,3 -3,1 -3,0 -6,0 -3,0 -3,-1 -5,0 -4,1 -4,2 -8,3 -2,0 -2,0 -5,0 \"/><path stroke-width=\"14\" d=\"M463,243c-2,0 -2,0 -5,1 -1,1 -1,2 -3,2 \"/><path stroke-width=\"16\" d=\"M455,246c0,0 0,-1 -1,-1 \"/><path stroke-width=\"17\" d=\"M454,245c-2,1 -3,4 -3,4 0,1 1,-1 3,-1 \"/><path stroke-width=\"14\" d=\"M454,248c7,-1 8,0 15,0 \"/><path stroke-width=\"9\" d=\"M469,248c11,0 11,-1 22,0 \"/><path stroke-width=\"8\" d=\"M491,248c12,1 12,1 24,4 9,2 9,2 18,5 \"/><path stroke-width=\"9\" d=\"M533,257c6,2 6,3 12,5 \"/><path stroke-width=\"10\" d=\"M545,262c5,2 6,1 10,4 \"/><path stroke-width=\"12\" d=\"M555,266c3,2 2,3 4,5 \"/><path stroke-width=\"13\" d=\"M559,271c2,3 3,3 5,5 2,2 2,2 3,4 2,3 2,3 4,6 1,2 1,2 3,5 \"/><path stroke-width=\"12\" d=\"M574,291c2,5 3,5 5,11 1,3 -1,3 0,6 \"/><path stroke-width=\"11\" d=\"M579,308c1,8 2,8 4,16 1,3 0,3 1,7 2,6 3,5 4,11 \"/><path stroke-width=\"10\" d=\"M588,342c2,7 1,7 2,14 1,6 2,6 3,12 1,6 0,6 0,12 \"/><path stroke-width=\"11\" d=\"M593,380c0,4 0,4 0,8 \"/><path stroke-width=\"13\" d=\"M593,388c0,3 0,3 0,6 0,4 0,4 0,9 0,2 0,2 0,5 \"/><path stroke-width=\"14\" d=\"M593,408c0,1 0,1 0,2 \"/><path stroke-width=\"16\" d=\"M593,410c0,1 0,1 0,1 \"/></g></svg>', 'dU0T3Hu3GmKMmuD2nyv/T3RkHOpjsrKx0fgQcQKuTKY=', 471, 1, 1, '2025-04-23', 1),
(4, 8, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M305,83c0,0 0,0 0,0 0,7 0,7 0,14 \"/><path stroke-width=\"11\" d=\"M305,97c-1,13 -1,13 -3,25 \"/><path stroke-width=\"8\" d=\"M302,122c-2,15 -1,15 -5,30 -3,12 -5,11 -8,23 -4,14 -3,15 -7,29 -6,20 -7,20 -14,40 -5,15 -5,15 -11,30 -4,15 -4,15 -8,29 -5,15 -5,14 -9,29 -3,10 -3,10 -6,21 -2,9 -2,9 -5,17 -3,10 -4,10 -6,19 -2,10 0,11 -2,21 \"/><path stroke-width=\"9\" d=\"M221,410c-1,5 -4,4 -6,8 \"/><path stroke-width=\"11\" d=\"M215,418c-1,6 0,6 0,12 0,4 1,4 0,8 \"/><path stroke-width=\"12\" d=\"M215,438c-2,5 -5,10 -5,8 \"/><path stroke-width=\"13\" d=\"M210,446c-2,-3 0,-9 0,-19 \"/><path stroke-width=\"16\" d=\"M308,88c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M308,88c3,5 5,5 7,11 \"/><path stroke-width=\"13\" d=\"M315,99c3,9 1,10 4,19 \"/><path stroke-width=\"9\" d=\"M319,118c3,9 6,8 9,17 \"/><path stroke-width=\"8\" d=\"M328,135c3,10 1,11 4,21 3,9 4,9 6,18 \"/><path stroke-width=\"9\" d=\"M338,174c2,8 0,9 2,17 2,9 3,9 5,17 2,8 1,8 3,17 2,6 3,6 4,13 \"/><path stroke-width=\"10\" d=\"M352,238c2,7 1,7 2,13 1,7 1,7 2,13 \"/><path stroke-width=\"9\" d=\"M356,264c2,10 2,10 3,20 1,8 -1,9 1,17 1,8 4,7 6,15 \"/><path stroke-width=\"11\" d=\"M366,316c1,3 0,3 0,6 \"/><path stroke-width=\"12\" d=\"M366,322c0,5 1,5 1,9 \"/><path stroke-width=\"13\" d=\"M367,331c0,3 0,3 0,5 \"/><path stroke-width=\"14\" d=\"M367,336c0,3 0,3 0,6 \"/><path stroke-width=\"13\" d=\"M367,342c0,3 -1,4 0,5 \"/><path stroke-width=\"14\" d=\"M367,347c1,2 3,1 4,2 \"/><path stroke-width=\"15\" d=\"M371,349c1,0 -1,1 -1,2 \"/><path stroke-width=\"14\" d=\"M370,351c0,5 0,5 0,9 \"/><path stroke-width=\"13\" d=\"M370,360c0,3 0,3 0,6 0,2 0,2 0,5 0,5 0,5 0,10 \"/><path stroke-width=\"10\" d=\"M370,381c0,8 0,8 0,15 0,6 0,6 0,11 \"/><path stroke-width=\"11\" d=\"M370,407c0,4 0,4 0,8 \"/><path stroke-width=\"13\" d=\"M370,415c0,2 0,2 0,4 \"/><path stroke-width=\"15\" d=\"M370,419c0,1 0,1 0,1 \"/><path stroke-width=\"17\" d=\"M251,319c0,0 0,0 0,0 \"/><path stroke-width=\"18\" d=\"M251,319c1,0 1,0 2,0 \"/><path stroke-width=\"16\" d=\"M253,319c4,-1 4,-1 8,-3 \"/><path stroke-width=\"13\" d=\"M261,316c6,-3 5,-5 11,-6 \"/><path stroke-width=\"9\" d=\"M272,310c11,-2 12,0 24,-1 \"/><path stroke-width=\"8\" d=\"M296,309c10,-1 10,-2 20,-4 \"/><path stroke-width=\"9\" d=\"M316,305c7,-1 7,-1 13,-2 \"/><path stroke-width=\"11\" d=\"M329,303c4,-1 4,-2 7,-3 \"/><path stroke-width=\"15\" d=\"M336,300c1,0 0,2 1,2 \"/><path stroke-width=\"16\" d=\"M337,302c2,0 2,0 4,0 \"/><path stroke-width=\"15\" d=\"M341,302c2,0 2,0 3,0 \"/><path stroke-width=\"14\" d=\"M344,302c4,0 4,0 8,0 \"/><path stroke-width=\"15\" d=\"M352,302c1,0 1,0 2,0 \"/><path stroke-width=\"17\" d=\"M354,302c1,-1 1,-2 2,-2 1,-1 1,0 3,0 \"/><path stroke-width=\"16\" d=\"M359,300c1,0 1,0 3,0 1,0 1,0 3,0 1,0 1,0 2,0 \"/><path stroke-width=\"17\" d=\"M590,115c0,0 0,0 0,0 -5,-6 -4,-7 -11,-13 \"/><path stroke-width=\"12\" d=\"M579,102c-7,-6 -7,-5 -15,-10 \"/><path stroke-width=\"9\" d=\"M564,92c-6,-4 -6,-4 -12,-7 \"/><path stroke-width=\"11\" d=\"M552,85c-3,-2 -3,-2 -6,-2 \"/><path stroke-width=\"12\" d=\"M546,83c-4,-1 -5,1 -9,0 -4,-1 -4,-2 -9,-3 \"/><path stroke-width=\"11\" d=\"M528,80c-6,-1 -6,0 -13,0 \"/><path stroke-width=\"10\" d=\"M515,80c-6,0 -6,0 -12,0 \"/><path stroke-width=\"11\" d=\"M503,80c-4,0 -4,0 -8,0 \"/><path stroke-width=\"12\" d=\"M495,80c-4,0 -4,0 -7,0 -4,0 -4,0 -8,0 -4,0 -5,-1 -8,0 \"/><path stroke-width=\"13\" d=\"M472,80c-3,1 -1,3 -4,5 \"/><path stroke-width=\"12\" d=\"M468,85c-5,3 -6,2 -11,6 \"/><path stroke-width=\"11\" d=\"M457,91c-3,2 -3,2 -6,5 \"/><path stroke-width=\"12\" d=\"M451,96c-3,3 -2,4 -5,6 \"/><path stroke-width=\"13\" d=\"M446,102c-2,2 -4,0 -6,2 -2,3 -1,4 -3,7 \"/><path stroke-width=\"12\" d=\"M437,111c-2,4 -2,4 -4,8 -2,5 -2,5 -3,9 \"/><path stroke-width=\"11\" d=\"M430,128c-2,8 -2,8 -5,15 \"/><path stroke-width=\"9\" d=\"M425,143c-2,8 -2,8 -5,17 -2,6 -2,6 -4,13 \"/><path stroke-width=\"10\" d=\"M416,173c-2,6 -2,6 -3,12 -1,7 -1,7 -2,13 0,7 1,8 0,15 \"/><path stroke-width=\"11\" d=\"M411,213c-1,4 -2,4 -3,8 -1,7 0,7 0,14 \"/><path stroke-width=\"10\" d=\"M408,235c0,6 0,6 0,11 \"/><path stroke-width=\"11\" d=\"M408,246c0,4 0,4 0,9 0,6 0,6 0,13 \"/><path stroke-width=\"9\" d=\"M408,268c0,9 0,9 0,18 0,8 0,8 0,17 \"/><path stroke-width=\"10\" d=\"M408,303c0,4 0,4 0,9 0,9 -1,9 0,18 \"/><path stroke-width=\"11\" d=\"M408,330c0,3 2,3 3,6 2,7 0,7 2,14 1,3 2,3 3,6 \"/><path stroke-width=\"12\" d=\"M416,356c2,4 1,5 3,9 \"/><path stroke-width=\"11\" d=\"M419,365c2,5 3,4 5,9 \"/><path stroke-width=\"12\" d=\"M424,374c2,2 2,2 4,5 \"/><path stroke-width=\"13\" d=\"M428,379c1,3 0,4 2,8 \"/><path stroke-width=\"12\" d=\"M430,387c2,4 4,4 6,9 1,2 -2,2 -1,4 \"/><path stroke-width=\"13\" d=\"M435,400c2,3 4,2 6,5 \"/><path stroke-width=\"12\" d=\"M441,405c2,3 0,4 2,6 \"/><path stroke-width=\"13\" d=\"M443,411c2,2 2,2 4,3 \"/><path stroke-width=\"15\" d=\"M447,414c2,1 2,2 4,2 3,1 3,0 6,0 \"/><path stroke-width=\"13\" d=\"M457,416c4,0 4,0 8,0 3,0 3,0 6,0 3,0 3,0 6,0 \"/><path stroke-width=\"12\" d=\"M477,416c6,0 6,0 12,0 \"/><path stroke-width=\"11\" d=\"M489,416c4,0 4,1 8,0 \"/><path stroke-width=\"12\" d=\"M497,416c4,-1 4,-2 8,-4 4,-3 3,-3 7,-5 \"/><path stroke-width=\"13\" d=\"M512,407c2,-2 2,-2 4,-3 3,-3 3,-3 5,-6 2,-3 2,-3 4,-6 2,-3 3,-2 5,-6 1,-2 -1,-3 0,-5 1,-3 3,-2 4,-5 \"/><path stroke-width=\"14\" d=\"M534,376c2,-1 2,-1 2,-3 1,-6 0,-7 2,-13 1,-2 3,0 4,-2 \"/><path stroke-width=\"15\" d=\"M542,358c0,-1 -1,-2 -1,-4 \"/></g></svg>', '2HGGNcDJYNb4Mk4GtL3C6yaB65haDVRr9GG3agu3/gU=', 411, 1, 1, '2025-04-27', 1),
(5, 7, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M272,99c0,0 0,0 0,0 \"/><path stroke-width=\"15\" d=\"M272,99c0,3 0,3 0,6 \"/><path stroke-width=\"10\" d=\"M272,105c0,15 0,15 0,30 \"/><path stroke-width=\"9\" d=\"M272,135c0,8 -1,8 0,15 2,15 5,15 7,30 \"/><path stroke-width=\"8\" d=\"M279,180c3,16 2,16 3,32 2,18 2,18 4,35 2,18 3,18 5,36 2,15 1,15 3,31 1,10 1,10 3,19 \"/><path stroke-width=\"10\" d=\"M297,333c1,5 1,5 1,10 \"/><path stroke-width=\"13\" d=\"M298,343c1,1 1,1 1,3 \"/><path stroke-width=\"14\" d=\"M299,346c0,2 0,2 0,5 \"/><path stroke-width=\"12\" d=\"M299,351c1,5 1,5 3,11 \"/><path stroke-width=\"11\" d=\"M302,362c1,4 2,4 3,8 1,6 0,6 0,12 \"/><path stroke-width=\"13\" d=\"M305,382c0,1 0,1 0,2 \"/><path stroke-width=\"14\" d=\"M305,384c0,3 0,3 0,6 0,3 0,3 0,5 0,2 0,3 0,3 \"/><path stroke-width=\"16\" d=\"M180,96c0,0 0,0 0,0 \"/><path stroke-width=\"14\" d=\"M180,96c10,0 10,0 21,0 \"/><path stroke-width=\"10\" d=\"M201,96c10,0 10,0 20,0 \"/><path stroke-width=\"8\" d=\"M221,96c15,0 15,0 31,0 21,0 21,-1 41,1 21,2 21,3 41,8 17,4 17,4 33,10 9,4 9,5 17,9 \"/><path stroke-width=\"9\" d=\"M384,124c6,3 7,2 11,6 \"/><path stroke-width=\"11\" d=\"M395,130c3,3 2,4 5,6 5,5 8,3 12,8 \"/><path stroke-width=\"10\" d=\"M412,144c4,5 1,7 4,12 3,7 4,6 8,12 \"/><path stroke-width=\"9\" d=\"M424,168c5,7 5,7 9,14 \"/><path stroke-width=\"10\" d=\"M433,182c3,5 4,5 6,10 3,8 2,9 4,17 \"/><path stroke-width=\"9\" d=\"M443,209c2,7 2,7 4,14 \"/><path stroke-width=\"10\" d=\"M447,223c2,6 3,6 4,12 1,6 0,6 0,13 \"/><path stroke-width=\"11\" d=\"M451,248c0,4 0,4 0,7 \"/><path stroke-width=\"12\" d=\"M451,255c0,6 0,6 0,13 \"/><path stroke-width=\"10\" d=\"M451,268c0,6 0,6 0,12 \"/><path stroke-width=\"11\" d=\"M451,280c0,4 0,4 0,9 \"/><path stroke-width=\"10\" d=\"M451,289c-1,9 0,9 -2,19 \"/><path stroke-width=\"9\" d=\"M449,308c-2,7 -2,7 -6,13 -5,9 -6,8 -12,17 -4,7 -4,7 -8,14 -6,8 -6,9 -12,17 \"/><path stroke-width=\"8\" d=\"M411,369c-5,7 -6,7 -12,14 \"/><path stroke-width=\"9\" d=\"M399,383c-6,6 -5,7 -11,14 -6,6 -7,5 -14,10 \"/><path stroke-width=\"10\" d=\"M374,407c-3,3 -3,3 -6,6 \"/><path stroke-width=\"12\" d=\"M368,413c-2,2 -3,1 -5,3 -5,3 -4,3 -9,5 \"/><path stroke-width=\"13\" d=\"M354,421c-1,1 -1,1 -3,1 \"/><path stroke-width=\"14\" d=\"M351,422c-2,0 -2,0 -5,0 \"/><path stroke-width=\"15\" d=\"M346,422c0,0 0,0 -1,0 \"/><path stroke-width=\"16\" d=\"M345,422c-2,0 -2,0 -4,0 \"/><path stroke-width=\"14\" d=\"M341,422c-2,1 -2,1 -5,2 -3,0 -3,0 -6,0 \"/><path stroke-width=\"12\" d=\"M330,424c-5,0 -5,0 -11,0 \"/><path stroke-width=\"10\" d=\"M319,424c-8,0 -8,0 -15,0 \"/><path stroke-width=\"12\" d=\"M304,424c-2,0 -2,0 -4,0 \"/><path stroke-width=\"14\" d=\"M300,424c-2,0 -2,-1 -5,-1 -3,-1 -3,0 -6,-1 \"/><path stroke-width=\"13\" d=\"M289,422c-3,-1 -2,-2 -6,-3 \"/><path stroke-width=\"14\" d=\"M283,419c-1,-1 -1,0 -3,0 -3,-1 -2,-2 -5,-3 \"/><path stroke-width=\"13\" d=\"M275,416c-3,-2 -2,-2 -5,-3 \"/><path stroke-width=\"14\" d=\"M270,413c-3,-1 -4,0 -7,0 \"/><path stroke-width=\"16\" d=\"M565,99c0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M565,99c-1,1 -1,1 -2,2 \"/><path stroke-width=\"14\" d=\"M563,101c-3,3 -3,3 -5,7 \"/><path stroke-width=\"11\" d=\"M558,108c-3,7 -3,7 -6,14 \"/><path stroke-width=\"9\" d=\"M552,122c-3,8 -3,8 -6,17 \"/><path stroke-width=\"8\" d=\"M546,139c-3,11 -2,11 -5,22 -2,10 -2,10 -5,20 -3,10 -4,10 -7,21 -3,10 -2,10 -4,21 -4,17 -5,17 -6,35 -1,14 0,14 0,29 0,12 0,12 0,23 0,9 0,9 0,17 \"/><path stroke-width=\"9\" d=\"M519,327c0,10 0,10 0,19 0,8 0,8 0,15 \"/><path stroke-width=\"11\" d=\"M519,361c0,3 -1,3 0,6 \"/><path stroke-width=\"12\" d=\"M519,367c1,5 1,5 3,11 \"/><path stroke-width=\"11\" d=\"M522,378c2,4 2,4 5,8 4,4 5,3 9,8 4,5 2,6 6,10 \"/><path stroke-width=\"10\" d=\"M542,404c5,6 5,6 11,10 \"/><path stroke-width=\"9\" d=\"M553,414c6,5 6,5 14,8 7,3 8,3 16,5 8,2 9,2 17,4 6,1 6,1 12,1 \"/><path stroke-width=\"10\" d=\"M612,432c8,0 8,2 16,0 \"/><path stroke-width=\"9\" d=\"M628,432c8,-2 7,-4 14,-7 8,-4 8,-4 15,-8 7,-4 7,-4 13,-9 7,-6 6,-7 12,-14 4,-6 4,-7 8,-13 5,-8 6,-7 9,-15 2,-6 0,-7 2,-13 3,-11 4,-10 7,-21 \"/><path stroke-width=\"8\" d=\"M708,332c2,-9 3,-9 4,-19 \"/><path stroke-width=\"9\" d=\"M712,313c1,-7 0,-7 0,-15 0,-8 1,-8 2,-16 1,-11 0,-11 1,-23 1,-7 1,-6 2,-13 0,-8 0,-8 0,-15 0,-9 0,-9 0,-17 \"/><path stroke-width=\"10\" d=\"M717,214c0,-6 0,-6 0,-12 0,-6 0,-6 0,-12 \"/><path stroke-width=\"12\" d=\"M717,190c0,-3 1,-3 0,-7 \"/><path stroke-width=\"13\" d=\"M717,183c-1,-2 -1,-2 -3,-4 \"/><path stroke-width=\"14\" d=\"M714,179c-1,-2 -2,-2 -2,-5 -1,-3 1,-4 0,-7 -1,-1 -3,0 -4,-2 \"/><path stroke-width=\"13\" d=\"M708,165c-2,-2 -2,-3 -3,-6 -2,-2 -1,-3 -3,-5 -2,-2 -2,-2 -4,-4 -2,-2 -2,-2 -5,-5 -1,-2 -1,-2 -3,-4 \"/><path stroke-width=\"14\" d=\"M690,141c-2,-2 -2,-1 -4,-3 \"/><path stroke-width=\"13\" d=\"M686,138c-3,-3 -2,-3 -6,-6 \"/><path stroke-width=\"14\" d=\"M680,132c-1,-1 -1,-1 -3,-1 -2,-1 -2,1 -5,0 -1,0 -1,-1 -2,-2 \"/><path stroke-width=\"15\" d=\"M670,129c-2,-2 -2,-2 -4,-3 \"/><path stroke-width=\"13\" d=\"M666,126c-4,-2 -4,-2 -8,-3 \"/><path stroke-width=\"14\" d=\"M658,123c-3,-1 -3,-1 -6,-2 -4,-2 -4,-3 -8,-5 \"/><path stroke-width=\"12\" d=\"M644,116c-3,-1 -3,-2 -6,-3 -4,-1 -4,0 -9,-1 -3,-1 -3,-1 -5,-2 \"/><path stroke-width=\"13\" d=\"M624,110c-3,-1 -3,-1 -5,-3 -4,-2 -3,-3 -7,-5 \"/><path stroke-width=\"14\" d=\"M612,102c-1,0 -1,1 -2,1 -3,-2 -3,-4 -6,-6 0,0 0,2 -1,2 \"/><path stroke-width=\"16\" d=\"M603,99c-2,0 -2,0 -4,0 -1,0 -1,0 -2,0 \"/><path stroke-width=\"17\" d=\"M597,99c-1,0 -1,0 -2,0 -1,0 -1,0 -2,0 \"/><path stroke-width=\"16\" d=\"M593,99c-4,-1 -4,-2 -9,-3 \"/><path stroke-width=\"15\" d=\"M584,96c-1,0 -1,0 -2,0 \"/><path stroke-width=\"16\" d=\"M582,96c0,0 0,0 -1,0 \"/><path stroke-width=\"17\" d=\"M581,96c-2,0 -2,0 -3,0 \"/><path stroke-width=\"16\" d=\"M578,96c-2,0 -2,0 -4,0 0,0 0,0 0,0 \"/><path stroke-width=\"17\" d=\"M574,96c-3,0 -3,-1 -6,0 \"/><path stroke-width=\"15\" d=\"M568,96c-3,1 -3,1 -5,3 -1,0 -1,0 -1,1 \"/><path stroke-width=\"16\" d=\"M562,100c-1,3 -1,3 -1,6 \"/><path stroke-width=\"13\" d=\"M561,106c-1,3 -1,3 -1,6 \"/></g></svg>', 'Evb+LeDVDZu2TintRUlB3DJhRr9exDd/ncsALZQnE98=', 411, 1, 1, '2025-04-27', 1),
(6, 9, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.2\" baseProfile=\"tiny\" height=\"525\" width=\"912\" viewBox=\"0 0 912 525\"><g stroke-linejoin=\"round\" stroke-linecap=\"round\" fill=\"none\" stroke=\"black\"><path stroke-width=\"16\" d=\"M139,85c0,0 0,0 0,0 \"/><path stroke-width=\"14\" d=\"M139,85c0,8 -1,8 0,16 \"/><path stroke-width=\"9\" d=\"M139,101c2,14 3,14 6,27 \"/><path stroke-width=\"8\" d=\"M145,128c2,9 2,9 3,17 2,17 1,17 2,33 3,22 4,22 7,43 3,27 2,27 6,54 2,11 3,11 5,22 2,10 2,10 3,19 3,20 3,20 6,40 1,7 1,8 3,15 \"/><path stroke-width=\"9\" d=\"M180,371c2,7 3,10 4,14 \"/><path stroke-width=\"13\" d=\"M142,69c0,0 0,0 0,0 \"/><path stroke-width=\"15\" d=\"M142,69c2,2 2,2 4,4 \"/><path stroke-width=\"12\" d=\"M146,73c3,4 2,5 5,9 \"/><path stroke-width=\"10\" d=\"M151,82c7,9 8,9 15,18 \"/><path stroke-width=\"8\" d=\"M166,100c10,13 10,13 20,26 10,11 9,11 18,23 9,10 9,10 18,21 8,8 8,8 16,17 5,6 5,7 11,13 \"/><path stroke-width=\"9\" d=\"M249,200c4,6 3,7 9,12 11,9 12,9 23,17 \"/><path stroke-width=\"10\" d=\"M281,229c3,1 3,3 6,3 \"/><path stroke-width=\"13\" d=\"M287,232c5,0 7,0 11,-4 \"/><path stroke-width=\"11\" d=\"M298,228c6,-7 4,-9 9,-18 \"/><path stroke-width=\"8\" d=\"M307,210c6,-11 7,-11 12,-22 6,-11 6,-11 11,-22 4,-10 5,-10 8,-21 2,-9 1,-10 2,-20 1,-9 1,-10 3,-19 \"/><path stroke-width=\"9\" d=\"M343,106c2,-8 4,-8 6,-16 \"/><path stroke-width=\"10\" d=\"M349,90c1,-5 0,-5 1,-9 \"/><path stroke-width=\"12\" d=\"M350,81c2,-4 2,-4 4,-7 \"/><path stroke-width=\"13\" d=\"M354,74c1,-2 1,-4 1,-3 \"/><path stroke-width=\"15\" d=\"M355,71c1,5 0,8 1,16 \"/><path stroke-width=\"13\" d=\"M356,87c1,6 3,6 5,13 \"/><path stroke-width=\"9\" d=\"M361,100c2,8 1,9 3,17 \"/><path stroke-width=\"8\" d=\"M364,117c3,14 3,14 7,27 5,15 5,14 9,29 2,8 2,9 4,17 4,14 5,14 8,28 3,15 1,15 5,31 5,17 6,17 12,34 2,9 2,10 4,20 2,11 2,11 4,22 1,8 2,8 3,16 \"/><path stroke-width=\"9\" d=\"M420,341c1,8 1,8 2,15 \"/><path stroke-width=\"10\" d=\"M422,356c1,5 1,5 2,10 \"/><path stroke-width=\"12\" d=\"M424,366c0,3 -1,4 0,7 \"/><path stroke-width=\"11\" d=\"M424,373c2,7 3,7 4,14 1,4 1,4 1,9 1,5 1,5 1,11 0,6 0,6 0,12 \"/><path stroke-width=\"12\" d=\"M430,419c0,2 0,3 0,4 \"/><path stroke-width=\"16\" d=\"M669,88c0,0 0,0 0,0 -3,0 -3,1 -5,0 \"/><path stroke-width=\"14\" d=\"M664,88c-3,-1 -3,-2 -6,-3 \"/><path stroke-width=\"13\" d=\"M658,85c-2,-1 -2,-2 -5,-2 -3,-1 -3,0 -6,0 \"/><path stroke-width=\"14\" d=\"M647,83c-1,0 -1,0 -3,0 -3,0 -3,0 -5,0 -3,0 -3,0 -6,0 -2,0 -2,0 -3,0 -3,0 -3,0 -6,0 \"/><path stroke-width=\"13\" d=\"M624,83c-3,0 -3,1 -6,1 -4,1 -5,0 -9,1 \"/><path stroke-width=\"12\" d=\"M609,85c-4,1 -4,2 -7,5 -4,2 -4,1 -7,4 -4,3 -3,3 -7,6 \"/><path stroke-width=\"11\" d=\"M588,100c-4,3 -5,3 -9,6 -4,4 -3,5 -8,9 \"/><path stroke-width=\"12\" d=\"M571,115c-2,2 -4,1 -6,3 \"/><path stroke-width=\"14\" d=\"M565,118c-1,1 0,1 0,3 0,3 0,3 0,5 0,2 0,2 0,3 \"/><path stroke-width=\"15\" d=\"M565,129c0,2 0,2 0,3 0,2 0,2 0,4 \"/><path stroke-width=\"13\" d=\"M565,136c0,4 -1,4 -1,8 \"/><path stroke-width=\"14\" d=\"M564,144c-1,2 -1,2 -1,3 0,3 0,3 0,7 \"/><path stroke-width=\"13\" d=\"M563,154c0,2 0,2 0,5 \"/><path stroke-width=\"14\" d=\"M563,159c0,2 0,2 0,4 0,3 0,3 0,6 \"/><path stroke-width=\"13\" d=\"M563,169c0,3 0,3 0,6 \"/><path stroke-width=\"14\" d=\"M563,175c0,1 0,1 0,3 \"/><path stroke-width=\"16\" d=\"M563,178c0,1 0,1 0,2 0,1 -1,2 0,3 \"/><path stroke-width=\"12\" d=\"M563,183c4,6 3,9 9,12 \"/><path stroke-width=\"9\" d=\"M572,195c8,4 10,0 19,4 7,3 6,6 12,9 10,6 11,6 22,10 \"/><path stroke-width=\"8\" d=\"M625,218c11,5 11,5 22,9 12,4 12,3 23,6 9,3 9,4 17,7 \"/><path stroke-width=\"9\" d=\"M687,240c6,2 7,2 13,5 \"/><path stroke-width=\"10\" d=\"M700,245c5,2 4,3 9,6 \"/><path stroke-width=\"11\" d=\"M709,251c5,3 6,2 11,5 5,2 5,2 9,4 \"/><path stroke-width=\"12\" d=\"M729,260c3,2 4,2 6,4 \"/><path stroke-width=\"13\" d=\"M735,264c1,1 1,2 1,3 \"/><path stroke-width=\"14\" d=\"M736,267c2,4 3,3 5,7 \"/><path stroke-width=\"13\" d=\"M741,274c1,2 0,2 1,5 1,4 1,4 1,8 1,3 1,3 1,6 0,4 0,4 0,7 \"/><path stroke-width=\"12\" d=\"M744,300c0,5 0,5 0,10 0,4 0,4 0,9 \"/><path stroke-width=\"13\" d=\"M744,319c0,2 0,2 0,5 0,4 1,5 0,8 \"/><path stroke-width=\"12\" d=\"M744,332c-1,3 -3,3 -5,6 \"/><path stroke-width=\"13\" d=\"M739,338c-2,2 -1,4 -3,6 \"/><path stroke-width=\"11\" d=\"M736,344c-5,4 -6,3 -13,7 \"/><path stroke-width=\"10\" d=\"M723,351c-4,2 -5,1 -9,4 \"/><path stroke-width=\"11\" d=\"M714,355c-6,3 -5,4 -10,7 -5,2 -6,1 -12,3 -3,1 -3,1 -6,2 \"/><path stroke-width=\"12\" d=\"M686,367c-5,0 -5,0 -10,0 \"/><path stroke-width=\"14\" d=\"M676,367c-1,0 -1,0 -1,0 \"/><path stroke-width=\"15\" d=\"M675,367c-3,0 -3,0 -6,0 \"/><path stroke-width=\"12\" d=\"M669,367c-5,0 -5,0 -11,0 \"/><path stroke-width=\"11\" d=\"M658,367c-6,0 -6,0 -11,0 \"/><path stroke-width=\"10\" d=\"M647,367c-10,-1 -10,-1 -21,-2 \"/><path stroke-width=\"9\" d=\"M626,365c-7,-2 -8,-1 -15,-4 -6,-2 -6,-3 -12,-6 \"/><path stroke-width=\"10\" d=\"M599,355c-7,-3 -7,-3 -14,-5 \"/><path stroke-width=\"11\" d=\"M585,350c-4,-2 -4,-2 -8,-3 \"/><path stroke-width=\"12\" d=\"M577,347c-4,-2 -4,-2 -8,-4 -3,-2 -3,-2 -6,-5 \"/><path stroke-width=\"14\" d=\"M563,338c0,0 1,0 0,-1 \"/><path stroke-width=\"16\" d=\"M563,337c0,-1 0,-1 0,-2 0,0 0,-1 0,-1 -3,-4 -6,-4 -8,-8 \"/><path stroke-width=\"14\" d=\"M555,326c-1,-3 1,-3 2,-6 \"/><path stroke-width=\"15\" d=\"M557,320c0,-1 0,-1 0,-2 0,-3 0,-3 0,-5 \"/><path stroke-width=\"14\" d=\"M557,313c0,-2 0,-2 0,-5 \"/><path stroke-width=\"15\" d=\"M557,308c0,0 0,-1 0,-1 \"/></g></svg>', '+1A3xr2gb4N2Rj1B6UsyUqA915SZMEp3nGJurSSpQJg=', 410, 1, 1, '2025-04-27', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `itembpm`
--

CREATE TABLE `itembpm` (
  `IdItem` int(11) NOT NULL,
  `Descripcion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `itembpm`
--

INSERT INTO `itembpm` (`IdItem`, `Descripcion`) VALUES
(1, 'Uniforme en Correcto Estado'),
(2, 'Uniforme No Alterado'),
(3, 'Uso de Guantes'),
(4, 'Cofia Bien Colocada'),
(5, 'Barbijo/Barbero Bien Colocado'),
(6, 'Sin Alhajas'),
(7, 'Maquillaje/Perfume'),
(8, 'Uso Correcto de Lentes'),
(9, 'No Consumo de Alimentos'),
(10, 'Orden/Limpieza'),
(11, 'Productos Químicos'),
(12, 'Otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea`
--

CREATE TABLE `linea` (
  `IdLinea` int(11) NOT NULL,
  `Descripcion` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `linea`
--

INSERT INTO `linea` (`IdLinea`, `Descripcion`) VALUES
(1, 'Línea 1'),
(2, 'Línea 2'),
(3, 'Línea 3'),
(4, 'Línea 4'),
(5, 'Línea 5'),
(6, 'Línea 6'),
(7, 'Línea 7'),
(8, 'Línea 51'),
(9, 'Línea 52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `operario`
--

CREATE TABLE `operario` (
  `IdOperario` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Legajo` int(11) NOT NULL,
  `IdActividad` int(11) NOT NULL,
  `IdLinea` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `operario`
--

INSERT INTO `operario` (`IdOperario`, `Nombre`, `Apellido`, `Legajo`, `IdActividad`, `IdLinea`, `Email`) VALUES
(3, 'Vanesa', 'Morales', 515536, 8, 5, 'mpbaigorria.01@gmail.com'),
(4, 'Rocío', 'Peralta', 511826, 10, 7, ''),
(5, 'Cristian', 'Racca', 511333, 10, 9, 'cracca@gmail.com'),
(6, 'Sandra', 'Miranda', 498822, 10, 8, 'smiranda@gmail.com'),
(7, 'Débora', 'Orellano', 518239, 8, 6, 'dorellano@gmail.com'),
(8, 'Agostina', 'Calandra', 505888, 9, 6, 'acalandra@gmail.com'),
(9, 'Micaela', 'Suarez', 500100, 2, 7, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supervisor`
--

CREATE TABLE `supervisor` (
  `IdSupervisor` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Legajo` int(11) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `supervisor`
--

INSERT INTO `supervisor` (`IdSupervisor`, `Nombre`, `Apellido`, `Email`, `Legajo`, `Password`) VALUES
(1, 'Patricia', 'Baigorria', 'mpbaigorria.01@gmail.com', 504203, 'gouYmGg8xrjrTMSMagqnzvlMa0qRYjpV28iCXQ+KWVk='),
(2, 'Jorge Ezequiel', 'Diaz', 'diazezequiel777@gmail.com', 123456, 'gouYmGg8xrjrTMSMagqnzvlMa0qRYjpV28iCXQ+KWVk=');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actividad`
--
ALTER TABLE `actividad`
  ADD PRIMARY KEY (`IdActividad`);

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`IdAuditoria`),
  ADD KEY `IdOperario` (`IdOperario`),
  ADD KEY `IdSupervisor` (`IdSupervisor`),
  ADD KEY `auditoria_ibfk_3` (`IdLinea`),
  ADD KEY `auditoria_ibfk_6` (`IdActividad`);

--
-- Indices de la tabla `auditoriaitembpm`
--
ALTER TABLE `auditoriaitembpm`
  ADD PRIMARY KEY (`IdAuditoriaItemBPM`),
  ADD UNIQUE KEY `IdAuditoria` (`IdAuditoria`,`IdItemBPM`),
  ADD KEY `IdItemBPM` (`IdItemBPM`);

--
-- Indices de la tabla `firma`
--
ALTER TABLE `firma`
  ADD PRIMARY KEY (`IdFirma`),
  ADD KEY `IdAuditoria` (`IdAuditoria`);

--
-- Indices de la tabla `firmapatron`
--
ALTER TABLE `firmapatron`
  ADD PRIMARY KEY (`IdFirmaPatron`),
  ADD KEY `IdOperario` (`IdOperario`);

--
-- Indices de la tabla `itembpm`
--
ALTER TABLE `itembpm`
  ADD PRIMARY KEY (`IdItem`);

--
-- Indices de la tabla `linea`
--
ALTER TABLE `linea`
  ADD PRIMARY KEY (`IdLinea`);

--
-- Indices de la tabla `operario`
--
ALTER TABLE `operario`
  ADD PRIMARY KEY (`IdOperario`),
  ADD KEY `IdActividad` (`IdActividad`),
  ADD KEY `operario_ibfk_2` (`IdLinea`);

--
-- Indices de la tabla `supervisor`
--
ALTER TABLE `supervisor`
  ADD PRIMARY KEY (`IdSupervisor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actividad`
--
ALTER TABLE `actividad`
  MODIFY `IdActividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `IdAuditoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT de la tabla `auditoriaitembpm`
--
ALTER TABLE `auditoriaitembpm`
  MODIFY `IdAuditoriaItemBPM` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1084;

--
-- AUTO_INCREMENT de la tabla `firma`
--
ALTER TABLE `firma`
  MODIFY `IdFirma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `firmapatron`
--
ALTER TABLE `firmapatron`
  MODIFY `IdFirmaPatron` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `itembpm`
--
ALTER TABLE `itembpm`
  MODIFY `IdItem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `linea`
--
ALTER TABLE `linea`
  MODIFY `IdLinea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `operario`
--
ALTER TABLE `operario`
  MODIFY `IdOperario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `supervisor`
--
ALTER TABLE `supervisor`
  MODIFY `IdSupervisor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD CONSTRAINT `auditoria_ibfk_1` FOREIGN KEY (`IdOperario`) REFERENCES `operario` (`IdOperario`),
  ADD CONSTRAINT `auditoria_ibfk_3` FOREIGN KEY (`IdLinea`) REFERENCES `linea` (`IdLinea`) ON UPDATE CASCADE,
  ADD CONSTRAINT `auditoria_ibfk_4` FOREIGN KEY (`IdSupervisor`) REFERENCES `supervisor` (`IdSupervisor`),
  ADD CONSTRAINT `auditoria_ibfk_6` FOREIGN KEY (`IdActividad`) REFERENCES `actividad` (`IdActividad`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `auditoriaitembpm`
--
ALTER TABLE `auditoriaitembpm`
  ADD CONSTRAINT `auditoriaitembpm_ibfk_1` FOREIGN KEY (`IdAuditoria`) REFERENCES `auditoria` (`IdAuditoria`),
  ADD CONSTRAINT `auditoriaitembpm_ibfk_2` FOREIGN KEY (`IdItemBPM`) REFERENCES `itembpm` (`IdItem`);

--
-- Filtros para la tabla `firma`
--
ALTER TABLE `firma`
  ADD CONSTRAINT `firma_ibfk_1` FOREIGN KEY (`IdAuditoria`) REFERENCES `auditoria` (`IdAuditoria`);

--
-- Filtros para la tabla `firmapatron`
--
ALTER TABLE `firmapatron`
  ADD CONSTRAINT `firmapatron_ibfk_1` FOREIGN KEY (`IdOperario`) REFERENCES `operario` (`IdOperario`);

--
-- Filtros para la tabla `operario`
--
ALTER TABLE `operario`
  ADD CONSTRAINT `operario_ibfk_2` FOREIGN KEY (`IdLinea`) REFERENCES `linea` (`IdLinea`) ON UPDATE CASCADE,
  ADD CONSTRAINT `operario_ibfk_3` FOREIGN KEY (`IdActividad`) REFERENCES `actividad` (`IdActividad`);
--
-- Base de datos: `biblioteca`
--
DROP DATABASE IF EXISTS `biblioteca`;
CREATE DATABASE IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `biblioteca`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `id_autor` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `nacionalidad` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id_autor`, `dni`, `nombre`, `apellido`, `nacionalidad`) VALUES
(1, 12345678, 'Gabriel', 'García Márquez', 'Colombiana'),
(2, 23456789, 'Jane', 'Austen', 'Británica'),
(3, 34567890, 'George', 'Orwell', 'Británica'),
(4, 45678901, 'Lev', 'Tolstói', 'Rusa'),
(5, 56789012, 'Antoine', 'de Saint-Exupéry', 'Francesa'),
(6, 12345677, 'Juan Carlos', 'Recalde', 'Uruguayo'),
(8, 12345679, 'Juan Carlos', 'Recalde', 'Uruguayo'),
(9, 12345673, 'Juan Manuel', 'Recaldo', 'Argentino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `id_libro` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `stock` int(11) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`id_libro`, `nombre`, `stock`, `tipo`) VALUES
(2, 'Rebelión en la Granja', 18, 'Misterio'),
(3, 'Mi planta de naranja-lima', 100, 'Emotivo'),
(4, 'Orgullo y Prejuicio', 12, 'Romance'),
(8, 'Los ojos del perro siberiano', 50, 'Drama');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `id_prestamo` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `id_autor` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`id_prestamo`, `id_libro`, `id_autor`, `fecha`) VALUES
(1, 3, 1, '2024-08-22'),
(2, 4, 2, '2024-09-16'),
(3, 2, 3, '2024-09-17'),
(4, 3, 3, '2024-09-18'),
(7, 2, 5, '2024-09-23');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id_autor`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`id_libro`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `id_autor` (`id_autor`),
  ADD KEY `id_libro` (`id_libro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Base de datos: `centrosalud`
--
DROP DATABASE IF EXISTS `centrosalud`;
CREATE DATABASE IF NOT EXISTS `centrosalud` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `centrosalud`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacionesvacunas`
--

CREATE TABLE `aplicacionesvacunas` (
  `id` int(11) NOT NULL,
  `turno_id` int(11) NOT NULL,
  `vacuna_id` int(11) NOT NULL,
  `fecha_aplicacion` date NOT NULL,
  `dosis` int(11) NOT NULL,
  `confirmado` tinyint(1) NOT NULL DEFAULT 0,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aplicacionesvacunas`
--

INSERT INTO `aplicacionesvacunas` (`id`, `turno_id`, `vacuna_id`, `fecha_aplicacion`, `dosis`, `confirmado`, `usuario_id`) VALUES
(1, 1, 1, '2024-06-01', 1, 1, 2),
(2, 2, 2, '2024-06-02', 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` enum('Masculino','Femenino','Otro') NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `nombre`, `apellido`, `fecha_nacimiento`, `genero`, `direccion`, `telefono`, `email`) VALUES
(1, 'Juan', 'Pérez', '2010-05-20', 'Masculino', 'Calle Falsa 123', '123456789', 'juan.perez@example.com'),
(2, 'María', 'Gómez', '2008-09-15', 'Femenino', 'Av. Siempre Viva 742', '987654321', 'maria.gomez@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turnos`
--

CREATE TABLE `turnos` (
  `id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL,
  `tutor_id` int(11) DEFAULT NULL,
  `fecha_hora` datetime NOT NULL,
  `estado` enum('Pendiente','Confirmado','Cancelado') NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `turnos`
--

INSERT INTO `turnos` (`id`, `paciente_id`, `tutor_id`, `fecha_hora`, `estado`, `usuario_id`) VALUES
(1, 1, 1, '2024-06-01 10:00:00', 'Pendiente', 3),
(2, 2, 2, '2024-06-02 11:00:00', 'Pendiente', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tutores`
--

CREATE TABLE `tutores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `relacion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tutores`
--

INSERT INTO `tutores` (`id`, `nombre`, `apellido`, `telefono`, `email`, `relacion`) VALUES
(1, 'Carlos', 'Pérez', '555123456', 'carlos.perez@example.com', 'Padre'),
(2, 'Ana', 'Gómez', '555987654', 'ana.gomez@example.com', 'Madre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `nivel_usuario` enum('Admin','Profesional','Recepcionista') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_usuario`, `contrasena`, `nivel_usuario`) VALUES
(1, 'admin', 'adminpass', 'Admin'),
(2, 'doctor', 'doctorpass', 'Profesional'),
(3, 'recepcion', 'receppass', 'Recepcionista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacunas`
--

CREATE TABLE `vacunas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `fabricante` varchar(100) DEFAULT NULL,
  `num_dosis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vacunas`
--

INSERT INTO `vacunas` (`id`, `nombre`, `descripcion`, `fabricante`, `num_dosis`) VALUES
(1, 'Vacuna A', 'Descripción de la Vacuna A', 'Fabricante A', 2),
(2, 'Vacuna B', 'Descripción de la Vacuna B', 'Fabricante B', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aplicacionesvacunas`
--
ALTER TABLE `aplicacionesvacunas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `turno_id` (`turno_id`),
  ADD KEY `vacuna_id` (`vacuna_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `tutor_id` (`tutor_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `tutores`
--
ALTER TABLE `tutores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`);

--
-- Indices de la tabla `vacunas`
--
ALTER TABLE `vacunas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aplicacionesvacunas`
--
ALTER TABLE `aplicacionesvacunas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `turnos`
--
ALTER TABLE `turnos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tutores`
--
ALTER TABLE `tutores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `vacunas`
--
ALTER TABLE `vacunas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aplicacionesvacunas`
--
ALTER TABLE `aplicacionesvacunas`
  ADD CONSTRAINT `aplicacionesvacunas_ibfk_1` FOREIGN KEY (`turno_id`) REFERENCES `turnos` (`id`),
  ADD CONSTRAINT `aplicacionesvacunas_ibfk_2` FOREIGN KEY (`vacuna_id`) REFERENCES `vacunas` (`id`),
  ADD CONSTRAINT `aplicacionesvacunas_ibfk_3` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `turnos`
--
ALTER TABLE `turnos`
  ADD CONSTRAINT `turnos_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `pacientes` (`id`),
  ADD CONSTRAINT `turnos_ibfk_2` FOREIGN KEY (`tutor_id`) REFERENCES `tutores` (`id`),
  ADD CONSTRAINT `turnos_ibfk_3` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
--
-- Base de datos: `crud`
--
DROP DATABASE IF EXISTS `crud`;
CREATE DATABASE IF NOT EXISTS `crud` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `crud`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `idTarea` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tareas`
--

INSERT INTO `tareas` (`idTarea`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'Tarea 1', 'Descripción de tarea 1', 0),
(2, 'Tarea 3', 'Descripción de tarea 3', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `completado` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `user`, `rol`) VALUES
(1, 'admin', 'admin'),
(2, 'demo', 'data entry');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`idTarea`);

--
-- Indices de la tabla `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `idTarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Base de datos: `gestioncomprasp`
--
DROP DATABASE IF EXISTS `gestioncomprasp`;
CREATE DATABASE IF NOT EXISTS `gestioncomprasp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gestioncomprasp`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familia`
--

CREATE TABLE `familia` (
  `Id` int(11) NOT NULL,
  `Codigo` varchar(11) NOT NULL,
  `Descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `familia`
--

INSERT INTO `familia` (`Id`, `Codigo`, `Descripcion`) VALUES
(1, 'AD', 'Aditivos'),
(2, 'AI', 'Aire'),
(3, 'BD', 'Bridas'),
(4, 'BR', 'Bronce'),
(5, 'CA', 'Cañe y Accesorios'),
(6, 'CL', 'Combustible y lubricantes'),
(7, 'CO', 'Correas'),
(8, 'EL', 'Electricidad'),
(9, 'EN', 'Envasado'),
(10, 'EP', 'Proteccion Personal'),
(11, 'EQ', 'Equipos'),
(12, 'FE', 'Ferreteria'),
(13, 'FI', 'Filtros'),
(14, 'JU', 'Juntas'),
(15, 'LI', 'Librería'),
(16, 'LZ', 'Limpieza'),
(17, 'MA', 'Mangueras'),
(18, 'ME', 'Instrumentos de Medición'),
(19, 'OR', 'Oring'),
(20, 'RE', 'Retenes'),
(21, 'RO', 'Rodamientos'),
(22, 'TR', 'Transmisión'),
(23, 'VA', 'Valvulas'),
(24, 'LA', 'Laboratorio');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `Id` int(11) NOT NULL,
  `ItemCodigo` varchar(11) NOT NULL,
  `ItemId` int(11) NOT NULL,
  `ProveedorId` int(11) NOT NULL,
  `CantidadIngreso` int(11) NOT NULL,
  `Remito` varchar(30) NOT NULL,
  `OrdenCompra` int(11) NOT NULL,
  `Pedido` int(11) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`Id`, `ItemCodigo`, `ItemId`, `ProveedorId`, `CantidadIngreso`, `Remito`, `OrdenCompra`, `Pedido`, `Fecha`) VALUES
(5, 'AD01001', 1, 1, 0, '11', 11, 11, '2024-11-28'),
(6, 'AD01001', 1, 1, 0, '11', 11, 11, '2024-11-29'),
(7, 'AD01001', 1, 2, 0, '55', 55, 55, '2024-12-06'),
(8, 'AD01001', 1, 2, 3, '33', 33, 33, '2024-11-30'),
(9, 'BD01002', 11, 4, 5, '55', 66, 5, '2025-01-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--

CREATE TABLE `item` (
  `Id` int(11) NOT NULL,
  `Codigo` varchar(11) DEFAULT NULL,
  `Descripcion` text NOT NULL,
  `UnidadDeMedidaId` int(11) DEFAULT NULL,
  `SubFamiliaId` int(11) DEFAULT NULL,
  `Stock` double NOT NULL,
  `PuntodePedido` double DEFAULT NULL,
  `Critico` tinyint(1) NOT NULL,
  `Precio` double NOT NULL,
  `Activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `item`
--

INSERT INTO `item` (`Id`, `Codigo`, `Descripcion`, `UnidadDeMedidaId`, `SubFamiliaId`, `Stock`, `PuntodePedido`, `Critico`, `Precio`, `Activo`) VALUES
(1, 'AD01001', 'ACEITE ISO VG 100 BIDON X 5LT', 1, 1, 5, 5, 1, 0, 1),
(2, 'AD01002', 'ACEITE HM ISO VG 10 BIDON X 5LT', 1, 1, 0, 5, 1, 0, 1),
(3, 'AD01003', 'AOI 1300 REMPLAZADO OPTHIMOL OR 130', 1, 1, 0, 0, 0, 0, 0),
(4, 'AD01004', 'BOI 650', 1, 1, 0, 0, 0, 1, 0),
(5, 'AD01005', 'KLEEN 5110 x LTS REMPLAZADO OPTHIMOL OR 511', 1, 1, 0, 0, 0, 0, 0),
(6, 'AD01006', 'KLEEN 1030 x LTS REMPLAZADO OPTHIMOL OR 103', 1, 1, 0, 0, 0, 0, 0),
(7, 'AI01001', 'CONECTOR 316 1/4\' OD - 3/8\' NPTM - SWAGELOK', 2, 2, 0, 10, 1, 0, 1),
(8, 'AI01002', 'CONECTOR 316 3/8\' OD - 3/8\' NPTM - SWAGELOK', 2, 2, 0, 10, 1, 0, 1),
(9, 'AI01003', 'CONECTOR 316 1/2\' OD - 3/8\' NPTM - SWAGELOK', 2, 2, 0, 10, 1, 0, 1),
(10, 'BD01001', 'BRIDA CIEGA  S-150 - AGUJEROS 4 - 1 1/2\'', 2, 3, 0, 1, 0, 0, 1),
(11, 'BD01002', 'BRIDA SORF- ASA-150 - AGUJEROS 4- 1/2\'', 2, 3, 6, 0, 0, 0, 1),
(12, 'BD01003', 'BRIDA SORF-ASA S-150 - AGUJEROS 8- 3/4\'', 2, 3, 0, 0, 0, 0, 1),
(13, 'BD01004', 'BRIDA SORF-ASA S-150 - AGUJEROS 4- 3/4\'', 2, 3, 0, 10, 1, 0, 1),
(14, 'BD01005', 'BRIDA SORF-ASA S-150 - AGUJEROS 4- 1 1/2\'', 2, 3, 0, 10, 1, 0, 1),
(15, 'BD01006', 'BRIDA SORF-ASA S-150 - AGUJEROS 4- 2\'', 2, 3, 0, 10, 1, 0, 1),
(16, 'BD01007', 'BRIDA SORF-ASA S-150 - AGUJEROS 4 - 2 1/2\'', 2, 3, 0, 0, 0, 0, 1),
(17, 'BD01008', 'BRIDA SORF-ASA S-150 - AGUJEROS 8- 3\'', 2, 3, 0, 0, 0, 0, 1),
(18, 'BD01009', 'BRIDA SORF-ASA S-150 - AGUJEROS 8- 4\'', 2, 3, 0, 2, 1, 0, 1),
(19, 'BD01010', 'BRIDA SORF-ASA S-150 RF - AGUJEROS 8- 8\'', 2, 3, 0, 0, 0, 0, 1),
(20, 'BD01011', 'BRIDA CIEGA- SERIE 150 -  2\'', 2, 3, 0, 0, 0, 0, 1),
(21, 'BD01012', 'BRIDA SORF-ASA S-150 RF - 10\'', 2, 3, 2, 0, 0, 0, 1),
(22, 'BD01013', 'BRIDA CIEGA 1/2\' SERIE 150', 2, 3, 1, 1, 0, 0, 1),
(23, 'BD01014', 'BRIDA ROSCADA S-150 2 1/2\'', 2, 3, 0, 1, 0, 0, 1),
(24, 'BD01015', 'BRIDA SORF-ASA S-150 RF - AGUJEROS 8- 6\'', 2, 3, 1, 1, 0, 0, 1),
(25, 'BD01016', 'BRIDA CIEGA  S-150 - AGUJEROS 4 - 1 \'', 2, 3, 1, 1, 0, 0, 1),
(26, 'BD01017', 'BRIDA SORF ASA SERIE 150 5\'', 2, 3, 0, 2, 1, 0, 1),
(27, 'BD01018', 'BRIDA CIEGA  S-150 - AGUJEROS 8 - 4 \'', 2, 3, 1, 1, 0, 0, 1),
(28, 'BD01019', 'BRIDA CIEGA PLANA S-150 AISI 304L - 11/2\'', 2, 3, 4, 1, 0, 0, 1),
(29, 'BD02001', 'BRIDA CIEGA  S-300 LTF MACHO 4\' A-105', 2, 4, 2, 2, 1, 0, 1),
(30, 'BD02002', 'BRIDA CIEGA ENCASTRE LTF MACHO S-300 - 1\'', 2, 4, 0, 0, 0, 0, 1),
(31, 'BD02003', 'BRIDA CIEGA ENCASTRE LTF MACHO S-300  - 1 1/2\'', 2, 4, 0, 1, 1, 0, 1),
(32, 'BD02004', 'BRIDA CIEGA ENCASTRE LTF MACHO S-300 - 2 1/2\'', 2, 4, 0, 0, 0, 0, 1),
(33, 'BD02005', 'BRIDA CIEGA ENCASTRE LTF MACHO S-300 - 3\'', 2, 4, 1, 0, 0, 0, 1),
(34, 'BD02006', 'BRIDA ENCASTRE LGF HEMBRA S-300 - 1/2\'', 2, 4, 5, 0, 0, 0, 1),
(35, 'BD02007', 'BRIDA ENCASTRE LTF MACHO S-300 - 1/2\'', 2, 4, 0, 0, 0, 0, 1),
(36, 'BD02008', 'BRIDA ENCASTRE LGF HEMBRA S-300  - 3/4\'', 2, 4, 7, 0, 0, 0, 1),
(37, 'BD02009', 'BRIDA ENCASTRE LTF MACHO S-300  - 3/4\'', 2, 4, 8, 0, 0, 0, 1),
(38, 'BD02010', 'BRIDA ENCASTRE LTF MACHO S-300 - 1\'', 2, 4, 0, 0, 0, 0, 1),
(39, 'BD02011', 'BRIDA ENCASTRE LGF HEMBRA S-300 - 1\'', 2, 4, 0, 0, 0, 0, 1),
(40, 'BD02012', 'BRIDA ENCASTRE LTF MACHO S-300- 1 1/2\'', 2, 4, 2, 0, 0, 0, 1),
(41, 'BD02013', 'BRIDA ENCASTRE LGF HEMBRA S-300 - 1 1/2\'', 2, 4, 1, 2, 1, 0, 1),
(42, 'BD02014', 'BRIDA ENCASTRE LTF MACHO S-300 - 2\'', 2, 4, 4, 3, 1, 128, 1),
(43, 'BD02015', 'BRIDA ENCASTRE LGF HEMBRA S-300  - 2\'', 2, 4, 5, 3, 1, 128, 1),
(44, 'BD02016', 'BRIDA ENCASTRE LTF MACHO S-300  - 2 1/2\'', 2, 4, 4, 2, 1, 192, 1),
(45, 'BD02017', 'BRIDA ENCASTRE LGF HEMBRA S-300  - 2 1/2\'', 2, 4, 4, 2, 1, 192, 1),
(46, 'BD02018', 'BRIDA ENCASTRE LTF MACHO S-300 - 3\'', 2, 4, 5, 2, 1, 0, 1),
(47, 'BD02019', 'BRIDA ENCASTRE LGF HEMBRA S-300  - 3\'', 2, 4, 16, 2, 1, 0, 1),
(48, 'BD02020', 'BRIDA ENCASTRE LTF MACHO S-300  - 4\'', 2, 4, 3, 2, 1, 0, 1),
(49, 'BD02021', 'BRIDA ENCASTRE LGF HEMBRA S-300 - 4\'', 2, 4, 2, 1, 1, 0, 1),
(50, 'BD02022', 'BRIDA ENCASTRE LTF MACHO S-300 - 6\'', 2, 4, 0, 0, 0, 0, 1),
(51, 'BD02023', 'BRIDA ENCASTRE LGF HEMBRA S-300 - 6\'', 2, 4, 2, 0, 0, 0, 1),
(52, 'BD02024', 'BRIDA SORF-ASA S-300 - 1/2\'', 2, 4, 5, 10, 0, 0, 1),
(53, 'BD02025', 'BRIDA SORF-ASA S-300 - 3/4\'', 2, 4, 6, 10, 1, 0, 1),
(54, 'BD02026', 'BRIDA SORF-ASA S-300- 1\'', 2, 4, 2, 10, 1, 0, 1),
(55, 'BD02027', 'BRIDA SORF-ASA S-300- 1 1/2\'', 2, 4, 0, 10, 1, 0, 1),
(56, 'BD02028', 'BRIDA SORF-ASA S-300 -  AGUJEROS 8- 2\'', 2, 4, 0, 0, 0, 0, 1),
(57, 'BD02029', 'BRIDA SORF-ASA S-300 - 2 1/2\'', 2, 4, 0, 0, 0, 0, 1),
(58, 'BD02030', 'BRIDA SORF-ASA S-300 - 3\'', 2, 4, 0, 1, 1, 0, 1),
(59, 'BD02031', 'BRIDA SORF-ASA S-300 - 4\'', 2, 4, 0, 0, 0, 0, 1),
(60, 'BD02032', 'BRIDA CIEGA S-300 - AGUJEROS 12 - 10\'', 2, 4, 1, 0, 0, 0, 1),
(61, 'BD02033', 'BRIDA CIEGA ENCASTRE LTF MACHO S-300 - AGUJ 8- 8\'', 2, 4, 0, 0, 0, 0, 1),
(62, 'BD02034', 'BRIDA CIEGA S300 ASTM A105 - 4\'', 2, 4, 0, 1, 1, 0, 1),
(63, 'BD02035', 'BRIDA ENCASTRE LTF MACHO S-300 - 10\'', 2, 4, 3, 1, 0, 0, 1),
(64, 'BD02036', 'BRIDA CIEGA PLANA S-300 AISI 304L - 11/2\'', 2, 4, 4, 1, 0, 0, 1),
(65, 'BR01001', 'CONECT RECTO AJUSTE X GAS M. 1/2\'X 1/2\' -ARMADO -K', 2, 5, 0, 0, 0, 0, 1),
(66, 'BR01002', 'CODO P/TUBO PLASTICO A GAS C/TUERCA 1/4 A 1/4', 2, 5, 0, 0, 0, 0, 1),
(67, 'BR01003', 'TUERCA REF 1/4\'', 2, 5, 6, 1, 1, 0, 1),
(68, 'BR01004', 'CONECTOR CODO P/VIROLA DE BCE. 3/8 - 1/4', 2, 5, 0, 0, 0, 0, 1),
(69, 'BR01005', 'TUERCA DE AJUSTE (P/VIROLA) 1/4\'', 2, 5, 7, 0, 0, 0, 1),
(70, 'BR01006', 'CONECTOR RECTO BCE. P/VIROLA 1/4 - 1/2', 2, 5, 0, 0, 0, 0, 1),
(71, 'BR01007', 'CONECTOR RECTO C/VIROLA BCE 1/4 A 1/4', 2, 5, 0, 0, 0, 0, 1),
(72, 'BR01008', 'CONECTOR RECTO M-M 3/8CX ROSCA 1/4', 2, 5, 0, 0, 0, 0, 1),
(73, 'BR01009', 'CONECTOR RECTO DE 1/4 A 3/8', 2, 5, 0, 2, 1, 0, 1),
(74, 'BR01010', 'CONECTOR RECTO TUBO DE 3/8 A ROSCA 1/2 NPT', 2, 5, 0, 1, 0, 0, 1),
(75, 'BR01011', 'CONECTOR TUBO A GAS DE 1/4 A 1/2 ', 2, 5, 0, 0, 0, 0, 1),
(76, 'BR01012', 'MANGUITO DE BCE DE 1/2\'', 2, 5, 52, 20, 1, 0, 1),
(77, 'BR01013', 'T DE BCE. P/ GAS 3/8', 2, 5, 0, 0, 0, 0, 1),
(78, 'BR01014', 'TUERCA DE AJUSTE  (P/VIROLA) BCE 3/8\'', 2, 5, 10, 10, 1, 0, 1),
(79, 'BR01015', 'TUERCA PARA  CAÑO 1/4\' ABOCARADAS', 2, 5, 0, 0, 0, 0, 1),
(80, 'BR01016', 'CODO 90 P/ TUBO 1/2\' (HC 1/2-1/26) TUERCA Y VIROLA', 2, 5, 0, 0, 0, 0, 1),
(81, 'BR01017', 'UNION CODO 2 TUBOS- 3/8\' BRONCE FDC - 3/8\'', 2, 5, 0, 0, 0, 0, 1),
(82, 'BR01018', 'UNION RECTA DE 2 TUBOS- 3/8\' BRONCE FDR - 3/8\'', 2, 5, 0, 0, 0, 0, 1),
(83, 'BR01019', 'UNION T DE 3 TUBOS 3/8\' BRONCE F3T - 3/8\'', 2, 5, 4, 0, 0, 0, 1),
(84, 'BR01020', 'VIROLA DE BCE DE 3/8\'', 2, 5, 10, 10, 1, 0, 1),
(85, 'BR01021', 'VIROLA DE BCE 1/2\'', 2, 5, 495, 15, 1, 1, 1),
(86, 'BR01022', 'CAÑO DE COBRE X MTS 3/8\'', 3, 5, 4, 5, 0, 0, 1),
(87, 'BR01023', 'CONECTOR RECTO C/TUERCA P/VIROLA 3/8 A 3/8\'', 2, 5, 5, 0, 0, 0, 1),
(88, 'BR01024', 'CONECTOR CODO DE 2- 3/8 80D FDC - 3/8\'', 2, 5, 9, 0, 0, 0, 1),
(89, 'BR01025', 'CONECTOR RECTO 2 TUBO- 3/8 80D/FDR-3/8\'', 2, 5, 0, 0, 0, 0, 1),
(90, 'BR01026', 'VIROLA DE BCE 1/4\'', 2, 5, 0, 0, 0, 0, 1),
(91, 'BR01027', 'MANGUITO DE BCE DE 3/8\'', 2, 5, 73, 0, 0, 0, 1),
(92, 'BR01028', 'CONECTOR RECTO P/TUBO PLASTICO 1/4\'', 2, 5, 0, 0, 0, 0, 1),
(93, 'BR01029', 'CONECTOR CODO UN LADO CONICO GAS 3/8\' X 1/4', 2, 5, 0, 0, 0, 0, 1),
(94, 'BR01030', 'CAÑO DE COBRE X MTS 1/2\'', 3, 5, 0, 2, 1, 0, 1),
(95, 'BR01031', 'CAÑO DE COBRE X MTS 1/4\'', 3, 5, 0, 1, 1, 0, 1),
(96, 'BR01032', 'CONECTOR C /TUERCA Y CONO 6 M/M X 1/4 GAS ', 2, 5, 0, 0, 0, 0, 1),
(97, 'BR01033', 'CAÑO DE COBRE X MTS 3/16\'', 2, 5, 0, 0, 0, 0, 1),
(98, 'BR01034', 'TUERCA AJUSTE (P/VIROLA) 1/8\'', 2, 5, 5, 0, 0, 0, 1),
(99, 'BR01035', 'CUPLA DE REDUCCION ROSCA GAS 1/4 A 1/8', 2, 5, 0, 0, 0, 0, 1),
(100, 'BR01036', 'VIROLA DE BRONCE AJUSTE  1/8', 2, 5, 0, 0, 0, 0, 1),
(101, 'BR01037', 'CONEXIÓN BRONCE 1\' X 1 3/4 MACHO C32', 2, 5, 0, 0, 0, 0, 1),
(102, 'BR01038', ',,,', 2, 5, 0, 0, 0, 0, 0),
(103, 'BR01039', 'CONEXIÓN MACHO BRONCE C55 Union Sud 1 1/2\'', 2, 5, 0, 0, 0, 0, 0),
(104, 'BR01040', 'CONEXIÓN HEMB BRONCE A60 Union Sud 1 1/2\' A 1 1/4\'', 2, 5, 0, 0, 0, 0, 0),
(105, 'BR01041', 'TUERCA DE AJUSTE CONICO 3/8\' REF', 2, 5, 0, 1, 0, 0, 1),
(106, 'BR01042', 'TUERCA DE AJUSTE CONICO 1/2\' REF', 2, 5, 7, 5, 0, 0, 1),
(107, 'BR01043', 'TUERCA DE AJUSTE  (P/VIROLA) BCE 1/2\'', 2, 5, 16, 5, 0, 0, 1),
(108, 'CA01001', 'CAÑOS 1/2\' AºCº SCH80', 3, 6, 0, 0, 0, 0, 1),
(109, 'CA01002', 'CAÑOS 3/4\' AºCº SCH80 CON COSTURA', 3, 6, 0, 32, 1, 0, 1),
(110, 'CA01003', 'CAÑOS 1\' AºCº SCH80 CON COSTURA', 3, 6, 0, 32, 1, 0, 1),
(111, 'CA01004', 'CAÑOS 1 1/4\' AºCº SCH80', 3, 6, 0, 0, 0, 0, 1),
(112, 'CA01005', 'CAÑOS 1 1/2\' AºCº SCH80 CON COSTURA', 3, 6, 0, 32, 1, 0, 1),
(113, 'CA01006', 'CAÑOS 2\' AºCº SCH80', 3, 6, 0, 19, 1, 0, 1),
(114, 'CA01007', 'CAÑOS 3\' AºCº SCH80', 3, 6, 0, 0, 0, 0, 1),
(115, 'CA01008', 'CAÑOS 4\' AºCº SCH80', 3, 6, 0, 0, 0, 0, 1),
(116, 'CA01009', 'NIPLE 1 1/2\' X 100mm AºCº SCH80 - R', 2, 6, 0, 2, 0, 0, 1),
(117, 'CA01010', 'NIPLE 3 1/2\' X 120mm AºCº SCH80 - R', 2, 6, 17, 0, 0, 0, 1),
(118, 'CA01011', 'NIPLE 1\' AºCº SCH80 x 100mm AºCº SCH80 - R', 2, 6, 0, 2, 1, 0, 1),
(119, 'CA01012', 'NIPLE 1/2\' x 100mm AºCº SCH80 - R', 2, 6, 0, 2, 1, 0, 1),
(120, 'CA01013', 'NIPLE 2 1/2\' X 100mm AºCº SCH80 - R', 2, 6, 7, 2, 1, 0, 1),
(121, 'CA01014', 'NIPLE 2 1/2\' x 120mm AºCº SCH80 - R', 2, 6, 5, 0, 0, 0, 1),
(122, 'CA01015', 'NIPLE 2\' x 100mm AºCº SCH80 - R', 2, 6, 0, 0, 0, 0, 1),
(123, 'CA01016', 'NIPLE 3/4\' x 50mm AºCº SCH80 - R', 2, 6, 0, 2, 0, 0, 1),
(124, 'CA01017', 'CODO RL 90° 1\' AºCº SCH 80 - S', 2, 6, 9, 4, 1, 0, 1),
(125, 'CA01018', 'CODO RL 90° 5\' AºCº SCH 80 - S', 2, 6, 1, 0, 0, 0, 1),
(126, 'CA01019', 'CODO RL 90° 6\' AºCº SCH 80 - S', 2, 6, 1, 0, 0, 0, 1),
(127, 'CA01020', 'CODO RL 90° 4\' AºCº SCH 80 - S', 2, 6, 5, 3, 1, 0, 1),
(128, 'CA01021', 'CODO RL 90° 2 1/2\' AºCº SCH 80 - S', 2, 6, 8, 1, 1, 0, 1),
(129, 'CA01022', 'CODO RL 90° 1/2\' AºCº SCH 80 - S', 2, 6, 0, 3, 1, 0, 1),
(130, 'CA01023', 'CODO RL 90° 2\' AºCº SCH 80 - S', 2, 6, 13, 4, 1, 0, 1),
(131, 'CA01024', 'CODO RL 90° 3\' AºCº SCH 80 - S', 2, 6, 5, 4, 1, 0, 1),
(132, 'CA01025', 'REDUCCION CONCENTRICA 2 1/2\' A 2\' AºCº SCH80 - S', 2, 6, 0, 2, 1, 0, 1),
(133, 'CA01026', 'REDUCCION CONCENTRICA 3\' A 2\' AºCº SCH80 - S', 2, 6, 0, 0, 0, 0, 1),
(134, 'CA01027', 'REDUCCION CONCENTRICA 3\' A 1 1/2\' AºCº SCH80 - S', 2, 6, 0, 0, 0, 0, 1),
(135, 'CA01028', 'REDUCCION CONCENTRICA 2\' A 1\' AºCº SCH80 - S', 2, 6, 2, 0, 0, 0, 1),
(136, 'CA01029', 'REDUCCION CONCENTRICA 4\' A 3\' AºCº SCH80 - S', 2, 6, 0, 0, 0, 0, 1),
(137, 'CA01030', 'TEE 1\' AºCº SCH80 - S', 2, 6, 13, 0, 0, 0, 1),
(138, 'CA01031', 'TEE 2\' AºCº SCH80 - S', 2, 6, 6, 2, 1, 0, 1),
(139, 'CA01032', 'TEE 2 1/2\' AºCº SCH80 - S', 2, 6, 3, 2, 1, 0, 1),
(140, 'CA01033', 'TEE 4\' AºCº SCH80 - S ', 2, 6, 9, 0, 0, 0, 1),
(141, 'CA01034', 'TEE 5\' AºCº SCH80 - S', 2, 6, 2, 0, 0, 0, 1),
(142, 'CA01035', 'TEE 1 1/2\' AºCº SCH80 - S', 2, 6, 10, 2, 1, 0, 1),
(143, 'CA01036', 'TEE 3/4\' AºCº SCH80 - S', 2, 6, 33, 3, 1, 0, 1),
(144, 'CA01037', 'TAPON 1 1/4\' AºCº SCH 80 - S', 2, 6, 0, 0, 0, 0, 1),
(145, 'CA01038', 'CODO RL 45º 1 1/2\' AºCº SCH 80 - S', 2, 6, 0, 0, 0, 0, 1),
(146, 'CA01039', 'CODO RL 45° 1\' AºCº SCH 80 - S', 2, 6, 0, 0, 0, 0, 1),
(147, 'CA01040', 'REDUCCION CONCENTRICA 2\' A 1 1/2\' AºCº SCH 80 - S', 2, 6, 0, 0, 0, 0, 1),
(148, 'CA02001', 'CAÑOS 3/4\' AºCº SCH40', 3, 7, 0, 0, 0, 0, 1),
(149, 'CA02002', 'CAÑOS 1\' AºCº SCH40', 3, 7, 0, 0, 0, 0, 1),
(150, 'CA02003', 'CAÑOS 1 1/2\' AºCº SCH40', 3, 7, 0, 0, 0, 0, 1),
(151, 'CA02004', 'CODO 45º 4\' AºCº SCH40', 2, 7, 0, 0, 0, 0, 1),
(152, 'CA02005', 'CODO 45º 3\' AºCº SCH40', 2, 7, 2, 1, 0, 0, 1),
(153, 'CA02006', 'REDUCCION CONCENTRICA 5\' A 4\' AºCº SCH40 - S', 2, 7, 0, 0, 0, 0, 1),
(154, 'CA02007', 'REDUCCION CONCENTRICA 6\' A 4\' AºCº SCH40 - S', 2, 7, 0, 1, 0, 0, 1),
(155, 'CA02008', 'CUPLA 1\' C/ REDUCCION 1/2\' P/ SOLDAR', 2, 7, 0, 0, 0, 0, 1),
(156, 'CA02009', 'CAÑO FLEXIBLE C/BRIDA FIJA AºCº 300MM 2 1/2 S-150', 2, 7, 0, 0, 0, 0, 1),
(157, 'CA02010', 'AMORTIGUADOR C/BRIDAS 2 X 600mm', 2, 7, 0, 0, 0, 0, 1),
(158, 'CA03001', 'BUJE REDUCCION 1\' A 3/4\' S2000 - R', 2, 8, 0, 5, 1, 0, 1),
(159, 'CA03002', 'BUJE REDUCCION 1/2\' A 1/8\' S2000 - R', 2, 8, 4, 4, 0, 0, 1),
(160, 'CA03003', 'BUJE REDUCCION 3/8\' A 1/4\' S2000 - R', 2, 8, 0, 0, 0, 0, 1),
(161, 'CA03004', 'BUJE REDUCCION  3/8\' A 1/8\' S2000 - R', 2, 8, 2, 5, 0, 0, 1),
(162, 'CA03005', 'BUJE REDUCCION 3/4\' A 1/2\' S2000 - R', 2, 8, 2, 6, 1, 0, 1),
(163, 'CA03006', 'BUJE REDUCCION 1/2\' A 3/8\' S2000 - R', 2, 8, 0, 5, 1, 0, 1),
(164, 'CA03007', 'BUJE REDUCCION 2\' A 1 1/2\' S2000 - R', 2, 8, 0, 4, 1, 0, 1),
(165, 'CA03008', 'BUJE REDUCCION 1 1/2\' A 1\' S2000 - R', 2, 8, 0, 4, 1, 0, 1),
(166, 'CA03009', 'BUJE REDUCCION 1 1/2\' A 1/2\' S2000 - R', 2, 8, 2, 0, 0, 0, 1),
(167, 'CA03010', 'BUJE REDUCCION  1 1/2\' A 3/4\' S2000 - R', 2, 8, 14, 0, 0, 0, 1),
(168, 'CA03011', 'BUJE REDUCCION 1\' A 1/2\' S2000 - R', 2, 8, 12, 4, 1, 0, 1),
(169, 'CA03012', 'BUJE REDUCCION 2\' A 1\' S2000 - R', 2, 8, 0, 2, 1, 0, 1),
(170, 'CA03013', 'CODO 45º 2\' S2000 - S', 2, 8, 0, 0, 0, 0, 1),
(171, 'CA03014', 'CODO 45º 1 1/2\' S2000 - S', 2, 8, 0, 0, 0, 0, 1),
(172, 'CA03015', 'CODO  45º 1 \' S2000 - S', 2, 8, 0, 0, 0, 0, 1),
(173, 'CA03016', 'CODO 90º 1/8\'  S2000 - R ', 2, 8, 6, 0, 0, 0, 1),
(174, 'CA03017', 'CODO 90º 1/2\' S2000 - R ', 2, 8, 9, 4, 1, 0, 1),
(175, 'CA03018', 'CODO 90º  1 1/2\' S2000 - R', 2, 8, 0, 1, 0, 0, 1),
(176, 'CA03019', 'CODO 90º  1\' S2000 - R', 2, 8, 4, 4, 1, 0, 1),
(177, 'CA03020', 'CODO 90º  2\' S2000 - R', 2, 8, 0, 4, 0, 0, 1),
(178, 'CA03021', 'CODO 90º  3/4\' S2000 - R', 2, 8, 5, 4, 1, 0, 1),
(179, 'CA03022', 'CODO 90º 3/4\' S2000 - SOCKET WELD', 2, 8, 6, 10, 1, 0, 1),
(180, 'CA03023', 'CODO 90º 1 1/2\' S2000 - SOCKET WELD', 2, 8, 0, 10, 1, 0, 1),
(181, 'CA03024', 'CODO 90º 1\' S2000 - SOSCKET WELD', 2, 8, 0, 10, 1, 0, 1),
(182, 'CA03025', 'CODO 90º 1/2\' S2000 - S', 2, 8, 0, 6, 0, 0, 1),
(183, 'CA03026', 'CODO 90º 2\' S2000 - SOCKET WELD', 2, 8, 0, 10, 1, 0, 1),
(184, 'CA03027', 'CUPLA 1 1/2\' S2000 - R', 2, 8, 0, 2, 0, 0, 1),
(185, 'CA03028', 'CUPLA 1\'  S2000 - R', 2, 8, 0, 4, 1, 0, 1),
(186, 'CA03029', 'CUPLA 1/2\' S2000 - R', 2, 8, 0, 4, 1, 0, 1),
(187, 'CA03030', 'CUPLA 1/4\' S2000 - R', 2, 8, 0, 0, 0, 0, 1),
(188, 'CA03031', 'CUPLA 2\' S2000 - R', 2, 8, 3, 2, 0, 0, 1),
(189, 'CA03032', 'CUPLA 3/4\' S2000 - R', 2, 8, 9, 4, 1, 0, 1),
(190, 'CA03033', 'CUPLA 1 1/2\' S2000 - S', 2, 8, 19, 4, 0, 0, 1),
(191, 'CA03034', 'CUPLA 1\' S2000 - SOOCKET WELD', 2, 8, 0, 10, 1, 0, 1),
(192, 'CA03035', 'CUPLA 1/2\' S2000 - SOCKET WEKD', 2, 8, 6, 10, 1, 0, 1),
(193, 'CA03036', 'CUPLA 2\' S2000 - SOCKET WELD', 2, 8, 9, 10, 0, 0, 1),
(194, 'CA03037', 'CUPLA 3/4\' S2000 - SOCKET WELD', 2, 8, 0, 10, 1, 0, 1),
(195, 'CA03038', 'ENTREROSCA 1 1/2\' S2000', 2, 8, 0, 2, 0, 0, 1),
(196, 'CA03039', 'ENTREROSCA 1\' S2000', 2, 8, 0, 4, 1, 0, 1),
(197, 'CA03040', 'ENTREROSCA 1/2\' S2000', 2, 8, 0, 6, 1, 0, 1),
(198, 'CA03041', 'ENTREROSCA 1/8\' S2000', 2, 8, 0, 4, 0, 0, 1),
(199, 'CA03042', 'ENTREROSCA 3/4\' S2000', 2, 8, 0, 5, 1, 0, 1),
(200, 'CA03043', 'ENTREROSCA 3/8\' S2000', 2, 8, 2, 3, 0, 0, 1),
(201, 'CA03044', 'MEDIA CUPLA  ROSCADA   C/ REDUCCION 1 A 3/4\' S2000', 2, 8, 0, 0, 0, 0, 1),
(202, 'CA03045', 'MEDIA CUPLA  ROSCADA 2\' S2000', 2, 8, 1, 0, 0, 0, 1),
(203, 'CA03046', 'ENTREROSCA 2\' S2000', 2, 8, 0, 0, 0, 0, 1),
(204, 'CA03047', 'TAPA 1\' S2000', 2, 8, 0, 4, 0, 0, 1),
(205, 'CA03048', 'TAPA 1/2\' S2000', 2, 8, 2, 4, 0, 0, 1),
(206, 'CA03049', 'TAPON 1 1/2\' S2000', 2, 8, 1, 2, 1, 0, 1),
(207, 'CA03050', 'TAPON 1\' S2000', 2, 8, 11, 4, 1, 0, 1),
(208, 'CA03051', 'TAPON 1/2\' S2000', 2, 8, 0, 6, 1, 0, 1),
(209, 'CA03052', 'TAPON 3/4\' S2000', 2, 8, 2, 4, 1, 0, 1),
(210, 'CA03053', 'TAPON 3/8\' S2000', 2, 8, 0, 2, 0, 0, 1),
(211, 'CA03054', 'TAPON 1/4\' S2000', 2, 8, 0, 0, 0, 0, 1),
(212, 'CA03055', 'TEE 1/2\' S2000 - S', 2, 8, 35, 4, 0, 0, 1),
(213, 'CA03056', 'TEE 3/4\' S2000 - SOCKET WELD', 2, 8, 20, 4, 1, 0, 1),
(214, 'CA03057', 'TEE  CON REDUCCION 3/4\'A 1/2\' S2000 - S', 2, 8, 13, 0, 0, 0, 1),
(215, 'CA03058', 'TEE  3/4\' S2000 - R', 2, 8, 1, 4, 1, 0, 1),
(216, 'CA03059', 'TEE 1\' S2000 - SOCKET WELD', 2, 8, 12, 4, 1, 0, 1),
(217, 'CA03060', 'TEE 1 1/2\' S2000 - SOCKET WELD', 2, 8, 0, 4, 1, 0, 1),
(218, 'CA03061', 'TEE 2\' S2000 - SOCKET WELD', 2, 8, 0, 4, 1, 0, 1),
(219, 'CA03062', 'TEE 1 1/2\' S2000 - R', 2, 8, 4, 4, 0, 0, 1),
(220, 'CA03063', 'TEE 1\' S2000 - R', 2, 8, 4, 4, 1, 0, 1),
(221, 'CA03064', 'TEE 1/2\' S2000 - R', 2, 8, 0, 0, 0, 0, 1),
(222, 'CA03065', 'UNION DOBLE 1/4\' S2000 - R', 2, 8, 2, 0, 0, 0, 1),
(223, 'CA03066', 'UNION DOBLE 1\' S2000 - R', 2, 8, 0, 4, 1, 0, 1),
(224, 'CA03067', 'UNION DOBLE 1/2\' S2000 - R', 2, 8, 0, 4, 1, 0, 1),
(225, 'CA03068', 'UNION DOBLE 3/4\' S2000 - R', 2, 8, 0, 4, 1, 0, 1),
(226, 'CA03069', 'UNION DOBLE 1 1/2 \' S2000 - R', 2, 8, 0, 2, 1, 0, 1),
(227, 'CA03070', 'UNION DOBLE 2\' S2000 - R', 2, 8, 0, 2, 1, 0, 1),
(228, 'CA03071', 'NIPLE S-2000 2\' X 60MM ', 2, 8, 0, 0, 0, 0, 1),
(229, 'CA03072', 'TAPA 3/4\' S2000', 2, 8, 5, 4, 0, 0, 1),
(230, 'CA03073', 'TEE CON REDUCCION 1 1/4\' A 3/4\' S-2000 - S', 2, 8, 0, 0, 0, 0, 1),
(231, 'CA03074', 'TEE 2\' S2000 - R', 2, 8, 1, 2, 0, 0, 1),
(232, 'CA03075', 'NIPLES 1/2\' X 100 mm S2000 - R', 2, 8, 0, 0, 0, 0, 1),
(233, 'CA03076', 'NIPLES 3/4\' X 40mm S2000 - R', 2, 8, 0, 0, 0, 0, 1),
(234, 'CA03077', 'NIPLES 1\' X 100 mm S2000 - R', 2, 8, 0, 0, 0, 0, 1),
(235, 'CA03078', 'NIPLES 1 1/2\' X 100 mm S2000 - R', 2, 8, 0, 0, 0, 0, 1),
(236, 'CA03079', 'NIPLES 2\' X 100 mm S2000 - R', 2, 8, 0, 0, 0, 0, 1),
(237, 'CA03080', 'NIPLES 2 1/2\' X 100 mm S2000 - R', 2, 8, 0, 0, 0, 0, 1),
(238, 'CA03081', 'NIPLES 3\' X 100 mm S2000 - R', 2, 8, 0, 0, 0, 0, 1),
(239, 'CA03082', 'MEDIA CUPLA CON REDUCCION 2\' A 1/2\' - S', 2, 8, 0, 0, 0, 0, 1),
(240, 'CA03083', 'CUPLA S2000 3/8\' - R', 2, 8, 0, 0, 0, 0, 1),
(241, 'CA04001', 'CUPLA  2\' GALV - R', 2, 9, 4, 0, 0, 0, 1),
(242, 'CA04002', 'CUPLA  1 \' GALV - R', 2, 9, 0, 0, 0, 0, 1),
(243, 'CA04003', 'REDUCCION GALVANIZADO 1 1/2\' A 1/2', 2, 9, 1, 0, 0, 0, 1),
(244, 'CA04004', 'TAPON 3/8', 2, 9, 0, 0, 0, 0, 1),
(245, 'CA04005', 'CURVA LARGA 3/8\' GALV - R', 2, 9, 4, 0, 0, 0, 1),
(246, 'CA04006', 'TEE 1\' GALV - R', 2, 9, 19, 0, 0, 0, 1),
(247, 'CA04007', 'TEE 1 1/4\' GALV - R', 2, 9, 1, 0, 0, 0, 1),
(248, 'CA04008', 'CODO GALVANIZADO DE 1\' 90º HH', 2, 9, 0, 0, 0, 0, 1),
(249, 'CA04009', 'UNION DOBLE GALVANIZADO  1\'', 2, 9, 5, 0, 0, 0, 1),
(250, 'CA04010', 'REDUCCION GALVANIZADO 1 1/2\' A 3/4\' GALV - R', 2, 9, 10, 0, 0, 0, 1),
(251, 'CA04011', 'NIPLE  1 1/4\' X 100mm GALV - R', 2, 9, 0, 0, 0, 0, 1),
(252, 'CA04012', 'TAPA 3/4 GALV', 2, 9, 0, 0, 0, 0, 1),
(253, 'CA04013', 'NIPLE 2 1/2\' x 150mm GALV - R', 2, 9, 2, 0, 0, 0, 1),
(254, 'CA04014', 'CODO 1 1/4\'GALV', 2, 9, 0, 0, 0, 0, 1),
(255, 'CA04015', 'UNION DOBLE GALVANIZADO 1 1/4\' ', 2, 9, 0, 0, 0, 0, 1),
(256, 'CA04016', 'TAPON 1\' GALV - R', 2, 9, 1, 10, 0, 0, 1),
(257, 'CA04017', 'CURVA 1\' GALV. - 45º HH', 2, 9, 0, 0, 0, 0, 1),
(258, 'CA04018', 'UNION DOBLE GALVANIZADO 3/4\' - R', 2, 9, 5, 5, 0, 0, 1),
(259, 'CA04019', 'UNION DOBLE GALVANIZADO 1/2\' - R', 2, 9, 0, 2, 0, 0, 1),
(260, 'CA04020', 'UNION DOBLE GALVANIZADO 1 1/2\' - R', 2, 9, 1, 0, 0, 0, 1),
(261, 'CA04021', 'REDUCCION GALVANIZADO 2\' a 3/4\'', 2, 9, 4, 4, 0, 0, 1),
(262, 'CA04022', 'REDUCCION GALVANIZADO 1 1/2\' a 1\'', 2, 9, 2, 2, 0, 0, 1),
(263, 'CA04023', 'REDUCCION GALVANIZADO 3/4\' a 1/2\'', 2, 9, 0, 0, 0, 0, 1),
(264, 'CA04024', 'TAPON GALVANIZADO 3/4\'', 2, 9, 0, 2, 0, 0, 1),
(265, 'CA04025', 'ENTRE ROSCA GALVANIZADO 1\'', 2, 9, 0, 2, 0, 0, 1),
(266, 'CA05001', 'BRIDA 2\' AC INOX 304 L A182 150LD', 2, 10, 1, 1, 0, 0, 1),
(267, 'CA05002', 'TAPON AC.INOX  316 3/4 - R', 2, 10, 5, 1, 0, 0, 1),
(268, 'CA05003', 'CODO 90º  1 1/2\' AC INOX 316 - R', 2, 10, 1, 2, 0, 0, 1),
(269, 'CA05004', 'CODO 90º 1\' AC INOX 316 - R ', 2, 10, 0, 2, 0, 0, 1),
(270, 'CA05005', 'CODO 1 1/2\' AC INOX 316 - S', 2, 10, 0, 2, 0, 0, 1),
(271, 'CA05006', 'ENTREROSCA 1/4\' AC INOX 316 ', 2, 10, 0, 2, 0, 0, 1),
(272, 'CA05007', 'ENTREROSCA 3/8\' AC INOX 316', 2, 10, 0, 0, 0, 0, 1),
(273, 'CA05008', 'ENTREROSCA 1/2\'AC INOX 316', 2, 10, 0, 2, 0, 0, 1),
(274, 'CA05009', 'ENTREROSCA AC INOX 3/4\'', 2, 10, 0, 0, 0, 0, 1),
(275, 'CA05010', 'UNION DOBLE 1\' ACERO INOXIDABLE 316', 2, 10, 0, 0, 0, 0, 1),
(276, 'CA05011', 'NIPLE  1\' X 100mm AC INOX 316', 2, 10, 0, 3, 0, 0, 1),
(277, 'CA05012', 'NIPLE  1 1/2\' X 80mm AC INOX 316', 2, 10, 0, 2, 0, 0, 1),
(278, 'CA05013', 'FILTRO Y 3/4\' AC INOX 316 - R', 2, 10, 0, 0, 0, 0, 1),
(279, 'CA05014', 'TAPON 3/8\' AC INOX 316', 2, 10, 0, 0, 0, 0, 1),
(280, 'CA05015', 'TEE 1\' AC INOX 316 - R', 2, 10, 0, 4, 0, 0, 1),
(281, 'CA05016', 'REDUC CONCENTRICA  1 1/4\' X 1/2\' AC INOX 316 - R', 2, 10, 2, 0, 0, 0, 1),
(282, 'CA05017', 'BUJE DE REDUCCION 1/2\' A 3/8\' AC INOX 316 - R', 2, 10, 0, 3, 0, 0, 1),
(283, 'CA05018', 'CUPLA C/ REDUCCION 1/4 A 1/8', 2, 10, 1, 1, 0, 0, 1),
(284, 'CA05019', 'VALVULA RETENCION 3/4\' AC INOX 304', 2, 10, 1, 1, 0, 0, 1),
(285, 'CA05020', 'VALVULA RETENCION 1\' AC INOX 304', 2, 10, 0, 0, 0, 0, 1),
(286, 'CA05021', 'ENTREROSCA 1\' AC INOX 316', 2, 10, 0, 2, 0, 0, 1),
(287, 'CA05022', 'CURVA 90º AC.INOX  1/2\' - S', 2, 10, 11, 2, 0, 0, 1),
(288, 'CA05023', 'TAPON 1/4\' AC INOX 304', 2, 10, 0, 0, 0, 0, 1),
(289, 'CA05024', 'CODO 90º 1/2\' AC INOX 316 - R', 2, 10, 0, 0, 0, 0, 1),
(290, 'CA05025', 'TEE 3/4\' AC INOX 316 - S', 2, 10, 2, 0, 0, 0, 1),
(291, 'CA05026', 'TEE 1/2\' AC INOX 316 - R', 2, 10, 0, 2, 0, 0, 1),
(292, 'CA05027', 'REDUCCION AC INOX 316 - 3/4\' a 1/2\'', 2, 10, 0, 0, 0, 0, 1),
(293, 'CA05028', 'UNION DOBLE 3/8\'', 2, 10, 0, 0, 0, 0, 1),
(294, 'CA05029', 'CODO 90º 3/4\' AC INOX 316 - R', 2, 10, 0, 0, 0, 0, 1),
(295, 'CA05030', 'TEE 3/4\' AC INOX 316 - R', 2, 10, 0, 0, 0, 0, 1),
(296, 'CA05031', 'UNION DOBLE AC INOX 316 - 1/2\' - R', 2, 10, 0, 2, 0, 0, 1),
(297, 'CA05032', 'BUJE REDUCCION 1/2\' A 1/4\' AC INOX 316', 2, 10, 0, 4, 0, 0, 1),
(298, 'CA05033', 'NIPLE 1/2\' x 100mm AC INOX 316 - R', 2, 10, 0, 0, 0, 0, 1),
(299, 'CA05034', 'CODO AC.INOX 26,6X3', 2, 10, 6, 1, 0, 0, 1),
(300, 'CA05035', 'TEE 1/2\' AC INOX 316 - S', 2, 10, 12, 2, 0, 0, 1),
(301, 'CA05036', 'ENTREROSCA 1/8\' AC INOX 316', 2, 10, 2, 0, 0, 0, 1),
(302, 'CA05037', 'CAÑO FLEXIBLE 300MM C/TERMINLES 1\' INOX MF-MF-A-C', 2, 10, 2, 1, 1, 0, 1),
(303, 'CA05038', 'CAÑO FLEXIBLE 300MM C/TERMINL 3/4\' INOX MF-MF-A-C', 2, 10, 1, 1, 0, 0, 1),
(304, 'CA05039', 'CAÑO FLEXIBLE C/BRIDA MALLA INOX 500MM 2\' ', 2, 10, 0, 0, 0, 0, 1),
(305, 'CA05040', 'UNION DOBLE AC INOX 316 - 3/4\' - R', 2, 10, 0, 2, 0, 0, 1),
(306, 'CA05041', 'CUPLA AC INOX 316 - 1/2\' - R', 2, 10, 0, 2, 0, 3, 1),
(307, 'CA05042', 'CUPLA AC INOX 316 - 3/4\' - R', 2, 10, 4, 2, 0, 4, 1),
(308, 'CA05043', 'CUPLA AC INOX 316 - 1\' - R', 2, 10, 5, 2, 0, 7, 1),
(309, 'CA05044', 'CUPLA AC INOX 316 - 1 1/2\' - R', 2, 10, 4, 2, 0, 12, 1),
(310, 'CA05045', 'TUBO SIN COSTURA 304  26,60 X 3,91 L', 3, 10, 12, 12, 1, 33, 1),
(311, 'CA05046', 'TUBO SIN COSTURA 316  33,40 X 4,55', 3, 10, 6, 6, 1, 68, 1),
(312, 'CA05047', 'TUBO SIN COSTURA 316  48,30 X 5,08 L', 3, 10, 6, 6, 1, 114, 1),
(313, 'CA05048', 'TUBO SIN COSTURA 316  1/2', 3, 10, 18, 18, 1, 35, 1),
(314, 'CA05049', 'UNION DOBLE AC INOX 1 1/\'2\' - R', 2, 10, 9, 1, 0, 0, 1),
(315, 'CA05050', 'CUPLA AC INOX 316 - 1/4\' - R', 2, 10, 5, 1, 0, 0, 1),
(316, 'CA05051', 'CODO 1/2\' AC INOX 316 - S', 2, 10, 0, 1, 0, 0, 1),
(317, 'CA05052', 'REDUCCION 4\' X 2 1/2\' - S', 2, 10, 1, 0, 0, 0, 1),
(318, 'CA05053', 'CODO 90°1/4\' - R', 2, 10, 8, 1, 0, 0, 1),
(319, 'CA06001', 'CAÑO PVC 110 TIGRE CLOACAL X  MTS', 2, 11, 0, 0, 0, 0, 1),
(320, 'CA06002', 'BRIDA PVC 1 1/2\' ', 2, 11, 3, 0, 0, 0, 0),
(321, 'CA06003', 'BRIDA PVC 1\' ', 2, 11, 0, 0, 0, 0, 0),
(322, 'CA06004', 'BRIDA PVC 1/2\' ', 2, 11, 0, 0, 0, 0, 0),
(323, 'CA06005', 'BRIDA PVC 3/4\' ', 2, 11, 0, 0, 0, 0, 0),
(324, 'CA06006', 'CABEZA LARGA ESTÁNDAR ESTRIA FINA 1/2\'', 2, 11, 2, 0, 0, 0, 0),
(325, 'CA06007', 'CODO PVC 90º 110', 2, 11, 0, 0, 0, 0, 0),
(326, 'CA06008', 'CODO PVC 90º  40', 2, 11, 1, 0, 0, 0, 0),
(327, 'CA06009', 'CURVA PVC 3\'', 2, 11, 6, 0, 0, 0, 0),
(328, 'CA06010', 'CURVAS PVC 45º  110 A', 2, 11, 0, 0, 0, 0, 0),
(329, 'CA06011', 'ENTREROSCA PVC 3\'', 2, 11, 5, 0, 0, 0, 0),
(330, 'CA06012', 'ESPIGA ROSCA 11/4\' (RACOR)', 2, 11, 1, 0, 0, 0, 0),
(331, 'CA06013', 'FLOTANTE PARA MOCHILA DE INODORO', 2, 11, 0, 0, 0, 0, 0),
(332, 'CA06014', 'LLAVE MARIPOSA NEGRA P/AGUA FRIA', 2, 11, 0, 0, 0, 0, 0),
(333, 'CA06015', 'LLUVIA  ARTICULADA PLASTICA SIN CAÑO PARA DUCHAS ', 2, 11, 0, 0, 0, 0, 0),
(334, 'CA06016', 'LLUVIA PARA LAVAOJOS PVC ', 2, 11, 0, 0, 0, 0, 0),
(335, 'CA06017', 'NIPLE PVC 3\' X 150', 2, 11, 0, 0, 0, 0, 0),
(336, 'CA06018', 'RAMAL \'Y\'  PVC 63º X 45º', 2, 11, 2, 0, 0, 0, 0),
(337, 'CA06019', 'RAMAL \'Y\' PVC 110 A 63º', 2, 11, 1, 0, 0, 0, 0),
(338, 'CA06020', 'RAMAL \'Y\' PVC 110º 45 º PVC', 2, 11, 1, 0, 0, 0, 0),
(339, 'CA06021', 'REDUCCION PVC 110º A 90º', 2, 11, 1, 0, 0, 0, 0),
(340, 'CA06022', 'REDUCCION PVC 45º', 2, 11, 0, 0, 0, 0, 0),
(341, 'CA06023', 'SOMBRERO  PVC 110', 2, 11, 1, 0, 0, 0, 0),
(342, 'CA06024', 'TAPA PLASTICA C/BOTON PARA MOCHILA INODORO', 2, 11, 2, 0, 0, 0, 0),
(343, 'CA06025', 'TAPA PVC 110', 2, 11, 0, 0, 0, 0, 0),
(344, 'CA06026', 'TAPA PVC 160', 2, 11, 4, 0, 0, 0, 0),
(345, 'CA06027', 'TEE PVC 2 1/2\' ROSCADA', 2, 11, 2, 0, 0, 0, 0),
(346, 'CA06028', 'TEE PVC 4\' 110 ROSCADA', 2, 11, 1, 0, 0, 0, 0),
(347, 'CA06029', 'BALL CHECK VALVE 40 m/m 1 1/2\'', 2, 11, 0, 0, 0, 0, 0),
(348, 'CA06030', 'CUPLA ROSCADA PVC 3\'', 2, 11, 1, 0, 0, 0, 0),
(349, 'CA06031', 'FLEXIBLE 1/2\' X 50 CM', 2, 11, 1, 0, 0, 0, 0),
(350, 'CA06032', 'REJILLA PLASTICA', 2, 11, 0, 0, 0, 0, 1),
(351, 'CA06033', 'BARRA PVC DIAMETRO 2000mm X METRO', 2, 11, 0, 0, 0, 1780, 0),
(352, 'CA06034', 'CURVA ENCASTRE 3\'', 2, 11, 0, 0, 0, 0, 0),
(353, 'CA06035', 'REDUCCION PVC 160 A 110', 2, 11, 0, 0, 0, 0, 0),
(354, 'CA06036', 'GOMA P/CONEXIÓN INODORO', 2, 11, 0, 0, 0, 0, 1),
(355, 'CA06037', 'APORTE PVC X MTS (GRIS) ', 2, 11, 19, 0, 0, 0, 1),
(356, 'CA06038', 'APORTE POLIPROPILENO Ø 4 mm', 3, 11, 0, 0, 0, 0, 1),
(357, 'CA06039', 'BARRA PVC DIAMETRO 30mm X METRO', 2, 11, 0, 0, 0, 0, 1),
(358, 'CA06040', 'BARRA PVC DIAMETRO 40mm X METRO', 2, 11, 0, 0, 0, 0, 1),
(359, 'CA07001', 'ESPIGA ROSCA MACHO POLIETILENO 1/2\'  (RACOR)', 2, 12, 0, 5, 0, 0, 1),
(360, 'CA07002', 'ESPIGA ROSCA MACHO POLIETILENO 3/4\' ( RACOR)', 2, 12, 0, 1, 0, 0, 1),
(361, 'CA07003', 'ESPIGA ROSCA MACHO POLIETILENO 1\' (RACOR)', 2, 12, 0, 3, 0, 0, 1),
(362, 'CA07004', 'ESPIGA ROSCA MACHO POLIETILENO 1 1/2\' (RACOR)', 2, 12, 0, 3, 0, 0, 1),
(363, 'CA07005', 'ESPIGA ROSCA POLIETILENO 2\' (RACOR)', 2, 12, 2, 1, 0, 0, 1),
(364, 'CA07006', 'ESPIGA - ESPIGA MANGUERA 1/2\'', 2, 12, 7, 3, 0, 0, 1),
(365, 'CA07007', 'ESPIGA - ESPIGA MANGUERA 3/4\'', 2, 12, 0, 3, 0, 0, 1),
(366, 'CA07008', 'ESPIGA - ESPIGA MANGUERA 1\'', 2, 12, 0, 3, 0, 0, 1),
(367, 'CA07009', 'ESPIGA - ESPIGA  MANGUERA  1 1/2\'', 2, 12, 10, 1, 0, 0, 1),
(368, 'CA07010', 'ESPIGA - ESPIGA  MANGUERA 2\'', 2, 12, 7, 0, 0, 0, 1),
(369, 'CA07011', 'APORTE DE POLIETILENO Ø 4 mm ', 3, 12, 163, 0, 0, 0, 1),
(370, 'CA07012', 'ESPIGA - ESPIGA  CODO 3/4\'', 2, 12, 1, 0, 0, 0, 1),
(371, 'CA07013', 'ESPIGA - ESPIGA  T 1\'', 2, 12, 1, 0, 0, 0, 1),
(372, 'CA08001', 'BARRA POLIPROPILENO DIAMETRO 40mm X METRO', 2, 13, 0, 0, 0, 0, 1),
(373, 'CA08002', 'BARRA POLIPROPILENO DIAMETRO 110mm X METRO', 2, 13, 0, 0, 0, 0, 1),
(374, 'CA08003', 'BARRA POLIPROPILENO DIAMETRO 200mm X METRO', 2, 13, 1, 0, 0, 1, 1),
(375, 'CA08004', 'BARRA POLIPROPILENO DIAMETRO 90mm X METRO', 2, 13, 5, 0, 0, 0, 1),
(376, 'CA08005', 'BARRA POLIPROPILENO DIAMETRO 130mm X METRO', 2, 13, 2, 0, 0, 0, 1),
(377, 'CA08006', 'APORTE POLIPROPILENO X MTS (BEIGE)', 3, 13, 39, 5, 0, 0, 1),
(378, 'CA08007', 'CODO 90º PP 1/2\'', 2, 13, 0, 10, 0, 0, 1),
(379, 'CA08008', 'CODO 45º PP 1/2\'', 2, 13, 0, 0, 0, 0, 0),
(380, 'CA08009', 'CODO 90º PP 3/4\'', 2, 13, 0, 8, 0, 0, 1),
(381, 'CA08010', 'CODO 90º PP 1\'', 2, 13, 0, 8, 0, 0, 1),
(382, 'CA08011', 'CODO 45º PP 1\'', 2, 13, 7, 5, 0, 0, 1),
(383, 'CA08012', 'CODO 90º PP 1 1/4\'', 2, 13, 0, 0, 0, 0, 1),
(384, 'CA08013', 'CODO 90º PP 1 1/2\'', 2, 13, 0, 6, 0, 0, 1),
(385, 'CA08014', 'CODO 45º PP 1 1/2\'', 2, 13, 0, 0, 0, 0, 1),
(386, 'CA08015', 'CODO 90º PP  2\'', 2, 13, 6, 6, 0, 2, 1),
(387, 'CA08016', 'CODO 90º PP  2 1/2\'', 2, 13, 0, 0, 0, 0, 1),
(388, 'CA08017', 'CODO 45º PP 3/4\'', 2, 13, 0, 0, 0, 0, 0),
(389, 'CA08018', 'CUPLA PP 1/2\'', 2, 13, 0, 5, 0, 0, 1),
(390, 'CA08019', 'CUPLA PP  3/4\'', 2, 13, 13, 5, 0, 0, 1),
(391, 'CA08020', 'CUPLA PP 1\'', 2, 13, 0, 5, 0, 0, 1),
(392, 'CA08021', 'CUPLA PP 1 1/4\'', 2, 13, 0, 0, 0, 0, 1),
(393, 'CA08022', 'CUPLA PP  1 1/2\'', 2, 13, 25, 5, 0, 0, 1),
(394, 'CA08023', 'CUPLA PP 2\'', 2, 13, 0, 5, 0, 1, 1),
(395, 'CA08024', 'CUPLA PP  2 1/2\'', 2, 13, 0, 0, 0, 0, 1),
(396, 'CA08025', 'CURVA PP 2\'', 2, 13, 0, 0, 0, 0, 1),
(397, 'CA08026', 'TEE PP 1/2\'', 2, 13, 6, 5, 0, 0, 1),
(398, 'CA08027', 'TEE PP 3/4\'', 2, 13, 9, 5, 0, 0, 1),
(399, 'CA08028', 'TEE PP 1\'', 2, 13, 12, 5, 0, 0, 1),
(400, 'CA08029', 'TEE PP 1 1/4\'', 2, 13, 0, 0, 0, 0, 1),
(401, 'CA08030', 'TEE PP 1 1/2\'', 2, 13, 3, 5, 0, 1, 1),
(402, 'CA08031', 'TEE PP 2\'', 2, 13, 6, 5, 0, 3, 1),
(403, 'CA08032', 'UNION DOBLE PP TIGRE  1/2\'', 2, 13, 14, 6, 0, 0, 1),
(404, 'CA08033', 'UNION DOBLE PP TIGRE 3/4\'', 2, 13, 0, 6, 0, 1, 1),
(405, 'CA08034', 'UNION DOBLE PP TIGRE 1\'', 2, 13, 0, 6, 0, 0, 1),
(406, 'CA08035', 'UNION DOBLE PP TIGRE  1 1/4\'', 2, 13, 1, 0, 0, 0, 1),
(407, 'CA08036', 'UNION DOBLE PP TIGRE 1 1/2\'', 2, 13, 0, 6, 0, 4, 1),
(408, 'CA08037', 'UNION DOBLE PP TIGRE 2\'', 2, 13, 0, 0, 0, 7, 1),
(409, 'CA08038', 'TAPON PP 1/2\'', 2, 13, 0, 0, 0, 0, 1),
(410, 'CA08039', 'TAPON PP 3/4\'', 2, 13, 0, 0, 0, 0, 1),
(411, 'CA08040', 'TAPON PP 1\'', 2, 13, 0, 0, 0, 0, 1),
(412, 'CA08041', 'TAPON PP 1 1/4\'', 2, 13, 0, 0, 0, 0, 1),
(413, 'CA08042', 'TAPON PP 1 1/2\'', 2, 13, 0, 0, 0, 0, 1),
(414, 'CA08043', 'TAPON PP 2\'', 2, 13, 0, 0, 0, 0, 1),
(415, 'CA08044', 'TAPA PP 1/2\'', 2, 13, 21, 0, 0, 0, 1),
(416, 'CA08045', 'TAPA PP 3/4\'', 2, 13, 62, 0, 0, 0, 1),
(417, 'CA08046', 'TAPA PP 1\'', 2, 13, 23, 0, 0, 0, 1),
(418, 'CA08047', 'TAPA PP 1 1/4\'', 2, 13, 0, 0, 0, 0, 1),
(419, 'CA08048', 'TAPA PP  1 1/2\'', 2, 13, 2, 0, 0, 0, 1),
(420, 'CA08049', 'TAPA PP 2\'', 2, 13, 0, 0, 0, 1, 1),
(421, 'CA08050', 'CONEXIÓN TANQUE PP 1/2\'', 2, 13, 0, 0, 0, 1, 1),
(422, 'CA08051', 'CONEXIÓN TANQUE PP 3/4\'', 2, 13, 4, 0, 0, 1, 1),
(423, 'CA08052', 'CONEXIÓN TANQUE PP 1\'', 2, 13, 4, 0, 0, 2, 1),
(424, 'CA08053', 'CONEXIÓN TANQUE PP 1 1/2\'', 2, 13, 0, 0, 0, 2, 1),
(425, 'CA08054', 'CONEXIÓN TANQUE PP  2\'', 2, 13, 0, 0, 0, 0, 1),
(426, 'CA08055', 'NIPLE PP X 60 mm  1/2\'', 2, 13, 0, 0, 0, 0, 1),
(427, 'CA08056', 'NIPLE PP X 100 mm 1/2\' ', 2, 13, 0, 0, 0, 0, 1),
(428, 'CA08057', 'NIPLE PP X 60 mm 3/4\' ', 2, 13, 0, 0, 0, 0, 1),
(429, 'CA08058', 'NIPLE PP X 100 mm 3/4\'', 2, 13, 0, 0, 0, 0, 1),
(430, 'CA08059', 'NIPLE PP X 60 mm 1\' ', 2, 13, 0, 0, 0, 0, 1),
(431, 'CA08060', 'NIPLE PP X 100 mm 1\' ', 2, 13, 0, 0, 0, 0, 1),
(432, 'CA08061', 'NIPLE PP X 60 mm 1 1/4\'', 2, 13, 0, 0, 0, 0, 1),
(433, 'CA08062', 'NIPLE PP X 100 mm  1 1/4\' ', 2, 13, 0, 0, 0, 0, 1),
(434, 'CA08063', 'NIPLE PP X 60 mm  1 1/2\'', 2, 13, 0, 0, 0, 0, 1),
(435, 'CA08064', 'NIPLE PP X 100 mm 1 1/2\' ', 2, 13, 0, 0, 0, 1, 1),
(436, 'CA08065', 'NIPLE PP X 60 mm  2\' ', 2, 13, 0, 0, 0, 0, 1),
(437, 'CA08066', 'NIPLE PP X 100 mm 2\' ', 2, 13, 0, 0, 0, 1, 1),
(438, 'CA08067', 'REDUCCION PP 2\' A 1 1/2\'', 2, 13, 4, 0, 0, 0, 1),
(439, 'CA08068', 'REDUCCION PP  3/4\' A 1/2\'', 2, 13, 0, 10, 0, 0, 1),
(440, 'CA08069', 'REDUCCION PP 1\' A 1/2\'', 2, 13, 0, 10, 0, 0, 1),
(441, 'CA08070', 'REDUCCION PP  1\' A 3/4\'', 2, 13, 0, 10, 0, 0, 1),
(442, 'CA08071', 'REDUCCION PP  1 1/4\' A 3/4\'', 2, 13, 0, 0, 0, 0, 1),
(443, 'CA08072', 'REDUCCION PP 1 1/4\' A 1\'', 2, 13, 0, 1, 0, 0, 1),
(444, 'CA08073', 'REDUCCION PP   1 1/2\' A 1 1/4\'', 2, 13, 0, 1, 0, 0, 1),
(445, 'CA08074', 'REDUCCION PP 1 1/2\' A 1/2\'', 2, 13, 0, 2, 0, 0, 1),
(446, 'CA08075', 'REDUCCION PP 1 1/2\' A 3/4\'', 2, 13, 3, 6, 0, 0, 1),
(447, 'CA08076', 'REDUCCION PP 1 1/2\' A 1\'', 2, 13, 6, 6, 0, 0, 1),
(448, 'CA08077', 'REDUCCION PP 2\' A 1\'', 2, 13, 0, 3, 0, 0, 1),
(449, 'CA08078', 'REDUCCION PP  2\' A 1/2\'', 2, 13, 0, 5, 0, 0, 1),
(450, 'CA08079', 'REDUCCION PP  2 1/2\' A 2\'', 2, 13, 0, 0, 0, 0, 1),
(451, 'CA08080', 'BRIDA PP 1/2\'', 2, 13, 0, 1, 0, 0, 1),
(452, 'CA08081', 'BRIDA PP 3/4\'', 2, 13, 0, 2, 0, 0, 1),
(453, 'CA08082', 'BRIDA PP 1\'', 2, 13, 0, 2, 0, 0, 1),
(454, 'CA08083', 'BRIDA PP  1 1/2\'', 2, 13, 3, 2, 0, 0, 1),
(455, 'CA08084', 'BRIDA PP 2\'', 2, 13, 6, 4, 0, 0, 1),
(456, 'CA08085', 'BRIDA PP 3\' - ROSCADA', 2, 13, 2, 0, 0, 0, 1),
(457, 'CA08086', 'CAÑO TRICAPA IPS O SIMILAR CALIDAD PPX 6 MTS 3/4\'', 2, 13, 0, 0, 0, 0, 1),
(458, 'CA08087', 'CAÑO TRICAPA IPS O SIMILAR CALIDAD PPX 6 MTS 1\'', 2, 13, 0, 0, 0, 0, 1),
(459, 'CA08088', 'CAÑO TRICAPA  PP X 6 MTS 1 1/2\'', 2, 13, 0, 0, 0, 0, 1),
(460, 'CA08089', 'CAÑO TRICAPA IPS O SIMILAR CALIDAD PPX 6 MTS 2\'', 2, 13, 0, 0, 0, 0, 1),
(461, 'CA08090', 'ENTREROSCA PP 1/2\'', 2, 13, 1, 6, 0, 0, 1),
(462, 'CA08091', 'ENTREROSCA PP 3/4\'', 2, 13, 1, 6, 0, 0, 1),
(463, 'CA08092', 'ENTREROSCA PP 1\'', 2, 13, 0, 6, 0, 0, 1),
(464, 'CA08093', 'ENTREROSCA PP 1 1/2\'', 2, 13, 0, 4, 0, 0, 1),
(465, 'CA08094', 'ENTREROSCA PP 2\'', 2, 13, 4, 4, 0, 0, 1),
(466, 'CA08095', 'ENTREROSCA PP 2 1/2\'', 2, 13, 4, 4, 0, 0, 1),
(467, 'CA08096', 'BRIDA PVC 2\'', 2, 13, 2, 0, 0, 0, 1),
(468, 'CA08097', 'ENTREROSCA PP  1 1/4\'', 2, 13, 0, 0, 0, 0, 1),
(469, 'CA08098', 'ENTREROSCA PP 3\'', 2, 13, 0, 0, 0, 0, 1),
(470, 'CA08099', 'CODO 45º PP 2\'', 2, 13, 1, 0, 0, 0, 1),
(471, 'CA08100', 'CODO 45º PP 1 1/4\'', 2, 13, 4, 0, 0, 0, 1),
(472, 'CA09001', 'FLEXIBLE MALLADO 2\'  X 9000mm ', 2, 14, 0, 0, 0, 0, 1),
(473, 'CA09002', 'FLEXIBLE AC .INOX.  3\'  S-300 X 5000mm c/bridas', 2, 14, 0, 0, 0, 0, 1),
(474, 'CA09003', 'FLEXIB C/ TERMINAL 2\' X 1000mm  MF AºCº/ INOX', 2, 14, 0, 2, 1, 0, 1),
(475, 'CA09004', 'FLEXIB INOX.  1\' x 1000mm MF-MF  TERMINAL 1\'', 2, 14, 0, 0, 1, 0, 1),
(476, 'CA09005', 'FLEXIB 1\' X 5000mm INOX  C/ malla lt mfxmf', 2, 14, 0, 3, 1, 0, 1),
(477, 'CA09006', 'FLEXIBLE 3/8 X 50 cm Mallado Acero Inoxidable', 2, 14, 0, 0, 0, 0, 1),
(478, 'CA09007', 'FUELLE ANTIVIBRAT. FLEX. AISI 316 2\' x 170mm S-150', 2, 14, 1, 0, 0, 0, 1),
(479, 'CA09008', 'CAÑO FLEXIBLE DE AISI ,RECUBIERTO C/ MALLA AISI TERMIN MACHO FIJO 2\' AºCº LARGO 4000mm', 2, 14, 0, 0, 0, 0, 1),
(480, 'CA09009', 'CAÑO FLEXIBLE DE INOXIDABLE 1\' X 3000 MM APTO P/ VACIO R-22 MACHO FIJO Aº Cº', 2, 14, 0, 0, 0, 0, 1),
(481, 'CA09010', 'CAÑO FLEXIBLE DE AISI ,RECUBIERTO C/ MALLA DE AISI EXTREMO BRIDADOS S-150 DE 1 1/2\' X 360MM LARGO', 2, 14, 2, 0, 0, 0, 1),
(482, 'CA09011', 'CAÑO FLEXIBLE DE  PTFE CORRUGADO 1\' LT 1200MM C/MF ROSC P/ CATA', 2, 14, 0, 3, 1, 0, 1),
(483, 'CA09012', 'FLEXIBLE TEFLON CORRUGADO C/ MALLA INOX . MF AºCº Ø1/2\' X 800 mm', 2, 14, 0, 0, 0, 0, 1),
(484, 'CA09013', 'CAÑO FLEXIBLE AC.INOX. CORRUGADO 21/2\' X 300MM C/BRIDAS AºCº 2\' S150 ', 2, 14, 0, 0, 0, 0, 1),
(485, 'CA09014', 'CAÑO FEXI.RECUBIERTO C/MALLA AISI MACHO FIJO 11/2\'X400MM', 2, 14, 1, 1, 0, 149, 1),
(486, 'CA09015', 'CAÑO FEXI.RECUBIERTO C/MALLA AISI BRIDA 2\' SERIE 150 X 500MM', 2, 14, 1, 1, 0, 0, 1),
(487, 'CA09016', 'CAÑO FEXI.RECUBIERTO C/MALLA AISI BRIDA 2\' SERIE 300 X 1000MM', 2, 14, 2, 1, 0, 0, 1),
(488, 'CA09017', 'FUELLE ANTIVIBRATORIO FLEXIBLE AISI 316 2\' x 590mm S-150', 2, 14, 1, 1, 0, 0, 1),
(489, 'CA09018', 'Flexibles de teflon corrugado, con malla AISI Ø 1\', M - M, fijos ambos extremos Ac. Car x 1500mm.', 2, 14, 3, 2, 0, 319, 1),
(490, 'CA09019', 'FLEXIBLE CORRUGADO INOX. CON MALLA INOX. 1\' MF x MF AºCº LARGO 5000mm PARA R22', 2, 14, 1, 5, 1, 0, 1),
(491, 'CA09020', 'FLEXIBLE CORRUGADO INOX. CON MALLA INOX. 1\' MF x MF AºCº LARGO 10000mm PARA R22', 2, 14, 0, 2, 1, 0, 1),
(492, 'CA09021', 'MANGUERA GOMA Y TELA P/VAPOR 1/2\' MFxMF AºCº LARGO 5000mm', 2, 14, 11, 5, 1, 0, 1),
(493, 'CA09022', 'MANGUERA GOMA Y TELA P/VAPOR 1/2\' MFxMF AºCº LARGO 10000mm', 2, 14, 7, 2, 1, 0, 1),
(494, 'CA10001', 'CAUDALIMETRO CLASE C', 2, 15, 0, 0, 0, 0, 1),
(495, 'CA10002', 'FLOTANTE 3/4\' P/ALTA PRESION ', 2, 15, 0, 0, 0, 0, 1),
(496, 'CA11001', 'CAÑO DE PTFE 2\'  Ø 0,70 mm', 2, 16, 0, 0, 0, 0, 1),
(497, 'CA11002', 'CAÑO DE PTFE   Ø 0,50 mm X mts', 2, 16, 1, 0, 0, 0, 1),
(498, 'CA11003', 'CAÑO DE PTFE 1\' 0,40 mm', 2, 16, 1, 0, 0, 0, 1),
(499, 'CA11004', 'CAÑO PTFE Ø 0,75 mm', 2, 16, 0, 0, 0, 0, 1),
(500, 'CA11005', 'CAÑO PTFE Ø 1 1/2\' X 3000MM CON BRIDAS SPLIT ON ', 2, 16, 0, 0, 0, 0, 1),
(501, 'CA11006', 'CAÑO PTFE Ø 2\' X 3000MM CON BRIDAS SPLIT ON ', 2, 16, 0, 0, 0, 0, 1),
(502, 'CA11007', 'TEE PTFE 1 1/2\' CON BRIDA GIRATORIA SPLIT ON', 2, 16, 0, 0, 0, 0, 1),
(503, 'CA11008', 'TEE PTFE 2\' CON BRIDA GIRATORIA SPLIT ON', 2, 16, 0, 0, 0, 0, 1),
(504, 'CA11009', 'BARRA TEFLON 30mm X MT', 3, 16, 0, 2, 0, 0, 1),
(505, 'CA12001', 'TEE BRONCE 1/2\'', 2, 17, 0, 2, 0, 0, 1),
(506, 'CA12002', 'TEE BRONCE 3/4\'', 2, 17, 4, 2, 0, 0, 1),
(507, 'CA12003', 'TEE BRONCE 1\'', 2, 17, 6, 2, 0, 0, 1),
(508, 'CA12004', 'CODO BRONCE 1/2\'', 2, 17, 0, 2, 0, 0, 1),
(509, 'CA12005', 'CODO BRONCE 3/4\'', 2, 17, 0, 2, 0, 0, 1),
(510, 'CA12006', 'CODO BRONCE 1\'', 2, 17, 3, 2, 0, 0, 1),
(511, 'CA12007', 'ENTRE ROSCA BRONCE 1/2\'', 2, 17, 0, 2, 0, 0, 1),
(512, 'CA12008', 'ENTRE ROSCA BRONCE 3/4\'', 2, 17, 0, 2, 0, 0, 1),
(513, 'CA12009', 'ENTRE ROSCA BRONCE 1\'', 2, 17, 1, 2, 0, 0, 1),
(514, 'CA12010', 'UNION DOBLE BRONCE 1/2\'', 2, 17, 0, 2, 0, 0, 1),
(515, 'CA12011', 'UNION DOBLE BRONCE 3/4\'', 2, 17, 0, 2, 0, 0, 1),
(516, 'CA12012', 'UNION DOBLE BRONCE 1\'', 2, 17, 2, 2, 0, 0, 1),
(517, 'CL01001', 'GAS OIL', 1, 18, 0, 100, 1, 354, 1),
(518, 'CL01002', 'NAFTA SUPER', 1, 18, 0, 0, 0, 0, 1),
(519, 'CL02001', 'GRASA GRAFITADA', 4, 19, 0, 0, 0, 0, 1),
(520, 'CL02002', 'ACEITE CP-FMO 46 PARA PULSA 7120 / 880', 1, 19, 40, 40, 1, 32, 1),
(521, 'CL02003', 'ACEITE ZERICE 68 X LTS', 1, 19, 0, 0, 0, 0, 1),
(522, 'CL02004', 'ACEITE RIMULA  SAE 40 X LTS ', 1, 19, 0, 0, 0, 0, 0),
(523, 'CL02005', 'ACEITE ESSO XT3 MULTIGRADO 15W40 X LTRS', 1, 19, 0, 0, 0, 0, 0),
(524, 'CL02006', 'ACEITE DE LINO  X LITRO', 1, 19, 0, 0, 0, 0, 1),
(525, 'CL02007', 'ACEITE ELF COMPETICION DIESEL  10W40  X LTS', 1, 19, 0, 0, 0, 0, 0),
(526, 'CL02008', 'ACEITE RIMULA 15 W 40 ', 1, 19, 0, 0, 0, 0, 0),
(527, 'CL02009', 'ACEITE GIRELET 140 P/ CAJA REDUCTORA ', 1, 19, 2, 0, 0, 0, 1),
(528, 'CL02010', 'ACEITE REFRIGERATION OIL S4 FR-V68 ( SINTETICO)', 1, 19, 0, 50, 0, 0, 1),
(529, 'CL02011', 'LIQUI DIRECCION HIDRAULICA SEMI SINTETICO BARDAHL', 1, 19, 0, 0, 0, 0, 0),
(530, 'CL02012', 'ACEITE HIDRAULICO NUTO 68  LTS.', 1, 19, 20, 0, 0, 0, 0),
(531, 'CL02013', 'ACEITE LUBRAX MD 400', 1, 19, 0, 0, 0, 0, 0),
(532, 'CL02014', 'GRASA P/RODAMIENTO  X KG', 4, 19, 2, 1, 0, 0, 1),
(533, 'CL02015', 'ACEITE TELLUS 68 / REMPLAZO MOBIL NUTO H68', 1, 19, 0, 0, 0, 0, 0),
(534, 'CL02016', 'ACEITE EXXON ATF-D2', 1, 19, 3, 0, 0, 0, 0),
(535, 'CL02017', 'GRASA MULTIUSO X 18kgs. SHELL ALBANIA', 4, 19, 0, 1, 0, 0, 1),
(536, 'CL02018', 'ACEITE STIHL PARA MOTOGUADAÑA', 1, 19, 0, 2, 0, 0, 1),
(537, 'CL02019', 'ACEITE  MORLINA S2 B150', 1, 19, 0, 50, 1, 0, 1),
(538, 'CL02020', 'LIQUIDO FRENO TIPO 3 DOT3 SINTETICO BARDAHL', 1, 19, 0, 0, 0, 0, 0),
(539, 'CL02021', ' ACEITE DIELECTRICO P/BOMBA SUMERGIBLE  cc', 1, 19, 0, 0, 0, 0, 1),
(540, 'CL02022', 'ACEITE VITRA 100 / REMPLAZO MOBIL DTE SERIE 27', 1, 19, 0, 0, 0, 0, 0),
(541, 'CL02023', 'ACEITE HELIX SUPER 15W40 X LTS', 1, 19, 0, 0, 0, 0, 0),
(542, 'CL02024', 'ACEITE CP-1009-68 X LTS ', 1, 19, 0, 0, 0, 0, 0),
(543, 'CL02025', 'ACEITE CORENA S68 X 20 LTS', 1, 19, 20, 50, 0, 0, 1),
(544, 'CL02026', 'ACEITE  P/ BOMBA DE VACIO (CP-9003-100)', 1, 19, 40, 10, 1, 0, 1),
(545, 'CL02027', 'GRASA TIXOTROPICA - RUNATIX calidad 00 p/caja reduc', 4, 19, 0, 10, 1, 0, 1),
(546, 'CL02028', 'LUBRICANTE REFRIGERANTE PARA USO CON R134', 1, 19, 7, 1, 0, 0, 1),
(547, 'CL02029', 'LUBRICANTE REFRIGERANTE GRADO RL325', 1, 19, 0, 0, 0, 0, 1),
(548, 'CL02030', 'GRASA DE LINO MULTIUSO X KG', 4, 19, 0, 0, 0, 0, 0),
(549, 'CL02031', 'ACEITE PERFORMANCE TROPY DX 15W40', 1, 19, 0, 0, 0, 0, 1),
(550, 'CL02032', 'AEROSHELL FLUID 41 * LTS', 1, 19, 2, 0, 0, 0, 1),
(551, 'CL02033', 'ACEITE SILICONADO AK1000', 1, 19, 5, 2, 1, 9, 1),
(552, 'CL02034', 'LIQUIDO REFRIGERANTE BOSCH TIPO A ', 1, 19, 0, 0, 0, 0, 0),
(553, 'CL02035', 'ACEITE CP FMO 22', 1, 19, 20, 20, 1, 0, 1),
(554, 'CL02036', 'ACEITE CP FMO 68 PARA BRAN LUEBBE', 1, 19, 40, 20, 1, 31, 1),
(555, 'CO01001', 'CORREA A 83', 2, 20, 3, 1, 0, 0, 1),
(556, 'CO01002', 'CORREA A 68', 2, 20, 4, 1, 0, 0, 1),
(557, 'CO01003', 'CORREA A 65', 2, 20, 2, 1, 0, 0, 1),
(558, 'CO01004', 'CORREA A 41', 2, 20, 1, 2, 0, 0, 1),
(559, 'CO01005', 'CORREA A 42 / 13X1060', 2, 20, 5, 1, 0, 0, 1),
(560, 'CO01006', 'CORREA A 72', 2, 20, 3, 1, 0, 0, 1),
(561, 'CO01007', 'CORREA A-80', 2, 20, 7, 5, 1, 0, 1),
(562, 'CO02001', 'CORREA BX-73', 2, 21, 4, 1, 0, 0, 1),
(563, 'CO02002', 'CORREA B81', 2, 21, 5, 2, 0, 0, 1),
(564, 'CO02003', 'CORREA B 69', 2, 21, 1, 1, 0, 0, 1),
(565, 'CO02004', 'CORREA B 42 /LP 1110', 2, 21, 1, 1, 0, 0, 1),
(566, 'CO02005', 'CORREA B 61  COMPRESOR DINA NUEVO', 2, 21, 0, 0, 0, 0, 0),
(567, 'CO02006', 'CORREA B 55   COMPRESOR VMC', 2, 21, 4, 1, 0, 0, 1),
(568, 'CO02007', 'CORREA B-79  (06) COMPRESOR HF', 2, 21, 1, 1, 0, 0, 1),
(569, 'CO02008', 'CORREA B-73', 2, 21, 2, 1, 0, 0, 1),
(570, 'CO02009', 'CORREA A-43', 2, 21, 2, 2, 0, 0, 1),
(571, 'CO02010', 'CORREA 3150', 2, 21, 5, 1, 0, 0, 1),
(572, 'EL01001', 'CONTROL DE FLUJO 3/4 220V', 2, 22, 0, 0, 0, 0, 1),
(573, 'EL01002', 'VALVULA JEFFERSON 1390 SA4 -  1/2\' - BSPT', 2, 22, 0, 0, 1, 439, 1),
(574, 'EL01003', 'COMBISTATO SF 95 MOD SC 15600X105 RANGO 0/120 STORCK  ', 2, 22, 0, 0, 0, 0, 1),
(575, 'EL01004', 'Válvulas Solenoides EVR 3, 3/8\', 032F8116', 2, 22, 0, 6, 1, 0, 1),
(576, 'EL01005', 'DUAL PRESSURE CONTROL  0,2 A 7,5 BAR in 1/4\' DANFOSS KP15', 2, 22, 0, 1, 0, 0, 1),
(577, 'EL01006', 'FILTRO MICRO QBS4 R,G 1/4 0A10BAR X5 M ', 2, 22, 2, 1, 0, 155, 1),
(578, 'EL01007', 'FOTOCONTROL ENCHUFABLE 10A (FOTOCELULA)', 2, 22, 3, 3, 0, 0, 1),
(579, 'EL01008', 'PRESOSTATO LOW -0,2-7,5 BAR 1/4 in flare KP1', 2, 22, 1, 1, 0, 72, 1),
(580, 'EL01009', 'high PRESOSTATO 8/32 BAR 1/4\' DANFOSS KP5 ', 2, 22, 0, 1, 1, 0, 1),
(581, 'EL01010', 'PRESOSTATO DANFOSS DE 02-8 BAR 04-1,5 BAR MOD KPI35', 2, 22, 1, 1, 0, 0, 1),
(582, 'EL01011', 'PRESOSTATO DANFOSS MOD RT -110', 2, 22, 0, 0, 0, 0, 1),
(583, 'EL01012', 'PRESOSTATO DANFOSS MOD RT -116', 2, 22, 0, 0, 0, 0, 1),
(584, 'EL01013', 'VALVULA SOLENNOIDE JEFFERSON 220V DE 1 1/2\' BSP', 2, 22, 2, 1, 0, 0, 1),
(585, 'EL01014', 'PRESOSTATO KP5 8-28 BAR', 2, 22, 0, 1, 0, 0, 1),
(586, 'EL01015', 'FLOW SWITCH 250V AC 10(3)A ( CONTROLADOR DE FLUJO)', 2, 22, 0, 0, 0, 0, 1),
(587, 'EL01016', 'PRESSURE CONTROL 0,3 A 4,5BAR MP55', 2, 22, 1, 0, 0, 0, 1),
(588, 'EL01017', 'REGULADOR DE AIRE MICRO QBS4 R.G 1/4 0A10 BAR', 2, 22, 0, 1, 0, 0, 1),
(589, 'EL01018', 'THERMOSTAT 60-120ºC/HT100-180ºC KP98', 2, 22, 1, 0, 0, 0, 1),
(590, 'EL01019', 'CAMPANILLA KVA 25 CMMARINERA 220 V INT', 2, 22, 1, 0, 0, 0, 1),
(591, 'EL01020', 'VALVULA SOLENNOIDE JERRERSON C/BOBINA 24V/CC DE 1/2\'', 2, 22, 0, 1, 0, 0, 1),
(592, 'EL01021', 'BOBINA SOLENOIDE O ELECTRO 24V 20W 018F6757', 2, 22, 0, 0, 0, 0, 1),
(593, 'EL01022', 'BOBINA SOLENOIDE O ELECTRO 24V 20W 018F6707', 2, 22, 6, 1, 0, 0, 1),
(594, 'EL01023', 'BOBINA SOLENOIDE O ELECTRO 24V 20W 018F6857', 2, 22, 20, 1, 0, 0, 1),
(595, 'EL01024', 'SIRENA BAW /SA55 C/ TURBINA 100DBA 220 VCA', 2, 22, 1, 1, 0, 0, 1),
(596, 'EL01025', 'VALVULA SOLENNOIDE JERRERSON 220V DE 1/2\' BSP', 2, 22, 0, 1, 0, 0, 1),
(597, 'EL01026', 'PRESOSTATO DE 2-7,5 bar diff  0,4-4 bar DANFOSS KP1', 2, 22, 0, 2, 1, 0, 1),
(598, 'EL01027', 'MODULO I/O EXT. P/ENVASADO - METTLER TOLEDO 71209352', 2, 22, 1, 1, 1, 4, 1),
(599, 'EL01028', 'CONTADOR DIGITAL H81 PARA ENVASADO', 2, 22, 1, 1, 0, 0, 1),
(600, 'EL01029', 'BOBINA SOLENOIDE 220V 10W 018F6701', 2, 22, 1, 1, 0, 0, 1),
(601, 'EL01030', 'VALVULA SOLENOIDE C/BOBINA 220 V - 1 1/2\'', 2, 22, 1, 1, 0, 0, 1),
(602, 'EL02002', '10 AMPERS NHO GL 500V', 2, 23, 0, 0, 0, 0, 0),
(603, 'EL02003', '15 AMPERS NHO', 2, 23, 0, 0, 0, 0, 0),
(604, 'EL02004', '16 AMPERS NH0 GL 500V', 2, 23, 0, 0, 0, 0, 0),
(605, 'EL02005', '20 AMPERS NH0 GL 500V', 2, 23, 0, 0, 0, 0, 0),
(606, 'EL02006', '25 AMPERS NHO', 2, 23, 0, 0, 0, 0, 0),
(607, 'EL02007', '35 AMPERS NHO', 2, 23, 0, 0, 0, 0, 0),
(608, 'EL02008', '50 AMPERS NT00C GL 660V (reemplazado por EL02009)', 2, 23, 0, 0, 0, 0, 0),
(609, 'EL02009', '50 AMPERS NH0 GL 660V ', 2, 23, 0, 0, 0, 0, 1),
(610, 'EL02010', '63 AMPERS NH0 GL 500V', 2, 23, 0, 1, 0, 20, 1),
(611, 'EL02012', '80 AMPERS NH0 GL 500V ', 2, 23, 4, 3, 1, 0, 1),
(612, 'EL02014', '100 AMPERS NH0 GL 500V', 2, 23, 6, 6, 1, 20, 1),
(613, 'EL02015', '125 AMPERS NH1 GL 500V', 2, 23, 7, 6, 1, 44, 1),
(614, 'EL02016', '125 AMPERS NH0 GL 500V', 2, 23, 3, 1, 0, 0, 1),
(615, 'EL02018', '160 AMPERS NH1 GL 500V', 2, 23, 5, 5, 1, 0, 1),
(616, 'EL02019', '224 AMPERS NH1 GL 500V', 2, 23, 3, 3, 1, 0, 1),
(617, 'EL02020', '250 AMPERS NH1 GL 500V', 2, 23, 9, 9, 1, 48, 1),
(618, 'EL02021', '250 AMPERS NH2 GL 500V', 2, 23, 6, 3, 1, 59, 1),
(619, 'EL02023', '250 AMPERS NH2 GL 500V RETARDO', 2, 23, 0, 3, 1, 0, 1),
(620, 'EL02025', '315 AMPERS NH2 GL 500V', 2, 23, 8, 1, 0, 0, 1),
(621, 'EL02026', '355 AMPERS NH2 GL 500V', 2, 23, 12, 3, 1, 0, 1),
(622, 'EL02028', '355 AMPERS NH1 GL 500V', 2, 23, 0, 0, 0, 0, 0),
(623, 'EL02030', '400 AMPERS NH1', 2, 23, 0, 0, 0, 0, 0),
(624, 'EL02031', '400 AMPERS NH3', 2, 23, 0, 0, 0, 0, 0),
(625, 'EL02032', '400 AMPERS NH2 GL 500V', 2, 23, 12, 6, 1, 0, 1),
(626, 'EL02033', '630 AMPERS NH3 GL 500V ', 2, 23, 2, 1, 0, 0, 1),
(627, 'EL02035', '200 AMPERS NH1 GL 500V', 2, 23, 9, 1, 0, 0, 1),
(628, 'EL02036', '1000 AMPERS NH4 GL 500V', 2, 23, 3, 1, 0, 0, 1),
(629, 'EL02037', 'FUSIBLE CILINDRICO 8,5 X 31,5mm 1A', 2, 23, 13, 1, 0, 0, 1),
(630, 'EL02038', 'FUSIBLE PERITA 10 A', 2, 23, 0, 0, 0, 0, 1),
(631, 'EL02039', 'FUSIBLE DE CERAMICO R-10 2A', 2, 23, 0, 0, 0, 0, 0),
(632, 'EL02040', 'FUSIBLE DE CERAMICO 8,5 X 31,5 10A ', 2, 23, 2, 1, 0, 0, 1),
(633, 'EL02041', 'FUSIBLE DE CERAMICO 14 X 51 63A', 2, 23, 13, 1, 0, 0, 1),
(634, 'EL02042', 'FUSIBLE DE CERAMICO 14 X 51 40A', 2, 23, 17, 15, 1, 0, 1),
(635, 'EL02043', 'FUSIBLE DE CERAMICO 10,3 X 38 1A', 2, 23, 17, 10, 1, 0, 1),
(636, 'EL02044', 'FUSIBLE DE CERAMICO 10,3 X 38 2A', 2, 23, 10, 0, 0, 0, 1),
(637, 'EL02045', 'FUSIBLE DE CERAMICO 10,3 X 38 6A  500/600V', 2, 23, 0, 0, 0, 0, 1),
(638, 'EL02046', 'FUSIBLE DE CERAMICO 8,5 X 31,5 2A', 2, 23, 19, 2, 1, 0, 1),
(639, 'EL02047', 'FUSIBLE DE CERAMICO 8,5 X 31,5 3A', 2, 23, 5, 0, 0, 0, 1),
(640, 'EL02048', 'FUSIBLE DE CERAMICO 8,5 X 31,5 4A', 2, 23, 16, 0, 0, 0, 1),
(641, 'EL02049', 'FUSIBLE DE VIDRIO 5X20 5A', 2, 23, 0, 0, 0, 0, 1),
(642, 'EL02050', 'FUSIBLE DE VIDRIO 5X20 1A', 2, 23, 0, 0, 0, 0, 1),
(643, 'EL02051', 'FUSIBLE DE VIDRIO 6X30 0,25A', 2, 23, 8, 0, 0, 0, 1),
(644, 'EL02052', 'FUSIBLE DE VIDRIO 1A F', 2, 23, 7, 0, 0, 0, 1),
(645, 'EL02053', 'FUSIBLE DE VIDRIO 2A F', 2, 23, 5, 0, 0, 0, 1),
(646, 'EL02054', 'FUSIBLE ULTRARAPIDO SEMIKROM 160A AR T01  500V', 2, 23, 18, 12, 1, 56, 1),
(647, 'EL02055', 'FUSIBLE SEMIKROM 400 A  AR T02  500V', 2, 23, 7, 12, 1, 0, 1),
(648, 'EL02056', 'ALAMBRE  PARA FUSIBLE 10A 5MT X MTRO ', 2, 23, 0, 0, 0, 0, 0),
(649, 'EL02057', 'FUSIBLE P/CAMIONETA/ ZAMPI 4 ROSA', 2, 23, 0, 0, 0, 0, 0),
(650, 'EL02058', 'FUSIBLE P/CAMIONETA/ ZAMPI 5 NARANJA', 2, 23, 0, 0, 0, 0, 0),
(651, 'EL02059', 'FUSIBLE P/CAMIONETA/ ZAMPI 7,5 GRIS/ BORRAVINO', 2, 23, 0, 0, 0, 0, 0),
(652, 'EL02060', 'FUSIBLE P/CAMIONETA/ ZAMPI 10 ROJO', 2, 23, 0, 0, 0, 0, 0),
(653, 'EL02061', 'FUSIBLE P/CAMIONETA/ ZAMPI 15 CELESTE', 2, 23, 0, 0, 0, 0, 0),
(654, 'EL02062', 'FUSIBLE P/CAMIONETA/ ZAMPI 20 AMARILLO', 2, 23, 0, 0, 0, 0, 0),
(655, 'EL02063', 'FUSIBLE P/CAMIONETA/ ZAMPI 25 BLANCO ', 2, 23, 0, 0, 0, 0, 0),
(656, 'EL02064', 'FUSIBLE P/CAMIONETA/ ZAMPI 30 VERDE', 2, 23, 0, 0, 0, 0, 0),
(657, 'EL02065', 'FUSIBLE VIDRIO 250 Ma -250v', 2, 23, 9, 0, 0, 0, 1),
(658, 'EL02066', 'FUSILERA 8 X 31', 2, 23, 2, 2, 0, 0, 1),
(659, 'EL02067', 'FUSIBLE CERAMICO 10 X 38  1A', 2, 23, 0, 0, 0, 0, 1),
(660, 'EL02068', 'BASES HO 4 1250A  500V', 2, 23, 0, 0, 0, 0, 1),
(661, 'EL02069', 'BASES NT2 SIST401  400A  660V                    ', 2, 23, 3, 0, 0, 0, 1),
(662, 'EL02070', 'BASES NH 3/030  160A  660V               ', 2, 23, 1, 0, 0, 0, 1),
(663, 'EL02071', 'PINZAS PARA EXTRACCION NH', 2, 23, 2, 0, 0, 0, 1),
(664, 'EL02072', 'BASE FUSIBLE 660V 630A NT3 SIST 601', 2, 23, 0, 0, 0, 0, 1),
(665, 'EL02073', 'FUSIBLE CERAMICO 14X51 50 A ', 2, 23, 2, 0, 0, 0, 1),
(666, 'EL02074', 'FUSIBLE VIDRIO 5X20 100  m A', 2, 23, 40, 1, 0, 0, 1),
(667, 'EL02075', 'FUSIBLE 5X20MM 0,5 Amp', 2, 23, 44, 0, 0, 0, 1),
(668, 'EL02076', 'BASE FUSIBLE', 2, 23, 3, 0, 0, 0, 1),
(669, 'EL02077', 'BASE FUSIBLE  660V 250A', 2, 23, 2, 0, 0, 0, 1),
(670, 'EL03001', 'BOBINA P/CONTACTOR 220/230V LX1D6M7', 2, 24, 2, 0, 0, 0, 1),
(671, 'EL03002', 'BOBINA P/CONTACTOR 380/400 LX1D8Q7', 2, 24, 2, 0, 0, 0, 1),
(672, 'EL03003', 'BOBINAS CONTACTOR BCA-105Z 220V  ', 2, 24, 1, 1, 1, 0, 1),
(673, 'EL03004', 'CONDENSADOR DE POTENCIA CL-FP-40/10KVAR', 2, 24, 2, 0, 0, 0, 1),
(674, 'EL03005', 'CONTACTOR  95A - LC1 D95M7', 2, 24, 0, 3, 0, 0, 1),
(675, 'EL03006', 'CONTACTOR mc1-12  11e 1 na+', 2, 24, 0, 0, 0, 0, 1),
(676, 'EL03007', 'CONTACTOR 12A 220V -1NA+NC LC1 D12M7', 2, 24, 0, 0, 0, 0, 1),
(677, 'EL03008', 'CONTACTOR 220V 7.5KW - LC1 D18M7', 2, 24, 0, 0, 0, 0, 1),
(678, 'EL03009', 'CONTACTOR 22KW -  LC1 D50M7', 2, 24, 1, 2, 1, 0, 1),
(679, 'EL03010', 'CONTACTOR 30KW -  LC1 065M7                    ', 2, 24, 0, 1, 0, 0, 1),
(680, 'EL03011', 'CONTACTOR 380KW/400V 3RT1024- 1AN 20', 2, 24, 0, 0, 0, 0, 1),
(681, 'EL03012', 'CONTACTOR 4KW - LC1 D09M7', 2, 24, 0, 2, 1, 0, 1),
(682, 'EL03013', 'CONTACTOR 7,5KW - LC1 D25M7', 2, 24, 0, 1, 1, 0, 1),
(683, 'EL03014', 'CONTACTOR 55KW - LC1D115M7', 2, 24, 1, 1, 0, 0, 1),
(684, 'EL03015', 'CONTACTOR 45KW - CWM95, BOV. 220 ', 2, 24, 0, 1, 1, 0, 1),
(685, 'EL03016', 'CONTACTOR 8,5KW -  LC1 D38M7', 2, 24, 0, 2, 1, 0, 1),
(686, 'EL03017', 'CONTACTOR AUX ACBF-11', 2, 24, 0, 0, 0, 0, 1),
(687, 'EL03018', 'CONTACTOR AUX BCXMF01      ', 2, 24, 2, 0, 0, 0, 1),
(688, 'EL03019', 'CONTACTOR AUX BCXMF10', 2, 24, 1, 0, 0, 0, 1),
(689, 'EL03020', 'CONTACTOR LC1D-K SCHNEIDER ELECTRIC', 2, 24, 0, 0, 0, 0, 1),
(690, 'EL03021', 'CONTACTOR AUX LEADEN1137919', 2, 24, 0, 0, 0, 0, 1),
(691, 'EL03022', 'CONTACTOR CWM9-10 30D23', 2, 24, 0, 3, 0, 0, 1),
(692, 'EL03023', 'CONTACTOR BCO. CAP. LC1DPK12M7 ', 2, 24, 0, 2, 1, 0, 1),
(693, 'EL03024', 'CONTACTOR LC1 K09 10Q7', 2, 24, 0, 1, 1, 0, 1),
(694, 'EL03025', 'CONTADOR HORARIO XB5 DSM  902173*1', 2, 24, 0, 0, 0, 0, 1),
(695, 'EL03026', 'DISYUNTOR MAGNETOTERMICO 13-18A GV2ME20', 2, 24, 0, 0, 0, 0, 1);
INSERT INTO `item` (`Id`, `Codigo`, `Descripcion`, `UnidadDeMedidaId`, `SubFamiliaId`, `Stock`, `PuntodePedido`, `Critico`, `Precio`, `Activo`) VALUES
(696, 'EL03027', 'DISYUNTOR MAGNETOTERMICO 9-14A GV2ME16 ', 2, 24, 0, 0, 0, 0, 1),
(697, 'EL03028', 'GUARDAMOTOR C/CONTACTOS AUXILIARES 4- 6,3A ', 2, 24, 0, 1, 1, 0, 1),
(698, 'EL03029', 'GUARDAMOTOR  1- 1,6 A ', 2, 24, 0, 1, 1, 0, 1),
(699, 'EL03030', 'GUARDAMOTOR C/CONTACTOS AUX NC/ NA  6,3- 10A', 2, 24, 0, 2, 1, 0, 1),
(700, 'EL03031', 'GUARDAMOTOR C/CONTACTOS AUX NC/ NA  2,5- 4A ', 2, 24, 0, 2, 1, 0, 1),
(701, 'EL03032', 'GUARDAMOTOR C/CONTACTOS AUX NC/ NA  10- 16A ', 2, 24, 0, 1, 1, 0, 1),
(702, 'EL03033', 'GOLPE DE PUÑO C4 BS542 ROJO', 2, 24, 0, 0, 0, 0, 1),
(703, 'EL03034', 'INTERRUPTOR DIFERENCIAL BIPOLAR 63A (30mA)', 2, 24, 0, 1, 0, 0, 1),
(704, 'EL03035', 'LINEA ELECTRONICA ME-ET-60 PROTECCION INTELIGENT P/CONTACTORES', 2, 24, 0, 0, 0, 0, 1),
(705, 'EL03036', 'LLAVE SELECTORA 2 POSICIONES B5ED21', 2, 24, 0, 0, 0, 0, 1),
(706, 'EL03037', 'LLAVE SELECTORA 2 POSICIONES B5BEG03 C/ LLAVES', 2, 24, 1, 0, 0, 0, 1),
(707, 'EL03038', 'PULSADOR ARRANQUE /PARADA VERDE/ROJO XAL D324', 2, 24, 2, 0, 0, 0, 1),
(708, 'EL03039', 'PULSADOR DOBLE ROJO/VERDE Y SELECTORA 1  X AL D03-XAL D03AA', 2, 24, 0, 0, 0, 0, 1),
(709, 'EL03040', 'PULSADOR RASANTE METAL 1NA AMARILLO/VERDE', 2, 24, 0, 0, 0, 0, 1),
(710, 'EL03041', 'PULSADOR RASANTE PLAST, 1NC ROJO', 2, 24, 0, 0, 0, 0, 1),
(711, 'EL03042', 'PULSADOR RASANTE PLAST,1 NA  VERDE', 2, 24, 0, 1, 0, 0, 1),
(712, 'EL03043', 'RELE TEMPORISADOR T:0,05S-10min RE7RB11MW', 2, 24, 0, 0, 0, 0, 1),
(713, 'EL03044', 'RELE TEMPORISADOR T:0,05S-300h RE7MY13MW', 2, 24, 0, 0, 0, 0, 1),
(714, 'EL03045', 'SECCIONADOR  FUSIBLE  160A', 2, 24, 0, 1, 0, 0, 1),
(715, 'EL03046', 'SECCIONADOR  FUSIBLE  400A', 2, 24, 0, 0, 0, 0, 1),
(716, 'EL03047', 'SECCIONADOR  FUSIBLE 630A', 2, 24, 1, 0, 0, 0, 1),
(717, 'EL03048', 'SECCIONADOR  FUSIBLE 10X38  RT18-32X', 2, 24, 2, 0, 0, 0, 1),
(718, 'EL03049', 'TEMPORIZADOR  P/ARRANCADOR 01/10 SEG IEC60947-5-1 BAW 230V 5 A', 2, 24, 2, 0, 0, 0, 1),
(719, 'EL03050', 'ZUMBADOR PANEL 30mm 220VCA BAW 101 BUZZER FM-3', 2, 24, 2, 0, 0, 0, 1),
(720, 'EL03051', 'ZUMBADOR PANEL HRBPS30 BAW', 2, 24, 2, 0, 0, 0, 1),
(721, 'EL03052', 'FUSIBLE DE ALTA TENSION 33KU P/CELDA ORMASABAL 40A 20/36KV', 2, 24, 3, 0, 0, 0, 1),
(722, 'EL03053', 'KIT REPUESTO CELDA ORMASABAL', 2, 24, 1, 0, 0, 0, 1),
(723, 'EL03054', 'BLOQUE CONTACTO AUXILIAR 1 NA (3RH1921-1DA11', 2, 24, 2, 0, 0, 0, 1),
(724, 'EL03055', 'CONTACTOR TELEMECANIQUE LAD-32 ', 2, 24, 0, 1, 0, 0, 1),
(725, 'EL03056', 'CONTACTOR 3T B41', 2, 24, 0, 1, 0, 0, 1),
(726, 'EL03057', 'CONTACTOR DANFOSS CI16', 2, 24, 0, 1, 0, 0, 1),
(727, 'EL03058', 'RELE TIMER ESTRELLA SIEMENS 7PV1578-1BW30', 2, 24, 1, 1, 1, 0, 1),
(728, 'EL03059', 'LLAVE DE CORTE GV2-L14 10A', 2, 24, 0, 2, 1, 0, 1),
(729, 'EL03060', 'LLAVE SELECTORA DE 2 POSICIONES C/RETENCION', 2, 24, 0, 3, 1, 0, 1),
(730, 'EL03061', 'LLAVE SELECTORA DE  3 POSICIONES C/RETENCION', 2, 24, 0, 2, 1, 0, 1),
(731, 'EL03062', 'CONTACTOR WEG CWM 112 BOBINA 220', 2, 24, 1, 1, 1, 0, 1),
(732, 'EL03063', 'CONTACTOR WEG CWM 180 BOBINA 220', 2, 24, 2, 2, 1, 0, 1),
(733, 'EL03064', 'CONTACTOR   22KW LC1 D32M7', 2, 24, 0, 2, 1, 0, 1),
(734, 'EL03065', 'TEMPORIZADOR  TELEMECANIQUE LADS2  01/30 SEG', 2, 24, 0, 1, 1, 0, 1),
(735, 'EL03066', 'RESISTENCIA PARA TERMOTANQUE DE 2000W', 2, 24, 0, 3, 1, 0, 1),
(736, 'EL03067', 'CONTACTOR LC1 DLK11 C/JUEGO DE RESISTENCIAS CALIBRADAS ', 2, 24, 0, 1, 1, 0, 1),
(737, 'EL03068', 'CONTACTOR 3RT1026-1AN20 11 KW', 2, 24, 0, 1, 0, 0, 1),
(738, 'EL03069', 'CONTACTOS AUX 1NA (P/LC1D/F) LADN10', 2, 24, 0, 2, 0, 0, 1),
(739, 'EL03070', 'CONTACTOS AUX 1NA (P/LC1D/F) LADN01', 2, 24, 0, 1, 0, 0, 1),
(740, 'EL03071', 'PARADA DE EMERGENCIA C/RETENCION ', 2, 24, 0, 2, 0, 0, 1),
(741, 'EL03072', 'CAPUCHONSILICONA DOBLE IP65', 2, 24, 3, 2, 0, 0, 1),
(742, 'EL03073', 'INTERRUPTOR DIFERENCIAL TRIFASICO 40A (30mA)', 2, 24, 0, 0, 0, 0, 1),
(743, 'EL03074', 'FUSIBLE DE ALTA TENSION 33KU P/CELDA ORMASABAL 50A 20/36KV', 2, 24, 2, 1, 1, 0, 1),
(744, 'EL03075', 'BLOQUE CONTACTO AUXILIAR 1 NO + 1 NC (3RH1921-1LA11)', 2, 24, 1, 0, 0, 0, 1),
(745, 'EL04001', 'RELEVADOR MINIMA Y MAXIMA TENSION RPM-SS-UL  COMPRESOR MONTERO', 2, 25, 1, 0, 0, 0, 1),
(746, 'EL04002', 'RELE PROTECCION TRIFASICO BAW XJ11', 2, 25, 0, 0, 0, 0, 1),
(747, 'EL04003', 'RELE RUN 31 A 21P7', 2, 25, 0, 0, 0, 0, 1),
(748, 'EL04004', 'RELE TRIFASICO DE 380 VCA ', 2, 25, 0, 0, 0, 0, 1),
(749, 'EL04005', 'RELEVO TERMICO 1,8-2,6A              ', 2, 25, 0, 0, 0, 0, 1),
(750, 'EL04006', 'RELEVO TERMICO 1-1.6A  (CRDO6)', 2, 25, 0, 0, 0, 0, 1),
(751, 'EL04007', 'RELEVO TERMICO 12-18A    \'T\'  (LRD21)', 2, 25, 0, 1, 0, 0, 1),
(752, 'EL04008', 'RELEVO TERMICO 16-24A  (CRD22) 220V           ', 2, 25, 0, 1, 0, 0, 1),
(753, 'EL04009', 'RELEVO TERMICO 2,5-4A TR1-T1               ', 2, 25, 0, 0, 0, 0, 1),
(754, 'EL04010', 'RELEVO TERMICO 20 - 25 AMP.SIEMENS', 2, 25, 0, 0, 0, 0, 1),
(755, 'EL04011', 'RELEVO TERMICO 4-6A \'T\'', 2, 25, 0, 1, 0, 0, 1),
(756, 'EL04012', 'RELEVO TERMICO 5,5-8A     \'T\'', 2, 25, 1, 2, 1, 0, 1),
(757, 'EL04013', 'RELEVO TERMICO 7-10A \'T\'  (CRD14)', 2, 25, 0, 1, 1, 0, 1),
(758, 'EL04014', 'RELEVO TERMICO 9-13A    \'T\'', 2, 25, 0, 0, 0, 0, 1),
(759, 'EL04015', 'RELE- MR- 24DC/21 (INCINERACION)', 2, 25, 12, 0, 0, 0, 1),
(760, 'EL04016', 'ZOCALO SIMPLE P/RUN31A21P7', 2, 25, 0, 0, 0, 0, 1),
(761, 'EL04017', 'RELEVO TERMICO 32-50A', 2, 25, 0, 1, 1, 0, 1),
(762, 'EL04018', 'RELE 220 VOLT 8 PINES', 2, 25, 0, 1, 0, 0, 1),
(763, 'EL04019', 'RELEVO TERMICO WEG - 100-150 A', 2, 25, 0, 1, 1, 0, 1),
(764, 'EL04020', 'RELE RW317D 2A 100-150', 2, 25, 1, 0, 0, 0, 1),
(765, 'EL04021', 'RELEVO TERMICO 8-12,5A     \'T\'', 2, 25, 0, 1, 1, 0, 1),
(766, 'EL04022', 'RELEVO TERMICO 16-25A     ', 2, 25, 0, 2, 0, 0, 1),
(767, 'EL04023', 'RELEVO TERMICO 48-65A     (LRD 33)', 2, 25, 1, 1, 0, 0, 1),
(768, 'EL04024', 'RELEVO TERMICO 30-37A     (LRD 35)', 2, 25, 1, 1, 1, 0, 1),
(769, 'EL04025', 'RELE TELEMECANIQUE RXN41 G11 P7 (220V)', 2, 25, 0, 3, 0, 0, 1),
(770, 'EL04026', 'ZOCALO RXZE 2M 114M', 2, 25, 0, 2, 0, 0, 1),
(771, 'EL04027', 'RELE 8 PINES CIRCULARES (led verde) 24Vcc ', 2, 25, 8, 8, 1, 0, 1),
(772, 'EL04028', 'RELE DE REPUESTO MARCA \'Allen Bradley\' o similar Nºcat 700- TBR24-Voltaje de entrada de socket', 2, 25, 0, 0, 0, 0, 1),
(773, 'EL04029', 'RELE SOBRECARGA SIEMENS 3RU1126-1EB0', 2, 25, 0, 0, 0, 0, 1),
(774, 'EL05001', 'LLAVE TERMICA MERLIN GERIN 1 X C1 A', 2, 26, 1, 1, 0, 0, 1),
(775, 'EL05002', 'LLAVE TERMICA MERLIN GERIN 1 X C2', 2, 26, 3, 2, 1, 0, 1),
(776, 'EL05003', 'LLAVE TERMICA MERLIN GERIN 1 X C4', 2, 26, 0, 0, 0, 0, 1),
(777, 'EL05004', 'LLAVE TERMICA MERLIN GERIN 1 X C6', 2, 26, 0, 0, 0, 0, 1),
(778, 'EL05005', 'LLAVE TERMICA MERLIN GERIN 1 X C10', 2, 26, 0, 0, 0, 0, 1),
(779, 'EL05006', 'LLAVE TERMICA MERLIN GERIN 1 X U10', 2, 26, 0, 0, 0, 0, 1),
(780, 'EL05007', 'LLAVE TERMICA MERLIN GERIN 1 X C25 A', 2, 26, 0, 0, 0, 0, 1),
(781, 'EL05008', 'LLAVE TERMICA MERLIN GERIN 2 X C4', 2, 26, 0, 0, 0, 0, 1),
(782, 'EL05009', 'LLAVE TERMICA MERLIN GERIN 2 X C6', 2, 26, 0, 0, 0, 0, 1),
(783, 'EL05010', 'LLAVE TERMICA MERLIN GERIN 2 X C10', 2, 26, 0, 0, 0, 0, 1),
(784, 'EL05011', 'LLAVE TERMICA MERLIN GERIN 2 X C16', 2, 26, 0, 0, 0, 0, 1),
(785, 'EL05012', 'LLAVE TERMICA MERLIN GERIN 2 X C20', 2, 26, 0, 0, 1, 35, 1),
(786, 'EL05013', 'LLAVE TERMICA MERLIN GERIN 2 X C25', 2, 26, 0, 0, 0, 0, 1),
(787, 'EL05014', 'LLAVE TERMICA MERLIN GERIN 2 X C32', 2, 26, 0, 0, 0, 51, 1),
(788, 'EL05015', 'LLAVE TERMICA MERLIN GERIN 2 X C40', 2, 26, 2, 2, 0, 51, 1),
(789, 'EL05016', 'LLAVE TERMICA MERLIN GERIN 2 X C63', 2, 26, 2, 2, 0, 75, 1),
(790, 'EL05017', 'LLAVE TERMICA MERLIN GERIN 3 X C4', 2, 26, 2, 0, 0, 0, 1),
(791, 'EL05018', 'LLAVE TERMICA MERLIN GERIN 3 X C6', 2, 26, 1, 1, 1, 0, 1),
(792, 'EL05019', 'LLAVE TERMICA MERLIN GERIN 3 X C10', 2, 26, 4, 1, 1, 0, 1),
(793, 'EL05020', 'LLAVE TERMICA MERLIN GERIN 3 X D10', 2, 26, 0, 0, 0, 0, 1),
(794, 'EL05021', 'LLAVE TERMICA MERLIN GERIN 3 X C16', 2, 26, 0, 0, 0, 0, 1),
(795, 'EL05022', 'LLAVE TERMICA MERLIN GERIN 3 X C25', 2, 26, 2, 1, 1, 61, 1),
(796, 'EL05023', 'LLAVE TERMICA MERLIN GERIN 3 X C32', 2, 26, 2, 1, 1, 101, 1),
(797, 'EL05024', 'LLAVE TERMICA MERLIN GERIN 3 X C40', 2, 26, 1, 1, 1, 36, 1),
(798, 'EL05025', 'LLAVE TERMICA MERLIN GERIN 3 X C50', 2, 26, 2, 2, 1, 60, 1),
(799, 'EL05026', 'LLAVE TERMICA MERLIN GERIN 3 X C60 N', 2, 26, 1, 0, 0, 0, 0),
(800, 'EL05027', 'LLAVE TERMICA MERLIN GERIN 3 X C63', 2, 26, 2, 2, 1, 101, 1),
(801, 'EL05028', 'LLAVE TERMICA MERLIN GERIN 3 x C100', 2, 26, 1, 1, 0, 0, 1),
(802, 'EL05029', 'LLAVE TERMICA MERLIN GERIN 3 X C120 N', 2, 26, 2, 2, 0, 332, 1),
(803, 'EL05030', 'LLAVE TERMICA MERLIN GERIN 4 X C25', 2, 26, 0, 0, 0, 0, 1),
(804, 'EL05031', 'LLAVE TERMICA MERLIN GERIN 3 X D63', 2, 26, 0, 0, 0, 0, 1),
(805, 'EL05032', 'LLAVE TERMICA MERLIN GERIN 2 X C2', 2, 26, 0, 0, 0, 0, 1),
(806, 'EL05033', 'LLAVE TERMICA MERLIN GERIN 4 X C100', 2, 26, 1, 1, 0, 417, 1),
(807, 'EL05034', 'LLAVE TERMICA MERLIN GERIN 4 X C63', 2, 26, 1, 1, 0, 200, 1),
(808, 'EL05035', 'LLAVE TERMICA MERLIN GERIN 2 X 2 6KA', 2, 26, 0, 0, 0, 0, 1),
(809, 'EL06001', 'LAMPARA LED ORIENTABLE PARA ALUMBRADO PUBLICO 30W - E40', 2, 27, 0, 4, 1, 0, 1),
(810, 'EL06002', 'LAMPARA LED (GALPONERA) 30W - E27', 2, 27, 0, 4, 1, 0, 1),
(811, 'EL06003', 'TUBO FLUORESCENTE 110W', 2, 27, 1, 0, 0, 0, 1),
(812, 'EL06004', 'REFLECTOR LED 50W', 2, 27, 0, 5, 1, 0, 1),
(813, 'EL06005', 'TUBO LED FLUORECENTE 18W  - 120cm', 2, 27, 7, 20, 1, 0, 1),
(814, 'EL06006', 'ADAPTADOR E27 A E40', 2, 27, 0, 12, 1, 0, 1),
(815, 'EL06007', 'LAMPARA LED (GALPONERA) 90W - E40', 2, 27, 0, 3, 1, 0, 1),
(816, 'EL06008', 'LUMINARIA PUBLICA LED 150W IP65', 2, 27, 2, 2, 1, 0, 1),
(817, 'EL06009', 'TUBO LED 8W - T8 600mm', 2, 27, 3, 2, 1, 0, 1),
(818, 'EL06010', 'REFLECTOR EXT 250/400W  COMPLETO', 2, 27, 0, 0, 0, 0, 1),
(819, 'EL06011', 'REFLECTOR EXT. 2000W S/LAMPARA NI VIDRIO', 2, 27, 0, 0, 0, 0, 1),
(820, 'EL06012', 'LAMPAR DICROCA NEGRA CON CABLE Y ENCHUFE MACHO ', 2, 27, 0, 0, 0, 0, 0),
(821, 'EL06013', 'TORTUGA 100W OVALADA ', 2, 27, 0, 0, 0, 0, 0),
(822, 'EL06014', 'TORTUGA REDONDA 100 W BLANCA', 2, 27, 0, 0, 0, 0, 1),
(823, 'EL06015', 'LAMPARA DE EMERGENCIA', 2, 27, 0, 0, 0, 0, 1),
(824, 'EL06016', 'TORTUGA ANTIEXPLOSIVO', 2, 27, 0, 0, 0, 0, 0),
(825, 'EL06017', 'ARTEFACTO FLUORECENTE 20 W ', 2, 27, 0, 0, 0, 0, 1),
(826, 'EL06018', 'ARTEFACTO DE ALUMBRADO PUBLICO ', 2, 27, 0, 0, 0, 0, 1),
(827, 'EL06019', 'LAMPARA BAJO CONSUMO 105W', 2, 27, 0, 0, 0, 0, 1),
(828, 'EL06020', 'LAMPARA BAJO CONSUMO 25W', 2, 27, 0, 0, 0, 0, 1),
(829, 'EL06021', 'LAMPARA CUARZO HALOGENA  500 W', 2, 27, 0, 0, 0, 0, 0),
(830, 'EL06022', 'LAMPARA CUARZO HALOGENA 250 W', 2, 27, 0, 0, 0, 0, 0),
(831, 'EL06023', 'LAMPARA DE LINTERNA EVEREADY', 2, 27, 0, 0, 0, 0, 0),
(832, 'EL06024', 'LAMPARA DE SODIO 70W', 2, 27, 0, 0, 0, 0, 0),
(833, 'EL06025', 'LAMPARA H 12V 3,6V 0,85A XENON', 2, 27, 0, 0, 0, 0, 0),
(834, 'EL06026', 'LAMPARA HALOGEN 1500w 220V', 2, 27, 0, 0, 0, 0, 0),
(835, 'EL06027', 'LAMPARA MERCURIO HALOGENADO 150W', 2, 27, 0, 0, 0, 0, 0),
(836, 'EL06028', 'LAMPARA HALOGEN 150w HIT-ULTRALIFE', 2, 27, 0, 0, 0, 0, 0),
(837, 'EL06029', 'LAMPARA MERCURIO TUBULAR TIPO LU 250/T/40 250W', 2, 27, 0, 0, 0, 0, 0),
(838, 'EL06030', 'LAMPARA MEZCLADORA 160 W ROSCA E40', 2, 27, 0, 0, 0, 0, 0),
(839, 'EL06031', 'LAMPARA MEZCLADORA 250 W ROSCA E40', 2, 27, 0, 0, 0, 0, 0),
(840, 'EL06032', 'LAMPARA VAPOR SODIO 150W  TUBULAR', 2, 27, 0, 0, 0, 0, 0),
(841, 'EL06033', 'LAMPARA MERCURIO HALOGENADO 250W TUBULAR', 2, 27, 0, 0, 0, 0, 0),
(842, 'EL06034', 'LAMPARA VAPOR SODIO 400W Tubular', 2, 27, 0, 0, 0, 0, 0),
(843, 'EL06035', 'LAMPARAS  CLARA DE 100W', 2, 27, 0, 0, 0, 0, 0),
(844, 'EL06036', 'LAMPARAS HALOGENA de 150W', 2, 27, 0, 0, 0, 0, 0),
(845, 'EL06037', 'LAMPARAS HALOGENA DE 70W HIT ULTRALIFE', 2, 27, 0, 0, 0, 0, 0),
(846, 'EL06038', 'LAMPARAS DE MERCURIO HALO 400W TUBULAR', 2, 27, 0, 0, 0, 0, 0),
(847, 'EL06039', 'LAMPARAS VAPOR DE MERCURIO 250W ', 2, 27, 0, 0, 0, 0, 0),
(848, 'EL06040', 'LUMINARIA AUTONOMA ATOMLUX 20W', 2, 27, 0, 0, 0, 0, 1),
(849, 'EL06041', 'PILOTO DIRECTO 220 Vac C/LAMPARA AMARILLO 20A', 2, 27, 0, 4, 0, 0, 1),
(850, 'EL06042', 'PILOTO DIRECTO 220Vac C/ LAMPARA ROJO 20A', 2, 27, 0, 4, 0, 0, 1),
(851, 'EL06043', 'PILOTO DIRECTO 220Vac C/ LAMPARA VERDE 20A', 2, 27, 0, 4, 0, 0, 1),
(852, 'EL06044', 'PLAFONES MAREA 36A', 2, 27, 0, 0, 0, 0, 0),
(853, 'EL06045', 'PROYECTOR HALOGENO 500W - 300W (REFLECTORES)', 2, 27, 0, 0, 0, 0, 0),
(854, 'EL06046', 'AISLADOR CERAMICO -25A', 2, 27, 11, 0, 0, 0, 1),
(855, 'EL06047', 'LAMPARA MEZCLADORA 160 W  E27 (ROSCA CHICA)', 2, 27, 0, 0, 0, 0, 0),
(856, 'EL06048', 'LAMPARA DE SODIO ALTA PRESION E40 400W MARCA ALIO', 2, 27, 0, 0, 0, 0, 0),
(857, 'EL06049', 'LAMPARA DE MERCURIO HALOGENADO 2000W', 2, 27, 0, 0, 0, 0, 0),
(858, 'EL06050', 'PORTALAMPARA GOLEAT C/CAS  5/8', 2, 27, 0, 3, 0, 0, 1),
(859, 'EL06051', 'LAMPARA 12 VOLT P / CAMIONETA', 2, 27, 0, 0, 0, 0, 0),
(860, 'EL06052', 'LAMPARA DE SODIO ALTA PRES 70W, E40', 2, 27, 0, 0, 0, 0, 0),
(861, 'EL06053', 'PILOTO ROJO LED 24Vcc', 2, 27, 4, 5, 1, 0, 1),
(862, 'EL06054', 'PILOTO VERDE LED 24Vcc', 2, 27, 5, 4, 0, 0, 1),
(863, 'EL06055', 'LAMPARA A ROSCA 3,8Volt  0,3A ', 2, 27, 38, 0, 0, 0, 0),
(864, 'EL06056', 'PROYECTOR HALOGENO 250W (REFLECTORES)', 2, 27, 0, 0, 0, 0, 0),
(865, 'EL06057', 'LAMPARA VAPOR SODIO 250W- ROSCA GOLIAT TUBULAR', 2, 27, 0, 0, 0, 0, 0),
(866, 'EL06058', 'LAMPARA 24 V 220/  3A PARA PLANTA 23', 2, 27, 9, 0, 0, 0, 1),
(867, 'EL06059', 'LAMPARA PARA LINTERNA (PLANTA) ROSCA BALLONE 7,2V', 2, 27, 16, 0, 0, 0, 1),
(868, 'EL06060', 'BALASTOS P/LAMP MERCURIO ALT PRESION 250W', 2, 27, 0, 0, 0, 0, 0),
(869, 'EL06061', 'BALASTOS P/MERCURIO ALTA PRESION 125W  EXTRATONIC', 2, 27, 0, 0, 0, 0, 0),
(870, 'EL06062', 'BALASTOS P/VAPOR DE MERCURIO 250W ', 2, 27, 0, 0, 0, 0, 0),
(871, 'EL06063', 'BALASTO P/ FLUORESCENTES 36/40 W', 2, 27, 0, 0, 0, 0, 0),
(872, 'EL06064', 'BALASTO P/VAPOR DE SODIO ALTA PRES  400W AUX. EXT', 2, 27, 0, 0, 0, 0, 0),
(873, 'EL06065', 'BALASTO P/LAMPARA DE SODIO DE 250 W', 2, 27, 0, 0, 0, 0, 0),
(874, 'EL06066', 'BALASTO LAMP MERCURIO HALOGENADO DE 2000W', 2, 27, 0, 0, 0, 0, 0),
(875, 'EL06067', 'BALASTO P/VAPOR DE SODIO ALTA PRESION 150w WANCO', 2, 27, 0, 0, 0, 0, 0),
(876, 'EL06068', 'BALASTO MERCURIO HALOJENADO 150W', 2, 27, 0, 0, 0, 0, 0),
(877, 'EL06069', 'BALASTO VAPOR DE MERCURIO ALTA PRECION 250w', 2, 27, 0, 0, 0, 0, 0),
(878, 'EL06070', 'BALASTO VAPOR DE MERCURIO ALTA PRECION 125W WANCO', 2, 27, 0, 0, 0, 0, 0),
(879, 'EL06071', 'ARRANCADORES PARA TUBOS FLUORESCENTES', 2, 27, 0, 0, 0, 0, 0),
(880, 'EL06072', 'BALASTO 2 X 36 W ELECTRONICO', 2, 27, 0, 0, 0, 0, 0),
(881, 'EL06073', 'IGNITOR PARA LAMPARA DE SODIO 400W Y MERCURIO 250 -400 W', 2, 27, 6, 0, 0, 0, 1),
(882, 'EL06074', 'BALASTO P/ FLUORESCENTES 18W', 2, 27, 5, 4, 0, 0, 1),
(883, 'EL06075', 'TERMOSTATO UNIPOLAR 80 GRADOS RECO', 2, 27, 0, 3, 1, 0, 1),
(884, 'EL06076', 'LAMPARA PARA REFLECTOR DE 160W', 2, 27, 0, 0, 0, 0, 0),
(885, 'EL06077', 'LAMPARA PARA REFLECTOR DE 250W', 2, 27, 0, 0, 0, 0, 0),
(886, 'EL06078', 'LAMPARA PARA REFLECTOR DE 400W', 2, 27, 0, 0, 0, 0, 0),
(887, 'EL06079', 'LAMPARA 9W ', 2, 27, 0, 0, 0, 0, 0),
(888, 'EL06080', 'CAPACITOR LEYDEN 25 Mf descarga ', 2, 27, 0, 0, 0, 0, 1),
(889, 'EL06081', 'LAMPARA MEZCLADORA 250 W  E27 (ROSCA CHICA)', 2, 27, 0, 0, 0, 0, 0),
(890, 'EL06082', 'CAPACITOR 33uF 250 VCA', 2, 27, 0, 0, 0, 0, 1),
(891, 'EL06083', 'LAMPARA VAJO CONSUMO MINI ESSENT 11W ', 2, 27, 0, 0, 0, 0, 0),
(892, 'EL06084', 'TUBOS LED EQUIVALENTE A 36W (1102mm)', 2, 27, 0, 10, 0, 0, 1),
(893, 'EL07001', 'BORNERA 323', 2, 28, 0, 0, 0, 0, 1),
(894, 'EL07002', 'BORNERA 324', 2, 28, 0, 0, 0, 0, 1),
(895, 'EL07003', 'BORNERA 10', 2, 28, 0, 0, 0, 0, 1),
(896, 'EL07004', 'BORNERA 302', 2, 28, 12, 0, 0, 0, 1),
(897, 'EL07005', 'BORNE ZCTP 250 120mm', 2, 28, 0, 0, 0, 0, 1),
(898, 'EL07006', 'BORNERA FLEXIBLE EKM 25', 2, 28, 0, 0, 0, 0, 1),
(899, 'EL07007', 'BORNERA FLEXIBLE EK 35/35', 2, 28, 0, 0, 0, 0, 1),
(900, 'EL07008', 'BORNERA FLEXIBLE RQN 2,5', 2, 28, 0, 0, 0, 0, 1),
(901, 'EL07009', 'PRENSACABLES DE NILO 1 1/4\'', 2, 28, 6, 0, 0, 0, 1),
(902, 'EL07010', 'PRENSACABLES DE NILO 1\'', 2, 28, 8, 0, 0, 0, 1),
(903, 'EL07011', 'PRENSACABLES DE NILO 1/2\'', 2, 28, 0, 0, 0, 0, 1),
(904, 'EL07012', 'PRENSACABLES DE NILO 1/4\'', 2, 28, 33, 0, 0, 0, 1),
(905, 'EL07013', 'PRENSACABLES DE NILO 3/4\'', 2, 28, 10, 0, 0, 0, 1),
(906, 'EL07014', 'PRENSACABLES DE NILO 3/8\'', 2, 28, 0, 0, 0, 0, 1),
(907, 'EL07015', 'PRENSACABLES DE NILO 1 1/2\'', 2, 28, 9, 0, 0, 0, 1),
(908, 'EL07016', 'PRENSACABLES DE NILO 2\'', 2, 28, 14, 0, 0, 0, 1),
(909, 'EL07017', 'PRENSACABLE DE NILO PG 11', 2, 28, 0, 0, 0, 0, 1),
(910, 'EL07018', 'PRENSACABLE DE NILO PG 7', 2, 28, 3, 0, 0, 0, 1),
(911, 'EL07019', 'PRENSACABLE DE NILO PG 13,5', 2, 28, 0, 0, 0, 0, 1),
(912, 'EL07020', 'PRENSACABLE DE NILO PG 9', 2, 28, 0, 0, 0, 0, 1),
(913, 'EL07021', 'PRENSACABLE DE NILO PG 48', 2, 28, 0, 0, 0, 0, 1),
(914, 'EL07022', 'PRENSACABLE DE NILO PG 3', 2, 28, 0, 0, 0, 0, 1),
(915, 'EL07023', 'BORNES ST 2,5 ( PHOENIX CONTACT)', 2, 28, 0, 0, 0, 0, 1),
(916, 'EL07024', 'BORNES PUESTA A TIERRA ST6-PE( PHOENIX CONTACT)', 2, 28, 0, 0, 0, 0, 1),
(917, 'EL07025', 'BORNERA CON FUSIBLERA ST4  HESILED (FUS 20MM) ( PHOENIX CONTACT)', 2, 28, 0, 0, 0, 0, 1),
(918, 'EL07026', 'BORNERA P/RIEL DIN DE 2,5 MM2', 2, 28, 0, 0, 0, 0, 1),
(919, 'EL07027', 'BORNERA P/RIEL DIN DE 4 MM2', 2, 28, 0, 0, 0, 0, 1),
(920, 'EL07028', 'BORNERA P/RIEL DIN DE 6 MM2', 2, 28, 6, 0, 0, 0, 1),
(921, 'EL07029', 'BORNERA P/RIEL DIN DE 10 MM2', 2, 28, 6, 0, 0, 0, 1),
(922, 'EL07030', 'BORNERA P/RIEL DIN DE 25 MM2', 2, 28, 3, 0, 0, 0, 1),
(923, 'EL07031', 'BORNERA P/RIEL DIN DE 35 MM2', 2, 28, 1, 0, 0, 0, 1),
(924, 'EL08001', 'ANILLOS PARA IDENTIFICACION DE CONDUCTORES DE 1 a 4 mm2 Numero 0', 2, 29, 0, 0, 0, 0, 0),
(925, 'EL08002', 'ANILLOS PARA IDENTIFICACION DE CONDUCTORES DE 1 a 4 mm2 Numero 1', 2, 29, 0, 0, 0, 0, 0),
(926, 'EL08003', 'ANILLOS PARA IDENTIFICACION DE CONDUCTORES DE 1 a 4 mm2 Numero 2', 2, 29, 0, 0, 0, 0, 0),
(927, 'EL08004', 'ANILLOS PARA IDENTIFICACION DE CONDUCTORES DE 1 a 4 mm2 Numero 3', 2, 29, 0, 0, 0, 0, 0),
(928, 'EL08005', 'ANILLOS PARA IDENTIFICACION DE CONDUCTORES DE 1 a 4 mm2 Numero 4', 2, 29, 0, 0, 0, 0, 0),
(929, 'EL08006', 'ANILLOS PARA IDENTIFICACION DE CONDUCTORES DE 1 a 4 mm2 Numero 5', 2, 29, 0, 0, 0, 0, 0),
(930, 'EL08007', 'ANILLOS PARA IDENTIFICACION DE CONDUCTORES DE 1 a 4 mm2 Numero 6', 2, 29, 0, 0, 0, 0, 0),
(931, 'EL08008', 'ANILLOS PARA IDENTIFICACION DE CONDUCTORES DE 1 a 4 mm2 Numero 7', 2, 29, 0, 0, 0, 0, 0),
(932, 'EL08009', 'ANILLOS PARA IDENTIFICACION DE CONDUCTORES DE 1 a 4 mm2 Numero 8', 2, 29, 0, 0, 0, 0, 0),
(933, 'EL08010', 'ANILLOS PARA IDENTIFICACION DE CONDUCTORES DE 1 a 4 mm2 Numero 9', 2, 29, 0, 0, 0, 0, 0),
(934, 'EL08011', 'TERMINALES 185 mm                                           ', 2, 29, 0, 0, 0, 0, 1),
(935, 'EL08012', 'TERMINALES 240 mm                                           ', 2, 29, 0, 0, 0, 0, 1),
(936, 'EL08013', 'TERMINAL OJAL COBRE ESTAÑADO 4mm', 2, 29, 15, 0, 0, 0, 1),
(937, 'EL08014', 'FOURNAS TERMINAL COBRE 2.5mm. ', 2, 29, 0, 0, 0, 0, 1),
(938, 'EL08015', 'TERMINAL OJAL COBRE ESTAÑADO 10MM 1/4\'', 2, 29, 0, 0, 0, 0, 1),
(939, 'EL08016', 'TERMINALES COBRE ESTAÑADO  6MM 1/4\'', 2, 29, 0, 0, 0, 0, 1),
(940, 'EL08017', 'TERMINALES COBRE ESTAÑADO 16MM 5/16\'', 2, 29, 0, 0, 0, 0, 1),
(941, 'EL08018', 'TERMINALES COBRE ESTAÑADO 25MM 5/16\' ', 2, 29, 0, 0, 0, 0, 1),
(942, 'EL08019', 'TERMINALES COBRE ESTAÑADO 35MM 3/8\'', 2, 29, 57, 0, 0, 0, 1),
(943, 'EL08020', 'TERMINALES COBRE ESTAÑADO 50MM 3/8\'', 2, 29, 0, 0, 0, 0, 1),
(944, 'EL08021', 'TERMINALES COBRE ESTAÑADO 70MM 1/2\'', 2, 29, 0, 0, 0, 0, 1),
(945, 'EL08022', 'TERMINALES COBRE ESTAÑADO 35-10MM ', 2, 29, 0, 0, 0, 0, 1),
(946, 'EL08023', 'TERMINALES COBRE ESTAÑADO  240 mm', 2, 29, 1, 0, 0, 0, 1),
(947, 'EL08024', 'TERMINALES COBRE ESTAÑADO 70-12MM ', 2, 29, 0, 0, 0, 0, 1),
(948, 'EL08025', 'MANGUITOS DE EMPALME DE CABLE 10', 2, 29, 0, 0, 0, 0, 1),
(949, 'EL08026', 'MANGUITOS DE EMPALME DE CABLE 25', 2, 29, 0, 0, 0, 0, 1),
(950, 'EL08027', 'MANGUITOS DE EMPALME DE CABLE 6', 2, 29, 5, 0, 0, 0, 1),
(951, 'EL08028', 'TERMINALES C/LENGUATE P/1,5mm gris', 2, 29, 0, 0, 0, 0, 1),
(952, 'EL08029', 'TERMINALES C/LENGUATE P/2,5mm', 2, 29, 0, 0, 0, 0, 1),
(953, 'EL08030', 'TERMINALES C/LENGUATE P/4mm naranja', 2, 29, 0, 0, 0, 0, 1),
(954, 'EL08031', 'TERMINALES PREAISLADO ROJO 10,0 Modelo A53', 2, 29, 0, 0, 0, 0, 1),
(955, 'EL08032', 'TERMINALES PREAISLADO ROJO A3', 2, 29, 0, 0, 0, 0, 1),
(956, 'EL08033', 'TERMINALES PREAISLADO ROJO A4  22-16 / 1,25-5', 2, 29, 0, 0, 0, 0, 1),
(957, 'EL08034', 'TERMINALES PREAISLADO ROJO A9 22-16 /1,25-22', 2, 29, 11, 0, 0, 0, 1),
(958, 'EL08035', 'TERMINALES PREAISLADO AZUL 2-8L 16-14', 2, 29, 18, 0, 0, 0, 1),
(959, 'EL08036', 'TERMINALES PREAISLADO AZUL 2-5 O 16-14', 2, 29, 0, 0, 0, 0, 1),
(960, 'EL08037', 'TERMINALES PREAISLADO AZULB4', 2, 29, 0, 0, 0, 0, 1),
(961, 'EL08038', 'TERMINALES PREAISLADO AZUL B9 16-14 / 2-3,5L', 2, 29, 0, 0, 0, 0, 1),
(962, 'EL08039', 'TERMINALES PREAISLADO AMARILLO 2,6-6,5 ', 2, 29, 0, 0, 0, 0, 1),
(963, 'EL08040', 'TERMINALES PREAISLADO AMARILLO C4 12-10 / 5,5-6', 2, 29, 0, 0, 0, 0, 1),
(964, 'EL08041', 'TERMINALES PREAISLADO AMARILLO C12 12-10 / 5,5-8', 2, 29, 0, 0, 0, 0, 1),
(965, 'EL08042', 'TERMINALES SC25-8', 2, 29, 0, 0, 0, 0, 1),
(966, 'EL08043', 'TERMINALES SC25-10', 2, 29, 0, 0, 0, 0, 1),
(967, 'EL08044', 'TERMINALES 95/2 6/8\'', 2, 29, 0, 0, 0, 0, 1),
(968, 'EL08045', 'TERMINALES 5/8 LCT - 95/2', 2, 29, 0, 0, 0, 0, 1),
(969, 'EL08046', 'TERMINAL OJAL 95 MM', 2, 29, 0, 0, 0, 0, 1),
(970, 'EL08047', 'TERMINALES 35-12MM', 2, 29, 0, 0, 0, 0, 1),
(971, 'EL08048', 'ESTAÑO 1,0 mm 250g', 2, 29, 0, 0, 0, 0, 1),
(972, 'EL08049', 'EMPALME BOTELLA RECTO 3M (4x1/4-6)', 2, 29, 0, 0, 0, 0, 1),
(973, 'EL08050', 'MANGUITOS DE EMPALME DE CABLE 70mm', 2, 29, 0, 0, 0, 0, 1),
(974, 'EL08051', 'EMPALME AUTOCONTRAIBLE 13 A 25,4 mm Marca 3M', 2, 29, 0, 0, 0, 0, 1),
(975, 'EL08052', 'MANGUITOS DE EMPALME DE CABLE 95 mm', 2, 29, 6, 0, 0, 0, 1),
(976, 'EL08053', 'PUNTERA PRESAISLADA 4mm', 2, 29, 104, 0, 0, 0, 1),
(977, 'EL08054', 'PUNTERA PRESAISLADA 2.5mm', 2, 29, 0, 0, 0, 0, 1),
(978, 'EL09001', 'CABLE TIERRA 1X6 X mt', 2, 30, 0, 0, 0, 0, 1),
(979, 'EL09002', 'CABLE ERPLA TPR  1X1 X mt NEGRO', 2, 30, 0, 0, 0, 0, 1),
(980, 'EL09003', 'CABLE  ERPLA TPR  3X1,5 X mt', 2, 30, 0, 0, 0, 0, 1),
(981, 'EL09004', 'CABLE ERPLA TPR 2X 1,5X mt', 2, 30, 0, 0, 0, 0, 1),
(982, 'EL09005', 'CABLE ERPLA TPR 2X 1 X mt', 2, 30, 0, 0, 0, 0, 1),
(983, 'EL09006', 'CABLE ERPLA TPR  7X1,5 X mt', 2, 30, 0, 0, 0, 0, 1),
(984, 'EL09007', 'CABLE ERPLA TPR  4X4 X mt', 2, 30, 0, 0, 0, 0, 1),
(985, 'EL09008', 'CABLE REBESTIDO 2X1.8 mt', 2, 30, 0, 0, 0, 0, 1),
(986, 'EL09009', 'CABLE ERPLA TPR  4X2.5 Xmt', 2, 30, 0, 0, 0, 0, 1),
(987, 'EL09010', 'CABLE SUBTERRAÑO 4x 4 mm2 11KV', 2, 30, 0, 0, 0, 0, 1),
(988, 'EL09011', 'CABLE ERPLA TPR  3 X 2 X MTS', 2, 30, 0, 0, 0, 0, 1),
(989, 'EL09012', 'CABLE  ERPLA DESNUDO 1X50mm ', 2, 30, 0, 0, 0, 0, 1),
(990, 'EL09013', 'TOMACABLE P/JABALINA 5/8 METAL  CE', 2, 30, 0, 0, 0, 0, 1),
(991, 'EL09014', 'JABALINA L 16 5/8X200mmX METAL CE', 2, 30, 0, 0, 0, 0, 1),
(992, 'EL09015', 'CABLE UTP 4 24MP  x mt', 2, 30, 0, 0, 0, 0, 1),
(993, 'EL09016', 'CABLE UTP CATEGORIA 6', 3, 30, 0, 0, 0, 0, 1),
(994, 'EL09017', 'CABLE A TIERRA 1X1 X MTS ', 2, 30, 0, 0, 0, 0, 1),
(995, 'EL09018', 'CABLE ERPLA TPR 3X2,5 X MTS', 2, 30, 20, 0, 0, 0, 1),
(996, 'EL09019', 'CABLE C-20-CHICOTE 2 HT', 2, 30, 0, 0, 0, 0, 1),
(997, 'EL09021', 'CABLE 4PR 24ANG X mts', 2, 30, 0, 0, 0, 0, 1),
(998, 'EL09022', 'CABLE SUBTERRANEO 1,1KV 4X 15 mm x mts ', 2, 30, 0, 0, 0, 0, 1),
(999, 'EL09023', 'CABLE SUBTERRANEO 1,1KV 1X 16 mm x mts ', 2, 30, 0, 0, 0, 0, 1),
(1000, 'EL09024', 'CABLE SUBTERRANEO 1,1KV 1X 25 mm x mts ', 2, 30, 0, 0, 0, 0, 1),
(1001, 'EL09025', 'CABLE UNIPOLAR 1X1 2,5 CELESTE X mts', 2, 30, 0, 0, 0, 0, 1),
(1002, 'EL09026', 'CABLE MAYADO 0,80 X mts', 2, 30, 47, 0, 0, 0, 1),
(1003, 'EL09027', 'CONDUCTOR FLEXIBLE UNIPOLAR 2,5 mm2 x mts', 2, 30, 0, 0, 0, 0, 1),
(1004, 'EL09028', 'BARRA DE COBRE X mts', 2, 30, 0, 0, 0, 0, 1),
(1005, 'EL09029', 'RESISTENCIA C/CABEZAL 2”, LARGO 1070MM., 3KW,    X 3  380V  ACERO INOX', 2, 30, 6, 3, 1, 254, 1),
(1006, 'EL09030', 'SOPORTE COBRE 550mm', 2, 30, 0, 0, 0, 0, 1),
(1007, 'EL09031', 'SOPORTE COBRE 140mm', 2, 30, 0, 0, 0, 0, 1),
(1008, 'EL09032', 'PLANCHUELAS DE COBRE 580mm x 50 mm', 2, 30, 0, 0, 0, 0, 1),
(1009, 'EL09033', 'PLANCHUELAS DE COBRE 500mm x 50 mm', 2, 30, 0, 0, 0, 0, 1),
(1010, 'EL09034', 'TOMACABLE NORMALIZADO T4', 2, 30, 0, 0, 0, 0, 1),
(1011, 'EL09035', 'CABLE MAYADO 3X0,80 ', 2, 30, 30, 0, 0, 0, 1),
(1012, 'EL09036', 'CABLE SUBTERRANEO 95MM', 2, 30, 0, 0, 0, 0, 1),
(1013, 'EL09037', 'CABLE UTP CAT 5E', 2, 30, 31, 0, 0, 0, 1),
(1014, 'EL10001', 'MODULO PROTECTOR EQUIPO TELEFONICO', 2, 31, 0, 0, 0, 0, 0),
(1015, 'EL10002', 'CAJA P/TOMA TELEFONO', 2, 31, 2, 0, 0, 0, 1),
(1016, 'EL11001', 'VENTILADOR PLASTICOS DIAM 235X34', 2, 32, 3, 0, 0, 0, 1),
(1017, 'EL11002', 'VENTILADOR PLASTICO 147 X 16', 2, 32, 0, 0, 0, 0, 1),
(1018, 'EL11003', 'VENTILADOR PLASTICOS 137x14', 2, 32, 0, 0, 0, 0, 1),
(1019, 'EL11004', 'VENTILADOR PLASTICOS 143x16', 2, 32, 0, 0, 0, 0, 1),
(1020, 'EL11005', 'VENTILADOR PLASTICOS 280x45', 2, 32, 0, 0, 0, 0, 1),
(1021, 'EL11006', 'CULER SUNON dl 200A  2123X BL 220-240V- 50/60HZ 0,14A', 2, 32, 0, 0, 0, 0, 1),
(1022, 'EL11007', 'COOLER FULLTECH Modelo UF 12A23 o COOLER DE 6\'', 2, 32, 0, 0, 0, 0, 1),
(1023, 'EL11008', 'VENTILADOR PLASTICO 225 X 37 P/MOTOR CALDERA', 2, 32, 0, 1, 0, 0, 1),
(1024, 'EL11009', 'VENTILADOR PLASTICO 225 X 42', 2, 32, 2, 1, 0, 0, 1),
(1025, 'EL11010', 'VENTILADOR PLASTICO Ø 190 X Ø 30 mm EJE ESTRIADO', 2, 32, 0, 1, 0, 0, 1),
(1026, 'EL11011', 'VENTILADOR PLASTICO Ø 235 X Ø 40 mm', 2, 32, 1, 1, 0, 0, 1),
(1027, 'EL12001', 'BANDEJA  ACANALADA PVC 30X50', 2, 33, 0, 0, 0, 0, 1),
(1028, 'EL12002', 'CABLE CANAL 20 X 10 ZOLOA X MTS ', 2, 33, 0, 0, 0, 0, 1),
(1029, 'EL12003', 'CABLE CANAL 40X30 X 2 MTS ', 2, 33, 0, 0, 0, 0, 1),
(1030, 'EL12004', 'CABLE CANAL 40 X 16 ZOLOA X MTS ', 2, 33, 0, 0, 0, 0, 1),
(1031, 'EL12005', 'CAÑO RIGIDO 25 MM X CAÑO DE 3 MTS', 2, 33, 0, 0, 0, 0, 1),
(1032, 'EL12006', 'CODO 90 RIGIDO 25', 2, 33, 0, 0, 0, 0, 1),
(1033, 'EL12007', 'CONECTORES T 3/4\' BSP 2 BOCAS', 2, 33, 0, 0, 0, 0, 1),
(1034, 'EL12008', 'CONECTORES EPOXI RECTO 3/4', 2, 33, 9, 0, 0, 0, 1),
(1035, 'EL12009', 'CONECTORES  RECTO 1/2\'', 2, 33, 0, 0, 0, 0, 1),
(1036, 'EL12010', 'CONECTORES T 1/2\' BSP RECTO 3 BOCAS', 2, 33, 0, 0, 0, 0, 1),
(1037, 'EL12011', 'CONECTORES T 1¨ BSP 4 BOCAS', 2, 33, 0, 0, 0, 0, 1),
(1038, 'EL12012', 'CURVA 90º PERFORADA GALV. (EPOXI)  50mm.', 2, 33, 0, 0, 0, 0, 1),
(1039, 'EL12013', 'CURVA RIGIDO 20MM', 2, 33, 0, 0, 0, 0, 1),
(1040, 'EL12014', 'CURVA RIGIDO 25MM ', 2, 33, 0, 0, 0, 0, 1),
(1041, 'EL12015', 'CURVA VERT.PERFORADA  GALV. (EPOXI)  50mm.', 2, 33, 0, 0, 0, 0, 1),
(1042, 'EL12016', 'GRAMPA RIGIDA 20MM', 2, 33, 0, 0, 0, 0, 1),
(1043, 'EL12017', 'GRAMPA RIGIDA 25MM', 2, 33, 0, 0, 0, 0, 1),
(1044, 'EL12018', 'TUERCAS 1/4\' AC.INOX P/BANDEJAS Y TORNILLOS ', 2, 33, 0, 0, 0, 0, 1),
(1045, 'EL12019', 'UNION  P/CAÑO RIGIDO 20MM', 2, 33, 0, 0, 0, 0, 1),
(1046, 'EL12020', 'UNION  P/CAÑO RIGIDO 25MM', 2, 33, 0, 0, 0, 0, 1),
(1047, 'EL12021', 'UNION TEE PERFORADA GALV. (EPOXI)  50mm.', 2, 33, 0, 0, 0, 0, 1),
(1048, 'EL12022', 'CAÑO CANAL 20X2X20', 2, 33, 0, 0, 0, 0, 1),
(1049, 'EL12023', 'CAÑO RIGIDO 20 MM X CAÑO DE 3 MTS', 2, 33, 0, 0, 0, 0, 1),
(1050, 'EL12024', 'RIEL DIN ranurado x mts', 2, 33, 0, 0, 0, 0, 1),
(1051, 'EL12025', 'UNION  COBRE ESTAÑADO 50MM', 2, 33, 0, 0, 0, 0, 1),
(1052, 'EL12026', 'CONECTORES  RIGIDO  IP44 CAJA/ CAÑO  Ø 25', 2, 33, 9, 0, 0, 0, 1),
(1053, 'EL12027', 'CONECTOR GOMA CAJA/CAÑO Ø 25', 2, 33, 19, 0, 0, 0, 1),
(1054, 'EL13001', 'FICHA HEMBRA 220V P/ 3 PATAS PLANAS', 2, 34, 0, 0, 0, 0, 1),
(1055, 'EL13002', 'FICHA MACHO 220V, 3 PATAS PLANAS  ', 2, 34, 0, 0, 0, 0, 1),
(1056, 'EL13003', 'CAJA PORTA BASTIDOR BLANCO  ', 2, 34, 0, 0, 0, 0, 1),
(1057, 'EL13004', 'CAJA TOMA SCHUCO 16A', 2, 34, 0, 0, 0, 0, 1),
(1058, 'EL13005', 'EXTERIOR PUNTO DE 3 CIOCCA', 2, 34, 0, 0, 0, 0, 1),
(1059, 'EL13006', 'FICHA HEMBRA P/ CPU', 2, 34, 0, 0, 0, 0, 0),
(1060, 'EL13007', 'FICHA 16A 380/440 3 PTF', 2, 34, 0, 0, 0, 0, 1),
(1061, 'EL13008', 'FICHA MACHO TIPO STECK P/PROLG  3P+T 32A 380/440V', 2, 34, 1, 0, 0, 0, 1),
(1062, 'EL13009', 'FICHA TIPO STECK PROLO.HEMBRA 32A 380/440V 3P+N+T', 2, 34, 0, 0, 0, 0, 1),
(1063, 'EL13010', 'FICHA BASE TIPO STECK HEMBRA 16A  200/250V 2P+T', 2, 34, 0, 0, 0, 0, 1),
(1064, 'EL13011', 'FICHA HEMBRA P/TELEFONO', 2, 34, 0, 0, 0, 0, 1),
(1065, 'EL13012', 'FICHA MACHO TOMA 32A / 380V RIORO', 2, 34, 0, 0, 0, 0, 1),
(1066, 'EL13013', 'FICHA HEMBRA CALEFON ELECTRICO', 2, 34, 0, 0, 0, 0, 1),
(1067, 'EL13014', 'FICHA MACHO BIPOLAR PLASANAVI 10A', 2, 34, 0, 0, 0, 0, 1),
(1068, 'EL13015', 'FICHA MACHO RJ 45 8 PIN', 2, 34, 0, 0, 0, 0, 1),
(1069, 'EL13016', 'FICHA MACHO RJ 45 6 PIN', 2, 34, 0, 0, 0, 0, 0),
(1070, 'EL13017', 'FICHA MACHO RJ 45 4 PIN', 2, 34, 0, 0, 0, 0, 0),
(1071, 'EL13018', 'FICHA MACHO RJ11', 2, 34, 0, 0, 0, 0, 1),
(1072, 'EL13019', 'FICHA TIPO STECK PROLO.HEMBRA 2P+T 16A 200/250V', 2, 34, 0, 0, 0, 0, 1),
(1073, 'EL13020', 'FICHA TIPO STECK PROLO.HEMBRA 3P+T 10A 200/250V', 2, 34, 0, 0, 0, 0, 1),
(1074, 'EL13021', 'FICHA TIPO STECK PROLO.HEMBRA 3P+T 32A 380/440V', 2, 34, 3, 0, 0, 0, 1),
(1075, 'EL13022', 'FOQUITOS 24V 4W', 2, 34, 0, 0, 0, 0, 0),
(1076, 'EL13023', 'FOQUITOS 4.8V 0.5A', 2, 34, 0, 0, 0, 0, 0),
(1077, 'EL13024', 'LLAVE 1 TOMA SOMA ', 2, 34, 0, 0, 0, 0, 0),
(1078, 'EL13025', 'LLAVE UN PUNTO Y TOMA ', 2, 34, 0, 0, 0, 0, 0),
(1079, 'EL13026', 'MODULO CITE TOMA BLANCO PLASNAVI', 2, 34, 0, 0, 0, 0, 0),
(1080, 'EL13027', 'MODULO TOMACORR + TIERRA 10A', 2, 34, 0, 0, 0, 0, 0),
(1081, 'EL13028', 'TAPA BASTIDOR 3 MOD. C/MAR', 2, 34, 0, 0, 0, 0, 0),
(1082, 'EL13029', 'CAJA PATA TOMA EXTERIOR', 2, 34, 0, 0, 0, 0, 0),
(1083, 'EL13030', 'TOMA  DE SUPERFICIE  3X32A ', 2, 34, 0, 0, 0, 0, 1),
(1084, 'EL13031', 'TOMA  EXT  2 CIOCCA  MULTIPLES', 2, 34, 0, 0, 0, 0, 1),
(1085, 'EL13032', 'TOMA TIPO STECK P/EMBUTIR 3P+T 16A', 2, 34, 0, 0, 0, 0, 1),
(1086, 'EL13033', 'TOMA TIPO STECK P/EMBUTIR 3P+T 32A', 2, 34, 6, 0, 0, 0, 1),
(1087, 'EL13034', 'TOMA EXTERIOR 3P SIMPLE 10 A ', 2, 34, 0, 0, 0, 0, 1),
(1088, 'EL13035', 'TOMA EXTEROR DOBLE 3P  10A ', 2, 34, 0, 0, 0, 0, 1),
(1089, 'EL13036', 'INTERUCTOR DE 20A 380V DE DOS POSICION', 2, 34, 1, 0, 0, 0, 1),
(1090, 'EL13037', 'TAPAS PLASTICA REDONDA', 2, 34, 6, 0, 0, 0, 1),
(1091, 'EL13038', 'GABINETE 300X300X180 ESTANCO', 2, 34, 0, 0, 0, 0, 1),
(1092, 'EL13039', 'GABINETE C332', 2, 34, 0, 0, 0, 0, 1),
(1093, 'EL13040', 'GABINETE PARA HF', 2, 34, 0, 0, 0, 0, 1),
(1094, 'EL13041', 'GABINETE 120 X 138', 2, 34, 0, 0, 0, 0, 1),
(1095, 'EL13042', 'GABINETE 360X360X171', 2, 34, 0, 0, 0, 0, 1),
(1096, 'EL13043', 'GABINETE ESTANCO 450X450X225 NOLLBOX', 2, 34, 0, 0, 0, 0, 1),
(1097, 'EL13044', 'BASE DE SUPERFICIE 3 MODULOS COLOR BLANCO', 2, 34, 0, 0, 0, 0, 1),
(1098, 'EL13045', 'FICHA TIPO STECK 2P+T 16AMP 220/250V', 2, 34, 0, 0, 0, 0, 1),
(1099, 'EL13046', 'TOMA TIPO STECK 3P  16AMP', 2, 34, 0, 0, 0, 0, 1),
(1100, 'EL13047', 'MODULO TAPON BLANCO', 2, 34, 0, 0, 0, 0, 0),
(1101, 'EL13048', 'FICHA MACHO P/PC', 2, 34, 0, 0, 0, 0, 1),
(1102, 'EL13049', 'CONECTOR HEMBRA DB9 CON TAPAS PLASTICAS', 2, 34, 2, 0, 0, 0, 1),
(1103, 'EL13050', 'TOMA TIPO STECK EMBUTIR 3P+N+T 32A  380/440V', 2, 34, 1, 0, 0, 0, 1),
(1104, 'EL13051', 'TOMA TIPO STECK 2P+T  16AMP P/EMBUTIR', 2, 34, 6, 0, 0, 0, 1),
(1105, 'EL13052', 'GABINETE 270X270X171 ESTANCO', 2, 34, 0, 0, 0, 0, 1),
(1106, 'EL13053', 'GABINETE 160X160', 2, 34, 0, 0, 0, 0, 1),
(1107, 'EL13054', 'GABINETE PLASTICO 300X300X150MM', 2, 34, 0, 0, 0, 0, 1),
(1108, 'EL14001', 'ZOCALO PARA FLUORESCENTES          JUEGO RICHI', 2, 35, 0, 0, 0, 0, 1),
(1109, 'EL14002', 'ZOCALO A.E.A. SR2P - 05 (PARA RELE 8 PINES)', 2, 35, 8, 0, 0, 0, 1),
(1110, 'EL14003', 'ZOCALOS P/TUBO CIRCULAR', 2, 35, 0, 0, 0, 0, 1),
(1111, 'EL14004', 'ZOCALO PARA SERIE 55 RIEL DIN', 2, 35, 0, 0, 0, 0, 1),
(1112, 'EL14005', 'ZOCALO  P/FOTOCELULA Z100', 2, 35, 3, 3, 0, 0, 1),
(1113, 'EL14006', 'MOBILE RACK P/ PC', 2, 35, 0, 0, 0, 0, 0),
(1114, 'EL15001', 'TRASMISOR DE PRESIOM FOX BORO 16P10-022', 2, 36, 2, 0, 0, 0, 1),
(1115, 'EL15002', 'TRANSMISOR DE PRESION FOXBORO MOD16910-022', 2, 36, 0, 0, 0, 0, 1),
(1116, 'EL15003', 'ARRANCADOR SUAVE SSW05 MAR WEG', 2, 36, 0, 1, 1, 0, 1),
(1117, 'EL15004', 'INTERRUPTOR FLOTANTE P/NIVEL TIPO BOYA', 2, 36, 2, 2, 1, 0, 1),
(1118, 'EL15005', 'TRANSFORMADOR 220 12V/ 50W', 2, 36, 1, 0, 0, 0, 1),
(1119, 'EL15006', 'TRANSFORMADOR CLASE 05 A400-5 12V 50W 220V ', 2, 36, 0, 0, 0, 0, 1),
(1120, 'EL15007', 'TRANSFORMADOR CLASE 05 A500-5 12V 50W 220V ', 2, 36, 0, 0, 0, 0, 1),
(1121, 'EL15008', 'INTERRUPTOR AUTOMATICO PARA TANQUE CON TANZA', 2, 36, 4, 2, 1, 0, 1),
(1122, 'EL15009', 'TRANSFORMADOR DE INTENSIDAD 1000-5A 600V 15 VA', 2, 36, 0, 0, 0, 0, 1),
(1123, 'EL15010', 'PE1151675 FUENTE DE ALIMENTACION  WEDMULLER 24V 2A 48W 873914', 2, 36, 0, 1, 0, 0, 1),
(1124, 'EL15011', 'ARRANCADOR SUAVE SSW07 MAR WEG', 2, 36, 0, 0, 0, 0, 1),
(1125, 'EL15012', 'CAPACITOR CIRCUTOR 30 Kvar 400V Codigo R2053H', 2, 36, 0, 6, 1, 140, 1),
(1126, 'EL15013', 'CAPACITOR CIRCUTOR 24 Kvar 400V Codigo R2053F', 2, 36, 1, 2, 1, 115, 1),
(1127, 'EL15014', 'CAPACITOR CIRCUTOR 12 Kvar 400V Codigo R2053C', 2, 36, 0, 1, 1, 60, 1),
(1128, 'EL15015', 'Termocupla tipo “K” con vaina AISI 316 de Ø3,175mm x 635mm de largo incluyendo rosca, rosca a proceso ½”NPT y cabezal Din-B tapa a rosca.- Conector soldado a Termocupla', 2, 36, 1, 2, 1, 71, 1),
(1129, 'EL15016', 'Termocupla tipo “K” con vaina AISI 316 de Ø6,35mm x 350mm de largo incluyendo rosca, rosca a proceso ½”NPT y cabezal Din-B tapa a rosca.-', 2, 36, 3, 2, 1, 72, 1),
(1130, 'EL15017', 'Termo Vaina p/ termocupla de Ø 3mmx635mm, brida serie 150 1 1/2\' AISI 304, conexión hembra 1/2\' npt', 2, 36, 2, 1, 1, 0, 1),
(1131, 'EL15018', 'Termo Vaina p/ termocupla de Ø 6,35mmx350mm, brida serie 150 1 1/2\' AISI 304, conexión hembra 1/2\' npt', 2, 36, 0, 1, 1, 0, 1),
(1132, 'EL15019', 'Termorresistencia PT100 Simple de 3 hilos, vaina Inox 304 56,55 Diam: 6,35MM, Rosca: 1/2\' NPT Macho, Salida 1 Mts de cable siliconado, Largo Util: 800MM -20 a 250° c ', 2, 36, 0, 2, 1, 0, 1),
(1133, 'EL15020', 'Termorresistencia PT100 simple de 3 Hilos, vaina en acero inoxidable AISI 304 de diámetro: 6.35MM. Rosca:1/2\' NPT. Rango del sensor: -20 a 250ºC. Largo útil: 800MM.', 2, 36, 0, 2, 1, 0, 1),
(1134, 'EN01001', 'ACEITE P/ LUBRICADOR ISO VG32-SAE 10 X LTS ENVASADORA 1 KG', 1, 37, 0, 0, 0, 0, 1),
(1135, 'EN01002', 'KIT DE REPARACION DE CORTE GLP PARA MAQUINA DE ENVASADO DE AMONIACO', 2, 37, 2, 2, 1, 0, 1),
(1136, 'EN01003', 'ABRAZADERA ALAMBRE 2\'', 2, 37, 12, 10, 0, 0, 1),
(1137, 'EN01004', 'JUNTA PARA ACOPLE RAPIDO 3\'', 2, 37, 38, 10, 0, 0, 1),
(1138, 'EN01005', 'KIT REPARACION MICRO 0101000019 EVASADORA 1 KG', 2, 37, 0, 1, 1, 0, 1),
(1139, 'EN01006', 'CONEXIÓN BRONCE 1\'m X 1 \'  MACHO C 43', 2, 37, 0, 1, 0, 0, 1),
(1140, 'EN01007', 'TAPA BRONCE 3/4\' ', 2, 37, 22, 0, 0, 0, 1),
(1141, 'EN01008', 'CONEXIÓN MACHO BRONCE C55 Union Sud 1 1/2\'', 2, 37, 3, 0, 0, 0, 1),
(1142, 'EN01009', 'CONEXIÓN HEMBRA BRONCE A60 Union Sud 1 1/2\' A 1 1/4\'', 2, 37, 3, 0, 0, 0, 1),
(1143, 'EN01010', 'ROLLO 100x80x1000 ETIQUETAS', 2, 37, 18, 3, 1, 0, 1),
(1144, 'EN01011', 'Juego 3 Mangueras Para R410 150cm 800 Psi', 2, 37, 1, 1, 1, 0, 1),
(1145, 'EN01012', 'KIT DE REPARACION MICRO 9000108 ENVASADORA 1 KG (1544)', 2, 37, 0, 1, 1, 0, 1),
(1146, 'EN01013', 'PINZA DE AUTOFIJACION PA 153 MARCA AIE', 2, 37, 3, 3, 1, 51, 1),
(1147, 'EN01014', 'PISTOLA DE CALOR MARC BOSCH 2000W ', 2, 37, 2, 2, 1, 168, 1),
(1148, 'EN01015', 'Precintos PVC Termocontraíble TRANSPARENTES An Apl   81 mm x Alt 100  mm impreso en NEGRO  Logo  \' NECTON \' Termosellado en un extremo \'TIPO BOLSITA\'', 2, 37, 51000, 30000, 1, 0, 1),
(1149, 'EN01016', 'JUEGO DE REPUESTOS MODELO S71 P/GARRAFONES R22 (15 A 30kg) ', 2, 37, 0, 10, 0, 0, 1),
(1150, 'EN01017', 'TAPAS PARA DACS (1 KG 500 un)', 2, 37, 2210, 2000, 1, 0, 1),
(1151, 'EN01018', 'TAPAS PARA TAMBORES 200 LTS CHICAS', 2, 37, 0, 0, 0, 0, 1),
(1152, 'EN01019', 'TAPAS PARA TAMBORES 200 LTS GRANDE ', 2, 37, 0, 0, 0, 0, 1),
(1153, 'EN01020', 'VALVULA P CILINDROS DE BRONCE ', 2, 37, 134, 0, 0, 0, 1),
(1154, 'EN01021', 'VALVULA DE SEGURIDAD P/GARRAFONES DE BRONCE 1/2\' m ( TEFL 19 Kg /cm2)', 2, 37, 5, 0, 0, 0, 1),
(1155, 'EN01022', 'PINZA DE EXPANSION ENVASADORA CHINA MED. 30,8x74,8x23,3mm', 2, 37, 1, 0, 0, 0, 1),
(1156, 'EN01023', 'Terminal de pesaje marca METTLER TOLEDO modelo IND780', 2, 37, 1, 0, 0, 13730, 1),
(1157, 'EN01024', 'CINTA EMBALAR ADHESIVA TRANSPARENTE 48mm X 50mt', 2, 37, 0, 30, 1, 1, 1),
(1158, 'EN01025', 'KIT DE REPARACION MICRO 101000057  ENVASADORA 1 KG (1210)', 2, 37, 0, 1, 1, 0, 1),
(1159, 'EN01026', 'FLEXIBLE TEFLON CORRUGADO C/ MALLA INOX. EXTREMO ROSC. MACHOS FIJOS Ø 1/2\' X 1200 mm', 2, 37, 4, 3, 1, 360, 1),
(1160, 'EN01027', 'INTERNAL DIAL CALIPER GAGE 2222-301 INSIZE', 2, 37, 1, 0, 0, 0, 1),
(1161, 'EN01028', 'FILTRO UNIPACK FR-112 WN AISI 316 CONEX. 1/2\' BSP Y JUNTAS DE O RING DE BUNA N', 2, 37, 0, 1, 1, 0, 1),
(1162, 'EN01029', 'CARTUCHO DFPP-005,7 BOBINADO DE FIBRA DE PP C/ NUCLEO DE PP 5 µ', 2, 37, 0, 1, 1, 0, 1),
(1163, 'EN01030', 'CARTUCHO DFPP-010,7 BOBINADO DE FIBRA DE PP C/ NUCLEO DE PP 10 µ', 2, 37, 0, 1, 1, 0, 1),
(1164, 'EN01031', 'CONEXIÓN MACHO BRONCE UNION SUD 1mx1 3/4\' C 43', 2, 37, 0, 2, 0, 0, 1),
(1165, 'EN01032', 'ACOPLE UNION SUD 1Gm c/tuerca 1  3/4\' A50', 2, 37, 0, 2, 0, 0, 1),
(1166, 'EN01033', 'BROCHE COBREADO 5/8\' PARA ENGRANPADORA ', 2, 37, 0, 0, 0, 0, 1),
(1167, 'EN01034', 'ACOPLE RAPIDO ALUMINIO HEMBRA 2\' - ROSCA HEMBRA', 2, 37, 0, 0, 0, 0, 1),
(1168, 'EN01035', 'MANIJA PARA ACOPLE Ø 2\' , PERNO P/ACOPLE MANIJA 2\'', 2, 37, 0, 0, 0, 0, 1),
(1169, 'EN01036', 'PLACA FUENTE METLER TOLEDO P/IND 560', 3, 37, 1, 0, 0, 0, 1),
(1170, 'EN01037', 'REPUESTO CINTA TRANSPORTADORA 820 R600', 2, 37, 1, 0, 0, 0, 1),
(1171, 'EN01038', 'JUEGO DE REPUESTOS MODELO S71 P/GARRAFONES R410 (21 A 35kg) ', 2, 37, 22, 10, 0, 0, 1),
(1172, 'EN01039', 'Juego 3 Mangueras Para R22 150cm 500 Psi', 2, 37, 0, 1, 1, 0, 1),
(1173, 'EN01040', 'Precintos PVC Termocontraíble TRANSPARENTES An Apl   81 mm x Alt 100  mm impreso en NEGRO  Logo  \' FINLEY \' Termosellado en un extremo \'TIPO BOLSITA\'', 2, 37, 0, 0, 1, 0, 1),
(1174, 'EN01041', 'CILINDRO FESTO ADN-50-10-I-P-A', 2, 37, 0, 0, 0, 0, 1),
(1175, 'EN01042', 'PICO PARA PINZAS DE CARGADO ENVASADO', 2, 37, 0, 0, 0, 0, 1),
(1176, 'EN01043', 'TINTA LINK 551 X  500 ML', 2, 37, 0, 0, 0, 0, 1),
(1177, 'EN01044', 'ACOPLE RAPIDO PP 2\' MACHO - ROSCA MACHO', 2, 37, 10, 0, 0, 36, 1),
(1178, 'EN01045', 'ACOPLE RAPIDO PP 2\' HEMBRA - C/ESPIGA ', 2, 37, 3, 0, 0, 13, 1),
(1179, 'EN01046', 'INTERRUPTOR DE COLUMNA AUTOELEVADOR TOYOTA', 2, 37, 1, 0, 0, 0, 1),
(1180, 'EN01047', 'KIT VASO FILTRO QBS1 COD 0101000027 (1508)', 2, 37, 0, 1, 1, 0, 1),
(1181, 'EN01048', 'KIT VASO LUBRICADOR QBS1 COD 0101000028', 2, 37, 1, 1, 1, 0, 1),
(1182, 'EN01049', 'EASYCHANGE SERVICE KIT (FILTER BOX) COD 061570210002 - INJEKT', 2, 37, 0, 0, 0, 0, 1),
(1183, 'EN01050', 'PINZA EXPANSION ESPECIAL REDONDA Ø 18.35MM (MANDRILES) 30X36,6X23,8mm', 2, 37, 62, 30, 1, 202, 1),
(1184, 'EN01051', 'Precintos PVC Termocontraíble TRANSPARENTES An Apl   81 mm x Alt 100  mm CRISTAL Termosellado en un extremo \'TIPO BOLSITA\'', 2, 37, 20000, 20000, 1, 0, 1),
(1185, 'EN01052', 'Precintos PVC Termocontraíble TRANSPARENTES An Apl   123 mm x Alt 100  mm CRISTAL, SIN IMPRESIÓN Esp. 100 micrones', 2, 37, 10000, 5000, 1, 0, 1),
(1186, 'EN01053', 'RIBBON CERA 110x300 MTS', 2, 37, 6, 3, 1, 0, 1),
(1187, 'EN01054', 'YQ0600301G - ETI.ILUSTR 060*030 1BAND GRAND REFORZADO 4.20K', 2, 37, 21, 10, 1, 0, 1),
(1188, 'EN01055', 'EASYCHANGE SERVICE KIT (FILTER BOX) COD 061570210002 - INJEKT', 2, 37, 7, 4, 1, 0, 1),
(1189, 'EN01056', 'Cinta fondo blanco necton', 2, 37, 220, 50, 1, 0, 1),
(1190, 'EP01001', 'ANTEOJOS DE SEGURIDAD TRANSPARENTE ', 2, 38, 28, 12, 1, 2, 1),
(1191, 'EP01002', 'GUANTE TACTIL Poliester Baño Nitrilo TALLE 9', 2, 38, 23, 12, 1, 10, 1),
(1192, 'EP01003', 'ANTEOJOS OSCUROS', 2, 38, 0, 12, 0, 24, 1),
(1193, 'EP01004', 'Antiparra de PVC, con armazón tipo caja y visor de policarbonato transparente.', 2, 38, 4, 4, 1, 11, 1),
(1194, 'EP01005', 'ARNESES', 2, 38, 0, 0, 0, 0, 1),
(1195, 'EP01006', 'BARBIJOS ANTI POLVO', 2, 38, 0, 0, 1, 0, 1),
(1196, 'EP01007', 'CADENA PLÁSTICA ROJA/BLANCA X MTS', 2, 38, 0, 0, 0, 0, 1),
(1197, 'EP01008', 'MASCARA COMPLETA MSA MOD 3000 AD', 2, 38, 0, 0, 0, 0, 1),
(1198, 'EP01009', 'CAMPERA DESCARNE SOLDADOR  TALLE XXXL', 2, 38, 5, 2, 1, 36, 1),
(1199, 'EP01010', 'CARETA DE SOLDAR DHD VISOR MÓVIL', 2, 38, 0, 0, 0, 0, 1),
(1200, 'EP01011', 'CASCOS AMARILLOS', 2, 38, 2, 3, 1, 8, 1),
(1201, 'EP01012', 'CASCOS AZULES', 2, 38, 3, 3, 0, 9, 1),
(1202, 'EP01013', 'CASCOS BLANCOS', 2, 38, 2, 2, 1, 8, 1),
(1203, 'EP01014', 'CASCOS VERDES', 2, 38, 1, 0, 0, 4, 1),
(1204, 'EP01015', 'CINTAS DE PELIGRO  X 100 MTS', 2, 38, 3, 2, 0, 2, 1),
(1205, 'EP01016', 'CARTUCHO MULTI GAS ACIDO Y VAPORES ORGANICOS 6006 3M (kitx2)', 2, 38, 3, 2, 1, 64, 1),
(1206, 'EP01017', 'DELANTAL DE PVC 0,90MTS X1,20 MARC TANGO PATAGONIA', 2, 38, 1, 0, 0, 0, 1),
(1207, 'EP01018', 'DELANTAL REFORZADO DESCARNE P/SOLDADOR', 2, 38, 0, 0, 0, 0, 1),
(1208, 'EP01019', 'DELANTAL  DESCARNE P/ SOLDADOR C/PLOMO', 2, 38, 3, 1, 1, 17, 1),
(1209, 'EP01020', 'REPUESTO VISOR FACIAL LIBUS TRANSPARENTE', 2, 38, 10, 1, 0, 90, 1),
(1210, 'EP01021', 'ARNES PARA CASCO LIBUS MILENIUM STANDARD', 2, 38, 13, 0, 0, 0, 1),
(1211, 'EP01022', 'FAJA LUMBAR TRIPLE ELASTIZADO L', 2, 38, 4, 2, 1, 10, 1),
(1212, 'EP01023', 'FAJA LUMBAR TRIPLE ELASTIZADO XXL', 2, 38, 3, 2, 1, 8, 1),
(1213, 'EP01024', 'JUEGO DE CARTUCHOS - FILTROS (2) LIBUS G08 COD: M108G08LGA15A', 2, 38, 16, 4, 1, 26, 1),
(1214, 'EP01025', 'GUANTES  NEOPRENE/AZUL -AMARILLO', 5, 38, 0, 0, 0, 0, 0),
(1215, 'EP01026', 'GUANTES DESCARTABLE NITRILO (MAPA SOLO ULTRA BLUE 997) CAJA x 100un', 2, 38, 1, 3, 1, 9, 1),
(1216, 'EP01027', 'GUANTES NITRILO LL CON PUÑO', 5, 38, 11, 12, 1, 7, 1),
(1217, 'EP01028', 'GUANTES CABRITILLA/VAQUETA', 5, 38, 47, 36, 1, 5, 1),
(1218, 'EP01029', 'GUANTES CHEMZOIL 339 P/HF  NEOPRENE', 5, 38, 0, 4, 1, 24, 1),
(1219, 'EP01030', 'GUANTES DESCARNE', 5, 38, 29, 16, 1, 1, 1),
(1220, 'EP01031', 'GUANTES DIELÉCTRICOS CLASE00 TENSION MAX 5000 VOLTIOS', 5, 38, 0, 0, 0, 0, 1),
(1221, 'EP01032', 'CAPUCHON ANTIACIDO PVC VISOR PANORAMICO', 2, 38, 0, 0, 0, 0, 1),
(1222, 'EP01033', 'GUANTES ALGODON PALMA DESCARNE', 5, 38, 0, 0, 0, 0, 1),
(1223, 'EP01034', 'GUANTES MOTEADOS', 5, 38, 54, 24, 1, 0, 1),
(1224, 'EP01035', 'GUANTES PVC LARGO  ROJO', 5, 38, 12, 10, 1, 7, 1),
(1225, 'EP01036', 'GUANTES SOLDADOR  PUÑO LARGO PAMPERO SOLDER', 5, 38, 5, 10, 1, 5, 1),
(1226, 'EP01037', 'GUANTES VERDE ULTRANITRIL 480 MARC:  MAPA', 5, 38, 16, 10, 1, 16, 1),
(1227, 'EP01038', 'MÁSCARA FACIAL C/MANGUERA P/HF - (PARA REPARACION)', 2, 38, 0, 0, 0, 0, 0),
(1228, 'EP01039', 'MÁSCARA FACIAL TRANSPARENTE - (1 PARA REPARACION)', 2, 38, 0, 0, 0, 0, 0),
(1229, 'EP01040', 'SOPORTE P/PROTECTOR FACIAL CON ARNES', 2, 38, 2, 2, 1, 5, 1),
(1230, 'EP01041', 'MASCARA LIBUS 99000 FULLFACE', 2, 38, 2, 2, 1, 328, 1),
(1231, 'EP01042', 'MÁSCARAS CON MANGUERA NEGRA', 2, 38, 0, 0, 0, 0, 1),
(1232, 'EP01043', 'OVEROL AMARILLO DUPONT TYCHEM 2000 C (XL)', 2, 38, 1, 3, 1, 27, 1),
(1233, 'EP01044', 'TYCHEM 4000 (ex SL) con bota incorporada (2XL)', 2, 38, 5, 2, 1, 70, 1),
(1234, 'EP01045', 'OVEROL  BLANCOS TYVECK', 2, 38, 0, 0, 0, 0, 1),
(1235, 'EP01046', 'POLAINAS P/SOLDADOR DESCARNE', 2, 38, 3, 3, 1, 7, 1),
(1236, 'EP01047', 'PROTECTOR AUDITIVO (TIPO COPA)', 2, 38, 1, 2, 0, 12, 1),
(1237, 'EP01048', 'PROTECTORES AUDITIVOS DE SILICONA MARC AUDICIL ', 2, 38, 145, 4, 1, 0, 1),
(1238, 'EP01049', 'PUNTERAS DE SEGURIDAD PRO- TEK-TO / OG-3601', 2, 38, 0, 0, 0, 0, 1),
(1239, 'EP01050', 'SEMI MASCARA P/HF LIBUS SERIE 9000 M 189200LGJ25A', 2, 38, 3, 3, 1, 29, 1),
(1240, 'EP01051', 'REPUESTO MANGA DE VIENTO RMV-500 de Ømayor 0,50 mt. x 2,50 mt de largo.', 2, 38, 5, 3, 1, 45, 1),
(1241, 'EP01052', 'TELA PARA MANGA DE VIENTO DE 15X5 ', 2, 38, 0, 0, 0, 0, 1),
(1242, 'EP01053', 'TRAJE IMPERMEABLE DE LLUVIA XXL', 2, 38, 0, 1, 1, 30, 1),
(1243, 'EP01054', 'TUBO DE OXIGENO  MEDICINAL P EQUIPO AUTONOMO ', 2, 38, 0, 0, 0, 0, 1),
(1244, 'EP01055', 'VIDRIO OSCURO Nº 14 P/SOLDAR', 2, 38, 0, 0, 0, 0, 0),
(1245, 'EP01056', 'VIDRIO OSCURO Nº12 P/SOLDAR', 2, 38, 4, 0, 0, 0, 0),
(1246, 'EP01057', 'VIDRI OSCURO DIN 10', 2, 38, 0, 0, 0, 0, 0),
(1247, 'EP01058', 'VIDRIO OSCURO Nº5 P/ OXICORTE', 2, 38, 2, 1, 1, 0, 1),
(1248, 'EP01059', 'VIDRIO TRANSPARENTE P/SOLDAR', 2, 38, 6, 0, 0, 0, 1),
(1249, 'EP02001', 'CAMISA AZUL TELA ANTIACIDA', 2, 39, 2, 0, 0, 0, 1),
(1250, 'EP02002', 'PANTALON AZUL TELA ANTIACIDA', 2, 39, 0, 0, 0, 0, 1),
(1251, 'EP02003', 'PANTALON BEIGE TELA ANTIACIDA', 2, 39, 6, 0, 0, 0, 1),
(1252, 'EP02004', 'BUZOS POLAR , CON CUELLO . COLOR AZUL, 1/2  CIERRE , PUÑOS Y CINTURA ELASTIZADA, C/LOGO BORDADO', 2, 39, 2, 0, 0, 0, 1),
(1253, 'EP02005', 'BUZOS POLAR , CON CUELLO . COLOR VERDE, 1/2  CIERRE , PUÑOS Y CINTURA ELASTIZADA, C/LOGO BORDADO', 2, 39, 12, 0, 0, 0, 1),
(1254, 'EP02006', 'CAMPERAS DE ABRIGO, TELA TRAKER, IMPERMEABLE COLOR AZUL, CAPUCHA DESMONTABLE C/CIERRE, C/ LOGO  ', 2, 39, 3, 0, 0, 0, 1),
(1255, 'EP02007', 'CAMPERAS DE ABRIGO, TELA TRAKER, IMPERMEABLE COLOR VERDE, CAPUCHA DESMONTABLE C/CIERRE, C/ LOGO  ', 2, 39, 25, 0, 0, 0, 1),
(1256, 'EP02008', 'DELANTAL AZUL', 2, 39, 0, 0, 0, 0, 0),
(1257, 'EP02009', 'CAMISA BEIGE TELA ANTIACIDA', 2, 39, 0, 0, 0, 0, 1),
(1258, 'EP03001', 'BOTAS DE LLUVIA', 2, 40, 0, 0, 0, 0, 1),
(1259, 'EP03002', 'BOTIN SEGURIDAD C/PUNTERA ACERO ', 2, 40, 0, 0, 0, 0, 1),
(1260, 'EP03003', 'ZAPATO SEGURIDAD PUNTERA ACERO ', 2, 40, 3, 0, 0, 0, 1),
(1261, 'EQ01001', 'DISCO DE RUPTURA NIQUEL 269 PSI - 19bar a 50°C - 1\'', 2, 41, 3, 1, 1, 526, 1),
(1262, 'EQ01002', 'VALVULAS DE RETENCION VERTICAL A BOLA MARCA: LVM ', 2, 41, 0, 0, 0, 0, 1),
(1263, 'EQ01003', 'CHAPA DE PLATA 1000/RYB  350X70X0,20 ', 2, 41, 0, 2, 1, 143, 1),
(1264, 'EQ01004', 'NIVEL 72CM', 2, 41, 1, 0, 0, 0, 1),
(1265, 'EQ01005', 'NIVEL 60CM', 2, 41, 1, 0, 0, 0, 1),
(1266, 'EQ01006', 'TEE NEUMATICA P/ MANGUERA 6 MM', 2, 41, 5, 1, 1, 0, 1),
(1267, 'EQ01007', 'DISCO DE RUPTURA NIQUEL 211 PSI - 15bar a 50°C - 1\'', 2, 41, 1, 0, 0, 0, 1),
(1268, 'EQ01008', 'CABLE DE ACERO INOX Ø 6 mm', 3, 41, 10, 2, 1, 1, 1),
(1269, 'EQ01009', 'CABEZAL DE SEGURIDAD MARCA BS& B TIPO : S90-7R, 1\', SERIE 300, A°C°', 2, 41, 0, 1, 1, 0, 1),
(1270, 'EQ02001', 'CONTROLADOR DE CALDERA', 2, 42, 0, 0, 0, 0, 1),
(1271, 'EQ02002', 'CHISPERO CERAMICO CALDERA ', 2, 42, 0, 0, 0, 0, 1),
(1272, 'EQ02003', 'DETECTOR DE LLAMA UV QRA-2 CODIGO 30-05-120SN-002 ITEM 14', 2, 42, 0, 1, 1, 559, 1),
(1273, 'EQ02004', 'PRESOSTATO DUNGS DE CALDERA GW 500 A4 600 MBAR GAS  CODIGO (30-14-310023000) ITEM 10', 2, 42, 2, 1, 1, 0, 1),
(1274, 'EQ02005', 'PROGRAMADOR LFL - 1.335 CODIGO (30-05-065SN-026) ITEM 1', 2, 42, 0, 1, 1, 0, 1),
(1275, 'EQ02006', 'RA890G1245 /FSG UV PROTECTOR RELAY 220V ', 2, 42, 0, 0, 0, 0, 1),
(1276, 'EQ02007', 'TERMOMETRO MERCURIO P/ CALDERA', 2, 42, 1, 0, 0, 0, 1),
(1277, 'EQ02008', 'TRANSFORMADOR D\'ACCENSIONE 220V', 2, 42, 0, 0, 0, 0, 1),
(1278, 'EQ02009', 'TRANSFORMADOR DE IGNICION MOD COMP Nº13 220/230', 2, 42, 1, 0, 0, 0, 1),
(1279, 'EQ02010', 'VIDRIO PARA NIVEL DE CALDERA  B-9  030- 01- 006', 2, 42, 0, 0, 0, 0, 1),
(1280, 'EQ02011', 'VIDRIO PARA NIVEL DE CALDERA B -7 KLINGER ART -K 00075', 2, 42, 2, 2, 1, 160, 1),
(1281, 'EQ02012', 'VIDRIO PARA NIVEL DE CALDERA B-4  KLINGER  ART : R 01828', 2, 42, 2, 0, 0, 0, 1),
(1282, 'EQ02013', 'VIDRO P/VISOR DE CALDERA DIAM 45 X 6MM ESPESOR', 2, 42, 0, 0, 0, 0, 1),
(1283, 'EQ02014', 'VULVO DE MERCURIO P/ CALDERA ', 2, 42, 0, 0, 0, 0, 1),
(1284, 'EQ02015', 'PRESOSTATO LGW-50 A4 CODIGO (30-10-075SN-012) ITEM 12', 2, 42, 0, 1, 1, 263, 1),
(1285, 'EQ02016', 'PRESOSTATO DUNGS DE CALDERA LGW 150A4 CODIGO (30-14-310058000) ITEM 11', 2, 42, 1, 1, 1, 0, 1),
(1286, 'EQ02017', 'TRANSFORMADOR DE ENCENDIDO DE 1X8 KV  CODIGO (30-15-310188000) ITEM 3', 2, 42, 1, 1, 1, 116, 1),
(1287, 'EQ02018', 'BOMBA SUNTEC E7 NC 1001 -5P CODIGO ( 30-31-335974000) ITEM 4', 2, 42, 1, 1, 1, 0, 1),
(1288, 'EQ02019', 'CABLE PARA BUJIA ALTA TEMPERATURA X MTS  CODIGO (20-51-250001000) ITEM 5', 2, 42, 5, 5, 1, 11, 1),
(1289, 'EQ02020', 'CAPUCHON BUJIA 1/4\' ART UG 1060 NEGRO  CODIGO (25-40-210AC-001)', 2, 42, 5, 5, 1, 21, 1),
(1290, 'EQ02021', 'TERMINAL PARA BUJIA ALTA TENSION c/ CAPUCHON NARANJA RECTO CODIGO (25-40-150AC-087) ITEM 6', 2, 42, 5, 5, 1, 0, 1),
(1291, 'EQ02022', 'CONJUNTO ELECTRODO ENCENDIDO PADS- 35  CODIGO (30-85-191153000) ITEM 7', 2, 42, 4, 2, 1, 250, 1),
(1292, 'EQ02023', 'CONJUNTO ELECTRODO CABEZAL PADS 35 CODIGO (30-15-070SN-049) ', 2, 42, 1, 2, 1, 0, 1),
(1293, 'EQ02024', 'ELECTRODO DE ENCENDIDO STD 110X11+100X3 CODIGO (30-85-390109000) ITEM 8', 2, 42, 2, 2, 1, 19, 1),
(1294, 'EQ02025', 'BOBINA DUNGS 400 P/2 1/2\' 214209  CODIGO (30-21-390274000) ITEM 9', 2, 42, 1, 1, 1, 0, 1),
(1295, 'EQ02026', 'SERVOMOTOR SQM-10,16502 CODIGO ( 30-10-125SN-002) ITEM 13', 2, 42, 0, 1, 1, 0, 1),
(1296, 'EQ02027', 'DETECTOR SIEMENS QRA-2 (1)  CODIGO ( 30-05-120SN-002)', 2, 42, 0, 0, 0, 0, 1),
(1297, 'EQ02028', 'JUNTA KLINGER C4401 P/PAG 35 OB3-370-D232 CODIGO (30-84-191297000) ITEM 15', 2, 42, 1, 1, 1, 0, 1),
(1298, 'EQ02029', 'VALVULA SOLENOIDE DOBLE DN 1/2\' BSP 220 V 50/60HZ CODIGO (30-20-050SN-096) ITEM 16', 2, 42, 0, 1, 1, 0, 1),
(1299, 'EQ02030', 'VALVULA SOLENOIDE 1/2\' BSP NC C/REG DE CAUDAL  CODIGO ( 30-20-320054000) ITEM 17', 2, 42, 1, 1, 1, 0, 1),
(1300, 'EQ02031', 'TRANSFORMADOR ENCENDIDO 2X5 KV  CODIGO ( 30-15-310189000) item 2', 2, 42, 2, 1, 1, 0, 1),
(1301, 'EQ02032', 'JUNTA ESPIRALADA SERIE 150 - 1\' - K', 2, 42, 5, 10, 1, 3, 1),
(1302, 'EQ02033', 'JUNTA ESPIRALADA SERIE 150 - 1 1/4\' - K', 2, 42, 10, 10, 1, 2, 1),
(1303, 'EQ02034', 'JUNTA ESPIRALADA SERIE 150 - 1 1/2\' - K', 2, 42, 22, 12, 1, 3, 1),
(1304, 'EQ02035', 'JUNTA ESPIRALADA SERIE 150 - 3\' - K', 2, 42, 8, 4, 1, 4, 1),
(1305, 'EQ02036', 'INTERRUPTOT DE NIVEL (MAGNETROL) PELTON W251', 2, 42, 1, 0, 0, 200, 1),
(1306, 'EQ02037', 'FLOTANTE PARA INTERRUPTOR DE NIVEL (MAGNETROL)', 2, 42, 1, 1, 1, 0, 1),
(1307, 'EQ02038', 'JUEGO JUNTAS P/VISOR DE CALDERA TAMAÑO B Vll', 2, 42, 4, 3, 1, 11, 1),
(1308, 'EQ02039', 'VALVULA DE RETENCION SPIRAX SARCO DCV3 DN32', 2, 42, 4, 4, 1, 550, 1),
(1309, 'EQ02040', 'JUEGO DE VALVULAS P/IND DE NIVEL, ½” NPTM,  A°C°/ Internos Inox - RIVA', 2, 42, 6, 2, 1, 200, 1),
(1310, 'EQ02041', 'JUNTA ESPIRALADA SERIE 300 - 2\' - K', 2, 42, 8, 4, 1, 3, 1),
(1311, 'EQ02042', 'CONTROLADOR NOVUS R2000 reemplazo de DH100', 2, 42, 1, 1, 1, 610, 1),
(1312, 'EQ02043', 'FILTRO PARA MAGNETROL', 2, 42, 2, 0, 0, 0, 1);
INSERT INTO `item` (`Id`, `Codigo`, `Descripcion`, `UnidadDeMedidaId`, `SubFamiliaId`, `Stock`, `PuntodePedido`, `Critico`, `Precio`, `Activo`) VALUES
(1313, 'EQ03001', 'GASKET HEAD (PUMP)-W034195-000 (KOPKIT KPGBFBOAACC)', 2, 43, 7, 2, 1, 102, 1),
(1314, 'EQ03002', 'VALVE,BALL 1000 DIA - W034581-316 (KOPKIT KPGBFBOAACC)', 2, 43, 4, 2, 1, 433, 1),
(1315, 'EQ03003', 'SEAL,PISTON CUP 2,00 DIA -W034653-000 (KOPKIT KPGBFBOAACC)', 2, 43, 10, 2, 1, 218, 1),
(1316, 'EQ03004', '(KOPKIT KPGBFBOAACC) GASKET ,O\'RING 1,62  1,50-W078452-TFE Aro de PTFE, modelo PULSA 7660, medidas: Øe 41,3 x Øi 38 x H 1,8 mm..(-0.1/+0.2)', 2, 43, 85, 24, 1, 0, 1),
(1317, 'EQ03005', 'DIAPHRAGM FLAT 600 DISH-W094691-TFE (KOPKIT KPGBFBOAACC)', 2, 43, 4, 2, 1, 1150, 1),
(1318, 'EQ03006', 'SEAT ,VALVE 1,00 B O H W-202473-316 (KOPKIT KPGBFBOAACC)', 2, 43, 4, 2, 1, 697, 1),
(1319, 'EQ03007', 'SEAL, OIL (WORM SHAFT ) - W 204769-000 (KOPKIT KPGBFBOAACC)', 2, 43, 7, 2, 0, 129, 1),
(1320, 'EQ03008', 'ACTUADOR PULSA WORCESTER MOD LCR 600 5230A', 2, 43, 1, 1, 0, 0, 1),
(1321, 'EQ03009', 'TESTED ITEM W202173-316', 2, 43, 1, 1, 0, 0, 1),
(1322, 'EQ03010', 'COUPLING 62 , 50 ITEM: W089232-000', 2, 43, 1, 1, 0, 0, 1),
(1323, 'EQ03011', 'ACEITE TELLUS SHELL 68', 2, 43, 0, 0, 0, 0, 0),
(1324, 'EQ03012', 'COUNTER, E & AE W092772-000', 2, 43, 2, 1, 0, 0, 1),
(1325, 'EQ03013', 'FILTRO SE SUCCION AC. INOX RETENCION DE 125µ, Ø=150 mm h=250mm Rosca 2- 1/2bsp cod: rosicler R-11 341', 2, 43, 2, 1, 0, 0, 1),
(1326, 'EQ03014', 'SHAFT ASSY COBER W204-877-000', 2, 43, 0, 0, 0, 769, 0),
(1327, 'EQ03015', '08-32X88 SCREW SKHD W770007- STA', 2, 43, 1, 1, 0, 0, 1),
(1328, 'EQ03016', '8 REG LOCK WASHER W771105- STL', 2, 43, 1, 1, 0, 0, 1),
(1329, 'EQ03017', '8 FIT WSHR W771005- STL', 2, 43, 1, 1, 0, 0, 1),
(1330, 'EQ03018', 'GEAR REAR COVER W092719-000', 2, 43, 1, 1, 0, 0, 1),
(1331, 'EQ03019', 'SLEEVE REAR  W092592-000', 2, 43, 1, 1, 0, 0, 1),
(1332, 'EQ03020', 'GEAR REAR COVER W092590-000', 2, 43, 1, 1, 0, 235, 1),
(1333, 'EQ03021', '6-32X,12 SCREW SETSC W771004-002', 2, 43, 1, 1, 0, 0, 1),
(1334, 'EQ03022', 'COUNTER GASKET W207459-000', 2, 43, 9, 4, 0, 0, 1),
(1335, 'EQ03023', 'COUNTER', 2, 43, 0, 0, 0, 328, 0),
(1336, 'EQ03024', '05-40X38 SCREW RDHD W771001-033', 2, 43, 1, 1, 0, 0, 1),
(1337, 'EQ03025', 'HANDWELL W092591-000', 2, 43, 1, 1, 0, 0, 1),
(1338, 'EQ03026', '25-20X 38 SCREW SETSC W771004-030', 2, 43, 1, 1, 0, 0, 1),
(1339, 'EQ03027', 'KOPKIT 7660 Nº KPGBFBOAACC ', 2, 43, 1, 1, 1, 3444, 1),
(1340, 'EQ03028', 'COVER SHAFT ASSEMBLY - PART NUMBER W204877-000 - PLANO AP00246', 2, 43, 3, 2, 1, 0, 1),
(1341, 'EQ03029', 'COVER GASKET - PART NUMBER W204563-000 - PLANO AP00246', 2, 43, 2, 1, 1, 360, 1),
(1342, 'EQ03030', 'AIR BLEED VALVE ASSEMBLY - PART NUMBER W208383-000 - PLANO AP00160', 2, 43, 2, 1, 1, 504, 1),
(1343, 'EQ03031', 'VALVE GUIDE - PART NUMBER W202472-316 - PLANO AP00234', 2, 43, 4, 1, 1, 430, 1),
(1344, 'EQ03032', 'ORING TEFLON -78452', 2, 43, 0, 0, 0, 0, 0),
(1345, 'EQ03033', 'COVER SHAFT ASSEMBLY 204877-000', 2, 43, 1, 1, 0, 0, 1),
(1346, 'EQ03034', 'ADJUSTEMENT SHAFT ASSEMBLY - PART NUMBER W092972-000 - PLANO AP00168', 2, 43, 1, 1, 1, 1260, 1),
(1347, 'EQ03035', 'GEAR - PART NUMBER W092715-000 - PLANO AP00168', 2, 43, 1, 1, 1, 583, 1),
(1348, 'EQ03036', 'ADJUSTEMENT SCREW - PART NUMBER W092963-000 - PLANO AP00168', 2, 43, 1, 1, 1, 123, 1),
(1349, 'EQ03037', 'CONNECTING ROD - PART NUMBER W034176-000 - PLANO AP00168', 2, 43, 1, 1, 1, 823, 1),
(1350, 'EQ03038', 'PIN - PART NUMBER W034200-000 - PLANO AP00168', 2, 43, 1, 1, 1, 373, 1),
(1351, 'EQ03039', 'BEARING WORM W204640-000 (RODAMIENTO)', 2, 43, 4, 2, 1, 321, 1),
(1352, 'EQ04001', 'BIELA GRANDE W-202280-000     (ROD CONECTING)                             ', 2, 44, 2, 2, 1, 614, 1),
(1353, 'EQ04002', 'COUNTER, E. & AE W092772-000', 2, 44, 2, 2, 1, 285, 1),
(1354, 'EQ04003', 'DIAFRAGMA ,FLAT / W094559-TFE (KOPKIT KZ 4397 MOD 7120/C567079)', 2, 44, 5, 2, 1, 741, 1),
(1355, 'EQ04004', 'INSERT DISH W-094411-P00                                          ', 2, 44, 1, 1, 0, 0, 1),
(1356, 'EQ04005', 'GASKET,HEAD(PUMP) / W203244-000 (KOPKIT KZ 4397 MOD 7120/C567079)', 2, 44, 5, 1, 1, 69, 1),
(1357, 'EQ04006', 'PERNO C/ROSCA W-032961-000                                  ', 2, 44, 2, 2, 1, 68, 1),
(1358, 'EQ04007', 'SEAL,PISTON , W203676 (KOPKIT KZ 4397 MOD 7120/C567079)', 2, 44, 10, 4, 1, 157, 1),
(1359, 'EQ04008', 'SHAFT , BLOCK W 092586-000', 2, 44, 4, 2, 0, 0, 1),
(1360, 'EQ04009', ', WORM shaft ASSEMBLY W208140-015', 2, 44, 2, 2, 1, 708, 1),
(1361, 'EQ04010', 'COUPLING -PART NUMBER W042333-000 PLANO AP 00166', 2, 44, 1, 2, 1, 312, 1),
(1362, 'EQ04011', 'CONNECTING ROD-PAR NUMBER W032968-000 PLANO AP 00211', 2, 44, 4, 2, 1, 680, 1),
(1363, 'EQ04012', 'CONECTING ROD PIN W 209799 PLANO AP00212', 2, 44, 2, 1, 1, 198, 1),
(1364, 'EQ04013', 'ECCENTRIC SHAFT ASSEMBLY W 208139-015 PLANO AP00213', 2, 44, 2, 2, 1, 1268, 1),
(1365, 'EQ04014', '(KOPKIT KZ 4397 MOD 7120/C567079) GASKET ,O RING / W078419 Aro de PTFE, modelo PULSA 7120, medidas: Øe 31,7 x Øi 28,5 x H 1,8 mm..(-0.1/+0.2)', 2, 44, 49, 36, 1, 3, 1),
(1366, 'EQ04015', 'SEAL,OIL(WORM SHAFT)W203239 (KOPKIT KZ 4397 MOD 7120/C567079)', 2, 44, 3, 2, 1, 147, 1),
(1367, 'EQ04016', 'SEAT,VALVE , W202173-MN0 (KOPKIT KZ 4397 MOD 7120/C567079) ', 2, 44, 6, 2, 1, 1, 1),
(1368, 'EQ04017', 'KLM11749- LM11710TVP  RODAMIENTO', 2, 44, 4, 4, 1, 21, 1),
(1369, 'EQ04018', 'VALVE BALL ,W035372 (KOPKIT KZ 4397 MOD 7120/C567079)', 2, 44, 4, 2, 1, 1, 1),
(1370, 'EQ04019', 'GUIA TOPE- GUIDE VALVE-Nº DE PARTE 202172 MNO (MONEL)', 2, 44, 4, 2, 1, 4344, 1),
(1371, 'EQ04020', ' VALVE ASSY,AIR BLEEDER ITEM/ W208383-005', 2, 44, 2, 2, 1, 400, 1),
(1372, 'EQ04021', 'PLANCHA DE CORCHO 61 X 91,5 ESPESOR 3 mm ', 2, 44, 1, 1, 1, 0, 1),
(1373, 'EQ04022', 'FILTRO SE SUCCION AC. INOX RETENCION DE 125µ, Ø=96 mm h=210mm Rosca 1- 1/2bsp cod: rosicler R-11 340', 2, 44, 2, 2, 1, 375, 1),
(1374, 'EQ04023', 'GOMA SINTETICA CON TELA 1 mm ', 2, 44, 0, 0, 0, 0, 1),
(1375, 'EQ04024', 'COVER SHAFT ASSEMBLY W092721-A00 PLANO AP00209', 2, 44, 2, 2, 1, 609, 1),
(1376, 'EQ04025', 'HANDWELL W09591-000 PLANO AP 00209', 2, 44, 0, 2, 1, 0, 1),
(1377, 'EQ04026', 'HOUSING  BOLT W202398-000 PLANO AP00209', 2, 44, 3, 2, 1, 241, 1),
(1378, 'EQ04027', 'HOUSING W032939-001 PLANO AP00211', 2, 44, 2, 2, 1, 1316, 1),
(1379, 'EQ04028', 'HOUSING ASSEMBLY W209860-000 EX W208202-000 PLANO AP00209', 2, 44, 2, 2, 1, 2963, 1),
(1380, 'EQ04029', 'CAP SCREW W770007-STA PLANO AP00209', 2, 44, 6, 2, 1, 19, 1),
(1381, 'EQ04030', 'GEAR W92719-000 PLANO AP00209', 2, 44, 2, 2, 1, 27, 1),
(1382, 'EQ04031', 'COUNTER GASKET W207459-000 PLANO AP00209', 2, 44, 6, 2, 1, 20, 1),
(1383, 'EQ04032', 'DRIVE SCREW W771000-188 PLANO AP00209', 2, 44, 5, 2, 1, 19, 1),
(1384, 'EQ04033', 'SET SCREW W771004-002 PLANO AP00209', 2, 44, 6, 2, 1, 19, 1),
(1385, 'EQ04034', 'STROKE NAMEPLATE W096821- 001 AP00209', 2, 44, 2, 2, 1, 278, 1),
(1386, 'EQ04035', 'ROUND HEAD SCREW W 771001-033 PLANO AP 00209', 2, 44, 4, 2, 1, 14, 1),
(1387, 'EQ04036', 'LOCK WASHER  W771105- STL PLANO AP 00209', 2, 44, 2, 2, 1, 20, 1),
(1388, 'EQ04037', 'FLAT WASHER  W771005- STL PLANO AP 00209', 2, 44, 6, 2, 1, 25, 1),
(1389, 'EQ04038', 'SLEEVE  W092592  PLANO AP 00209', 2, 44, 6, 2, 1, 99, 1),
(1390, 'EQ04039', 'GEAR , REAR COVER ( PINION) W092590-000 PLANO AP00209', 2, 44, 2, 2, 1, 286, 1),
(1391, 'EQ04040', 'SET SCREW W771004-030 PLANO AP00209', 2, 44, 1, 2, 1, 15, 1),
(1392, 'EQ04041', 'O RING W078200-001 PLANO AP00209', 2, 44, 2, 2, 1, 20, 1),
(1393, 'EQ04042', 'MALE ELBOW,BLEEDER SUB-ASSY  W210735-003', 2, 44, 0, 0, 0, 0, 1),
(1394, 'EQ04043', 'HYDRAULIC BYPASS VALVE 35-325  W034904-000', 2, 44, 0, 0, 0, 0, 1),
(1395, 'EQ04044', 'HYDRAULIC MAKE UP VALVE  W214696-000', 2, 44, 0, 0, 0, 0, 1),
(1396, 'EQ04045', 'COVER GASKET W 202509-000', 2, 44, 2, 2, 1, 112, 1),
(1397, 'EQ04046', 'DIAPHRAGMA W 202505 PLANO AP 00209', 2, 44, 5, 2, 1, 34, 1),
(1398, 'EQ04047', 'SHIM PACK - ECCESTRIC W 203216-000 PLANO AP00212  ( 3 )', 2, 44, 0, 0, 0, 0, 1),
(1399, 'EQ04048', 'GASKET COVER (REAR) W204563-000', 2, 44, 0, 0, 0, 0, 1),
(1400, 'EQ04049', 'SHAFT ASSY COVER W204877-000', 2, 44, 0, 0, 0, 0, 1),
(1401, 'EQ04050', 'VALVE ASSY AIR BLEEDER W208383-000', 2, 44, 0, 0, 0, 0, 1),
(1402, 'EQ04051', 'GUIDE VALVE 1.00 W202472-316', 2, 44, 0, 0, 0, 0, 1),
(1403, 'EQ04052', 'GEAR HOUSING ADJ W92715-000', 2, 44, 2, 1, 0, 142, 1),
(1404, 'EQ04053', 'SHAFT ASSY ADJ (EXT) W0208385-000', 2, 44, 3, 2, 1, 0, 1),
(1405, 'EQ04054', 'HAND WHEEL W092591-000 PLANO AP00209', 2, 44, 6, 1, 1, 404, 1),
(1406, 'EQ04055', 'FILLISTER HEAD SCREW W771003-010 PLANO AP00209 ITEM 19', 2, 44, 8, 8, 1, 17, 1),
(1407, 'EQ04056', 'SET SCREW W771004-051', 2, 44, 7, 2, 1, 21, 1),
(1408, 'EQ04057', 'GASKET GEAD (PUMP) / KOPKIT KZ 4397 MOD 7120/C567079', 2, 44, 5, 2, 1, 47, 1),
(1409, 'EQ04058', 'KOPKIT KZ 4397 MOD 7120/C567079', 2, 44, 2, 2, 1, 0, 1),
(1410, 'EQ05001', 'JUEGO BRIDA CONEXIÓN RB 5', 2, 45, 2, 0, 0, 0, 1),
(1411, 'EQ05002', 'EJE COMPLETO RZ-3-E ', 2, 45, 0, 0, 0, 0, 1),
(1412, 'EQ05003', 'BULONERIA COMPLETA DE INOXIDABLE RZ-3-E', 2, 45, 8, 2, 1, 29, 1),
(1413, 'EQ05004', 'ROTOR RZ-3-E', 2, 45, 0, 0, 0, 0, 1),
(1414, 'EQ05005', 'BRIDA ROSCADA ASA 150  2\' PP', 2, 45, 0, 0, 0, 0, 0),
(1415, 'EQ05006', 'BULONERIA COMPLETA DE BOMBA BOMBPLAST MODELO RB-5-E', 2, 45, 0, 2, 1, 84, 1),
(1416, 'EQ06001', 'ARO GUIA -CODIGO 112-0022-20 2º ETAPA', 2, 46, 2, 0, 0, 0, 0),
(1417, 'EQ06002', 'ARO GUIA -CODIGO 112-0507-20 1ºETAPA', 2, 46, 2, 0, 0, 0, 0),
(1418, 'EQ06003', 'Arosello 509-0121-91', 2, 46, 0, 0, 0, 0, 0),
(1419, 'EQ06004', 'AROSELLO 509-0209-91', 2, 46, 0, 0, 0, 0, 0),
(1420, 'EQ06005', 'AROSELLO 509-117-91', 2, 46, 7, 0, 0, 0, 0),
(1421, 'EQ06006', 'CIERRE  106-0022-01 ( rasca aceite)', 2, 46, 2, 0, 0, 0, 0),
(1422, 'EQ06007', 'CIGÜEÑAL COMPLETO C/CONTRAPESO CODIGO 112-0027-01', 2, 46, 0, 0, 0, 0, 0),
(1423, 'EQ06008', 'CILINDRO 1º ETAPA 104-0029-40', 2, 46, 0, 0, 0, 0, 0),
(1424, 'EQ06009', 'CILINDRO 2º ETAPA 104-0052-20', 2, 46, 0, 0, 0, 0, 0),
(1425, 'EQ06010', 'juego discos 106-040-20', 2, 46, 1, 0, 0, 0, 0),
(1426, 'EQ06011', 'juego de aros 1º ETAPA - codigo KAR-4S ', 2, 46, 4, 0, 0, 0, 0),
(1427, 'EQ06012', 'JUEGO DE AROS 2º ETAPA - COD. KAR-2S', 2, 46, 0, 0, 0, 0, 0),
(1428, 'EQ06013', 'JUNTAS de goma ', 2, 46, 0, 0, 0, 0, 0),
(1429, 'EQ06014', 'JUNTAS 104-0006-21', 2, 46, 0, 0, 0, 0, 0),
(1430, 'EQ06015', 'JUNTAS 120-0113-20', 2, 46, 0, 0, 0, 0, 0),
(1431, 'EQ06016', 'JUEGO DE JUNTA  COMPLETA  KJU-M24SQ', 2, 46, 0, 0, 0, 0, 0),
(1432, 'EQ06017', 'KIT REPARACION DE VALVULAS  KVA-003', 2, 46, 0, 0, 0, 0, 0),
(1433, 'EQ06018', 'KIT REPARACION DE VALVULAS  KVA-001', 2, 46, 0, 0, 0, 0, 0),
(1434, 'EQ06019', 'PACK(6) ELEMENTOS DE CELULOSA 120-0003-20', 2, 46, 0, 0, 0, 0, 0),
(1435, 'EQ06020', 'PERNO 112-0058-20', 2, 46, 0, 0, 0, 0, 0),
(1436, 'EQ06021', 'PISTON  1º ETAPA 112-0001-20', 2, 46, 2, 0, 0, 0, 0),
(1437, 'EQ06022', 'PISTON  2º ETAPA 112-0020-20', 2, 46, 1, 0, 0, 0, 0),
(1438, 'EQ06023', 'Platillo 42 x 23 x 1,2mm de 2º etapa', 2, 46, 13, 0, 0, 0, 0),
(1439, 'EQ06024', 'Platillo 72X55,5X1,2mm de 2º etapa', 2, 46, 13, 0, 0, 0, 0),
(1440, 'EQ06025', 'Platillo 77,5x52,9x 1,2mm 1ºetapa', 2, 46, 12, 0, 0, 0, 0),
(1441, 'EQ06026', 'PLATILLO 120X100 ', 2, 46, 10, 0, 0, 0, 0),
(1442, 'EQ06027', 'Resorte curvo de 42x23x0,6mm de  2º etapa', 2, 46, 14, 0, 0, 0, 0),
(1443, 'EQ06028', 'Resorte curvos 72 x 55,5x0,6mm de 1º etapa', 2, 46, 12, 0, 0, 0, 0),
(1444, 'EQ06029', 'Resorte curvos 75 x 55,5x0,6mm de 1º etapa Codigo 116-092-20', 2, 46, 4, 0, 0, 0, 0),
(1445, 'EQ06030', 'RESORTE CURVOS 120 X100,5 X0,7 116-091-20', 2, 46, 44, 0, 0, 0, 0),
(1446, 'EQ06031', 'RESORTE CON TRABAS 41X23X0,5mm', 2, 46, 8, 0, 0, 0, 0),
(1447, 'EQ06032', 'RESORTE CON TRABAS 71X 53,5', 2, 46, 24, 0, 0, 0, 0),
(1448, 'EQ06033', 'reten 5427 ', 2, 46, 2, 0, 0, 0, 0),
(1449, 'EQ06034', 'Valvula completa de 2º etapa codigo 116-0003-01', 2, 46, 0, 0, 0, 0, 0),
(1450, 'EQ06035', 'Valvula completa de 1º etapa codigo 116-0001-01', 2, 46, 1, 0, 0, 0, 0),
(1451, 'EQ06036', 'VASTAGO 110-0001-20', 2, 46, 0, 0, 0, 0, 0),
(1452, 'EQ06037', 'Filtro de aire Marca FRAM CA2690', 2, 46, 0, 0, 0, 0, 0),
(1453, 'EQ06038', 'Aceite VITREA 150 SHELL', 1, 46, 0, 0, 0, 0, 0),
(1454, 'EQ06039', 'Bujes', 2, 46, 2, 0, 0, 0, 0),
(1455, 'EQ07001', 'JB-128-AE -ESFEROMATIC YUGO PARA P50', 2, 47, 1, 1, 0, 261, 1),
(1456, 'EQ07002', 'JB-118-FA-ESFEROMATIC BONETE STD V1S D/1/2\'-3/4\'', 2, 47, 0, 1, 1, 0, 1),
(1457, 'EQ07003', 'JB-118-FC-ESFEROMATIC BONETE STD V1S D/1/2\' - 3/4\' (CUELLO)', 2, 47, 0, 1, 1, 0, 1),
(1458, 'EQ07004', 'JB-138-SA-ESFEROMATIC ESPARRAGO DEL PRENSA P/ V1S 1/2\' A 1\'', 2, 47, 0, 6, 1, 0, 1),
(1459, 'EQ07005', 'JB-139-ZA-ESFEROMATIC / TUERCA DEL PRENSA P/V1S DE  1/2\' A 1\'', 2, 47, 0, 6, 1, 0, 1),
(1460, 'EQ07006', 'JB-132-KA - ESFEROMATIC /CASQUILLO P VALV 1/2\' A 1\'', 2, 47, 0, 1, 1, 0, 1),
(1461, 'EQ07007', 'JB-161-AT - ESFEROMATIC /PUNTERO PARA ACTUADOR P50', 2, 47, 0, 1, 0, 0, 1),
(1462, 'EQ07008', 'JB-153-RX- ESFEROMATIC /TORNILLO DEL PRENSA  1/2\' A 1\'', 2, 47, 0, 6, 1, 0, 1),
(1463, 'EQ07009', 'JB-132-PA - ESFEROMATIC /BUJE GUIA V1S 1/2\' A 1\'', 2, 47, 0, 2, 1, 0, 1),
(1464, 'EQ07010', 'SUB-V- JB-123-SA- 0 / FOXBORO /OBTURADOR V1S 3/4\' CV1% ', 2, 47, 0, 2, 1, 160, 1),
(1465, 'EQ07011', ' SUB-V-JB - 800-CA-0 S/C ENPAQUETADURA  V1S DE 1/2\' A 1\'', 2, 47, 5, 4, 1, 55, 1),
(1466, 'EQ07012', 'JB-140-FN ESFEROMATIC SEMI ANILLO JUEGO P/V1S DE 1/2\' A 1\'', 2, 47, 0, 2, 1, 23, 1),
(1467, 'EQ07013', 'JB-140-FE ESFEROMATIC ARO PRENSA YUGO P/V1S DE 1/2\' A 1\'', 2, 47, 2, 3, 1, 11, 1),
(1468, 'EQ07014', 'B630 1 RT  ENPAQUETADURA', 2, 47, 0, 1, 0, 0, 1),
(1469, 'EQ07015', 'BULON  CALIDAD G8  P/CIEN  8 X 40 ', 2, 47, 0, 0, 0, 0, 1),
(1470, 'EQ07016', 'ALLEN C/CIL 12,9  5/16\' X 1 3/4', 2, 47, 0, 0, 0, 0, 1),
(1471, 'EQ07017', 'ENPAQUETADURA P50 P/ACTUADOR', 3, 47, 0, 1, 0, 0, 1),
(1472, 'EQ07018', 'JB-128-FA  / V1S D:1/2-3/4 X 5/8 ASIENTO ', 2, 47, 6, 4, 1, 0, 1),
(1473, 'EQ07019', 'JB-128-LA / V1S CV 5 ASIENTO', 2, 47, 4, 2, 1, 79, 1),
(1474, 'EQ07020', 'SUB-V-JB-155 -SA-0- OBTURADOR V1S LINEAL CV5', 2, 47, 6, 2, 1, 330, 1),
(1475, 'EQ07021', 'JB-140-LP FOXBORO  RESORTE EMPAQUETADURA/ V1S DE 1/2\' A 1\'', 2, 47, 0, 2, 1, 0, 1),
(1476, 'EQ07022', 'TORNILLO CAMPANA XB-118-CY ( ESF0000780)', 2, 47, 12, 6, 0, 0, 1),
(1477, 'EQ07023', 'TUERCAS CAMPANA XB171SR (ESF0000782)', 2, 47, 10, 6, 0, 0, 1),
(1478, 'EQ07024', 'TUERCA W-3000-1400-9 (ESF0000783)', 2, 47, 0, 2, 0, 0, 1),
(1479, 'EQ07025', 'CAMPANA GRANDE BB-301-TM', 2, 47, 1, 1, 0, 0, 1),
(1480, 'EQ07026', 'CAMPANA C/LIMITADOR BB-301-TN', 2, 47, 1, 1, 0, 0, 1),
(1481, 'EQ07027', 'DIAFRAGMA PB-120-WA', 2, 47, 0, 1, 0, 0, 1),
(1482, 'EQ07028', 'CAPUCHON PB 120- WE', 2, 47, 1, 1, 0, 0, 1),
(1483, 'EQ07029', 'XRING S68UU4216- 0', 2, 47, 2, 2, 0, 0, 1),
(1484, 'EQ07030', 'TORNILLO LIMITADOR-ACTUADOR NEUMATICO MOD P50-P110 XB-100-SN', 2, 47, 0, 1, 0, 0, 1),
(1485, 'EQ07031', 'JB-130-RY ARANDELA', 2, 47, 0, 4, 1, 0, 1),
(1486, 'EQ07032', 'JB-132-WA BRIDA DE PRENSA P/V1S 1/2\' A 1\'', 2, 47, 0, 2, 1, 26, 1),
(1487, 'EQ07033', 'JB-168-YC ARANDELA', 2, 47, 9, 4, 0, 0, 1),
(1488, 'EQ07034', 'TUERCA ACTUAD NEUMAT A DIAFRAG MOD P50-P110/ COD22955', 2, 47, 0, 1, 0, 0, 1),
(1489, 'EQ07035', 'SOPORTE', 2, 47, 1, 1, 0, 0, 1),
(1490, 'EQ07036', 'JB-118-RA / BONETE ESTÁNDAR 1\' ac carbono p/ 1/2\' a 1\'', 2, 47, 1, 1, 0, 136, 1),
(1491, 'EQ07037', 'JB-161-AX ESPINA', 2, 47, 2, 2, 0, 0, 1),
(1492, 'EQ07038', 'MANGERA X MTS ', 2, 47, 6, 2, 0, 0, 1),
(1493, 'EQ07039', 'JB-161-AY JUNTAS', 2, 47, 6, 2, 0, 0, 1),
(1494, 'EQ07040', 'JB-125-PB CAMISA VIS 1\'', 2, 47, 0, 1, 1, 0, 1),
(1495, 'EQ07041', 'W-2600- 1448-9 BULON 1/4\'', 2, 47, 0, 2, 0, 0, 1),
(1496, 'EQ07042', 'XO-118-CT TORNILLO-ACTUAD NEUM A DIAFR MOD P50-P110', 2, 47, 2, 2, 0, 0, 1),
(1497, 'EQ07043', 'JB-118-RC BONETE ESTÁNDAR 1\' AC.INOX P/1/2\' A 1\'', 2, 47, 1, 1, 0, 0, 1),
(1498, 'EQ07044', 'PALANCA B0  151 CN', 2, 47, 0, 1, 0, 0, 1),
(1499, 'EQ07045', 'RESORTE BO 105 ME', 2, 47, 0, 1, 0, 0, 1),
(1500, 'EQ07046', 'TORNILLO XO 100 RZ', 2, 47, 0, 1, 0, 0, 1),
(1501, 'EQ07047', 'JO 161 AX ACTUADOR PIN FOR V1 VALVULAS', 2, 47, 0, 1, 0, 0, 1),
(1502, 'EQ07048', 'TUERCAS XO 142 BQ', 2, 47, 0, 1, 0, 0, 1),
(1503, 'EQ07049', 'FIELTRO  JB139RK', 2, 47, 0, 2, 0, 0, 1),
(1504, 'EQ07050', 'X-RING SELLO DEL COJINETE BASTAGO ACTUADOR P50 S68UU 42120', 2, 47, 3, 3, 0, 0, 1),
(1505, 'EQ07051', 'ESPARRAGOS 7/16 X 50 CON TUERCA 7/16', 2, 47, 0, 4, 1, 0, 1),
(1506, 'EQ07052', 'MANOMETRO (MM40-35 2) - 1,5\' - 2 Kg / cm2 ', 2, 47, 0, 2, 1, 0, 1),
(1507, 'EQ07053', 'CUERPO Ø1\' 150 V1S, ACERO AL CARBONO ASTM A216 WB', 2, 47, 2, 1, 0, 0, 1),
(1508, 'EQ07054', 'ASIENTO 5CV JB128CA', 2, 47, 3, 2, 0, 0, 1),
(1509, 'EQ07055', 'CONECTOR PARA MANGUERA 6MM AIRE', 2, 47, 0, 0, 0, 0, 1),
(1510, 'EQ08001', 'PRO-FLO AIR VALVE ASSEMBLYCOD:04-2000-20-700', 2, 48, 2, 1, 1, 0, 1),
(1511, 'EQ08002', 'GASKET MUFLLER PLATE COD:04-3500-52-700', 2, 48, 2, 1, 1, 0, 1),
(1512, 'EQ08003', 'GASKET AIR VALVE COD: 04-2600-52-700', 2, 48, 2, 1, 1, 0, 1),
(1513, 'EQ08004', 'REMOVABLE PILOT SLEEVE ASSEMBLY COD: 04-3882-99', 2, 48, 2, 1, 1, 491, 1),
(1514, 'EQ08005', 'DIAPHRAGM  BACK UP COD: 04-1060-51', 2, 48, 8, 4, 1, 184, 1),
(1515, 'EQ08006', 'DIAPHRAGM  PTFE COD: 04-1010-55', 2, 48, 8, 4, 1, 1, 1),
(1516, 'EQ08007', 'VALVE SEAT COD: 04-1125-21', 2, 48, 4, 4, 1, 91, 1),
(1517, 'EQ08008', 'VALVE SEAT O-RING ( 2,250\'X210\') COD: 08-1300-60-500', 2, 48, 4, 4, 1, 91, 1),
(1518, 'EQ08009', 'MANIFOLD O-RING (3,350\'X210\') COD: 04-1371-60   ', 2, 48, 4, 4, 1, 141, 1),
(1519, 'EQ08010', 'PILOT SPOOL RETAINING O-RING COD: 04-2650-49-700', 2, 48, 4, 4, 1, 0, 1),
(1520, 'EQ08011', 'BOLA VALVULA DE TEFLON COD: 04-1080-55', 2, 48, 4, 4, 1, 192, 1),
(1521, 'EQ08012', 'GASKET, CENTER BLOCK, P4/P8 :: 04-3526-52', 2, 48, 4, 2, 1, 40, 1),
(1522, 'EQ09001', 'EJE Nº 0 AISI 316 P BBA DROTEC M-28 ACERO INOX.', 2, 49, 2, 1, 1, 630, 1),
(1523, 'EQ09002', 'P4201 POWER MONITOR,1&3PH,100-575V SUNDYNE PM1200/575V', 2, 49, 0, 1, 1, 4020, 1),
(1524, 'EQ09003', 'IMPULSOR N  20 BOMBA DROTEC M28', 2, 49, 2, 1, 1, 0, 1),
(1525, 'EQ09004', 'IMPULSOR N 48 NO SE SABE', 2, 49, 2, 1, 1, 0, 1),
(1526, 'EQ09005', 'ACOPLE DE MOTOR Y BOMBA COMPLETA', 2, 49, 1, 1, 1, 0, 1),
(1527, 'EQ09006', 'BOMBA CENTRIFUGA DROTEC MOD M-28 EN HIERRO ', 2, 49, 0, 0, 0, 0, 1),
(1528, 'EQ09007', 'RODAMIENTO 6204 2RS C.3', 2, 49, 2, 1, 0, 12, 1),
(1529, 'EQ09008', 'SELLO MECANIZADO P/BOMBA DROTEC SCA 020 BH3V asiento ceramico', 2, 49, 2, 1, 1, 342, 1),
(1530, 'EQ10001', 'EXTREMO LIQUIDO DE BOMBA CM MAG P30 PP', 2, 50, 0, 0, 0, 0, 0),
(1531, 'EQ10002', 'BOMBA CON MOTOR CM MAG-P30PP 4HP 3000 /SUNDGARD PM1200', 2, 50, 0, 0, 0, 0, 0),
(1532, 'EQ11001', ' 1200 FILTRO DE ACEITE  CODIGO: 6.3464.1', 2, 51, 1, 2, 1, 200, 1),
(1533, 'EQ11002', ' 1250 ELEMENTO PARA FILTRO DE AIRE CODIGO: 6.4149.0', 2, 51, 0, 2, 1, 379, 1),
(1534, 'EQ11003', '1450 CARTUCHO SEP.DE ACEITE CPL 6.3571.0', 2, 51, 2, 2, 1, 1040, 1),
(1535, 'EQ11004', '4400 ACOPLAMIENTO CPL  5.3129E3', 2, 51, 2, 2, 1, 700, 1),
(1536, 'EQ11005', '2104 KIT REPARACION VAL .AUXILIAR COMB DESP. 400707.00020', 2, 51, 3, 2, 1, 194, 1),
(1537, 'EQ11006', 'PANEL FILTRANTE COD 6.3572.0', 2, 51, 0, 2, 1, 3, 1),
(1538, 'EQ11007', 'ACEITE SIGMA LUBRICANTE L 14707 - S460  X 20 LTS', 2, 51, 4, 4, 1, 763, 1),
(1539, 'EQ11008', 'ELEMENTO PARA FILTRO DE AIRE CODIGO: 6.4139.0', 2, 51, 3, 2, 0, 0, 0),
(1540, 'EQ11009', 'KIT REP. VALVULA   DE ADMISION COD: 400892.0', 2, 51, 2, 2, 1, 0, 1),
(1541, 'EQ11010', 'KIT DE MANTENIMIENTO VAL. DESPRES COD: 400706.0 ', 2, 51, 1, 1, 0, 0, 1),
(1542, 'EQ11011', 'KIT de Reparación Purgador Automático Kaeser Eco Drain 13', 2, 51, 1, 1, 1, 0, 1),
(1543, 'EQ11012', 'Antivibration mount 90x70x43 (pata motor electrico)  6.4168.00010', 2, 51, 4, 4, 1, 48, 1),
(1544, 'EQ11013', 'Antivibration mount 87x65x108 70Sh(A) (pata soporte tornillo)  6.1354.0', 2, 51, 4, 4, 1, 94, 1),
(1545, 'EQ11014', 'Filter cartridge E-E-138 (ELEMENTO DE FILTRO DE LÍNEA)  9.4867.0', 2, 51, 2, 2, 1, 1024, 1),
(1546, 'EQ11015', 'Condensate drain (PURGA CONDENSADO PARA FILTRO DE LÍNEA) 8.6352.0 ', 2, 51, 2, 2, 1, 313, 1),
(1547, 'EQ11016', 'Sealing ring Aeroquip Ø22xØ34.5 COD 5.2767.0 ', 2, 51, 2, 2, 1, 35, 1),
(1548, 'EQ11017', 'kit mant purgador ECO-DR.31/31F COD 8.2474.01540', 2, 51, 2, 2, 1, 479, 1),
(1549, 'EQ11018', ' Telethermometer -10-60°C 2000 COD 8.1925.0', 2, 51, 2, 2, 1, 170, 1),
(1550, 'EQ11019', 'kit mant purga ECO-DR.31 Vario COD8.2474.01890', 2, 51, 2, 2, 1, 531, 1),
(1551, 'EQ11020', 'TAPA DE FILTRO DE AIRE COD. 5.5340E20010', 2, 51, 0, 1, 1, 284, 1),
(1552, 'EQ12001', 'FILTROS ASPIRACION PRIMARIO EP-070 (EP3050078)', 2, 52, 2, 1, 0, 0, 0),
(1553, 'EQ12002', 'FILTROS ASPIRACION SECUNDARIO ES-070 (PE3050079)', 2, 52, 2, 1, 0, 0, 0),
(1554, 'EQ12003', 'FILTRO ACEITE W 11102 (PE03050085)', 2, 52, 2, 1, 0, 0, 0),
(1555, 'EQ12004', 'FILTRO COALECENTE 17/30-8 AGUJERO', 2, 52, 1, 1, 0, 0, 0),
(1556, 'EQ12005', 'FLEXIBLE AISI 238W22424 11/2\' X 300MM (PE0351805)', 2, 52, 1, 1, 0, 0, 0),
(1557, 'EQ12006', 'FLEXIBLE AISI 238 1 1/4X450MM    220201', 2, 52, 1, 1, 0, 0, 0),
(1558, 'EQ12007', 'FLEXIBLE AISI 238 3/4 X600 MM  11212', 2, 52, 2, 1, 0, 0, 0),
(1559, 'EQ12008', 'KIT DE REPUESTO DE REPARACION DE 3/8\' OE 7302', 2, 52, 3, 0, 0, 0, 0),
(1560, 'EQ12009', 'MANGUERA CORRUGADA P/COMPRESOR DE AIRE X METRO COD:PE0850253', 3, 52, 3, 1, 0, 0, 0),
(1561, 'EQ12010', 'RETEN PARA COMPRESOR DE AIRE A TORNILLO VMC 50X65X10 GARLOCK', 2, 52, 1, 1, 0, 0, 0),
(1562, 'EQ12011', 'SILENCIADOR ', 2, 52, 1, 0, 0, 0, 0),
(1563, 'EQ12012', 'VALVULA SOLENOIDE 3/8\' 220V', 2, 52, 2, 1, 0, 0, 0),
(1564, 'EQ12013', 'VALVULA TERMOSTARTICA DANFOSS TEX 12 R22', 2, 52, 0, 0, 0, 0, 0),
(1565, 'EQ12014', 'VISOR DE LIQUIDO P/R- 22 DANFOSS', 2, 52, 0, 0, 0, 0, 0),
(1566, 'EQ12015', 'CORREAS BX55 DENTADA  serie 0/1', 2, 52, 4, 0, 0, 0, 0),
(1567, 'EQ12016', 'CUBETA PARA RETEN ', 2, 52, 4, 1, 0, 0, 0),
(1568, 'EQ12017', 'RODAMIENTO Nº NU2209 ', 2, 52, 2, 1, 0, 0, 0),
(1569, 'EQ12018', 'ACEITE HIDRAULICO YPF HIDRAULICO 68 X LTS', 2, 52, 0, 0, 0, 0, 0),
(1570, 'EQ12019', 'CARTUCHO FILTRO COALESCENTE MODELO 6C25-187', 2, 52, 0, 0, 0, 0, 0),
(1571, 'EQ12020', 'CARTUCHO FILTRO DE PARTICULAS MODELO 10C25-187', 2, 52, 0, 0, 0, 0, 0),
(1572, 'EQ12021', 'CARTUCHO FILTRO DE CARBON MODELO AU25-187', 2, 52, 0, 0, 0, 0, 0),
(1573, 'EQ12022', 'RODAMIENTO NU 207', 2, 52, 3, 1, 0, 0, 0),
(1574, 'EQ12023', 'RODAMIENTO 7306', 2, 52, 2, 1, 0, 0, 0),
(1575, 'EQ12024', 'REDUCCION GOMA 3\' A 2\'', 2, 52, 1, 1, 0, 0, 0),
(1576, 'EQ12025', 'DISCOS HASTELOY ', 2, 52, 4, 1, 0, 0, 0),
(1577, 'EQ13001', 'Filtros DESIDRATADOR DANFOSS D48 (EQUIPO DE FRIO VMC)', 2, 53, 2, 2, 1, 40, 1),
(1578, 'EQ13002', 'FILTRO ACEITE PRIMARIO PARA COMPRESOR XRV 163 (EQUIPO DE FRIO VMC)', 2, 53, 0, 1, 1, 0, 1),
(1579, 'EQ13003', 'FILTRO ACEITE  SECUNDARIO PARA COMPRESOR XRV 163 (EQUIPO DE FRIO VMC', 2, 53, 3, 0, 0, 421, 1),
(1580, 'EQ13004', 'FILTRO COALECENTE TIPO CARTUCHO COMPRESOR XRV 163 EQUIPO DE FRIO VMC)', 2, 53, 4, 1, 1, 0, 1),
(1581, 'EQ13005', 'FUENTE ALIMENTACION MODULOS C.C.G 17BCA2M (PE 1150450)', 2, 53, 1, 1, 1, 0, 1),
(1582, 'EQ13006', 'GOMA P/ MANCHON TIPO  F7 C/BULONES Y ARANDELAS  ( EQUIPO DE FRIO)', 2, 53, 1, 1, 1, 335, 1),
(1583, 'EQ13007', 'PT 100 DE ROSCA DE 1/2 LARGO 50 mm ( EQUIPO DE FRIO)', 2, 53, 1, 1, 1, 0, 1),
(1584, 'EQ13008', 'TRADUCTOR DE BAJA 5PK 1000,000- range : 0,5 +7 BAR- SALIDA 4-20µ A marca Carel (EQUIPO DE FRIO)', 2, 53, 1, 1, 1, 0, 1),
(1585, 'EQ13009', 'TRADUCTOR DE ALTA 5PK 2500,000 -range : 0+0,25 BAR SALIDA 4-20 µ A marca Carel (EQUIPO DE FRIO)', 2, 53, 2, 1, 1, 0, 1),
(1586, 'EQ13010', 'TRANSMISOR DE SEÑAL (AZUL) RTD PT100  0-5AMP  SALIDA 4-20A (EQUIPO DE FRIO)', 2, 53, 1, 1, 1, 0, 1),
(1587, 'EQ13011', 'TRANSMISOR DE SEÑAL ENTRADA RTD PT100 -50ºC/150ºC SALIDA 4-20A(EQUIPO DE FRIO)', 2, 53, 1, 1, 1, 0, 1),
(1588, 'EQ13012', 'VALVULA SOLENOIDE 1/4\' (EQUIPO DE FRIO)', 2, 53, 1, 1, 1, 0, 1),
(1589, 'EQ13013', 'RESISTENSIA CALEFACTORA PARA COMPRESOR HOWDEN XRV163 (EQUIPO DE FRIO)', 2, 53, 0, 0, 0, 0, 1),
(1590, 'EQ13014', 'TRANSDUCTOR DE PRESION 0 A 25 BAR - SALIDA 4 a 20 mA - SPK 25000      Codigo PE1151079', 2, 53, 0, 2, 1, 0, 1),
(1591, 'EQ13015', 'FILTRO DE ACEITE TIPO CELULOSA 15-4- Z P/COMP.A TORNILLO', 2, 53, 0, 2, 1, 0, 1),
(1592, 'EQ13016', 'FILTRO DE ACEITE PRIMARIO 160-4 E P/COMP.A TORNILLOS', 2, 53, 0, 1, 1, 0, 1),
(1593, 'EQ13017', 'FILTRO COALESCENTE TIPO CARTUCHO CORTO', 2, 53, 0, 2, 1, 0, 1),
(1594, 'EQ14001', 'CARCASA DE BOMBA  SIN TAPA 32-160 ( AGUA BLANDA PU 80)', 2, 54, 0, 0, 0, 0, 1),
(1595, 'EQ14002', 'CARCASA DE BOMBA SIN TAPA 32-125 ( AGUA OSMOTOSIDA PU81)', 2, 54, 0, 0, 0, 0, 1),
(1596, 'EQ14003', 'IMPULSOR DE MD 32-160 2,2', 2, 54, 0, 1, 1, 0, 1),
(1597, 'EQ14004', 'IMPULSOR DE MD 32-125', 2, 54, 2, 1, 1, 0, 1),
(1598, 'EQ14005', 'SELLOS SIMPLE RESORTE 22mm ( 160)', 2, 54, 2, 1, 1, 120, 1),
(1599, 'EQ14006', 'O´RING MD 32-160  2,2  (176X 3,53 mm)', 2, 54, 4, 3, 1, 11, 1),
(1600, 'EQ14007', 'O´RING MD 32-125', 2, 54, 3, 1, 1, 0, 1),
(1601, 'EQ14008', 'O´RING DE TEFLON DE 50,8X38,1  VA EN LAS JUNTAS', 2, 54, 4, 0, 0, 0, 1),
(1602, 'EQ14009', 'O´RING DE TEFLON DE 42,9X33,3', 2, 54, 4, 0, 0, 0, 1),
(1603, 'EQ14010', 'O´RING DE TEFLON DE 35,1 X 25,4', 2, 54, 9, 0, 0, 0, 1),
(1604, 'EQ14011', 'JUNTA DE BRIBA DE PTF FO 7029', 2, 54, 1, 0, 0, 0, 1),
(1605, 'EQ14012', 'VENTILADOR 170-24', 2, 54, 1, 1, 0, 10, 1),
(1606, 'EQ14013', 'SELLO MECANICO 32-125   1,1', 2, 54, 2, 1, 1, 120, 1),
(1607, 'EQ15001', ' IMPULSOR SERIE 5 COD: 206-053-02 ( I-5T ) ', 2, 55, 6, 5, 1, 521, 1),
(1608, 'EQ15002', 'SELLO MECANICO DE  IRUMA I-5T  CAJA MULTI RESORTE 20MM PISTAS DE CARBON Y TUNGSTENO', 2, 55, 1, 6, 1, 235, 1),
(1609, 'EQ15003', 'SELLO MECANICO DE  IRUMA I-5T UNIRESORTE', 2, 55, 0, 0, 0, 0, 1),
(1610, 'EQ15004', 'SELLO MECANICO DE  IRUMA I-5T LAMINADO', 2, 55, 0, 0, 0, 0, 1),
(1611, 'EQ15005', 'EJES DE SERIE 5 DOBLE AISI 420 (EJE-026)', 2, 55, 0, 3, 1, 307, 1),
(1612, 'EQ15006', 'DIFUSOR I5T DERECHO 676-318-01', 2, 55, 2, 3, 1, 161, 1),
(1613, 'EQ15007', 'DIFUSOR I5T IZQUIERDO 676-317-01', 2, 55, 2, 3, 1, 161, 1),
(1614, 'EQ15008', 'SEPARADOR IZQUIERDO I-5T CODIGO: 772-076-01', 2, 55, 2, 3, 1, 199, 1),
(1615, 'EQ15009', 'SEPARADOR DERECHO I-5T CODIGO: 772-074-01', 2, 55, 2, 3, 1, 199, 1),
(1616, 'EQ15010', 'O RING DE VITON N116 ', 2, 55, 45, 6, 1, 0, 1),
(1617, 'EQ15011', 'O RING DE VITON N117', 2, 55, 61, 6, 1, 0, 1),
(1618, 'EQ15012', 'TAPA PRENSA SERIE 5 L/CIEGO CODIGO: 201-063-1 ', 2, 55, 1, 1, 0, 140, 1),
(1619, 'EQ15013', 'TAPA PRENSA SERIE 5 L/MANCHON CODIGO:201-064-01 ', 2, 55, 2, 1, 0, 140, 1),
(1620, 'EQ15014', 'TAPA RULEMAN S5 L/ CIEGO CODIGO: 201-069-1 ', 2, 55, 1, 1, 0, 26, 1),
(1621, 'EQ15015', 'TAPA RULEMAN S5 L/ MANCHON CODIGO: 201-070-1 ', 2, 55, 2, 1, 0, 26, 1),
(1622, 'EQ15016', 'CUERPO S5 DOBLE ', 2, 55, 3, 0, 0, 0, 1),
(1623, 'EQ15017', 'JUEGO DE TIRADORES SERIE 5 CODIGO: 134-003-26', 2, 55, 1, 1, 1, 11, 1),
(1624, 'EQ15018', 'TAPON DE Ø 1/4\' GAS', 2, 55, 0, 0, 0, 0, 1),
(1625, 'EQ15019', 'O RING TAPA SERIE 5 (439)  164,47 X 178,45 X 699 CODIGO 007-001-36', 2, 55, 4, 4, 1, 23, 1),
(1626, 'EQ15020', 'CONJUNTO DIFUSOR DERECHO, IZQUIERDO, SEPARADOR DERECHO, IZQUIERDO I-5T', 2, 55, 0, 0, 1, 0, 1),
(1627, 'EQ15021', 'IMPULSOR H/I 5 (DISCO N°6) AISI 316, COD 206-053-2', 2, 55, 2, 2, 1, 1327, 1),
(1628, 'EQ16001', ' IMPULSOR E5T (DISCO Nº5) AISI 316 CODIGO: 206-052-025', 2, 56, 4, 4, 1, 1259, 1),
(1629, 'EQ16002', 'SELLO MECANICO DE  IRUMA E-5T  CAJA MULTI RESORTE 20MM PISTAS DE CARBON Y TUNGSTENO', 2, 56, 0, 4, 1, 235, 1),
(1630, 'EQ16003', 'EJES DE SERIE 5 DOBLE AISI 420 (EJE-026) ', 2, 56, 2, 3, 1, 237, 1),
(1631, 'EQ16004', 'DIFUSOR E5T DERECHO CODIGO: 676-324-01', 2, 56, 3, 1, 1, 88, 1),
(1632, 'EQ16005', 'DIFUSOR E5T IZQUIERDO CODIGO: 676-323-01', 2, 56, 3, 1, 1, 88, 1),
(1633, 'EQ16006', 'SEPARADOR E5 IZQUIERDO CODIGO: 772-084-01', 2, 56, 3, 1, 1, 88, 1),
(1634, 'EQ16007', 'SEPARADOR E5T DERECHO CODIGO: 772-082-01', 2, 56, 3, 1, 1, 88, 1),
(1635, 'EQ16008', 'O RING DE VITON N116 (USAR CODIGO EQ15010)', 2, 56, 0, 0, 0, 0, 0),
(1636, 'EQ16009', 'O RING DE VITON N117 (USAR CODIGO EQ15011)', 2, 56, 0, 0, 0, 0, 0),
(1637, 'EQ16010', 'TAPA PRENSA SERIE 5 L/CIEGO CODIGO: 201-063-1', 2, 56, 1, 1, 0, 154, 1),
(1638, 'EQ16011', 'TAPA PRENSA SERIE 5 L/MANCHON CODIGO:201-064-01', 2, 56, 1, 1, 0, 0, 1),
(1639, 'EQ16012', 'TAPA RULEMAN S5 L/ CIEGO CODIGO: 201-069-1', 2, 56, 2, 1, 0, 33, 1),
(1640, 'EQ16013', 'TAPA RULEMAN S5 L/ MANCHON CODIGO: 201-070-1', 2, 56, 1, 1, 0, 0, 1),
(1641, 'EQ16014', 'CUERPO S5 DOBLE ', 2, 56, 0, 0, 0, 0, 1),
(1642, 'EQ16015', 'TIRADORES SERIE 5 CODIGO: 134-003-26', 2, 56, 4, 1, 0, 0, 1),
(1643, 'EQ16016', 'CARTUCHO MALLA INOXIDABLE PLIZADA MP.100.3 ', 2, 56, 0, 1, 1, 426, 1),
(1644, 'EQ16017', 'O RING TAPA SERIE 5 (439)  164,47 X 178,45 X 699 CODIGO 007-001-36 ', 2, 56, 3, 2, 0, 15, 1),
(1645, 'EQ17001', 'BRIDA S (DE SELLO) F6 ', 2, 57, 0, 1, 1, 0, 1),
(1646, 'EQ17002', 'IMPULSOR F-6 (DISCO Nº 10) Codigo: 206-055-02', 2, 57, 6, 6, 1, 477, 1),
(1647, 'EQ17003', 'DIFUSOR F-6 (DERECHO) Codigo: 676-402-01', 2, 57, 3, 3, 1, 145, 1),
(1648, 'EQ17004', 'DIFUSOR F-6 (IZQUIERDO-Fi) Codigo: 676-403-01', 2, 57, 3, 3, 1, 145, 1),
(1649, 'EQ17005', 'TAPA PRENSA SERIE 6 (NODULAR) CODIGO 201-065-01', 2, 57, 0, 0, 0, 0, 1),
(1650, 'EQ17006', ' EJE  IRUMA F6 - SERIE 6 DOBLE (EJE- 028)', 2, 57, 4, 3, 1, 203, 1),
(1651, 'EQ17007', 'SELLO MECANICO IRUMA F6 - EJE 30MM', 2, 57, 2, 6, 1, 332, 1),
(1652, 'EQ17008', 'TAPA CARCASA', 2, 57, 0, 0, 0, 0, 1),
(1653, 'EQ17009', 'SEPARADOR F-6T LADO DERECHO', 2, 57, 3, 3, 1, 181, 1),
(1654, 'EQ17010', 'SEPARADOR F-6T LADO IZQUIERDO', 2, 57, 3, 3, 1, 181, 1),
(1655, 'EQ17011', 'TAPA RULEMAN SERIE 6 L/CIEGO', 2, 57, 1, 1, 0, 0, 1),
(1656, 'EQ17012', 'TAPA RULEMAN SERIE 6 L/MANCHON', 2, 57, 1, 1, 0, 0, 1),
(1657, 'EQ17013', 'CARTUCHO MALLA INOXIDABLE PLIZADA MP.400.4', 2, 57, 4, 1, 1, 427, 1),
(1658, 'EQ17014', 'CENTRO ELASTICO 14-1 TECNO-PERIFLEX 98.488-103.178', 2, 57, 4, 1, 1, 0, 1),
(1659, 'EQ18001', 'ANILLO P/EJE DIN 471 X 100 Nº20 (SEGURO SEGUER)', 2, 58, 1, 1, 1, 4, 1),
(1660, 'EQ18002', 'BOMBA WORTHINGTON 1 - CN - 52 CLASE C PUNTA EJE LIBRE ', 2, 58, 0, 0, 0, 3440, 1),
(1661, 'EQ18003', 'BRIDA PRENSAESTOPA  HIERRO FUNDIDO', 2, 58, 2, 1, 1, 0, 1),
(1662, 'EQ18004', 'CAMISA EJE ACERO INOX,', 2, 58, 1, 1, 1, 553, 1),
(1663, 'EQ18005', 'CUERPO HIERRO  FUNDIDO', 2, 58, 0, 0, 0, 0, 1),
(1664, 'EQ18006', 'EJE BBA. CNFE-62 SAE -1045', 2, 58, 1, 1, 1, 603, 1),
(1665, 'EQ18007', 'IMPULSOR HIERRO FUNDIDO  ØMAXIMO  1-CN-52', 2, 58, 1, 1, 1, 803, 1),
(1666, 'EQ18008', 'SELLO MECANICO BU 1000 (C/Ct/Viton) Ø 24mm', 2, 58, 2, 1, 1, 557, 1),
(1667, 'EQ18009', 'TAPA HIERRO FUNDIDO ', 2, 58, 0, 0, 0, 0, 1),
(1668, 'EQ18010', 'IMPULSOR HIERRO FUNDIDO  ØMAXIMO  1-CN-62', 2, 58, 1, 1, 1, 803, 1),
(1669, 'EQ18011', 'EJE BOMBA CN 52', 2, 58, 1, 1, 1, 455, 1),
(1670, 'EQ19001', 'IMPULSOR HIERRO FUNDIDO MAXIMO 1 1/2', 2, 59, 2, 1, 1, 0, 1),
(1671, 'EQ19002', 'EJE BBA. WORTHINGTON CN-42', 2, 59, 2, 1, 1, 455, 1),
(1672, 'EQ19003', 'CAMISA  CN- 42 1 1/2', 2, 59, 1, 1, 1, 0, 1),
(1673, 'EQ19004', 'SELLO MECANICO  UNIRESORTE 024 ', 2, 59, 1, 1, 1, 0, 1),
(1674, 'EQ19005', 'TAPA Hº Fº ', 2, 59, 1, 0, 0, 0, 1),
(1675, 'EQ19006', 'CUERPO  Hº Fº  ', 2, 59, 0, 0, 0, 0, 1),
(1676, 'EQ20001', 'IMPULSOR DE HIERRO FUNDIDO ØMAX ASTM A48 CI 30', 2, 60, 0, 2, 1, 715, 1),
(1677, 'EQ20002', 'SELLO MECANICO STD DE Ø 1 3/8\' O 35 MM UNIRESORTE', 2, 60, 0, 1, 1, 241, 1),
(1678, 'EQ20003', 'ARO ROZANTE DE CUERPO DE BOMBA ', 2, 60, 0, 1, 1, 141, 1),
(1679, 'EQ20004', 'ADAPTADOR DE BOMBA DE H° F° N° 8', 2, 60, 2, 1, 1, 663, 1),
(1680, 'EQ20005', 'TORNILLO DE UNION CUERPO', 2, 60, 14, 1, 1, 2, 1),
(1681, 'EQ20006', 'JUNTA DE CUERPO', 2, 60, 1, 1, 1, 28, 1),
(1682, 'EQ20007', 'TORNILLO AJUSTE  IMPULSOR DE AISI', 2, 60, 0, 1, 1, 52, 1),
(1683, 'EQ20008', 'ARANDELA AJUSTE  IMPULSOR DE AISI', 2, 60, 0, 1, 1, 10, 1),
(1684, 'EQ20009', 'EJE ACERO SAE-1045 P/BOMBA WORTHINGTON D 814 3x2x8 T/F', 2, 60, 2, 1, 1, 732, 1),
(1685, 'EQ20010', 'CAMISA DE EJE BB WORTIHINGTON D814 3x2x8 T/F', 2, 60, 0, 1, 1, 374, 1),
(1686, 'EQ20011', 'ANILLO ADAPTADOR BB WORTIHINGTON D814 3x2x8 T/F', 2, 60, 0, 1, 1, 245, 1),
(1687, 'EQ20012', 'ORING CAMISA BB WORTIHINGTON D814 3x2x8 T/F', 2, 60, 0, 1, 1, 3, 1),
(1688, 'EQ20013', 'CHAVETA IMPULSOR BB WORTIHINGTON D814 3x2x8 T/F', 2, 60, 0, 1, 1, 4, 1),
(1689, 'EQ20014', 'TAPONES CARCASA BB WORTIHINGTON D814 3x2x8 T/F', 2, 60, 2, 1, 1, 3, 1),
(1690, 'EQ20015', 'TORNILLOS ADAPTADOR BASTIDOR BB WORTIHINGTON D814 3x2x8 T/F', 2, 60, 4, 1, 1, 2, 1),
(1691, 'EQ20016', 'COJINETE EMPUJE BB WORTIHINGTON D814 3x2x8 T/F', 2, 60, 0, 1, 1, 35, 1),
(1692, 'EQ20017', 'COJINETE DESLIZANTE BB WORTIHINGTON D814 3x2x8 T/F', 2, 60, 1, 1, 1, 28, 1),
(1693, 'EQ20018', 'ARO DE RETENCION CONJINETE BB WORTIHINGTON D814 3x2x8 T/F', 2, 60, 0, 1, 1, 3, 1),
(1694, 'EQ21001', 'BIELA CODIGO:  029-009-021', 2, 61, 2, 0, 0, 0, 1),
(1695, 'EQ21002', 'ENGRANAJE DOBLE', 2, 61, 1, 0, 0, 0, 1),
(1696, 'EQ21003', 'ENGRANAJE RECTO', 2, 61, 2, 0, 0, 0, 1),
(1697, 'EQ21004', 'ENGRANAJE REDONDO', 2, 61, 2, 0, 0, 0, 1),
(1698, 'EQ21005', 'HERRAMIENTA  ESPECIAL ', 2, 61, 0, 0, 0, 0, 1),
(1699, 'EQ21006', 'RASCA ACEITE DE ALUMINIO VASTAGO 40MM COD : MB104PO0040 ( JUEGO)COD:NCLR40-MB', 2, 61, 18, 5, 1, 0, 1),
(1700, 'EQ21007', 'KIT ANILLOS SELLO NEA CHICO cód. NC40-MB - formado por 1 anillo radial y 2 anillos tang.', 2, 61, 61, 10, 1, 226, 1),
(1701, 'EQ21008', 'SELLO Nº4', 2, 61, 0, 0, 0, 0, 1),
(1702, 'EQ21009', 'SELLO Nº5', 2, 61, 0, 0, 0, 0, 1),
(1703, 'EQ21010', 'TORNILLO ALLEN S/ CABEZA 12,9 P/CIEN 16 X 50', 2, 61, 8, 0, 0, 0, 1),
(1704, 'EQ21011', 'VASTAGO 40MM COD : MB78PO1050', 2, 61, 3, 1, 1, 2864, 1),
(1705, 'EQ21012', 'ARANDELA  DE VALVULA MEDIANA', 2, 61, 0, 0, 0, 0, 1),
(1706, 'EQ21013', 'ARANDELA  DE VALVULA GRANDE', 2, 61, 0, 0, 0, 0, 1),
(1707, 'EQ21014', 'CORREA A116 CHICO ', 2, 61, 2, 1, 1, 0, 1),
(1708, 'EQ21015', 'PRESOSTATO DE BAJA (KP35)', 2, 61, 1, 1, 1, 0, 1),
(1709, 'EQ21016', 'TUERCA NUEVA P/ VASTAGO DE 1Y2º ET NEA CHICO ', 2, 61, 1, 0, 0, 0, 1),
(1710, 'EQ21017', 'FILTRO DE AIRE MARCA FRAM CA 2690', 2, 61, 1, 1, 1, 0, 1),
(1711, 'EQ21018', 'RODAMIENTO DE RODILLO CILINDRICOS 180/85X86 NJ-2317 ECP', 2, 61, 0, 1, 1, 0, 1),
(1712, 'EQ21019', 'ARO COMPRESION 1º ETAPA Ø 245 X 9,75  ( JUEGO)', 2, 61, 17, 4, 0, 252, 1),
(1713, 'EQ21020', 'ARO COMPRESION 2º ETAPA Ø 122 x 7.9 Esp', 2, 61, 12, 4, 1, 183, 1),
(1714, 'EQ21021', 'ARO GUIA 1º ETAPA Ø 240 x 20 Esp', 2, 61, 5, 1, 1, 302, 1),
(1715, 'EQ21022', 'ARO GUIA 2º ETAPA Ø 109 x 19,4 Esp', 2, 61, 6, 1, 1, 192, 1),
(1716, 'EQ21023', 'MEMBRANA (DISCO DE CIERRE) 1º ET. Ø156,8 e=1,25mm ', 2, 61, 14, 10, 1, 93, 1),
(1717, 'EQ21024', 'MEMBRANA (DISCO DE CIERRE) 2º ET. Ø118 e=1,1mm ', 2, 61, 12, 10, 1, 58, 1),
(1718, 'EQ22001', 'VASTAGO Ø35mm X 1100mm  COD:MB78PO1038  1 RA ETAPA', 2, 62, 2, 1, 1, 0, 1),
(1719, 'EQ22002', 'VASTAGO Ø35mm X 1200mm COD :MB78PO0274   2 DA ETAPA', 2, 62, 1, 1, 1, 0, 1),
(1720, 'EQ22003', 'ARO COMP.1ªETAPA (B) 296x273x12 MM MAT PTFE+COKE+GRAFITO', 2, 62, 5, 4, 1, 298, 1),
(1721, 'EQ22004', 'ARO COMP.2ªETAPA (B) 158 X 143 X 10,5MM MAT PTFE+COKE+GRAFITO', 2, 62, 4, 4, 1, 168, 1),
(1722, 'EQ22005', 'ARO GUIA 1ªETAPA 296x277x 25 MM MAT PTFE+COKE+GRAFITO', 2, 62, 2, 1, 1, 379, 1),
(1723, 'EQ22006', 'ARO GUIA 2ªETAPA 158,5X 148 X 21MM MAT PTFE+COKE+GRAFITO', 2, 62, 1, 1, 1, 234, 1),
(1724, 'EQ22007', 'BOMBA DE ACEITE P/COMPRESOR DE PROCESO GRANDE BTA', 2, 62, 0, 0, 0, 0, 1),
(1725, 'EQ22008', 'BRIDA P/VASTAGO 139,8MM COD:MB105PO0130', 2, 62, 0, 1, 1, 0, 1),
(1726, 'EQ22009', 'BUJE DE LA BIELA DE BRONCE', 2, 62, 0, 0, 0, 0, 1),
(1727, 'EQ22010', 'BUJE DE PISTON GUIA', 2, 62, 1, 0, 0, 0, 1),
(1728, 'EQ22011', 'COJINTE DE CIGÜEÑAL', 2, 62, 0, 0, 0, 0, 1),
(1729, 'EQ22012', 'CORREA B180 ', 2, 62, 8, 4, 1, 67, 1),
(1730, 'EQ22013', 'FILTRO LANSS EF-680   (Ø155 int, Ø195 ext x 400 largo)', 2, 62, 0, 1, 1, 0, 1),
(1731, 'EQ22014', 'JUNTAS - ABRIL IT.O -280 X 190 X 2 Nº DE NEA 029- 456 -193', 2, 62, 0, 0, 0, 0, 1),
(1732, 'EQ22015', 'JUNTAS -ABRIL 280 X 2 (CUADRADO ) Nº DE NEA 002-455-049', 2, 62, 2, 0, 0, 0, 1),
(1733, 'EQ22016', 'JUNTAS -ABRIL -340/275 DIAM X 1 MM Nº DE NEA -035 - 455 - 054', 2, 62, 1, 0, 0, 0, 1),
(1734, 'EQ22017', 'PISTON GUIA  CODIGO: 029-290-012', 2, 62, 3, 0, 0, 0, 1),
(1735, 'EQ22018', 'TUERCAS PARA VALVULA COMPRESOR PROCESO', 2, 62, 5, 1, 1, 0, 1),
(1736, 'EQ22019', 'SELLOS DE COMPRESOR PROCESO', 2, 62, 0, 0, 0, 0, 0),
(1737, 'EQ22020', 'POLEA 117,80-0,02', 2, 62, 1, 1, 1, 0, 1),
(1738, 'EQ22021', 'TORNILLO ALLEN  5/8 X 50mm X 12,5 VUELTAS X PULGADA', 2, 62, 0, 0, 0, 0, 1),
(1739, 'EQ22022', 'SELLO PARA BOMBA DE ACEITE AF X 12 ', 2, 62, 0, 0, 0, 0, 1),
(1740, 'EQ22023', 'JUNTA DE ALUMINIO Øext 170mm diametro interior 161mm x 2 mm de espesor', 2, 62, 10, 8, 1, 17, 1),
(1741, 'EQ22024', 'JUNTA DE ALUMINIO Øext 108mm diametro interior 103mm x 2 mm de espesor.', 2, 62, 10, 8, 1, 14, 1),
(1742, 'EQ22025', 'KIT ANILLOS SELLO NEA GRANDE  ( PTFE)  (TRIO) NG-35-MB', 2, 62, 24, 20, 1, 240, 1),
(1743, 'EQ22026', 'MEMBRANA Ø 156,8  e 1,25 mm', 2, 62, 12, 10, 1, 94, 1),
(1744, 'EQ22027', 'AMORTIGUADOR Ø 156,8 e 1 mm', 2, 62, 4, 4, 1, 97, 1),
(1745, 'EQ22028', 'VALVULA DE DESCARGA 1º ETAP Ø 171,8 (cuerpo)', 2, 62, 1, 1, 1, 933, 1),
(1746, 'EQ22029', 'VALVULA DE SUCCION 1º ETAP Ø 171,8 (cuerpo)', 2, 62, 1, 1, 1, 933, 1),
(1747, 'EQ22030', 'MEMBRANA Ø 100,8  e 1,1 mm', 2, 62, 24, 10, 1, 59, 1),
(1748, 'EQ22031', 'AMORTIGUADOR Ø 100,8  e 0,8 mm', 2, 62, 4, 4, 1, 61, 1),
(1749, 'EQ22032', 'VALVULA DE DESCARGA 2º ETAP Ø 108,5 (cuerpo)', 2, 62, 0, 1, 1, 0, 1),
(1750, 'EQ22033', 'VALVULA DE SUCCION 2º ETAP Ø 108,5 (cuerpo)', 2, 62, 0, 1, 1, 0, 1),
(1751, 'EQ22034', 'RESORTE  Øa 0,9 X Ø 9mm x 12 ', 2, 62, 72, 72, 1, 2, 1),
(1752, 'EQ22035', 'RESORTE  Øa 0,5 X Ø 6mm x 10,5', 2, 62, 36, 36, 1, 2, 1),
(1753, 'EQ22036', 'TUERCAS CIEGAS  5/16 x 155', 2, 62, 6, 1, 0, 0, 1),
(1754, 'EQ22037', 'ALLEM S/ CAB 12 9', 2, 62, 10, 1, 0, 0, 1),
(1755, 'EQ22038', 'INSERT DE 12 X 1,75', 2, 62, 11, 1, 0, 0, 1),
(1756, 'EQ23001', ' 1331+071 O\'RING (POSICION 24C VALVULA DE ALIVIO DE ALTA)', 2, 63, 4, 1, 1, 0, 1),
(1757, 'EQ23002', ' 1331+089 O\'RING ( FILTRO DE ASPIRACION)', 2, 63, 1, 1, 1, 0, 1),
(1758, 'EQ23003', 'SOLENOIDE JEFFERSON 1 3/8\'', 2, 63, 1, 1, 0, 0, 1),
(1759, 'EQ23004', ' 2132+021 BUJE DE BANCADA', 2, 63, 4, 2, 1, 0, 1),
(1760, 'EQ23005', '2133,003 MEDIO CASQUILLO DE BIELA', 2, 63, 24, 24, 1, 59, 1),
(1761, 'EQ23006', ' 2353-151 JUNTA DE CAJA DE VALVULA ', 2, 63, 0, 4, 1, 0, 1),
(1762, 'EQ23007', 'FILTRO DESIDRATADOR D48 DANFOSS', 2, 63, 6, 4, 1, 40, 1),
(1763, 'EQ23008', 'ORING VITON 2-233', 2, 63, 10, 0, 0, 0, 1),
(1764, 'EQ23009', 'SNV-ST G 1/2  1361.118  TOPE DE LA VALVULA', 2, 63, 1, 0, 0, 0, 1),
(1765, 'EQ23010', ' 3141+004 BOM OLI', 2, 63, 0, 0, 0, 0, 1),
(1766, 'EQ23011', 'PT 100 80 MM  1373.319', 2, 63, 1, 0, 0, 114, 1),
(1767, 'EQ23012', ' PISTON COMPLETO 3124.052+3125.084+1437.150', 2, 63, 0, 0, 0, 0, 1),
(1768, 'EQ23013', '2353-100 GASKET ', 2, 63, 1, 0, 0, 0, 1),
(1769, 'EQ23014', 'SPRING GUIDE POS 12G-1  2145.004', 2, 63, 2, 24, 1, 0, 1),
(1770, 'EQ23015', '2353-015 GASKET', 2, 63, 1, 0, 0, 0, 1),
(1771, 'EQ23016', '060G1055 TRANSMISOR DE PRESION 1A 25 BAR  1373.338', 2, 63, 1, 1, 1, 0, 1),
(1772, 'EQ23017', '060G2014 TRANSMISOR DE PRESION 1 A 24 BAR', 2, 63, 1, 0, 0, 0, 1),
(1773, 'EQ23018', '1331+024 O\'RING', 2, 63, 2, 0, 0, 0, 1),
(1774, 'EQ23019', '1331+067 O\'RING (VALVULA DE ALIVIO DE ALTA)', 2, 63, 4, 1, 1, 0, 1),
(1775, 'EQ23020', 'SEEGUER-RING DIA 52 (SMC and TSMC LP) POS 12F-1 1437.155', 2, 63, 2, 0, 0, 0, 1),
(1776, 'EQ23021', '2353.014 JUNTA DE TAPA DELANTERA 0,3MM', 2, 63, 0, 0, 0, 0, 1),
(1777, 'EQ23022', '2353.014 JUNTA DE TAPA DELANTERA 0,75 MM', 2, 63, 0, 0, 0, 0, 1),
(1778, 'EQ23023', 'UNLOADING CYLINDER (TSMC AND TSMC LP) POS 12A-1  3135.147', 2, 63, 0, 0, 0, 0, 1),
(1779, 'EQ23024', 'ORING VITON 2-236', 2, 63, 10, 0, 0, 0, 1),
(1780, 'EQ23025', '2354+017 O\'RING TEFLON', 2, 63, 1, 0, 0, 0, 1),
(1781, 'EQ23026', '2356+139 ARANDELA DE METAL', 2, 63, 0, 0, 0, 0, 1),
(1782, 'EQ23027', '2356+141 ARANDELA DE  METAL', 2, 63, 0, 0, 0, 0, 1),
(1783, 'EQ23028', '3112+08 CAMISA ', 2, 63, 12, 0, 0, 0, 1),
(1784, 'EQ23029', 'PISTON POS 12B-1  3135.034', 2, 63, 1, 0, 0, 0, 1),
(1785, 'EQ23030', '3133+027 SELLO DE VALVULA', 2, 63, 1, 0, 0, 0, 1),
(1786, 'EQ23031', 'TOBERA TEX  55-85 /68G2006 /85/60 TR22-TEX 55-N/B  KW 295', 2, 63, 1, 1, 1, 0, 1),
(1787, 'EQ23032', 'BULON 1424.192', 2, 63, 8, 0, 0, 0, 1),
(1788, 'EQ23033', '148B40088 SPARE PART SCV 65-125', 2, 63, 2, 0, 0, 0, 1),
(1789, 'EQ23034', '067G3220 TEX 55 THERM EXP VALVE -4+10ºC/-40  R22/R407C MWP 28 BAR', 2, 63, 0, 1, 1, 0, 1),
(1790, 'EQ23035', 'SPRING RETAINER (SMC And TSMC LP) POS 12H-1 3135.057', 2, 63, 2, 0, 0, 0, 1),
(1791, 'EQ23036', 'GASKET Ø 32/27X1,5 POS42D-1 COD:2356,139  KOP KIT 3188.025', 2, 63, 6, 1, 1, 0, 1),
(1792, 'EQ23037', 'GASKET Ø 95/71 X1,5  POS/33B-1 COD:2356,202  KOP KIT3188.025', 2, 63, 2, 1, 1, 0, 1),
(1793, 'EQ23038', 'SEALING RING POS/57B-1  COD:1349,213 KOP KIT 3188.025', 2, 63, 2, 1, 1, 0, 1),
(1794, 'EQ23039', 'GASKET Ø 27/21X1,5 POS / 45K COD:2356,133  KOP KIT 3188.025', 2, 63, 2, 1, 1, 0, 1),
(1795, 'EQ23040', 'O\'RING 52,07X2,62 POS  Nº 1C,-1 COD 1331.543 KOP KIT 3188.025', 2, 63, 2, 1, 1, 0, 1),
(1796, 'EQ23041', 'GASKET Ø 19/14 X4,0  POS Nº 23F-1 COD:2356-283  KOP KIT 3188.025', 2, 63, 2, 1, 1, 0, 1),
(1797, 'EQ23042', 'GASKET 90X44X1 POS/Nº 22G1/22A1  COD:2354,075 KOP KIT 3188.025', 2, 63, 1, 1, 1, 0, 1),
(1798, 'EQ23043', 'RUBBER GASKET Ø 70/45 X2 POS Nº 60B COD:1334,025  KOP KIT 3188.025', 2, 63, 2, 1, 1, 0, 1),
(1799, 'EQ23044', 'GASKET Ø 18/10 X 1,5 POS Nº 42G -1 COD: 2356,123  KOP KIT 3188.025', 2, 63, 4, 1, 1, 0, 1),
(1800, 'EQ23045', 'GASKET Ø 34/27 X 1,5 COD:2356,140 KOP KIT 3188.025', 2, 63, 4, 1, 1, 0, 1),
(1801, 'EQ23046', 'BUJE BALANCIN - BEARING FOR ROCKER POS/ 15-B1  COD: 3135-099', 2, 63, 11, 4, 1, 0, 1),
(1802, 'EQ23047', 'SUJETADORES DE RESORTE DE BALANCIN  (BAL SIS DES MEC -PC) CODIGO 3135-206', 2, 63, 35, 24, 1, 22, 1),
(1803, 'EQ23048', 'O\'RING 2-248 VITON (PARA SELLO SABROE', 2, 63, 0, 1, 1, 0, 1),
(1804, 'EQ23049', 'O\'RING VITON 75 X 4', 2, 63, 8, 0, 0, 0, 1),
(1805, 'EQ23050', 'GASKET Ø 25/71X 1,5 POS Nº 12E-1  2356,130 KOP KIT 3188.009', 2, 63, 11, 1, 1, 0, 1),
(1806, 'EQ23051', 'O\' RING 12,37X2,62 POS12A-1 1331,013 KOP KIT 3188.009', 2, 63, 11, 1, 1, 0, 1),
(1807, 'EQ23052', 'SQUARE GASKET POS Nº 12S-1 2354,023 KOP KIT3188.009', 2, 63, 19, 1, 1, 0, 1),
(1808, 'EQ23053', 'GASKET POS Nº 12N-1  2353.025 KOP KIT 3188.009', 2, 63, 12, 1, 1, 0, 1),
(1809, 'EQ23054', 'SELLO COMPRESOR SABROE Ø75', 2, 63, 3, 2, 1, 734, 1),
(1810, 'EQ23055', 'VALVULA DE SUCCION 3132-095', 2, 63, 0, 0, 0, 0, 1),
(1811, 'EQ23056', 'LOCKWASHER', 2, 63, 0, 0, 0, 0, 1),
(1812, 'EQ23057', 'O- RING HNBR Ø107,54X 3,53 NR 24 - POS NO. 19M-1 -2 X 1331 . 577 kop kit 3188,027', 2, 63, 10, 1, 1, 0, 1),
(1813, 'EQ23058', 'JUNTA DE CAMISA GASKET- POS NO. 19K-1 -2 X  2356.111 kop kit 3188,027', 2, 63, 17, 12, 1, 12, 1),
(1814, 'EQ23059', 'JUNTA DE CAMISA GASKET- POS NO. 19K-2 -2 X 2356.233  kop kit 3188,027', 2, 63, 14, 12, 1, 12, 1),
(1815, 'EQ23060', 'HELICAL SPRING RECIP SUCTION/ DISCHARGE VALVES- POS NO. 19G-1- 12 X 2141 . 055 kop kit 3188,027', 2, 63, 0, 64, 1, 0, 1),
(1816, 'EQ23061', 'HELICAL SPRING RECIP SUCTION/ DISCHARGE VALVES- POS NO. 20G-1- 24 X 2141 . 055 kop kit 3188,027', 2, 63, 0, 48, 1, 0, 1),
(1817, 'EQ23062', 'LAMINAS DE DESCARGA - RING PLATE - POS NO. 20C-1- 2 X 3131.015 kop kit 3188,027', 2, 63, 29, 12, 1, 20, 1),
(1818, 'EQ23063', 'LAMINAS DE SUCCION- RING PLATE - POS NO. 19F-1- 2 X 3131-021 kop kit 3188,027', 2, 63, 0, 12, 1, 0, 1),
(1819, 'EQ23064', 'GASKET Ø163/141 X 0,25- POS NO. 19T-1 -2 X 2353.140 kop kit 3188,027', 2, 63, 0, 4, 1, 0, 1),
(1820, 'EQ23065', 'SELF LOCKING NUT 3/8 IN- POS NO. 17D-1 -4 X 1433.116  KOP KIT 3188.090', 2, 63, 0, 1, 1, 0, 1),
(1821, 'EQ23066', 'HALF SECTION BEARING Ø80 SMC100- POS NO. 17A-1 -4 X 2133.003 KOP KIT 3188.090', 2, 63, 0, 1, 1, 0, 1),
(1822, 'EQ23067', '(ARO RASCA ACEITE) SCRAPER RING 100/ 92 X 5.5 - POS NO. 18C-1- 2X 3125.065  KOP KIT 3188.028', 2, 63, 25, 12, 1, 8, 1),
(1823, 'EQ23068', '(ARO COMPRESION) PISTON RING CHROME T/SMC 100- POS NO. 18B-1- 4X 3125.130 KOP KIT 3188.028', 2, 63, 48, 24, 1, 6, 1),
(1824, 'EQ23069', 'O- RING HNBR Ø82.14X 3,53 NR 236 - POS NO. 10G-1 -1X1331 .697 KOP KIT 3184.387', 2, 63, 3, 1, 1, 0, 1),
(1825, 'EQ23070', 'HEX SOCKET BOLT M5X16- POS NO. 10J-1 -4X1413 .329 KOP KIT 3184.387', 2, 63, 6, 1, 1, 0, 1),
(1826, 'EQ23071', 'GASKET SHAFT SEAL COVER- POS NO. 8B-1 -1X 2353.005 KOP KIT 3184.387', 2, 63, 1, 1, 1, 0, 1),
(1827, 'EQ23072', 'O- RING HNBR Ø75.79X 3,53 NR 234 - POS NO. 10D-1 -1X1331 .568 KOP KIT 3184.387', 2, 63, 3, 1, 1, 0, 1),
(1828, 'EQ23073', 'SERVICE KIT OIL FILTER T/SMC 100 MK3 - 3188.026', 2, 63, 3, 3, 1, 216, 1),
(1829, 'EQ23074', 'O- RING HNBR Ø120.24X 3.53 NR 248 - POS NO. 34F-1 -2X1331 .581 KOP KIT 3188,013', 2, 63, 2, 1, 1, 0, 1),
(1830, 'EQ23075', 'O- RING HNBR Ø104.14X 5.33 NR 346 - POS NO. 34D-1 -2X1331 .600 KOP KIT 3188,013', 2, 63, 3, 1, 1, 0, 1),
(1831, 'EQ23076', 'GASKET- POS NO. 2C-2/3C-2 - 10 X 2353.189 kop kit 3188.004', 2, 63, 2, 1, 1, 0, 1),
(1832, 'EQ23077', 'GASKET Ø60 115 X105X1- POS NO. 25AG 1 X 2354 . 105 kop kit 3188.004', 2, 63, 5, 1, 1, 0, 1),
(1833, 'EQ23078', 'GASKET- POS NO. 3D-1 - 4 X 2353.154 kop kit 3188.004', 2, 63, 20, 1, 1, 0, 1),
(1834, 'EQ23079', 'GASKET- POS NO. 2D-2 - 6 X 2353.175  kop kit 3188.004', 2, 63, 5, 1, 1, 0, 1),
(1835, 'EQ23080', '(INCLUIDO EN EQ23073) LOCK NUT M 8-8 - POS NO. 33M-1  1X 1433.073 KOP KIT 3188,026.', 2, 63, 2, 0, 0, 0, 0),
(1836, 'EQ23081', '(INCLUIDO EN EQ23073) GASKET- POS NO. 2B-1 - 1X 2353.002 KOP KIT 3188,026.', 2, 63, 2, 0, 0, 0, 0),
(1837, 'EQ23082', '(INCLUIDO EN EQ23073) ORING HNBR Ø52,07X 2,62 NR 137 - POS NO. 1C-1 -2X1331 .543 KOP KIT 3188,026.', 2, 63, 9, 0, 0, 0, 0),
(1838, 'EQ23083', '(INCLUIDO EN EQ23073) GASKET- POS NO. 33B-1 - 1X2356.202 KOP KIT 3188,026.', 2, 63, 2, 0, 0, 0, 0),
(1839, 'EQ23084', '(INCLUIDO EN EQ23073) GASKET- POS NO. 3C-1 - 1X 2353.189 KOP KIT 3188,026.', 2, 63, 17, 0, 0, 0, 0),
(1840, 'EQ23085', '(INCLUIDO EN EQ23073) OIL FILTER HPC/SMC. W SHIELD, MAGNET+ ROD- POS NO. 1349 - 1X1517.129 KOP KIT 3188,026.', 2, 63, 0, 0, 0, 0, 0),
(1841, 'EQ23086', '(INCLUIDO EN EQ23073)WASHER Ø17/8.4X1.6- POS NO. 33L-1 - 1X 1436.034 KOP KIT 3188,026.', 2, 63, 2, 0, 0, 0, 0),
(1842, 'EQ23087', ' SMC 112 PART NO. 3184-291.', 2, 63, 166, 1, 0, 0, 1),
(1843, 'EQ23088', ' 1331-689 O\'RING HNBR Ø 116,84 X6,99 NR 426 POS Nº 25J-4 KOP KIT 3188.016.', 2, 63, 2, 1, 0, 0, 1),
(1844, 'EQ23089', '2354,017 PAKSKIVE Ø 34,0/22 X 1,5 PTFE POS Nº 25Q-4', 2, 63, 1, 1, 0, 0, 1),
(1845, 'EQ23090', '2356,141 ALU-PAKNINGSSRING Ø 36/28 X1,5 POS Nº 25F-4', 2, 63, 4, 1, 0, 0, 1),
(1846, 'EQ23091', '1331-553 O\'RING HNBR Ø 28,17 X 3,53 NR 216 POS 25P-4', 2, 63, 1, 1, 0, 0, 1),
(1847, 'EQ23092', '2356,104 AF PAKNINGSRING Ø 130/95 X 2,0 POS 25Y -4', 2, 63, 1, 1, 0, 0, 1),
(1848, 'EQ23093', '2354,106 PAKNING 160 X160 X 1,0 POS Nº 25AG-4', 2, 63, 1, 1, 0, 0, 1),
(1849, 'EQ23094', '2354,117 TEFONRING Ø 110/91 X 3,0 POS Nº 25H-4', 2, 63, 1, 1, 0, 0, 1),
(1850, 'EQ23095', '2356,139  ALU- PAKNING Ø 32/27 X 1,5 POS Nº 25AH KOP KIT 3188.016', 2, 63, 0, 0, 0, 0, 0),
(1851, 'EQ23096', '1377,465 PAKFORSKRUNING INCL PAKNING SCV 65-125 Ø 146 X 164 X 0,8 POS 25M-4', 2, 63, 1, 1, 0, 0, 1),
(1852, 'EQ23097', '2356,141 ALU- PAKNINGSRING Ø 36/28 X1,5 POS Nº 25F-6 kop kit 3188,018', 2, 63, 0, 0, 0, 0, 0),
(1853, 'EQ23098', '2354.118 PAKSKIVE Ø 133/110 X3,0 TEFLON  POS Nº 25H-6 kop kit 3188,018', 2, 63, 2, 1, 0, 0, 1),
(1854, 'EQ23099', '1331-553 O\'RING HNBR Ø 28.17 X3,53 NR 216 POS Nº 25P-6 kop kit 3188,018', 2, 63, 2, 1, 0, 0, 1),
(1855, 'EQ23100', '2354-017 PAKSKIVE Ø 34,0/22 X 1,5 PTFE POS Nº 25Q-6  kop kit 3188,018', 2, 63, 2, 1, 0, 0, 1),
(1856, 'EQ23101', '2354.080 AF PAKNING POS 25AG-6 kop kit 3188,018', 2, 63, 1, 1, 0, 0, 1),
(1857, 'EQ23102', '1377,465 PAKFORSKRUNING INCL PAKNING SCV 65-125 Ø 146 X 164 X 0,8 POS 25M-6 kop kit 3188,018', 2, 63, 0, 1, 0, 0, 1),
(1858, 'EQ23103', '2356.109 AF PAKNING Ø 155/125 X 2.0 POS Nº 25Y-6 kop kit 3188,018', 2, 63, 1, 1, 0, 0, 1),
(1859, 'EQ23104', '2356.112 AF PAKNING Ø 167.5/148.5 X2.0 POS Nº 25J-6 kop kit 3188,018', 2, 63, 1, 1, 0, 0, 1),
(1860, 'EQ23105', '2356,139  ALU- PAKNING Ø 32/27 X 1,5 POS Nº 25AH-4  kop kit 3188,018', 2, 63, 4, 1, 0, 0, 1),
(1861, 'EQ23106', '1437.105 BENZING RING Ø 9 POS Nº 12K-1 KOP KIT 3188.034', 2, 63, 2, 1, 0, 1, 1),
(1862, 'EQ23107', '2145-035 RESORTE BALANSIN - SPRING RETAINER POS Nº 15C-1 KOP KIT 3188.034', 2, 63, 55, 1, 0, 0, 1),
(1863, 'EQ23108', '1433-100 SELF LOCKING  NUTS  UNF 3/8\' X 9,5 KOP KIT 3188.034', 2, 63, 2, 1, 0, 0, 1),
(1864, 'EQ23109', '2114.003 ARANDELA ESPACIADORA - WASHER FOR BEARING CUP Ø 12.2/8 X 0.5 POS15E-1 KOP KIT 3188.034', 2, 63, 4, 24, 0, 1, 1),
(1865, 'EQ23110', '2142.066 SPRING  14.5X58.5 XØ 2.0  POS Nº 15D-1 KOP KIT 3188.034', 2, 63, 50, 1, 0, 0, 1),
(1866, 'EQ23111', '1437.103 BENZING RINGØ 7 POS 12K-2 KOP KIT 3188.034', 2, 63, 2, 1, 0, 1, 1),
(1867, 'EQ23112', 'JUNTA DE TAPA SABROE - PART.Nº 2353,011', 2, 63, 2, 1, 1, 0, 1),
(1868, 'EQ23113', 'LAMINAS DE SUCCION', 2, 63, 0, 12, 1, 0, 1),
(1869, 'EQ23114', 'LAMINAS DE DESCARGA', 2, 63, 0, 12, 1, 0, 1),
(1870, 'EQ23115', 'AROS DE COMPRESION', 2, 63, 0, 24, 1, 0, 1),
(1871, 'EQ23116', 'AROS DE ACEITE', 2, 63, 0, 12, 1, 0, 1),
(1872, 'EQ23117', 'ANILLO DE CARBON DEL SELLO DE EJE 3126.168', 2, 63, 1, 1, 1, 187, 1),
(1873, 'EQ23118', 'RESORTE DE BALANCIN 2141-066', 2, 63, 0, 24, 1, 0, 1),
(1874, 'EQ23119', 'FILTRO DE ACEITE 1517.129', 2, 63, 3, 1, 0, 144, 1),
(1875, 'EQ23120', 'BOMBA DE ACEITE COMPRESOR SMC 100 COD 3141.004', 2, 63, 1, 1, 1, 551, 1),
(1876, 'EQ23121', 'LAMINA DE BAJA PLANA 3131.021', 2, 63, 28, 12, 1, 23, 1),
(1877, 'EQ23122', 'ENGRANAJE DE BOMBA DE ACEITE 3141.046', 2, 63, 1, 1, 0, 0, 1),
(1878, 'EQ23123', 'ENGRANAJE DE BOMBA DE ACEITE 3141.047', 2, 63, 1, 1, 0, 0, 1),
(1879, 'EQ23124', 'BALANCIN 3135-096', 2, 63, 4, 4, 1, 22, 1),
(1880, 'EQ23125', 'BALANZA DESCARGADORA - 3184.216', 2, 63, 4, 2, 1, 401, 1),
(1881, 'EQ23126', 'RESORTE DE LAMINAS 2141.047', 2, 63, 216, 216, 1, 1, 1),
(1882, 'EQ23127', 'JUNTAS TAPA DE CILINDROS 3113.151', 2, 63, 10, 10, 1, 6, 1),
(1883, 'EQ23128', 'VISOR DE ACEITE COD 1226.015', 2, 63, 1, 1, 0, 175, 1),
(1884, 'EQ23129', 'ORING 1331.020', 2, 63, 4, 4, 0, 2, 1),
(1885, 'EQ23130', 'ORING 1331.042', 2, 63, 4, 4, 0, 4, 1),
(1886, 'EQ23131', 'RORING 1331.065', 2, 63, 4, 4, 0, 2, 1),
(1887, 'EQ23132', 'ORING 1331.069', 2, 63, 2, 2, 0, 3, 1),
(1888, 'EQ23133', 'ORING 1331.080', 2, 63, 8, 8, 0, 4, 1),
(1889, 'EQ23134', 'TUERCAS 1433.116', 2, 63, 24, 24, 0, 1, 1),
(1890, 'EQ23135', 'ARANDELA 2114.001', 2, 63, 74, 72, 0, 1, 1),
(1891, 'EQ23136', 'SUPLEMENTO 2114.003', 2, 63, 96, 48, 0, 2, 1),
(1892, 'EQ23137', 'RESORTES 2141.047', 2, 63, 73, 72, 0, 2, 1),
(1893, 'EQ23138', 'RESORTES 2142.034', 2, 63, 75, 72, 0, 2, 1);
INSERT INTO `item` (`Id`, `Codigo`, `Descripcion`, `UnidadDeMedidaId`, `SubFamiliaId`, `Stock`, `PuntodePedido`, `Critico`, `Precio`, `Activo`) VALUES
(1894, 'EQ23139', 'ASIENTO DE CAMISA 3132.083', 2, 63, 5, 4, 0, 146, 1),
(1895, 'EQ23140', 'VALVULA DE ACEITE 3142.150', 2, 63, 1, 1, 0, 175, 1),
(1896, 'EQ23141', 'Filtro de succion de baja  COD 3425.093', 2, 63, 5, 4, 1, 281, 1),
(1897, 'EQ23142', 'UNISAB lll', 2, 63, 1, 0, 0, 49946, 1),
(1898, 'EQ24001', 'JUEGOS DE POSTIZOS PBC', 2, 64, 0, 0, 0, 0, 1),
(1899, 'EQ24002', 'EJES P/BOMBA PELTON MODELO PBC DE ACERO INOX AISI 416', 2, 64, 0, 0, 0, 0, 1),
(1900, 'EQ24003', 'SELLO MEC.MONO RESOR. \' SHN 015 RU3N\'', 2, 64, 4, 1, 1, 0, 1),
(1901, 'EQ24004', 'SELLO MEC.MONO RESOR. \' SHN 017 HU3N\'  ', 2, 64, 1, 0, 0, 0, 1),
(1902, 'EQ24005', 'IMPULSOR PBC ', 2, 64, 0, 0, 0, 0, 1),
(1903, 'EQ25001', 'ITEM 1: ACOPLE C/DISTANCIADOR Nº DE PIEZA 842', 2, 65, 1, 1, 0, 0, 1),
(1904, 'EQ25002', 'ITEM 2:JGO DE AROS DESGASTE H01 Nº DE PIEZA 502.1 - 42254228', 2, 65, 2, 1, 0, 0, 1),
(1905, 'EQ25003', 'ITEM 2:JGO DE AROS DESGASTE H01 Nº DE PIEZA 502,2 - 42254245', 2, 65, 2, 1, 0, 0, 1),
(1906, 'EQ25004', 'ITEM 3: CAMISA PROTECCION CONS.25-62 L02 Nº DE PIEZA 524', 2, 65, 1, 1, 0, 0, 1),
(1907, 'EQ25005', 'ITEM 4:KIT EJE CONSOLA 25-62 3-ROD Nº DE PIEZA 210', 2, 65, 1, 1, 0, 0, 1),
(1908, 'EQ25006', 'ITEM 5: IMPULSOR RPK 25-160 S/ANILLO H01Nº DE PIEZA 230', 2, 65, 1, 1, 0, 0, 1),
(1909, 'EQ25007', 'ITEM 6,1: JGO DE JUNTAS P03 PIEZA Nº 411.01 170X185X0,8 KLINGER', 2, 65, 4, 1, 0, 0, 1),
(1910, 'EQ25008', 'ITEM 6,2: JGO DE JUNTAS MED:025X035X1,0 KLINGER', 2, 65, 8, 1, 0, 0, 1),
(1911, 'EQ25009', 'ITEM 6,3: JGO DE JUNTAS MED:026X032X1,5 ', 2, 65, 16, 1, 0, 0, 1),
(1912, 'EQ25010', 'ITEM 6,4: JGO DE JUNTAS MED:056X065X1,5 KLINGER', 2, 65, 7, 1, 0, 0, 1),
(1913, 'EQ25011', 'ITEM 6,5: JGO DE JUNTAS MED:062X100X0,4 PAPEL', 2, 65, 16, 1, 0, 0, 1),
(1914, 'EQ25012', 'ITEM 6,6: JGO DE JUNTAS MED :173X182X2,4 KLINGER', 2, 65, 8, 1, 0, 0, 1),
(1915, 'EQ25013', 'ITEM 7,1: JGO RODAMI DE BOLAS C/CONTACTO ANGULAR L11Nº PIEZA 320 MATERIAL 42257566', 2, 65, 2, 1, 0, 0, 1),
(1916, 'EQ25014', 'ITEM 8: RODAMIENTO NU 305 ECP C3 L11 Nº DE PIEZA 322 MATERIAL 42257567', 2, 65, 1, 1, 0, 0, 1),
(1917, 'EQ25015', 'ITEM 9: SELLO MECANICO 7\'8074 Nº DE PIEZA 433', 2, 65, 1, 1, 0, 0, 1),
(1918, 'EQ25016', 'VIDRIO DE NIVEL DE ACEITE PARA BOMBA KSB ', 2, 65, 1, 1, 0, 141, 1),
(1919, 'EQ26001', 'ITEM 10:ACOPLE CON DISTANCIADOR Nº DE PIEZA 842', 2, 66, 1, 1, 1, 0, 1),
(1920, 'EQ26002', 'ITEM 11,1:JGO DE AROS DESGASTE H01 Nº DE PIEZA 502,1', 2, 66, 2, 1, 1, 0, 1),
(1921, 'EQ26003', 'ITEM 11,2: JGO DE AROS DESGASTE H01 Nº DE PIEZA 502,2 ', 2, 66, 1, 1, 1, 0, 1),
(1922, 'EQ26004', 'ITEM 12: CAMISA PROTECCION CONSOLA 35-80 L02', 2, 66, 3, 1, 1, 0, 1),
(1923, 'EQ26005', 'ITEM 13: KIT EJE CONSOLA 35-80 3 RODAMI L01/ Nº PIEZA 210+921+931+940', 2, 66, 4, 1, 1, 0, 1),
(1924, 'EQ26006', 'ITEM 14: IMPULSOR RPK 32-250 S/ ANILLO H 01 Nº DE PIEZA 230', 2, 66, 1, 1, 1, 0, 1),
(1925, 'EQ26007', 'ITEM 15,1:JGO JUNTAS P04 Nº PIEZA 411,01 MED:264X275X2,5 KLINGER', 2, 66, 1, 1, 1, 164, 1),
(1926, 'EQ26008', 'ITEM 15,2:JUEGO JUNTAS Nº PIEZA 411,02 MED:025X035X1,0 KLINGER', 2, 66, 8, 1, 1, 0, 1),
(1927, 'EQ26009', 'ITEM 15,3: JGO JUNTAS Nº PIEZA 411,03 MED:034X041X1,5  KLINGER', 2, 66, 10, 1, 1, 0, 1),
(1928, 'EQ26010', 'ITEM 15,4:JGO JUNTAS Nº PIEZA 411,04 MED:065X080X1,5 KLINGER', 2, 66, 8, 1, 1, 0, 1),
(1929, 'EQ26011', 'ITEM 15,5:JGO JUNTAS Nº PIEZA 411,05 MED:262X275X0,8 KLINGER', 2, 66, 0, 1, 1, 164, 1),
(1930, 'EQ26012', 'ITEM 15,6: JGO JUNTA Nº PIEZA 411,06 MED:080X120X0,4 PAPEL', 2, 66, 16, 1, 1, 0, 1),
(1931, 'EQ26013', 'ITEM 16: JUEGO RODAMIENTO D/BOLASC/CONTAC ANG L11 NºPIEZA 320+321-7303', 2, 66, 3, 1, 1, 0, 1),
(1932, 'EQ26014', 'ITEM 17: RODAMIENTO NU307 ECP C.3 L11 Nº PIEZA 322', 2, 66, 4, 1, 1, 134, 1),
(1933, 'EQ26015', 'ITEM 18. SELLO MECANICO PARA EJE Ø 35mm, Material 42378079, Pieza 433', 2, 66, 1, 1, 0, 0, 1),
(1934, 'EQ26016', 'VIDRIO DE NIVEL DE ACEITE PARA BOMBA KSB ', 2, 66, 0, 0, 0, 0, 1),
(1935, 'EQ26017', 'CONJUNTO ARO PRENSA 42257598, PLANO 0820412402', 2, 66, 1, 0, 0, 0, 1),
(1936, 'EQ27001', 'ITEM 19: KIT EJE MEGA A-40R A576GR1045 COMPLETO Nº PIEZA 210 (42373395)', 2, 67, 1, 3, 1, 1388, 1),
(1937, 'EQ27002', 'ITEM 20:IMPULSOR MEGAROM 100-200 Nº PIEZA 230 (137800623)', 2, 67, 0, 3, 1, 752, 1),
(1938, 'EQ27003', 'ITEM 21: RODAMIENTO RIGIDOS DE BOLA 6308 C3 Nº PIEZA 321 (00300173)', 2, 67, 2, 6, 1, 41, 1),
(1939, 'EQ27004', 'ITEM 22: RETEN P12 Nº PIEZA 421 - SAV 5176 (42368642)', 2, 67, 10, 6, 1, 32, 1),
(1940, 'EQ27005', 'ITEM 23: JGO DE AROS DESGASTE H01 Nº PIEZA 502,1 - 42254469', 2, 67, 2, 3, 1, 0, 1),
(1941, 'EQ27006', 'ITEM 23: JGO DE AROS DESGASTE H01 Nº PIEZA 502,2 - 42254541', 2, 67, 1, 3, 1, 0, 1),
(1942, 'EQ27007', 'ITEM 24: CAMISA MEGANORM A-40R L02 (42365359)', 2, 67, 1, 3, 1, 546, 1),
(1943, 'EQ27008', 'ITEM 25: JUNTA PLANA P03 Nº PIEZA 411 MED:065X081X1,5 KLINGER (42361851)', 2, 67, 6, 3, 1, 10, 1),
(1944, 'EQ27009', 'SELLO BASICO T502 D:45mm AR1S1 / BP  (42378079)', 2, 67, 3, 3, 1, 1175, 1),
(1945, 'EQ27010', 'VIDRIO NIVEL DE ACEITE P/BOMBA KSB MEGACHEM 100-200 /1 TAPA', 2, 67, 1, 1, 1, 78, 1),
(1946, 'EQ27011', 'REPUESTO DE ACOPLAMIENTO ELASTICO A50 BANDA ENTERISA ', 2, 67, 1, 3, 1, 130, 1),
(1947, 'EQ27012', 'JUNTA DE EXPACION Ø 4\' CON CUERPO CENTRAL DE CAUCHO REFORZADO CON TELA DE NYLON', 2, 67, 0, 0, 0, 0, 1),
(1948, 'EQ27013', 'JUNTA PLANA Nº PIEZA 400,1 MEDIDAS 32X045X0,5mm KLINGER', 2, 67, 0, 4, 1, 20, 1),
(1949, 'EQ27014', 'JUNTA PLANA Nº PIEZA 400,2 MEDIDAS 235X230X0,5mm KLINGER', 2, 67, 7, 6, 1, 24, 1),
(1950, 'EQ27015', 'JUNTA PLANA Nº PIEZA 400,3 MEDIDAS 110X90X0,4mm PAPEL  (42368641)', 2, 67, 21, 12, 1, 10, 1),
(1951, 'EQ27016', 'JUNTA PLANA Nº PIEZA 400,4 MEDIDAS 40X32X2mm KLINGER  ( 012269184)', 2, 67, 12, 6, 1, 10, 1),
(1952, 'EQ27017', 'NIVEL DE ACEITE INDICADOR MEGA A-40 - 08936420', 2, 67, 1, 1, 1, 141, 1),
(1953, 'EQ27018', 'TAPA SELLO MEGA A-40 M3N 45 API11 L04 Dimensiones: 120 x 56 x 37 Material: A 576 GR 1010', 2, 67, 2, 1, 1, 920, 1),
(1954, 'EQ27019', 'JUEGO DE JUNTAS RPK/CPK (42376320)', 2, 67, 1, 1, 0, 0, 1),
(1955, 'EQ28001', '14241 SPACER', 2, 68, 4, 0, 0, 0, 1),
(1956, 'EQ28002', '18722 B/VCAM(DOWNFLOW)', 2, 68, 2, 0, 0, 0, 1),
(1957, 'EQ28003', '13001-04 PISTON ROD ASSEMBLY', 2, 68, 1, 0, 0, 0, 1),
(1958, 'EQ28004', 'KIT VALVULA ITEM 20/27/28/29/30/31/32/33/34', 2, 68, 1, 0, 0, 0, 1),
(1959, 'EQ28005', ' 14193-03 DRIVE PANEL', 2, 68, 1, 0, 0, 0, 1),
(1960, 'EQ28006', 'DRIVE MOTOR 2RPM 24V 50/60HZ', 2, 68, 1, 0, 0, 0, 1),
(1961, 'EQ28007', 'FILTRO PLASTICO CONEXIÓN 1\'', 2, 68, 2, 0, 0, 0, 1),
(1962, 'EQ28008', 'REPUESTO PARA FILTRO PLASTICO 1\'', 2, 68, 2, 0, 0, 0, 1),
(1963, 'EQ29001', 'DISCO DE RUPTURA DE GRAFITO MOD STD-V  Ø 6\' PRESION RUPTURA 0,5 TEMP150º', 2, 69, 2, 1, 0, 1, 1),
(1964, 'EQ29002', 'PUNTA DE CHIPERO', 2, 69, 3, 0, 0, 0, 1),
(1965, 'EQ29003', 'TRANSMISOR DE PRECION DIFERENCIAL MOD:EJX110A -EMS4G-912EB', 2, 69, 0, 0, 0, 0, 1),
(1966, 'EQ29004', 'TRANSMISOR DE PRESION  -1/+1,5 BAR', 2, 69, 1, 0, 0, 0, 1),
(1967, 'EQ29005', 'TRANSMISOR DE PRECION PARA EXTERIOR  ST18 RANGO 0…1 BAR ', 2, 69, 0, 0, 0, 0, 1),
(1968, 'EQ29006', 'VISOR RADAR HF', 2, 69, 2, 0, 0, 0, 1),
(1969, 'EQ29007', 'FUENTE MCS-115-230/24WI ', 2, 69, 0, 0, 0, 0, 1),
(1970, 'EQ29008', 'MEDIDOR DE PRECION MAR VALRROL SAMSON 3730', 2, 69, 0, 0, 0, 0, 1),
(1971, 'EQ29009', 'CABEZAL DE SEGURIDAD MARCA BS& B  TIPO : S90-7R, 1\',  S300, ACERO AL CARBONO', 2, 69, 2, 1, 1, 808, 1),
(1972, 'EQ29010', 'REGISTRADOR FLUKE 1735', 2, 69, 0, 0, 0, 0, 1),
(1973, 'EQ29011', 'TRANSMISOR DE PRESION DIFERENCIAL MOD:EJX110A-EMS5G-912EN/KU21/K1/D3', 2, 69, 0, 0, 0, 0, 1),
(1974, 'EQ29012', 'valvula de control samson mode 3241-7 2\'', 2, 69, 0, 0, 0, 0, 1),
(1975, 'EQ29013', 'TRANSMISOR DE PRESION  0-25 bar, 4-20mA, rosca 1/4\'', 2, 69, 0, 0, 0, 0, 1),
(1976, 'EQ29014', 'VALVULA JEFFERSON 1342 BA12 - 1 1/2\'', 2, 69, 0, 0, 0, 0, 1),
(1977, 'EQ29015', 'FUENTE ALIMENTACION SWITCHING LPQ153', 2, 69, 1, 0, 0, 390, 1),
(1978, 'EQ29016', 'TARJETA DE ENTRADA PT100 8 CANALES ', 2, 69, 2, 0, 0, 0, 1),
(1979, 'EQ29017', 'RADAR PLANTA INCINERADOR', 2, 69, 0, 0, 0, 0, 1),
(1980, 'EQ29018', 'MEDIDOR DE NIVEL C CABLE PARA INCINERADOR', 2, 69, 0, 0, 0, 0, 1),
(1981, 'EQ29019', 'Electroposicionador SAMSON 3730-3', 2, 69, 0, 0, 0, 0, 1),
(1982, 'EQ29020', 'transmisor de presión Endress+Hauser, CERAPHANT PTC31 o’ring Viton, apto alto vacío, con display local', 2, 69, 2, 0, 0, 671, 1),
(1983, 'EQ29021', 'DISCO RUPTURA ISOTANQUE', 2, 69, 5, 0, 0, 0, 1),
(1984, 'EQ29022', 'VISOR P/ QUEMADOR DE INCINERACION', 2, 69, 1, 0, 0, 0, 1),
(1985, 'EQ29023', 'PHMETRO ENDRESS + HAUSER', 2, 69, 1, 0, 0, 0, 1),
(1986, 'EQ29024', 'ITEM 7 PRESSURE GAUGE BRACKER 1400-7459', 2, 69, 0, 0, 0, 0, 1),
(1987, 'EQ29025', 'DATALOGEER', 2, 69, 0, 0, 0, 0, 1),
(1988, 'EQ29026', 'NIVEL BOUYANCY R2', 2, 69, 0, 0, 0, 0, 1),
(1989, 'EQ29027', 'ROOTS GAS NITRICO', 2, 69, 0, 0, 0, 0, 1),
(1990, 'EQ29028', 'PRESOSTATO DANFOSS P800B', 2, 69, 0, 0, 0, 0, 1),
(1991, 'EQ29029', 'TRANSMISOR DE PRESION ENDRESS HAUSER', 2, 69, 1, 0, 0, 0, 1),
(1992, 'EQ29030', 'DISPLAY MULTRIPROPOSITO VEGA MODELO MET 381', 2, 69, 1, 0, 0, 0, 1),
(1993, 'EQ29031', 'MEDIDOR DE NIVEL CRIOGENICO SAMSON 1079 30 BAR', 2, 69, 1, 0, 0, 0, 1),
(1994, 'EQ29032', 'CONTROLADOR 194786-R', 2, 69, 0, 0, 0, 0, 1),
(1995, 'EQ29033', 'INDICADOR PH ENDRESS HAUSER - EXTERIOR - MEMOSENS', 2, 69, 0, 0, 0, 0, 1),
(1996, 'EQ29034', 'ROTAMETRO 35 LTS 10 GPM  Z-3003 / YYZX', 2, 69, 1, 0, 0, 0, 1),
(1997, 'EQ29035', 'TRANSMISOR DE PRESION DIFERENCIAL ENDRESS + HAUSER MOD:8807290109D  EIME FIC-10201', 2, 69, 1, 0, 0, 0, 1),
(1998, 'EQ29036', 'TRANSMISOR DE PRESION DIFERENCIAL ENDRESS + HAUSER MOD:88072AQ109D   EIME FI-40201', 2, 69, 1, 0, 0, 0, 1),
(1999, 'EQ29037', 'TRANSMISOR DE PRESION DIFERENCIAL ENDRESS + HAUSER MOD:80072DO109D   EIME FIC - 20202', 2, 69, 1, 0, 0, 0, 1),
(2000, 'EQ29038', 'DISPLAY PARA TRANSIMISOR DE NIVEL MICROONDAS (RADAR)', 2, 69, 1, 0, 0, 0, 1),
(2001, 'EQ29039', 'REPUESTO CAUDALIMETRO KROHNE MAGNECTICO OPTIFLUX 4050W DN40 CON DISPLAY', 2, 69, 1, 1, 1, 0, 1),
(2002, 'EQ29040', 'RESPUESTO CAUDALIMETRO KROHNE MAGNETICO OPTIFLUX 4050W DN15 CON DISPLAY', 2, 69, 1, 1, 1, 0, 1),
(2003, 'EQ29041', 'SALIDA ANALOGICA DAO 01 ID: 0369629M - ABB', 2, 69, 1, 1, 1, 0, 1),
(2004, 'EQ29042', 'CPU DCP 10 ID: 0338701M - ABB', 2, 69, 1, 1, 1, 0, 1),
(2005, 'EQ29043', 'COM DLM 02 ID: 0338434M - ABB', 2, 69, 1, 1, 1, 0, 1),
(2006, 'EQ29044', 'SALIDA DIGITAL DD0 01 ID: 0369627M - ABB', 2, 69, 1, 1, 1, 0, 1),
(2007, 'EQ29045', 'ENTRADA ANALOGICA DAI 01 ID: 0369628-604-REF - ABB', 2, 69, 1, 1, 1, 0, 1),
(2008, 'EQ29046', 'ENNTRADA DIGITAL DDI 01 ID: 0369626-604-REF - ABB', 2, 69, 2, 1, 1, 0, 1),
(2009, 'EQ29047', 'Electrodo de pH para edge . Marca Hanna Instruments - HI11310', 2, 69, 1, 1, 1, 675, 1),
(2010, 'EQ30001', 'Diafragma P200 código 02-1010-55 ', 2, 70, 2, 4, 1, 497, 1),
(2011, 'EQ30002', ' Bolas de válvulas Teflon código 02-1085-55', 2, 70, 0, 4, 1, 84, 1),
(2012, 'EQ30003', 'Asiento de válvula Kynar 02-1125-21', 2, 70, 2, 4, 1, 49, 1),
(2013, 'EQ30004', 'O´ring asiento válv. Código 02-1220-60', 2, 70, 0, 5, 1, 75, 1),
(2014, 'EQ30005', 'O´ring Código 04-1300-60-500', 2, 70, 0, 5, 1, 63, 1),
(2015, 'EQ30006', 'Kit válvula de aire código 01-2010-20', 2, 70, 1, 2, 1, 548, 1),
(2016, 'EQ30007', 'Piloto código 02-3880-99', 2, 70, 3, 2, 1, 319, 1),
(2017, 'EQ30008', 'BULON AC INOX Y ARANDELA PLANA 5/16X1 1/2', 2, 70, 20, 16, 1, 0, 1),
(2018, 'EQ30009', 'Backup Diaphragm teflon codigo 02-1060-51', 2, 70, 2, 4, 1, 92, 1),
(2019, 'EQ30010', 'BLACOH ECUALIZER 1\' 1.00 1,697.85 5.00 1,612.96, MODELO 301TP-1-BSP', 2, 70, 2, 0, 0, 0, 0),
(2020, 'EQ30011', 'PISTON OUTER 02-4600-21-500', 2, 70, 4, 2, 1, 61, 1),
(2021, 'EQ30012', 'Block central 02-3142-20 (pos.6)', 2, 70, 1, 1, 1, 1285, 1),
(2022, 'EQ30013', 'GLYD-RING 02.3210.55.225', 2, 70, 2, 3, 1, 23, 1),
(2023, 'EQ30014', 'SHAFT PRO FLO NON PTFE 02.3810.03', 2, 70, 3, 3, 1, 293, 1),
(2024, 'EQ30015', 'WASHER DISC SPRING 02.6802.08', 2, 70, 2, 3, 1, 7, 1),
(2025, 'EQ30016', 'PISTON INNER (NON PTFE) 02.3701.01', 2, 70, 2, 3, 1, 77, 1),
(2026, 'EQ30017', 'GASKET AIR VALVE 01.2615.52', 2, 70, 2, 2, 1, 15, 1),
(2027, 'EQ30018', 'MUFFLER PLATE 01-3181-20', 2, 70, 1, 1, 1, 72, 1),
(2028, 'EQ30019', 'GASKET MUFFLER PLATE 01-3505-52', 2, 70, 2, 2, 1, 17, 1),
(2029, 'EQ30020', 'MUFFLER 02-3510-99', 2, 70, 3, 2, 1, 93, 1),
(2030, 'EQ30021', 'INNER PISTON ', 2, 70, 0, 0, 0, 0, 0),
(2031, 'EQ30022', 'CHAMBER BOLT 02-6191-03', 2, 70, 16, 16, 1, 20, 1),
(2032, 'EQ30023', 'BUSHING REDUCER 01-6950-20', 2, 70, 3, 2, 1, 19, 1),
(2033, 'EQ30024', 'SCREW HSHCAIR VALVE 1/4-20 01-6001-03', 2, 70, 4, 4, 1, 11, 1),
(2034, 'EQ30025', 'FLANGE BOLT 02-6181-05', 2, 70, 0, 16, 1, 96, 1),
(2035, 'EQ31001', '.12 X .62 SQUARE KEY CR STL ITEM:W773097-004', 2, 71, 1, 1, 0, 0, 1),
(2036, 'EQ31002', '.19 X .88 SQUARE KEY CDS ITEM:W773098-006', 2, 71, 2, 1, 0, 0, 1),
(2037, 'EQ31003', '04 OD X 02PT TUB FITG 270P I ITEM:W772603-003', 2, 71, 0, 0, 0, 0, 1),
(2038, 'EQ31004', '06-32X . 50 SREW SETSC 80STA ITEM:W771004-006', 2, 71, 1, 1, 0, 0, 1),
(2039, 'EQ31005', '12 NPT CLOSE NIP SCH80 STL ITEM:W200267-000', 2, 71, 1, 1, 0, 0, 1),
(2040, 'EQ31006', '25-20X.25 SCREW SETSC 80STA ITEM W771004-120', 2, 71, 7, 1, 0, 0, 1),
(2041, 'EQ31007', 'BEARING,ECCENTRIC SHAFT ITEM W208849-000', 2, 71, 2, 1, 0, 0, 1),
(2042, 'EQ31008', 'GEARBOX W208859-000', 2, 71, 1, 1, 0, 0, 1),
(2043, 'EQ31009', 'CAP,BEARING 880 ITEM:W208850-000', 2, 71, 2, 1, 0, 0, 1),
(2044, 'EQ31010', 'CLEVIS PIN ,CONNECTING ROD D,V ITEM:W208775-000', 2, 71, 5, 1, 1, 0, 1),
(2045, 'EQ31011', 'COLLAR 0,62 INCH I.D ITEM:W208790-000', 2, 71, 3, 1, 0, 0, 1),
(2046, 'EQ31012', 'CRESCENT CLIP ITERM:W208788-025', 2, 71, 8, 2, 1, 0, 1),
(2047, 'EQ31013', 'CROSSHEAD .625X4,19 LG  D,V ITEM: W208778-000', 2, 71, 0, 1, 1, 0, 1),
(2048, 'EQ31014', 'DIAPHRAGM FLAT ITEM :W094392-TFE KOPKIT 880 MNO/TFE 1.500', 2, 71, 12, 4, 1, 0, 1),
(2049, 'EQ31015', 'ECCENTRIC 62 STRK D,V ITEM: W208774-00B', 2, 71, 1, 1, 0, 0, 1),
(2050, 'EQ31016', 'GASKET ,O\'RING 2-114 ITEM:208851-NTR ', 2, 71, 1, 1, 0, 0, 1),
(2051, 'EQ31017', 'VALVE ASSY,AIR BLEEDER ITEM/ W208383-000', 2, 71, 0, 1, 0, 0, 1),
(2052, 'EQ31018', 'GASKET,O RING .88  ,75 ,062 COD:W078200-TFE/KOPKIT 880 MNO/TFE 1.500 , medidas: Øe 22,3 x Øi 19 x H 1,8 mm.(-0.1/+0.2)', 2, 71, 60, 6, 1, 0, 1),
(2053, 'EQ31019', 'PUMP HEAD W208802-009', 2, 71, 1, 1, 0, 0, 1),
(2054, 'EQ31020', 'ROD,CONNECTING D,V  ITEM::W208777-000', 2, 71, 2, 1, 0, 0, 1),
(2055, 'EQ31021', 'RETENES W208846-000 SAV 6222', 2, 71, 0, 0, 0, 0, 0),
(2056, 'EQ31022', 'SPRING,HBV  W032566-000', 2, 71, 1, 1, 0, 0, 1),
(2057, 'EQ31023', 'SPRING, RETURN (PISTON) W208848-000', 2, 71, 0, 0, 0, 0, 1),
(2058, 'EQ31024', 'SHAFT ASSY , ECCENTRIC ¿SIMPLEX? D,V ITEM:W208773-00B', 2, 71, 2, 1, 0, 330, 1),
(2059, 'EQ31025', 'SHAFT ASSY ,WORM 10:1 D,V ITEM: W208853-010', 2, 71, 1, 1, 0, 0, 1),
(2060, 'EQ31026', 'VALVE ,BALL ,500 DIA ITEM: W 041935 - MNO KOP KIT 880 MNO/TFE 1.500', 2, 71, 0, 4, 1, 0, 1),
(2061, 'EQ31027', 'VALVE ASSY ,HYDR MAKE-UP CDEUV ITEM:W208070-000', 2, 71, 0, 1, 0, 0, 1),
(2062, 'EQ31028', 'RETEN SCE 108 /6008879  COD W208778', 2, 71, 0, 0, 0, 0, 0),
(2063, 'EQ31029', 'TORNILLO ALEN 5/16X2', 2, 71, 16, 1, 0, 0, 1),
(2064, 'EQ31030', 'SEAT VALVE 50 BOH W202906-MNO KOPKIT 880 MNO/TFE 1.500', 2, 71, 0, 4, 1, 0, 1),
(2065, 'EQ31031', 'SEAL,OIL(WORM SHAFT)W208846-000 KOPKIT 880 MNO/TFE 1.500', 2, 71, 5, 4, 0, 0, 1),
(2066, 'EQ31032', 'GASKET ,HEAD (PUMP) W208860-000 KOPKIT 880 MNO/TFE 1.500', 2, 71, 0, 4, 1, 0, 1),
(2067, 'EQ31033', 'REJILLA AC,INOX', 2, 71, 9, 1, 0, 0, 1),
(2068, 'EQ31034', 'WORH 880 10:1 ITEM: W208764-010', 2, 71, 0, 1, 0, 0, 1),
(2069, 'EQ32001', 'Disecante para Secador de Aire Comprimido marca Air Product HLB5', 4, 72, 0, 100, 1, 0, 1),
(2070, 'EQ33001', 'BB BRAN LUEBBE - VALVE KEG - #O.FED. - BL078547', 2, 73, 1, 1, 1, 3949, 1),
(2071, 'EQ33002', 'BB BRAN LUEBBE - VALVE KEG #0,2 BAR - BL540397', 2, 73, 2, 2, 1, 2960, 1),
(2072, 'EQ33003', 'BB BRAN LUEBBE - DIAPHRAGM MEMBRANE # 143 X 0,5 - BL010353', 2, 73, 5, 4, 1, 1196, 1),
(2073, 'EQ33004', 'BB BRAN LUEBBE - DIAPHRAGM MEMBRANE # 190 X 0,5 - BL303358', 2, 73, 5, 4, 1, 320, 1),
(2074, 'EQ33005', 'BB BRAN LUEBBE - GUIDE BAND # 50 X 55 X 9,7 - BL369602', 2, 73, 2, 2, 1, 0, 1),
(2075, 'EQ33006', 'BB BRAN LUEBBE - SCRAPER # 50 X 60 X 7 - BL150408', 2, 73, 1, 2, 1, 199, 1),
(2076, 'EQ33007', 'BB BRAN LUEBBE - GROOVED RING, SLOTRING # 50X - BL369501', 2, 73, 1, 2, 1, 121, 1),
(2077, 'EQ33008', 'BB BRAN LUEBBE - GASKET SEALING # 38 X 58 X - BL150126', 2, 73, 16, 16, 1, 15, 1),
(2078, 'EQ33009', 'BB BRAN LUEBBE - ORING # 155 X 4 - BL152152', 2, 73, 7, 8, 1, 89, 1),
(2079, 'EQ33010', 'BB BRAN LUEBBE - VALVULA 12102-341031 -COD BL341031', 2, 73, 1, 1, 0, 0, 1),
(2080, 'EQ33011', 'BB BRAN LUEBBE - COVER -COD BL303890 - BLOQUE INOX', 2, 73, 1, 1, 0, 0, 1),
(2081, 'EQ33012', 'BB BRAN LUEBBE - CONNECTION 1\' 300KBS -COD BL071015', 2, 73, 1, 1, 0, 0, 1),
(2082, 'EQ33013', 'BB BRAN LUEBBE - SCHRAUBE ZYL-M8X20 (TUERCA) -COD BL100014', 2, 73, 1, 1, 0, 0, 1),
(2083, 'EQ33014', 'BB BRAN LUEBBE - SCHRAUBE ZYL-M8X70  -COD BL099017', 2, 73, 6, 6, 0, 0, 1),
(2084, 'EQ33015', 'BB BRAN LUEBBE - VENT/RELIEF VALVE 3.3.9.2', 2, 73, 0, 2, 1, 0, 1),
(2085, 'EQ34001', 'KIT EJE MEGA A-60 A576GR1045 COMPLETO (210 + 940.01/02 + 550 + 920)', 2, 74, 2, 2, 1, 2, 1),
(2086, 'EQ34002', 'IMPULSOR MEGANORM 150-400 H01 (PIEZA Nª 230)', 2, 74, 1, 2, 1, 3074, 1),
(2087, 'EQ34003', 'JGO. DE RODAMIENTOS L11 (PIEZA Nª 321)', 2, 74, 3, 2, 1, 439, 1),
(2088, 'EQ34004', 'JGO. DE RETEN P12 (PIEZA Nª 421)', 2, 74, 2, 2, 1, 26, 1),
(2089, 'EQ34005', 'ARO DESGASTE N01 195x180x18 (PIEZA Nª 502.1)', 2, 74, 2, 2, 1, 425, 1),
(2090, 'EQ34006', 'ARO DESGASTE N01 225x210x20 (PIEZA Nª 503.1)', 2, 74, 1, 2, 1, 0, 1),
(2091, 'EQ34007', 'CAMISA MEGANORM A-60 L02 (PIEZA Nª 524)', 2, 74, 2, 2, 1, 1344, 1),
(2092, 'EQ34008', 'JGO. DE JUNTAS CONSOLA A-60 SERIE 400  (PIEZA Nº 400)', 2, 74, 8, 4, 1, 150, 1),
(2093, 'EQ34009', 'IMPULSOR MEGANORM 150-400 MATERIAL INOX. Cod. KSB 01488401 Ø 412 mm', 2, 74, 0, 1, 1, 7906, 1),
(2094, 'EQ34010', 'Sello Mecanico para bomba KSB, eje de 70mm, pistas de carbon - silicio y viton', 2, 74, 2, 2, 1, 670, 1),
(2095, 'EQ34011', 'CENTRO ELASTICO P/ACOPLE FUNDAL FA6 P12', 2, 74, 3, 2, 1, 364, 1),
(2096, 'EQ34012', 'TAPA COJINETE CONSOLA A 60 H01 MEGANORM 150-400', 2, 74, 0, 1, 1, 0, 1),
(2097, 'EQ34013', 'E', 2, 74, 2, 1, 1, 881, 1),
(2098, 'EQ34014', 'JUEGO DE BULONES ALLEN PARA ACOPLE FUNDAL FA 6/D180/3 JUEGO X 6', 2, 74, 3, 3, 1, 0, 1),
(2099, 'EQ35001', 'Kit de Sello para bomba  EBARA 3D 400/200 5,5 consistente en Sello Mecanico para eje Ø22mm, Oring voluta, tuerca y chaveta de fijacion de Impulsor, difusor ', 2, 75, 2, 3, 1, 151, 1),
(2100, 'EQ35002', 'Impulsor INOX. AISI 304 EBARA 3D 400/200 5,5 POSICION 7', 2, 75, 2, 2, 1, 438, 1),
(2101, 'EQ35003', 'ORING POSICION 26', 2, 75, 24, 10, 1, 12, 1),
(2102, 'EQ35004', 'RETEN 9119   30 X47X8   DBH', 2, 75, 19, 10, 1, 6, 1),
(2103, 'EQ36001', 'SHAFT SLEEVE EQUIPED POS.60 - CODE:CHEE0313--00I6L-KIT', 2, 76, 0, 1, 1, 0, 1),
(2104, 'EQ36002', 'WEAR RING POS.67 - CODE:CERL0041AA02S43', 2, 76, 0, 1, 1, 0, 1),
(2105, 'EQ36003', 'SHAFT SLEEVE POS.67A - CODE:CHEE0257--00I6L', 2, 76, 0, 1, 1, 0, 1),
(2106, 'EQ36004', 'IMPELLER POS.55 - CODE:ROUF0131AA02U55', 2, 76, 0, 1, 1, 0, 1),
(2107, 'EQ36005', 'MECHANICAL SEAL - CODE:A-PE-GMC-000854', 2, 76, 0, 1, 1, 0, 1),
(2108, 'EQ36006', 'SET OF 2 MEMBRANES COUPLING - CODE:A-PE-ACC-000767-KIT', 2, 76, 0, 1, 1, 0, 1),
(2109, 'EQ36007', 'SET OF GASKETS AND O-RINGS - CODE:JJ-01.00593.00-KIT', 2, 76, 0, 1, 1, 0, 1),
(2110, 'EQ36008', 'SELLO MECÁNICO CARTUCHO SIMPLE JOHN CRANE TIPO 5610, DIÁMETRO 70 MM.', 2, 76, 0, 2, 1, 1992, 1),
(2111, 'EQ36009', 'V-055 A VRING ', 2, 76, 7, 5, 1, 5, 1),
(2112, 'EQ36010', 'V-065 A VRING', 2, 76, 7, 5, 1, 5, 1),
(2113, 'EQ36011', 'CAMISA para Bomba Ensival Moret  AISI 316 Ø70x187,75mm', 2, 76, 1, 1, 1, 1842, 1),
(2114, 'EQ36012', 'EJE para Bomba Ensival Moret NCK AISI 316 Ø 75x709mm', 2, 76, 1, 1, 1, 3678, 1),
(2115, 'EQ37001', 'SHAFT SLEEVE EQUIPED POS.60 - CODE:CHEE0135--12I4L-KIT', 2, 77, 0, 1, 1, 0, 1),
(2116, 'EQ37002', 'IMPELLER POS.55 - CODE:ROUS0052AA00I4M', 2, 77, 0, 1, 1, 0, 1),
(2117, 'EQ37003', 'MECHANICAL SEAL- CODE:A-PE-GMC-000226', 2, 77, 0, 1, 1, 0, 1),
(2118, 'EQ37004', 'SET OF 2 COUPLING MEMBRANES - CODE:A-PE-ACC-000771-KIT', 2, 77, 0, 1, 1, 0, 1),
(2119, 'EQ37005', 'SET OF GASKETS & O-RINGS -CODE:JJ-01.00594.00-KIT', 2, 77, 0, 1, 1, 0, 1),
(2120, 'EQ37006', 'SELLO BASICO TIPO 10T 0500/10T/--/V/656A 50MM 85001063 Plano: S/29216', 2, 77, 1, 1, 1, 1598, 1),
(2121, 'EQ37007', 'EJE para Bomba Ensival Moret NCK 32-26 material TITANIO 2', 2, 77, 1, 1, 1, 985, 1),
(2122, 'EQ37008', 'CAMISA para Bomba Ensival Moret NCK 32-26 material Titanio 2', 2, 77, 0, 1, 1, 1173, 1),
(2123, 'EQ37009', 'IMPULSOR para Bomba Ensival Moret NCK 32-26 material TITANIO 2', 2, 77, 1, 1, 1, 15398, 1),
(2124, 'EQ38001', 'SHAFT SLEEVE POS.60 - CODE:CHEL0024--00I4L', 2, 78, 0, 1, 1, 0, 1),
(2125, 'EQ38002', 'SHAFT SLEEVE POS.60B - CODE:CHLZ2590I4L', 2, 78, 0, 1, 1, 0, 1),
(2126, 'EQ38003', 'BUSH BEARING POS.82-CODE:CHLZ1386GFSI', 2, 78, 0, 1, 1, 0, 1),
(2127, 'EQ38004', 'WEAR RING POS.67/68 - CODE:CERL0017AA02I4L', 2, 78, 0, 2, 1, 0, 1),
(2128, 'EQ38005', 'WEAR RING POS.70/71 - CODE:CERL0015AA01I4L', 2, 78, 0, 2, 1, 0, 1),
(2129, 'EQ38006', 'IMPELLER POS.55 - CODE:ROUF0009AA01I4M', 2, 78, 0, 1, 1, 0, 1),
(2130, 'EQ38007', 'SET OF 3 PACKING RINGS POS.252 - CODE:TRE1010L168T3T-KIT', 2, 78, 0, 1, 1, 0, 1),
(2131, 'EQ38008', 'SET OF 2 COUPLING MEMBRANES - CODE:A-PE-ACC-000779-KIT', 2, 78, 0, 1, 1, 0, 1),
(2132, 'EQ38009', 'SET OF GASKETS & O-RINGS - CODE:JJ-01.00595.00-KIT', 2, 78, 0, 1, 1, 0, 1),
(2133, 'EQ39001', 'SHAFT SLEEVE EQUIPED POS.60 - CODE:CHEE0135--12USM-KIT', 2, 79, 0, 1, 1, 0, 1),
(2134, 'EQ39002', 'IMPELLER POS.55 - CODE:ROUS0052AA00USM', 2, 79, 0, 1, 1, 0, 1),
(2135, 'EQ39003', 'MECHANICAL SEAL - CODE:A-PE-GMC-000226', 2, 79, 0, 2, 1, 0, 1),
(2136, 'EQ39004', 'SET OF 2 COUPLING MEMBRANES - CODE:A-PE-ACC-000771-KIT', 2, 79, 0, 1, 1, 0, 1),
(2137, 'EQ39005', 'SET OF GASKETS & O-RINGS - CODE:JJ-01.00592.00-KIT', 2, 79, 0, 1, 1, 0, 1),
(2138, 'EQ39006', 'EJE para Bomba Ensival Moret NCK 32-26 material TITANIO 2', 2, 79, 1, 1, 1, 7795, 1),
(2139, 'EQ39007', 'CAMISA para Bomba Ensival Moret NCK 32-26 material Titanio 2', 2, 79, 1, 1, 1, 2732, 1),
(2140, 'EQ39008', 'IMPULSOR para Bomba Ensival Moret NCK 32-26 material TITANIO 2', 2, 79, 1, 1, 1, 25579, 1),
(2141, 'EQ39009', 'SELLO BASICO TIPO 10T 0500/10T/--/V/656A 50MM 85001063 Plano: S/29216', 2, 79, 0, 1, 1, 0, 1),
(2142, 'EQ40001', 'SHAFT SLEEVE EQUIPED POS.60-CODE:CHEE0135--00UB6-KIT', 2, 80, 0, 1, 1, 0, 1),
(2143, 'EQ40002', 'IMPELLER POS.55-CODE:ROUS0052AA00UBM', 2, 80, 0, 1, 1, 0, 1),
(2144, 'EQ40003', 'SET OF 6 PACKING RINGS POS.252-CODE:TRE1010L202T3G-KIT', 2, 80, 0, 1, 1, 0, 1),
(2145, 'EQ40004', 'COUPLING MEMBRANES-CODE:A-PE-ACC-000771', 2, 80, 0, 1, 1, 0, 1),
(2146, 'EQ40005', 'SET OF GASKETS & O-RINGS-CODE:JJ-01.00596.00-KIT', 2, 80, 0, 1, 1, 0, 1),
(2147, 'EQ40006', 'Codigo  1020300891  Junta  ESPIRALADA W 316L/PTFE DE 278.5 X 261.5 X #4.5MM.    S/ET-022 - F', 2, 80, 0, 1, 1, 0, 1),
(2148, 'EQ40007', 'EJE para Bomba Ensival Moret NCK 32-26 AISI 316', 2, 80, 0, 1, 1, 0, 1),
(2149, 'EQ40008', 'CAMISA para Bomba Ensival Moret NCK 32-26 AISI 316', 2, 80, 0, 1, 1, 0, 1),
(2150, 'EQ40009', 'IMPULSOR para Bomba Ensival Moret NCK 32-26 AISI 316', 2, 80, 0, 1, 1, 0, 1),
(2151, 'EQ41001', 'SHAFT SLEEVE EQUIPED POS.60-CODE:CHEE0135--00UB6-KIT', 2, 81, 0, 1, 1, 0, 1),
(2152, 'EQ41002', 'IMPELLER POS.55-CODE:ROUS0052AA00UBM', 2, 81, 0, 1, 1, 0, 1),
(2153, 'EQ41003', 'SET OF 6 PACKING RINGS POS.252-CODE:TRE1010L202T3G-KIT', 2, 81, 0, 1, 1, 0, 1),
(2154, 'EQ41004', 'SET OF 2 COUPLING MEMBRANES-CODE:A-PE-ACC-000771-KIT', 2, 81, 0, 1, 1, 0, 1),
(2155, 'EQ41005', 'SET OF GASKETS & O-RINGS-CODE:JJ-01-00597.00-KIT', 2, 81, 0, 1, 1, 0, 1),
(2156, 'EQ41006', 'Sello Mecánico Mono Resorte eje de 50 mm , para Bomba ENSIVAL NCK 32-26R Cara Rotativa en Silicio con O-ring de Kalrez. Cara estacionaria tipo G9 de Silicio con junta PTFE', 2, 81, 2, 2, 1, 870, 1),
(2157, 'EQ41007', 'ORING DE KALREZ 46,99x5,33mm ', 2, 81, 5, 2, 1, 385, 1),
(2158, 'EQ41008', 'JUNTA ESPIRALADA W316L/PTFE 278,5x261,5x4,5MM S/ET-022 - F', 2, 81, 13, 2, 1, 47, 1),
(2159, 'EQ41009', 'ORING ENCAPSULADO TEFLON COD 032 ( BOMBA NCK 32-26R ) 47 X 1,78mm', 2, 81, 2, 3, 0, 55, 1),
(2160, 'EQ41010', 'ORING VITON 2-211 BOMBA NCK 32-26R', 2, 81, 10, 10, 1, 2, 1),
(2161, 'EQ41011', 'CAMISA para Bomba Ensival Moret NCK 32-26 AISI 304L Ø50x146,9mm', 2, 81, 1, 1, 1, 1293, 1),
(2162, 'EQ41012', 'EJE para Bomba Ensival Moret NCK 32-26 AISI 304L Ø 44,6x504mm', 2, 81, 1, 1, 1, 2178, 1),
(2163, 'EQ41013', 'ORING ENCAPSULADO TEFLON 46,99x5,33mm', 2, 81, 0, 2, 1, 0, 1),
(2164, 'EQ42001', 'SHAFT SLEEVE EQUIPED POS.60-CODE:CHEE0134--00UB6-KIT', 2, 82, 0, 1, 1, 0, 1),
(2165, 'EQ42002', 'IMPELLER POS.55-CODE:ROUS0082AA00UBM', 2, 82, 0, 1, 1, 0, 1),
(2166, 'EQ42003', 'SET OF 5 PACKING RINGS POS.252-CODE:TRE1212L242T3G-KIT', 2, 82, 0, 1, 1, 0, 1),
(2167, 'EQ42004', 'SET OF 2 MEMBRANES COUPLING-CODE:A-PE-ACC-000775-KIT', 2, 82, 0, 1, 1, 0, 1),
(2168, 'EQ42005', 'SET OF GASKETS & O-RINGS-CODE:JJ-01.00598.00-KIT', 2, 82, 0, 1, 1, 0, 1),
(2169, 'EQ43001', 'SHAFT SLEEVE POS.60-CODE:CHEE0029--00I6L-KIT', 2, 83, 0, 1, 1, 0, 1),
(2170, 'EQ43002', 'IMPELLER POS.55-CODE:ROUS0058AA00ACM', 2, 83, 0, 1, 1, 0, 1),
(2171, 'EQ43003', 'MECHANICAL SEAL-CODE:A-PE-GMC-000855', 2, 83, 0, 1, 1, 0, 1),
(2172, 'EQ43004', 'SET OF 2 COUPLING MEMBRANES-CODE:A-PE-ACC-000779-KIT', 2, 83, 0, 1, 1, 0, 1),
(2173, 'EQ43005', 'SET OF GASKETS & O-RINGS-CODE:JJ-01.00599.00-KIT', 2, 83, 0, 1, 1, 0, 1),
(2174, 'EQ44001', 'ACEITE CODIGO - OIL RIF ENDURANCE 20L - 1630091800', 2, 84, 1, 1, 1, 431, 1),
(2175, 'EQ44002', 'VALVULA SOLENOIDE CODIGO 1089070213', 2, 84, 1, 1, 1, 142, 1),
(2176, 'EQ44003', 'VALVULA TERMOSTATICA CODIGO 2901161600', 2, 84, 2, 1, 1, 222, 1),
(2177, 'EQ44004', 'SENSOR DE TEMPERATURA CODIGO 1089057470', 2, 84, 2, 1, 1, 159, 1),
(2178, 'EQ44005', 'MODULO ELECTRONICO CODIGO 1900071012', 2, 84, 1, 1, 1, 0, 1),
(2179, 'EQ44006', 'SENSOR DE PRESION CODIGO 1089057551', 2, 84, 1, 1, 1, 0, 1),
(2180, 'EQ44007', 'SEPARADOR DE ACEITE - OIL SEP KIT GA11-30 - 2901077901', 2, 84, 2, 1, 1, 849, 1),
(2181, 'EQ44008', 'FILTRO DE ACEITE CODIGO 1613610590', 2, 84, 4, 1, 1, 191, 1),
(2182, 'EQ44009', 'FILTRO DE AIRE - FILTER ELEMENT - 1613872000', 2, 84, 3, 2, 1, 146, 1),
(2183, 'EQ44010', 'FILTRO ATLAS COPCO PD44 - PD/PDP 50+ - 2901300104', 2, 84, 2, 2, 1, 346, 1),
(2184, 'EQ44011', 'FILTRO ATLAS COPCO DD44 - DD/DDP 50+ -  2901300004', 2, 84, 2, 2, 1, 346, 1),
(2185, 'EQ44012', 'FILTRO DE AIRE 1630058905.', 2, 84, 1, 1, 1, 0, 1),
(2186, 'EQ44013', 'KIT FILTRO AIRE+ACEITE GA-22 2901-0695-02', 2, 84, 0, 2, 1, 183, 1),
(2187, 'EQ44014', 'OIL RIF INDURANCE 5L 1630114600 ', 2, 84, 0, 0, 0, 0, 0),
(2188, 'EQ44015', 'FILTER KIT UD 60+ 2901-3004-05', 2, 84, 2, 2, 1, 712, 1),
(2189, 'EQ44016', 'FILTER ELEMENT (FILTRO DE AIRE) 1613872000', 2, 84, 0, 0, 0, 0, 0),
(2190, 'EQ44017', 'SEPARATOR OIL SPARE PART 2903775300', 2, 84, 2, 2, 1, 563, 1),
(2191, 'EQ44018', 'FILTER OIL 1625480050', 2, 84, 1, 2, 1, 164, 1),
(2192, 'EQ44019', 'BLOW OFF VALVE', 2, 84, 2, 1, 1, 291, 1),
(2193, 'EQ44020', 'OIL SEP. KIT GA11-30C-2002', 2, 84, 0, 0, 0, 0, 0),
(2194, 'EQ44021', 'OIL RIF INDURANCE 20L', 2, 84, 0, 0, 0, 0, 0),
(2195, 'EQ44022', 'FILTER OIL 2903752501', 2, 84, 3, 2, 1, 254, 1),
(2196, 'EQ45001', 'KIT DE FILTROS 2901-1164-00', 2, 85, 0, 1, 1, 0, 1),
(2197, 'EQ46001', 'Kit de Sello Mecanico de BB Grundfos CR5-20 - 96455086', 2, 86, 1, 2, 1, 851, 1),
(2198, 'EQ46002', 'Kit de Piezas de desgaste de BB Grundfos CR5-20 - 96455099', 2, 86, 2, 2, 1, 958, 1),
(2199, 'EQ46003', 'Paquete hidráulico  -  Repuesto Bomba Grundfos CR 5 20', 2, 86, 1, 2, 1, 3240, 1),
(2200, 'EQ47001', 'Kit de Sello Mecanico de BB Grundfos CRN 3-29 - 96455086', 2, 87, 1, 1, 1, 0, 1),
(2201, 'EQ47002', 'Kit de Piezas de desgaste de BB Grundfos CRN 3-29 - 96455094', 2, 87, 1, 1, 1, 0, 1),
(2202, 'EQ48001', 'Kit de Sello Mecanico de BB Grundfos CHN 2-30 - 985164', 2, 88, 1, 1, 1, 0, 1),
(2203, 'EQ48002', 'Kit de Piezas de desgaste de BB Grundfos CHN 2-30 - 435002', 2, 88, 1, 1, 1, 0, 1),
(2204, 'EQ49001', 'Visor de Vidrio PYREX (Borosilicato) Ø 50mm X 12esp', 2, 89, 2, 1, 1, 0, 1),
(2205, 'EQ49002', 'JUNTA MILAN PSS 200 755x717X2 mm', 2, 89, 3, 2, 1, 220, 1),
(2206, 'EQ49003', 'JUNTA MILAN PSS 200 748x725X2 mm', 2, 89, 2, 2, 1, 220, 1),
(2207, 'EQ49004', 'ROLLO Papel cerámico de 2 mm./ ancho 600 mm', 2, 89, 0, 0, 0, 0, 1),
(2208, 'EQ49005', 'ROLLO Papel cerámico de 3 mm./ ancho 600 mm', 2, 89, 1, 1, 1, 0, 1),
(2209, 'EQ49006', 'JUNTA ESPIRALADA W316/FG DE 1005 X 965 X 6,4MM S/ET-022', 2, 89, 2, 2, 1, 0, 1),
(2210, 'EQ49007', 'JUNTA PTFE VIRGEN DE 1005 X 965 X #6.0MM', 2, 89, 1, 1, 1, 0, 1),
(2211, 'EQ50001', 'VALVULA DE SUCCION 2438-X2', 2, 90, 4, 4, 1, 755, 1),
(2212, 'EQ50002', 'VALVULA DE DESCARGA 2439-X2', 2, 90, 4, 4, 1, 748, 1),
(2213, 'EQ50003', 'ARO DE PISTON 1773', 2, 90, 12, 12, 1, 145, 1),
(2214, 'EQ50004', 'EXPANSOR DE ARO 1776', 2, 90, 12, 12, 1, 25, 1),
(2215, 'EQ50005', 'EMPAQUETADURA DE VASTAGO 1452-1X3', 2, 90, 7, 8, 1, 223, 1),
(2216, 'EQ50006', 'COJINETE DE BIELA 1491', 2, 90, 4, 4, 1, 158, 1),
(2217, 'EQ50007', 'RETEN DE ACEITE 4438', 2, 90, 4, 4, 1, 82, 1),
(2218, 'EQ50008', 'JUEGO DE JUNTAS 1481-X8A2', 2, 90, 1, 2, 1, 484, 1),
(2219, 'EQ50009', 'TAPA DE VALV. P/N 1475', 2, 90, 4, 1, 1, 0, 1),
(2220, 'EQ51001', 'EJE DE ACERO INOX PARA BB MARZO DSV 290', 2, 91, 1, 3, 1, 1039, 1),
(2221, 'EQ51002', 'SELLO MECANICO CER, CAR, VITON PARA BB MARZO DSV 290', 2, 91, 2, 3, 1, 427, 1),
(2222, 'EQ51003', 'IMPULSOR PARA BOMBA MARZO DSV 290', 2, 91, 2, 3, 1, 585, 1),
(2223, 'EQ51004', 'Junta p/Bomba Marzo , modelo DS', 2, 91, 5, 3, 1, 55, 1),
(2224, 'EQ51005', 'Chaveta p/Bomba Marzo , modelo DS', 2, 91, 3, 3, 1, 17, 1),
(2225, 'EQ51006', 'TAPA CUERPO DSV 290 SS', 2, 91, 1, 1, 1, 1287, 1),
(2226, 'EQ52001', 'KIT DE MANTENIMIENTO CRI 15-12', 2, 92, 1, 1, 1, 0, 1),
(2227, 'EQ52002', 'KIT DE SELLO CRI 15-12', 2, 92, 2, 1, 1, 817, 1),
(2228, 'EQ53001', 'PROGRAMADOR SATRONIC MMG 810.1 Mod 33', 2, 93, 1, 1, 1, 0, 1),
(2229, 'EQ53002', 'ZOCALO PARA PROGRAMADOR SATRONIC MMG 810.1 Mod 33', 2, 93, 1, 1, 1, 0, 1),
(2230, 'EQ53003', 'JUNTA ESPIRALADA 304/Graf AcS3/600 Ø 1 1/2\' K', 2, 93, 25, 10, 1, 5, 1),
(2231, 'EQ53004', 'JUNTA ESPIRALADA SERIE 300 - 3\' - K', 2, 93, 10, 10, 1, 5, 1),
(2232, 'EQ54001', 'PIÑON (Pos.026) para Torre SINAX Modelo EWB1709', 2, 94, 2, 2, 1, 1185, 1),
(2233, 'EQ54002', 'CORONA DE REDUCTOR (Pos.008) para Torre SINAX Modelo EWB1709', 2, 94, 2, 2, 1, 1750, 1),
(2234, 'EQ54003', 'EJE DE REDUCTOR (Pos.017) para Torre SINAX Modelo EWB1709', 2, 94, 2, 2, 1, 1450, 1),
(2235, 'EQ54004', 'Juego de 5 bulones completos. Compuesto por 10 bulones ojal, 5 transversales, tuercas y arandelas en acero inox.', 2, 94, 3, 2, 1, 162, 1),
(2236, 'EQ54005', 'GRASA PARA TORRE DE ENFRIAMIENTO SINAX - Bidon 5lt', 2, 94, 7, 6, 1, 435, 1),
(2237, 'EQ54006', 'Buje antivibratorio de hierro galvanizado + Buje de goma, repuesto original cajas reductoras modelo SF.', 2, 94, 20, 16, 1, 16, 1),
(2238, 'EQ55001', 'COMBISTATO 50 - 350 °C x 3 mt de largo', 2, 95, 1, 1, 1, 350, 1),
(2239, 'EQ55002', 'PRESOSTATO PARA ACEITE -2  -7,5 bar diff 0,4 - 4 bar', 2, 95, 1, 1, 1, 49, 1),
(2240, 'EQ55003', 'SWITCH PARA AGUA (detector de flujo) rosca de 1\'', 2, 95, 1, 1, 1, 81, 1),
(2241, 'EQ55004', 'PRESOSTATO PARA ALTA DE 8 - 32 bar diff 2 - 6 bar', 2, 95, 1, 2, 1, 65, 1),
(2242, 'EQ55005', 'ARO COMPRESION 1° ET. Øext 320mm x Øint 290mm x esp 12mm - MANTERO', 2, 95, 2, 2, 1, 270, 1),
(2243, 'EQ55006', 'ARO GUIA 1° ET. Øext 319,7mm x Øint 305,5mm x esp 30mm - MANTERO', 2, 95, 2, 2, 1, 403, 1),
(2244, 'EQ55007', 'ARO COMPRESION 2° ET. Øext 165,2mm x Øint 135mm x esp 10mm - MANTERO', 2, 95, 6, 3, 1, 151, 1),
(2245, 'EQ55008', 'ARO GUIA 2° ET. Øext 165mm x Øint 148,7mm x esp 25mm - MANTERO', 2, 95, 4, 2, 1, 190, 1),
(2246, 'EQ55009', 'KIT RASCA ACEITE Ø44mm 2AN - 40200017', 2, 95, 11, 9, 1, 485, 1),
(2247, 'EQ55010', 'KKIT SELLOS VASTAGO Ø44mmm - 40200016', 2, 95, 14, 13, 1, 464, 1),
(2248, 'EQ56001', 'EJE GLM (SOLO REPUESTO) (ANTES LM)', 2, 96, 2, 1, 1, 89, 1),
(2249, 'EQ56002', 'JUEGO DE JUNTAS DE BOMBA GLM/LM (SOLO REPUESTO)', 2, 96, 2, 1, 1, 13, 1),
(2250, 'EQ56003', 'JUEGO DE JUNTAS DE BRIDA GLM / LM (SOLO REPUESTO)', 2, 96, 2, 1, 1, 15, 1),
(2251, 'EQ56004', 'CAPSULA GLM', 2, 96, 2, 1, 1, 64, 1),
(2252, 'EQ56005', 'JUEGO DE RODAMIENTOS GLM (SOLO REPUESTO)', 2, 96, 2, 1, 1, 33, 1),
(2253, 'EQ56006', 'JUEGO DE SELLO GLM ®', 2, 96, 2, 1, 1, 242, 1),
(2254, 'EQ56007', 'JUEGO DE JUNTAS GLM/LM', 2, 96, 0, 0, 0, 11, 1),
(2255, 'EQ56008', 'Reten GLM', 2, 96, 3, 3, 1, 11, 1),
(2256, 'EQ57001', 'Kit de repuesto para val. de seguridad marca FAVRA modelo 5011E-CN de 1\' S-150 X 2\' S-150 compuesto por Tobera, Obturador, Porta Obturador, Guia Obturador y Juntas', 2, 97, 2, 1, 1, 679, 1),
(2257, 'EQ58001', 'Kit de repuestos: Bushings x 2 - Bearings x 2 - Kit de juntas planas', 2, 98, 0, 1, 1, 47, 1),
(2258, 'EQ59001', 'Jgo de abrazaderas SD1 AISI 304 de Amortiguador', 2, 99, 1, 1, 1, 0, 1),
(2259, 'EQ59002', 'Jgo de pequeña banda de sujeción SD1 (Kynar/aluminio) material AISI 316', 2, 99, 2, 2, 1, 130, 1),
(2260, 'EQ60001', '661100025 - Seal Washer - ', 2, 100, 0, 3, 1, 0, 1),
(2261, 'EQ60002', '661100027 - Seal Washer - ', 2, 100, 0, 2, 1, 0, 1),
(2262, 'EQ60003', '661100031 - Washer - ', 2, 100, 0, 1, 1, 0, 1),
(2263, 'EQ60004', '663210782 - O Ring - ', 2, 100, 0, 2, 1, 0, 1),
(2264, 'EQ60005', '663210784 - O Ring - ', 2, 100, 0, 1, 1, 0, 1),
(2265, 'EQ60006', '663210785 - O Ring - ', 2, 100, 0, 2, 1, 0, 1),
(2266, 'EQ60007', '663210837 - O Ring - ', 2, 100, 0, 2, 1, 0, 1),
(2267, 'EQ60008', '663210864 - O Ring - ', 2, 100, 0, 2, 1, 0, 1),
(2268, 'EQ60009', '663210894 - O Ring - ', 2, 100, 0, 2, 1, 0, 1),
(2269, 'EQ60010', '1202373900 - Diaphragm - ', 2, 100, 0, 2, 1, 0, 1),
(2270, 'EQ60011', '1202481800 - Insert - ', 2, 100, 0, 1, 1, 0, 1),
(2271, 'EQ60012', '1614773500 - Insert - ', 2, 100, 0, 1, 1, 0, 1),
(2272, 'EQ60013', '1614874799 - OILFILTEREL (1614.8747.00)', 2, 100, 0, 2, 1, 0, 1),
(2273, 'EQ60014', '1621574399 - Filter Eleme - ', 2, 100, 0, 3, 1, 0, 1),
(2274, 'EQ60015', '1621166300 - Diaphragm - ', 2, 100, 0, 1, 1, 0, 1),
(2275, 'EQ60016', '1621171500 - Membrane', 2, 100, 0, 1, 1, 0, 1),
(2276, 'EQ60017', '1621171600 - Membrane', 2, 100, 0, 1, 1, 0, 1),
(2277, 'EQ60018', '2253739600 - Bearing', 2, 100, 0, 1, 1, 0, 1),
(2278, 'EQ60019', '2255003800 - Locknut', 2, 100, 0, 1, 1, 0, 1),
(2279, 'EQ60020', '2255014800 - Shaft', 2, 100, 0, 1, 1, 0, 1),
(2280, 'EQ60021', '2255118200 - Washer', 2, 100, 0, 2, 1, 0, 1),
(2281, 'EQ60022', '2901197400 - F. KIT PD 6', 2, 100, 0, 1, 1, 0, 1),
(2282, 'EQ60023', '8204094034 - Valve', 2, 100, 0, 1, 1, 0, 1),
(2283, 'EQ60024', '9090050800 - Damper', 2, 100, 0, 1, 1, 0, 1),
(2284, 'EQ60025', 'ACEITE ROTO-Z X 20LT', 2, 100, 6, 2, 1, 920, 1),
(2285, 'EQ60026', 'ACEITE ROTO-Z X 5LT', 2, 100, 2, 2, 0, 0, 1),
(2286, 'EQ60027', 'FILTER AIR (PACKED 1635040700) 1630040799', 2, 100, 4, 4, 1, 1657, 1),
(2287, 'EQ61001', 'MANGUERA PUSH LOCK PARKER 1/2\' 350 PSI', 3, 101, 2, 2, 1, 22, 1),
(2288, 'EQ61002', 'MANGUERA DE POLIAMIDA 1/8\' NEGRO', 3, 101, 20, 20, 1, 2, 1),
(2289, 'EQ61003', 'FLEXIBLE MALLADO ½\'x 50MM', 2, 101, 3, 3, 1, 6, 1),
(2290, 'EQ61004', 'MANGUERA D-8/5MM Pexmt 1004512', 3, 101, 20, 20, 1, 4, 1),
(2291, 'EQ61005', 'Accessory RO Pressure Vessel ,assembly part,BELL,285779010,End Cap 1,5\'NPT ', 2, 101, 1, 1, 1, 480, 1),
(2292, 'EQ61006', 'Accessory RO Pressure Vessel ,assembly part,BELL,007-080- 0092,Seal for end cap', 2, 101, 2, 1, 1, 38, 1),
(2293, 'EQ61007', 'KIT INOX 316 VIROLA, CONTRA VIROLA Y TUERCA 1/8\'', 2, 101, 14, 20, 1, 13, 1),
(2294, 'EQ61008', 'CAUDALIMETRO 8020 CORTO BURKERT 419587', 2, 101, 1, 1, 1, 1538, 1),
(2295, 'EQ61009', 'MEMBRANAS Filmtec BW30-400 OSMOSIS NITRICO', 2, 101, 10, 10, 1, 1050, 1),
(2296, 'EQ62001', 'KIT DE SERVICIO -Bomba R5 0250/0302 D, filtros de neblina, filtro de aceite y juntas.', 2, 102, 0, 1, 1, 3324, 1),
(2297, 'EQ62002', 'CARTUCHO FILTRANTE (1.b.4 / ledesma/ arriba)', 2, 102, 2, 2, 1, 80, 1),
(2298, 'EQ62003', 'Aceite Mineral ISO 100 VM 100 Envase 5 Ltr', 2, 102, 2, 2, 1, 119, 1),
(2299, 'EQ63001', 'Kits armados para compresores CORKEN   Modelo 491AM3FBANSNN    kit 3551-X1', 2, 103, 0, 1, 1, 0, 1),
(2300, 'EQ64001', 'Diafragma Goma y Tela según plano', 2, 104, 7, 4, 1, 132, 1),
(2301, 'EQ64002', 'Posicionador con el bloque de manómetros SIEMENS 6DR5010-0NG00-0AA1', 2, 104, 1, 2, 1, 2015, 1),
(2302, 'EQ65001', 'KIT VALVULAS DD 150/300 R460200-PT00', 2, 105, 1, 1, 1, 0, 1),
(2303, 'EQ65002', 'DIAFRAGMA DD 150/300 TEFLON - 46070', 2, 105, 1, 1, 1, 0, 1),
(2304, 'EQ65003', 'CONECTOR BSPT 3/4\' - 46055', 2, 105, 1, 1, 1, 0, 1),
(2305, 'EQ66001', 'Membranas Toray TM710D, Alto rechazo BW, 4\'', 2, 106, 3, 3, 1, 0, 1),
(2306, 'EQ67001', 'Código: YB136KA, Descripción: Junta de cuello para válvula Foxboro modelo V1C de D: 2\', Material: Grafito,', 2, 107, 0, 1, 1, 0, 1),
(2307, 'EQ67002', 'Código: JB136LA, Descripción: Junta espirotálica para válvula Foxboro modelo V1C de D: 2\', Material: AISI 316+Grafito', 2, 107, 0, 1, 1, 0, 1),
(2308, 'EQ67003', 'Código: SUBVZB132RJ0, Descripción: S/C Empaquetadura de grafoil para usar en VIC, Material grafito.', 2, 107, 0, 1, 1, 0, 1),
(2309, 'EQ67004', 'Código: JB125WB, Descripción: Camisa para válvula Foxboro modelo V1C de D: 2\', igual porcentaje, Cv: 60, Material: CA40ss,', 2, 107, 0, 1, 1, 0, 1),
(2310, 'EQ67005', 'Código: SUBVJB171JA0, Descripción: S/C Obturador para válvula Foxboro modelo V1C de D: 2\', Material: AISI 410,', 2, 107, 0, 1, 1, 0, 1),
(2311, 'EQ67006', 'Código: JB129KA, Descripción: Asiento para válvula Foxboro modelo V1C de D: 2\', Material: AISI 416,', 2, 107, 0, 1, 1, 0, 1),
(2312, 'EQ67007', 'Sello metálico para válvula Foxboro modelo V1C de D: 2\', Material: AISI 420. Código:JB164TB', 2, 107, 0, 1, 1, 0, 1),
(2313, 'EQ67008', 'Código: PB120WA, Descripción: Diafragma para actuador Foxboro Modelo P50, Material caucho nitrilo,', 2, 107, 0, 1, 1, 0, 1),
(2314, 'EQ67009', 'Código: 19411, Descripción: \'X\' Ring para actuador Foxboro modelo P50, Mat. Buna N,', 2, 107, 0, 1, 1, 0, 1),
(2315, 'EQ68001', '433.0B/075/43/M (10121)] SELLO MECÁNICO COD. 43 Sello mecánico CODE 43 (LB 100.5 / LA 110.5)', 2, 108, 0, 2, 1, 0, 1),
(2316, 'EQ69001', 'O ́ring Pieza 26', 2, 109, 0, 2, 1, 0, 1),
(2317, 'EQ69002', 'Sello mecanico Ꝋ15 mm Pieza 11', 2, 109, 0, 2, 1, 0, 1),
(2318, 'EQ69003', 'Impulsor Izquierdo Pieza 7', 2, 109, 0, 2, 1, 0, 1),
(2319, 'EQ70001', 'Kit de sello mecanico', 2, 110, 0, 2, 1, 0, 1),
(2320, 'EQ70002', 'Rodete CA70/3 AISI 316', 2, 110, 0, 2, 1, 0, 1),
(2321, 'EQ70003', 'Rodete CA70/4 AISI 316', 2, 110, 0, 2, 1, 0, 1),
(2322, 'FE01001', 'CLAVO PARIS 2\' x Kg ', 2, 111, 0, 0, 0, 0, 1),
(2323, 'FE01002', 'CLAVO PARIS 1\' x Kg ', 2, 111, 0, 0, 0, 0, 1),
(2324, 'FE01003', 'REMACHES POP 4 x 14mm', 2, 111, 21, 0, 0, 0, 1),
(2325, 'FE01004', 'REMACHES POP 4,8X16mm', 2, 111, 0, 0, 0, 0, 1),
(2326, 'FE01005', 'REMACHES POP  4,8X20mm', 2, 111, 0, 0, 0, 0, 1),
(2327, 'FE01006', 'REMACHES POP 4X25mm', 2, 111, 44, 0, 0, 0, 1),
(2328, 'FE02001', 'BULONES   1/2\' 12H X 5\'', 2, 112, 28, 0, 0, 0, 0),
(2329, 'FE02002', 'BULONES 1/2\' 12H X 1 3/4\'', 2, 112, 50, 0, 0, 0, 1),
(2330, 'FE02003', 'BULONES 1/2\' 12H X 1\' ', 2, 112, 85, 0, 0, 0, 1),
(2331, 'FE02004', 'BULONES 1/2\' 12H X 1 1/2\'', 2, 112, 191, 0, 0, 0, 1),
(2332, 'FE02005', 'BULONES 1/2\' 12H X 2\'', 2, 112, 58, 50, 0, 0, 1),
(2333, 'FE02006', 'BULONES 1/2\' 12H X 2 1/2\'', 2, 112, 27, 50, 0, 0, 1),
(2334, 'FE02007', 'BULONES 1/2\' 12H X 3\'', 2, 112, 90, 50, 0, 0, 1),
(2335, 'FE02008', 'BULONES 1/2\' 12H X 3 1/2\'', 2, 112, 65, 50, 0, 0, 1),
(2336, 'FE02009', 'BULONES 1/4\' X  1/2\'', 2, 112, 47, 30, 0, 0, 1),
(2337, 'FE02010', 'BULONES 1/4\' X 1 1/2\'', 2, 112, 17, 30, 0, 0, 1),
(2338, 'FE02011', 'BULONES 1/4\' X 1\'', 2, 112, 0, 30, 0, 0, 1),
(2339, 'FE02012', 'BULONES  1/4\' X 2\'', 2, 112, 18, 30, 0, 0, 1),
(2340, 'FE02013', 'BULONES  1/4\' X 2 1/2\'', 2, 112, 46, 0, 0, 0, 1),
(2341, 'FE02014', 'BULONES 1/4\' X 3\'', 2, 112, 80, 30, 0, 0, 1),
(2342, 'FE02015', 'BULONES  3/16 X 1\'', 2, 112, 42, 30, 0, 0, 1),
(2343, 'FE02016', 'BULONES  3/16\' X 1 1/2\'', 2, 112, 43, 30, 0, 0, 1),
(2344, 'FE02017', 'BULONES 3/16\' X 1/2\'', 2, 112, 62, 30, 0, 0, 1),
(2345, 'FE02018', 'BULONES  3/4\' X 1\' ', 2, 112, 50, 50, 0, 0, 1),
(2346, 'FE02019', 'BULONES  3/4\' X 2\'', 2, 112, 201, 50, 0, 0, 1),
(2347, 'FE02020', 'BULONES 3/4\' X 2 1/2\'', 2, 112, 90, 50, 0, 0, 1),
(2348, 'FE02021', 'BULONES  3/4\' X 3 1/2\'', 2, 112, 78, 50, 0, 1, 1),
(2349, 'FE02022', 'BULONES  3/4\' X 3\' ', 2, 112, 91, 50, 0, 0, 1),
(2350, 'FE02023', 'BULONES 3/4\' X 4\'', 2, 112, 30, 30, 0, 4, 1),
(2351, 'FE02024', 'BULONES  3/8\' X 1/2\'', 2, 112, 24, 0, 0, 0, 1),
(2352, 'FE02025', 'BULONES  3/8\' X 1\'', 2, 112, 33, 0, 0, 4, 1),
(2353, 'FE02026', 'BULONES  3/8\' X 1 1/2\'', 2, 112, 2, 0, 0, 0, 1),
(2354, 'FE02027', 'BULONES   3/8\' X 1 3/4\'', 2, 112, 5, 0, 0, 0, 1),
(2355, 'FE02028', 'BULONES   3/8\' X 2\' ', 2, 112, 2, 0, 0, 0, 1),
(2356, 'FE02029', 'BULONES  3/8\' X 2 1/2\'', 2, 112, 23, 0, 0, 0, 1),
(2357, 'FE02030', 'BULONES  3/8\' X 3\'', 2, 112, 63, 30, 0, 0, 1),
(2358, 'FE02031', 'BULONES 5/16 X 1\'', 2, 112, 16, 30, 0, 0, 1),
(2359, 'FE02032', 'BULONES  5/16 X 1 1/2\'', 2, 112, 44, 0, 0, 0, 1),
(2360, 'FE02033', 'BULONES  5/16 X 2\'', 2, 112, 16, 0, 0, 0, 1),
(2361, 'FE02034', 'BULONES  5/16\' X 2 1/2\'', 2, 112, 56, 30, 0, 0, 1),
(2362, 'FE02035', 'BULONES 5/16\' X 1 3/4\'', 2, 112, 0, 0, 0, 0, 1),
(2363, 'FE02036', 'BULONES  5/16\' X 1/2\'', 2, 112, 22, 0, 0, 0, 1),
(2364, 'FE02037', 'BULONES  5/8 X 1 1/2\'', 2, 112, 124, 50, 0, 0, 1),
(2365, 'FE02038', 'BULONES  5/8\' X 1\'', 2, 112, 55, 50, 0, 0, 1),
(2366, 'FE02039', 'BULONES  5/8\' X 2\'', 2, 112, 82, 50, 0, 0, 1),
(2367, 'FE02040', 'BULONES  5/8\' X 2 1/2\'', 2, 112, 22, 30, 0, 0, 1),
(2368, 'FE02041', 'BULONES 5/8\' X 3\'', 2, 112, 41, 30, 0, 1, 1),
(2369, 'FE02042', 'BULONES  5/8\' X 3 1/2\'', 2, 112, 20, 30, 0, 2, 1),
(2370, 'FE02043', 'BULONES  5/8\' X 4\'', 2, 112, 10, 30, 0, 0, 1),
(2371, 'FE02044', 'BULONES 5/8\' X 4 1/2\'', 2, 112, 0, 0, 0, 0, 1),
(2372, 'FE02045', 'BULONES  5/8\' X 5\'', 2, 112, 37, 30, 0, 1, 1),
(2373, 'FE02046', 'BULONES  7/16\' X 1 1/2\'', 2, 112, 44, 0, 0, 0, 1),
(2374, 'FE02047', 'BULONES  7/16 X 2 1/2\'', 2, 112, 44, 0, 0, 0, 1),
(2375, 'FE02048', 'BULONES 7/16\' X 2\'', 2, 112, 30, 0, 0, 0, 1),
(2376, 'FE02049', 'BULONES  7/16\' X 3\'', 2, 112, 0, 0, 0, 0, 1),
(2377, 'FE02050', 'BULONES   7/8\' X 4 1/2\' ', 2, 112, 0, 0, 0, 0, 1),
(2378, 'FE02051', 'BULONES  7/8\' X 5\'', 2, 112, 80, 0, 0, 0, 1),
(2379, 'FE02052', 'BULONES 1/4\' X 3/4\'', 2, 112, 0, 0, 0, 0, 1),
(2380, 'FE02053', 'HEBILLAS BAND-LTAC.INOX TIPO AISI 201', 2, 112, 0, 0, 0, 0, 1),
(2381, 'FE02054', 'BULONES 7/8\' X 4', 2, 112, 0, 0, 0, 0, 1),
(2382, 'FE02055', 'ESQUINERO P/ESTANTERIAS ', 2, 112, 0, 0, 0, 0, 1),
(2383, 'FE02056', 'BULONES 1/2\' X  4\'', 2, 112, 31, 0, 0, 2, 1),
(2384, 'FE02057', 'BULONES 3/4\' X  5\'', 2, 112, 6, 5, 0, 1, 1),
(2385, 'FE02058', 'BULONES 5/8\' X 6 1/2\'', 2, 112, 65, 0, 0, 0, 1),
(2386, 'FE02059', 'TORNILLO AUTOPERFORANTE 1/4\' X 2\'', 2, 112, 0, 50, 0, 0, 1),
(2387, 'FE02060', 'TACO METALICO P/ CIEN MR8', 2, 112, 0, 0, 0, 0, 1),
(2388, 'FE02061', 'BULONES  AC INOX5/16 X 1 3/4\'', 2, 112, 0, 0, 0, 0, 1),
(2389, 'FE02062', 'BULON  3/16\' X 2\'', 2, 112, 0, 0, 0, 0, 1),
(2390, 'FE03001', 'TUERCA HEXAGONAL USS 1/4\'', 2, 113, 0, 100, 0, 0, 1),
(2391, 'FE03002', 'TUERCA HEXAGONAL USS 5/16\'', 2, 113, 8, 100, 0, 0, 1),
(2392, 'FE03003', 'TUERCA HEXAGONAL USS 3/8\'', 2, 113, 95, 100, 0, 0, 1),
(2393, 'FE03004', 'TUERCA HEXAGONAL USS 3/16\'', 2, 113, 99, 50, 0, 0, 1),
(2394, 'FE03005', 'TUERCA HEXAGONAL USS 7/16\'', 2, 113, 92, 0, 0, 0, 1),
(2395, 'FE03006', 'TUERCA HEXAGONAL USS 1/2\' 12H', 2, 113, 87, 100, 0, 0, 1),
(2396, 'FE03007', 'TUERCA HEXAGONAL USS 5/8\'', 2, 113, 0, 100, 0, 0, 1),
(2397, 'FE03008', 'TUERCA HEXAGONAL USS 3/4\'', 2, 113, 96, 100, 1, 0, 1),
(2398, 'FE03009', 'TUERCA HEXAGONAL USS 7/8\'', 2, 113, 132, 0, 0, 0, 1),
(2399, 'FE03010', 'TUERCA HEXAGONAL USS 1\'', 2, 113, 65, 0, 0, 0, 1),
(2400, 'FE03011', 'TUERCA HEXAGONAL USS AC. INOX 1/4\'', 2, 113, 56, 20, 0, 0, 1),
(2401, 'FE03012', 'TUERCA HEXAGONAL USS AC. INOX 5/16\'', 2, 113, 28, 20, 0, 0, 1),
(2402, 'FE03013', 'TUERCA HEXAGONAL USS AC. INOX 3/8\'', 2, 113, 0, 0, 0, 0, 1),
(2403, 'FE04001', 'ARANDELA PLANA 1/4\'', 2, 114, 92, 150, 0, 0, 1),
(2404, 'FE04002', 'ARANDELA PLANA 5/16\'', 2, 114, 0, 20, 0, 0, 1),
(2405, 'FE04003', 'ARANDELA PLANA 3/8\'', 2, 114, 0, 50, 0, 0, 1),
(2406, 'FE04004', 'ARANDELA PLANA 1/2\'', 2, 114, 80, 0, 0, 0, 1),
(2407, 'FE04005', 'ARANDELA PLANA 7/16\'', 2, 114, 78, 0, 0, 0, 1),
(2408, 'FE04006', 'ARANDELA PLANA 5/8\'', 2, 114, 42, 200, 0, 0, 1),
(2409, 'FE04007', 'ARANDELA PLANA 3/4\'', 2, 114, 154, 100, 0, 0, 1),
(2410, 'FE04008', 'ARANDELA PLANA 7/8\'', 2, 114, 60, 0, 0, 0, 1),
(2411, 'FE04009', 'ARANDELA PLANA 1\'', 2, 114, 5, 0, 0, 0, 1),
(2412, 'FE04010', 'ARANDELA PLANA  1 1/2\'', 2, 114, 13, 0, 0, 0, 1),
(2413, 'FE04011', 'ARANDELA PLANA 3/16\'', 2, 114, 55, 50, 0, 0, 1),
(2414, 'FE04012', 'GROWER 1/4\'', 2, 114, 70, 30, 0, 0, 1),
(2415, 'FE04013', 'GROWER 5/16', 2, 114, 59, 30, 0, 0, 1),
(2416, 'FE04014', 'GROWER 1/8\'', 2, 114, 0, 0, 0, 0, 1),
(2417, 'FE04015', 'GROWER 3/8\'', 2, 114, 61, 30, 0, 0, 1),
(2418, 'FE04016', 'GROWER 1/2\'', 2, 114, 63, 30, 0, 0, 1),
(2419, 'FE04017', 'GROWER 5/8\'', 2, 114, 153, 30, 0, 0, 1),
(2420, 'FE04018', 'GROWER 3/4\'', 2, 114, 114, 0, 0, 0, 1),
(2421, 'FE04019', 'GROWER 1\'', 2, 114, 0, 0, 0, 0, 1),
(2422, 'FE04020', 'GROWER 1 1/2\'', 2, 114, 175, 0, 0, 0, 1),
(2423, 'FE04021', 'GROWER 7/8\'', 2, 114, 567, 10, 0, 0, 1),
(2424, 'FE05001', 'ABRAZADERA ALAMBRE 2\'', 2, 115, 0, 0, 0, 0, 1),
(2425, 'FE05002', 'ABRAZADERA 8-16', 2, 115, 0, 10, 0, 0, 1),
(2426, 'FE05003', 'ABRAZADERA  13-29', 2, 115, 0, 0, 0, 0, 1),
(2427, 'FE05004', 'ABRAZADERA  12-22', 2, 115, 0, 0, 0, 0, 1),
(2428, 'FE05005', 'ABRAZADERA 12-26', 2, 115, 0, 0, 0, 0, 1),
(2429, 'FE05006', 'ABRAZADERA DE ALTA PRESION 2\' (50-59 mm) - 107', 2, 115, 45, 10, 0, 5, 1),
(2430, 'FE05007', 'ABRAZADERA  45-30', 2, 115, 0, 0, 0, 0, 1),
(2431, 'FE05008', 'ABRAZADERA  26-49', 2, 115, 24, 10, 0, 0, 1),
(2432, 'FE05009', 'ABRAZADERA 50-32', 2, 115, 0, 0, 0, 0, 1),
(2433, 'FE05010', 'ABRAZADERA  40-60', 2, 115, 0, 10, 0, 0, 1),
(2434, 'FE05011', 'ABRAZADERA 23-25', 2, 115, 0, 0, 0, 0, 1),
(2435, 'FE05012', 'ABRAZADERA  70-90', 2, 115, 0, 10, 0, 0, 1),
(2436, 'FE05013', 'ABRAZADERA12', 2, 115, 0, 0, 0, 0, 1),
(2437, 'FE05014', 'GRAMPAS OMEGA  1/2\'', 2, 115, 53, 0, 0, 0, 1),
(2438, 'FE05015', 'GRAMPAS OMEGA  3/4\' ', 2, 115, 0, 0, 0, 0, 1),
(2439, 'FE05016', 'GRAMPAS OMEGA 1\'', 2, 115, 29, 0, 0, 0, 1),
(2440, 'FE05017', 'GRAMPAS OMEGA 1 1/2\'', 2, 115, 60, 0, 0, 0, 1),
(2441, 'FE05018', 'GRAMPAS OMEGA 2 1/2\'', 2, 115, 0, 0, 0, 0, 1),
(2442, 'FE05019', 'GRAMPAS OMEGA 3\'', 2, 115, 0, 0, 0, 0, 1),
(2443, 'FE05020', 'GRAMPAS U   1/2\' X 1/4\'', 2, 115, 4, 15, 0, 0, 1),
(2444, 'FE05021', 'GRAMPAS U  3/4\' X 1/4\'', 2, 115, 27, 15, 0, 0, 1),
(2445, 'FE05022', 'GRAMPAS U  1\' X 1/4\'', 2, 115, 0, 15, 0, 0, 1),
(2446, 'FE05023', 'GRAMPAS U 1 1/4\' X 1/4\'', 2, 115, 0, 0, 0, 0, 1),
(2447, 'FE05024', 'GRAMPAS U  1 1/2\' X 1/4\'', 2, 115, 0, 10, 0, 0, 1),
(2448, 'FE05025', 'GRAMPAS U  1 1/2\' X 5/16', 2, 115, 0, 0, 0, 0, 1),
(2449, 'FE05026', 'GRAMPAS U  1\' X 5/16\'', 2, 115, 0, 0, 0, 0, 1),
(2450, 'FE05027', 'GRAMPAS U  2\' X 3/8\'', 2, 115, 8, 10, 0, 0, 1),
(2451, 'FE05028', 'GRAMPAS U 2 1/2\' X 3/8\'', 2, 115, 15, 0, 0, 0, 1),
(2452, 'FE05029', 'GRAMPAS U 3\' X 3/8\'', 2, 115, 13, 0, 0, 0, 1),
(2453, 'FE05030', 'GRAMPAS U 4\' X 1/2\'', 2, 115, 0, 0, 0, 0, 1),
(2454, 'FE05031', 'GRAMPAS U 5\' X 1/2\'', 2, 115, 0, 0, 0, 0, 1),
(2455, 'FE05032', 'GRAMPAS  U 1 1/4\' X 5/16\'', 2, 115, 0, 0, 0, 0, 1),
(2456, 'FE05033', 'GRAMPAS U 2\' x 1/4\'', 2, 115, 9, 0, 0, 0, 1),
(2457, 'FE05034', 'ABRAZADERA DE ALTA PRESION 1 1/2\' (44-53 mm) - 105', 2, 115, 0, 0, 0, 0, 1),
(2458, 'FE05035', 'MANIFOLD O-RING (3,350\'X210\') COD: 04-1371-60', 2, 115, 0, 0, 0, 0, 1),
(2459, 'FE05036', 'ABRAZADERA 2\'', 2, 115, 0, 0, 0, 0, 1),
(2460, 'FE05037', 'GRAMPAS  U 1\' X 3/8\'', 2, 115, 6, 0, 0, 0, 1),
(2461, 'FE05038', 'GRAMPAS  U 2\' X 3/8\'', 2, 115, 0, 0, 0, 0, 1),
(2462, 'FE06001', 'ESPARRAGOS B7 1 1/4 X 8', 2, 116, 0, 0, 0, 0, 1),
(2463, 'FE06002', 'ESPARRAGOS B7 7/8 X 5', 2, 116, 41, 0, 0, 0, 1),
(2464, 'FE06003', 'ESPARRAGOS B7 3/4 X 3 1/2', 2, 116, 35, 0, 0, 0, 1),
(2465, 'FE06004', 'ESPARRAGOS B7 1 X 10', 2, 116, 0, 0, 0, 0, 1),
(2466, 'FE06005', 'ESPARRAGOS B7 1/2 X 3', 2, 116, 0, 0, 0, 0, 1),
(2467, 'FE06006', 'ESPARRAGOS B7 3/4 X 4', 2, 116, 11, 0, 0, 0, 1),
(2468, 'FE06007', 'ESPARRAGOSB7 1 3/4X10', 2, 116, 4, 0, 0, 0, 1),
(2469, 'FE06008', 'ESPARRAGOS B7 1 1/2X10', 2, 116, 0, 0, 0, 0, 1),
(2470, 'FE06009', 'ESPARRAGOS B7  3/4X110 C7 TUERCA Y ARANDELA GROWER', 2, 116, 0, 0, 0, 0, 1),
(2471, 'FE06010', 'ESPARRAGO ASTM A193 B7 3/4\'x170 C/2 TUERCAS C/U', 2, 116, 50, 50, 1, 4, 1),
(2472, 'FE07001', 'PRICIONEROS  1/2X1', 2, 117, 0, 0, 0, 0, 0),
(2473, 'FE07002', 'PRICIONEROS 3/8X2', 2, 117, 17, 0, 0, 0, 0),
(2474, 'FE07003', 'PRICIONEROS 3/8X1', 2, 117, 31, 0, 0, 0, 0),
(2475, 'FE07004', 'PRICIONEROS 5/16X2', 2, 117, 6, 0, 0, 0, 0),
(2476, 'FE07005', 'PRICIONEROS  M 8X25', 2, 117, 0, 0, 0, 0, 0),
(2477, 'FE07006', 'PRICIONEROS  M 8X35', 2, 117, 0, 0, 0, 0, 0),
(2478, 'FE07007', 'PRICIONEROS  M 8X20', 2, 117, 0, 0, 0, 0, 0),
(2479, 'FE07008', 'PRICIONEROS M 8X50', 2, 117, 0, 0, 0, 0, 0),
(2480, 'FE08001', 'ALLEM 5/16X1 1/2', 2, 118, 0, 0, 0, 0, 1),
(2481, 'FE08002', 'ALLEM 5/16X 1/2', 2, 118, 0, 0, 0, 0, 1),
(2482, 'FE08003', 'ALLEM  5/16X 1 3/4', 2, 118, 0, 0, 0, 0, 1),
(2483, 'FE08004', 'ALLEM  5/16X 2', 2, 118, 0, 0, 0, 0, 1),
(2484, 'FE08005', 'ALLEM 5/16 X2 1/2', 2, 118, 0, 0, 0, 0, 1),
(2485, 'FE08006', 'ALLEM p/mototguadaña 1/4 x 1\' ', 2, 118, 0, 0, 0, 0, 1),
(2486, 'FE08007', 'ALLEM  1/4 x 1/2\' ', 2, 118, 0, 0, 0, 0, 1),
(2487, 'FE08008', 'ALLEM  1/2X2', 2, 118, 3, 0, 0, 0, 1),
(2488, 'FE08009', 'ALLEM  3/8X2', 2, 118, 2, 0, 0, 0, 1),
(2489, 'FE08010', 'ALLEM  5/8X2', 2, 118, 0, 0, 0, 0, 1),
(2490, 'FE08011', 'ALLEM  1/4X1', 2, 118, 0, 0, 0, 0, 1),
(2491, 'FE08012', 'ALLEM  1/4X2', 2, 118, 0, 0, 0, 0, 1),
(2492, 'FE08013', 'TORNILLO PARKER 10 X 1 1/2\'', 2, 118, 0, 0, 0, 0, 1),
(2493, 'FE08014', 'TORNILLO PARKER 8 X 1 1/2\'', 2, 118, 0, 0, 0, 0, 1),
(2494, 'FE08015', 'TORNILLO TIRAFONDO 6 X 1 1/2 \' P/DESTORNILLADOR philips/PLANO', 2, 118, 56, 50, 0, 0, 1);
INSERT INTO `item` (`Id`, `Codigo`, `Descripcion`, `UnidadDeMedidaId`, `SubFamiliaId`, `Stock`, `PuntodePedido`, `Critico`, `Precio`, `Activo`) VALUES
(2495, 'FE08016', 'TORNILLO TIRAFONDO   3/16 X 1 3/4  CAB EXAGONAL', 2, 118, 55, 50, 0, 0, 1),
(2496, 'FE08017', 'TORNILLO TIRAFONDO cab exag. 5/16\'X3\'', 2, 118, 100, 50, 0, 0, 1),
(2497, 'FE08018', 'TORNILLO TIRAFONDO 1/4X2 CAB HEXAGONAL', 2, 118, 0, 50, 0, 0, 1),
(2498, 'FE08019', 'TORNILLO TIRAFONDO cab exag. 8 X 1 3/4\'', 2, 118, 69, 50, 0, 0, 1),
(2499, 'FE08020', 'TORNILLO TIRAFONDO cab exag. 1/4\'X2 1/2\'', 2, 118, 100, 30, 0, 0, 1),
(2500, 'FE08021', 'TORNILLO AUTOPERFORANTE 8 X 1\'', 2, 118, 0, 30, 0, 0, 1),
(2501, 'FE08022', 'TARUGO 6MM', 2, 118, 0, 0, 0, 0, 1),
(2502, 'FE08023', 'TARUGO FISHER 8MM', 2, 118, 0, 50, 0, 0, 1),
(2503, 'FE08024', 'TARUGO 10MM', 2, 118, 0, 50, 0, 0, 1),
(2504, 'FE08025', 'TARUGO 12 MM', 2, 118, 195, 50, 0, 0, 1),
(2505, 'FE09001', 'BROCAS MR 10', 2, 119, 0, 10, 0, 0, 1),
(2506, 'FE09002', 'BROCAS  MR 12', 2, 119, 0, 10, 0, 1, 1),
(2507, 'FE09003', 'BROCAS MR 8', 2, 119, 0, 10, 0, 0, 1),
(2508, 'FE10001', 'VARILLAS ROSCADA X MTS 1/4\'', 3, 120, 0, 0, 0, 0, 1),
(2509, 'FE10002', 'VARILLAS ROSCADA X MTS 1 1/4\'', 3, 120, 1, 0, 0, 0, 1),
(2510, 'FE10003', 'VARILLAS ROSCADA X MTS 3/8\'', 3, 120, 4, 1, 0, 1, 1),
(2511, 'FE10004', 'VARILLAS ROSCADA X MTS 1\'', 3, 120, 0, 0, 0, 0, 1),
(2512, 'FE10005', 'VARILLAS ROSCADA 1/2\' X MTS', 3, 120, 4, 1, 0, 2, 1),
(2513, 'FE10006', 'VARILLAS ROSCADA X MTS 5/8\'', 3, 120, 3, 1, 0, 3, 1),
(2514, 'FE10007', 'VARILLAS ROSCADA X MTS 3/4\'', 3, 120, 2, 1, 0, 5, 1),
(2515, 'FE10008', 'VARILLAS ROSCADA  AC. INOXID X MTS 1/4\'', 3, 120, 0, 0, 0, 0, 1),
(2516, 'FE10009', 'VARILLAS ROSCADA  AC. INOXID X MTS 5/16\'', 3, 120, 0, 0, 0, 0, 1),
(2517, 'FE10010', 'VARILLA ROSCADA X MTS 5/16\'', 3, 120, 1, 0, 0, 0, 1),
(2518, 'FE11001', 'PRECINTOS AZULES COLA RATON NUMERADOS', 2, 121, 3372, 1000, 1, 0, 1),
(2519, 'FE11002', 'PRECINTOS ROJO  COLA RATON NUMERADOS', 2, 121, 2538, 1000, 1, 0, 1),
(2520, 'FE11003', 'PRECINTOS VERDE COLA RATON NUMERADOS', 2, 121, 2510, 1000, 1, 0, 1),
(2521, 'FE11004', 'PRECINTOS METALICOS NUMER COLA RATON', 2, 121, 0, 0, 0, 0, 1),
(2522, 'FE11005', 'PRECINTOS METALICOS NUMERADOS', 2, 121, 0, 0, 0, 0, 1),
(2523, 'FE11006', 'PRECINTOS NEGRO 205 X 4,7  (T4)', 2, 121, 0, 0, 0, 0, 1),
(2524, 'FE11007', 'PRECINTOS NEGRO 300X4,7  (T5)', 2, 121, 0, 0, 0, 0, 1),
(2525, 'FE11008', 'PRECINTOS NEGRO 380X 8mm ( T 8 )', 2, 121, 0, 0, 0, 0, 0),
(2526, 'FE11009', 'PRECINTOS NEGROS 4,7 X 380  (T 7 )', 2, 121, 0, 0, 0, 0, 1),
(2527, 'FE11010', 'PRECINTOS NEGROS 2,5X150mm', 2, 121, 0, 0, 0, 0, 0),
(2528, 'FE12001', 'ELECTRODOS 6010  2,5mm', 4, 122, 17, 5, 0, 13, 1),
(2529, 'FE12002', 'ELECTRODOS 6010  3,25mm', 4, 122, 17, 5, 0, 11, 1),
(2530, 'FE12003', 'ELECTRODOS 6013  2,5mm', 4, 122, 17, 10, 0, 10, 1),
(2531, 'FE12004', 'ELECTRODOS 6013  3,25mm', 4, 122, 34, 5, 0, 9, 1),
(2532, 'FE12005', 'ELECTRODOS 7016  3,25mm', 4, 122, 2, 0, 0, 0, 1),
(2533, 'FE12006', 'ELECTRODOS 7018  2,5mm', 4, 122, 7, 10, 0, 14, 1),
(2534, 'FE12007', 'ELECTRODOS 7018  3,25mm', 4, 122, 23, 10, 0, 9, 1),
(2535, 'FE12008', 'ELECTRODOS AC INOX 316   2,5mm ', 4, 122, 5, 2, 0, 33, 1),
(2536, 'FE12009', 'ELECTRODOS AC INOX 316  2mm  ', 4, 122, 2, 2, 0, 0, 1),
(2537, 'FE12010', 'ELECTRODOS ACERO INOX 308-L  2mm  ', 4, 122, 0, 2, 0, 0, 1),
(2538, 'FE12011', 'ELECTRODOS FUNDICION LIMABLE 2,5mm UNIDAD', 2, 122, 0, 1, 0, 0, 1),
(2539, 'FE12012', 'ELECTRODOS ACERO INOX 308-L  2,5mm ', 4, 122, 5, 2, 0, 25, 1),
(2540, 'FE12013', 'ELECTRODOS 6013 2mm', 4, 122, 11, 10, 0, 14, 1),
(2541, 'FE12014', 'ELECTRODO 6010 2MM', 4, 122, 0, 15, 1, 0, 1),
(2542, 'FE13001', 'Adhesivo Sintetico El Pulpito 120g', 2, 123, 0, 0, 0, 0, 1),
(2543, 'FE13002', 'ADHESIVO PARA PVC X 250CC', 2, 123, 0, 0, 0, 0, 1),
(2544, 'FE13003', 'Crema Limpia Manos Por 500 Grs', 2, 123, 0, 0, 0, 3, 1),
(2545, 'FE13004', 'FASTIX ALTA TEMP X 100 gr', 2, 123, 0, 0, 0, 0, 1),
(2546, 'FE13005', 'FASTIX BLANCO X 100 gr', 2, 123, 0, 0, 0, 0, 1),
(2547, 'FE13006', 'FASTIX TRANSPARENTE X 100gr', 2, 123, 0, 0, 0, 3, 1),
(2548, 'FE13007', 'ADHESIVI CIANOCRILATO 100G', 2, 123, 1, 1, 0, 27, 1),
(2549, 'FE13008', 'POXILINA 10 MIN 250G', 2, 123, 0, 0, 0, 0, 1),
(2550, 'FE13009', 'POXIPOL 10 MIN 82gr ', 2, 123, 0, 0, 0, 0, 1),
(2551, 'FE13010', 'POXIPOL 10 MIN 21gr ', 2, 123, 0, 0, 0, 0, 1),
(2552, 'FE13011', 'POXIRAN X 500CC  MARCA FORTEX ', 2, 123, 0, 0, 0, 0, 1),
(2553, 'FE13012', 'POXILINA 70 GRS', 2, 123, 0, 0, 0, 0, 1),
(2554, 'FE13013', 'SELLADOR SILICONA UNIVERSAL TRANSPARENTE 280 cm3', 2, 123, 2, 1, 0, 2, 1),
(2555, 'FE13014', 'ADHESIVO CIENMANOS SUPRABON 120G', 2, 123, 0, 0, 0, 0, 1),
(2556, 'FE13015', 'ADHESIVO  SILOC P/ MAQUINA', 2, 123, 0, 0, 0, 0, 1),
(2557, 'FE13016', 'VARILLA DE PLATA PARA SOLDAR', 4, 123, 0, 1, 0, 0, 1),
(2558, 'FE13017', 'Trabasil am3 pasta de ptfe(teflon)', 2, 123, 0, 0, 0, 0, 1),
(2559, 'FE13018', 'trabasil Rm1 para trabar tor y bulon', 2, 123, 0, 0, 0, 0, 1),
(2560, 'FE13019', 'Trabasil va4 traba y sella 15gr', 2, 123, 0, 0, 0, 0, 1),
(2561, 'FE13020', 'TRABASIL RA3 SERIE ROJA TRABA Y SELLA', 2, 123, 2, 0, 0, 23, 1),
(2562, 'FE13021', 'TRABASIL VA3 POLEAS Y ENGRANAJES', 2, 123, 0, 2, 0, 23, 1),
(2563, 'FE13022', 'SELLA ROSCA HIDRO3', 2, 123, 0, 0, 0, 3, 1),
(2564, 'FE13023', 'GLICERINA PURA X 250 ', 2, 123, 1, 0, 0, 0, 1),
(2565, 'FE13024', 'LITARGILIO X250G', 2, 123, 0, 0, 0, 0, 1),
(2566, 'FE14001', 'DISCO DE CORTE 115 x 1,6 mm', 2, 124, 0, 25, 0, 0, 1),
(2567, 'FE14002', 'DISCO DE CORTE 180 x 1,6mm', 2, 124, 0, 20, 0, 3, 1),
(2568, 'FE14003', 'DISCO FLAP METAL 115 G120', 2, 124, 10, 5, 0, 2, 1),
(2569, 'FE14004', 'DISCO DESBASTE 115 x 6,4 mm', 2, 124, 4, 0, 0, 3, 1),
(2570, 'FE14005', 'DISCO DESBASTE 180 6,4 mm', 2, 124, 20, 15, 0, 3, 1),
(2571, 'FE14006', 'DISCO FLAP METAL 115 G80', 2, 124, 2, 0, 0, 3, 1),
(2572, 'FE14007', 'DISCO SENCITIVA 356x3,2x25,4mm', 2, 124, 0, 2, 0, 2, 1),
(2573, 'FE14008', 'DISCO FLAP METAL 180 G120', 2, 124, 1, 0, 0, 7, 1),
(2574, 'FE14009', 'HOJA DE SIERRA 24 DIENTES', 2, 124, 11, 5, 0, 2, 1),
(2575, 'FE14010', 'DISCO FLAP METAL 180 G80', 2, 124, 5, 0, 0, 3, 1),
(2576, 'FE14011', 'HOJA DE SIERRA 32 DIENTES', 2, 124, 0, 0, 0, 1, 0),
(2577, 'FE14012', 'COMPUESTO P/ESMERILAR VALVULA WH12 756 X 75KG', 2, 124, 0, 2, 0, 0, 1),
(2578, 'FE14013', 'CEPILLO DE COPA PARA AMOLADORA ANGULAR 110mm', 2, 124, 9, 2, 0, 15, 1),
(2579, 'FE14014', 'CEPILLO RIZADO CENTRO DEPRIMIDO PARA AMOLADORA 110mm', 2, 124, 0, 0, 0, 11, 1),
(2580, 'FE14015', 'CEPILLO MANUAL DE ACERO CON MANGO PLASTICO', 2, 124, 9, 5, 0, 2, 1),
(2581, 'FE15001', 'PINTURA SINTETICA TRIPLE ACCION AZUL X 1 LT', 2, 125, 0, 0, 0, 0, 0),
(2582, 'FE15002', 'PINTURA SINTETICA TRIPLE ACCION VERDE INGLES X 1LT', 2, 125, 0, 0, 0, 0, 0),
(2583, 'FE15003', 'PINTURA SINTETICA TRIPLE ACCION GRIS ESPACIAL X 1LT', 2, 125, 0, 0, 0, 0, 0),
(2584, 'FE15004', 'PINTURA SINTETICA TRIPLE ACCION BLANCA X 1LT', 2, 125, 0, 0, 0, 0, 0),
(2585, 'FE15005', 'PINTURA SINTETICA TRIPLE ACCION CELESTE X 1 LT', 2, 125, 0, 0, 0, 0, 0),
(2586, 'FE15006', 'PINTURA SINTETICA TRIPLE ACCION AMARILLO X 1 LT', 2, 125, 0, 0, 0, 0, 0),
(2587, 'FE15007', 'CINTA PAPEL 24MM', 2, 125, 0, 0, 0, 0, 0),
(2588, 'FE15008', 'ESPATULA METALICA 30MM', 2, 125, 0, 0, 0, 4, 0),
(2589, 'FE15009', 'ESPATULA METALICA 50MM', 2, 125, 0, 0, 0, 0, 0),
(2590, 'FE15010', 'PINCEL N°10', 2, 125, 0, 0, 0, 0, 0),
(2591, 'FE15011', 'PINCEL N°20', 2, 125, 0, 0, 0, 0, 0),
(2592, 'FE15012', 'DESOXIDANTE X 1LT', 2, 125, 0, 0, 0, 0, 0),
(2593, 'FE15013', 'THINNER X 1LT', 2, 125, 0, 0, 0, 0, 0),
(2594, 'FE15014', 'AGUARRAS X 1LT', 2, 125, 0, 0, 0, 0, 0),
(2595, 'FE16001', 'CINTA AISLADORA X ROLLO ', 2, 126, 0, 2, 0, 2, 1),
(2596, 'FE16002', 'CINTA AISLADORA AUTOSOLDABLE', 2, 126, 0, 2, 0, 0, 1),
(2597, 'FE16003', 'CINTA DE PAPEL 48mm', 2, 126, 0, 2, 0, 0, 1),
(2598, 'FE16004', 'PINZA PORTA ELECTRODO', 2, 126, 0, 1, 0, 0, 1),
(2599, 'FE16005', 'acople macho cordon 35-50 ( soldadora elecrica)', 2, 126, 0, 0, 0, 0, 1),
(2600, 'FE16006', 'CHISPERO OXICORTE', 2, 126, 0, 2, 0, 0, 1),
(2601, 'FE16007', 'LLAVE CONMUTADORA SOLDADORA ELECTRICA', 2, 126, 1, 0, 0, 0, 1),
(2602, 'FE17001', 'CEPILLO ACERO S/MANGO 6 X 19', 2, 127, 0, 0, 0, 0, 1),
(2603, 'FE17002', 'CEPILLO DE ACERO DE MANO ACERO LATONADO', 2, 127, 0, 0, 0, 0, 1),
(2604, 'FE17003', 'CEPILLO DE ACERO C/MANGO 4 x 19 ', 2, 127, 0, 0, 0, 0, 1),
(2605, 'FE17004', 'CEPILLO CIRCULAR C/ESPIGA 50 MM(MOTA)', 2, 127, 0, 0, 0, 0, 1),
(2606, 'FE17005', 'CEPILLO CIRCULAR ONDULADO 17MM (MOTA)', 2, 127, 0, 0, 0, 0, 1),
(2607, 'FE17006', 'CEPILLO BROCHA ONDULADO  6,3 MM (TOWER)', 2, 127, 0, 0, 0, 0, 1),
(2608, 'FE17007', 'CEPILLO 3/16', 2, 127, 0, 0, 0, 0, 1),
(2609, 'FE17008', 'Cepillo CIRCULAR  rizado Ø 200 x 30 MULTIBUJE', 2, 127, 0, 0, 0, 0, 0),
(2610, 'FE17009', 'Cepillo circular trenzado Ø175', 2, 127, 11, 3, 0, 0, 1),
(2611, 'FE17010', 'CEPILLO RIZADO WEMBLEY 5586 -- 8 Pulgada ', 2, 127, 0, 0, 0, 0, 1),
(2612, 'FE17011', 'LIJA AL AGUA Nº 100/80', 2, 127, 0, 5, 0, 0, 1),
(2613, 'FE17012', 'LIJA AL AGUA Nº 180/150', 2, 127, 0, 7, 0, 0, 1),
(2614, 'FE17013', 'LIJA AL AGUA Nº 360 /400', 2, 127, 0, 5, 0, 0, 1),
(2615, 'FE17014', 'LIJA AL AGUA Nº 600', 2, 127, 8, 0, 0, 0, 1),
(2616, 'FE17015', 'LIJA AL AGUA Nº 220 /280', 2, 127, 0, 6, 0, 0, 1),
(2617, 'FE17016', 'LIJA AL AGUA N° 1200', 2, 127, 8, 0, 0, 0, 1),
(2618, 'FE17017', 'TELA ESMERIL Nº  80', 2, 127, 0, 0, 0, 1, 1),
(2619, 'FE17018', 'TELA ESMERIL Nº 100', 2, 127, 0, 8, 0, 1, 1),
(2620, 'FE17019', 'TELA ESMERIL Nº 150', 2, 127, 0, 8, 0, 1, 1),
(2621, 'FE17020', 'TELA ESMERIL Nº 180', 2, 127, 0, 8, 0, 1, 1),
(2622, 'FE17021', 'TELA ESMERIL OXIDO ALUMINIO Nª 100', 2, 127, 0, 5, 0, 0, 1),
(2623, 'FE17022', 'TELA ESMERIL OXIDO ALUMINIO Nª 150', 2, 127, 0, 5, 0, 0, 1),
(2624, 'FE17023', 'TELA ESMERIL OXIDO ALUMINIO N° 180', 2, 127, 0, 5, 0, 0, 1),
(2625, 'FE18001', 'ROLLO  TEFLON 3/4 X 40 MTS ALTA DENSIDAD ', 2, 128, 15, 5, 0, 3, 1),
(2626, 'FE18002', 'ROLLO TEFLON 3/4 X 20 MTS', 2, 128, 34, 50, 0, 1, 1),
(2627, 'FE18003', 'ESPUMA DE POLIURETANO', 2, 128, 0, 0, 0, 5, 1),
(2628, 'FE18004', 'PINCEL Nº 10', 2, 128, 0, 0, 0, 0, 0),
(2629, 'FE18005', 'CINTA METRICA 5 MTS', 2, 128, 0, 0, 0, 15, 1),
(2630, 'FE18006', 'CINTA METRICA 8 MTS', 2, 128, 0, 2, 0, 23, 1),
(2631, 'FE18007', 'NICKEL ANTISEIZE CHEST. 725 DE 500', 2, 128, 0, 0, 0, 0, 1),
(2632, 'FE18008', 'HOJA PARA SIERRA CALADORA - METAL', 2, 128, 4, 5, 0, 5, 1),
(2633, 'FE18009', 'HOJA PARA SIERRA CALADORA - MADERA', 2, 128, 10, 2, 0, 0, 1),
(2634, 'FE18010', 'WD40 X 300 cm3 O SUPER LUBE  (LUBRICANTE)', 2, 128, 0, 5, 0, 8, 1),
(2635, 'FE18011', 'FIELTRO ACOTROP (GUATA BLANCA) PARA EL FILTRADO DE AIRE 10 4,00 40,00 2/3 DIAS ESP 20 MM ANCHO 1,50 MTS.', 2, 128, 0, 1, 1, 0, 1),
(2636, 'FE18012', 'RESINA POLVO 0,70X250', 2, 128, 0, 0, 0, 0, 1),
(2637, 'FE18013', 'RESINA POLVO 0,70X500', 2, 128, 0, 0, 0, 0, 1),
(2638, 'FE18014', 'TANZA PARA MOTOGUADAÑA', 2, 128, 0, 0, 0, 0, 1),
(2639, 'FE18015', 'CABLE ACERO Ø 6 mm ', 3, 128, 0, 0, 0, 20, 1),
(2640, 'FI01001', 'FILTRO 2 1/2\'X20\' -1 MICRON', 2, 129, 26, 5, 1, 7, 1),
(2641, 'FI01002', 'FILTRO 4 1/2\'X20\' - 10 MICRONES', 2, 129, 15, 5, 1, 28, 1),
(2642, 'FI01003', 'FILTRO 4 1/2\'X20\' - 5 MICRONES ', 2, 129, 78, 24, 1, 28, 1),
(2643, 'FI01004', ',,,,', 2, 129, 0, 0, 0, 0, 0),
(2644, 'FI01005', 'FILTRO ABLANDADORES DE AGUA 05 MIC LARGO 25,5 cm', 2, 129, 4, 0, 0, 0, 0),
(2645, 'FI01006', 'FILTRO REFRIGERANTE BRIER DANFOSS DCR04811', 2, 129, 1, 1, 0, 0, 1),
(2646, 'FI01007', 'FILTRO RESHIDRATADOR CON SILIGEL ', 2, 129, 1, 1, 0, 0, 1),
(2647, 'FI01008', 'Cartucho de fieltro plisado Retencion: 15 micrones Diam. Ext 230 mm Altura 330mm - CODIGO GORA 45209', 2, 129, 4, 9, 1, 330, 1),
(2648, 'FI01009', 'FILTRO  4 1/2\'X10\' - 5 MICRONES', 2, 129, 5, 3, 1, 12, 1),
(2649, 'FI01010', 'VENDA DE TARLA TANA 100mX20cm', 2, 129, 1, 1, 0, 0, 1),
(2650, 'FI01011', 'VENDA DE TARLA TANA 100mX10cm', 2, 129, 1, 1, 0, 0, 1),
(2651, 'FI01012', 'FILTRO 2 1/2\'x40\' - 5 MICRONES  ', 2, 129, 41, 21, 1, 16, 1),
(2652, 'FI01013', 'FILTRO ACEITE SUX 324 255  ( PARA PULSA 7120)', 2, 129, 0, 0, 0, 0, 0),
(2653, 'FI01014', 'FILTRO ACEITE IA 115 ALASFILT (grupo elect)', 2, 129, 1, 1, 0, 0, 1),
(2654, 'FI01015', 'FILTRO COMBUSTIBLE FPS586F O GS97 TECNECO (grupo elect)', 2, 129, 0, 1, 0, 0, 1),
(2655, 'FI01016', 'FILTRO  DE ACEITE OL 65 TECNECO (grupo elect)', 2, 129, 0, 0, 0, 0, 1),
(2656, 'FI01017', 'FILTRO  DE AIRE DARMET V-718 (grupo elect)', 2, 129, 0, 1, 0, 0, 1),
(2657, 'FI01018', 'FILTRO DE ACEITE AUTOELEVADOR US 129', 2, 129, 1, 1, 0, 0, 1),
(2658, 'FI01019', 'FILTRO DE ACEITE LANSS BL 2090', 2, 129, 1, 1, 0, 0, 1),
(2659, 'FI01020', 'FILTRO LANSS EF-789-R', 2, 129, 0, 3, 0, 0, 1),
(2660, 'FI01021', 'FILTROS 4 1/2\'X20\' -1 MICRONES', 2, 129, 12, 7, 0, 0, 1),
(2661, 'FI01022', 'FILTRO Y PTFE S-300 2', 2, 129, 0, 1, 0, 0, 1),
(2662, 'FI01023', 'FILTRO Ø120 X300 mm CON PERFORACIONES DE Ø 5 mm', 2, 129, 0, 0, 0, 0, 1),
(2663, 'FI01024', 'FILTRO 2 1/2\' X 20\' - 5 MICRONES', 2, 129, 24, 5, 1, 0, 1),
(2664, 'FI01025', 'FILTRO 4 1/2\'X 20\' 3 MICRONES', 2, 129, 20, 15, 1, 28, 1),
(2665, 'FI02001', 'FILTROS \'Y\'  ROSCADO  1/2\'', 2, 130, 1, 2, 0, 0, 1),
(2666, 'FI02002', 'FILTROS \'+C2703Y\'  ROSCADO  3/4\'', 2, 130, 1, 1, 0, 0, 1),
(2667, 'FI02003', 'FILTROS \'Y\'  ROSCADO   1\'', 2, 130, 0, 2, 0, 0, 1),
(2668, 'FI02004', 'FILTROS \'Y\'  ROSCADO  1 1/2\'', 2, 130, 0, 0, 0, 0, 1),
(2669, 'FI02005', 'FILTROS \'Y\'  BRIDADO 2\'', 2, 130, 1, 1, 1, 0, 1),
(2670, 'JU01001', 'JUNTAS KLINGER S-150 2 1/2\'   2mm', 2, 131, 10, 0, 0, 0, 1),
(2671, 'JU01002', 'JUNTAS KLINGER S-300 2 1/2\'    2mm', 2, 131, 10, 0, 0, 0, 1),
(2672, 'JU01003', 'JUNTAS KLINGER S-150 3\'  2mm', 2, 131, 10, 0, 0, 0, 1),
(2673, 'JU01004', 'JUNTAS KLINGER S-300 1\'    2mm', 2, 131, 0, 0, 0, 0, 1),
(2674, 'JU01005', 'JUNTAS KLINGER S-300 1/2\'   2mm', 2, 131, 2, 0, 0, 0, 1),
(2675, 'JU01006', 'JUNTAS KLINGER S-150 1/2\'    2mm', 2, 131, 12, 0, 0, 0, 1),
(2676, 'JU01007', 'JUNTAS KLINGER S-150 3/4\'   2mm', 2, 131, 2, 0, 0, 0, 1),
(2677, 'JU01008', 'JUNTAS KLINGER S-300 3/4\'   2mm', 2, 131, 10, 0, 0, 0, 1),
(2678, 'JU02001', 'JUNTA TEFLONADA 3mm 42,9X33,3', 2, 132, 14, 0, 0, 0, 1),
(2679, 'JU02002', 'JUNTA TEFLONADA 3mm 35,1x25,4', 2, 132, 16, 0, 0, 0, 1),
(2680, 'JU02003', 'JUNTA TEFLONADA 3mm 110x126', 2, 132, 4, 0, 0, 0, 1),
(2681, 'JU02004', 'JUNTA TEFLONADA 3mmx1 1/2', 2, 132, 0, 0, 0, 0, 1),
(2682, 'JU02005', 'JUNTA TEFLONADA 3mm 1\'', 2, 132, 2, 0, 0, 0, 1),
(2683, 'JU02006', 'JUNTA TEFLONADA  3mm 3 1/2', 2, 132, 5, 0, 0, 0, 1),
(2684, 'JU02007', 'JUNTA TEFLONADA 3mm s-300 2 1/2', 2, 132, 11, 0, 0, 0, 1),
(2685, 'JU02008', 'JUNTA TEFLONADA 3mm s-300 3\'', 2, 132, 0, 0, 0, 0, 1),
(2686, 'JU02009', 'JUNTA TEFLONADA 3mm 215,9x 190,5', 2, 132, 5, 0, 0, 0, 1),
(2687, 'JU02010', 'CUERDA AUTOADHESIVA DE TEFLON Ø 3/4\'', 3, 132, 0, 0, 0, 0, 1),
(2688, 'JU02011', 'CUERDA AUTOADHESIVA DE TEFLON Ø 1\'', 3, 132, 0, 0, 0, 0, 1),
(2689, 'JU03001', 'EMPAQUETADURA DE TEFLON  3/8 ', 4, 133, 0, 2, 1, 0, 1),
(2690, 'JU03002', 'EMPAQUETADURA AMIANTO GRAFITADO  1/4 ', 3, 133, 4, 0, 0, 0, 1),
(2691, 'JU03003', 'EMPAQUETADURA AMIANTO  3/8', 3, 133, 0, 0, 0, 0, 1),
(2692, 'JU03004', 'EMPAQUETADURA AMIANTO  1/4', 3, 133, 0, 0, 0, 0, 1),
(2693, 'JU03005', 'CORDON DE TEFLON MACISO FLEXIBLE 6mm (VALVELON) X MTRS', 3, 133, 13, 5, 0, 0, 1),
(2694, 'JU03006', 'CORDON DE TEFLON MACISO FLEXIBLE 8mm (VALVELON) X MTRS', 3, 133, 0, 0, 0, 0, 1),
(2695, 'JU04001', 'PLANCHA KLINGER 1 mm ', 4, 134, 3, 3, 1, 95, 1),
(2696, 'JU04002', 'PLANCHA KLINGER 3 mm 1500X2000mm COD:4243 ', 4, 134, 1, 2, 1, 246, 1),
(2697, 'JU04003', 'PLANCHA PTFE EXPANDIDO 1000x1000x6mm', 2, 134, 1, 2, 1, 14920, 1),
(2698, 'JU04004', 'PELICULA/AFEITADO TEFLON   2 x 1000 x 1000 mm', 2, 134, 0, 2, 1, 179, 1),
(2699, 'JU04005', 'PELICULA/AFEITADO TEFLON   1 x 1000 x 1000 mm', 2, 134, 4, 2, 1, 133, 1),
(2700, 'JU04006', 'PELICULA/AFEITADO TEFLON 3 x 1000 x 1000 mm', 2, 134, 0, 2, 1, 414, 1),
(2701, 'JU04007', 'ROLLO PTFE EXPANDIDO  25 mm x 7 mm x 5 mts', 2, 134, 4, 4, 1, 261, 1),
(2702, 'JU04008', 'PELICULA/AFEITADO TEFLON 6 x 1000 x 1000 mm', 2, 134, 2, 1, 1, 746, 1),
(2703, 'JU04011', 'TELA DE VIDRIO TEFLONADA  150 MICRONES 1000X1000mm s/adhesivo', 2, 134, 0, 0, 0, 0, 1),
(2704, 'JU04012', 'PLANCHA DE NEOPRENE 3x1000x1000mm', 2, 134, 0, 3, 0, 79, 1),
(2705, 'JU04013', 'KLINGER 2 mm X KG', 4, 134, 0, 0, 0, 0, 1),
(2706, 'JU05001', 'JUNTA EXPANSIÓN C/TEFLON MALLADO S-150-   2\'', 2, 135, 1, 0, 0, 0, 1),
(2707, 'JU05002', 'JUNTA EXPANSION Ø 1\' S-150 C/TEFLON, 5 VOLUTAS, MALLA AISI, ANILLO ENTRE VOLUTAS 100mm entre bridas, para 6bar', 2, 135, 0, 0, 0, 0, 1),
(2708, 'JU05003', 'JUNTA EXPANSIÓN C/TEFLON S-150 1 1/2', 2, 135, 1, 0, 0, 0, 1),
(2709, 'JU05004', 'JUNTA EXPANSIÓN C/RESORTE S-150 1 1/2 ', 2, 135, 2, 0, 0, 0, 1),
(2710, 'JU05005', 'JUNTA EXPANSIÓN C/RESORTE S-150 2\'', 2, 135, 1, 0, 0, 0, 1),
(2711, 'LI01001', 'BLOCK RESMA A 4 X 75 KG', 2, 136, 0, 0, 0, 0, 1),
(2712, 'LI01002', 'CUADERNO ESP 84 HOJAS', 2, 136, 0, 0, 0, 0, 1),
(2713, 'LI01003', 'BROCHES GRAP Nº 10/50 X 1000', 2, 136, 0, 0, 0, 0, 1),
(2714, 'LI01004', 'LAPIZ NEGRO', 2, 136, 0, 0, 0, 0, 1),
(2715, 'LI01005', 'BOLIGRAFOS / LAPICERA NEG/AZUL', 2, 136, 4, 0, 0, 0, 1),
(2716, 'LI01006', 'LAPIZ CORRECTOR', 2, 136, 1, 0, 0, 1, 1),
(2717, 'LI01007', 'RESALTADORES', 2, 136, 0, 0, 0, 0, 1),
(2718, 'LI01008', 'MARCADOR NEGRO', 2, 136, 2, 0, 0, 1, 1),
(2719, 'LI01009', 'CUTER MEDIANO', 2, 136, 0, 0, 0, 0, 1),
(2720, 'LI01010', 'HOJA CUTER MEDIANO', 2, 136, 0, 0, 0, 0, 1),
(2721, 'LI01011', 'CINTA EMBALAR ADHESIVA TRANSPARENTE 48mm X 50mt', 2, 136, 0, 0, 0, 0, 1),
(2722, 'LI01012', 'BIBLIORATO OFICIO', 2, 136, 0, 0, 0, 0, 1),
(2723, 'LI01013', 'CARPETA OFICIO 2 ANILLOS FIBRA ECOLOGICA', 2, 136, 0, 0, 0, 0, 1),
(2724, 'LI01014', 'SOBRE MANILA 30X24', 2, 136, 0, 0, 0, 0, 1),
(2725, 'LI01015', 'SOBRE MANILA 30X40', 2, 136, 0, 0, 0, 0, 1),
(2726, 'LI01016', 'JUEGO DE SEPARADORES TAMAÑO A4', 2, 136, 0, 0, 0, 0, 1),
(2727, 'LI01017', 'REGLA ACRILICO 40 CM', 2, 136, 2, 1, 0, 0, 1),
(2728, 'LI01018', 'TIZA BLANCA', 2, 136, 55, 0, 0, 0, 1),
(2729, 'LI01019', 'CALCULADORA', 2, 136, 0, 0, 0, 0, 1),
(2730, 'LI01020', 'FILM CARBONICO 22X33CM', 2, 136, 0, 0, 0, 0, 1),
(2731, 'LI01021', 'FOLIO OFICIO', 2, 136, 0, 0, 0, 0, 1),
(2732, 'LI01022', 'FOLIO A4', 2, 136, 0, 0, 0, 0, 1),
(2733, 'LI01023', 'TINTA NEGRA PARA SELLOS 25ml', 2, 136, 0, 0, 1, 5, 1),
(2734, 'LI01024', 'TINTA PARA MARCADOR PERMANENTE', 2, 136, 0, 0, 0, 0, 1),
(2735, 'LI01025', 'PLASTICOLA X 500 GR', 2, 136, 0, 0, 0, 0, 1),
(2736, 'LI01026', 'BROCHES 21/6 CAJA X 5000', 2, 136, 150, 0, 0, 0, 1),
(2737, 'LI01027', 'ABROCHADORA', 2, 136, 0, 0, 0, 0, 1),
(2738, 'LI01028', 'GOMA LAPIZ', 2, 136, 0, 0, 0, 0, 1),
(2739, 'LI01029', 'PORTA TARJETA IDENTIFICACION', 2, 136, 20, 1, 0, 0, 1),
(2740, 'LI01030', 'BANDA ELASTICA  BOLSA X 100', 2, 136, 0, 0, 0, 0, 1),
(2741, 'LI01031', 'BORRADOR MADERA', 2, 136, 1, 0, 0, 0, 1),
(2742, 'LI01032', 'TIJERA', 2, 136, 1, 0, 0, 6, 1),
(2743, 'LI01033', 'BROCHES NEPACO Nº 2', 2, 136, 0, 0, 0, 0, 1),
(2744, 'LI01034', 'BLOCK HOJA CORRESP Nº 3', 2, 136, 0, 0, 0, 0, 1),
(2745, 'LI01035', 'CARTUCHO HP NEGRO Nº 662 PARA HP 2515', 2, 136, 0, 0, 0, 0, 0),
(2746, 'LI01036', 'CARTUCHO HP NEGRO Nº 94', 2, 136, 1, 0, 0, 0, 1),
(2747, 'LI01037', 'CARTUCHO HP COLOR Nº662 PARA HP 2515', 2, 136, 0, 0, 0, 0, 1),
(2748, 'LI01038', 'ROLLO FAX DE 215  215MM', 2, 136, 3, 0, 0, 0, 1),
(2749, 'LI01039', 'ROLLO CINTA FAX PANAS KX-FA93', 2, 136, 3, 1, 0, 0, 1),
(2750, 'LI01040', 'CINTA P/FAX EPSON MX80-810', 2, 136, 1, 1, 0, 0, 1),
(2751, 'LI01041', 'CINTA IMPRES EPSON 8755', 2, 136, 1, 1, 0, 0, 1),
(2752, 'LI01042', 'LIBRETA NORTE Nº 100 TAPA NEGRA', 2, 136, 3, 0, 0, 2, 1),
(2753, 'LI01043', 'MARCADOR INDELEBLE', 2, 136, 0, 0, 0, 0, 1),
(2754, 'LI01044', 'CARTUCHO HP NEGRO Nº21', 2, 136, 1, 0, 0, 0, 1),
(2755, 'LI01045', 'CARTUCHO HP COLOR Nº 22', 2, 136, 1, 0, 0, 0, 1),
(2756, 'LI01046', 'CARTUCHO HP NEGRO Nº 56', 2, 136, 2, 1, 0, 0, 1),
(2757, 'LI01047', 'CAJA P/ARCHIVO', 2, 136, 0, 0, 0, 0, 1),
(2758, 'LI01048', 'CARPETA A4 TAPA TRANSPARENTE', 2, 136, 0, 0, 0, 0, 1),
(2759, 'LI01049', 'PAPEL PARA PLASTIFICAR', 2, 136, 1, 1, 0, 0, 1),
(2760, 'LI01050', 'TARJETA DE APROXIMACION', 2, 136, 45, 2, 0, 0, 1),
(2761, 'LI01051', 'CARTUCHO VINILO 12,7mm (MC-500-595-WT-BK) P/ ROTULADORA', 2, 136, 0, 2, 0, 69, 1),
(2762, 'LI01052', 'CINTA VINILO 24mm (MC1-1000-595-WT-BK) P/ ROTULADORA', 2, 136, 0, 2, 0, 82, 1),
(2763, 'LI01053', 'CARTUCHO VINILO 38mm (MC-1500-595-YL-BK) P/ ROTULADORA', 2, 136, 1, 2, 0, 159, 1),
(2764, 'LI01054', 'TONER LASER HP Q2612A ', 2, 136, 0, 0, 0, 0, 1),
(2765, 'LI01055', 'SELLOS MARCA ILDA T908 NUNERADOR 8 DIGITOS', 2, 136, 3, 2, 1, 38, 1),
(2766, 'LI01056', 'COLCHA PARA SELLO Nº 1', 2, 136, 1, 1, 0, 0, 1),
(2767, 'LI01057', 'TONER LASER HP CF217AC', 2, 136, 1, 1, 0, 0, 1),
(2768, 'LI01058', 'CARTUCHO VINILO 38mm (MC-1500-595-WT-BK) P/ ROTULADORA', 2, 136, 1, 2, 0, 159, 1),
(2769, 'LI01059', 'CARTUCHO AGILENT NEGRO P/CROMATÓGRAFO', 2, 136, 1, 0, 0, 0, 1),
(2770, 'LI01060', 'SELLOS MARCA ILDA T910 NUNERADOR 10 DIGITOS', 2, 136, 0, 2, 1, 25, 1),
(2771, 'LI01061', 'TONER LASER HP 105A', 2, 136, 0, 0, 0, 0, 1),
(2772, 'LI01062', 'CLIP Nº 5 ', 2, 136, 0, 0, 0, 0, 1),
(2773, 'LI01063', 'LIBRO DE ACTA', 2, 136, 0, 1, 0, 0, 1),
(2774, 'LI02001', 'TALONARIO PERMISO DE CARGA FORMULARIO 124', 2, 137, 7, 1, 0, 0, 1),
(2775, 'LI02002', 'TALONARIO HOJA MEMBRETADA', 2, 137, 6, 4, 1, 0, 1),
(2776, 'LI02003', 'TALONARIO SP P/LABORATORIO', 2, 137, 0, 0, 0, 0, 0),
(2777, 'LI02004', 'TALONARIO PT P/ LABORATORIO', 2, 137, 0, 0, 0, 0, 0),
(2778, 'LI02005', 'TALONARIO REMITO INTERNO', 2, 137, 0, 0, 0, 0, 0),
(2779, 'LI02006', 'TALONARIO ORDEN D TRAB MANTENIM', 2, 137, 0, 0, 0, 0, 0),
(2780, 'LI02007', 'TALONARIO INGRESO /EGRESO M/PRIMA', 2, 137, 0, 0, 0, 0, 1),
(2781, 'LI02008', 'TALONARIO TIKECT PESADA', 2, 137, 0, 0, 0, 0, 0),
(2782, 'LI02009', 'TALONARIO VALORES DE CATALIZADOR A PLANTA FORM 208', 2, 137, 1, 0, 0, 0, 1),
(2783, 'LI02010', 'TALONARIO VALORES DE LABORATORIO A PLANTA 219', 2, 137, 3, 1, 0, 0, 1),
(2784, 'LI02011', 'FORMULARIO MANIFIESTO - PROGRAMA GESTION AMBIENTAL', 2, 137, 0, 0, 0, 0, 1),
(2785, 'LI02012', 'PLANILLA INGRESO DE MATERIALES', 2, 137, 2, 1, 0, 0, 1),
(2786, 'LI02013', 'REMITO 01- HOJA CONTINUA', 2, 137, 0, 0, 0, 0, 1),
(2787, 'LI02014', 'REMITO 08 - HOJA CONTINUA', 2, 137, 0, 0, 0, 0, 1),
(2788, 'LI02015', 'TALONARIO VALE RETIRO DE MATERIALES ALMACEN (170X80mm)', 2, 137, 0, 0, 0, 0, 0),
(2789, 'LI02016', 'PLANILLAS TROQUELADAS EN 5 HORIZONTAL', 2, 137, 0, 0, 0, 0, 1),
(2790, 'LI03001', 'TETRAFLUOROETANO (R 134a) 21x14cm', 2, 138, 34, 20, 1, 1, 1),
(2791, 'LI03002', 'PENTAFLUOROETANO (R 410a) 21x14cm', 2, 138, 301, 20, 1, 0, 1),
(2792, 'LI03003', 'NECTON R 410a 19x8.5cm', 2, 138, 485, 20, 1, 0, 1),
(2793, 'LI03004', 'NECTON R 134a 19x8.5cm', 2, 138, 112, 20, 1, 0, 1),
(2794, 'LI03005', 'NECTON 22 17,5X8,5 P/ CILINDROS FONDO NARANJA BORDE Y NUMEROS NEGROS', 2, 138, 334, 100, 0, 0, 1),
(2795, 'LI03006', 'GAS NO INFLAMABLE 2 15X15', 2, 138, 237, 100, 1, 1, 1),
(2796, 'LI03007', 'VENENO 6  24X24 CM', 2, 138, 29, 20, 1, 1, 1),
(2797, 'LI03008', 'ACIDO FLUORHIDRICO CAS 7664-39-3 | 20X14cm', 2, 138, 208, 20, 1, 2, 1),
(2798, 'LI03009', 'ACIDO FLUORHIDRICO  % 21X20 TOXICO 6,1/CORROSIVO 8', 2, 138, 90, 40, 1, 0, 1),
(2799, 'LI03010', 'CORROSIVO 8 25X25 CM', 2, 138, 95, 20, 1, 1, 1),
(2800, 'LI03011', 'NUMERO DE ONU 23  | 14 X 35 CM FONDO NARANJA BORDE Y NUMEROS NEGROS', 2, 138, 70, 20, 1, 2, 1),
(2801, 'LI03012', 'TOXICO 6 / 25X25CM CALABERA BLANCO', 2, 138, 0, 25, 0, 0, 1),
(2802, 'LI03013', 'TOXIC 6 /25 X 25 CM ', 2, 138, 0, 0, 0, 0, 1),
(2803, 'LI03014', 'NON FLAMABLE COMPRESSED GAS 2 /25X25CM ', 2, 138, 19, 25, 1, 1, 1),
(2804, 'LI03015', 'FLAMMABLE GAS 2  / 25X25 CM', 2, 138, 0, 0, 0, 0, 1),
(2805, 'LI03016', 'INFLAMABLE 2 25 X 25 CM ', 2, 138, 64, 0, 0, 2, 1),
(2806, 'LI03017', 'VENENO 6  / 20X20 CM ', 2, 138, 60, 1, 0, 0, 1),
(2807, 'LI03018', 'TOXICO /VENENO 2  20X20CM ', 2, 138, 15, 1, 0, 0, 1),
(2808, 'LI03019', 'TOXICO 6,1 / 15 X 15 CM', 2, 138, 0, 1, 0, 0, 1),
(2809, 'LI03020', 'TOXICO / VENENO  2  / 10X10 CM', 2, 138, 0, 1, 0, 0, 1),
(2810, 'LI03021', 'CHLORODIFLUOROMETHANE 140X8 CM', 2, 138, 0, 0, 1, 0, 1),
(2811, 'LI03022', 'ACIDO FLUORHIDRICO 1,13MTS X 14CM', 2, 138, 0, 0, 0, 0, 1),
(2812, 'LI03023', 'NUMERO DE ONU 20  FONDO NARANJA BORDE Y NUMEROS NEGROS14 X 35 CM', 2, 138, 85, 20, 1, 2, 1),
(2813, 'LI03024', 'NUMERO DE ONU 1028 / 14 X 35 CM ', 2, 138, 0, 1, 0, 0, 1),
(2814, 'LI03025', 'NUMERO DE ONU 1078 /  14 X 35 CM', 2, 138, 0, 0, 0, 0, 1),
(2815, 'LI03026', 'NUMERO DE ONU 1018 /  14 X 35 CM', 2, 138, 160, 20, 1, 0, 1),
(2816, 'LI03027', 'NUMERO DE ONU 20/1078  =27 X 35CM', 2, 138, 0, 0, 0, 0, 1),
(2817, 'LI03028', 'NUMERO DE ONU 20/1028 = 27 X 35 CM', 2, 138, 0, 0, 0, 0, 1),
(2818, 'LI03029', 'NUMERO DE ONU 60/1846 = 27 X 35 CM ', 2, 138, 25, 1, 0, 0, 1),
(2819, 'LI03030', 'NUMERO DE ONU 80/1830 = 27 X 35 CM ', 2, 138, 33, 20, 1, 0, 1),
(2820, 'LI03031', 'NUMERO DE ONU 886/1790 FONDO NARANJA BORDE Y NUMEROS NEGROS 27X35 CM ', 2, 138, 66, 10, 1, 0, 1),
(2821, 'LI03032', 'NUMERO DE ONU 80/1789 = 27 X 35 CM', 2, 138, 62, 1, 0, 0, 1),
(2822, 'LI03033', 'NUMERO DE ONU 886/1052  FONDO NARANJA, BORDE Y NUMEROS NEGROS 27 X 35 cm', 2, 138, 34, 20, 1, 2, 1),
(2823, 'LI03034', 'NUMERO DE ONU 3163 FONDO NARANJA BORDE Y NUMEROS NEGROS 14 X 35 CM ', 2, 138, 98, 10, 1, 2, 1),
(2824, 'LI03035', 'NUMERO DE ONU 80/1830 = 18 X 29 CM ', 2, 138, 0, 0, 0, 0, 1),
(2825, 'LI03036', 'NUMERO DE ONU 86/1790 = 18 X 29 CM', 2, 138, 100, 0, 0, 0, 1),
(2826, 'LI03037', 'NUMERO DE ONU 86/1789 = 27 X 35 CM', 2, 138, 13, 1, 0, 0, 1),
(2827, 'LI03038', 'NUMERO DE ONU 886/1790  FONDO NARANJA BORDE Y NUMEROS NEGROS| 11,5 X 17,5 CM ', 2, 138, 0, 0, 1, 0, 1),
(2828, 'LI03039', 'NUMERO DE ONU 80/1830 = 11,5 X 17,5 CM ', 2, 138, 0, 1, 0, 0, 1),
(2829, 'LI03040', 'NECTON  141b 19x8.5cm', 2, 138, 0, 0, 0, 0, 1),
(2830, 'LI03041', 'PRODUCIDO Y ENV P/FRIO IND 4,5X13CM  ( 1000 UND 1,00 KG )', 2, 138, 0, 0, 0, 0, 1),
(2831, 'LI03042', 'MATERIA PRIMA SIN ANALIZAR 6X9,5CM COLOR AMARILLO', 2, 138, 186, 3, 0, 0, 1),
(2832, 'LI03043', 'MATERIA PRIMA NO CONFORME 6X9,5CM COLOR ROJO', 2, 138, 60, 1, 0, 0, 1),
(2833, 'LI03044', 'PRODUCTO TERMINADO NO CONFORME 6X9,5CM ROJO', 2, 138, 0, 0, 0, 0, 1),
(2834, 'LI03045', 'INSUMOS NO CONFORME 6X9,5CM COLOR AZUL', 2, 138, 71, 1, 0, 0, 1),
(2835, 'LI03046', 'ENVASES DESCARTADOS 6 X 9,5 CM VERDE FLUO', 2, 138, 0, 0, 0, 0, 1),
(2836, 'LI03047', 'PRODUCTO NO CONFORME 5 X 8 CM COLOR NARANJA FLUO', 2, 138, 544, 7, 0, 0, 1),
(2837, 'LI03048', 'ACIDO NITRICO % - LOTE - 20 x 20 cm', 2, 138, 48, 30, 1, 0, 1),
(2838, 'LI03049', 'PRODUCTO MUESTREADO 10 X 15 CM ', 2, 138, 981, 5, 0, 0, 1),
(2839, 'LI03050', 'PRODUCTO CONFORME 8 X 12 CM VERDE LABORATORIO', 2, 138, 340, 300, 1, 0, 1),
(2840, 'LI03051', 'PARA EXPORTACION 8 X 12 CM FONDO BLANCO', 2, 138, 0, 0, 0, 0, 1),
(2841, 'LI03053', 'NUMERO DE ONU  3159 FONDO NARANJA BORDE Y NUMEROS NEGROS 14 X 35 CM ', 2, 138, 43, 5, 1, 1, 1),
(2842, 'LI03054', 'CLORODIFLUOROMETANO (R 22) 21x14cm', 2, 138, 380, 100, 1, 1, 1),
(2843, 'LI03055', 'TARJETA DE SEGURIDAD ( PELIGRO )', 2, 138, 0, 50, 0, 0, 1),
(2844, 'LI03056', 'ENVASE DESCARTADOS 5,5 X 9,5 COLOR ROJO', 2, 138, 355, 200, 1, 0, 1),
(2845, 'LI03057', 'NUMERO DE ONU 266/1017  35X27 (CLORO)', 2, 138, 0, 0, 0, 0, 1),
(2846, 'LI03058', 'CALCO PARA TRANSPORTE MARITIMO DE 25X25 ', 2, 138, 61, 24, 1, 0, 1),
(2847, 'LI03059', 'NUMERO DE ONU 23/3252 FONDO NARANJA BORDE Y NUMEROS NEGROS 27 X 35 CM ', 2, 138, 41, 0, 0, 2, 1),
(2848, 'LI03060', 'NUMERO DE ONU 86/1790 = 27 X 35 CM', 2, 138, 63, 1, 0, 0, 1),
(2849, 'LI03061', 'CALCO INDUSTRIA ARGENTINA 2 X 8 CM', 2, 138, 0, 0, 0, 0, 1),
(2850, 'LI03062', 'NUMERO DE ONU 86/1790 = 18 X 29 CM', 2, 138, 0, 0, 0, 0, 1),
(2851, 'LI03063', 'NUMERO DE ONU 80/1730 = 27 X 35 CM ', 2, 138, 0, 0, 0, 0, 1),
(2852, 'LI03064', 'NUMERO DE ONU 86/1790 = 11,5 X 17,5 CM', 2, 138, 0, 1, 0, 0, 1),
(2853, 'LI03065', 'NUMERO DE ONU 268/1005 FONDO NARANJA BORDE Y NUMEROS NEGROS 13X13cm', 2, 138, 85, 30, 0, 1, 1),
(2854, 'LI03066', 'CORROSIVO 8 - 13X13 CM', 2, 138, 232, 30, 0, 0, 1),
(2855, 'LI03067', 'GAS COMPRIMIDO VENENOSO 2 - 13X13 CM', 2, 138, 279, 30, 0, 0, 1),
(2856, 'LI03068', 'ACIDO NITRICO CAS 7697-37-2 ONU: 2031 | 21X14 cm', 2, 138, 79, 30, 0, 0, 1),
(2857, 'LI03069', 'ENVASES VACIOS 5 X 9 CM BLANCAS', 2, 138, 0, 0, 0, 0, 1),
(2858, 'LI03070', 'CALCO PROD CONFORME 8 X 11,5CM COLOR VERDE PALLETS', 2, 138, 1810, 2000, 1, 0, 1),
(2859, 'LI03071', 'AMONIACO ANHIDRO, FONDO BLANCO, LETRAS NEGRAS, BORDES NEGRO, AUTOADHESIVO, 21x14cm', 2, 138, 99, 20, 1, 2, 1),
(2860, 'LI03072', 'NUMERO DE ONU 23/3222 FONDO NARANJA BORDE Y NUMEROS NEGROS 27 X 35 CM ', 2, 138, 36, 20, 0, 0, 1),
(2861, 'LI03073', 'NUMERO DE ONU 3220 FONDO NARANJA BORDE Y NUMEROS NEGROS 14 X 35 CM ', 2, 138, 32, 40, 1, 1, 1),
(2862, 'LI03074', 'NUMERO DE ONU 3252 FONDO NARANJA BORDE Y NUMEROS NEGROS 14 X 35cm', 2, 138, 55, 40, 1, 2, 1),
(2863, 'LI03075', 'NUMERO DE ONU  2035 FONDO NARANJA BORDE Y NUMEROS NEGROS 14 X 35ccm', 2, 138, 20, 50, 1, 1, 1),
(2864, 'LI03076', 'NUMERO DE ONU  3340 FONDO NARANJA BORDE Y NUMEROS NEGROS 14 X 35cm', 2, 138, 99, 50, 1, 2, 1),
(2865, 'LI03077', 'NUMERO DE ONU 22/3337  FONDO NARANJA BORDE Y NUMEROS NEGROS 27 X 35 CM', 2, 138, 71, 50, 1, 2, 1),
(2866, 'LI03078', 'NUMERO DE ONU 268/1005 FONDO NARANJA BORDE Y NUMEROS NEGROS 27 X 35 CM ', 2, 138, 58, 50, 1, 2, 1),
(2867, 'LI03079', 'NUMERO DE ONU 80/2031 FONDO NARANJA BORDE Y NUMEROS NEGROS 27 X 35 CM ', 2, 138, 12, 50, 1, 0, 1),
(2868, 'LI03080', 'NUMERO DE ONU 80/2031 FONDO NARANJA BORDE Y NUMEROS NEGROS 13 X 13 CM ', 2, 138, 50, 50, 1, 0, 1),
(2869, 'LI03081', 'INFLAMABLE 5.1 (AMARILLO) 25x25 CM', 2, 138, 12, 15, 1, 0, 1),
(2870, 'LI03082', 'INFLAMABLE 5.1 (AMARILLO) 13x13 CM', 2, 138, 50, 15, 1, 0, 1),
(2871, 'LZ01001', 'BALDE PLASTICO X 10 LTS', 2, 139, 0, 0, 0, 0, 1),
(2872, 'LZ01002', 'JABON LIQUIDO x 5Lt', 2, 139, 3, 4, 1, 8, 1),
(2873, 'LZ01003', 'CABO PARA ESCOBA', 2, 139, 0, 0, 0, 0, 1),
(2874, 'LZ01004', 'BOLSA DE RESIDUO 50 x 70cm x  10 Und', 2, 139, 0, 5, 0, 0, 1),
(2875, 'LZ01005', 'BOLSAS DE RESIDUOS 80 x 110cm x 10 Und', 2, 139, 0, 5, 1, 0, 1),
(2876, 'LZ01006', 'TOALLA INTERCALADA BEIGE CAJA POR 2500 UN', 2, 139, 4, 2, 0, 11, 1),
(2877, 'LZ01007', 'CERA LIQUIDA X750 gr', 2, 139, 0, 0, 0, 0, 1),
(2878, 'LZ01008', 'CESTO DE BASURA', 2, 139, 0, 0, 0, 0, 0),
(2879, 'LZ01009', 'CIF ANTIGRASA X LITRO', 1, 139, 0, 0, 0, 0, 1),
(2880, 'LZ01010', 'CREMA LIMPIAMANOS', 2, 139, 0, 0, 0, 0, 1),
(2881, 'LZ01011', 'DESODORANTE AEROSOL', 2, 139, 0, 0, 0, 0, 1),
(2882, 'LZ01012', 'DESODORANTE  P/PISOS PROCENEX X LTS', 1, 139, 18, 20, 1, 10, 1),
(2883, 'LZ01013', 'DETERGENTE X LITRO', 1, 139, 10, 20, 1, 0, 1),
(2884, 'LZ01014', 'ESCOBA GRIN EURO ', 2, 139, 0, 0, 0, 0, 1),
(2885, 'LZ01015', 'BLEM 360ML', 2, 139, 0, 1, 0, 0, 1),
(2886, 'LZ01016', 'ESCOBILLA PARA BAÑO', 2, 139, 0, 0, 0, 0, 1),
(2887, 'LZ01017', 'ESCOBILLON CON CABO', 2, 139, 0, 0, 0, 0, 1),
(2888, 'LZ01018', 'ESPONJA DE ACERO PATITO', 2, 139, 7, 1, 0, 0, 1),
(2889, 'LZ01019', 'ESPONJA AMARILLA', 2, 139, 0, 0, 0, 0, 1),
(2890, 'LZ01020', 'FRANELA', 2, 139, 0, 0, 0, 0, 1),
(2891, 'LZ01021', 'GUANTES DE GOMA', 2, 139, 0, 0, 0, 0, 1),
(2892, 'LZ01022', 'JABON DE TOCADOR ', 2, 139, 0, 0, 0, 0, 1),
(2893, 'LZ01023', 'LAVANDINA O CLORO X  lts', 1, 139, 0, 0, 0, 10, 1),
(2894, 'LZ01024', 'LIMPIA VIDRIO', 2, 139, 0, 0, 0, 0, 1),
(2895, 'LZ01025', 'MOPA ', 2, 139, 0, 0, 0, 0, 1),
(2896, 'LZ01026', 'PALA PLASTICA', 2, 139, 0, 0, 0, 0, 1),
(2897, 'LZ01027', 'PAPEL HIGIENICO x rollo 50mts', 2, 139, 72, 48, 1, 0, 1),
(2898, 'LZ01028', 'PASTILLA DE INODORO', 2, 139, 0, 0, 0, 10, 1),
(2899, 'LZ01029', 'PAPEL HIGIENICO x rollo grande 100mts', 2, 139, 16, 0, 0, 0, 1),
(2900, 'LZ01030', 'INSECTICIDA MATA MOSCA', 2, 139, 1, 1, 0, 0, 1),
(2901, 'LZ01031', 'SECADOR DE GOMA Nº 40/50', 2, 139, 5, 1, 0, 0, 1),
(2902, 'LZ01032', 'Bobina Papel Tissue D/H 360 m', 2, 139, 0, 8, 1, 11, 1),
(2903, 'LZ01033', 'TRAPO DE PISO', 2, 139, 4, 0, 0, 0, 1),
(2904, 'LZ01034', 'TRAPO REJILLA ', 2, 139, 0, 0, 0, 0, 1),
(2905, 'LZ01035', 'TRAPO BLANCO X KG ', 4, 139, 20, 20, 0, 0, 1),
(2906, 'LZ01036', 'VIRULANA  X ROLLO', 2, 139, 54, 12, 0, 0, 1),
(2907, 'LZ01037', 'LAMPAZO C/ CABO ', 2, 139, 0, 0, 0, 0, 1),
(2908, 'MA01001', 'MANGUERA POLIAMIDA 1/2 ( TECALAN) X MTS ', 3, 140, 2, 20, 1, 4, 1),
(2909, 'MA01002', 'MANGUERA POLIAMIDA 3/4\' (TECALAN) X MTS', 3, 140, 2, 0, 0, 0, 1),
(2910, 'MA01003', 'MANGUERA TUBO DE PVC 12X15 (CRISTAL 1/2\')', 3, 140, 0, 0, 0, 0, 1),
(2911, 'MA01004', 'MANGUERA 6X4 CRISTAL', 3, 140, 2, 10, 1, 1, 1),
(2912, 'MA01005', 'MANGUERA FESTO PUN 6 X MTS', 3, 140, 0, 5, 1, 0, 1),
(2913, 'MA01006', 'MANGUERA POLIPROPILENO K4 1\' X MTS', 3, 140, 0, 0, 0, 0, 1),
(2914, 'MA01007', 'MANGUERA FESTO PUN 12 X MTS', 3, 140, 0, 2, 1, 0, 1),
(2915, 'MA01008', 'MANGUERA TECALAN 1/4\' (6X4)', 3, 140, 0, 0, 0, 0, 1),
(2916, 'MA01009', 'MANGUERA PILETERA 2\' X MTS', 3, 140, 0, 0, 0, 0, 1),
(2917, 'MA01010', 'MANGUERA TUBO DE PVC 10X13 (CRISTAL 3/8\')', 3, 140, 0, 0, 0, 0, 1),
(2918, 'MA01011', 'MANGUERA TECALAN 1/8\'', 3, 140, 18, 0, 0, 0, 1),
(2919, 'MA01012', 'TUBO DE POLIAMIDA DE 1/8\' KLINGER X Mts', 3, 140, 0, 0, 0, 0, 1),
(2920, 'MA01013', 'MANGUERA CRISTAL 1/2 X MTS (12 X 15)', 3, 140, 181, 15, 1, 1, 1),
(2921, 'MA01014', 'MANGUERA CRISTAL 3/8 X MTS (10 X 13)', 3, 140, 0, 10, 1, 0, 1),
(2922, 'ME01001', 'MANOMETRO  0/15 KG /CM2/PSI 1/2\' NPT', 2, 141, 0, 1, 1, 0, 1),
(2923, 'ME01002', 'MANOVACUOMETRO  1/2 25 BAR NUOVA FIMA                    ', 2, 141, 0, 0, 0, 0, 1),
(2924, 'ME01003', 'MANOMETRO  0/10 KG /CM2/PSI(MGS18/2/A/100 1/2\' NPT', 2, 141, 0, 2, 1, 0, 1),
(2925, 'ME01004', 'MANOMETRO 0-7 kg./cm2 1/2\' NPT               ', 2, 141, 0, 0, 0, 0, 1),
(2926, 'ME01005', 'MANOMETRO 0-6 kg./cm2', 2, 141, 0, 0, 0, 0, 1),
(2927, 'ME01006', 'MANOMETRO 0/40 KG CM2 (MGS18/2/A/100 1/2\' NPT', 2, 141, 0, 2, 1, 0, 1),
(2928, 'ME01007', 'MANOMETRO 0-100 kg./ cm2', 2, 141, 0, 0, 0, 0, 1),
(2929, 'ME01008', 'MANOMETRO 0-160 kg,/ cm2', 2, 141, 0, 0, 0, 0, 1),
(2930, 'ME01009', 'CONJUNTO SELLO (MACHO + HEMBRA) ACERO P/MANOMETROS ', 2, 141, 0, 0, 0, 0, 1),
(2931, 'ME01010', 'MANOMETRO 0-30 kg/cm2', 2, 141, 0, 0, 0, 0, 1),
(2932, 'ME01011', 'MANOMETRO MGS18/2/A DN 100 0-16 BAR1/2\' NPT Y CERT DE CALIBRAC', 2, 141, 0, 0, 0, 0, 1),
(2933, 'ME01012', 'MANOMETRO MGS18/2/A 100 10-150 KG /CM2', 2, 141, 0, 0, 0, 0, 1),
(2934, 'ME01013', 'MANOMETRO 0-10 KG/ cm2', 2, 141, 0, 0, 0, 0, 0),
(2935, 'ME01014', 'MANOVACUOMETRO 4 -12 KG ROSCA 1/2\'', 2, 141, 0, 0, 0, 0, 1),
(2936, 'ME01015', 'MANOMETRO  0/10 KG /CM2/PSI(MGS18/2/A/100 1/2\' NPT', 2, 141, 0, 0, 0, 0, 0),
(2937, 'ME01016', 'MANOMETRO 0/20 KG CM2 (MGS18/2/A/100 1/2\' NPT', 2, 141, 5, 2, 1, 73, 1),
(2938, 'ME01017', 'MANOMETRO 0/40 KG CM2 ', 2, 141, 0, 0, 0, 0, 0),
(2939, 'ME01018', 'MANOMETRO 0,1-18.2.A.E - 0/-1  + 5 KG / CM2 1/2\'', 2, 141, 0, 0, 0, 0, 1),
(2940, 'ME01019', 'VISOR PLASTICO GRANDE P/MANOMETRO', 2, 141, 0, 0, 0, 0, 1),
(2941, 'ME01020', 'VISOR PLASTICO CHICO P/MANOMETRO', 2, 141, 0, 0, 0, 0, 1),
(2942, 'ME01021', 'MANOMETRO 0/60 KG CM2 1/2\' NPT', 2, 141, 0, 1, 0, 0, 1),
(2943, 'ME01022', 'MANOMETRO 16 BAR 1/4\' PARA OXICORTE ', 2, 141, 0, 0, 0, 0, 1),
(2944, 'ME01023', 'MANOMETRO D50 315 BAR 1/4\' PARA OXICORTE ', 2, 141, 1, 0, 0, 0, 1),
(2945, 'ME01024', 'MANOMETRO 0-6 KG/ cm2', 2, 141, 0, 0, 0, 0, 1),
(2946, 'ME02001', 'MANOMETRO 0-4,5 KG/cm2 1/2\'', 2, 142, 0, 0, 0, 0, 1),
(2947, 'ME02002', 'ROTAMETRO P4000 P1/2\' 400-4000lph', 2, 142, 0, 0, 0, 0, 1),
(2948, 'ME02003', 'FLOTAMETRO TIPO F2000', 2, 142, 0, 2, 1, 0, 1),
(2949, 'ME02004', 'Rotametro FIP modelo FSFV112T1M2500, 250 - 2500 LPH, Ø 1 1/2\'', 2, 142, 5, 2, 1, 384, 1),
(2950, 'ME02005', '.', 2, 142, 0, 0, 0, 0, 0),
(2951, 'OR01001', 'VITON  2-011', 2, 143, 5, 2, 1, 0, 1),
(2952, 'OR01002', 'VITON 2-020', 2, 143, 7, 2, 1, 0, 1),
(2953, 'OR01003', 'VITON 2-032', 2, 143, 2, 0, 0, 0, 1),
(2954, 'OR01004', 'VITON 2-038', 2, 143, 5, 2, 1, 0, 1),
(2955, 'OR01005', 'VITON 2-112', 2, 143, 7, 2, 1, 0, 1),
(2956, 'OR01006', 'VITON 2-113', 2, 143, 11, 2, 1, 1, 1),
(2957, 'OR01007', 'VITON 2-114', 2, 143, 2, 2, 1, 0, 1),
(2958, 'OR01008', 'VITON 2-117', 2, 143, 0, 0, 0, 0, 1),
(2959, 'OR01009', 'VITON 2-121', 2, 143, 3, 2, 1, 0, 1),
(2960, 'OR01010', 'VITON 2-153', 2, 143, 6, 2, 1, 0, 1),
(2961, 'OR01011', 'ORING NBR 2-038', 2, 143, 0, 1, 0, 0, 1),
(2962, 'OR01012', 'VITON 2-211', 2, 143, 20, 5, 1, 1, 1),
(2963, 'OR01013', 'VITON 2-116', 2, 143, 41, 30, 1, 1, 1),
(2964, 'OR01014', 'VITON 2-214', 2, 143, 1, 2, 1, 0, 1),
(2965, 'OR01015', 'VITON 2-215', 2, 143, 0, 2, 1, 0, 1),
(2966, 'OR01016', 'VITON 2-216', 2, 143, 17, 10, 1, 2, 1),
(2967, 'OR01017', 'VITON 2-217 36,8 X 3,53', 2, 143, 45, 30, 1, 1, 1),
(2968, 'OR01018', 'VITON 2-218', 2, 143, 14, 2, 1, 2, 1),
(2969, 'OR01019', 'VITON 2-219', 2, 143, 9, 2, 1, 2, 1),
(2970, 'OR01020', 'VITON 2-220', 2, 143, 12, 2, 0, 2, 1),
(2971, 'OR01021', 'VITON 2-223', 2, 143, 10, 5, 1, 0, 1),
(2972, 'OR01022', 'VITON 2-224', 2, 143, 28, 10, 1, 3, 1),
(2973, 'OR01023', 'VITON 2-226', 2, 143, 10, 2, 1, 4, 1),
(2974, 'OR01024', 'VITON 2-251', 2, 143, 4, 2, 1, 0, 1),
(2975, 'OR01025', 'VITON 2-254', 2, 143, 15, 5, 1, 0, 1),
(2976, 'OR01026', 'VITON 2-233', 2, 143, 19, 10, 1, 4, 1),
(2977, 'OR01027', 'VITON 2-228', 2, 143, 20, 0, 0, 4, 1),
(2978, 'OR01028', 'VITON 2-342', 2, 143, 6, 0, 0, 0, 1),
(2979, 'OR01030', 'VITON 2-355', 2, 143, 15, 5, 1, 0, 1),
(2980, 'OR01032', 'VITON 2-356', 2, 143, 7, 5, 1, 0, 1),
(2981, 'OR01033', 'VITON 2-364', 2, 143, 9, 5, 1, 28, 1),
(2982, 'OR01034', 'VITON 2-230', 2, 143, 8, 5, 1, 0, 1),
(2983, 'OR01035', 'VITON 2-238', 2, 143, 6, 2, 1, 0, 1),
(2984, 'OR01036', 'VITON 2-442', 2, 143, 1, 2, 1, 43, 1),
(2985, 'OR01037', 'VITON 2-443', 2, 143, 10, 10, 1, 65, 1),
(2986, 'OR01038', 'VITON 2-236', 2, 143, 19, 10, 1, 37, 1),
(2987, 'OR01040', 'VITON 2-255', 2, 143, 11, 2, 1, 0, 1),
(2988, 'OR01041', 'VITON 2-264', 2, 143, 19, 20, 1, 0, 1),
(2989, 'OR01042', 'VITON 2-310', 2, 143, 13, 2, 1, 2, 1),
(2990, 'OR01045', 'VITON 2-358', 2, 143, 6, 2, 1, 19, 1),
(2991, 'OR01047', 'VITON 2-381', 2, 143, 4, 2, 1, 0, 1),
(2992, 'OR01048', 'VITON 2-438', 2, 143, 5, 5, 1, 0, 1),
(2993, 'OR01049', 'VITON 2-440', 2, 143, 12, 10, 1, 56, 1),
(2994, 'OR01050', 'VITON 2-210', 2, 143, 630, 200, 1, 2, 1),
(2995, 'OR01051', 'VITON 2-447', 2, 143, 6, 5, 1, 0, 1),
(2996, 'OR01052', 'VITON 2-252', 2, 143, 16, 10, 1, 8, 1),
(2997, 'OR01053', 'VITON 2- 148  (Ø 2,62 )  ', 2, 143, 0, 0, 0, 0, 1),
(2998, 'OR01054', ' VITON 2- 231 (Ø 3,53 )', 2, 143, 10, 0, 0, 4, 1),
(2999, 'OR01055', 'O\'RING VITON 22-331 V', 2, 143, 6, 0, 0, 0, 1),
(3000, 'OR01056', 'O\'RING VITON 22-339 V', 2, 143, 10, 0, 0, 0, 1),
(3001, 'OR01057', 'O\'RING VITON 22-328 V', 2, 143, 3, 0, 0, 3, 1),
(3002, 'OR01058', 'O\'RING VITON 22-335 V', 2, 143, 1, 0, 0, 0, 1),
(3003, 'OR01059', 'O\'RING VITON 22-138 VALVULAS ISOTANK', 2, 143, 15, 4, 1, 3, 1),
(3004, 'OR01060', 'O\'RING VITON 22-222 VALVULAS ISOTANK', 2, 143, 9, 4, 1, 3, 1),
(3005, 'OR01061', 'ORING VITON METRICA 23X3mm', 2, 143, 29, 20, 1, 3, 1),
(3006, 'OR01062', 'ORING VITON 22-260V (NITRICO)', 2, 143, 10, 4, 1, 1, 1),
(3007, 'OR01063', 'ORING VITON 72-116', 2, 143, 0, 1, 0, 0, 1),
(3008, 'OR01064', 'ORING VITON 72-228', 2, 143, 0, 1, 0, 0, 1),
(3009, 'OR01065', 'ORING VITON 72-231', 2, 143, 0, 1, 0, 0, 1),
(3010, 'OR01066', 'ORING VITON 72-328', 2, 143, 0, 1, 0, 0, 1),
(3011, 'OR02001', 'O\'RING NEOPRENE 2-231 P/ VAL CRIOGENICO', 2, 144, 24, 9, 1, 0, 1),
(3012, 'OR02002', 'O\'RING NEOPRENE 2-224 P/ VAL CRIOGENICO', 2, 144, 21, 9, 0, 0, 1),
(3013, 'OR02003', 'O\'RING NEOPRENE 2-121 P/ VAL CRIOGENICO', 2, 144, 21, 9, 0, 0, 1),
(3014, 'OR02004', 'O\'RING NEOPRENE 2-148 P/ VAL CRIOGENICO', 2, 144, 16, 9, 1, 0, 1),
(3015, 'OR03001', 'O\'RINGC007 NBR', 2, 145, 0, 0, 0, 0, 1),
(3016, 'OR03002', 'O\'RING 08001035 NBR', 2, 145, 0, 0, 0, 0, 1),
(3017, 'OR03003', 'O\'RING 2-218 NBR', 2, 145, 2, 0, 0, 0, 1),
(3018, 'OR03004', 'O\'RING 2-020 NBR', 2, 145, 0, 0, 0, 0, 1),
(3019, 'OR03005', 'O\'RING 08001014 4X3', 2, 145, 4, 0, 0, 0, 1),
(3020, 'OR03006', 'O\'RING 2-447 NBR', 2, 145, 0, 0, 0, 0, 1),
(3021, 'OR03007', 'O\'RING 2-442 NBR', 2, 145, 8, 0, 0, 0, 1),
(3022, 'OR03008', 'O\'RING 68X3 NBR', 2, 145, 10, 0, 0, 0, 1),
(3023, 'OR03009', 'O\'RING JUNTA SERIE 5', 2, 145, 7, 0, 0, 0, 1),
(3024, 'OR03010', 'V\'RING P/ EJE 30mm', 2, 145, 8, 5, 1, 0, 1),
(3025, 'OR03011', 'V\'RING P/ EJE 40mm', 2, 145, 8, 5, 1, 0, 1),
(3026, 'OR03012', 'ORING 2-235 NBR', 2, 145, 0, 0, 0, 0, 1),
(3027, 'OR04001', 'ORING CLOROPRENO 70 COD. AC 2-211', 2, 146, 28, 15, 1, 1, 1),
(3028, 'OR04002', 'ORING CLOROPRENO 70 COD. AC 2-117', 2, 146, 18, 15, 1, 1, 1),
(3029, 'OR04003', 'ORING CLOROPRENO 70 COD. AC 2-148', 2, 146, 30, 15, 1, 3, 1),
(3030, 'RE01001', 'RETENES 30541,(08002009)', 2, 147, 1, 1, 0, 0, 1),
(3031, 'RE01002', 'RETENES 5133 : 20-30-7 ( Bomba Agua Industrial)', 2, 147, 4, 1, 0, 0, 1),
(3032, 'RE01003', 'RETENES 5256,', 2, 147, 5, 1, 0, 0, 1),
(3033, 'RE01004', 'RETENES 5276 VENTILADOR TORRE DE ENFRIAMIENTO,', 2, 147, 4, 1, 0, 0, 1),
(3034, 'RE01005', 'RETENES 5278 VENTILADOR TORRE DE ENFRIAMIENTO,', 2, 147, 2, 1, 0, 0, 1),
(3035, 'RE01006', 'RETENES 5395,', 2, 147, 5, 1, 0, 0, 1),
(3036, 'RE01007', 'RETENES 5427 35X47X7, SILICONADO', 2, 147, 0, 1, 0, 0, 1),
(3037, 'RE01008', 'RETENES 6780,', 2, 147, 4, 1, 0, 0, 1),
(3038, 'RE01009', 'RETENES 5130', 2, 147, 5, 2, 1, 0, 1),
(3039, 'RE01010', 'RETENES 5931', 2, 147, 13, 2, 0, 0, 1),
(3040, 'RE01011', 'RETENES 5706', 2, 147, 2, 2, 1, 0, 1),
(3041, 'RE01012', 'RETEN 5356', 2, 147, 0, 2, 1, 0, 1),
(3042, 'RE01013', 'RETENES 6256 : 25-35-7( Bomba Agua Industrial)', 2, 147, 6, 2, 0, 0, 1),
(3043, 'RE01014', 'RETENES 6654 : 25-40-7 ( Bomba Agua Industrial)', 2, 147, 4, 2, 0, 0, 1),
(3044, 'RE01015', 'RETENES 6710', 2, 147, 4, 2, 0, 0, 1),
(3045, 'RE01016', 'RETENES 5177 : 40-55-10', 2, 147, 2, 2, 0, 0, 1),
(3046, 'RE01017', 'RETEN SAV 5200 LX 7015', 2, 147, 4, 2, 0, 0, 1),
(3047, 'RE01018', 'BUJE H 306 FK', 2, 147, 0, 0, 0, 0, 1),
(3048, 'RE01019', 'RETEN SAV 5176 - BOMBA MEGACHEM 100-200', 2, 147, 0, 2, 0, 0, 1),
(3049, 'RE01020', 'RETEN 9119   30 X47X8   DBH', 2, 147, 0, 2, 1, 0, 1),
(3050, 'RE01021', 'RETEN 5175   DBH', 2, 147, 0, 4, 1, 0, 1),
(3051, 'RO01001', '6003 2RSR C.3', 2, 148, 0, 2, 1, 0, 1),
(3052, 'RO01002', '6200 ZZ', 2, 148, 1, 2, 1, 0, 1),
(3053, 'RO01003', '6200 2RSR', 2, 148, 6, 2, 1, 0, 1),
(3054, 'RO01004', '6202 2RS C.3', 2, 148, 0, 3, 1, 0, 1),
(3055, 'RO01005', '6203 2RS C.3', 2, 148, 0, 6, 1, 0, 1),
(3056, 'RO01006', '6204- 2RS C.3', 2, 148, 0, 8, 1, 0, 1),
(3057, 'RO01007', '6205 2RS C.3', 2, 148, 0, 10, 1, 0, 1),
(3058, 'RO01008', 'MANGUITO O BUJE H 306  ', 2, 148, 2, 1, 0, 0, 1),
(3059, 'RO01009', '2208 - 2RS', 2, 148, 0, 1, 1, 0, 1),
(3060, 'RO01010', '6206-2RS. C.3', 2, 148, 0, 10, 1, 0, 1),
(3061, 'RO01011', '6207- 2RSR C.3', 2, 148, 1, 6, 1, 0, 1),
(3062, 'RO01012', '6207-Z/QE6', 2, 148, 0, 2, 1, 0, 1),
(3063, 'RO01013', '6208-2ZR. C.3', 2, 148, 0, 4, 1, 0, 1),
(3064, 'RO01014', '6209- 2RSR. C.3', 2, 148, 0, 2, 1, 0, 1),
(3065, 'RO01015', '6205 2Z C3', 2, 148, 0, 1, 1, 0, 1),
(3066, 'RO01016', '6210- 2RSR C.3', 2, 148, 3, 4, 1, 0, 1),
(3067, 'RO01017', '6212- 2ZR  C.3', 2, 148, 3, 4, 1, 0, 1),
(3068, 'RO01018', '6300- 2RSR. C.3', 2, 148, 0, 8, 1, 0, 1),
(3069, 'RO01019', '6302- 2 RSR C.3', 2, 148, 2, 2, 1, 0, 1),
(3070, 'RO01020', '6303 - 2RS . C.3', 2, 148, 0, 4, 1, 0, 1),
(3071, 'RO01021', '6304 - 2RSR. C3', 2, 148, 0, 2, 1, 0, 1),
(3072, 'RO01022', '6304 - ZZNR C/ RANURA', 2, 148, 0, 3, 1, 0, 1),
(3073, 'RO01023', '6305-2RSR. C.3', 2, 148, 0, 3, 1, 0, 1),
(3074, 'RO01024', '6306 - 2RSR . C.3', 2, 148, 0, 9, 1, 0, 1),
(3075, 'RO01025', '6306 - Z NR', 2, 148, 5, 5, 1, 0, 1),
(3076, 'RO01026', '6309 2Z', 2, 148, 1, 4, 1, 0, 1),
(3077, 'RO01027', '30206.', 2, 148, 1, 1, 1, 0, 1),
(3078, 'RO01028', '6307 - 2 RSR C.3', 2, 148, 0, 3, 1, 0, 1),
(3079, 'RO01029', '6316 C.3   MOTOR YORK', 2, 148, 0, 2, 1, 0, 1),
(3080, 'RO01030', '6308 - 2RSR. C.3', 2, 148, 0, 4, 1, 0, 1),
(3081, 'RO01031', '6309 -2RSR. C.3', 2, 148, 0, 6, 1, 0, 1),
(3082, 'RO01032', '6309 -Z NR', 2, 148, 3, 4, 1, 0, 1),
(3083, 'RO01033', '6310.', 2, 148, 2, 4, 1, 0, 1),
(3084, 'RO01034', '6310- 2RSR C.3', 2, 148, 2, 3, 1, 0, 1),
(3085, 'RO01035', '6310 - C.3', 2, 148, 2, 2, 1, 0, 1),
(3086, 'RO01036', '6310 - 2Z', 2, 148, 2, 2, 1, 0, 1),
(3087, 'RO01037', '6312- C.3', 2, 148, 0, 1, 1, 0, 1),
(3088, 'RO01038', '7212 - BEP', 2, 148, 1, 1, 1, 0, 1),
(3089, 'RO01039', '1207 EK TN9', 2, 148, 3, 2, 1, 0, 1),
(3090, 'RO01040', 'CAJA PORTA RODAMIENTO SF 20X2', 2, 148, 0, 2, 0, 0, 1),
(3091, 'RO01041', 'NU 311 / E.TVP2. C3  COMPRESOR PROCESO Nº 1', 2, 148, 0, 1, 1, 0, 1),
(3092, 'RO01042', 'ROD 51120', 2, 148, 0, 1, 1, 0, 1),
(3093, 'RO01043', 'NJ 212  E.TVP2. C3', 2, 148, 0, 1, 0, 0, 1),
(3094, 'RO01044', '6314 C.3', 2, 148, 0, 4, 1, 0, 1),
(3095, 'RO01045', '6219 C.3', 2, 148, 2, 2, 1, 0, 1),
(3096, 'RO01046', '1206   2RS  TORRE HCL', 2, 148, 2, 2, 1, 0, 1),
(3097, 'RO01047', 'M 86647/86610', 2, 148, 4, 2, 1, 0, 1),
(3098, 'RO01048', '3207 BTVH', 2, 148, 1, 2, 1, 0, 1),
(3099, 'RO01049', '6313 2Z C,3', 2, 148, 4, 1, 1, 0, 1),
(3100, 'RO01050', '6319 2Z   MOTOR YORK', 2, 148, 1, 1, 1, 0, 1),
(3101, 'RO01051', '6201 2ZR', 2, 148, 0, 2, 1, 0, 1),
(3102, 'RO01052', 'NU 315', 2, 148, 0, 1, 1, 0, 1),
(3103, 'RO01053', '7307 BECBP', 2, 148, 1, 1, 0, 0, 1),
(3104, 'RO01054', '31312 J2/QDF', 2, 148, 2, 1, 1, 0, 1),
(3105, 'RO01055', 'NU 308 EMC3', 2, 148, 1, 2, 1, 0, 1),
(3106, 'RO01056', '7309 BECBP', 2, 148, 3, 1, 0, 0, 1),
(3107, 'RO01057', '7306 BECBP', 2, 148, 2, 1, 0, 0, 1),
(3108, 'RO01058', '6306 ZZ C4', 2, 148, 0, 1, 1, 0, 1),
(3109, 'RO01059', 'NU 307 ECP', 2, 148, 1, 0, 0, 0, 1),
(3110, 'RO01060', 'NU 310 ECP', 2, 148, 1, 0, 0, 0, 1),
(3111, 'RO01061', '6203 Z', 2, 148, 0, 0, 0, 0, 1),
(3112, 'RO01062', 'NU 313 emc 3', 2, 148, 0, 1, 1, 0, 1),
(3113, 'RO01063', 'ROD 6306 ZZ R', 2, 148, 0, 1, 1, 0, 1),
(3114, 'RO01064', 'ROD 6309 ZZ', 2, 148, 0, 2, 1, 0, 1),
(3115, 'RO01065', 'ROD 7307 BL1G', 2, 148, 0, 2, 1, 0, 1),
(3116, 'RO01066', 'ROD 6213 2RS C3', 2, 148, 0, 2, 1, 0, 1),
(3117, 'RO01067', 'ROD 6209 ZZ', 2, 148, 0, 2, 1, 0, 1),
(3118, 'TR01001', 'ACOPLAMIENTO GUMMI  A 20', 2, 149, 1, 0, 0, 0, 1),
(3119, 'TR01002', 'CENTRO ELASTICO GUMMI  A 35  (BOMBA IRUMA GLICOL) o MOD X4 RUADIGOM', 2, 149, 2, 2, 0, 130, 1),
(3120, 'TR01003', 'ACOPLAMIENTO ROTULAR D-60 COMPLETO ', 2, 149, 0, 1, 0, 0, 1),
(3121, 'TR01004', 'ACOPLE TECNOPERIFLEX-BANDA NORMAL 14 - 1-316', 2, 149, 1, 2, 0, 231, 1),
(3122, 'TR01005', 'BRIDA ACOPLAMIENTO ROTULAR 312 -10-1                             ', 2, 149, 2, 0, 0, 0, 1),
(3123, 'TR01006', 'BRIDAS ACOPLAMIENTO A PERNOS DIAM 120                       ', 2, 149, 0, 0, 0, 0, 1),
(3124, 'TR01007', 'BRIDAS ACOPLAMIENTO TECNOPERIFLEX 031                       ', 2, 149, 0, 0, 0, 0, 1),
(3125, 'TR01008', 'GOMAS ACOP ROTULAR 316                                      ', 2, 149, 1, 0, 0, 0, 1),
(3126, 'TR01009', 'GOMAS ACOP TECNOP 031-03-1', 2, 149, 5, 0, 0, 0, 1),
(3127, 'TR01010', 'BANDA PARTIDA  ROTULAR 308-06-1', 2, 149, 2, 2, 1, 178, 1),
(3128, 'TR01011', 'BRIDAS P/ACOPLAMIENTO 03-1', 2, 149, 0, 0, 0, 0, 1),
(3129, 'TR01012', 'BRIDAS GOMA 3/4  6/AGUJERO', 2, 149, 2, 0, 0, 0, 1),
(3130, 'TR01013', 'ACOPLAMIENTO 8 AGUJERO X3 RUADIGOM', 2, 149, 0, 0, 0, 0, 1),
(3131, 'TR01014', 'ACOPLAMIENTO C/BRIDA 6 AGUJERO X2 RUADIGOM', 2, 149, 0, 0, 0, 0, 1),
(3132, 'TR01015', 'centro elastico normal GUMMI A-95  EQUIPOS DE FRIO YORK o MOD X12 RUADIGOM', 2, 149, 2, 2, 0, 892, 1),
(3133, 'TR01016', 'BRIDA 14-1 P ACOPLE', 2, 149, 5, 2, 1, 0, 1),
(3134, 'TR01017', 'REPUESTO DE ACOPLE ROTULAR D-85', 2, 149, 4, 3, 1, 0, 1),
(3135, 'VA01001', 'VALVULA VALMEC  S-150 BRIDADA 4\'', 2, 150, 1, 1, 0, 0, 1),
(3136, 'VA01002', 'VALVULA VALMEC  S-150 BRIDADA  2 1/2\' ', 2, 150, 4, 1, 0, 0, 1),
(3137, 'VA01003', 'VALVULA VALBOL  S-300 BRIDADA  2\' MOD 8346 T  - ASIENTO TEFLON PURO', 2, 150, 7, 2, 0, 504, 1),
(3138, 'VA01004', 'VALVULA VALBOL S-300 BRIDADA  1 1/2\' MOD 8346 T - ASIENTO TEFLON PURO', 2, 150, 0, 4, 0, 402, 1),
(3139, 'VA01005', 'VALVULA VALBOL S-300  BRIDADA  1\' MOD 8346 T - ASIENTO TEFLON PURO', 2, 150, 4, 8, 1, 300, 1),
(3140, 'VA01006', 'VALVULA VALBOL S-300  BRIDADA  3/4\' MOD 8346 T - ASIENTO TEFLON PURO', 2, 150, 0, 4, 1, 276, 1),
(3141, 'VA01007', 'VALVULA VALBOL S-300  BRIDADA  1/2\' MOD 8346 T - ASIENTO TEFLON PURO', 2, 150, 4, 4, 1, 231, 1),
(3142, 'VA01008', 'VALVULA ESFEROMATIC S-150  BRIDADA  4\'', 2, 150, 1, 0, 0, 0, 1),
(3143, 'VA01009', 'VALVULA ESFEROMATIC S-300 BRIDADA  1 1/2\' ', 2, 150, 0, 0, 0, 0, 1),
(3144, 'VA01010', 'VALVULA ESFEROMATIC S-300 BRIDADA  1\' MOD 8346T', 2, 150, 3, 0, 0, 0, 1),
(3145, 'VA01011', 'VALVULA ESFEROMATIC S-125/150  BRIDADA  3/4\'', 2, 150, 1, 0, 0, 0, 1),
(3146, 'VA01012', 'VALVULA VALBOL S-300 BRIDADA  1/2\' MOD 8376 - PTFR', 2, 150, 3, 0, 0, 0, 1),
(3147, 'VA01013', 'VALVULA MARCA KITZ S-300 WCB BRIDADA  1\'', 2, 150, 1, 0, 0, 0, 1),
(3148, 'VA01014', 'VALVULA BRIDADA  FLOUSERW 2\' S - 150 COLOR AZUL', 2, 150, 1, 0, 0, 0, 1),
(3149, 'VA01015', 'VALVULA VALBOL S-300 BRIDADA  1\' MOD 8346 T - ASIENTO PTFR', 2, 150, 4, 2, 0, 0, 1),
(3150, 'VA01016', 'VALVULA AGUJA  3/4\'', 2, 150, 4, 0, 0, 0, 1),
(3151, 'VA01017', 'VALVULA LVM RETENCION VERT   3/4\'', 2, 150, 0, 2, 0, 0, 1),
(3152, 'VA01018', 'VALVULA p/cloro 3/4\' NGT/W1\'/ TP M10x0.75 (VCCC99000003)', 2, 150, 6, 4, 1, 203, 1),
(3153, 'VA01019', 'VALVULA TAPON MARC XOMOX / TUFLINE  BRIDADAS S-150 - 2\'', 2, 150, 0, 0, 0, 0, 0),
(3154, 'VA01020', 'VALVULA ESFOROMATIC CRIOGENICAS PARA SOLDAR  1\'', 2, 150, 4, 0, 0, 0, 1),
(3155, 'VA01021', 'VALVULA VALMEC S-300 BRIDADA 2\'', 2, 150, 0, 0, 0, 0, 1),
(3156, 'VA01022', 'VALVULA WORCESTER S-300 AC, CARB- BASTAGO MONEL- ASIENT TEFLON  1/2\'', 2, 150, 0, 0, 0, 0, 0),
(3157, 'VA01023', 'VALVULA WORCESTER S-300 AC, CARB- BASTAGO MONEL- ASIENT TEFLON  2\'', 2, 150, 0, 1, 0, 0, 1),
(3158, 'VA01024', 'VALVULA TAPON MARC XOMOX/TUFLINE  BRIDADAS S-150 - 1\'', 2, 150, 2, 0, 0, 2360, 0),
(3159, 'VA01025', 'VALVULA VALBOL S-300  BRIDADA  3\' MOD 8346 T', 2, 150, 0, 0, 0, 0, 1),
(3160, 'VA01026', 'VALVULA TAPON MARC XOMOX/TUFLINE  BRIDADAS S-150 - 1 1/2\'', 2, 150, 2, 2, 1, 3132, 1),
(3161, 'VA01027', 'VALVULAS DE SEGURIDAD ', 2, 150, 0, 0, 0, 0, 1),
(3162, 'VA01028', 'VALVULA FLOWSERVE S-300 BRIDADA 2\' AMARILLA', 2, 150, 1, 0, 0, 0, 1),
(3163, 'VA01029', 'VALVULA SEGURIDAD 3\' 150 FLGA 80 MM MAXI 191 P/ISO HF', 2, 150, 4, 0, 0, 0, 1),
(3164, 'VA01030', 'VALVULA VALMEC  S-150 BRIDADA  1/2\' ', 2, 150, 0, 0, 0, 0, 1),
(3165, 'VA01031', 'VALVULA VALMEC  S-150 BRIDADA  1\' ', 2, 150, 0, 0, 0, 0, 1),
(3166, 'VA01032', 'VALVULA VALMEC  S-150 BRIDADA  1 1/2\' ', 2, 150, 0, 0, 0, 0, 1),
(3167, 'VA01033', 'VALVULA SAUNDERS 1\' TIPO BAYONETA', 2, 150, 1, 0, 0, 0, 1),
(3168, 'VA01034', 'VALVULA SPIRAX SARCO 1\' SERIE 150', 2, 150, 1, 0, 0, 0, 1),
(3169, 'VA01035', 'VALVULA DE SEGURIDAD EQA TIPO 956', 2, 150, 1, 0, 0, 0, 1),
(3170, 'VA01036', 'VALVULA VALBOL S-300  BRIDADA  3/4\' MOD 8346 T - PTFR', 2, 150, 2, 0, 0, 0, 1);
INSERT INTO `item` (`Id`, `Codigo`, `Descripcion`, `UnidadDeMedidaId`, `SubFamiliaId`, `Stock`, `PuntodePedido`, `Critico`, `Precio`, `Activo`) VALUES
(3171, 'VA01037', 'VALVULA BRIDADA NELS JAMSSBURY  1/2\'', 2, 150, 0, 0, 0, 0, 1),
(3172, 'VA01038', 'VALVULA BRIDADA PASO TOTAL S150 AISI 316 - 1 1/2\'', 2, 150, 2, 1, 0, 0, 1),
(3173, 'VA02001', 'VALVULA ESF 3 CUERPOS ROSC  AC.INOX WCB 300 1/2\'', 2, 151, 8, 10, 0, 40, 1),
(3174, 'VA02002', 'VALVULA ESF 3 CUERPOS ROSC  AC.INOX WCB 300 3/4\'', 2, 151, 11, 6, 0, 63, 1),
(3175, 'VA02003', 'VALVULA ESF 3 CUERPOS ROSC  AC.INOX WCB 300  1\'', 2, 151, 4, 10, 0, 76, 1),
(3176, 'VA02004', 'VALVULA ESF 3 CUERPOS ROSC  AC.INOX WCB 300 1 1/2\' ', 2, 151, 0, 4, 0, 162, 1),
(3177, 'VA02005', 'VALVULA ESF 3 CUERPOS ROSC  AC.INOX WCB 300  2\'', 2, 151, 0, 3, 0, 0, 1),
(3178, 'VA02006', 'VALVULA ESF 3 CUERPOS ROSC  AC.INOX WCB 300 2 1/2\'', 2, 151, 0, 2, 0, 0, 1),
(3179, 'VA02007', 'VALVULA  VALBOL ROSCADA  TRICUERPO MOD/ 446T SE  1/2\'', 2, 151, 0, 10, 0, 0, 1),
(3180, 'VA02008', 'VALVULA  VALBOL ROSCADA  TRICUERPO MOD/ 446T SE  3/4\'', 2, 151, 0, 10, 0, 0, 1),
(3181, 'VA02009', 'VALVULA  VALBOL ROSCADA  TRICUERPO MOD/ 446T SE  1\'', 2, 151, 0, 10, 0, 0, 1),
(3182, 'VA02010', 'VALVULA  VALBOL ROSCADA  TRICUERPO MOD/ 446T SE  1 1/2\'', 2, 151, 0, 3, 0, 0, 1),
(3183, 'VA02011', 'VALVULA  VALBOL ROSCADA  TRICUERPO MOD/ 446T SE  2\'', 2, 151, 0, 1, 0, 0, 1),
(3184, 'VA02012', 'VALVULA  VALBOL ROSCADA  TRICUERPO MOD/ 446T SE  1 1/4\'', 2, 151, 0, 0, 0, 0, 1),
(3185, 'VA02013', 'VALVULA LVM 3/4\' ROSCA MACHO/HEMBRA', 2, 151, 1, 0, 0, 0, 1),
(3186, 'VA02014', 'VALVULA 3/4\' ROSCADA P/ ACIDO FLUORHIDRICO CUERPO HIERRO ESFERA INOX. 15 BAR', 2, 151, 2, 2, 1, 246, 1),
(3187, 'VA02015', 'VALVULA 1\' ROSCADA P/ CLOROFORMO CUERPO HIERRO ESFERA INOX. 15 BAR', 2, 151, 0, 2, 1, 339, 1),
(3188, 'VA03001', 'VALVULA MARIPOSA 5\'', 2, 152, 1, 0, 0, 0, 1),
(3189, 'VA03002', 'VALVULA MARIPOSA 4\'', 2, 152, 0, 0, 0, 0, 1),
(3190, 'VA03003', 'VALVULA MARIPOSA 3\'', 2, 152, 1, 0, 0, 0, 1),
(3191, 'VA04001', 'VALVULAS TIGRE 13MM  1/2\' VALFLUX', 2, 153, 4, 4, 0, 7, 1),
(3192, 'VA04002', 'VALVULAS TIGRE 19MM  3/4\' VALFLUX', 2, 153, 16, 4, 0, 8, 1),
(3193, 'VA04003', 'VALVULAS TIGRE 25MM  1\' VALFLUX', 2, 153, 27, 5, 0, 10, 1),
(3194, 'VA04004', 'VALVULAS TIGRE 38MM  1 1/2\' VALFLUX', 2, 153, 6, 5, 0, 14, 1),
(3195, 'VA04005', 'VALVULAS TIGRE 50MM  2\'    VALFLUX       ', 2, 153, 6, 4, 0, 0, 1),
(3196, 'VA04006', 'VALVULAS DUKE ESF 1/2\'', 2, 153, 0, 0, 0, 0, 1),
(3197, 'VA04007', 'VALVULAS DUKE ESF 3/4\'', 2, 153, 0, 0, 0, 0, 1),
(3198, 'VA04008', 'VALVULAS DUKE ESF 1\'', 2, 153, 0, 0, 0, 0, 1),
(3199, 'VA04009', 'VALVULAS DUKE ESF 1 1/2\'', 2, 153, 0, 0, 0, 0, 1),
(3200, 'VA04010', 'VALVULAS DUKE ESF  2 1/2\'', 2, 153, 1, 0, 0, 0, 1),
(3201, 'VA04011', 'VALVULA  ESFERICA BRIDADA BOMPLAST 2\' C/ORING DE EPDM', 2, 153, 3, 3, 0, 93, 1),
(3202, 'VA04012', 'VALVULA  ESFERICA BRIDADA BOMPLAST 4\' C/ORING DE VITON', 2, 153, 1, 1, 0, 159, 1),
(3203, 'VA04013', 'VALVULA  ESFERICA BRIDADA BOMPLAST 3\' C/ORING DE VITON', 2, 153, 1, 1, 0, 145, 1),
(3204, 'VA04014', 'VALVULA  ESFERICA BRIDADA BOMPLAST 2\' C/ORING DE VITON', 2, 153, 4, 1, 0, 97, 1),
(3205, 'VA04015', 'VALVULA PLASTICA ROSCADA BOMPLAST 11/2\' ', 2, 153, 2, 2, 0, 53, 1),
(3206, 'VA04016', 'VALVULA PLASTICA ROSCADA BOMPLAST 2\' ', 2, 153, 0, 2, 0, 73, 1),
(3207, 'VA04017', 'VALVULA  ESFERICA BRIDADA BOMPLAST 3\' C/ORING DE EPDM', 2, 153, 2, 1, 1, 139, 1),
(3208, 'VA04018', 'VALVULA  ESFERICA BRID. BOMPLAST ENTRADA 3\' SALIDA  4\'  C/ORING DE EPDM', 2, 153, 2, 1, 1, 153, 1),
(3209, 'VA04019', 'VALVULA DE RETENCION 2\' BOMPLAST', 2, 153, 1, 0, 0, 73, 1),
(3210, 'VA05001', 'VALVULA ESF AC INOX 3 CUERPOS  - 316 1/2\'', 2, 154, 0, 0, 0, 0, 1),
(3211, 'VA05002', 'VALVULA ESF AC INOX 3 CUERPOS  - 316 3/4\'', 2, 154, 0, 0, 0, 0, 1),
(3212, 'VA05003', 'VALVULA ESF AC INOX 3 CUERPOS  - 316 1\'', 2, 154, 0, 0, 0, 0, 1),
(3213, 'VA05004', 'VALVULA ESF AC INOX 3 CUERPOS  - 316 1 1/2\'', 2, 154, 0, 0, 0, 0, 1),
(3214, 'VA05005', 'VALVULA ESF AC INOX 3 CUERPOS  - 316 2\'', 2, 154, 0, 0, 0, 0, 1),
(3215, 'VA05006', 'VALVULA ESF AC INOX   MONOBLOCK - 316 2\'', 2, 154, 0, 0, 0, 0, 1),
(3216, 'VA05007', 'VALVULA ESF AC INOX   MONOBLOCK - 316  1 1/2\'', 2, 154, 0, 0, 0, 0, 1),
(3217, 'VA05008', 'VALVULA ESF AC INOX   MONOBLOCK - 316 1\'', 2, 154, 0, 0, 0, 0, 1),
(3218, 'VA05009', 'VALVULA ESF AC INOX   MONOBLOCK - 316 3/4\'', 2, 154, 0, 0, 0, 0, 1),
(3219, 'VA05010', 'VALVULA ESF AC INOX   MONOBLOCK - 316 1/2\'', 2, 154, 0, 0, 0, 0, 1),
(3220, 'VA05011', 'VALVULA ESF AC INOX   MONOBLOCK - 316  1 1/4\'', 2, 154, 2, 0, 0, 0, 1),
(3221, 'VA05012', 'VALVULA ESF AC INOX MONOBLOK - 316 1/4\'', 2, 154, 0, 0, 0, 0, 1),
(3222, 'VA06001', 'VALVULA DE RETENCION VERTICAL BRONCE  1 \'', 2, 155, 3, 0, 0, 90, 1),
(3223, 'VA06002', 'VALVULA DE RETENCION VERTICAL BRONCE  1 1/2\'', 2, 155, 0, 0, 0, 0, 1),
(3224, 'VA06003', 'VALVULA DE RETENCION VERTICAL BRONCE  2\'', 2, 155, 0, 0, 0, 0, 1),
(3225, 'VA06004', 'VALVULA DE RETENCION VERTICAL 3/4\', SERIE 800, PASO RED.P/SOLDAR LVM', 2, 155, 0, 2, 0, 0, 1),
(3226, 'VA06005', 'VALVULA DE RETENCION VERTICAL 1\' PP ROSCADA', 2, 155, 1, 1, 0, 0, 1),
(3227, 'VA06006', 'VALVULA RET. CLAPETA INOX. HOR. 1\'', 2, 155, 0, 2, 1, 0, 1),
(3228, 'VA06007', 'VALVULA RETENCION INOX 1 1/2\' - ROSCADA', 2, 155, 0, 0, 1, 0, 1),
(3229, 'VA06008', 'VALVULA RETENCION INOX 1 1/2\' - BRIDADA', 2, 155, 0, 0, 0, 0, 1),
(3230, 'VA06009', 'Valvula Retención Vertical a Bola 1\' #800 LVM 115.CCO.C0.W8, ASTM A105, TRIM 1, Bte.Roscado, conexiones p/soldar SW', 2, 155, 3, 2, 1, 473, 1),
(3231, 'VA07001', 'PALANCAS DE VALVULAS  WORCESTER CHICA', 2, 156, 1, 0, 0, 0, 1),
(3232, 'VA07002', 'PALANCAS DE VALVULAS  WORCESTER MEDIANA', 2, 156, 3, 0, 0, 0, 1),
(3233, 'VA07003', 'PALANCAS DE VALVULAS  WORCESTER GRANDE', 2, 156, 0, 0, 0, 0, 1),
(3234, 'VA08001', 'TRAMPA DE VAPOR  SPIRAX SARCO 1/2\'', 2, 157, 0, 0, 0, 0, 1),
(3235, 'VA08002', 'TRAMPA DE VAPOR  SPIRAX SARCO 1\'', 2, 157, 1, 1, 0, 0, 1),
(3236, 'VA08003', 'TRAMPA TERMODINAMICA  1/2\'', 2, 157, 1, 2, 0, 57, 1),
(3237, 'VA08004', 'TRAMPA TERMODINAMICA  3/4\'', 2, 157, 2, 2, 0, 0, 1),
(3238, 'VA08005', 'TRAMPA TERMODINAMICA  1\'', 2, 157, 1, 1, 0, 102, 1),
(3239, 'LA01001', 'Frasco de vidrio color caramelo 250ml, con tapa', 2, 158, 0, 30, 1, 0, 1),
(3240, 'LA01002', 'Tapa plastica para frascos de 250ml', 2, 158, 0, 30, 1, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `Id` int(11) NOT NULL,
  `ItemId` int(11) NOT NULL,
  `StockIni` double NOT NULL,
  `Cantidad` double NOT NULL,
  `TipoDeMov` varchar(50) NOT NULL,
  `FechaRegistro` datetime NOT NULL,
  `FechaVale` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `Id` int(11) NOT NULL,
  `NombreYApellido` varchar(150) NOT NULL,
  `DNI` varchar(11) NOT NULL,
  `Sector` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`Id`, `NombreYApellido`, `DNI`, `Sector`) VALUES
(1, 'Aguilar Lucas ', '27.074.480', 'MANTENIMIENTO'),
(2, 'Aguirre Juan Aníbal ', '31.845.546', 'LABORATORIO'),
(3, 'Alfonzo Mario ', '32.924.786', 'NITRICO'),
(4, 'Arana Facundo ', '44.219.002', 'ENVASADO'),
(5, 'Babsia Matias', '34.442.428', 'LABORATORIO'),
(6, 'Becerra Jonathan ezequiel', '37.132.577', 'PLANTA 23'),
(7, 'Caceres Jorge Pablo', '94.296.605', 'NITRICO'),
(8, 'Calabrin Jesus Ernesto ', '41.596.361', 'CLOROSODA'),
(9, 'Calandra Enrique', '24.120.983', 'PAÑOL'),
(10, 'Casero Joel Luis', '24.526.385', 'NITRICO'),
(11, 'Cruz Hugo Miguel ', '14.089.866', 'PLANTA 22'),
(12, 'Cruz luis', '20.287.103', 'PLANTA 22'),
(13, 'Díaz Fabián ', '21.990.576', 'COMPRA'),
(14, 'Diaz Oscar jesús ', '39.991.732', 'NITRICO'),
(15, 'Encina Mario', '20.447.530', 'PLANTA 22'),
(16, 'Encina Alberto', '16.724.031', 'MANTENIMIENTO'),
(17, 'Erni Alejandro Ariel', '40.842.445', 'MANTENIMIENTO'),
(18, 'Figueroa Diego ', '31.662.632', 'NITRICO'),
(19, 'Fissore Luciano', '31.184.287', 'ENVASADO'),
(20, 'Gamerro Alfredo', '23.538.285', 'EXPEDICION'),
(21, 'Godoy enzo Gabriel ', '43.072.757', 'ENVASADO'),
(22, 'Godoy Nicolas', '41.297.678', 'CLOROSODA'),
(23, 'Gonzalez Matias', '34.574.680', 'MANTENIMIENTO'),
(24, 'Gutierrez Ivo', '46.035.202', 'CLOROSODA'),
(25, 'Herrera Kevin', '40.842.467', 'CLOROSODA'),
(26, 'Liffourrena Diego', '32.624.608', 'NITRICO'),
(27, 'Lino Diego', '43.621.341', 'CLOROSODA'),
(28, 'Llambias Leonardo ', '36.046.830', 'ENVASADO'),
(29, 'Llamur damian', '29.745.357', 'NITRICO'),
(30, 'Llanos Pablo', '35.028.040', 'MANTENIMIENTO'),
(31, 'Maturano Alexis', '40.823.551', 'CLOROSODA'),
(32, 'Maturano Mario', '39.090.892', 'CLOROSODA'),
(33, 'Merlos ruben', '33.167.494', 'MANTENIMIENTO'),
(34, 'Miranda Pablo Damian ', '29.036.401', 'ENVASADO'),
(35, 'Montaño Hugo Javier ', '23.633.239', 'MANTENIMIENTO'),
(36, 'Montenegro Jorge Luis ', '16.990.482', 'VIGILANCIA'),
(37, 'Moyano Nicolas Ricardo', '37.717.540', 'ENVASADO'),
(38, 'Muñoz Nahuel ', '39.797.716', 'ENVASADO'),
(39, 'Muriño Matias', '39.394.432', 'PAÑOL'),
(40, 'Ojeda Hernan', '25.394.668', 'CLOROSODA'),
(41, 'Ojeda Roberto', '20.382.510', 'MANTENIMIENTO'),
(42, 'Olmos Gonzalo José ', '25.081.334', 'OPERACIONES'),
(43, 'Ontivero Sergio', '17.921.519', 'PLANTA 22'),
(44, 'Ortiz fabricio ', '31.660.516', 'PLANTA 22'),
(45, 'Pando Mariano', '26.168.966', 'PLANTA 22'),
(46, 'Pela jonathan ', '37.090.857', 'CLOROSODA'),
(47, 'Peralta Gustavo', '22.161.700', 'ADMINISTRACION'),
(48, 'Perazzolo Gaston', '41.752.860', 'CLOROSODA'),
(49, 'Perazzolo Sebastian', '32.159.343', 'CLOROSODA'),
(50, 'Pizarro Daniel', '20.688.443', 'MANTENIIENTO'),
(51, 'Quevedo Juan', '43.359.413', 'ENVASADO'),
(52, 'Quevedo Nicolas', '41.920.287', 'PLANTA 22'),
(53, 'Quiroga Franco Ezequiel', '38.749.005', 'NITRICO'),
(54, 'Rivarola Alexis', '44.359.696', 'ENVASADO'),
(55, 'Rivero Mauricio', '35.793.472', 'NITRICO'),
(56, 'Rodriguez Lucas', '28.960.545', 'MANTENIMIENTO'),
(57, 'Saavedra Francisco José ', '14.250.624', 'MANTENIMIENTO'),
(58, 'Sánchez luis', '37.717.680', 'NITRICO'),
(59, 'Soloa Walter David ', '31.845.588', 'NITRICO'),
(60, 'Suarez Jorge Luis', '20.688.067', 'NITRICO'),
(61, 'Tassinari Leonardo ', '31.220.591', 'NITRICO'),
(62, 'Tassinari Pablo', '29.474.654', 'LABORATORIO'),
(63, 'Toledo Daniel ', '35.179.088', 'PLANTA 22'),
(64, 'Torres Alejandro ', '30.178.079', 'PLANTA23'),
(65, 'Torres Cesar', '27.984.796', 'NITRICO'),
(66, 'Torres José ', '28.960.554', 'ENVASADO'),
(67, 'Torres luciano nicolas', '31.342.814', 'LABORATORIO'),
(68, 'Torres Matias', '35.475.894', 'LABORATORIO'),
(69, 'Torres Ricardo ', '35.915.637', 'NITRICO'),
(70, 'Troncoso Sergio', '18.221.160', 'PLANTA 22'),
(71, 'Vega Cruz Nicolas ', '41.297.662', 'CLOROSODA'),
(72, 'Villafañe Angel A.', '42.909.585', 'MANTENIMIENTO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Id` int(11) NOT NULL,
  `RazonSocial` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`Id`, `RazonSocial`) VALUES
(1, 'TECHLINE'),
(2, 'Proveedor Ejemplo'),
(3, 'INSACOR'),
(4, 'FILTRON'),
(5, 'CIRCUTOR'),
(6, 'PATO IT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `Id` int(11) NOT NULL,
  `UsuarioId` int(11) NOT NULL,
  `IdFila` int(11) NOT NULL,
  `NombreDeTabla` varchar(50) NOT NULL,
  `TipoDeAccion` varchar(50) NOT NULL,
  `FechaDeAccion` date NOT NULL,
  `HoraDeAccion` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `Id` int(11) NOT NULL,
  `ItemId` int(11) NOT NULL,
  `ItemCodigo` varchar(11) NOT NULL,
  `PersonalId` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `salida`
--

INSERT INTO `salida` (`Id`, `ItemId`, `ItemCodigo`, `PersonalId`, `Cantidad`, `Fecha`) VALUES
(11, 1, 'AD01001', 3, 1, '2024-11-27'),
(12, 1, 'AD01001', 2, 1, '2024-12-05'),
(13, 1, 'AD01001', 11, 1, '2024-12-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subfamilia`
--

CREATE TABLE `subfamilia` (
  `Id` int(11) NOT NULL,
  `Codigo` varchar(10) DEFAULT NULL,
  `Descripcion` text NOT NULL,
  `FamiliaId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `subfamilia`
--

INSERT INTO `subfamilia` (`Id`, `Codigo`, `Descripcion`, `FamiliaId`) VALUES
(1, 'AD01', 'Insumos', 1),
(2, 'AI01', 'Accesorios', 2),
(3, 'BD01', 'Serie 150', 3),
(4, 'BD02', 'Serie 300', 3),
(5, 'BR01', 'Accesorios', 4),
(6, 'CA01', 'Acero Carbono SCH 80', 5),
(7, 'CA02', 'Acero Carbono SCH 40', 5),
(8, 'CA03', 'Serie 2000', 5),
(9, 'CA04', 'Galvanizado', 5),
(10, 'CA05', 'Acero Inox', 5),
(11, 'CA06', 'PVC', 5),
(12, 'CA07', 'Polietileno', 5),
(13, 'CA08', 'Polipropileno', 5),
(14, 'CA09', 'Flexibles', 5),
(15, 'CA10', 'Acc red agua', 5),
(16, 'CA11', 'PTFE', 5),
(17, 'CA12', 'Accesorios Bronce', 5),
(18, 'CL01', 'Combustible', 6),
(19, 'CL02', 'Lubricante', 6),
(20, 'CO01', 'Seccion A', 7),
(21, 'CO02', 'Seccion B', 7),
(22, 'EL01', 'Controladores', 8),
(23, 'EL02', 'Fusibles', 8),
(24, 'EL03', 'Contactores', 8),
(25, 'EL04', 'Reles', 8),
(26, 'EL05', 'Termicas', 8),
(27, 'EL06', 'Iluminacion', 8),
(28, 'EL07', 'Prensacables', 8),
(29, 'EL08', 'Identacion', 8),
(30, 'EL09', 'Cables', 8),
(31, 'EL10', 'Telefonia', 8),
(32, 'EL11', 'Ventiladores', 8),
(33, 'EL12', 'Cañeria Electrica', 8),
(34, 'EL13', 'Fichas y Gabinetes', 8),
(35, 'EL14', 'Zocalos', 8),
(36, 'EL15', 'Control', 8),
(37, 'EN01', 'Articulos', 9),
(38, 'EP01', 'Proteccion Personal', 10),
(39, 'EP02', 'Indumentaria', 10),
(40, 'EP03', 'Calzado', 10),
(41, 'EQ01', 'Reactor', 11),
(42, 'EQ02', 'Caldera', 11),
(43, 'EQ03', 'Bomba Pulsa Grande 7660', 11),
(44, 'EQ04', 'Bomba Pulsa Mediana 7120', 11),
(45, 'EQ05', 'Bomba Bomplast', 11),
(46, 'EQ06', 'Compresor DINA', 11),
(47, 'EQ07', 'Valvula Foxboro', 11),
(48, 'EQ08', 'Bomba Wilden P400', 11),
(49, 'EQ09', 'Bomba Drotec M28', 11),
(50, 'EQ10', 'Bomba Drotec P30', 11),
(51, 'EQ11', 'Compresor KAESER', 11),
(52, 'EQ12', 'Compresor VMC', 11),
(53, 'EQ13', 'Equipo Frio VMC', 11),
(54, 'EQ14', 'Bomba EBARA', 11),
(55, 'EQ15', 'Iruma I-5T (Cloroformo)', 11),
(56, 'EQ16', 'IRUMA E-5T (Iny.21)', 11),
(57, 'EQ17', 'Bomba Iruma F6T', 11),
(58, 'EQ18', 'Bomba Worthington CN 52/62', 11),
(59, 'EQ19', 'Bomba Worthington CN - 42', 11),
(60, 'EQ20', 'Bomba Worthington D814', 11),
(61, 'EQ21', 'Compresor Proceso NEA Chico', 11),
(62, 'EQ22', 'Compresor Nea Grande', 11),
(63, 'EQ23', 'Equipo de frio York', 11),
(64, 'EQ24', 'Bomba Pelton', 11),
(65, 'EQ25', 'Bomba KSB: CPN 25-160', 11),
(66, 'EQ26', 'Bomba KSB : CPK 32-250 (FUERA DE SERVICIO)', 11),
(67, 'EQ27', 'Bomba KSB:Megachem 100-200', 11),
(68, 'EQ28', 'Ablandadores de Agua', 11),
(69, 'EQ29', 'Instrumentos', 11),
(70, 'EQ30', 'Bomba Wilden P200', 11),
(71, 'EQ31', 'Bomba Pulsa 880 Chica', 11),
(72, 'EQ32', 'Secador Aire AIR Produscts', 11),
(73, 'EQ33', 'Bomba Bran Luebbe', 11),
(74, 'EQ34', 'KSB Meganorm 150-400', 11),
(75, 'EQ35', 'Ebara MD /A 40-200/5.5', 11),
(76, 'EQ36', 'Ensival Moret NCE50-40AIN TAG:GA001A/B (CONDENSA)', 11),
(77, 'EQ37', 'Ensival Moret NCK32-26 TAG:GA002 (NITRICO DILUIDO)', 11),
(78, 'EQ38', 'Ensival Moret 50VN50-26-1 TAG:GA003 (MARCHA)', 11),
(79, 'EQ39', 'Ensival Moret NCK32-26 TAG:GA101 (NITRICO CONCENTRADO)', 11),
(80, 'EQ40', 'Ensival Moret NCK32-26R TAG:GA104A/B (SAL CONCENT)', 11),
(81, 'EQ41', 'Ensival Moret NCK32-26R TAG:GA131A/B (SAL DILUIDO)', 11),
(82, 'EQ42', 'Ensival Moret NCK50-40R TAG:GA132A/B (SAL FILTRAD)', 11),
(83, 'EQ43', 'Ensival Moret NCK32-13 TAG:PA001 (AMONICO)', 11),
(84, 'EQ44', 'Compresor Atlas Copco GA 15 Plus', 11),
(85, 'EQ45', 'Secador de Aire Atlas Copco CD 44', 11),
(86, 'EQ46', 'Bomba Grundfos Modelo CR5-20', 11),
(87, 'EQ47', 'Bomba Grundfos Modelo CRN 3-29', 11),
(88, 'EQ48', 'Bomba Grundfos Modelo CHN 2-30', 11),
(89, 'EQ49', 'Reactor Nitrico', 11),
(90, 'EQ50', 'Compresor Corken', 11),
(91, 'EQ51', 'Bomba Marzo DSV 290', 11),
(92, 'EQ52', 'Bomba Grundfos Modelo CRI 15-12', 11),
(93, 'EQ53', 'Caldera Nitrico', 11),
(94, 'EQ54', 'Ventilador Torre Enfriamiento', 11),
(95, 'EQ55', 'Compresor Mantero (ExPraxair)', 11),
(96, 'EQ56', 'Bomba Bombadur GLM / LM', 11),
(97, 'EQ57', 'Valvula Seguridad FAVRA', 11),
(98, 'EQ58', 'Bomba HERMETIC Pump Type CAM 2/3 with Motor Type N24L-2', 11),
(99, 'EQ59', 'qualizador Modelo SD1', 11),
(100, 'EQ60', 'Atlas Copco ZR 630', 11),
(101, 'EQ61', 'Osmosis UTK 403F', 11),
(102, 'EQ62', 'Bomba BUSCH RA 0250 D', 11),
(103, 'EQ63', 'COMPRESOR CORKEN Modelo 491AM3FBANSNN', 11),
(104, 'EQ64', 'VALVULA E-CONTROL', 11),
(105, 'EQ65', 'Bomba Dosivac DD 150', 11),
(106, 'EQ66', 'Osmosis Nitrico', 11),
(107, 'EQ67', 'Valvula FOXBORO V1C D:2', 11),
(108, 'EQ68', 'Bomba BUSCH Nitrico', 11),
(109, 'EQ69', 'Bomba EBARA CDA 100', 11),
(110, 'EQ70', 'Bomba LOWARA CA 70 4N A', 11),
(111, 'FE01', 'Clavos y Remaches', 12),
(112, 'FE02', 'Bulones', 12),
(113, 'FE03', 'Tuercas', 12),
(114, 'FE04', 'Arandelas', 12),
(115, 'FE05', 'Grampas/Abrazaderas', 12),
(116, 'FE06', 'Esparragos', 12),
(117, 'FE07', 'Prisioneros', 12),
(118, 'FE08', 'Tornillos', 12),
(119, 'FE09', 'Brocas', 12),
(120, 'FE10', 'Varillas Roscadas', 12),
(121, 'FE11', 'Precintos', 12),
(122, 'FE12', 'Electrodos', 12),
(123, 'FE13', 'Pegamentos y Selladores', 12),
(124, 'FE14', 'Discos y Lijas', 12),
(125, 'FE15', 'Pintura', 12),
(126, 'FE16', 'Rep para Soldadora', 12),
(127, 'FE17', 'Lijas y Cepillos', 12),
(128, 'FE18', 'Varios', 12),
(129, 'FI01', 'Micro y Accesorios', 13),
(130, 'FI02', 'Filtros Y', 13),
(131, 'JU01', 'Klinger', 14),
(132, 'JU02', 'Teflon', 14),
(133, 'JU03', 'Empaquetadura', 14),
(134, 'JU04', 'Planchas', 14),
(135, 'JU05', 'Expansiòn', 14),
(136, 'LI01', 'Insumos', 15),
(137, 'LI02', 'Talonarios', 15),
(138, 'LI03', 'Calcomanias', 15),
(139, 'LZ01', 'Insumos', 16),
(140, 'MA01', 'Articulos', 17),
(141, 'ME01', 'Manometros', 18),
(142, 'ME02', 'Flotametros', 18),
(143, 'OR01', 'Viton', 19),
(144, 'OR02', 'Neoprene', 19),
(145, 'OR03', 'NBR', 19),
(146, 'OR04', 'Cloropreno', 19),
(147, 'RE01', 'Standart', 20),
(148, 'RO01', 'A bolilla', 21),
(149, 'TR01', 'Acoplamientos', 22),
(150, 'VA01', 'Bridadas', 23),
(151, 'VA02', 'Roscadas Hierro', 23),
(152, 'VA03', 'Mariposa', 23),
(153, 'VA04', 'Plasticas', 23),
(154, 'VA05', 'Inoxidables', 23),
(155, 'VA06', 'Retencion', 23),
(156, 'VA07', 'Accesorios', 23),
(157, 'VA08', 'Trampas', 23),
(158, 'LA01', 'Laboratorio', 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidaddemedida`
--

CREATE TABLE `unidaddemedida` (
  `Id` int(11) NOT NULL,
  `Abreviatura` varchar(10) NOT NULL,
  `Descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `unidaddemedida`
--

INSERT INTO `unidaddemedida` (`Id`, `Abreviatura`, `Descripcion`) VALUES
(1, 'LT', 'Litros'),
(2, 'UN', 'Unidades'),
(3, 'MT', 'Metros'),
(4, 'KG', 'Kilogramos'),
(5, 'PR', 'Pares'),
(6, 'CJ', 'Caja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Apellido` varchar(255) NOT NULL,
  `UsuarioLogin` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Rol` int(11) NOT NULL,
  `ActivarLogin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id`, `Nombre`, `Apellido`, `UsuarioLogin`, `Password`, `Rol`, `ActivarLogin`) VALUES
(1, 'Patricia', 'Baigorria', 'mbaigorria', '$2a$11$db3IXcxfZWnX6CyKfUKCMOumNiQnID9XTaOwMlolSQ2OsXUMUW3M2', 1, 0),
(2, 'Enrique', 'Calandra', 'ecalandra', '$2a$11$e5ynkmr4xaonhnFCuJxQ6u76oeHFKI2HfwZbgvbGt1c6cV18MiBS2', 2, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `familia`
--
ALTER TABLE `familia`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ProveedorId` (`ProveedorId`),
  ADD KEY `ItemId` (`ItemId`);

--
-- Indices de la tabla `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `UnidadDeMedidaId` (`UnidadDeMedidaId`),
  ADD KEY `item_ibfk_1` (`SubFamiliaId`);

--
-- Indices de la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `ItemId` (`ItemId`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `UsuarioId` (`UsuarioId`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `PersonalId` (`PersonalId`),
  ADD KEY `ItemId` (`ItemId`);

--
-- Indices de la tabla `subfamilia`
--
ALTER TABLE `subfamilia`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FamiliaId` (`FamiliaId`);

--
-- Indices de la tabla `unidaddemedida`
--
ALTER TABLE `unidaddemedida`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `familia`
--
ALTER TABLE `familia`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `item`
--
ALTER TABLE `item`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3241;

--
-- AUTO_INCREMENT de la tabla `kardex`
--
ALTER TABLE `kardex`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salida`
--
ALTER TABLE `salida`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `subfamilia`
--
ALTER TABLE `subfamilia`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT de la tabla `unidaddemedida`
--
ALTER TABLE `unidaddemedida`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `ingreso_ibfk_1` FOREIGN KEY (`ProveedorId`) REFERENCES `proveedor` (`Id`),
  ADD CONSTRAINT `ingreso_ibfk_2` FOREIGN KEY (`ItemId`) REFERENCES `item` (`Id`);

--
-- Filtros para la tabla `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`SubFamiliaId`) REFERENCES `subfamilia` (`Id`),
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`UnidadDeMedidaId`) REFERENCES `unidaddemedida` (`Id`);

--
-- Filtros para la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD CONSTRAINT `kardex_ibfk_1` FOREIGN KEY (`ItemId`) REFERENCES `item` (`Id`);

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`UsuarioId`) REFERENCES `usuario` (`Id`);

--
-- Filtros para la tabla `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `salida_ibfk_1` FOREIGN KEY (`PersonalId`) REFERENCES `personal` (`Id`),
  ADD CONSTRAINT `salida_ibfk_2` FOREIGN KEY (`ItemId`) REFERENCES `item` (`Id`);

--
-- Filtros para la tabla `subfamilia`
--
ALTER TABLE `subfamilia`
  ADD CONSTRAINT `subfamilia_ibfk_1` FOREIGN KEY (`FamiliaId`) REFERENCES `familia` (`Id`);
--
-- Base de datos: `gestion_eventos`
--
DROP DATABASE IF EXISTS `gestion_eventos`;
CREATE DATABASE IF NOT EXISTS `gestion_eventos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gestion_eventos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistente`
--

CREATE TABLE `asistente` (
  `idAsistente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `domicilio` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(15) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asistente`
--

INSERT INTO `asistente` (`idAsistente`, `nombre`, `domicilio`, `email`, `password`, `rol`, `estado`) VALUES
(1, 'Federico Ivan Cruceño', 'B° Cerro de la Cruz M° 265 C° 10', 'pomelo92@gmail.com', '$2b$05$g/uW5OyOdhCzRnvUbl5x.eY/MdKJR7GmNJhf/HiWaYB.7CDgUVv4C', 'Asistente', 1),
(3, 'Jorge Ezequiel Diaz', 'Barrio Cerro de la Cruz Manzana 265 Casa 10', 'pepito45@gmail.com', '$2b$05$g/uW5OyOdhCzRnvUbl5x.eY/MdKJR7GmNJhf/HiWaYB.7CDgUVv4C', 'Asistente', 1),
(4, 'Dora Nelida Orsomarso', 'Carranza 1129', 'doranel50@gmail.com', '$2b$05$g/uW5OyOdhCzRnvUbl5x.eY/MdKJR7GmNJhf/HiWaYB.7CDgUVv4C', 'Asistente', 1),
(5, 'Beatriz Hernando', 'La Cumparsita 494', 'beahernando.11@gmail.com', '$2b$05$g/uW5OyOdhCzRnvUbl5x.eY/MdKJR7GmNJhf/HiWaYB.7CDgUVv4C', 'Asistente', 1),
(6, 'Hugo Cruceño', 'Salta 616', 'hugocru23@gmail.com', '$2b$05$g/uW5OyOdhCzRnvUbl5x.eY/MdKJR7GmNJhf/HiWaYB.7CDgUVv4C', 'Asistente', 1),
(9, 'Miryam Jofre', 'Salta 616', 'miryjofre16@gmail.com', '$2b$05$g/uW5OyOdhCzRnvUbl5x.eY/MdKJR7GmNJhf/HiWaYB.7CDgUVv4C', 'Asistente', 1),
(15, 'Juan Perez', 'San Martin 123', 'jp123@gmail.com', '$2b$05$g/uW5OyOdhCzRnvUbl5x.eY/MdKJR7GmNJhf/HiWaYB.7CDgUVv4C', 'Asistente', 0),
(20, 'Juan Domingo Peron', 'Sarmiento 321', 'jdp321@gmail.com', '$2b$05$g/uW5OyOdhCzRnvUbl5x.eY/MdKJR7GmNJhf/HiWaYB.7CDgUVv4C', 'Asistente', 1),
(23, 'Luis Medina', 'Sarmiento 123', 'lm123@gmail.com', '$2b$05$g/uW5OyOdhCzRnvUbl5x.eY/MdKJR7GmNJhf/HiWaYB.7CDgUVv4C', 'Asistente', 1),
(25, 'Beatriz Hernando', 'La Cumparsita 494', 'beahernando.11@gmail.com', '$2b$05$g/uW5OyOdhCzRnvUbl5x.eY/MdKJR7GmNJhf/HiWaYB.7CDgUVv4C', 'Asistente', 1),
(26, 'Jorge Ezequiel Diaz', 'B° Cerro de la Cruz M° 265 C° 10', 'diazezequiel777@gmail.com', '$2b$05$stjCyNPmMdw9RCJx3SINy.SqDMCD3JsUxasHx4cfoOCcGh8Gfu8Pu', 'Organizador', 1),
(27, 'Beatriz Hernando', 'La Cumparsita 494', 'beahernando.11@gmail.com', '$2b$05$Yw29MHauDkRfkUGHDHcBDO3Fs2bb8GvdmyrvngC7.mmU.G53/6aSm', 'Asistente', 1),
(28, 'Beatriz Hernando', 'La Cumparsita 494', 'beahernando.11@gmail.com', '$2b$05$hfBpxlMaYi/3Ul/zyQuKRe0.lDCx.kBQe6o2EFFqF94Ulr0KKeLk6', 'Asistente', 1),
(29, 'Beatriz Hernando', 'La Cumparsita 494', 'beahernando.11@gmail.com', '$2b$05$uEoYsqalAjznJGVHvd8UU.GlBRx3yhU5XWzJ2TS1aWzLJu6km5sEK', 'Asistente', 1),
(30, 'Patricia Baigorria', 'La Ribera M° 7190 C°14', 'patobaigorria@gmail.com', '$2b$05$mx8Hry/z3jxbcB60ABUJJuA5ie06HcspBuGdgXDQHVUWkjXLy3HsK', 'Organizador', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `ubicacion` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`idEvento`, `nombre`, `fecha`, `ubicacion`, `descripcion`) VALUES
(1, 'Confirmación', '2024-12-01', 'La Toma', 'La confirmación de mi hermano'),
(2, 'Comunión', '2024-10-03', 'San Luis', 'La comunión de mi ahijado'),
(5, 'Cumpleaños de Rocio', '2024-11-21', 'Villa Mercedes', 'El cumpleaños número 16 de Rocio'),
(9, 'evento para borraras', '2024-11-22', 'Nowhere', 'Nothing'),
(10, 'evento creado por Pato', '2024-11-22', 'Nowhere', 'Nothing');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participacion`
--

CREATE TABLE `participacion` (
  `idParticipacion` int(11) NOT NULL,
  `idAsistente` int(11) NOT NULL,
  `idEvento` int(11) NOT NULL,
  `confirmacion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `participacion`
--

INSERT INTO `participacion` (`idParticipacion`, `idAsistente`, `idEvento`, `confirmacion`) VALUES
(1, 1, 1, 1),
(5, 4, 1, 0),
(7, 4, 2, 1),
(8, 3, 2, 0),
(10, 3, 5, 1),
(11, 5, 5, 1),
(15, 1, 2, 1),
(20, 25, 1, 0),
(22, 25, 2, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistente`
--
ALTER TABLE `asistente`
  ADD PRIMARY KEY (`idAsistente`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`idEvento`);

--
-- Indices de la tabla `participacion`
--
ALTER TABLE `participacion`
  ADD PRIMARY KEY (`idParticipacion`),
  ADD UNIQUE KEY `idAsistente` (`idAsistente`,`idEvento`),
  ADD UNIQUE KEY `participacion_id_asistente_id_evento` (`idAsistente`,`idEvento`),
  ADD KEY `idEvento` (`idEvento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistente`
--
ALTER TABLE `asistente`
  MODIFY `idAsistente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `idEvento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `participacion`
--
ALTER TABLE `participacion`
  MODIFY `idParticipacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `participacion`
--
ALTER TABLE `participacion`
  ADD CONSTRAINT `participacion_ibfk_1` FOREIGN KEY (`idEvento`) REFERENCES `evento` (`idEvento`),
  ADD CONSTRAINT `participacion_ibfk_2` FOREIGN KEY (`idAsistente`) REFERENCES `asistente` (`idAsistente`);
--
-- Base de datos: `gestion_vacunas`
--
DROP DATABASE IF EXISTS `gestion_vacunas`;
CREATE DATABASE IF NOT EXISTS `gestion_vacunas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gestion_vacunas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agente`
--

CREATE TABLE `agente` (
  `Id` int(11) NOT NULL,
  `PersonaId` int(11) NOT NULL,
  `Matricula` varchar(255) NOT NULL,
  `Estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion`
--

CREATE TABLE `aplicacion` (
  `Id` int(11) NOT NULL,
  `PacienteId` int(11) NOT NULL,
  `AgenteId` int(11) NOT NULL,
  `LoteInternoId` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `EfectosSecundarios` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Pais` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Telefono` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteinterno`
--

CREATE TABLE `loteinterno` (
  `Id` int(11) NOT NULL,
  `LoteProveedorId` int(11) NOT NULL,
  `CantidadDeVacunas` int(11) NOT NULL,
  `Estado` enum('Disponible','Usado') NOT NULL DEFAULT 'Disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteproveedor`
--

CREATE TABLE `loteproveedor` (
  `Id` int(11) NOT NULL,
  `NumeroDeLote` varchar(255) NOT NULL,
  `LaboratorioId` int(11) NOT NULL,
  `TipoDeVacuna` varchar(255) NOT NULL,
  `NombreComercial` varchar(255) NOT NULL,
  `CantidadDeLotesInternos` int(11) NOT NULL,
  `FechaDeVencimiento` date NOT NULL,
  `Estado` enum('Activo','Vencido','Agotado') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientevacuna`
--

CREATE TABLE `pacientevacuna` (
  `Id` int(11) NOT NULL,
  `PacienteId` int(11) NOT NULL,
  `TipoDeVacunaId` int(11) NOT NULL,
  `FechaPlaneada` date NOT NULL,
  `Dosis` int(11) NOT NULL,
  `Estado` enum('Pendiente','Aplicada','Contraindicada') NOT NULL DEFAULT 'Pendiente',
  `Observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Apellido` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `FechaDeNacimiento` date NOT NULL,
  `Ocupacion` varchar(255) DEFAULT NULL,
  `Genero` enum('Masculino','Femenino','Otro') NOT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodevacuna`
--

CREATE TABLE `tipodevacuna` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Descripcion` text NOT NULL,
  `Contraindicaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agente`
--
ALTER TABLE `agente`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `PersonaId` (`PersonaId`);

--
-- Indices de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `PacienteId` (`PacienteId`),
  ADD KEY `AgenteId` (`AgenteId`),
  ADD KEY `LoteInternoId` (`LoteInternoId`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `LoteProveedorId` (`LoteProveedorId`);

--
-- Indices de la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `LaboratorioId` (`LaboratorioId`);

--
-- Indices de la tabla `pacientevacuna`
--
ALTER TABLE `pacientevacuna`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `PacienteId` (`PacienteId`),
  ADD KEY `TipoDeVacunaId` (`TipoDeVacunaId`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `tipodevacuna`
--
ALTER TABLE `tipodevacuna`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agente`
--
ALTER TABLE `agente`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pacientevacuna`
--
ALTER TABLE `pacientevacuna`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipodevacuna`
--
ALTER TABLE `tipodevacuna`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agente`
--
ALTER TABLE `agente`
  ADD CONSTRAINT `agente_ibfk_1` FOREIGN KEY (`PersonaId`) REFERENCES `persona` (`Id`);

--
-- Filtros para la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD CONSTRAINT `aplicacion_ibfk_1` FOREIGN KEY (`PacienteId`) REFERENCES `persona` (`Id`),
  ADD CONSTRAINT `aplicacion_ibfk_2` FOREIGN KEY (`AgenteId`) REFERENCES `agente` (`Id`),
  ADD CONSTRAINT `aplicacion_ibfk_3` FOREIGN KEY (`LoteInternoId`) REFERENCES `loteinterno` (`Id`);

--
-- Filtros para la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  ADD CONSTRAINT `loteinterno_ibfk_1` FOREIGN KEY (`LoteProveedorId`) REFERENCES `loteproveedor` (`Id`);

--
-- Filtros para la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD CONSTRAINT `loteproveedor_ibfk_1` FOREIGN KEY (`LaboratorioId`) REFERENCES `laboratorio` (`Id`);

--
-- Filtros para la tabla `pacientevacuna`
--
ALTER TABLE `pacientevacuna`
  ADD CONSTRAINT `pacientevacuna_ibfk_1` FOREIGN KEY (`PacienteId`) REFERENCES `persona` (`Id`),
  ADD CONSTRAINT `pacientevacuna_ibfk_2` FOREIGN KEY (`TipoDeVacunaId`) REFERENCES `tipodevacuna` (`Id`);
--
-- Base de datos: `inmobiliariabaigorriadiaz`
--
DROP DATABASE IF EXISTS `inmobiliariabaigorriadiaz`;
CREATE DATABASE IF NOT EXISTS `inmobiliariabaigorriadiaz` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `inmobiliariabaigorriadiaz`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `IdContrato` int(11) NOT NULL,
  `IdInquilino` int(11) NOT NULL,
  `IdInmueble` int(11) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `AlquilerDesde` date NOT NULL,
  `AlquilerHasta` date NOT NULL,
  `AlquilerHastaOriginal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

CREATE TABLE `inmueble` (
  `IdInmueble` int(11) NOT NULL,
  `IdPropietario` int(11) NOT NULL,
  `IdTipoDeInmueble` int(11) NOT NULL,
  `IdUsoDeInmueble` int(11) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Ambientes` int(11) NOT NULL,
  `Superficie` decimal(6,2) NOT NULL,
  `Latitud` decimal(6,2) DEFAULT NULL,
  `Longitud` decimal(6,2) DEFAULT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inquilino`
--

CREATE TABLE `inquilino` (
  `IdInquilino` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DNI` varchar(10) NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `NumeroDePago` int(11) NOT NULL,
  `IdContrato` int(11) NOT NULL,
  `MesDePago` varchar(15) NOT NULL,
  `Monto` decimal(10,2) NOT NULL,
  `Fecha` date NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `IdPropietario` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `DNI` varchar(10) NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `IdRegistro` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `IdFila` int(11) NOT NULL,
  `NombreDeTabla` varchar(50) NOT NULL,
  `TipoDeAccion` varchar(50) NOT NULL,
  `FechaDeAccion` date NOT NULL,
  `HoraDeAccion` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodeinmueble`
--

CREATE TABLE `tipodeinmueble` (
  `IdTipoDeInmueble` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipodeinmueble`
--

INSERT INTO `tipodeinmueble` (`IdTipoDeInmueble`, `Nombre`, `Estado`) VALUES
(1, 'Local', 1),
(2, 'Depósito', 1),
(3, 'Casa', 1),
(4, 'Departamento', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usodeinmueble`
--

CREATE TABLE `usodeinmueble` (
  `IdUsoDeInmueble` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usodeinmueble`
--

INSERT INTO `usodeinmueble` (`IdUsoDeInmueble`, `Nombre`, `Estado`) VALUES
(1, 'Comercial', 1),
(2, 'Residencial', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `IdUsuario` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(30) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Clave` varchar(255) NOT NULL,
  `Rol` int(11) NOT NULL,
  `AvatarURL` varchar(255) DEFAULT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`IdUsuario`, `Nombre`, `Apellido`, `Email`, `Clave`, `Rol`, `AvatarURL`, `Estado`) VALUES
(3, 'Juan', 'Perez', 'juanperez@gmail.com', '0yfrpBchLivjClVd/2wG7Qr77e1cxpygpcbnKhVZ1Vc=', 2, NULL, 1),
(5, 'Mariano Gabriel', 'Luzza Bonilla', 'mluzza@gmail.com', '0yfrpBchLivjClVd/2wG7Qr77e1cxpygpcbnKhVZ1Vc=', 1, NULL, 1),
(6, 'Jorge Ezequiel', 'Diaz', 'diazezequiel777@gmail.com', 'hY1CgihxAu07W07faaTyis8dHLeKN/wrgOfVxGkRt6I=', 1, '/uploads\\avatar_6.jpg', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`IdContrato`),
  ADD KEY `IdInmueble` (`IdInmueble`),
  ADD KEY `IdInquilino` (`IdInquilino`);

--
-- Indices de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD PRIMARY KEY (`IdInmueble`),
  ADD KEY `IdPropietario` (`IdPropietario`),
  ADD KEY `IdTipoDeInmueble` (`IdTipoDeInmueble`),
  ADD KEY `IdUsoDeInmueble` (`IdUsoDeInmueble`);

--
-- Indices de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  ADD PRIMARY KEY (`IdInquilino`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`NumeroDePago`),
  ADD KEY `IdContrato` (`IdContrato`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`IdPropietario`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`IdRegistro`),
  ADD KEY `IdUsuario` (`IdUsuario`);

--
-- Indices de la tabla `tipodeinmueble`
--
ALTER TABLE `tipodeinmueble`
  ADD PRIMARY KEY (`IdTipoDeInmueble`);

--
-- Indices de la tabla `usodeinmueble`
--
ALTER TABLE `usodeinmueble`
  ADD PRIMARY KEY (`IdUsoDeInmueble`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`IdUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `IdContrato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  MODIFY `IdInmueble` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  MODIFY `IdInquilino` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `NumeroDePago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `propietario`
--
ALTER TABLE `propietario`
  MODIFY `IdPropietario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `IdRegistro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipodeinmueble`
--
ALTER TABLE `tipodeinmueble`
  MODIFY `IdTipoDeInmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usodeinmueble`
--
ALTER TABLE `usodeinmueble`
  MODIFY `IdUsoDeInmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`IdInmueble`) REFERENCES `inmueble` (`IdInmueble`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contrato_ibfk_2` FOREIGN KEY (`IdInquilino`) REFERENCES `inquilino` (`IdInquilino`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD CONSTRAINT `inmueble_ibfk_1` FOREIGN KEY (`IdPropietario`) REFERENCES `propietario` (`IdPropietario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inmueble_ibfk_2` FOREIGN KEY (`IdTipoDeInmueble`) REFERENCES `tipodeinmueble` (`IdTipoDeInmueble`),
  ADD CONSTRAINT `inmueble_ibfk_3` FOREIGN KEY (`IdUsoDeInmueble`) REFERENCES `usodeinmueble` (`IdUsoDeInmueble`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`IdContrato`) REFERENCES `contrato` (`IdContrato`);

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuario` (`IdUsuario`);
--
-- Base de datos: `inmobiliariadiaz`
--
DROP DATABASE IF EXISTS `inmobiliariadiaz`;
CREATE DATABASE IF NOT EXISTS `inmobiliariadiaz` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `inmobiliariadiaz`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `IdContrato` int(11) NOT NULL,
  `IdInquilino` int(11) NOT NULL,
  `IdInmueble` int(11) NOT NULL,
  `AlquilerDesde` date NOT NULL,
  `AlquilerHasta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contrato`
--

INSERT INTO `contrato` (`IdContrato`, `IdInquilino`, `IdInmueble`, `AlquilerDesde`, `AlquilerHasta`) VALUES
(4, 1, 1, '2023-08-04', '2023-08-24'),
(5, 1, 3, '2023-08-04', '2023-08-24'),
(11, 2, 5, '2023-02-25', '2023-12-25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

CREATE TABLE `inmueble` (
  `IdInmueble` int(11) NOT NULL,
  `IdPropietario` int(11) NOT NULL,
  `IdTipoDeInmueble` int(11) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Ambientes` int(11) NOT NULL,
  `Superficie` decimal(6,2) NOT NULL,
  `Latitud` varchar(10) DEFAULT NULL,
  `Longitud` varchar(10) DEFAULT NULL,
  `Precio` decimal(9,2) NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inmueble`
--

INSERT INTO `inmueble` (`IdInmueble`, `IdPropietario`, `IdTipoDeInmueble`, `Direccion`, `Ambientes`, `Superficie`, `Latitud`, `Longitud`, `Precio`, `Estado`) VALUES
(1, 6, 1, 'Av. Siempreviva 123', 2, 140.00, '12,456852', '45,951753', 150000.00, 1),
(3, 1, 1, 'Barrio Cerro De La Cruz Manzana 265 Casa 10', 3, 120.00, '12', '32', 99999.99, 1),
(5, 2, 3, 'Salta 616', 3, 150.00, '12', NULL, 110000.00, 0),
(6, 2, 4, 'Carranza 1129', 2, 140.00, NULL, NULL, 130000.00, 1),
(7, 6, 3, 'Carranza 1129', 2, 50.00, NULL, NULL, 54000.00, 0),
(9, 14, 1, 'Peron 123', 1, 20.00, NULL, NULL, 39000.00, 0),
(11, 6, 2, 'Carranza 1129', 2, 50.00, NULL, NULL, 54000.00, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inquilino`
--

CREATE TABLE `inquilino` (
  `IdInquilino` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(15) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Email` varchar(70) DEFAULT NULL,
  `DNI` varchar(15) NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inquilino`
--

INSERT INTO `inquilino` (`IdInquilino`, `Nombre`, `Apellido`, `Telefono`, `Email`, `DNI`, `Estado`) VALUES
(1, 'Ezequiel', 'Diaz', '1125896314', 'diazezequiel777@gmail.com', '34123456', 0),
(2, 'Pepito', 'Martinez', '1123456789', 'pema89@gmail.com', '25000001', 0),
(4, 'Patricia', 'Baigorria', '', '', '27000000', 0),
(6, 'Federico', 'Cruceño', '2657312733', 'fedeicru@gmail.com', '37716731', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `IdPropietario` int(11) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(15) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `DNI` varchar(15) NOT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`IdPropietario`, `Nombre`, `Apellido`, `Telefono`, `Email`, `DNI`, `Estado`) VALUES
(1, 'Mariano', 'Luzza', '2664268752', 'mluzza@gmail.com', '38123456', 0),
(2, 'Ezequiel', 'Orsomarso', '1123185231', 'diazezequiel777@gmail.com', '34229421', 0),
(4, 'Federico', 'Cruceño', '2657312733', 'fedeicru@gmail.com', '37716731', 0),
(6, 'Dora Nelida', 'Orsomarso', '1163213910', 'doranel50@hotmil.com', '12600842', 0),
(7, 'Beatriz', 'Hernando', '2664123456', 'beahernando@gmail.com', '5919535', 0),
(14, 'Patricia', 'Baigorria', NULL, NULL, '27000000', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodeinmueble`
--

CREATE TABLE `tipodeinmueble` (
  `idTipoDeInmueble` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipodeinmueble`
--

INSERT INTO `tipodeinmueble` (`idTipoDeInmueble`, `tipo`, `estado`) VALUES
(1, 'comercial', 1),
(2, 'departamento', 1),
(3, 'casa', 1),
(4, 'mansión', 0),
(12, 'Litera', 0),
(13, 'casa amplia', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`IdContrato`),
  ADD KEY `contrato_ibfk_1` (`IdInquilino`),
  ADD KEY `contrato_ibfk_2` (`IdInmueble`);

--
-- Indices de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD PRIMARY KEY (`IdInmueble`),
  ADD KEY `IdPropietario` (`IdPropietario`),
  ADD KEY `idTipoDeInmueble` (`IdTipoDeInmueble`);

--
-- Indices de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  ADD PRIMARY KEY (`IdInquilino`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`IdPropietario`);

--
-- Indices de la tabla `tipodeinmueble`
--
ALTER TABLE `tipodeinmueble`
  ADD PRIMARY KEY (`idTipoDeInmueble`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contrato`
--
ALTER TABLE `contrato`
  MODIFY `IdContrato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  MODIFY `IdInmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `inquilino`
--
ALTER TABLE `inquilino`
  MODIFY `IdInquilino` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `propietario`
--
ALTER TABLE `propietario`
  MODIFY `IdPropietario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tipodeinmueble`
--
ALTER TABLE `tipodeinmueble`
  MODIFY `idTipoDeInmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`IdInquilino`) REFERENCES `inquilino` (`IdInquilino`),
  ADD CONSTRAINT `contrato_ibfk_2` FOREIGN KEY (`IdInmueble`) REFERENCES `inmueble` (`IdInmueble`);

--
-- Filtros para la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD CONSTRAINT `inmueble_ibfk_1` FOREIGN KEY (`IdPropietario`) REFERENCES `propietario` (`IdPropietario`),
  ADD CONSTRAINT `inmueble_ibfk_2` FOREIGN KEY (`idTipoDeInmueble`) REFERENCES `tipodeinmueble` (`idTipoDeInmueble`);
--
-- Base de datos: `obrador`
--
DROP DATABASE IF EXISTS `obrador`;
CREATE DATABASE IF NOT EXISTS `obrador` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `obrador`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `dni` bigint(20) NOT NULL,
  `apellido` varchar(58) NOT NULL,
  `nombre` varchar(58) NOT NULL,
  `acceso` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `dni`, `apellido`, `nombre`, `acceso`, `estado`) VALUES
(1, 123456789, 'Pastrana', 'Astrid', 1, 0),
(2, 234567891, 'Pastrana', 'Vito', 2, 1),
(3, 345678912, 'Pastrana', 'Rocket', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramienta`
--

CREATE TABLE `herramienta` (
  `id_herramienta` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `herramienta`
--

INSERT INTO `herramienta` (`id_herramienta`, `nombre`, `descripcion`, `stock`, `estado`) VALUES
(1, 'martillo', 'sirve para martillar', 9, 1),
(2, 'serrucho', 'sirve para serruchar', 7, 1),
(3, 'copiadora', 'sirve para copiar', 4, 0),
(4, 'lijadora', 'sirve para lijar', 3, 1),
(5, 'sierra transversal', 'sirve para cortar', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `id_movimiento` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_herramienta` int(11) NOT NULL,
  `fechap` date NOT NULL,
  `fechad` date NOT NULL,
  `cantidadret` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`id_movimiento`, `id_empleado`, `id_herramienta`, `fechap`, `fechad`, `cantidadret`, `estado`) VALUES
(1, 1, 3, '2025-08-04', '2025-09-05', 4, 1),
(2, 1, 4, '2025-06-04', '2025-11-23', 5, 1),
(3, 2, 1, '2025-05-09', '2025-07-04', 2, 1),
(4, 2, 2, '2025-09-28', '2027-11-04', 4, 1),
(5, 3, 5, '2025-07-16', '2025-08-09', 3, 0),
(6, 3, 1, '2025-06-09', '2025-07-02', 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  ADD PRIMARY KEY (`id_herramienta`);

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`id_movimiento`),
  ADD KEY `id_empleado` (`id_empleado`),
  ADD KEY `id_herramienta` (`id_herramienta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  MODIFY `id_herramienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `id_movimiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  ADD CONSTRAINT `movimiento_ibfk_2` FOREIGN KEY (`id_herramienta`) REFERENCES `herramienta` (`id_herramienta`);
--
-- Base de datos: `pedidoslinea`
--
DROP DATABASE IF EXISTS `pedidoslinea`;
CREATE DATABASE IF NOT EXISTS `pedidoslinea` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pedidoslinea`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `correoElectronico` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nombre`, `direccion`, `correoElectronico`) VALUES
(1, 'Ivan Pastrana', 'Riobamba 123', 'ivan@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

CREATE TABLE `detalles` (
  `idDetalle` int(11) NOT NULL,
  `idPedido` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedido` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `idCliente` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD PRIMARY KEY (`idDetalle`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idPedido` (`idPedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD CONSTRAINT `detalles_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  ADD CONSTRAINT `detalles_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);
--
-- Base de datos: `phpmyadmin`
--
DROP DATABASE IF EXISTS `phpmyadmin`;
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\",\"full_screen\":\"off\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_nr`, `page_descr`) VALUES
('vacunatorio', 1, 'vacunatorio'),
('vacunatorio2', 2, 'vacunat2'),
('gestión de pedidos', 3, 'gestión de pedidos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"obrador\",\"table\":\"empleado\"},{\"db\":\"obrador\",\"table\":\"herramienta\"},{\"db\":\"obrador\",\"table\":\"movimiento\"},{\"db\":\"gesti\\u00f3n de pedidos\",\"table\":\"detalles\"},{\"db\":\"gesti\\u00f3n de pedidos\",\"table\":\"pedidos\"},{\"db\":\"gesti\\u00f3n de pedidos\",\"table\":\"productos\"},{\"db\":\"gesti\\u00f3n de pedidos\",\"table\":\"clientes\"},{\"db\":\"gesti\\u00f3n de pedidos\",\"table\":\"Clientes\"},{\"db\":\"veterinariaabarza\",\"table\":\"visita\"},{\"db\":\"veterinariaabarza\",\"table\":\"mascota\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- Volcado de datos para la tabla `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('gestión de pedidos', 'clientes', 3, 137, 63),
('gestión de pedidos', 'detalles', 3, 684, 42),
('gestión de pedidos', 'pedidos', 3, 394, 41),
('gestión de pedidos', 'productos', 3, 967, 44),
('vacunatorio', 'agentedesalud', 1, 733, 22),
('vacunatorio', 'aplicacion', 1, 749, 124),
('vacunatorio', 'centrodevacunacion', 1, 613, 499),
('vacunatorio', 'depositonacional', 1, 194, 40),
('vacunatorio', 'depositoprovincial', 1, 264, 429),
('vacunatorio', 'descarte', 1, 352, 213),
('vacunatorio', 'laboratorio', 1, 47, 464),
('vacunatorio', 'loteinterno', 1, 34, 233),
('vacunatorio', 'loteproveedor', 1, 51, 236),
('vacunatorio', 'patologiabase', 1, 511, 395),
('vacunatorio', 'persona', 1, 396, 439),
('vacunatorio', 'telefono', 1, 459, 12),
('vacunatorio', 'traslado', 1, 336, 529),
('vacunatorio2', 'agentedesalud', 2, 299, 190),
('vacunatorio2', 'aplicacion', 2, 53, 461),
('vacunatorio2', 'centrodevacunacion', 2, 514, 525),
('vacunatorio2', 'depositonacional', 2, 118, 232),
('vacunatorio2', 'depositoprovincial', 2, 416, 509),
('vacunatorio2', 'descarte', 2, 582, 396),
('vacunatorio2', 'laboratorio', 2, 1072, 452),
('vacunatorio2', 'loteinterno', 2, 438, 43),
('vacunatorio2', 'loteproveedor', 2, 1068, 242),
('vacunatorio2', 'patologiabase', 2, 193, 486),
('vacunatorio2', 'persona', 2, 381, 306),
('vacunatorio2', 'telefono', 2, 242, 209),
('vacunatorio2', 'traslado', 2, 975, 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('gestión de pedidos', 'pedidos', 'estado'),
('veterinariaabarza', 'mascota', 'alias'),
('veterinariaabarza', 'visita', 'detalle');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'veterinariaabarza', 'mascota', '{\"sorted_col\":\"`mascota`.`especie` ASC\"}', '2023-08-12 11:54:04'),
('root', 'veterinariaabarza', 'visita', '{\"sorted_col\":\"`visita`.`fechaVisita` DESC\"}', '2023-08-13 22:54:16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-08-14 04:58:18', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\",\"NavigationWidth\":0}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `prueba1`
--
DROP DATABASE IF EXISTS `prueba1`;
CREATE DATABASE IF NOT EXISTS `prueba1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `prueba1`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agentedesalud`
--

CREATE TABLE `agentedesalud` (
  `DNI` int(11) NOT NULL,
  `matricula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion`
--

CREATE TABLE `aplicacion` (
  `idAplicacion` int(11) NOT NULL,
  `DNIPaciente` int(11) NOT NULL,
  `DNIAgente` int(11) NOT NULL,
  `fechaDeAplicacion` datetime NOT NULL,
  `numeroDeSerie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centrodevacunacion`
--

CREATE TABLE `centrodevacunacion` (
  `idCentroDeVacunacion` int(11) NOT NULL,
  `longitud` int(11) NOT NULL,
  `latitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositonacional`
--

CREATE TABLE `depositonacional` (
  `idDepositoNacional` int(11) NOT NULL,
  `longitud` int(11) NOT NULL,
  `latitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositoprovincial`
--

CREATE TABLE `depositoprovincial` (
  `idDepositoProvincial` int(11) NOT NULL,
  `longitud` int(11) NOT NULL,
  `latitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descarte`
--

CREATE TABLE `descarte` (
  `idDescarte` int(11) NOT NULL,
  `numeroDeLote` int(11) NOT NULL,
  `DNIAgente` int(11) NOT NULL,
  `empresaDescartante` varchar(255) NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `cantidadDeVacunas` int(11) NOT NULL,
  `fechaDeDescarte` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `idLaboratorio` int(11) NOT NULL,
  `nombreLaboratorio` varchar(255) NOT NULL,
  `pais` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `longitud` int(11) NOT NULL,
  `latitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteinterno`
--

CREATE TABLE `loteinterno` (
  `numeroDeSerie` int(11) NOT NULL,
  `numeroDeLote` int(11) NOT NULL,
  `idLaboratorio` int(11) NOT NULL,
  `cantidadDeVacunas` int(11) NOT NULL,
  `fechaDeLlegadaDepositoNacional` datetime DEFAULT NULL,
  `idDepositoNacional` int(11) DEFAULT NULL,
  `fechaDeSalidaDepositoNacional` datetime DEFAULT NULL,
  `fechaDeLlegadaDepositoProvincial` datetime DEFAULT NULL,
  `idDepositoProvincial` int(11) DEFAULT NULL,
  `fechaDeSalidaDepositoProvincial` datetime DEFAULT NULL,
  `fechaDeLlegadaCentroDeVacunacion` datetime DEFAULT NULL,
  `idCentroDeVacunacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteproveedor`
--

CREATE TABLE `loteproveedor` (
  `numeroDeLote` int(11) NOT NULL,
  `idLaboratorio` int(11) NOT NULL,
  `tipoDeVacuna` varchar(255) NOT NULL,
  `nombreComercial` varchar(255) NOT NULL,
  `cantidadDeLotesInternos` int(11) NOT NULL,
  `fechaDeFabricacion` datetime NOT NULL,
  `fechaDeVencimiento` datetime NOT NULL,
  `fechaDeCompra` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patologiabase`
--

CREATE TABLE `patologiabase` (
  `DNI` int(11) NOT NULL,
  `patologiaBase` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `DNI` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fechaDeNacimiento` date NOT NULL,
  `ocupacion` varchar(255) NOT NULL,
  `genero` varchar(255) NOT NULL,
  `longitud` double NOT NULL,
  `latitud` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `DNI` int(11) NOT NULL,
  `celular1` varchar(255) NOT NULL,
  `celular2` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslado`
--

CREATE TABLE `traslado` (
  `idTraslado` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `idCentroDeVacunacion` int(11) NOT NULL,
  `fechaDeSalida` datetime DEFAULT NULL,
  `fechaDeLlegada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agentedesalud`
--
ALTER TABLE `agentedesalud`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD PRIMARY KEY (`idAplicacion`),
  ADD KEY `DNIPaciente` (`DNIPaciente`),
  ADD KEY `DNIAgente` (`DNIAgente`),
  ADD KEY `numeroDeSerie` (`numeroDeSerie`);

--
-- Indices de la tabla `centrodevacunacion`
--
ALTER TABLE `centrodevacunacion`
  ADD PRIMARY KEY (`idCentroDeVacunacion`);

--
-- Indices de la tabla `depositonacional`
--
ALTER TABLE `depositonacional`
  ADD PRIMARY KEY (`idDepositoNacional`);

--
-- Indices de la tabla `depositoprovincial`
--
ALTER TABLE `depositoprovincial`
  ADD PRIMARY KEY (`idDepositoProvincial`);

--
-- Indices de la tabla `descarte`
--
ALTER TABLE `descarte`
  ADD PRIMARY KEY (`idDescarte`),
  ADD KEY `numeroDeLote` (`numeroDeLote`),
  ADD KEY `DNIAgente` (`DNIAgente`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`idLaboratorio`);

--
-- Indices de la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  ADD PRIMARY KEY (`numeroDeSerie`),
  ADD KEY `numeroDeLote` (`numeroDeLote`),
  ADD KEY `idLaboratorio` (`idLaboratorio`),
  ADD KEY `idDepositoNacional` (`idDepositoNacional`),
  ADD KEY `idDepositoProvincial` (`idDepositoProvincial`),
  ADD KEY `idCentroDeVacunacion` (`idCentroDeVacunacion`);

--
-- Indices de la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD PRIMARY KEY (`numeroDeLote`,`idLaboratorio`),
  ADD UNIQUE KEY `idLaboratorio` (`idLaboratorio`);

--
-- Indices de la tabla `patologiabase`
--
ALTER TABLE `patologiabase`
  ADD PRIMARY KEY (`DNI`,`patologiaBase`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `traslado`
--
ALTER TABLE `traslado`
  ADD PRIMARY KEY (`idTraslado`),
  ADD UNIQUE KEY `Traslado_idCentroDeVacunacion_numeroDeSerie_unique` (`numeroDeSerie`,`idCentroDeVacunacion`),
  ADD KEY `idCentroDeVacunacion` (`idCentroDeVacunacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  MODIFY `idAplicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `centrodevacunacion`
--
ALTER TABLE `centrodevacunacion`
  MODIFY `idCentroDeVacunacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `depositonacional`
--
ALTER TABLE `depositonacional`
  MODIFY `idDepositoNacional` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `depositoprovincial`
--
ALTER TABLE `depositoprovincial`
  MODIFY `idDepositoProvincial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descarte`
--
ALTER TABLE `descarte`
  MODIFY `idDescarte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `idLaboratorio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  MODIFY `numeroDeSerie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  MODIFY `numeroDeLote` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `traslado`
--
ALTER TABLE `traslado`
  MODIFY `idTraslado` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agentedesalud`
--
ALTER TABLE `agentedesalud`
  ADD CONSTRAINT `agentedesalud_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD CONSTRAINT `aplicacion_ibfk_1` FOREIGN KEY (`DNIPaciente`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aplicacion_ibfk_2` FOREIGN KEY (`DNIAgente`) REFERENCES `agentedesalud` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aplicacion_ibfk_3` FOREIGN KEY (`numeroDeSerie`) REFERENCES `loteinterno` (`numeroDeSerie`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `descarte`
--
ALTER TABLE `descarte`
  ADD CONSTRAINT `descarte_ibfk_1` FOREIGN KEY (`numeroDeLote`) REFERENCES `loteproveedor` (`numeroDeLote`),
  ADD CONSTRAINT `descarte_ibfk_2` FOREIGN KEY (`DNIAgente`) REFERENCES `agentedesalud` (`DNI`);

--
-- Filtros para la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  ADD CONSTRAINT `loteinterno_ibfk_1` FOREIGN KEY (`numeroDeLote`) REFERENCES `loteproveedor` (`numeroDeLote`),
  ADD CONSTRAINT `loteinterno_ibfk_2` FOREIGN KEY (`idLaboratorio`) REFERENCES `loteproveedor` (`idLaboratorio`),
  ADD CONSTRAINT `loteinterno_ibfk_3` FOREIGN KEY (`idDepositoNacional`) REFERENCES `depositonacional` (`idDepositoNacional`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `loteinterno_ibfk_4` FOREIGN KEY (`idDepositoProvincial`) REFERENCES `depositoprovincial` (`idDepositoProvincial`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `loteinterno_ibfk_5` FOREIGN KEY (`idCentroDeVacunacion`) REFERENCES `centrodevacunacion` (`idCentroDeVacunacion`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD CONSTRAINT `loteproveedor_ibfk_1` FOREIGN KEY (`idLaboratorio`) REFERENCES `laboratorio` (`idLaboratorio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `patologiabase`
--
ALTER TABLE `patologiabase`
  ADD CONSTRAINT `patologiabase_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `traslado`
--
ALTER TABLE `traslado`
  ADD CONSTRAINT `traslado_ibfk_1` FOREIGN KEY (`numeroDeSerie`) REFERENCES `loteinterno` (`numeroDeSerie`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `traslado_ibfk_2` FOREIGN KEY (`idCentroDeVacunacion`) REFERENCES `centrodevacunacion` (`idCentroDeVacunacion`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `restapi_nodejs_express`
--
DROP DATABASE IF EXISTS `restapi_nodejs_express`;
CREATE DATABASE IF NOT EXISTS `restapi_nodejs_express` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `restapi_nodejs_express`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `language`
--

CREATE TABLE `language` (
  `id` tinyint(2) NOT NULL,
  `name` varchar(30) NOT NULL,
  `programmers` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `language`
--

INSERT INTO `language` (`id`, `name`, `programmers`) VALUES
(1, 'JavaScript', 12);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `language`
--
ALTER TABLE `language`
  MODIFY `id` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Base de datos: `seriespeliculas`
--
DROP DATABASE IF EXISTS `seriespeliculas`;
CREATE DATABASE IF NOT EXISTS `seriespeliculas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `seriespeliculas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seriespeliculas`
--

CREATE TABLE `seriespeliculas` (
  `idContenido` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `formato` varchar(100) NOT NULL,
  `creador` varchar(100) NOT NULL,
  `estreno` int(4) NOT NULL,
  `puntaje` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seriespeliculas`
--

INSERT INTO `seriespeliculas` (`idContenido`, `titulo`, `formato`, `creador`, `estreno`, `puntaje`) VALUES
(1, 'El planeta de los simios', 'novela', 'Peter Jackson', 1963, 9.8),
(2, 'El planeta de los simios', 'pelicula', 'Franklin Schaffner', 1968, 7.9),
(3, 'Escape del planeta de los simios', 'pelicula', 'Arthur P.Jacobs', 1971, 6.5),
(4, 'Conquista del planeta de los simios', 'pelicula', 'Arthur P. Jacobs', 1972, 6.7),
(5, 'La batalla por el planeta de los simios', 'pelicula', 'Arthur P. Jacobs', 1973, 8.6),
(6, 'El planeta de los simios', 'serie', 'Mort Abraham', 1974, 7),
(7, 'Regreso al planeta de los simios', 'serie', 'DePatie-Freleng Enterprises', 1975, 7.4),
(8, 'El planeta de los simios', 'comic', 'El planeta de los simios franquicia', 1975, 8.2),
(9, 'El planeta de los simios', 'pelicula', 'Tim Burton', 2001, 8),
(10, 'El planeta de los simios: evolucion', 'pelicula', 'Rupert Wyatt', 2011, 7.8),
(11, 'El planeta de los simios: confrontacion', 'pelicula', 'Matt Reeves', 2014, 9),
(12, 'La guerra del planeta de los simios', 'pelicula', 'Matt Reeves', 2017, 9.5),
(15, 'Transformers: Bumblebee', 'pelicula', 'Travis Knight', 2018, 7.4),
(16, 'Transformers: el ultimo caballero', 'pelicula', 'Michael Bay', 2017, 8.2),
(17, 'Transformers: la guerra por Cybertron - el asedio', 'serie', 'Pierre Boulle', 2020, 9.8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `seriespeliculas`
--
ALTER TABLE `seriespeliculas`
  ADD PRIMARY KEY (`idContenido`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `seriespeliculas`
--
ALTER TABLE `seriespeliculas`
  MODIFY `idContenido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- Base de datos: `trabajo_practico_transversal`
--
DROP DATABASE IF EXISTS `trabajo_practico_transversal`;
CREATE DATABASE IF NOT EXISTS `trabajo_practico_transversal` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `trabajo_practico_transversal`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `idAlumno` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `fechaDeNacimiento` date NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`idAlumno`, `nombre`, `apellido`, `dni`, `fechaDeNacimiento`, `estado`) VALUES
(1, 'Pablito Jose', 'Tulipan', '23456789', '1968-03-20', 1),
(2, 'Penelope', 'Gaund', '12345678', '1956-09-21', 0),
(3, 'Ezequiel', 'Diaz', '34229421', '1988-11-09', 0),
(4, 'Federico Ivan', 'Cruceño', '37716730', '1994-03-20', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE `inscripcion` (
  `idInscripcion` int(11) NOT NULL,
  `idAlumno` int(11) NOT NULL,
  `idMateria` int(11) NOT NULL,
  `nota` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inscripcion`
--

INSERT INTO `inscripcion` (`idInscripcion`, `idAlumno`, `idMateria`, `nota`) VALUES
(11, 4, 8, 9.00),
(12, 4, 5, 0.96),
(13, 1, 5, 7.00),
(15, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `idMateria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `anio` varchar(3) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`idMateria`, `nombre`, `anio`, `estado`) VALUES
(1, 'Matematica', '4', 1),
(2, 'Laboratorios', '2', 0),
(5, 'Lengua', '1', 1),
(6, 'Lengua', '2', 0),
(8, 'Lengua', '3', 1),
(9, 'Matemática', '2', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`idAlumno`);

--
-- Indices de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD PRIMARY KEY (`idInscripcion`),
  ADD KEY `idAlumno` (`idAlumno`),
  ADD KEY `idMateria` (`idMateria`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`idMateria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `idAlumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  MODIFY `idInscripcion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `idMateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `inscripcion_ibfk_1` FOREIGN KEY (`idAlumno`) REFERENCES `alumno` (`idAlumno`),
  ADD CONSTRAINT `inscripcion_ibfk_2` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`);
--
-- Base de datos: `universidadgrupo2`
--
DROP DATABASE IF EXISTS `universidadgrupo2`;
CREATE DATABASE IF NOT EXISTS `universidadgrupo2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `universidadgrupo2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id_alumno` int(11) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `apellido` varchar(15) NOT NULL,
  `fecha_nac` date NOT NULL,
  `legajo` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id_alumno`, `nombre`, `apellido`, `fecha_nac`, `legajo`, `estado`) VALUES
(1, 'Pepito', 'Perez', '1988-11-09', 32, 1),
(2, 'Juancito', 'Menendez', '1993-09-18', 29, 1),
(8, 'Juanito', 'Gonzalez', '1995-05-23', 35, 1),
(13, 'Pepito', 'argento', '2000-07-23', 9, 0),
(14, 'Ezequiel', 'Diaz', '1988-11-09', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursada`
--

CREATE TABLE `cursada` (
  `id_cursada` int(11) NOT NULL,
  `id_alumno` int(11) NOT NULL,
  `id_materia` int(11) NOT NULL,
  `nota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cursada`
--

INSERT INTO `cursada` (`id_cursada`, `id_alumno`, `id_materia`, `nota`) VALUES
(1, 8, 1, 7),
(2, 2, 3, 9),
(3, 1, 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id_materia` int(11) NOT NULL,
  `nombre_materia` varchar(20) NOT NULL,
  `año` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id_materia`, `nombre_materia`, `año`, `estado`) VALUES
(1, 'Ingles', 1, 1),
(2, 'Matematicas', 1, 1),
(3, 'Laboratorio', 1, 1),
(4, 'EDA', 1, 1),
(5, 'Web 2', 2, 1),
(6, 'EDA', 1, 0),
(8, 'Portugues', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id_alumno`),
  ADD UNIQUE KEY `legajo` (`legajo`);

--
-- Indices de la tabla `cursada`
--
ALTER TABLE `cursada`
  ADD PRIMARY KEY (`id_cursada`),
  ADD KEY `id_alumno` (`id_alumno`),
  ADD KEY `id_materia` (`id_materia`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`id_materia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id_alumno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `cursada`
--
ALTER TABLE `cursada`
  MODIFY `id_cursada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id_materia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cursada`
--
ALTER TABLE `cursada`
  ADD CONSTRAINT `cursada_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `alumno` (`id_alumno`),
  ADD CONSTRAINT `cursada_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `materia` (`id_materia`);
--
-- Base de datos: `usersvacunatorio2`
--
DROP DATABASE IF EXISTS `usersvacunatorio2`;
CREATE DATABASE IF NOT EXISTS `usersvacunatorio2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `usersvacunatorio2`;
--
-- Base de datos: `vacunar`
--
DROP DATABASE IF EXISTS `vacunar`;
CREATE DATABASE IF NOT EXISTS `vacunar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vacunar`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agente`
--

CREATE TABLE `agente` (
  `Id` int(11) NOT NULL,
  `PersonaId` int(11) NOT NULL,
  `Matricula` varchar(255) NOT NULL,
  `Estado` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centrodevacunacion`
--

CREATE TABLE `centrodevacunacion` (
  `Id` int(11) NOT NULL,
  `nombreCentroDeVacunacion` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `departamento` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citadevacunacion`
--

CREATE TABLE `citadevacunacion` (
  `Id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estadoDeCita` tinyint(1) NOT NULL,
  `idCentroDeVacunacion` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `idDosis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `Id` int(11) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `nombreComercial` varchar(30) NOT NULL,
  `paisDeOrigen` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteinterno`
--

CREATE TABLE `loteinterno` (
  `Id` int(11) NOT NULL,
  `LoteProveedorId` int(11) NOT NULL,
  `CantidadDeVacunas` int(11) NOT NULL,
  `Estado` enum('Disponible','Usado') NOT NULL DEFAULT 'Disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteproveedor`
--

CREATE TABLE `loteproveedor` (
  `Id` int(11) NOT NULL,
  `NumeroDeLote` varchar(255) NOT NULL,
  `LaboratorioId` int(11) NOT NULL,
  `TipoDeVacuna` varchar(255) NOT NULL,
  `NombreComercial` varchar(255) NOT NULL,
  `CantidadDeLotesInternos` int(11) NOT NULL,
  `FechaDeVencimiento` date NOT NULL,
  `Estado` enum('Activo','Vencido','Agotado') NOT NULL DEFAULT 'Activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `Id` int(11) NOT NULL,
  `dni` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `peso` double NOT NULL,
  `altura` double NOT NULL,
  `email` varchar(50) NOT NULL,
  `trabajo` tinyint(1) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `fechaDeNacimiento` date NOT NULL,
  `ciudad` varchar(30) NOT NULL,
  `departamento` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodevacuna`
--

CREATE TABLE `tipodevacuna` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Descripcion` text NOT NULL,
  `Contraindicaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agente`
--
ALTER TABLE `agente`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `PersonaId` (`PersonaId`);

--
-- Indices de la tabla `centrodevacunacion`
--
ALTER TABLE `centrodevacunacion`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `citadevacunacion`
--
ALTER TABLE `citadevacunacion`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `idDosis` (`idDosis`),
  ADD KEY `idPersona` (`idPersona`),
  ADD KEY `idCentroDeVacunacion` (`idCentroDeVacunacion`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `LoteProveedorId` (`LoteProveedorId`);

--
-- Indices de la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `LaboratorioId` (`LaboratorioId`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- Indices de la tabla `tipodevacuna`
--
ALTER TABLE `tipodevacuna`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agente`
--
ALTER TABLE `agente`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `centrodevacunacion`
--
ALTER TABLE `centrodevacunacion`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de la tabla `citadevacunacion`
--
ALTER TABLE `citadevacunacion`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT de la tabla `tipodevacuna`
--
ALTER TABLE `tipodevacuna`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agente`
--
ALTER TABLE `agente`
  ADD CONSTRAINT `agente_ibfk_1` FOREIGN KEY (`PersonaId`) REFERENCES `persona` (`Id`);

--
-- Filtros para la tabla `citadevacunacion`
--
ALTER TABLE `citadevacunacion`
  ADD CONSTRAINT `citadevacunacion_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`Id`),
  ADD CONSTRAINT `citadevacunacion_ibfk_2` FOREIGN KEY (`idCentroDeVacunacion`) REFERENCES `centrodevacunacion` (`Id`),
  ADD CONSTRAINT `citadevacunacion_ibfk_3` FOREIGN KEY (`idDosis`) REFERENCES `loteinterno` (`Id`);

--
-- Filtros para la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  ADD CONSTRAINT `loteinterno_ibfk_1` FOREIGN KEY (`LoteProveedorId`) REFERENCES `loteproveedor` (`Id`);

--
-- Filtros para la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD CONSTRAINT `loteproveedor_ibfk_1` FOREIGN KEY (`LaboratorioId`) REFERENCES `laboratorio` (`Id`);
--
-- Base de datos: `vacunatorio`
--
DROP DATABASE IF EXISTS `vacunatorio`;
CREATE DATABASE IF NOT EXISTS `vacunatorio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vacunatorio`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agentedesalud`
--

CREATE TABLE `agentedesalud` (
  `DNI` int(11) NOT NULL,
  `matricula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `agentedesalud`
--

INSERT INTO `agentedesalud` (`DNI`, `matricula`) VALUES
(34000007, 10000),
(34000008, 10001),
(34000009, 10002);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion`
--

CREATE TABLE `aplicacion` (
  `idAplicacion` int(11) NOT NULL,
  `DNIPaciente` int(11) NOT NULL,
  `DNIAgente` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `fechaDeAplicacion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aplicacion`
--

INSERT INTO `aplicacion` (`idAplicacion`, `DNIPaciente`, `DNIAgente`, `numeroDeSerie`, `fechaDeAplicacion`) VALUES
(1, 34000000, 34000007, 1, '2023-09-05'),
(2, 34000001, 34000008, 6, '2023-09-05'),
(3, 34000002, 34000009, 11, '2023-09-05'),
(4, 34000003, 34000007, 16, '2023-09-05'),
(5, 34000004, 34000008, 2, '2023-09-05'),
(6, 34000005, 34000009, 7, '2023-09-05'),
(7, 34000006, 34000008, 12, '2023-09-05'),
(8, 34000007, 34000009, 17, '2023-09-05'),
(9, 34000008, 34000007, 3, '2023-09-05'),
(10, 34000009, 34000008, 13, '2023-09-05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centrodevacunacion`
--

CREATE TABLE `centrodevacunacion` (
  `idCentroDeVacunacion` int(11) NOT NULL,
  `longitud` int(11) NOT NULL,
  `latitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `centrodevacunacion`
--

INSERT INTO `centrodevacunacion` (`idCentroDeVacunacion`, `longitud`, `latitud`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositonacional`
--

CREATE TABLE `depositonacional` (
  `idDepositoNacional` int(11) NOT NULL,
  `longitud` int(11) NOT NULL,
  `latitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `depositonacional`
--

INSERT INTO `depositonacional` (`idDepositoNacional`, `longitud`, `latitud`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositoprovincial`
--

CREATE TABLE `depositoprovincial` (
  `idDepositoProvincial` int(11) NOT NULL,
  `longitud` int(11) NOT NULL,
  `latitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `depositoprovincial`
--

INSERT INTO `depositoprovincial` (`idDepositoProvincial`, `longitud`, `latitud`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descarte`
--

CREATE TABLE `descarte` (
  `idDescarte` int(11) NOT NULL,
  `DNIAgente` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `empresaDescartante` varchar(50) NOT NULL,
  `motivo` varchar(50) NOT NULL,
  `cantidadDeVacunas` int(11) NOT NULL,
  `fechaDeDescarte` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `descarte`
--

INSERT INTO `descarte` (`idDescarte`, `DNIAgente`, `numeroDeSerie`, `empresaDescartante`, `motivo`, `cantidadDeVacunas`, `fechaDeDescarte`) VALUES
(1, 34000007, 19, 'Descarte Seguro SA', 'Rotura de caja', 10, '2023-06-15'),
(2, 34000008, 2, 'Descarte Seguro SA', 'Rotura de vacuna', 1, '2023-06-15'),
(3, 34000009, 8, 'Descarte Seguro SA', 'Rotura de caja', 10, '2023-06-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `idLaboratorio` int(11) NOT NULL,
  `nombreLaboratorio` varchar(50) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `longitud` int(11) NOT NULL,
  `latitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `laboratorio`
--

INSERT INTO `laboratorio` (`idLaboratorio`, `nombreLaboratorio`, `pais`, `email`, `telefono`, `longitud`, `latitud`) VALUES
(1, 'Laboratorio 1', 'EEUU', 'lab1@gmail.com', '10001', 1, 1),
(2, 'Laboratorio 2', 'China', 'lab2@gmail.com', '10002', 1, 2),
(3, 'Laboratorio 3', 'Rusia', 'lab3@gmail.com', '10003', 1, 3),
(4, 'Laboratorio 4', 'Francia', 'lab4@gmail.com', '10004', 1, 4),
(5, 'Laboratorio 5', 'Argentina', 'lab5@gmail.com', '10005', 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteinterno`
--

CREATE TABLE `loteinterno` (
  `numeroDeSerie` int(11) NOT NULL,
  `numeroDeLote` int(11) NOT NULL,
  `idLaboratorio` int(11) NOT NULL,
  `cantidadDeVacunas` int(11) NOT NULL,
  `fechaDeLlegadaDepositoNacional` date DEFAULT NULL,
  `idDepositoNacional` int(11) DEFAULT NULL,
  `fechaDeSalidaDepositoNacional` date DEFAULT NULL,
  `fechaDeLlegadaDepositoProvincial` date DEFAULT NULL,
  `idDepositoProvincial` int(11) DEFAULT NULL,
  `fechaDeSalidaDepositoProvincial` date DEFAULT NULL,
  `fechaDeLlegadaCentroDeVacunacion` date DEFAULT NULL,
  `idCentroDeVacunacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `loteinterno`
--

INSERT INTO `loteinterno` (`numeroDeSerie`, `numeroDeLote`, `idLaboratorio`, `cantidadDeVacunas`, `fechaDeLlegadaDepositoNacional`, `idDepositoNacional`, `fechaDeSalidaDepositoNacional`, `fechaDeLlegadaDepositoProvincial`, `idDepositoProvincial`, `fechaDeSalidaDepositoProvincial`, `fechaDeLlegadaCentroDeVacunacion`, `idCentroDeVacunacion`) VALUES
(1, 1, 1, 5, '2023-02-01', 1, '2023-03-01', '2023-04-01', 1, '2023-05-01', '2023-06-01', 1),
(2, 1, 1, 5, '2023-02-01', 1, '2023-03-01', '2023-04-01', 1, '2023-05-01', '2023-06-01', 1),
(3, 2, 1, 5, '2023-02-01', 2, '2023-03-01', '2023-04-01', 2, '2023-05-01', '2023-06-01', 2),
(4, 2, 1, 5, '2023-02-01', 2, '2023-03-01', '2023-04-01', 2, '2023-05-01', '2023-06-01', 2),
(5, 1, 2, 5, '2023-02-01', 3, '2023-03-01', '2023-04-01', 3, '2023-05-01', '2023-06-01', 3),
(6, 1, 2, 5, '2023-02-01', 3, '2023-03-01', '2023-04-01', 3, '2023-05-01', '2023-06-01', 3),
(7, 2, 2, 5, '2023-02-01', 4, '2023-03-01', '2023-04-01', 4, '2023-05-01', '2023-06-01', 4),
(8, 2, 2, 5, '2023-02-01', 4, '2023-03-01', '2023-04-01', 4, '2023-05-01', '2023-06-01', 4),
(9, 1, 3, 5, '2023-02-01', 5, '2023-03-01', '2023-04-01', 5, '2023-05-01', '2023-06-01', 5),
(10, 1, 3, 5, '2023-02-01', 5, '2023-03-01', '2023-04-01', 5, '2023-05-01', '2023-06-01', 5),
(11, 2, 3, 5, '2023-02-01', 6, '2023-03-01', '2023-04-01', 6, '2023-05-01', '2023-06-01', 6),
(12, 1, 4, 5, '2023-02-01', 6, '2023-03-01', '2023-04-01', 6, '2023-05-01', '2023-06-01', 6),
(13, 1, 4, 5, '2023-02-01', 1, '2023-03-01', '2023-04-01', 1, '2023-05-01', '2023-06-01', 1),
(14, 2, 4, 5, '2023-02-01', 1, '2023-03-01', '2023-04-01', 1, '2023-05-01', '2023-06-01', 1),
(15, 2, 4, 5, '2023-02-01', 2, '2023-03-01', '2023-04-01', 2, '2023-05-01', '2023-06-01', 2),
(16, 1, 5, 5, '2023-02-01', 2, '2023-03-01', '2023-04-01', 2, '2023-05-01', '2023-06-01', 2),
(17, 1, 5, 5, '2023-02-01', 3, '2023-03-01', '2023-04-01', 3, '2023-05-01', '2023-06-01', 3),
(18, 2, 5, 5, '2023-02-01', 3, '2023-03-01', '2023-04-01', 3, '2023-05-01', '2023-06-01', 3),
(19, 2, 5, 5, '2023-02-01', 4, '2023-03-01', '2023-04-01', 4, '2023-05-01', '2023-06-01', 4),
(20, 2, 3, 5, '2023-02-01', 4, '2023-03-01', '2023-04-01', 4, '2023-05-01', '2023-06-01', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteproveedor`
--

CREATE TABLE `loteproveedor` (
  `numeroDeLote` int(11) NOT NULL,
  `idLaboratorio` int(11) NOT NULL,
  `tipoDeVacuna` varchar(25) NOT NULL,
  `nombreComercial` varchar(50) NOT NULL,
  `cantidadDeLoteInternos` int(11) NOT NULL,
  `fechaDeFabricacion` date NOT NULL,
  `fechaDeVencimiento` date NOT NULL,
  `fechaDeCompra` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `loteproveedor`
--

INSERT INTO `loteproveedor` (`numeroDeLote`, `idLaboratorio`, `tipoDeVacuna`, `nombreComercial`, `cantidadDeLoteInternos`, `fechaDeFabricacion`, `fechaDeVencimiento`, `fechaDeCompra`) VALUES
(1, 1, 'vac A', 'Vacuna A', 10, '2022-01-01', '2027-01-01', '2023-01-01'),
(1, 2, 'vac A', 'Vacuna A', 10, '2022-01-01', '2027-01-01', '2023-01-01'),
(1, 3, 'vac A', 'Vacuna A', 10, '2022-01-01', '2027-01-01', '2023-01-01'),
(1, 4, 'vac A', 'Vacuna A', 10, '2022-01-01', '2027-01-01', '2023-01-01'),
(1, 5, 'vac A', 'Vacuna A', 10, '2022-01-01', '2027-01-01', '2023-01-01'),
(2, 1, 'vac B', 'Vacuna B', 10, '2022-01-01', '2027-01-01', '2023-01-01'),
(2, 2, 'vac B', 'Vacuna B', 10, '2022-01-01', '2027-01-01', '2023-01-01'),
(2, 3, 'vac B', 'Vacuna B', 10, '2022-01-01', '2027-01-01', '2023-01-01'),
(2, 4, 'vac B', 'Vacuna B', 10, '2022-01-01', '2027-01-01', '2023-01-01'),
(2, 5, 'vac B', 'Vacuna B', 10, '2022-01-01', '2027-01-01', '2023-01-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patologiabase`
--

CREATE TABLE `patologiabase` (
  `DNI` int(11) NOT NULL,
  `patologiaBase` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `patologiabase`
--

INSERT INTO `patologiabase` (`DNI`, `patologiaBase`) VALUES
(34000000, 'Anginas'),
(34000000, 'Sobrepeso'),
(34000001, 'Alergia'),
(34000002, 'Alergia'),
(34000003, 'Arritmia'),
(34000004, 'Sobrepeso'),
(34000005, ''),
(34000006, 'Angina'),
(34000007, 'Alergia'),
(34000007, 'Angina'),
(34000008, 'Alergia'),
(34000009, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `DNI` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fechaDeNacimiento` date NOT NULL,
  `ocupacion` varchar(50) NOT NULL,
  `genero` varchar(10) NOT NULL,
  `longitud` int(11) NOT NULL,
  `latitud` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`DNI`, `nombre`, `apellido`, `email`, `fechaDeNacimiento`, `ocupacion`, `genero`, `longitud`, `latitud`) VALUES
(34000000, 'Juan', 'Perez', 'jupe00@gmail.com', '1988-01-01', 'Desempleado', 'Masculino', 1, 0),
(34000001, 'Adriana', 'Heredia', 'adhe01@gmail.com', '1988-02-01', 'Obrera', 'Femenino', 1, 1),
(34000002, 'Javier', 'Dominguez', 'javo02@gmail.com', '1988-03-01', 'Albañil', 'Masculino', 1, 2),
(34000003, 'Milena', 'Pueyrredon', 'mipu03@gmail.com', '1988-04-01', 'Gerenta', 'Femenino', 1, 3),
(34000004, 'Ramiro', 'Martinez', 'rama04@gmail.com', '1988-05-01', 'Arquitecto', 'Masculino', 1, 4),
(34000005, 'Lourdes', 'Gonzales', 'logo05@gmail.com', '1988-06-01', 'Musica', 'Femenino', 1, 5),
(34000006, 'Federico', 'Rodriguez', 'fero06@gmail.com', '1988-07-01', 'Docente', 'Masculino', 1, 6),
(34000007, 'Beatriz', 'Hernando', 'behe07@gmail.com', '1988-08-01', 'Medica', 'Femenino', 1, 7),
(34000008, 'Ivan', 'Juarez', 'ivju08@gmail.com', '1988-09-01', 'Medico', 'Masculino', 1, 8),
(34000009, 'Lara', 'Maitena', 'lama09@gmail.com', '1988-10-01', 'Enfermera', 'Femenino', 1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `DNI` int(11) NOT NULL,
  `celular1` varchar(15) DEFAULT NULL,
  `celular2` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`DNI`, `celular1`, `celular2`) VALUES
(34000000, '1132180000', '1132180001'),
(34000001, '1132180002', NULL),
(34000002, '1132180003', NULL),
(34000003, NULL, NULL),
(34000004, '1132180004', NULL),
(34000005, '1132180005', NULL),
(34000006, NULL, NULL),
(34000007, '1132180006', NULL),
(34000008, '1132180007', NULL),
(34000009, '1132180008', '1132180009');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslado`
--

CREATE TABLE `traslado` (
  `idTraslado` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `idCentroDeVacunacion` int(11) NOT NULL,
  `fechaDeSalida` date NOT NULL,
  `fechaDeLlegada` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `traslado`
--

INSERT INTO `traslado` (`idTraslado`, `numeroDeSerie`, `idCentroDeVacunacion`, `fechaDeSalida`, `fechaDeLlegada`) VALUES
(1, 5, 1, '2023-07-01', '2023-08-01'),
(2, 10, 2, '2023-07-01', '2023-08-01'),
(3, 15, 5, '2023-07-01', '2023-08-01'),
(4, 20, 6, '2023-07-01', '2023-08-01');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agentedesalud`
--
ALTER TABLE `agentedesalud`
  ADD PRIMARY KEY (`DNI`),
  ADD UNIQUE KEY `DNI` (`DNI`),
  ADD UNIQUE KEY `matricula` (`matricula`);

--
-- Indices de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD PRIMARY KEY (`idAplicacion`),
  ADD KEY `DNI` (`DNIPaciente`),
  ADD KEY `numeroDeSerie` (`numeroDeSerie`),
  ADD KEY `DNIAgente` (`DNIAgente`);

--
-- Indices de la tabla `centrodevacunacion`
--
ALTER TABLE `centrodevacunacion`
  ADD PRIMARY KEY (`idCentroDeVacunacion`);

--
-- Indices de la tabla `depositonacional`
--
ALTER TABLE `depositonacional`
  ADD PRIMARY KEY (`idDepositoNacional`);

--
-- Indices de la tabla `depositoprovincial`
--
ALTER TABLE `depositoprovincial`
  ADD PRIMARY KEY (`idDepositoProvincial`);

--
-- Indices de la tabla `descarte`
--
ALTER TABLE `descarte`
  ADD PRIMARY KEY (`idDescarte`),
  ADD KEY `numeroDeSerie` (`numeroDeSerie`),
  ADD KEY `descarte_ibfk_2` (`DNIAgente`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`idLaboratorio`);

--
-- Indices de la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  ADD PRIMARY KEY (`numeroDeSerie`),
  ADD KEY `numeroDeLote` (`numeroDeLote`),
  ADD KEY `idLaboratorio` (`idLaboratorio`),
  ADD KEY `idDepositoNacional` (`idDepositoNacional`),
  ADD KEY `idDepositoProvincial` (`idDepositoProvincial`),
  ADD KEY `idCentroDeVacunacion` (`idCentroDeVacunacion`);

--
-- Indices de la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD PRIMARY KEY (`numeroDeLote`,`idLaboratorio`),
  ADD KEY `idLaboratorio` (`idLaboratorio`);

--
-- Indices de la tabla `patologiabase`
--
ALTER TABLE `patologiabase`
  ADD PRIMARY KEY (`DNI`,`patologiaBase`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `traslado`
--
ALTER TABLE `traslado`
  ADD PRIMARY KEY (`idTraslado`),
  ADD KEY `idCentroDeVacunacion` (`idCentroDeVacunacion`),
  ADD KEY `numeroDeSerie` (`numeroDeSerie`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  MODIFY `idAplicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `centrodevacunacion`
--
ALTER TABLE `centrodevacunacion`
  MODIFY `idCentroDeVacunacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `depositonacional`
--
ALTER TABLE `depositonacional`
  MODIFY `idDepositoNacional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `depositoprovincial`
--
ALTER TABLE `depositoprovincial`
  MODIFY `idDepositoProvincial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `descarte`
--
ALTER TABLE `descarte`
  MODIFY `idDescarte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `idLaboratorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  MODIFY `numeroDeSerie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `traslado`
--
ALTER TABLE `traslado`
  MODIFY `idTraslado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agentedesalud`
--
ALTER TABLE `agentedesalud`
  ADD CONSTRAINT `agentedesalud_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`);

--
-- Filtros para la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD CONSTRAINT `aplicacion_ibfk_1` FOREIGN KEY (`DNIPaciente`) REFERENCES `persona` (`DNI`),
  ADD CONSTRAINT `aplicacion_ibfk_3` FOREIGN KEY (`numeroDeSerie`) REFERENCES `loteinterno` (`numeroDeSerie`),
  ADD CONSTRAINT `aplicacion_ibfk_4` FOREIGN KEY (`DNIAgente`) REFERENCES `agentedesalud` (`DNI`);

--
-- Filtros para la tabla `descarte`
--
ALTER TABLE `descarte`
  ADD CONSTRAINT `descarte_ibfk_1` FOREIGN KEY (`numeroDeSerie`) REFERENCES `loteinterno` (`numeroDeSerie`),
  ADD CONSTRAINT `descarte_ibfk_2` FOREIGN KEY (`DNIAgente`) REFERENCES `agentedesalud` (`DNI`);

--
-- Filtros para la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  ADD CONSTRAINT `loteinterno_ibfk_1` FOREIGN KEY (`numeroDeLote`) REFERENCES `loteproveedor` (`numeroDeLote`),
  ADD CONSTRAINT `loteinterno_ibfk_2` FOREIGN KEY (`idLaboratorio`) REFERENCES `loteproveedor` (`idLaboratorio`),
  ADD CONSTRAINT `loteinterno_ibfk_3` FOREIGN KEY (`idDepositoNacional`) REFERENCES `depositonacional` (`idDepositoNacional`),
  ADD CONSTRAINT `loteinterno_ibfk_4` FOREIGN KEY (`idDepositoProvincial`) REFERENCES `depositoprovincial` (`idDepositoProvincial`),
  ADD CONSTRAINT `loteinterno_ibfk_5` FOREIGN KEY (`idCentroDeVacunacion`) REFERENCES `centrodevacunacion` (`idCentroDeVacunacion`);

--
-- Filtros para la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD CONSTRAINT `loteproveedor_ibfk_1` FOREIGN KEY (`idLaboratorio`) REFERENCES `laboratorio` (`idLaboratorio`);

--
-- Filtros para la tabla `patologiabase`
--
ALTER TABLE `patologiabase`
  ADD CONSTRAINT `patologiabase_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`);

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`);

--
-- Filtros para la tabla `traslado`
--
ALTER TABLE `traslado`
  ADD CONSTRAINT `traslado_ibfk_1` FOREIGN KEY (`idCentroDeVacunacion`) REFERENCES `centrodevacunacion` (`idCentroDeVacunacion`),
  ADD CONSTRAINT `traslado_ibfk_2` FOREIGN KEY (`numeroDeSerie`) REFERENCES `loteinterno` (`numeroDeSerie`);
--
-- Base de datos: `vacunatorio2`
--
DROP DATABASE IF EXISTS `vacunatorio2`;
CREATE DATABASE IF NOT EXISTS `vacunatorio2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vacunatorio2`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agentedesalud`
--

CREATE TABLE `agentedesalud` (
  `DNI` int(11) NOT NULL,
  `matricula` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `agentedesalud`
--

INSERT INTO `agentedesalud` (`DNI`, `matricula`) VALUES
(12345615, NULL),
(12345623, NULL),
(12345639, NULL),
(12345675, NULL),
(12345679, NULL),
(12600842, NULL),
(37716731, 10000000),
(12345603, 15935785),
(12345607, 15935786),
(12345611, 15935787),
(12345619, 15935789),
(12345627, 15935791),
(12345631, 15935792),
(12345635, 15935793),
(12345643, 15935795),
(12345647, 15935796),
(12345651, 15935797),
(12345655, 15935798),
(12345659, 15935799),
(12345663, 15935800),
(12345667, 15935801),
(12345671, 15935802),
(12345683, 15935805),
(12345687, 15935806),
(12345691, 15935807),
(12345695, 15935808),
(12345699, 15935809);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion`
--

CREATE TABLE `aplicacion` (
  `idAplicacion` int(11) NOT NULL,
  `DNIPaciente` int(11) NOT NULL,
  `DNIAgente` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `fechaDeAplicacion` date NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `aplicacion`
--

INSERT INTO `aplicacion` (`idAplicacion`, `DNIPaciente`, `DNIAgente`, `numeroDeSerie`, `fechaDeAplicacion`, `activo`) VALUES
(1, 34229421, 12345695, 1, '2024-06-02', 1),
(2, 27013989, 12345695, 8, '2024-06-20', 1),
(3, 34229421, 12345695, 5, '2024-05-01', 1),
(4, 47669942, 12345695, 2, '2024-07-19', 1),
(5, 49221038, 12345695, 2, '2024-07-03', 1),
(6, 12345641, 12345695, 2, '2024-07-14', 1),
(7, 12345641, 12345695, 8, '2024-01-02', 1),
(8, 49221038, 12345695, 8, '2024-01-02', 1),
(9, 50479934, 12345695, 4, '2024-06-17', 1),
(10, 12345677, 12345695, 9, '2024-07-30', 1),
(11, 12345657, 12345695, 9, '2024-07-30', 1),
(12, 12345665, 12345695, 9, '2023-01-01', 1),
(13, 12345657, 12345695, 9, '2023-01-01', 1),
(14, 12345661, 12345695, 9, '2024-01-01', 1),
(15, 12345665, 12345695, 9, '2024-01-01', 1),
(16, 34229421, 12345695, 9, '2024-01-01', 1),
(17, 12345675, 12345695, 9, '2024-02-01', 1),
(18, 12345673, 12345695, 9, '2024-07-02', 1),
(19, 49221038, 12345695, 8, '2024-01-02', 1),
(20, 12345661, 12345695, 8, '2024-01-01', 1),
(21, 12345669, 12345695, 8, '2024-01-01', 1),
(22, 12345661, 12345695, 8, '2024-01-01', 1),
(23, 12345661, 12345695, 4, '2024-08-01', 1),
(24, 12345657, 12345695, 10, '2024-06-01', 1),
(25, 12345661, 12345695, 10, '2024-08-01', 1),
(26, 12345665, 12345695, 1, '2024-07-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centrodevacunacion`
--

CREATE TABLE `centrodevacunacion` (
  `idCentroDeVacunacion` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `localidad` varchar(255) NOT NULL,
  `provincia` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `centrodevacunacion`
--

INSERT INTO `centrodevacunacion` (`idCentroDeVacunacion`, `direccion`, `localidad`, `provincia`, `activo`) VALUES
(1, 'La Cruz 301', 'La Ribera', 'San Luis', 1),
(2, 'Los Medicos 1587', 'Las Mojarras', 'Catamarca', 1),
(3, 'Sargento Cabral 203', 'Los Molinos', 'Córdoba', 1),
(4, 'Calle Falsa 123', 'Rafael Calzada', 'Buenos Aires', 1),
(5, 'Avenida Siempreviva 742', 'Villa San Miguel', 'Córdoba', 1),
(6, 'Callejón Diagon Alley 4', 'Las Rosas', 'Santa Fe', 1),
(7, 'Boulevard de los Sueños Rotos 100', '4ta Sección', 'Mendoza', 1),
(8, 'Avenida de Mayo 1200', 'Resistencia', 'Chaco', 1),
(9, 'Pasaje del Terror 666', 'Corrientes', 'Corrientes', 1),
(10, 'Calle del Sol 111', 'Pindapoy', 'Misiones', 1),
(11, 'Ruta 40 Km 400', 'Las Talas', 'San Juan', 1),
(12, 'Calle de las Estrellas 10', 'Diamante', 'Entre Ríos', 1),
(13, 'Avenida del Libertador 8500', 'Salta', 'Salta', 1),
(14, 'Pasaje de los Sueños 99', 'La Florida', 'Tucumán', 1),
(15, 'Calle de la Amistad 55', 'Los Nogales', 'Jujuy', 1),
(16, 'Boulevard del Parque 300', 'La Ribera', 'San Luis', 1),
(17, 'Calle de la Paz 1', 'Las Mojarras', 'Catamarca', 1),
(18, 'Avenida de las Palmeras 120', 'Fortín Soledad', 'Formosa', 1),
(19, 'Calle de los Vientos 500', 'Barrio Castelli', 'Chubut', 1),
(20, 'Avenida de los Tilos 600', 'Mariano Moreno', 'Neuquén', 1),
(21, 'Boulevard del Mar 800', 'Jaramillo', 'Santa Cruz', 1),
(22, 'Calle de las Flores 70', 'Machigasta', 'La Rioja', 1),
(23, 'Pasaje de los Poetas 150', 'El Alamito', 'Catamarca', 1),
(24, 'Calle de los Sueños 99', 'Puerto Argentino', 'Tierra del Fuego, Antártida e Islas del Atlántico Sur', 1),
(25, 'Avenida de los Próceres 1400', 'Cinco Saltos', 'Río Negro', 1),
(26, 'Calle de las Nubes 200', 'Malbrán', 'Santiago del Estero', 1),
(27, 'Av. de los Libertadores 1500', 'Don Orione', 'Buenos Aires', 1),
(28, 'Calle de los Aromos 120', 'Las Quintas', 'Córdoba', 1),
(29, 'Pasaje de los Cedros 130', 'Bouquet', 'Santa Fe', 1),
(30, 'Calle de los Pinos 140', '3ra Sección', 'Mendoza', 1),
(31, 'Avenida del Estadio 1100', 'Concepción del Bermejo', 'Chaco', 1),
(32, 'Calle de los Andes 160', 'Tatacua', 'Corrientes', 1),
(33, 'Boulevard de los Héroes 500', 'San José', 'Misiones', 1),
(34, 'Calle de los Gigantes 170', 'Las Talas', 'San Juan', 1),
(35, 'Avenida del Centro 1200', 'Concordia', 'Entre Ríos', 1),
(36, 'Calle de las Almas 180', 'Colonia Santa Rosa', 'Salta', 1),
(37, 'Pasaje del Amanecer 190', 'Famaillá', 'Tucumán', 1),
(38, 'Calle del Descanso 2', 'Libertador General San Martín', 'Jujuy', 1),
(39, 'Boulevard del Puente 400', 'Villa Mercedes', 'San Luis', 1),
(40, 'Calle del Refugio 3', 'Santa Rosa', 'La Pampa', 1),
(41, 'Avenida de las Brisas 500', 'Fortín Soledad', 'Formosa', 1),
(42, 'Calle de los Sauces 210', 'Kilómetro 3 - General Mosconi', 'Chubut', 1),
(43, 'Boulevard de los Arroyos 800', 'Mariano Moreno', 'Neuquén', 1),
(44, 'Calle de los Ríos 220', 'Caleta Olivia', 'Santa Cruz', 1),
(45, 'Avenida de las Lomas 600', 'Villa Unión', 'La Rioja', 1),
(46, 'Calle de los Cielos 230', 'Las Mojarras', 'Catamarca', 1),
(47, 'Pasaje del Bosque 240', 'Ushuaia', 'Tierra del Fuego, Antártida e Islas del Atlántico Sur', 1),
(48, 'Calle del Silencio 1', 'Cipolletti', 'Río Negro', 1),
(49, 'Avenida del Norte 250', 'Casares', 'Santiago del Estero', 1),
(50, 'Calle de los Poetas 99', 'Claypole', 'Buenos Aires', 1),
(51, 'Boulevard del Faro 700', 'Los Molinos', 'Córdoba', 1),
(52, 'Calle de las Rosas 260', 'Presidente Roca', 'Santa Fe', 1),
(53, 'Avenida de los Abedules 1400', '1ra Sección', 'Mendoza', 1),
(54, 'Pasaje del Mirador 270', 'Isla del Cerrito', 'Chaco', 1),
(55, 'Calle de los Álamos 280', 'Bella Vista', 'Corrientes', 1),
(56, 'Boulevard de los Lagos 800', 'Apóstoles', 'Misiones', 1),
(57, 'Calle de los Suspiros 290', 'Las Talas', 'San Juan', 1),
(58, 'Avenida del Sol 300', 'Benito Legerén', 'Entre Ríos', 1),
(59, 'Calle de los Sueños 310', 'San Carlos de Bariloche', 'Río Negro', 1),
(60, 'Pasaje de las Estrellas 320', 'Villa Recaste', 'Tucumán', 1),
(61, 'Calle del Alba 4', 'Aguas Calientes', 'Jujuy', 1),
(62, 'Boulevard del Monte 1000', 'El Chorrillo', 'San Luis', 1),
(63, 'Calle de los Encantos 330', 'Anzoátegui', 'La Pampa', 1),
(64, 'Avenida de los Arrayanes 500', 'Los Chiriguanos', 'Formosa', 1),
(65, 'Calle de los Nogales 340', 'Caleta Olivares', 'Chubut', 1),
(66, 'Boulevard de los Naranjos 800', 'Mariano Moreno', 'Neuquén', 1),
(67, 'Calle de los Cedros 350', 'Pico Truncado', 'Santa Cruz', 1),
(68, 'Avenida del Parque 1400', 'Anguinán', 'La Rioja', 1),
(69, 'Calle de los Tilos 360', 'Alto de las Juntas', 'Catamarca', 1),
(70, 'Pasaje de los Sueños 370', 'Río Grande', 'Tierra del Fuego, Antártida e Islas del Atlántico Sur', 1),
(71, 'Calle del Horizonte 10', 'Cipolletti', 'Río Negro', 1),
(72, 'Avenida de los Libros 380', 'Malbrán', 'Santiago del Estero', 1),
(73, 'Calle de los Poetas 99', 'Burzaco', 'Buenos Aires', 1),
(74, 'Boulevard del Arte 1400', 'Santa Rosa de Calamuchita', 'Córdoba', 1),
(75, 'Calle de las Colinas 390', 'Armstrong', 'Santa Fe', 1),
(76, 'Avenida de los Abedules 1500', 'Bermejo', 'Mendoza', 1),
(77, 'Pasaje de los Pinos 400', 'General Vedia', 'Chaco', 1),
(78, 'Calle de los Sauces 410', 'Corrientes', 'Corrientes', 1),
(79, 'Boulevard del Valle 800', 'Apóstoles', 'Misiones', 1),
(80, 'Calle de los Robles 420', 'La Rinconada', 'San Juan', 1),
(81, 'Avenida del Desierto 1300', 'Benito Legerén', 'Entre Ríos', 1),
(82, 'Calle de las Acacias 430', 'Colonia Santa Rosa', 'Salta', 1),
(83, 'Pasaje de las Flores 440', 'Alderetes', 'Tucumán', 1),
(84, 'Calle de los Cedros 11', 'Palpalá', 'Jujuy', 1),
(85, 'Boulevard del Lago 1100', 'Cerro Colorado', 'San Luis', 1),
(86, 'Calle de los Nogales 450', 'Anguil', 'La Pampa', 1),
(87, 'Avenida del Jardín 600', 'Bartolomé de las Casas', 'Formosa', 1),
(88, 'Calle de los Álamos 460', 'Acceso Norte', 'Chubut', 1),
(89, 'Boulevard del Campo 800', 'Aguada San Roque', 'Neuquén', 1),
(90, 'Calle de los Sauces 470', 'Puerto Deseado', 'Santa Cruz', 1),
(91, 'Avenida del Norte 1500', 'Aimogasta', 'La Rioja', 1),
(92, 'Calle de los Encinos 480', 'Aconquija', 'Catamarca', 1),
(93, 'Pasaje de los Ríos 490', 'Adrogué', 'Buenos Aires', 1),
(94, 'Calle del Refugio 20', 'Bahía Creek', 'Río Negro', 1),
(95, 'Avenida del Este 500', 'Campo Gallo', 'Santiago del Estero', 1),
(96, 'Calle de las Letras 99', 'Adrogué', 'Buenos Aires', 1),
(97, 'Bv de los Encantos 1400', 'La Floresta', 'Córdoba', 1),
(98, 'Calle de las Maravillas 510', 'Armstrong', 'Santa Fe', 1),
(99, 'Avenida del Norte 1600', '10ma Sección', 'Mendoza', 1),
(100, 'Pasaje de los Sueños 520', 'Concepción del Bermejo', 'Chaco', 1),
(101, 'Calle de los Robles 530', 'Bella Vista', 'Corrientes', 1),
(102, 'Boulevard del Sol 800', 'Apóstoles', 'Misiones', 1),
(103, 'Calle de los Cedros 540', 'La Rinconada', 'San Juan', 1),
(104, 'San Martin 132', 'Retiro', 'Ciudad Autónoma de Buenos Aires', 0),
(105, 'San Morales 321', 'Constitución', 'Ciudad Autónoma de Buenos Aires', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositonacional`
--

CREATE TABLE `depositonacional` (
  `idDepositoNacional` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `provincia` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `depositonacional`
--

INSERT INTO `depositonacional` (`idDepositoNacional`, `direccion`, `provincia`, `activo`) VALUES
(1, 'Colorado 5789', 'La Rioja', 1),
(2, 'Río Bamba 339', 'Santa Fe', 1),
(3, 'Colombia 2536', 'Santa Cruz', 1),
(4, 'Calle Falsa 123', 'Buenos Aires', 1),
(5, 'Avenida Siempreviva 742', 'Córdoba', 1),
(6, 'Callejón Diagon Alley 4', 'Santa Fe', 1),
(7, 'Boulevard de los Sueños Rotos 100', 'Mendoza', 1),
(8, 'Avenida de Mayo 1200', 'Chaco', 1),
(9, 'Pasaje del Terror 666', 'Corrientes', 1),
(10, 'Calle del Sol 111', 'Misiones', 1),
(11, 'Ruta 40 Km 400', 'San Juan', 1),
(12, 'Calle de las Estrellas 10', 'Entre Ríos', 1),
(13, 'Avenida del Libertador 8500', 'Salta', 1),
(14, 'Pasaje de los Sueños 99', 'Tucumán', 1),
(15, 'Calle de la Amistad 55', 'Jujuy', 1),
(16, 'Boulevard del Parque 300', 'San Luis', 1),
(17, 'Calle de la Paz 1', 'La Pampa', 1),
(18, 'Avenida de las Palmeras 120', 'Formosa', 1),
(19, 'Calle de los Vientos 500', 'Chubut', 1),
(20, 'Avenida de los Tilos 600', 'Neuquén', 1),
(21, 'Boulevard del Mar 800', 'Santa Cruz', 1),
(22, 'Calle de las Flores 70', 'La Rioja', 1),
(23, 'Pasaje de los Poetas 150', 'Catamarca', 1),
(24, 'Calle de los Sueños 99', 'Tierra del Fuego', 1),
(25, 'Avenida de los Próceres 1400', 'Río Negro', 1),
(26, 'Calle de las Nubes 200', 'Santiago del Estero', 1),
(27, 'Avenida de los Libertadores 1500', 'Buenos Aires', 1),
(28, 'Calle de los Aromos 120', 'Córdoba', 1),
(29, 'Pasaje de los Cedros 130', 'Santa Fe', 1),
(30, 'Calle de los Pinos 140', 'Mendoza', 1),
(31, 'Avenida del Estadio 1100', 'Chaco', 1),
(32, 'Calle de los Andes 160', 'Corrientes', 1),
(33, 'Boulevard de los Héroes 500', 'Misiones', 1),
(34, 'Calle de los Gigantes 170', 'San Juan', 1),
(35, 'Avenida del Centro 1200', 'Entre Ríos', 1),
(36, 'Calle de las Almas 180', 'Salta', 1),
(37, 'Pasaje del Amanecer 190', 'Tucumán', 1),
(38, 'Calle del Descanso 2', 'Jujuy', 1),
(39, 'Boulevard del Puente 400', 'San Luis', 1),
(40, 'Calle del Refugio 3', 'La Pampa', 1),
(41, 'Avenida de las Brisas 500', 'Formosa', 1),
(42, 'Calle de los Sauces 210', 'Chubut', 1),
(43, 'Boulevard de los Arroyos 800', 'Neuquén', 1),
(44, 'Calle de los Ríos 220', 'Santa Cruz', 1),
(45, 'Avenida de las Lomas 600', 'La Rioja', 1),
(46, 'Calle de los Cielos 230', 'Catamarca', 1),
(47, 'Pasaje del Bosque 240', 'Tierra del Fuego', 1),
(48, 'Calle del Silencio 1', 'Río Negro', 1),
(49, 'Avenida del Norte 250', 'Santiago del Estero', 1),
(50, 'Calle de los Poetas 99', 'Buenos Aires', 1),
(51, 'Boulevard del Faro 700', 'Córdoba', 1),
(52, 'Calle de las Rosas 260', 'Santa Fe', 1),
(53, 'Avenida de los Abedules 1400', 'Mendoza', 1),
(54, 'Pasaje del Mirador 270', 'Chaco', 1),
(55, 'Calle de los Álamos 280', 'Corrientes', 1),
(56, 'Boulevard de los Lagos 800', 'Misiones', 1),
(57, 'Calle de los Suspiros 290', 'San Juan', 1),
(58, 'Avenida del Sol 300', 'Entre Ríos', 1),
(59, 'Calle de los Sueños 310', 'Salta', 1),
(60, 'Pasaje de las Estrellas 320', 'Tucumán', 1),
(61, 'Calle del Alba 4', 'Jujuy', 1),
(62, 'Boulevard del Monte 1000', 'San Luis', 1),
(63, 'Calle de los Encantos 330', 'La Pampa', 1),
(64, 'Avenida de los Arrayanes 500', 'Formosa', 1),
(65, 'Calle de los Nogales 340', 'Chubut', 1),
(66, 'Boulevard de los Naranjos 800', 'Neuquén', 1),
(67, 'Calle de los Cedros 350', 'Santa Cruz', 1),
(68, 'Avenida del Parque 1400', 'La Rioja', 1),
(69, 'Calle de los Tilos 360', 'Catamarca', 1),
(70, 'Pasaje de los Sueños 370', 'Tierra del Fuego', 1),
(71, 'Calle del Horizonte 10', 'Río Negro', 1),
(72, 'Avenida de los Libros 380', 'Santiago del Estero', 1),
(73, 'Calle de los Poetas 99', 'Buenos Aires', 1),
(74, 'Boulevard del Arte 1400', 'Córdoba', 1),
(75, 'Calle de las Colinas 390', 'Santa Fe', 1),
(76, 'Avenida de los Abedules 1500', 'Mendoza', 1),
(77, 'Pasaje de los Pinos 400', 'Chaco', 1),
(78, 'Calle de los Sauces 410', 'Corrientes', 1),
(79, 'Boulevard del Valle 800', 'Misiones', 1),
(80, 'Calle de los Robles 420', 'San Juan', 1),
(81, 'Avenida del Desierto 1300', 'Entre Ríos', 1),
(82, 'Calle de las Acacias 430', 'Salta', 1),
(83, 'Pasaje de las Flores 440', 'Tucumán', 1),
(84, 'Calle de los Cedros 11', 'Jujuy', 1),
(85, 'Boulevard del Lago 1100', 'San Luis', 1),
(86, 'Calle de los Nogales 450', 'La Pampa', 1),
(87, 'Avenida del Jardín 600', 'Formosa', 1),
(88, 'Calle de los Álamos 460', 'Chubut', 1),
(89, 'Boulevard del Campo 800', 'Neuquén', 1),
(90, 'Calle de los Sauces 470', 'Santa Cruz', 1),
(91, 'Avenida del Norte 1500', 'La Rioja', 1),
(92, 'Calle de los Encinos 480', 'Catamarca', 1),
(93, 'Pasaje de los Ríos 490', 'Tierra del Fuego', 1),
(94, 'Calle del Refugio 20', 'Río Negro', 1),
(95, 'Avenida del Este 500', 'Santiago del Estero', 1),
(96, 'Calle de las Letras 99', 'Buenos Aires', 1),
(97, 'Boulevard de los Encantos 1400', 'Córdoba', 1),
(98, 'Calle de las Maravillas 510', 'Santa Fe', 1),
(99, 'Avenida del Norte 1600', 'Mendoza', 1),
(100, 'Pasaje de los Sueños 520', 'Chaco', 1),
(101, 'Calle de los Robles 530', 'Corrientes', 1),
(102, 'Boulevard del Sol 800', 'Misiones', 1),
(103, 'Calle de los Cedros 540', 'San Juan', 1),
(104, 'San Martin 1324', 'Ciudad Autónoma de Buenos Aires', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositoprovincial`
--

CREATE TABLE `depositoprovincial` (
  `idDepositoProvincial` int(11) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `provincia` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `depositoprovincial`
--

INSERT INTO `depositoprovincial` (`idDepositoProvincial`, `direccion`, `provincia`, `activo`) VALUES
(1, 'Guatemala 512', 'Entre Ríos', 1),
(2, 'Perú 1020', 'Chubut', 1),
(3, 'Calle de la Paz 200', 'Buenos Aires', 1),
(4, 'Avenida de Mayo 300', 'Córdoba', 1),
(5, 'Boulevard de los Andes 400', 'Santa Fe', 1),
(6, 'Pasaje del Sol 500', 'Mendoza', 1),
(7, 'Calle de la Independencia 600', 'Tucumán', 1),
(8, 'Avenida de los Libres 700', 'La Plata', 1),
(9, 'Calle de las Flores 800', 'Chaco', 1),
(10, 'Boulevard del Parque 900', 'Corrientes', 1),
(11, 'Calle del Norte 1000', 'Misiones', 1),
(12, 'Avenida del Valle 1100', 'San Juan', 1),
(13, 'Calle de los Lagos 1200', 'Formosa', 1),
(14, 'Pasaje de los Pinos 1300', 'Neuquén', 1),
(15, 'Avenida de los Cerros 1400', 'Salta', 1),
(16, 'Calle de los Aromos 1500', 'Jujuy', 1),
(17, 'Boulevard de los Álamos 1600', 'Río Negro', 1),
(18, 'Calle de los Nogales 1700', 'Santa Cruz', 1),
(19, 'Avenida de los Tilos 1800', 'Tierra del Fuego', 1),
(20, 'Calle de los Sauces 1900', 'Catamarca', 1),
(21, 'Boulevard del Río 2000', 'La Rioja', 1),
(22, 'Calle de los Cipreses 2100', 'Entre Ríos', 1),
(23, 'Avenida del Bosque 2200', 'Santiago del Estero', 1),
(24, 'Calle de los Jacarandás 2300', 'San Luis', 1),
(25, 'Boulevard del Litoral 2400', 'La Pampa', 1),
(26, 'Calle de los Robles 2500', 'Chubut', 1),
(27, 'Avenida del Estero 2600', 'San Juan', 1),
(28, 'Calle del Lago 2700', 'Formosa', 1),
(29, 'Boulevard de las Rosas 2800', 'Río Negro', 1),
(30, 'Calle de los Álamos 2900', 'Santa Cruz', 1),
(31, 'Avenida de los Tilos 3000', 'Tierra del Fuego', 1),
(32, 'Calle de los Pinos 3100', 'Catamarca', 1),
(33, 'Boulevard del Norte 3200', 'La Rioja', 1),
(34, 'Calle del Sur 3300', 'Entre Ríos', 1),
(35, 'Avenida del Sol 3400', 'Santiago del Estero', 1),
(36, 'Calle del Sol 3500', 'San Luis', 1),
(37, 'Boulevard del Este 3600', 'La Pampa', 1),
(38, 'Calle del Oeste 3700', 'Chubut', 1),
(39, 'Avenida del Norte 3800', 'Salta', 1),
(40, 'Calle del Centro 3900', 'Jujuy', 1),
(41, 'Boulevard del Oeste 4000', 'Neuquén', 1),
(42, 'Calle del Este 4100', 'Chaco', 1),
(43, 'Avenida del Centro 4200', 'Corrientes', 1),
(44, 'Calle del Norte 4300', 'Misiones', 1),
(45, 'Boulevard del Sur 4400', 'San Juan', 1),
(46, 'Calle del Este 4500', 'Formosa', 1),
(47, 'Avenida del Oeste 4600', 'Río Negro', 1),
(48, 'Calle del Oeste 4700', 'Santa Cruz', 1),
(49, 'Boulevard del Norte 4800', 'Tierra del Fuego', 1),
(50, 'Calle del Sur 4900', 'Catamarca', 1),
(51, 'Avenida del Este 5000', 'La Rioja', 1),
(52, 'Calle del Norte 5100', 'Entre Ríos', 1),
(53, 'Boulevard del Sol 5200', 'Santiago del Estero', 1),
(54, 'Calle del Sol 5300', 'San Luis', 1),
(55, 'Avenida del Este 5400', 'La Pampa', 1),
(56, 'Calle del Oeste 5500', 'Chubut', 1),
(57, 'Boulevard del Norte 5600', 'Salta', 1),
(58, 'Calle del Centro 5700', 'Jujuy', 1),
(59, 'Avenida del Este 5800', 'Neuquén', 1),
(60, 'Calle del Oeste 5900', 'Chaco', 1),
(61, 'Boulevard del Norte 6000', 'Corrientes', 1),
(62, 'Calle del Sur 6100', 'Misiones', 1),
(63, 'Avenida del Centro 6200', 'San Juan', 1),
(64, 'Calle del Norte 6300', 'Formosa', 1),
(65, 'Boulevard del Oeste 6400', 'Río Negro', 1),
(66, 'Calle del Este 6500', 'Santa Cruz', 1),
(67, 'Avenida del Norte 6600', 'Tierra del Fuego', 1),
(68, 'Calle del Sur 6700', 'Catamarca', 1),
(69, 'Boulevard del Este 6800', 'La Rioja', 1),
(70, 'Calle del Norte 6900', 'Entre Ríos', 1),
(71, 'Avenida del Sol 7000', 'Santiago del Estero', 1),
(72, 'Calle del Sol 7100', 'San Luis', 1),
(73, 'Boulevard del Este 7200', 'La Pampa', 1),
(74, 'Calle del Oeste 7300', 'Chubut', 1),
(75, 'Avenida del Norte 7400', 'Salta', 1),
(76, 'Calle del Centro 7500', 'Jujuy', 1),
(77, 'Boulevard del Oeste 7600', 'Neuquén', 1),
(78, 'Calle del Este 7700', 'Chaco', 1),
(79, 'Avenida del Centro 7800', 'Corrientes', 1),
(80, 'Calle del Norte 7900', 'Misiones', 1),
(81, 'Boulevard del Sur 8000', 'San Juan', 1),
(82, 'Calle del Este 8100', 'Formosa', 1),
(83, 'Avenida del Oeste 8200', 'Río Negro', 1),
(84, 'Calle del Oeste 8300', 'Santa Cruz', 1),
(85, 'Boulevard del Norte 8400', 'Tierra del Fuego', 1),
(86, 'Calle del Sur 8500', 'Catamarca', 1),
(87, 'Avenida del Este 8600', 'La Rioja', 1),
(88, 'Calle del Norte 8700', 'Entre Ríos', 1),
(89, 'Boulevard del Sol 8800', 'Santiago del Estero', 1),
(90, 'Calle del Sol 8900', 'San Luis', 1),
(91, 'Avenida del Este 9000', 'La Pampa', 1),
(92, 'Calle del Oeste 9100', 'Chubut', 1),
(93, 'Boulevard del Norte 9200', 'Salta', 1),
(94, 'Calle del Centro 9300', 'Jujuy', 1),
(95, 'Avenida del Este 9400', 'Neuquén', 1),
(96, 'Calle del Oeste 9500', 'Chaco', 1),
(97, 'Boulevard del Norte 9600', 'Corrientes', 1),
(98, 'Calle del Sur 9700', 'Misiones', 1),
(99, 'Avenida del Centro 9800', 'San Juan', 1),
(100, 'Calle del Norte 9900', 'Formosa', 1),
(101, 'Boulevard del Oeste 10000', 'Río Negro', 1),
(102, 'Calle del Este 10100', 'Santa Cruz', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descarte`
--

CREATE TABLE `descarte` (
  `idDescarte` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `empresaDescartante` varchar(255) NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `cantidadDeVacunas` int(11) NOT NULL,
  `fechaDeDescarte` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `descarte`
--

INSERT INTO `descarte` (`idDescarte`, `idUsuario`, `numeroDeSerie`, `empresaDescartante`, `motivo`, `cantidadDeVacunas`, `fechaDeDescarte`) VALUES
(2, 3, 9, 'Veolia', 'Rotura', 10, '2024-05-10'),
(3, 4, 1, 'Stericycle', 'Contaminación', 20, '2024-06-15'),
(4, 5, 8, 'Clean Harbors', 'Vencida', 30, '2024-07-02'),
(6, 4, 9, 'Waste Management', 'Rotura', 29, '2024-07-02'),
(7, 5, 1, 'Veolia', 'Vencida', 20, '2024-07-09'),
(8, 4, 9, 'Clean Harbors', 'Rotura', 23, '2024-07-01'),
(9, 3, 8, 'Clean Harbors', 'Pérdida de frío', 13, '2024-07-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `idLaboratorio` int(11) NOT NULL,
  `nombreLaboratorio` varchar(255) NOT NULL,
  `pais` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `longitud` double NOT NULL,
  `latitud` double NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `laboratorio`
--

INSERT INTO `laboratorio` (`idLaboratorio`, `nombreLaboratorio`, `pais`, `email`, `telefono`, `longitud`, `latitud`, `activo`) VALUES
(1, 'Johnnson', 'Argentina', 'long.eze7773@gmail.com', '0111532184', -66.309325, -33.279181, 1),
(2, 'Bago', 'Argentina', 'bayerargentina@gmail.com', '1159487659', -58.392334, -34.633208, 1),
(3, 'Pampa', 'Argentina', 'pampargentina@gmail.com', '1234445678', -66.319155, -33.292288, 1),
(4, 'Saturno', 'Argentina', 'a@gm.com', '1234567890', -66.319155, -33.292288, 1),
(5, 'Pfizer', 'Estados Unidos', 'contacto@pfizer.com', '11234567890', -73.935242, 40.73061, 1),
(6, 'Moderna', 'Estados Unidos', 'info@moderna.com', '12345678901', -71.05888, 42.360082, 1),
(7, 'AstraZeneca', 'Reino Unido', 'contact@astrazeneca.com', '442073657800', -0.127758, 51.507351, 1),
(8, 'Sinovac', 'China', 'info@sinovac.com', '861067883600', 116.407396, 39.9042, 1),
(9, 'Johnson & Johnson', 'Estados Unidos', 'contact@jnj.com', '18005263967', -74.006015, 40.712776, 1),
(10, 'Novavax', 'Estados Unidos', 'info@novavax.com', '13015562700', -76.938209, 38.992084, 1),
(11, 'BioNTech', 'Alemania', 'info@biontech.de', '49613190840', 8.682127, 50.110924, 1),
(12, 'CureVac', 'Alemania', 'info@curevac.com', '49707198830', 9.17702, 48.78232, 1),
(13, 'Sanofi', 'Francia', 'contact@sanofi.com', '33153774000', 2.352222, 48.856614, 1),
(14, 'GSK', 'Reino Unido', 'info@gsk.com', '442080475000', -0.127758, 51.507351, 1),
(15, 'Merck', 'Estados Unidos', 'contact@merck.com', '19087404000', -74.442393, 40.794717, 1),
(16, 'Roche', 'Suiza', 'info@roche.com', '41616881111', 7.588576, 47.559599, 1),
(17, 'Bayer', 'Alemania', 'contact@bayer.com', '49214301', 7.098207, 50.942155, 1),
(18, 'Lilly', 'Estados Unidos', 'info@lilly.com', '13172762000', -86.158068, 39.768403, 1),
(19, 'AbbVie', 'Estados Unidos', 'contact@abbvie.com', '18479327900', -87.629798, 41.878114, 0),
(20, 'Regeneron', 'Estados Unidos', 'info@regeneron.com', '19148477000', -73.687894, 41.05343, 1),
(21, 'Gilead', 'Estados Unidos', 'contact@gilead.com', '16505743000', -122.271114, 37.804364, 1),
(22, 'Amgen', 'Estados Unidos', 'info@amgen.com', '18054471000', -118.491191, 34.019454, 1),
(23, 'ModernaTX', 'Estados Unidos', 'info@modernatx.com', '16177146500', -71.05888, 42.360082, 1),
(24, 'Inovio', 'Estados Unidos', 'contact@inovio.com', '12674404200', -75.165222, 39.952584, 1),
(25, 'Medicago', 'Canadá', 'info@medicago.com', '14186589393', -71.217556, 46.813878, 1),
(26, 'Arcturus', 'Estados Unidos', 'contact@arcturus.com', '18589002660', -117.161087, 32.715738, 1),
(27, 'Dynavax', 'Estados Unidos', 'info@dynavax.com', '15108485100', -122.271114, 37.804364, 1),
(28, 'Vaxart', 'Estados Unidos', 'contact@vaxart.com', '16505503500', -122.419416, 37.774929, 1),
(29, 'Zydus', 'India', 'info@zydus.com', '917926868100', 72.571362, 23.022505, 1),
(30, 'Serum Institute', 'India', 'contact@seruminstitute.com', '912026609000', 73.856744, 18.52043, 1),
(31, 'Valneva', 'Francia', 'info@valneva.com', '33228073710', 2.352222, 48.856614, 1),
(32, 'Gamaleia', 'Rusia', 'contact@gamaleia.ru', '74959411535', 37.6173, 55.755825, 1),
(33, 'Bharat Biotech', 'India', 'info@bharatbiotech.com', '914023480567', 78.486671, 17.385044, 1),
(34, 'Sinopharm', 'China', 'contact@sinopharm.com', '861082848888', 116.407396, 39.9042, 1),
(35, 'Cansino', 'China', 'info@cansinotech.com', '862258035000', 117.200983, 39.084158, 1),
(36, 'NovavaxUSA', 'Estados Unidos', 'info@novavaxusa.com', '13015562700', -76.938209, 38.992084, 1),
(37, 'MedicagoCAN', 'Canadá', 'info@medicagocan.com', '14186589393', -71.217556, 46.813878, 1),
(38, 'ArcturusTX', 'Estados Unidos', 'contact@arcturustx.com', '18589002660', -117.161087, 32.715738, 1),
(39, 'DynavaxCA', 'Estados Unidos', 'info@dynavaxca.com', '15108485100', -122.271114, 37.804364, 1),
(40, 'VaxartSF', 'Estados Unidos', 'contact@vaxartsf.com', '16505503500', -122.419416, 37.774929, 1),
(41, 'ZydusIN', 'India', 'info@zydusin.com', '917926868100', 72.571362, 23.022505, 1),
(42, 'SerumIN', 'India', 'contact@serumin.com', '912026609000', 73.856744, 18.52043, 1),
(43, 'ValnevaFR', 'Francia', 'info@valnevafr.com', '33228073710', 2.352222, 48.856614, 1),
(44, 'GamaleiaRU', 'Rusia', 'contact@gamaleiaru.ru', '74959411535', 37.6173, 55.755825, 1),
(45, 'BharatIN', 'India', 'info@bharatin.com', '914023480567', 78.486671, 17.385044, 1),
(46, 'SinopharmCN', 'China', 'contact@sinopharmcn.com', '861082848888', 116.407396, 39.9042, 1),
(47, 'CansinoCN', 'China', 'info@cansinocn.com', '862258035000', 117.200983, 39.084158, 1),
(48, 'NovavaxTX', 'Estados Unidos', 'info@novavaxtx.com', '13015562700', -76.938209, 38.992084, 1),
(49, 'MedicagoQC', 'Canadá', 'info@medicagoqc.com', '14186589393', -71.217556, 46.813878, 1),
(50, 'ArcturusCA', 'Estados Unidos', 'contact@arcturusca.com', '18589002660', -117.161087, 32.715738, 1),
(51, 'DynavaxSF', 'Estados Unidos', 'info@dynavaxsf.com', '15108485100', -122.271114, 37.804364, 1),
(52, 'VaxartCA', 'Estados Unidos', 'contact@vaxartca.com', '16505503500', -122.419416, 37.774929, 1),
(53, 'ZydusHQ', 'India', 'info@zydushq.com', '917926868100', 72.571362, 23.022505, 1),
(54, 'SerumHQ', 'India', 'contact@serumhq.com', '912026609000', 73.856744, 18.52043, 1),
(55, 'ValnevaHQ', 'Francia', 'info@valnevahq.com', '33228073710', 2.352222, 48.856614, 1),
(56, 'GamaleiaHQ', 'Rusia', 'contact@gamaleiahq.ru', '74959411535', 37.6173, 55.755825, 1),
(57, 'BharatHQ', 'India', 'info@bharathq.com', '914023480567', 78.486671, 17.385044, 1),
(58, 'SinopharmHQ', 'China', 'contact@sinopharmhq.com', '861082848888', 116.407396, 39.9042, 1),
(59, 'CansinoHQ', 'China', 'info@cansinohq.com', '862258035000', 117.200983, 39.084158, 1),
(60, 'NovavaxHQ', 'Estados Unidos', 'info@novavaxhq.com', '13015562700', -76.938209, 38.992084, 1),
(61, 'MedicagoHQ', 'Canadá', 'info@medicagohq.com', '14186589393', -71.217556, 46.813878, 1),
(62, 'ArcturusHQ', 'Estados Unidos', 'contact@arcturushq.com', '18589002660', -117.161087, 32.715738, 1),
(63, 'DynavaxHQ', 'Estados Unidos', 'info@dynavaxhq.com', '15108485100', -122.271114, 37.804364, 1),
(64, 'VaxartHQ', 'Estados Unidos', 'contact@vaxarthq.com', '16505503500', -122.419416, 37.774929, 1),
(65, 'ZydusBio', 'India', 'info@zydusbio.com', '917926868100', 72.571362, 23.022505, 1),
(66, 'SerumBio', 'India', 'contact@serumbio.com', '912026609000', 73.856744, 18.52043, 1),
(67, 'ValnevaBio', 'Francia', 'info@valnevabio.com', '33228073710', 2.352222, 48.856614, 1),
(68, 'GamaleiaBio', 'Rusia', 'contact@gamaleiabio.ru', '74959411535', 37.6173, 55.755825, 1),
(69, 'BharatBio', 'India', 'info@bharatbio.com', '914023480567', 78.486671, 17.385044, 1),
(70, 'SinopharmBio', 'China', 'contact@sinopharmbio.com', '861082848888', 116.407396, 39.9042, 1),
(71, 'CansinoBio', 'China', 'info@cansinobio.com', '862258035000', 117.200983, 39.084158, 1),
(72, 'NovavaxBio', 'Estados Unidos', 'info@novavaxbio.com', '13015562700', -76.938209, 38.992084, 1),
(73, 'MedicagoBio', 'Canadá', 'info@medicagobio.com', '14186589393', -71.217556, 46.813878, 1),
(74, 'ArcturusBio', 'Estados Unidos', 'contact@arcturusbio.com', '18589002660', -117.161087, 32.715738, 1),
(75, 'DynavaxBio', 'Estados Unidos', 'info@dynavaxbio.com', '15108485100', -122.271114, 37.804364, 1),
(76, 'VaxartBio', 'Estados Unidos', 'contact@vaxartbio.com', '16505503500', -122.419416, 37.774929, 1),
(77, 'ZydusLabs', 'India', 'info@zyduslabs.com', '917926868100', 72.571362, 23.022505, 1),
(78, 'SerumLabs', 'India', 'contact@serumlabs.com', '912026609000', 73.856744, 18.52043, 1),
(79, 'ValnevaLabs', 'Francia', 'info@valnevalabs.com', '33228073710', 2.352222, 48.856614, 1),
(80, 'GamaleiaLabs', 'Rusia', 'contact@gamaleialabs.ru', '74959411535', 37.6173, 55.755825, 1),
(81, 'BharatLabs', 'India', 'info@bharatlabs.com', '914023480567', 78.486671, 17.385044, 1),
(82, 'SinopharmLabs', 'China', 'contact@sinopharmlabs.com', '861082848888', 116.407396, 39.9042, 1),
(83, 'CansinoLabs', 'China', 'info@cansinolabs.com', '862258035000', 117.200983, 39.084158, 1),
(84, 'NovavaxLabs', 'Estados Unidos', 'info@novavaxlabs.com', '13015562700', -76.938209, 38.992084, 1),
(85, 'MedicagoLabs', 'Canadá', 'info@medicagolabs.com', '14186589393', -71.217556, 46.813878, 1),
(86, 'ArcturusLabs', 'Estados Unidos', 'contact@arcturuslabs.com', '18589002660', -117.161087, 32.715738, 1),
(87, 'DynavaxLabs', 'Estados Unidos', 'info@dynavaxlabs.com', '15108485100', -122.271114, 37.804364, 1),
(88, 'VaxartLabs', 'Estados Unidos', 'contact@vaxartlabs.com', '16505503500', -122.419416, 37.774929, 1),
(89, 'ZydusResearch', 'India', 'info@zydusresearch.com', '917926868100', 72.571362, 23.022505, 1),
(90, 'SerumResearch', 'India', 'contact@serumresearch.com', '912026609000', 73.856744, 18.52043, 1),
(91, 'ValnevaResearch', 'Francia', 'info@valnevaresearch.com', '33228073710', 2.352222, 48.856614, 1),
(92, 'GamaleiaResearch', 'Rusia', 'contact@gamaleiaresearch.ru', '74959411535', 37.6173, 55.755825, 1),
(93, 'BharatResearch', 'India', 'info@bharatresearch.com', '914023480567', 78.486671, 17.385044, 1),
(94, 'SinopharmResearch', 'China', 'contact@sinopharmresearch.com', '861082848888', 116.407396, 39.9042, 1),
(95, 'CansinoResearch', 'China', 'info@cansinoresearch.com', '862258035000', 117.200983, 39.084158, 1),
(96, 'NovavaxResearch', 'Estados Unidos', 'info@novavaxresearch.com', '13015562700', -76.938209, 38.992084, 1),
(97, 'MedicagoResearch', 'Canadá', 'info@medicagoresearch.com', '14186589393', -71.217556, 46.813878, 1),
(98, 'ArcturusResearch', 'Estados Unidos', 'contact@arcturusresearch.com', '18589002660', -117.161087, 32.715738, 1),
(99, 'DynavaxResearch', 'Estados Unidos', 'info@dynavaxresearch.com', '15108485100', -122.271114, 37.804364, 1),
(100, 'VaxartResearch', 'Estados Unidos', 'contact@vaxartresearch.com', '16505503500', -122.419416, 37.774929, 1),
(101, 'Perez Compan', 'Reino Unido', 'pcru@gmail.com', '4555844521', -0.142822, 51.508742, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteinterno`
--

CREATE TABLE `loteinterno` (
  `numeroDeSerie` int(11) NOT NULL,
  `numeroDeLote` int(11) NOT NULL,
  `idLaboratorio` int(11) NOT NULL,
  `cantidadDeVacunasTotales` int(11) NOT NULL,
  `cantidadDeVacunasRestantes` int(11) NOT NULL,
  `fechaDeLlegadaDepositoNacional` date DEFAULT NULL,
  `idDepositoNacional` int(11) DEFAULT NULL,
  `fechaDeSalidaDepositoNacional` date DEFAULT NULL,
  `fechaDeLlegadaDepositoProvincial` date DEFAULT NULL,
  `idDepositoProvincial` int(11) DEFAULT NULL,
  `fechaDeSalidaDepositoProvincial` date DEFAULT NULL,
  `fechaDeLlegadaCentroDeVacunacion` date DEFAULT NULL,
  `idCentroDeVacunacion` int(11) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `loteinterno`
--

INSERT INTO `loteinterno` (`numeroDeSerie`, `numeroDeLote`, `idLaboratorio`, `cantidadDeVacunasTotales`, `cantidadDeVacunasRestantes`, `fechaDeLlegadaDepositoNacional`, `idDepositoNacional`, `fechaDeSalidaDepositoNacional`, `fechaDeLlegadaDepositoProvincial`, `idDepositoProvincial`, `fechaDeSalidaDepositoProvincial`, `fechaDeLlegadaCentroDeVacunacion`, `idCentroDeVacunacion`, `activo`) VALUES
(1, 1, 1, 50, 4, '2024-01-01', 1, '2024-02-01', '2024-03-01', 1, '2024-04-01', '2024-05-01', 2, 1),
(2, 5, 1, 50, 50, '2024-06-25', 2, '2024-06-26', '2024-06-27', 2, NULL, NULL, 103, 1),
(3, 2, 1, 50, 50, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(4, 2, 1, 50, 49, '2024-01-01', 2, '2024-02-01', '2024-03-01', 3, '2024-04-01', '2024-07-12', 95, 1),
(5, 4, 3, 50, 50, '2024-07-15', 2, '2024-07-16', '2024-07-17', 12, '2024-07-18', '2024-07-19', 2, 1),
(6, 1, 1, 50, 50, '2024-01-01', 1, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(7, 4, 3, 50, 50, '2024-01-01', 1, '2024-01-01', '2024-01-01', 1, NULL, NULL, NULL, 1),
(8, 2, 1, 123, 106, '2024-01-01', 1, '2024-01-01', '2024-01-01', 1, '2024-01-01', '2024-01-01', 103, 1),
(9, 1, 1, 123, 113, '2024-01-01', 1, '2024-01-01', '2024-01-01', 1, '2024-03-02', '2024-04-01', 102, 1),
(10, 1, 1, 10, 8, '2024-06-15', 2, '2024-02-02', '2024-03-03', 95, '2024-04-08', '2024-05-05', 2, 1),
(11, 6, 22, 10, 10, '2024-01-01', 94, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(12, 6, 22, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(13, 6, 22, 10, 10, '2024-01-01', 94, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(14, 6, 22, 10, 10, '2024-01-01', 100, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(15, 6, 22, 10, 10, '2024-01-01', 94, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(16, 6, 22, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(17, 6, 22, 10, 10, '2024-01-01', 100, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(18, 6, 22, 10, 10, '2024-01-01', 97, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(19, 6, 22, 10, 10, '2024-01-01', 97, NULL, NULL, 92, NULL, NULL, NULL, 1),
(20, 6, 22, 10, 10, '2024-01-01', 97, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(21, 7, 22, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(22, 8, 74, 15, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(23, 8, 74, 15, 15, '2024-01-01', 98, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(24, 8, 74, 15, 15, '2024-01-01', 93, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(25, 8, 74, 15, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(26, 8, 74, 15, 15, '2024-01-01', 98, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(27, 8, 74, 15, 15, '2024-01-01', 103, NULL, NULL, 100, NULL, NULL, NULL, 1),
(28, 8, 74, 15, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(29, 8, 74, 15, 15, '2024-01-01', 103, '2024-01-01', '2024-01-01', 98, NULL, NULL, NULL, 1),
(30, 8, 74, 15, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(31, 8, 74, 15, 15, '2024-01-01', 102, NULL, NULL, 100, NULL, NULL, NULL, 1),
(32, 8, 74, 15, 15, '2024-01-01', 103, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(33, 8, 74, 15, 15, '2024-01-01', 104, NULL, NULL, 100, NULL, NULL, 100, 1),
(34, 8, 74, 15, 15, '2024-01-01', 22, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(35, 8, 74, 15, 15, '2024-01-01', 96, NULL, NULL, 100, NULL, NULL, NULL, 1),
(36, 8, 74, 15, 15, '2024-01-01', 98, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(37, 8, 74, 15, 15, '2024-01-02', 103, '2024-01-01', '2024-01-01', 98, NULL, NULL, 99, 1),
(38, 8, 74, 15, 15, '2024-01-01', 104, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(39, 8, 74, 15, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(40, 8, 74, 15, 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(41, 8, 74, 15, 15, '2024-01-01', 104, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(42, 9, 26, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(43, 9, 26, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(44, 9, 26, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(45, 9, 26, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(46, 9, 26, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(47, 9, 26, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(48, 9, 26, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(49, 9, 26, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(50, 9, 26, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(51, 9, 26, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(52, 10, 26, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(53, 10, 26, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(54, 10, 26, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(55, 10, 26, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(56, 10, 26, 5, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(57, 11, 74, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(58, 11, 74, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(59, 11, 74, 10, 10, '2024-01-01', 103, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(60, 11, 74, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(61, 11, 74, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(62, 11, 74, 10, 10, '2024-01-01', 103, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(63, 11, 74, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(64, 11, 74, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(65, 11, 74, 10, 10, '2024-01-01', 103, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(66, 11, 74, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(67, 12, 26, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(68, 12, 26, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(69, 12, 26, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(70, 12, 26, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(71, 12, 26, 10, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteproveedor`
--

CREATE TABLE `loteproveedor` (
  `numeroDeLote` int(11) NOT NULL,
  `idLaboratorio` int(11) NOT NULL,
  `tipoDeVacuna` varchar(255) NOT NULL,
  `nombreComercial` varchar(255) NOT NULL,
  `cantidadDeLotesInternos` int(11) NOT NULL,
  `fechaDeFabricacion` date NOT NULL,
  `fechaDeCompra` date NOT NULL,
  `fechaDeVencimiento` date NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `loteproveedor`
--

INSERT INTO `loteproveedor` (`numeroDeLote`, `idLaboratorio`, `tipoDeVacuna`, `nombreComercial`, `cantidadDeLotesInternos`, `fechaDeFabricacion`, `fechaDeCompra`, `fechaDeVencimiento`, `activo`) VALUES
(1, 1, 'Tuberculosis', 'BCG', 500, '2024-02-01', '2024-02-11', '2024-05-10', 1),
(2, 1, 'Varicela', 'BCG', 500, '2024-01-01', '2024-01-01', '2029-02-03', 1),
(3, 2, 'Meningitis', 'BCG', 500, '2024-01-01', '2024-01-01', '2029-01-01', 1),
(4, 3, 'HPV', 'BCG', 550, '2024-01-01', '2024-01-01', '2029-01-02', 0),
(5, 3, 'Antigripal', 'Influenzae b', 320, '2023-11-23', '2024-01-01', '2028-11-23', 1),
(6, 22, 'Tuberculosis', 'BCG', 10, '2024-01-01', '2024-01-01', '2029-01-01', 1),
(7, 22, 'Tuberculosis', 'BCG', 1, '2024-01-01', '2024-01-01', '2029-01-01', 1),
(8, 74, 'HPV', 'Virus Papiloma Humano', 20, '2024-01-01', '2024-01-01', '2029-01-01', 1),
(9, 26, 'Tuberculosis', 'BCG', 10, '2024-01-01', '2024-01-01', '2029-01-01', 1),
(10, 26, 'Tuberculosis', 'BCG', 5, '2024-01-01', '2024-01-01', '2029-01-02', 1),
(11, 74, 'Tuberculosis', 'BCG', 10, '2024-01-01', '2024-01-01', '2029-01-01', 1),
(12, 26, 'Tuberculosis', 'BCG', 5, '2024-01-01', '2024-01-01', '2030-01-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patologiabase`
--

CREATE TABLE `patologiabase` (
  `DNI` int(11) NOT NULL,
  `patologiaBase` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `patologiabase`
--

INSERT INTO `patologiabase` (`DNI`, `patologiaBase`) VALUES
(12345601, 'Diabetes'),
(12345603, 'Hipertensión'),
(12345605, 'Asma'),
(12345607, 'Obesidad'),
(12345609, 'Alergia'),
(12345611, 'Enfermedad cardíaca'),
(12345613, 'Colesterol alto'),
(12345615, 'Diabetes'),
(12345617, 'Hipertensión'),
(12345619, 'Asma'),
(12345621, 'Obesidad'),
(12345623, 'Ninguna'),
(12345625, 'Enfermedad cardíaca'),
(12345627, 'Colesterol alto'),
(12345629, 'Diabetes'),
(12345631, 'Hipertensión'),
(12345633, 'Asma'),
(12345635, 'Obesidad'),
(12345637, 'Alergia'),
(12345639, 'Ninguna'),
(12345641, 'Colesterol alto'),
(12345643, 'Diabetes'),
(12345645, 'Hipertensión'),
(12345647, 'Asma'),
(12345649, 'Obesidad'),
(12345651, 'Alergia'),
(12345653, 'Enfermedad cardíaca'),
(12345655, 'Colesterol alto'),
(12345657, 'Diabetes'),
(12345659, 'Hipertensión'),
(12345661, 'Asma'),
(12345663, 'Obesidad'),
(12345665, 'Ninguna'),
(12345667, 'Enfermedad cardíaca'),
(12345669, 'Colesterol alto'),
(12345671, 'Diabetes'),
(12345673, 'Hipertensión'),
(12345675, 'Ninguna'),
(12345677, 'Obesidad'),
(12345679, 'Ninguna'),
(12345681, 'Enfermedad cardíaca'),
(12345683, 'Colesterol alto'),
(12345685, 'Diabetes'),
(12345687, 'Hipertensión'),
(12345689, 'Asma'),
(12345691, 'Obesidad'),
(12345693, 'Alergia'),
(12345695, 'Enfermedad cardíaca'),
(12345697, 'Colesterol alto'),
(12345699, 'Diabetes'),
(12600842, 'Enfermedad respiratorio cronica'),
(27013989, 'Ninguna'),
(34229421, 'Obesidad'),
(37716731, 'Ninguna'),
(47669942, 'Ninguna'),
(49221038, 'Ninguna'),
(50479934, 'Ninguna'),
(55012879, 'Enfermedad respiratorio cronica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `DNI` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fechaDeNacimiento` date NOT NULL,
  `ocupacion` varchar(255) NOT NULL,
  `genero` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `localidad` varchar(255) NOT NULL,
  `provincia` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`DNI`, `nombre`, `apellido`, `email`, `fechaDeNacimiento`, `ocupacion`, `genero`, `direccion`, `localidad`, `provincia`, `activo`) VALUES
(12345601, 'Ana', 'Gómez', 'ana.gomez01@example.com', '2011-03-15', 'Otro', 'Femenino', 'Calle Real 1', 'Las Talas', 'San Juan', 1),
(12345603, 'Juan', 'Pérez', 'juan.perez01@example.com', '1985-07-20', 'Agente de salud', 'Masculino', 'Av. Siempre Viva 1', 'Adrogué', 'Buenos Aires', 1),
(12345605, 'María', 'Fernández', 'maria.fernandez02@example.com', '2012-06-20', 'Otro', 'Femenino', 'Calle Falsa 2', 'Las Talas', 'San Juan', 1),
(12345607, 'Carlos', 'López', 'carlos.lopez01@example.com', '1980-05-10', 'Agente de salud', 'Masculino', 'San Martín 2', 'Mendoza', 'Mendoza', 1),
(12345609, 'Lucía', 'Martínez', 'lucia.martinez02@example.com', '2013-08-12', 'Otro', 'Femenino', 'Av. Mitre 2', 'Las Talas', 'San Juan', 1),
(12345611, 'Jorge', 'Rodríguez', 'jorge.rodriguez01@example.com', '1978-09-25', 'Agente de salud', 'Masculino', 'Calle Colon 2', 'Rosario', 'Santa Fe', 1),
(12345613, 'Valeria', 'González', 'valeria.gonzalez02@example.com', '2014-03-15', 'Otro', 'Femenino', 'Calle Real 3', 'Las Talas', 'San Juan', 1),
(12345615, 'Pedro', 'Suárez', 'pedro.suarez01@example.com', '1981-11-02', 'Otro', 'Masculino', 'Av. Siempre Viva 3', 'Las Talas', 'San Juan', 1),
(12345617, 'Laura', 'Ramírez', 'laura.ramirez02@example.com', '2015-12-20', 'Otro', 'Femenino', 'Calle Falsa 3', 'Las Talas', 'San Juan', 1),
(12345619, 'Ricardo', 'Hernández', 'ricardo.hernandez01@example.com', '1983-01-20', 'Agente de salud', 'Masculino', 'San Martín 3', 'La Plata', 'Buenos Aires', 1),
(12345621, 'Sofía', 'Torres', 'sofia.torres02@example.com', '2016-04-18', 'Otro', 'Femenino', 'Av. Mitre 3', 'Las Talas', 'San Juan', 1),
(12345623, 'Miguel', 'Álvarez', 'miguel.alvarez01@example.com', '1979-06-30', 'Otro', 'Masculino', 'Calle Colon 3', 'Las Talas', 'San Juan', 1),
(12345625, 'Marta', 'Molina', 'marta.molina02@example.com', '2017-05-09', 'Otro', 'Femenino', 'Calle Real 4', 'Las Talas', 'San Juan', 1),
(12345627, 'Héctor', 'Luna', 'hector.luna01@example.com', '1987-12-25', 'Agente de salud', 'Masculino', 'Av. Siempre Viva 4', 'Mendoza', 'Mendoza', 1),
(12345629, 'Natalia', 'Reyes', 'natalia.reyes02@example.com', '2018-07-17', 'Otro', 'Femenino', 'Calle Falsa 4', 'Las Talas', 'San Juan', 1),
(12345631, 'Luis', 'Acosta', 'luis.acosta01@example.com', '1982-03-15', 'Agente de salud', 'Masculino', 'San Martín 4', 'Rosario', 'Santa Fe', 1),
(12345633, 'Andrea', 'Díaz', 'andrea.diaz02@example.com', '2019-02-20', 'Otro', 'Femenino', 'Av. Mitre 4', 'Las Talas', 'San Juan', 1),
(12345635, 'Emilio', 'Cruz', 'emilio.cruz01@example.com', '1988-11-01', 'Agente de salud', 'Masculino', 'Calle Colon 4', 'Buenos Aires', 'Buenos Aires', 1),
(12345637, 'Gabriela', 'Ortiz', 'gabriela.ortiz02@example.com', '2020-06-11', 'Otro', 'Femenino', 'Calle Real 5', 'Las Talas', 'San Juan', 1),
(12345639, 'Federico', 'Santos', 'federico.santos01@example.com', '1989-09-21', 'Otro', 'Masculino', 'Av. Siempre Viva 5', 'Las Talas', 'San Juan', 1),
(12345641, 'Patricia', 'Castro', 'patricia.castro02@example.com', '2021-12-22', 'Otro', 'Femenino', 'Calle Falsa 5', 'Las Talas', 'San Juan', 1),
(12345643, 'Martín', 'Ramos', 'martin.ramos01@example.com', '1980-05-10', 'Agente de salud', 'Masculino', 'San Martín 5', 'Córdoba', 'Córdoba', 1),
(12345645, 'Carolina', 'Blanco', 'carolina.blanco02@example.com', '2022-07-30', 'Otro', 'Femenino', 'Av. Mitre 5', 'Las Talas', 'San Juan', 1),
(12345647, 'Diego', 'Mejía', 'diego.mejia01@example.com', '1981-11-25', 'Agente de salud', 'Masculino', 'Calle Colon 5', 'Mendoza', 'Mendoza', 1),
(12345649, 'Fernanda', 'Guzmán', 'fernanda.guzman02@example.com', '2023-02-20', 'Otro', 'Femenino', 'Calle Real 6', 'Las Talas', 'San Juan', 1),
(12345651, 'Ramiro', 'Ruiz', 'ramiro.ruiz01@example.com', '1984-01-19', 'Agente de salud', 'Masculino', 'Av. Siempre Viva 6', 'Rosario', 'Santa Fe', 1),
(12345653, 'Elena', 'Herrera', 'elena.herrera02@example.com', '2010-12-15', 'Otro', 'Femenino', 'Calle Falsa 6', 'Las Talas', 'San Juan', 1),
(12345655, 'Pablo', 'Moreno', 'pablo.moreno01@example.com', '1986-08-10', 'Agente de salud', 'Masculino', 'San Martín 6', 'Buenos Aires', 'Buenos Aires', 1),
(12345657, 'Adriana', 'Rojas', 'adriana.rojas02@example.com', '2011-11-17', 'Otro', 'Femenino', 'Av. Mitre 6', 'Las Mojarras', 'Catamarca', 1),
(12345659, 'Gustavo', 'Méndez', 'gustavo.mendez01@example.com', '1982-07-04', 'Agente de salud', 'Masculino', 'Calle Colon 6', 'La Plata', 'Buenos Aires', 1),
(12345661, 'Liliana', 'Chávez', 'liliana.chavez02@example.com', '2012-03-21', 'Otro', 'Femenino', 'Calle Real 7', 'Las Mojarras', 'Catamarca', 1),
(12345663, 'Ricardo', 'Flores', 'ricardo.flores01@example.com', '1983-06-15', 'Agente de salud', 'Masculino', 'Av. Siempre Viva 7', 'Córdoba', 'Córdoba', 1),
(12345665, 'Alicia', 'Soto', 'alicia.soto02@example.com', '2013-09-25', 'Otro', 'Femenino', 'Calle Falsa 7', 'Las Mojarras', 'Catamarca', 0),
(12345667, 'Javier', 'Mora', 'javier.mora01@example.com', '1985-01-11', 'Agente de salud', 'Masculino', 'San Martín 7', 'Mendoza', 'Mendoza', 1),
(12345669, 'Daniela', 'Aguilar', 'daniela.aguilar02@example.com', '2014-04-14', 'Otro', 'Femenino', 'Av. Mitre 7', 'Las Mojarras', 'Catamarca', 1),
(12345671, 'Oscar', 'Delgado', 'oscar.delgado01@example.com', '1979-09-19', 'Agente de salud', 'Masculino', 'Calle Colon 7', 'Rosario', 'Santa Fe', 1),
(12345673, 'Cecilia', 'Ortega', 'cecilia.ortega02@example.com', '2015-06-13', 'Otro', 'Femenino', 'Calle Real 8', 'Las Mojarras', 'Catamarca', 1),
(12345675, 'Raúl', 'Salinas', 'raul.salinas01@example.com', '1980-03-12', 'otro', 'Masculino', 'Av. Siempre Viva 8', 'Alto de las Juntas', 'Catamarca', 1),
(12345677, 'Rosa', 'Carrillo', 'rosa.carrillo02@example.com', '2016-11-10', 'Otro', 'Femenino', 'Calle Falsa 8', 'Las Mojarras', 'Catamarca', 1),
(12345679, 'Eduardo', 'Vargas', 'eduardo.vargas01@example.com', '1987-05-17', 'Otro', 'Masculino', 'San Martín 8', 'Las Mojarras', 'Catamarca', 1),
(12345681, 'Clara', 'Espinoza', 'clara.espinoza02@example.com', '2017-12-19', 'Otro', 'Femenino', 'Av. Mitre 8', 'Las Mojarras', 'Catamarca', 1),
(12345683, 'Mario', 'Reyes', 'mario.reyes01@example.com', '1978-01-11', 'Agente de salud', 'Masculino', 'Calle Colon 8', 'Córdoba', 'Córdoba', 1),
(12345685, 'Patricia', 'Lara', 'patricia.lara02@example.com', '2018-05-15', 'Otro', 'Femenino', 'Calle Real 9', 'Las Mojarras', 'Catamarca', 1),
(12345687, 'Alberto', 'Peña', 'alberto.pena01@example.com', '1976-08-25', 'Agente de salud', 'Masculino', 'Av. Siempre Viva 9', 'Mendoza', 'Mendoza', 1),
(12345689, 'Yolanda', 'Montes', 'yolanda.montes02@example.com', '2019-06-24', 'Otro', 'Femenino', 'Calle Falsa 9', 'Las Mojarras', 'Catamarca', 1),
(12345691, 'Rodrigo', 'Paredes', 'rodrigo.paredes01@example.com', '1988-03-12', 'Agente de salud', 'Masculino', 'San Martín 9', 'Rosario', 'Santa Fe', 1),
(12345693, 'Isabel', 'Guerra', 'isabel.guerra02@example.com', '2020-08-23', 'Otro', 'Femenino', 'Av. Mitre 9', 'Las Mojarras', 'Catamarca', 1),
(12345695, 'Tomás', 'Rojas', 'tomas.rojas01@example.com', '1982-11-10', 'Agente de salud', 'Masculino', 'Calle Colon 9', 'Las Mojarras', 'Catamarca', 1),
(12345697, 'Ana', 'García', 'ana.garcia02@example.com', '2021-04-14', 'Otro', 'Femenino', 'Calle Real 10', 'Las Mojarras', 'Catamarca', 1),
(12345699, 'Luis', 'Martínez', 'luis.martinez01@example.com', '1989-01-19', 'Agente de salud', 'Masculino', 'Av. Siempre Viva 10', 'La Plata', 'Buenos Aires', 1),
(12600842, 'Dora Nelida', 'Orsomarso', 'doranel50@hotmail.com', '1956-11-03', 'otro', 'Femenino', 'Carranza 1129', 'Adrogué', 'Buenos Aires', 1),
(27013989, 'Jesica', 'Martinez', 'jkmartinez251@gmail.com', '1978-12-01', 'Otro', 'Femenino', 'Granada 2761', 'Las Mojarras', 'Catamarca', 1),
(34229421, 'Jorge Ezequiel', 'Diaz', 'diazezequiel777@gmail.com', '1988-11-09', 'Otro', 'Masculino', 'Lavalle 456', 'Las Mojarras', 'Catamarca', 0),
(37716731, 'Federico Ivan', 'Cruceño', 'fedeicru@gmail.com', '1994-03-20', 'Agente de salud', 'Masculino', 'Balcarce 123', 'La Ribera', 'San Luis', 1),
(47669942, 'Micaela', 'Calandra', 'mcalandra@gmail.com', '2006-11-27', 'Otro', 'Femenino', 'Manzana 7190 Casa 14', 'Las Mojarras', 'Catamarca', 1),
(49221038, 'Siro', 'Tassinari', 'siro@gmail.com', '2015-06-23', 'Otro', 'Masculino', 'San Juan 59', 'Las Mojarras', 'Catamarca', 1),
(50479934, 'Agostina', 'Gutierrez', 'agos@gmail.com', '2011-05-06', 'Otro', 'Femenino', 'Los Álamos', 'Las Mojarras', 'Catamarca', 1),
(55012879, 'Roma', 'Castro', 'roma@gmail.com', '2020-07-23', 'Otro', 'Femenino', 'Bulnes 147', 'Las Talas', 'San Juan', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `idRegistro` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idFila` int(11) NOT NULL,
  `nombreDeTabla` varchar(255) NOT NULL,
  `tipoDeAccion` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`idRegistro`, `idUsuario`, `idFila`, `nombreDeTabla`, `tipoDeAccion`, `fecha`) VALUES
(87, 1, 2, 'Descarte', 'Creacion', '2024-06-20 18:45:46'),
(88, 1, 2, 'Descarte', 'Alta', '2024-06-20 18:45:46'),
(89, 1, 3, 'Descarte', 'Creacion', '2024-06-20 19:19:43'),
(90, 1, 3, 'Descarte', 'Alta', '2024-06-20 19:19:43'),
(91, 1, 1, 'Descarte', 'Eliminacion', '2024-06-20 19:19:55'),
(92, 3, 10, 'Lote interno', 'Creacion', '2024-06-21 10:32:17'),
(93, 3, 10, 'Lote interno', 'Alta', '2024-06-21 10:32:17'),
(94, 1, 1, 'Traslado', 'Modificacion', '2024-06-21 11:48:28'),
(95, 1, 1, 'Traslado', 'Baja', '2024-06-21 13:40:18'),
(96, 1, 1, 'Traslado', 'Alta', '2024-06-21 13:52:36'),
(97, 1, 1, 'Traslado', 'Modificacion', '2024-06-21 14:32:26'),
(98, 1, 1, 'Traslado', 'Baja', '2024-06-21 15:18:32'),
(99, 1, 1, 'Traslado', 'Baja', '2024-06-21 15:18:48'),
(100, 1, 1, 'Traslado', 'Baja', '2024-06-21 15:20:33'),
(101, 1, 1, 'Traslado', 'Alta', '2024-06-21 15:30:22'),
(102, 1, 1, 'Traslado', 'Baja', '2024-06-21 15:30:31'),
(103, 1, 1, 'Traslado', 'Alta', '2024-06-21 15:35:04'),
(104, 1, 1, 'Traslado', 'Baja', '2024-06-21 15:35:09'),
(105, 1, 1, 'Traslado', 'Baja', '2024-06-21 15:35:11'),
(106, 1, 1, 'Traslado', 'Baja', '2024-06-21 15:35:12'),
(107, 1, 1, 'Traslado', 'Alta', '2024-06-21 15:36:08'),
(108, 1, 1, 'Traslado', 'Baja', '2024-06-21 15:39:32'),
(109, 1, 1, 'Traslado', 'Alta', '2024-06-21 15:39:46'),
(110, 1, 1, 'Traslado', 'Baja', '2024-06-21 16:11:18'),
(111, 1, 1, 'Traslado', 'Alta', '2024-06-21 16:11:35'),
(112, 1, 1, 'Traslado', 'Baja', '2024-06-21 16:24:43'),
(113, 1, 1, 'Traslado', 'Alta', '2024-06-21 16:25:00'),
(114, 1, 1, 'Traslado', 'Baja', '2024-06-21 16:25:12'),
(115, 1, 1, 'Traslado', 'Alta', '2024-06-21 16:25:17'),
(116, 1, 2, 'Traslado', 'Creacion', '2024-06-21 16:29:33'),
(117, 1, 2, 'Traslado', 'Alta', '2024-06-21 16:29:33'),
(118, 1, 1, 'Traslado', 'Modificacion', '2024-06-21 16:29:43'),
(119, 1, 3, 'Traslado', 'Creacion', '2024-06-21 20:21:14'),
(120, 1, 3, 'Traslado', 'Alta', '2024-06-21 20:21:14'),
(121, 1, 1, 'Aplicacion', 'Modificacion', '2024-06-23 09:21:28'),
(122, 1, 1, 'Aplicacion', 'Baja', '2024-06-23 09:22:13'),
(123, 1, 1, 'Aplicacion', 'Alta', '2024-06-23 09:22:28'),
(124, 1, 2, 'Aplicacion', 'Creacion', '2024-06-23 11:32:03'),
(125, 1, 2, 'Aplicacion', 'Alta', '2024-06-23 11:32:03'),
(126, 1, 3, 'Aplicacion', 'Creacion', '2024-06-29 20:52:44'),
(127, 1, 3, 'Aplicacion', 'Alta', '2024-06-29 20:52:44'),
(128, 1, 2, 'Lote interno', 'Modificacion', '2024-06-29 21:08:48'),
(129, 1, 34229421, 'Persona', 'Modificacion', '2024-07-02 19:15:15'),
(130, 1, 37716731, 'Persona', 'Modificacion', '2024-07-10 21:01:08'),
(131, 1, 34229421, 'Persona', 'Modificacion', '2024-07-10 21:27:19'),
(132, 1, 34229421, 'Persona', 'Baja', '2024-07-10 21:28:43'),
(133, 1, 34229421, 'Persona', 'Alta', '2024-07-10 21:28:55'),
(134, 1, 27013989, 'Persona', 'Creacion', '2024-07-11 10:55:25'),
(135, 1, 27013989, 'Persona', 'Alta', '2024-07-11 10:55:25'),
(136, 1, 1, 'Centro de vacunacion', 'Modificacion', '2024-07-11 15:24:16'),
(137, 1, 2, 'Centro de vacunacion', 'Modificacion', '2024-07-11 15:25:30'),
(138, 1, 2, 'Centro de vacunacion', 'Modificacion', '2024-07-11 15:25:59'),
(139, 1, 2, 'Centro de vacunacion', 'Baja', '2024-07-11 15:26:13'),
(140, 1, 2, 'Centro de vacunacion', 'Alta', '2024-07-11 15:26:24'),
(141, 1, 3, 'Centro de vacunacion', 'Creacion', '2024-07-11 19:50:43'),
(142, 1, 3, 'Centro de vacunacion', 'Alta', '2024-07-11 19:50:43'),
(143, 1, 2, 'Deposito Nacional', 'Modificacion', '2024-07-11 20:23:20'),
(144, 1, 1, 'Deposito Nacional', 'Modificacion', '2024-07-11 20:23:51'),
(145, 1, 2, 'Deposito Nacional', 'Baja', '2024-07-11 20:24:21'),
(146, 1, 2, 'Deposito Nacional', 'Alta', '2024-07-11 20:24:30'),
(147, 1, 3, 'Deposito Nacional', 'Creacion', '2024-07-11 20:32:47'),
(148, 1, 3, 'Deposito Nacional', 'Alta', '2024-07-11 20:32:47'),
(149, 1, 2, 'Deposito Provincial', 'Modificacion', '2024-07-11 20:50:18'),
(150, 1, 1, 'Deposito Provincial', 'Modificacion', '2024-07-11 20:50:37'),
(151, 1, 47669942, 'Persona', 'Creacion', '2024-07-14 13:06:14'),
(152, 1, 47669942, 'Persona', 'Alta', '2024-07-14 13:06:15'),
(153, 1, 4, 'Aplicacion', 'Creacion', '2024-07-14 13:07:11'),
(154, 1, 4, 'Aplicacion', 'Alta', '2024-07-14 13:07:11'),
(155, 1, 4, 'Aplicacion', 'Modificacion', '2024-07-14 13:13:12'),
(156, 1, 4, 'Aplicacion', 'Modificacion', '2024-07-14 13:13:55'),
(157, 1, 50479934, 'Persona', 'Creacion', '2024-07-14 13:20:39'),
(158, 1, 50479934, 'Persona', 'Alta', '2024-07-14 13:20:39'),
(159, 1, 3, 'Aplicacion', 'Modificacion', '2024-07-14 13:24:48'),
(160, 1, 49221038, 'Persona', 'Creacion', '2024-07-14 13:32:46'),
(161, 1, 49221038, 'Persona', 'Alta', '2024-07-14 13:32:46'),
(162, 1, 5, 'Aplicacion', 'Creacion', '2024-07-14 13:43:40'),
(163, 1, 5, 'Aplicacion', 'Alta', '2024-07-14 13:43:40'),
(164, 1, 55012879, 'Persona', 'Creacion', '2024-07-14 13:46:13'),
(165, 1, 55012879, 'Persona', 'Alta', '2024-07-14 13:46:13'),
(166, 1, 6, 'Aplicacion', 'Creacion', '2024-07-14 13:46:43'),
(167, 1, 6, 'Aplicacion', 'Alta', '2024-07-14 13:46:43'),
(168, 1, 7, 'Aplicacion', 'Creacion', '2024-07-14 14:00:19'),
(169, 1, 7, 'Aplicacion', 'Alta', '2024-07-14 14:00:19'),
(170, 1, 7, 'Aplicacion', 'Modificacion', '2024-07-14 14:01:24'),
(171, 1, 8, 'Aplicacion', 'Creacion', '2024-07-14 14:02:34'),
(172, 1, 8, 'Aplicacion', 'Alta', '2024-07-14 14:02:34'),
(173, 1, 8, 'Aplicacion', 'Modificacion', '2024-07-14 14:03:20'),
(174, 1, 8, 'Aplicacion', 'Modificacion', '2024-07-14 14:03:46'),
(175, 1, 4, 'Aplicacion', 'Modificacion', '2024-07-14 14:05:02'),
(176, 1, 103, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:08:49'),
(177, 1, 102, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:08:57'),
(178, 1, 101, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:09:04'),
(179, 1, 100, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:09:12'),
(180, 1, 99, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:09:19'),
(181, 1, 98, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:12:49'),
(182, 1, 97, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:22:05'),
(183, 1, 96, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:22:14'),
(184, 1, 95, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:22:30'),
(185, 1, 94, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:22:38'),
(186, 1, 93, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:22:47'),
(187, 1, 93, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:23:02'),
(188, 1, 92, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:23:15'),
(189, 1, 89, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:23:40'),
(190, 1, 88, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:23:57'),
(191, 1, 87, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:24:06'),
(192, 1, 86, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:24:15'),
(193, 1, 85, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:24:31'),
(194, 1, 83, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:24:54'),
(195, 1, 82, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:25:17'),
(196, 1, 81, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:25:30'),
(197, 1, 80, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:25:49'),
(198, 1, 79, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:26:00'),
(199, 1, 78, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:26:18'),
(200, 1, 77, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:26:28'),
(201, 1, 76, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:26:42'),
(202, 1, 75, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:26:56'),
(203, 1, 74, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:27:10'),
(204, 1, 73, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:27:26'),
(205, 1, 72, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:27:41'),
(206, 1, 71, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:27:57'),
(207, 1, 70, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:28:07'),
(208, 1, 70, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:28:34'),
(209, 1, 69, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:28:59'),
(210, 1, 68, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:29:18'),
(211, 1, 66, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:29:40'),
(212, 1, 65, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:29:56'),
(213, 1, 64, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:30:11'),
(214, 1, 63, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:30:30'),
(215, 1, 103, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:32:14'),
(216, 1, 62, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:33:03'),
(217, 1, 61, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:33:20'),
(218, 1, 60, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:33:45'),
(219, 1, 58, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:34:11'),
(220, 1, 57, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:34:26'),
(221, 1, 55, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:34:49'),
(222, 1, 54, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:35:05'),
(223, 1, 53, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:35:18'),
(224, 1, 52, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:35:32'),
(225, 1, 51, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:35:43'),
(226, 1, 50, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:35:54'),
(227, 1, 49, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:36:11'),
(228, 1, 48, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:37:10'),
(229, 1, 47, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:37:26'),
(230, 1, 46, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:37:45'),
(231, 1, 45, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:38:08'),
(232, 1, 43, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:38:39'),
(233, 1, 42, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:39:04'),
(234, 1, 41, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:39:31'),
(235, 1, 40, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:39:44'),
(236, 1, 37, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:40:21'),
(237, 1, 36, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:40:31'),
(238, 1, 34, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:40:48'),
(239, 1, 33, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:41:00'),
(240, 1, 32, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:41:15'),
(241, 1, 31, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:41:24'),
(242, 1, 30, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:41:36'),
(243, 1, 29, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:41:51'),
(244, 1, 28, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:42:07'),
(245, 1, 27, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:42:19'),
(246, 1, 26, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:42:32'),
(247, 1, 25, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:42:44'),
(248, 1, 24, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:42:59'),
(249, 1, 23, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:44:15'),
(250, 1, 22, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:44:28'),
(251, 1, 21, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:44:40'),
(252, 1, 20, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:45:04'),
(253, 1, 19, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:45:18'),
(254, 1, 18, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:45:33'),
(255, 1, 16, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:46:01'),
(256, 1, 15, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:46:12'),
(257, 1, 14, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:46:28'),
(258, 1, 12, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:46:50'),
(259, 1, 11, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:47:01'),
(260, 1, 10, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:47:12'),
(261, 1, 7, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:47:28'),
(262, 1, 6, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:47:40'),
(263, 1, 5, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:47:52'),
(264, 1, 4, 'Centro de vacunacion', 'Modificacion', '2024-07-17 20:48:03'),
(265, 1, 12345623, 'Persona', 'Modificacion', '2024-07-18 22:50:47'),
(266, 1, 12345679, 'Persona', 'Modificacion', '2024-07-18 22:52:23'),
(267, 1, 12345675, 'Persona', 'Modificacion', '2024-07-18 22:53:06'),
(268, 1, 12345615, 'Persona', 'Modificacion', '2024-07-18 22:58:13'),
(269, 1, 12345665, 'Persona', 'Modificacion', '2024-07-18 22:59:00'),
(270, 1, 12345639, 'Persona', 'Modificacion', '2024-07-18 22:59:24'),
(271, 1, 5, 'Usuario', 'Creacion', '2024-07-21 15:42:52'),
(272, 1, 5, 'Usuario', 'Alta', '2024-07-21 15:42:52'),
(273, 4, 4, 'Aplicacion', 'Modificacion', '2024-07-22 17:29:28'),
(274, 4, 9, 'Aplicacion', 'Creacion', '2024-07-22 18:08:57'),
(275, 4, 9, 'Aplicacion', 'Alta', '2024-07-22 18:08:57'),
(276, 4, 6, 'Descarte', 'Creacion', '2024-07-23 20:29:42'),
(277, 4, 6, 'Descarte', 'Alta', '2024-07-23 20:29:42'),
(278, 4, 7, 'Descarte', 'Creacion', '2024-07-23 21:48:51'),
(279, 4, 7, 'Descarte', 'Alta', '2024-07-23 21:48:51'),
(280, 4, 6, 'Descarte', 'Modificacion', '2024-07-24 22:23:20'),
(281, 1, 27, 'Centro de vacunacion', 'Modificacion', '2024-07-24 22:30:58'),
(282, 4, 4, 'Traslado', 'Creacion', '2024-07-25 20:10:08'),
(283, 4, 4, 'Traslado', 'Alta', '2024-07-25 20:10:09'),
(284, 1, 97, 'Centro de vacunacion', 'Modificacion', '2024-07-26 17:40:25'),
(285, 4, 7, 'Aplicacion', 'Modificacion', '2024-07-27 20:01:31'),
(286, 4, 6, 'Aplicacion', 'Modificacion', '2024-07-27 20:01:43'),
(287, 4, 10, 'Aplicacion', 'Creacion', '2024-07-30 18:54:44'),
(288, 4, 10, 'Aplicacion', 'Alta', '2024-07-30 18:54:44'),
(289, 4, 11, 'Aplicacion', 'Creacion', '2024-07-30 20:21:19'),
(290, 4, 11, 'Aplicacion', 'Alta', '2024-07-30 20:21:19'),
(291, 4, 12, 'Aplicacion', 'Creacion', '2024-07-30 20:28:58'),
(292, 4, 12, 'Aplicacion', 'Alta', '2024-07-30 20:28:58'),
(293, 4, 13, 'Aplicacion', 'Creacion', '2024-07-30 20:35:30'),
(294, 4, 13, 'Aplicacion', 'Alta', '2024-07-30 20:35:30'),
(295, 4, 14, 'Aplicacion', 'Creacion', '2024-07-30 20:48:35'),
(296, 4, 14, 'Aplicacion', 'Alta', '2024-07-30 20:48:35'),
(297, 4, 15, 'Aplicacion', 'Creacion', '2024-07-30 21:07:32'),
(298, 4, 15, 'Aplicacion', 'Alta', '2024-07-30 21:07:32'),
(299, 4, 16, 'Aplicacion', 'Creacion', '2024-07-30 21:10:15'),
(300, 4, 16, 'Aplicacion', 'Alta', '2024-07-30 21:10:15'),
(301, 4, 17, 'Aplicacion', 'Creacion', '2024-07-30 21:11:40'),
(302, 4, 17, 'Aplicacion', 'Alta', '2024-07-30 21:11:40'),
(303, 4, 5, 'Traslado', 'Creacion', '2024-07-30 21:56:17'),
(304, 4, 5, 'Traslado', 'Alta', '2024-07-30 21:56:17'),
(305, 4, 5, 'Traslado', 'Modificacion', '2024-07-30 22:20:26'),
(306, 4, 6, 'Traslado', 'Creacion', '2024-07-30 22:22:06'),
(307, 4, 6, 'Traslado', 'Alta', '2024-07-30 22:22:06'),
(308, 4, 7, 'Traslado', 'Creacion', '2024-07-30 22:40:08'),
(309, 4, 7, 'Traslado', 'Alta', '2024-07-30 22:40:08'),
(310, 4, 6, 'Traslado', 'Modificacion', '2024-07-30 22:53:09'),
(311, 4, 8, 'Traslado', 'Creacion', '2024-07-30 22:55:35'),
(312, 4, 8, 'Traslado', 'Alta', '2024-07-30 22:55:35'),
(313, 4, 7, 'Traslado', 'Modificacion', '2024-07-30 22:58:59'),
(314, 4, 8, 'Traslado', 'Modificacion', '2024-07-30 22:59:31'),
(315, 4, 17, 'Traslado', 'Creacion', '2024-07-30 23:27:22'),
(316, 4, 17, 'Traslado', 'Alta', '2024-07-30 23:27:22'),
(317, 4, 4, 'Traslado', 'Modificacion', '2024-07-31 01:27:07'),
(318, 4, 12345675, 'Persona', 'Modificacion', '2024-07-31 02:05:22'),
(319, 4, 8, 'Descarte', 'Creacion', '2024-07-31 03:12:45'),
(320, 4, 8, 'Descarte', 'Alta', '2024-07-31 03:12:45'),
(321, 3, 9, 'Descarte', 'Creacion', '2024-07-31 03:29:38'),
(322, 3, 9, 'Descarte', 'Alta', '2024-07-31 03:29:38'),
(323, 3, 5, 'Descarte', 'Eliminacion', '2024-07-31 03:48:03'),
(324, 4, 3, 'Descarte', 'Modificacion', '2024-07-31 04:12:33'),
(325, 4, 8, 'Descarte', 'Modificacion', '2024-07-31 04:41:25'),
(326, 4, 8, 'Descarte', 'Modificacion', '2024-07-31 04:45:03'),
(327, 4, 49221038, 'Persona', 'Baja', '2024-07-31 17:12:48'),
(328, 4, 49221038, 'Persona', 'Baja', '2024-07-31 17:12:48'),
(329, 4, 49221038, 'Persona', 'Alta', '2024-07-31 17:12:51'),
(330, 4, 12345665, 'Persona', 'Baja', '2024-07-31 17:12:59'),
(331, 4, 34229421, 'Persona', 'Baja', '2024-07-31 17:12:59'),
(332, 2, 11, 'Lote interno', 'Alta', '2024-07-31 17:42:47'),
(333, 2, 12, 'Lote interno', 'Alta', '2024-07-31 17:42:47'),
(334, 2, 13, 'Lote interno', 'Alta', '2024-07-31 17:42:47'),
(335, 2, 14, 'Lote interno', 'Alta', '2024-07-31 17:42:47'),
(336, 2, 15, 'Lote interno', 'Alta', '2024-07-31 17:42:47'),
(337, 2, 16, 'Lote interno', 'Alta', '2024-07-31 17:42:47'),
(338, 2, 17, 'Lote interno', 'Alta', '2024-07-31 17:42:47'),
(339, 2, 18, 'Lote interno', 'Alta', '2024-07-31 17:42:47'),
(340, 2, 19, 'Lote interno', 'Alta', '2024-07-31 17:42:47'),
(341, 2, 20, 'Lote interno', 'Alta', '2024-07-31 17:42:47'),
(342, 2, 11, 'Lote interno', 'Creacion', '2024-07-31 17:42:47'),
(343, 2, 12, 'Lote interno', 'Creacion', '2024-07-31 17:42:47'),
(344, 2, 13, 'Lote interno', 'Creacion', '2024-07-31 17:42:47'),
(345, 2, 14, 'Lote interno', 'Creacion', '2024-07-31 17:42:47'),
(346, 2, 15, 'Lote interno', 'Creacion', '2024-07-31 17:42:47'),
(347, 2, 16, 'Lote interno', 'Creacion', '2024-07-31 17:42:47'),
(348, 2, 17, 'Lote interno', 'Creacion', '2024-07-31 17:42:47'),
(349, 2, 18, 'Lote interno', 'Creacion', '2024-07-31 17:42:47'),
(350, 2, 19, 'Lote interno', 'Creacion', '2024-07-31 17:42:47'),
(351, 2, 20, 'Lote interno', 'Creacion', '2024-07-31 17:42:47'),
(352, 2, 6, 'Lote proveeedor', 'Creacion', '2024-07-31 17:42:47'),
(353, 2, 6, 'Lote proveeedor', 'Alta', '2024-07-31 17:42:47'),
(354, 4, 18, 'Aplicacion', 'Creacion', '2024-07-31 17:49:42'),
(355, 4, 18, 'Aplicacion', 'Alta', '2024-07-31 17:49:42'),
(356, 2, 21, 'Lote interno', 'Alta', '2024-07-31 18:09:09'),
(357, 2, 21, 'Lote interno', 'Creacion', '2024-07-31 18:09:09'),
(358, 2, 7, 'Lote proveeedor', 'Creacion', '2024-07-31 18:09:09'),
(359, 2, 7, 'Lote proveeedor', 'Alta', '2024-07-31 18:09:09'),
(360, 1, 19, 'Laboratorio', 'Baja', '2024-07-31 19:26:54'),
(361, 1, 19, 'Laboratorio', 'Alta', '2024-07-31 19:26:56'),
(362, 1, 103, 'Centro de vacunacion', 'Baja', '2024-07-31 19:29:45'),
(363, 1, 103, 'Centro de vacunacion', 'Alta', '2024-07-31 19:29:48'),
(364, 1, 12600842, 'Persona', 'Creacion', '2024-07-31 19:30:59'),
(365, 1, 12600842, 'Persona', 'Alta', '2024-07-31 19:30:59'),
(366, 1, 12600842, 'Persona', 'Modificacion', '2024-07-31 19:31:36'),
(367, 1, 12600842, 'Persona', 'Baja', '2024-07-31 19:31:43'),
(368, 1, 12600842, 'Persona', 'Alta', '2024-07-31 19:31:50'),
(369, 1, 101, 'Laboratorio', 'Creacion', '2024-07-31 19:32:39'),
(370, 1, 101, 'Laboratorio', 'Alta', '2024-07-31 19:32:39'),
(371, 1, 101, 'Laboratorio', 'Modificacion', '2024-07-31 19:33:50'),
(372, 1, 101, 'Laboratorio', 'Baja', '2024-07-31 19:34:08'),
(373, 1, 101, 'Laboratorio', 'Alta', '2024-07-31 19:34:19'),
(374, 1, 104, 'Centro de vacunacion', 'Creacion', '2024-07-31 19:36:03'),
(375, 1, 104, 'Centro de vacunacion', 'Alta', '2024-07-31 19:36:03'),
(376, 1, 104, 'Centro de vacunacion', 'Baja', '2024-07-31 19:37:36'),
(377, 1, 104, 'Centro de vacunacion', 'Alta', '2024-07-31 19:37:39'),
(378, 1, 104, 'Centro de vacunacion', 'Baja', '2024-07-31 19:37:43'),
(379, 1, 104, 'Centro de vacunacion', 'Alta', '2024-07-31 19:37:46'),
(380, 1, 104, 'Centro de vacunacion', 'Modificacion', '2024-07-31 19:37:52'),
(381, 1, 1, 'Traslado', 'Baja', '2024-07-31 19:51:27'),
(382, 1, 1, 'Traslado', 'Alta', '2024-07-31 19:51:30'),
(383, 1, 104, 'Deposito Nacional', 'Creacion', '2024-07-31 20:11:14'),
(384, 1, 104, 'Deposito Nacional', 'Alta', '2024-07-31 20:11:14'),
(385, 1, 104, 'Deposito Nacional', 'Modificacion', '2024-07-31 20:11:32'),
(386, 1, 104, 'Deposito Nacional', 'Baja', '2024-07-31 20:11:35'),
(387, 1, 104, 'Deposito Nacional', 'Alta', '2024-07-31 20:11:38'),
(388, 1, 19, 'Laboratorio', 'Baja', '2024-07-31 21:24:48'),
(389, 1, 19, 'Laboratorio', 'Alta', '2024-07-31 21:24:51'),
(390, 1, 105, 'Centro de vacunacion', 'Creacion', '2024-08-01 00:36:30'),
(391, 1, 105, 'Centro de vacunacion', 'Alta', '2024-08-01 00:36:30'),
(392, 1, 105, 'Centro de vacunacion', 'Baja', '2024-08-01 00:36:59'),
(393, 1, 2, 'Centro de vacunacion', 'Baja', '2024-08-01 00:36:59'),
(394, 1, 104, 'Centro de vacunacion', 'Modificacion', '2024-08-01 00:43:56'),
(395, 1, 104, 'Centro de vacunacion', 'Baja', '2024-08-01 00:44:03'),
(396, 1, 105, 'Centro de vacunacion', 'Alta', '2024-08-01 00:44:09'),
(397, 1, 6, 'Usuario', 'Creacion', '2024-08-01 01:17:52'),
(398, 1, 6, 'Usuario', 'Alta', '2024-08-01 01:17:52'),
(399, 1, 6, 'Usuario', 'Modificacion', '2024-08-01 01:40:02'),
(400, 1, 6, 'Usuario', 'Modificacion', '2024-08-01 01:40:19'),
(401, 1, 6, 'Usuario', 'Baja', '2024-08-01 01:40:28'),
(402, 1, 6, 'Usuario', 'Alta', '2024-08-01 01:40:33'),
(403, 2, 19, 'Laboratorio', 'Baja', '2024-08-01 02:05:08'),
(404, 2, 22, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(405, 2, 23, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(406, 2, 24, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(407, 2, 25, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(408, 2, 26, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(409, 2, 27, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(410, 2, 28, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(411, 2, 29, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(412, 2, 30, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(413, 2, 31, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(414, 2, 32, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(415, 2, 33, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(416, 2, 34, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(417, 2, 35, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(418, 2, 36, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(419, 2, 37, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(420, 2, 38, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(421, 2, 39, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(422, 2, 40, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(423, 2, 41, 'Lote interno', 'Alta', '2024-08-01 02:10:05'),
(424, 2, 22, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(425, 2, 23, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(426, 2, 24, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(427, 2, 25, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(428, 2, 26, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(429, 2, 27, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(430, 2, 28, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(431, 2, 29, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(432, 2, 30, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(433, 2, 31, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(434, 2, 32, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(435, 2, 33, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(436, 2, 34, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(437, 2, 35, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(438, 2, 36, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(439, 2, 37, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(440, 2, 38, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(441, 2, 39, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(442, 2, 40, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(443, 2, 41, 'Lote interno', 'Creacion', '2024-08-01 02:10:05'),
(444, 2, 8, 'Lote proveeedor', 'Creacion', '2024-08-01 02:10:05'),
(445, 2, 8, 'Lote proveeedor', 'Alta', '2024-08-01 02:10:05'),
(446, 4, 19, 'Aplicacion', 'Creacion', '2024-08-01 09:30:51'),
(447, 4, 19, 'Aplicacion', 'Alta', '2024-08-01 09:30:51'),
(448, 4, 20, 'Aplicacion', 'Creacion', '2024-08-01 09:32:21'),
(449, 4, 20, 'Aplicacion', 'Alta', '2024-08-01 09:32:21'),
(450, 4, 21, 'Aplicacion', 'Creacion', '2024-08-01 09:35:03'),
(451, 4, 21, 'Aplicacion', 'Alta', '2024-08-01 09:35:03'),
(452, 4, 22, 'Aplicacion', 'Creacion', '2024-08-01 10:25:40'),
(453, 4, 22, 'Aplicacion', 'Alta', '2024-08-01 10:25:40'),
(454, 2, 42, 'Lote interno', 'Alta', '2024-08-01 12:28:34'),
(455, 2, 43, 'Lote interno', 'Alta', '2024-08-01 12:28:34'),
(456, 2, 44, 'Lote interno', 'Alta', '2024-08-01 12:28:34'),
(457, 2, 45, 'Lote interno', 'Alta', '2024-08-01 12:28:34'),
(458, 2, 46, 'Lote interno', 'Alta', '2024-08-01 12:28:34'),
(459, 2, 47, 'Lote interno', 'Alta', '2024-08-01 12:28:34'),
(460, 2, 48, 'Lote interno', 'Alta', '2024-08-01 12:28:34'),
(461, 2, 49, 'Lote interno', 'Alta', '2024-08-01 12:28:34'),
(462, 2, 50, 'Lote interno', 'Alta', '2024-08-01 12:28:34'),
(463, 2, 51, 'Lote interno', 'Alta', '2024-08-01 12:28:34'),
(464, 2, 42, 'Lote interno', 'Creacion', '2024-08-01 12:28:34'),
(465, 2, 43, 'Lote interno', 'Creacion', '2024-08-01 12:28:34'),
(466, 2, 44, 'Lote interno', 'Creacion', '2024-08-01 12:28:34'),
(467, 2, 45, 'Lote interno', 'Creacion', '2024-08-01 12:28:34'),
(468, 2, 46, 'Lote interno', 'Creacion', '2024-08-01 12:28:34'),
(469, 2, 47, 'Lote interno', 'Creacion', '2024-08-01 12:28:34'),
(470, 2, 48, 'Lote interno', 'Creacion', '2024-08-01 12:28:34'),
(471, 2, 49, 'Lote interno', 'Creacion', '2024-08-01 12:28:34'),
(472, 2, 50, 'Lote interno', 'Creacion', '2024-08-01 12:28:34'),
(473, 2, 51, 'Lote interno', 'Creacion', '2024-08-01 12:28:34'),
(474, 2, 9, 'Lote proveeedor', 'Creacion', '2024-08-01 12:28:34'),
(475, 2, 9, 'Lote proveeedor', 'Alta', '2024-08-01 12:28:34'),
(476, 2, 52, 'Lote interno', 'Alta', '2024-08-01 12:31:27'),
(477, 2, 53, 'Lote interno', 'Alta', '2024-08-01 12:31:27'),
(478, 2, 54, 'Lote interno', 'Alta', '2024-08-01 12:31:27'),
(479, 2, 55, 'Lote interno', 'Alta', '2024-08-01 12:31:27'),
(480, 2, 56, 'Lote interno', 'Alta', '2024-08-01 12:31:27'),
(481, 2, 52, 'Lote interno', 'Creacion', '2024-08-01 12:31:27'),
(482, 2, 53, 'Lote interno', 'Creacion', '2024-08-01 12:31:27'),
(483, 2, 54, 'Lote interno', 'Creacion', '2024-08-01 12:31:27'),
(484, 2, 55, 'Lote interno', 'Creacion', '2024-08-01 12:31:27'),
(485, 2, 56, 'Lote interno', 'Creacion', '2024-08-01 12:31:27'),
(486, 2, 10, 'Lote proveeedor', 'Creacion', '2024-08-01 12:31:27'),
(487, 2, 10, 'Lote proveeedor', 'Alta', '2024-08-01 12:31:27'),
(488, 2, 57, 'Lote interno', 'Alta', '2024-08-01 12:37:43'),
(489, 2, 58, 'Lote interno', 'Alta', '2024-08-01 12:37:43'),
(490, 2, 59, 'Lote interno', 'Alta', '2024-08-01 12:37:43'),
(491, 2, 60, 'Lote interno', 'Alta', '2024-08-01 12:37:43'),
(492, 2, 61, 'Lote interno', 'Alta', '2024-08-01 12:37:43'),
(493, 2, 62, 'Lote interno', 'Alta', '2024-08-01 12:37:43'),
(494, 2, 63, 'Lote interno', 'Alta', '2024-08-01 12:37:43'),
(495, 2, 64, 'Lote interno', 'Alta', '2024-08-01 12:37:43'),
(496, 2, 65, 'Lote interno', 'Alta', '2024-08-01 12:37:43'),
(497, 2, 66, 'Lote interno', 'Alta', '2024-08-01 12:37:43'),
(498, 2, 57, 'Lote interno', 'Creacion', '2024-08-01 12:37:43'),
(499, 2, 58, 'Lote interno', 'Creacion', '2024-08-01 12:37:43'),
(500, 2, 59, 'Lote interno', 'Creacion', '2024-08-01 12:37:43'),
(501, 2, 60, 'Lote interno', 'Creacion', '2024-08-01 12:37:43'),
(502, 2, 61, 'Lote interno', 'Creacion', '2024-08-01 12:37:43'),
(503, 2, 62, 'Lote interno', 'Creacion', '2024-08-01 12:37:43'),
(504, 2, 63, 'Lote interno', 'Creacion', '2024-08-01 12:37:43'),
(505, 2, 64, 'Lote interno', 'Creacion', '2024-08-01 12:37:43'),
(506, 2, 65, 'Lote interno', 'Creacion', '2024-08-01 12:37:43'),
(507, 2, 66, 'Lote interno', 'Creacion', '2024-08-01 12:37:43'),
(508, 2, 11, 'Lote proveeedor', 'Creacion', '2024-08-01 12:37:43'),
(509, 2, 11, 'Lote proveeedor', 'Alta', '2024-08-01 12:37:43'),
(510, 2, 67, 'Lote interno', 'Alta', '2024-08-01 12:40:06'),
(511, 2, 68, 'Lote interno', 'Alta', '2024-08-01 12:40:06'),
(512, 2, 69, 'Lote interno', 'Alta', '2024-08-01 12:40:06'),
(513, 2, 70, 'Lote interno', 'Alta', '2024-08-01 12:40:06'),
(514, 2, 71, 'Lote interno', 'Alta', '2024-08-01 12:40:06'),
(515, 2, 67, 'Lote interno', 'Creacion', '2024-08-01 12:40:06'),
(516, 2, 68, 'Lote interno', 'Creacion', '2024-08-01 12:40:06'),
(517, 2, 69, 'Lote interno', 'Creacion', '2024-08-01 12:40:06'),
(518, 2, 70, 'Lote interno', 'Creacion', '2024-08-01 12:40:06'),
(519, 2, 71, 'Lote interno', 'Creacion', '2024-08-01 12:40:06'),
(520, 2, 12, 'Lote proveeedor', 'Creacion', '2024-08-01 12:40:06'),
(521, 2, 12, 'Lote proveeedor', 'Alta', '2024-08-01 12:40:06'),
(522, 4, 23, 'Aplicacion', 'Creacion', '2024-08-01 12:57:41'),
(523, 4, 23, 'Aplicacion', 'Alta', '2024-08-01 12:57:41'),
(524, 4, 24, 'Aplicacion', 'Creacion', '2024-08-01 14:10:57'),
(525, 4, 24, 'Aplicacion', 'Alta', '2024-08-01 14:10:57'),
(526, 4, 25, 'Aplicacion', 'Creacion', '2024-08-01 14:11:56'),
(527, 4, 25, 'Aplicacion', 'Alta', '2024-08-01 14:11:56'),
(528, 4, 24, 'Aplicacion', 'Modificacion', '2024-08-01 14:44:42'),
(529, 4, 25, 'Aplicacion', 'Baja', '2024-08-01 14:45:09'),
(530, 4, 25, 'Aplicacion', 'Alta', '2024-08-01 14:45:12'),
(531, 4, 26, 'Aplicacion', 'Creacion', '2024-08-01 14:45:54'),
(532, 4, 26, 'Aplicacion', 'Alta', '2024-08-01 14:45:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `DNI` int(11) NOT NULL,
  `celular1` varchar(255) DEFAULT NULL,
  `celular2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`DNI`, `celular1`, `celular2`) VALUES
(12345601, '5493415556677', NULL),
(12345603, '5491144445566', '5491140045566'),
(12345605, '5493515556678', NULL),
(12345607, '5492614445567', '5492614440000'),
(12345609, '5492215556679', NULL),
(12345611, '5493414445570', '5493412225570'),
(12345613, '5493515556680', NULL),
(12345615, '5491144445571', NULL),
(12345617, '5492615556681', NULL),
(12345619, '5492214445572', '5492216665572'),
(12345621, '5493415556682', NULL),
(12345623, '5493514445573', '5493511118870'),
(12345625, '5491145556683', NULL),
(12345627, '5492614445574', '5492617775574'),
(12345629, '5492215556684', NULL),
(12345631, '5493414445575', '5493419995575'),
(12345633, '5493515556685', NULL),
(12345635, '5491144445576', '5491100005576'),
(12345637, '5492615556686', NULL),
(12345639, '5492214445577', '5490014445577'),
(12345641, '5493415556687', NULL),
(12345643, '5493514445578', '5491234445578'),
(12345645, '5491145556688', NULL),
(12345647, '5492614445579', '5492613215579'),
(12345649, '5492215556689', NULL),
(12345651, '5493414445580', '54934166445580'),
(12345653, '5493515556690', NULL),
(12345655, '5491144445581', '5491122885581'),
(12345657, '5492615556691', NULL),
(12345659, '5492214445582', '54922108075582'),
(12345661, '5493415556692', NULL),
(12345663, '5493514445583', '54935457905583'),
(12345665, '5491145556693', NULL),
(12345667, '5492614445584', '54920415395584'),
(12345669, '5492215556694', NULL),
(12345671, '5493414445585', '54931285675585'),
(12345673, '5493515556695', NULL),
(12345675, '5491144445586', NULL),
(12345677, '5492615556696', NULL),
(12345679, '5492214445587', NULL),
(12345681, '5493415556697', NULL),
(12345683, '5493514445588', '54935158075588'),
(12345685, '5491145556698', NULL),
(12345687, '5492614445589', '5492619305589'),
(12345689, '5492215556699', NULL),
(12345691, '5493414445590', '5493412515590'),
(12345693, '5493515556700', NULL),
(12345695, '5491144445591', '5491101025591'),
(12345697, '5492615556701', NULL),
(12345699, '5492214445592', '5492217895592'),
(12600842, '1163213910', '2657312733'),
(27013989, '2657322453', NULL),
(34229421, '1132185230', NULL),
(37716731, '2657312733', NULL),
(47669942, '2657441896', NULL),
(49221038, NULL, NULL),
(50479934, NULL, NULL),
(55012879, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslado`
--

CREATE TABLE `traslado` (
  `idTraslado` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `idCentroDeVacunacion` int(11) NOT NULL,
  `fechaDeSalida` date NOT NULL,
  `fechaDeLlegada` date DEFAULT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `traslado`
--

INSERT INTO `traslado` (`idTraslado`, `numeroDeSerie`, `idCentroDeVacunacion`, `fechaDeSalida`, `fechaDeLlegada`, `activo`) VALUES
(1, 1, 1, '2024-01-04', '2024-02-04', 1),
(2, 4, 2, '2024-06-12', '2024-06-13', 1),
(3, 1, 2, '2024-02-01', '2024-03-01', 1),
(4, 1, 23, '2024-07-20', '2024-07-21', 1),
(5, 4, 23, '2024-07-18', '2024-07-19', 1),
(6, 4, 46, '2024-07-18', '2024-07-20', 1),
(7, 9, 23, '2024-07-29', '2024-07-20', 1),
(8, 4, 92, '2024-07-19', '2024-07-21', 1),
(17, 9, 69, '2024-07-17', '2024-07-18', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `rol` varchar(50) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `localidad` varchar(255) NOT NULL,
  `provincia` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `rol`, `nombre`, `apellido`, `email`, `password`, `localidad`, `provincia`, `activo`) VALUES
(1, 'Super Admin', 'Ezequiel', 'Diaz', 'diazezequiel777@gmail.com', '$2b$05$ifOf6qUi1UnStcHGPd9oruu.H1cVoDgUDrH/jiVW7HS6kcPttTzQu', 'Adrogué', 'Buenos Aires', 1),
(2, 'Gestor de compras', 'Federico', 'Cruceño', 'fedeicru@gmail.com', '$2b$05$ifOf6qUi1UnStcHGPd9oruu.H1cVoDgUDrH/jiVW7HS6kcPttTzQu', 'Los Molinos', 'Córdoba', 1),
(3, 'Operador de logistica', 'Patricia', 'Baigorria', 'patobaigorria@gmail.com', '$2b$05$ifOf6qUi1UnStcHGPd9oruu.H1cVoDgUDrH/jiVW7HS6kcPttTzQu', 'La Ribera', 'San Luis', 1),
(4, 'Agente de salud', 'Lautaro', 'Saucedo', 'lauchasaucedo@gmail.com', '$2b$05$6jigAHw3HE6ZiOQWv4WBieOOLE27xfHmsrh/wukTxCXbJcvVUCdDG', 'Las Mojarras', 'Catamarca', 1),
(5, 'Agente de salud', '86', 'Agente', 'agente@gmail.com', '$2b$05$k/O9Q.Jqlx9ED0XlDd1Cj.u9mqpNdGdsYOSOaSVJFORxx0MQZ1TpS', 'Las Talas', 'San Juan', 1),
(6, 'Gestor de compras', 'Salvio', 'Lopez', 'salviolopez456@gmail.com', '$2b$10$ULaoYJ6mo.i8UhnFpxCBjOGHl34MdrZ/dkz3OTUuN6IwjfKc3Hyw2', 'Aconquija', 'Catamarca', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agentedesalud`
--
ALTER TABLE `agentedesalud`
  ADD PRIMARY KEY (`DNI`),
  ADD UNIQUE KEY `matricula` (`matricula`);

--
-- Indices de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD PRIMARY KEY (`idAplicacion`),
  ADD KEY `DNIPaciente` (`DNIPaciente`),
  ADD KEY `DNIAgente` (`DNIAgente`),
  ADD KEY `numeroDeSerie` (`numeroDeSerie`);

--
-- Indices de la tabla `centrodevacunacion`
--
ALTER TABLE `centrodevacunacion`
  ADD PRIMARY KEY (`idCentroDeVacunacion`);

--
-- Indices de la tabla `depositonacional`
--
ALTER TABLE `depositonacional`
  ADD PRIMARY KEY (`idDepositoNacional`);

--
-- Indices de la tabla `depositoprovincial`
--
ALTER TABLE `depositoprovincial`
  ADD PRIMARY KEY (`idDepositoProvincial`);

--
-- Indices de la tabla `descarte`
--
ALTER TABLE `descarte`
  ADD PRIMARY KEY (`idDescarte`),
  ADD KEY `numeroDeSerie` (`numeroDeSerie`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`idLaboratorio`),
  ADD UNIQUE KEY `nombreLaboratorio` (`nombreLaboratorio`);

--
-- Indices de la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  ADD PRIMARY KEY (`numeroDeSerie`),
  ADD KEY `numeroDeLote` (`numeroDeLote`),
  ADD KEY `idLaboratorio` (`idLaboratorio`),
  ADD KEY `idDepositoNacional` (`idDepositoNacional`),
  ADD KEY `idDepositoProvincial` (`idDepositoProvincial`),
  ADD KEY `idCentroDeVacunacion` (`idCentroDeVacunacion`);

--
-- Indices de la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD PRIMARY KEY (`numeroDeLote`),
  ADD KEY `idLaboratorio` (`idLaboratorio`);

--
-- Indices de la tabla `patologiabase`
--
ALTER TABLE `patologiabase`
  ADD PRIMARY KEY (`DNI`,`patologiaBase`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`idRegistro`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `traslado`
--
ALTER TABLE `traslado`
  ADD PRIMARY KEY (`idTraslado`),
  ADD KEY `idCentroDeVacunacion` (`idCentroDeVacunacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `nombreUsuario` (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  MODIFY `idAplicacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `centrodevacunacion`
--
ALTER TABLE `centrodevacunacion`
  MODIFY `idCentroDeVacunacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT de la tabla `depositonacional`
--
ALTER TABLE `depositonacional`
  MODIFY `idDepositoNacional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de la tabla `depositoprovincial`
--
ALTER TABLE `depositoprovincial`
  MODIFY `idDepositoProvincial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de la tabla `descarte`
--
ALTER TABLE `descarte`
  MODIFY `idDescarte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `idLaboratorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  MODIFY `numeroDeSerie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  MODIFY `numeroDeLote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `idRegistro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=533;

--
-- AUTO_INCREMENT de la tabla `traslado`
--
ALTER TABLE `traslado`
  MODIFY `idTraslado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agentedesalud`
--
ALTER TABLE `agentedesalud`
  ADD CONSTRAINT `agentedesalud_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD CONSTRAINT `aplicacion_ibfk_1` FOREIGN KEY (`DNIPaciente`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aplicacion_ibfk_2` FOREIGN KEY (`DNIAgente`) REFERENCES `agentedesalud` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aplicacion_ibfk_3` FOREIGN KEY (`numeroDeSerie`) REFERENCES `loteinterno` (`numeroDeSerie`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `descarte`
--
ALTER TABLE `descarte`
  ADD CONSTRAINT `descarte_ibfk_2` FOREIGN KEY (`numeroDeSerie`) REFERENCES `loteinterno` (`numeroDeSerie`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `descarte_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`);

--
-- Filtros para la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  ADD CONSTRAINT `loteinterno_ibfk_1` FOREIGN KEY (`numeroDeLote`) REFERENCES `loteproveedor` (`numeroDeLote`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `loteinterno_ibfk_2` FOREIGN KEY (`idLaboratorio`) REFERENCES `laboratorio` (`idLaboratorio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `loteinterno_ibfk_3` FOREIGN KEY (`idDepositoNacional`) REFERENCES `depositonacional` (`idDepositoNacional`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `loteinterno_ibfk_4` FOREIGN KEY (`idDepositoProvincial`) REFERENCES `depositoprovincial` (`idDepositoProvincial`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `loteinterno_ibfk_5` FOREIGN KEY (`idCentroDeVacunacion`) REFERENCES `centrodevacunacion` (`idCentroDeVacunacion`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD CONSTRAINT `loteproveedor_ibfk_1` FOREIGN KEY (`idLaboratorio`) REFERENCES `laboratorio` (`idLaboratorio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `patologiabase`
--
ALTER TABLE `patologiabase`
  ADD CONSTRAINT `patologiabase_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `traslado`
--
ALTER TABLE `traslado`
  ADD CONSTRAINT `traslado_ibfk_1` FOREIGN KEY (`numeroDeSerie`) REFERENCES `loteinterno` (`numeroDeSerie`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `traslado_ibfk_2` FOREIGN KEY (`idCentroDeVacunacion`) REFERENCES `centrodevacunacion` (`idCentroDeVacunacion`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `vacunatorio3`
--
DROP DATABASE IF EXISTS `vacunatorio3`;
CREATE DATABASE IF NOT EXISTS `vacunatorio3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `vacunatorio3`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agentedesalud`
--

CREATE TABLE `agentedesalud` (
  `DNI` int(11) NOT NULL,
  `matricula` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aplicacion`
--

CREATE TABLE `aplicacion` (
  `idAplicacion` int(11) NOT NULL,
  `DNIPaciente` int(11) NOT NULL,
  `DNIAgente` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `fechaDeAplicacion` date NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centrodevacunacion`
--

CREATE TABLE `centrodevacunacion` (
  `idCentroDeVacunacion` int(11) NOT NULL,
  `longitud` double NOT NULL,
  `latitud` double NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositonacional`
--

CREATE TABLE `depositonacional` (
  `idDepositoNacional` int(11) NOT NULL,
  `longitud` double NOT NULL,
  `latitud` double NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositoprovincial`
--

CREATE TABLE `depositoprovincial` (
  `idDepositoProvincial` int(11) NOT NULL,
  `longitud` double NOT NULL,
  `latitud` double NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descarte`
--

CREATE TABLE `descarte` (
  `idDescarte` int(11) NOT NULL,
  `DNIAgente` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `empresaDescartante` varchar(255) NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `cantidadDeVacunas` int(11) NOT NULL,
  `fechaDeDescarte` date NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `laboratorio`
--

CREATE TABLE `laboratorio` (
  `idLaboratorio` int(11) NOT NULL,
  `nombreLaboratorio` varchar(255) NOT NULL,
  `pais` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `longitud` double NOT NULL,
  `latitud` double NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteinterno`
--

CREATE TABLE `loteinterno` (
  `numeroDeSerie` int(11) NOT NULL,
  `numeroDeLote` int(11) NOT NULL,
  `idLaboratorio` int(11) NOT NULL,
  `cantidadDeVacunasTotales` int(11) NOT NULL,
  `cantidadDeVacunasRestantes` int(11) NOT NULL,
  `fechaDeLlegadaDepositoNacional` date DEFAULT NULL,
  `idDepositoNacional` int(11) DEFAULT NULL,
  `fechaDeSalidaDepositoNacional` date DEFAULT NULL,
  `fechaDeLlegadaDepositoProvincial` date DEFAULT NULL,
  `idDepositoProvincial` int(11) DEFAULT NULL,
  `fechaDeSalidaDepositoProvincial` date DEFAULT NULL,
  `fechaDeLlegadaCentroDeVacunacion` date DEFAULT NULL,
  `idCentroDeVacunacion` int(11) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loteproveedor`
--

CREATE TABLE `loteproveedor` (
  `numeroDeLote` int(11) NOT NULL,
  `idLaboratorio` int(11) NOT NULL,
  `tipoDeVacuna` varchar(255) NOT NULL,
  `nombreComercial` varchar(255) NOT NULL,
  `cantidadDeLotesInternos` int(11) NOT NULL,
  `fechaDeFabricacion` date NOT NULL,
  `fechaDeCompra` date NOT NULL,
  `fechaDeVencimiento` date NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patologiabase`
--

CREATE TABLE `patologiabase` (
  `DNI` int(11) NOT NULL,
  `patologiaBase` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `DNI` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fechaDeNacimiento` date NOT NULL,
  `ocupacion` varchar(255) NOT NULL,
  `genero` varchar(255) NOT NULL,
  `longitud` double NOT NULL,
  `latitud` double NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `idRegistro` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idFila` int(11) NOT NULL,
  `nombreDeTabla` varchar(255) NOT NULL,
  `tipoDeAccion` enum('Creacion','Alta','Baja','Modificacion') NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `DNI` int(11) NOT NULL,
  `celular1` varchar(255) DEFAULT NULL,
  `celular2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traslado`
--

CREATE TABLE `traslado` (
  `idTraslado` int(11) NOT NULL,
  `numeroDeSerie` int(11) NOT NULL,
  `idCentroDeVacunacion` int(11) NOT NULL,
  `fechaDeSalida` date NOT NULL,
  `fechaDeLlegada` date DEFAULT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `rol` varchar(255) NOT NULL,
  `nombreUsuario` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `rol`, `nombreUsuario`, `email`, `password`, `activo`) VALUES
(1, 'Super Admin', 'Pato', 'pato@gmail.com', '123', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agentedesalud`
--
ALTER TABLE `agentedesalud`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD PRIMARY KEY (`idAplicacion`),
  ADD KEY `DNIPaciente` (`DNIPaciente`),
  ADD KEY `DNIAgente` (`DNIAgente`),
  ADD KEY `numeroDeSerie` (`numeroDeSerie`);

--
-- Indices de la tabla `centrodevacunacion`
--
ALTER TABLE `centrodevacunacion`
  ADD PRIMARY KEY (`idCentroDeVacunacion`);

--
-- Indices de la tabla `depositonacional`
--
ALTER TABLE `depositonacional`
  ADD PRIMARY KEY (`idDepositoNacional`);

--
-- Indices de la tabla `depositoprovincial`
--
ALTER TABLE `depositoprovincial`
  ADD PRIMARY KEY (`idDepositoProvincial`);

--
-- Indices de la tabla `descarte`
--
ALTER TABLE `descarte`
  ADD PRIMARY KEY (`idDescarte`),
  ADD KEY `DNIAgente` (`DNIAgente`),
  ADD KEY `numeroDeSerie` (`numeroDeSerie`);

--
-- Indices de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  ADD PRIMARY KEY (`idLaboratorio`),
  ADD UNIQUE KEY `nombreLaboratorio` (`nombreLaboratorio`);

--
-- Indices de la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  ADD PRIMARY KEY (`numeroDeSerie`),
  ADD KEY `numeroDeLote` (`numeroDeLote`),
  ADD KEY `idLaboratorio` (`idLaboratorio`),
  ADD KEY `idDepositoNacional` (`idDepositoNacional`),
  ADD KEY `idDepositoProvincial` (`idDepositoProvincial`),
  ADD KEY `idCentroDeVacunacion` (`idCentroDeVacunacion`);

--
-- Indices de la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD PRIMARY KEY (`numeroDeLote`),
  ADD KEY `idLaboratorio` (`idLaboratorio`);

--
-- Indices de la tabla `patologiabase`
--
ALTER TABLE `patologiabase`
  ADD PRIMARY KEY (`DNI`,`patologiaBase`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`idRegistro`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `traslado`
--
ALTER TABLE `traslado`
  ADD PRIMARY KEY (`idTraslado`),
  ADD UNIQUE KEY `traslado_idCentroDeVacunacion_numeroDeSerie_unique` (`numeroDeSerie`,`idCentroDeVacunacion`),
  ADD KEY `idCentroDeVacunacion` (`idCentroDeVacunacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  MODIFY `idAplicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `centrodevacunacion`
--
ALTER TABLE `centrodevacunacion`
  MODIFY `idCentroDeVacunacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `depositonacional`
--
ALTER TABLE `depositonacional`
  MODIFY `idDepositoNacional` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `depositoprovincial`
--
ALTER TABLE `depositoprovincial`
  MODIFY `idDepositoProvincial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `descarte`
--
ALTER TABLE `descarte`
  MODIFY `idDescarte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `laboratorio`
--
ALTER TABLE `laboratorio`
  MODIFY `idLaboratorio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  MODIFY `numeroDeSerie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  MODIFY `numeroDeLote` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `registro`
--
ALTER TABLE `registro`
  MODIFY `idRegistro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `traslado`
--
ALTER TABLE `traslado`
  MODIFY `idTraslado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agentedesalud`
--
ALTER TABLE `agentedesalud`
  ADD CONSTRAINT `agentedesalud_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `aplicacion`
--
ALTER TABLE `aplicacion`
  ADD CONSTRAINT `aplicacion_ibfk_1` FOREIGN KEY (`DNIPaciente`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aplicacion_ibfk_2` FOREIGN KEY (`DNIAgente`) REFERENCES `agentedesalud` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aplicacion_ibfk_3` FOREIGN KEY (`numeroDeSerie`) REFERENCES `loteinterno` (`numeroDeSerie`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `descarte`
--
ALTER TABLE `descarte`
  ADD CONSTRAINT `descarte_ibfk_1` FOREIGN KEY (`DNIAgente`) REFERENCES `agentedesalud` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `descarte_ibfk_2` FOREIGN KEY (`numeroDeSerie`) REFERENCES `loteinterno` (`numeroDeSerie`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `loteinterno`
--
ALTER TABLE `loteinterno`
  ADD CONSTRAINT `loteinterno_ibfk_1` FOREIGN KEY (`numeroDeLote`) REFERENCES `loteproveedor` (`numeroDeLote`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `loteinterno_ibfk_2` FOREIGN KEY (`idLaboratorio`) REFERENCES `laboratorio` (`idLaboratorio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `loteinterno_ibfk_3` FOREIGN KEY (`idDepositoNacional`) REFERENCES `depositonacional` (`idDepositoNacional`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `loteinterno_ibfk_4` FOREIGN KEY (`idDepositoProvincial`) REFERENCES `depositoprovincial` (`idDepositoProvincial`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `loteinterno_ibfk_5` FOREIGN KEY (`idCentroDeVacunacion`) REFERENCES `centrodevacunacion` (`idCentroDeVacunacion`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `loteproveedor`
--
ALTER TABLE `loteproveedor`
  ADD CONSTRAINT `loteproveedor_ibfk_1` FOREIGN KEY (`idLaboratorio`) REFERENCES `laboratorio` (`idLaboratorio`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `patologiabase`
--
ALTER TABLE `patologiabase`
  ADD CONSTRAINT `patologiabase_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `registro_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`DNI`) REFERENCES `persona` (`DNI`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `traslado`
--
ALTER TABLE `traslado`
  ADD CONSTRAINT `traslado_ibfk_1` FOREIGN KEY (`numeroDeSerie`) REFERENCES `loteinterno` (`numeroDeSerie`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `traslado_ibfk_2` FOREIGN KEY (`idCentroDeVacunacion`) REFERENCES `centrodevacunacion` (`idCentroDeVacunacion`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Base de datos: `verduleria`
--
DROP DATABASE IF EXISTS `verduleria`;
CREATE DATABASE IF NOT EXISTS `verduleria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `verduleria`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mercaderia`
--

CREATE TABLE `mercaderia` (
  `idMercaderia` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock`
--

CREATE TABLE `stock` (
  `idStock` int(11) NOT NULL,
  `mercaderiaId` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `cantidadMinima` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idVenta` int(11) NOT NULL,
  `mercaderiaId` int(11) NOT NULL,
  `usuarioId` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precioTotal` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mercaderia`
--
ALTER TABLE `mercaderia`
  ADD PRIMARY KEY (`idMercaderia`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`idStock`),
  ADD KEY `mercaderiaId` (`mercaderiaId`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `mercaderiaId` (`mercaderiaId`),
  ADD KEY `usuarioId` (`usuarioId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mercaderia`
--
ALTER TABLE `mercaderia`
  MODIFY `idMercaderia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `stock`
--
ALTER TABLE `stock`
  MODIFY `idStock` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`mercaderiaId`) REFERENCES `mercaderia` (`idMercaderia`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`mercaderiaId`) REFERENCES `mercaderia` (`idMercaderia`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
