-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-09-2024 a las 00:25:06
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `appmoneda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE `ciudad` (
  `id_ciudad` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `pais_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`id_ciudad`, `nombre`, `pais_id`, `created_at`, `updated_at`) VALUES
(1, 'cali', 1, '2024-08-31 16:32:25', '2024-08-31 11:32:25'),
(2, 'Tokyo', 2, '2024-08-31 16:34:08', '2024-08-31 11:34:08'),
(3, 'New york', 3, '2024-08-31 16:34:08', '2024-08-31 11:34:08'),
(4, 'paris', 4, '2024-08-31 16:34:08', '2024-08-31 11:34:08'),
(5, 'Londres', 5, '2024-08-31 16:34:08', '2024-08-31 11:34:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id_log` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_08_31_141141_create_pais_table', 1),
(6, '2024_08_31_141211_create_ciudads_table', 1),
(7, '2024_08_31_141250_create_personas_table', 1),
(8, '2024_08_31_141318_create_moneda_simbolos_table', 1),
(9, '2024_08_31_141349_create_logs_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `moneda_simbolos`
--

CREATE TABLE `moneda_simbolos` (
  `id_monedasimbolo` bigint(20) UNSIGNED NOT NULL,
  `simbolo` varchar(5) NOT NULL,
  `pais_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `nombre_moneda` varchar(50) NOT NULL,
  `codigo_moneda` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `moneda_simbolos`
--

INSERT INTO `moneda_simbolos` (`id_monedasimbolo`, `simbolo`, `pais_id`, `created_at`, `updated_at`, `nombre_moneda`, `codigo_moneda`) VALUES
(1, '¥', 2, '2024-08-31 16:39:53', '2024-08-31 11:39:53', 'YEN', 'JPY'),
(2, '$', 1, '2024-08-31 16:39:53', '2024-08-31 11:39:53', 'PESO COLOMBIANO', 'COP'),
(3, '$', 3, '2024-08-31 16:39:53', '2024-08-31 11:39:53', 'DOLAR ESTADO UNIDENSE', 'USD'),
(4, '€', 4, '2024-08-31 16:39:53', '2024-08-31 11:39:53', 'EURO FRANCES', 'EUR'),
(5, '£', 5, '2024-08-31 16:39:53', '2024-08-31 11:39:53', 'LIBRA ESTARLINA INGLESA', 'GBP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE `pais` (
  `id_pais` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `iso` varchar(3) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`id_pais`, `nombre`, `iso`, `created_at`, `updated_at`) VALUES
(1, 'Colombia', 'COL', '2024-08-31 16:31:35', '2024-08-31 11:31:35'),
(2, 'Japon', 'JPN', '2024-08-31 16:31:54', '2024-08-31 11:31:54'),
(3, 'Estados unidos', 'USA', '2024-08-31 16:31:58', '2024-08-31 11:31:58'),
(4, 'Francia', 'FRA', '2024-08-31 16:32:01', '2024-08-31 11:32:01'),
(5, 'Reino unido', 'GBR', '2024-08-31 16:32:03', '2024-08-31 11:32:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id_personas` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `cedula` varchar(50) NOT NULL,
  `fecha_nacimiento` datetime NOT NULL,
  `estado` varchar(255) NOT NULL,
  `pais_id` bigint(20) UNSIGNED DEFAULT NULL,
  `usuario_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `estado` int(11) DEFAULT 1,
  `fecha_inactivacion` datetime DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_usuario`, `email`, `email_verified_at`, `password`, `estado`, `fecha_inactivacion`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'R8l1s1996@hotmail.es', NULL, 'onichan', 1, NULL, NULL, '2024-08-31 16:47:32', '2024-08-31 11:47:32');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id_ciudad`),
  ADD KEY `ciudad_pais_id_foreign` (`pais_id`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id_log`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `moneda_simbolos`
--
ALTER TABLE `moneda_simbolos`
  ADD PRIMARY KEY (`id_monedasimbolo`),
  ADD KEY `moneda_simbolos_pais_id_foreign` (`pais_id`);

--
-- Indices de la tabla `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id_pais`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id_personas`),
  ADD KEY `personas_pais_id_foreign` (`pais_id`),
  ADD KEY `personas_usuario_id_foreign` (`usuario_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id_ciudad` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id_log` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `moneda_simbolos`
--
ALTER TABLE `moneda_simbolos`
  MODIFY `id_monedasimbolo` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pais`
--
ALTER TABLE `pais`
  MODIFY `id_pais` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id_personas` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_usuario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `ciudad_pais_id_foreign` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id_pais`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `moneda_simbolos`
--
ALTER TABLE `moneda_simbolos`
  ADD CONSTRAINT `moneda_simbolos_pais_id_foreign` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id_pais`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_pais_id_foreign` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id_pais`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `personas_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
