-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Авг 07 2017 г., 15:27
-- Версия сервера: 5.7.19-0ubuntu0.17.04.1
-- Версия PHP: 7.0.18-0ubuntu0.17.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Burgers`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Orders`
--

CREATE TABLE `Orders` (
  `id` int(11) NOT NULL,
  `Address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `User_id` int(11) NOT NULL,
  `Comment` text COLLATE utf8_unicode_ci,
  `isPayForCard` tinyint(1) NOT NULL,
  `isCallback` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `Orders`
--

INSERT INTO `Orders` (`id`, `Address`, `User_id`, `Comment`, `isPayForCard`, `isCallback`) VALUES
(8, 'Улица 9 maya д. 9 корпус 8 кв. 9 этаж 0', 72, 'ровапл ыповлпрл ывлпвл', 1, 1),
(10, 'Улица 9 maya д. 9 корпус 8 кв. 9 этаж 0', 120, 'ровапл ып', 1, 1),
(11, 'Улица 9 maya д. 9 корпус 8 кв. 9 этаж 0', 120, 'ровапл ып', 1, 1),
(12, 'Улица 9 maya д. 9 корпус 8 кв. 9 этаж 0', 120, 'ровапл ып', 1, 1),
(13, 'Улица 9 maya д. 9 корпус 8 кв. 9 этаж 0', 120, 'ровапл ып', 1, 1),
(14, 'Улица 9 maya д. 9 корпус 8 кв. 9 этаж 0', 120, 'ровапл ып', 1, 1),
(15, 'Улица 9 maya д. 9 корпус 8 кв. 9 этаж 0', 120, 'ровапл ып', 1, 1),
(16, 'Улица 9 maya д. 9 корпус 8 кв. 9 этаж 0', 134, 'ровапл ып', 1, 1),
(17, 'Улица 9 maya д. 9 корпус 8 кв. 9 этаж 0', 134, 'ровапл ып', 1, 1),
(18, 'Улица 9 maya д. 9 корпус 8 кв. 9 этаж 0', 134, 'ровапл ып', 1, 1),
(19, 'Улица 9 maya д. 9 корпус 8 кв. 9 этаж 0', 134, 'ровапл ып', 1, 1),
(20, 'Улица 9 maya д. 9 корпус 8 кв. 9 этаж 0', 134, 'ровапл ып', 1, 1),
(21, 'Улица 9 maya д. 9 корпус 8 кв. 9 этаж 0', 134, 'ровапл ып', 1, 1),
(22, 'Улица 9 maya д. 1 корпус 1 кв. 1 этаж 1', 135, '1434c 2eqr', 1, 1),
(23, 'Улица 9 maya д. 1 корпус 1 кв. 1 этаж 1', 135, '1434c 2eqr', 1, 1),
(24, 'Улица 9 maya д. 1 корпус 1 кв. 1 этаж 1', 135, '1434c 2eqr', 1, 1),
(25, 'Улица 9 maya д. 34 корпус 45 кв. 4 этаж 4', 136, '45645', 1, 1),
(26, 'Улица 9 maya д. 34 корпус 45 кв. 4 этаж 4', 136, '45645', 1, 1),
(27, 'Улица 9 maya д. 34 корпус 4 кв. 4 этаж 4', 29, '2345345643 345346', 1, 1),
(28, 'Улица 9 maya д. 34 корпус 4 кв. 4 этаж 4', 29, '2345345643 345346', 1, 1),
(29, 'Улица 9 maya д. 34 корпус 4 кв. 4 этаж 4', 29, '2345345643 345346', 1, 1),
(30, 'Улица 9 maya д. 34 корпус 4 кв. 4 этаж 4', 29, '23453 45643 345346', 1, 1),
(31, 'Улица 9 maya д. 34 корпус 4 кв. 4 этаж 4', 29, '23453 45643 345346', 1, 1),
(32, 'Улица 9 maya д. 34 корпус 4 кв. 4 этаж 4', 29, '23453 45643 345346', 1, 1),
(33, 'Улица 9 maya д. 34 корпус 4 кв. 4 этаж 4', 29, '23453 45643 345346', 1, 1),
(34, 'Улица 9 maya д. 34 корпус 4 кв. 4 этаж 4', 29, '23453 45643 345346', 1, 1),
(35, 'Улица 9 maya д. 6 корпус 6 кв. 6 этаж 6', 151, '67657', 1, 0),
(36, 'Улица 9 maya д. 5345 корпус 4 кв. 5 этаж 5', 157, '346456 кнке нкен', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE `Users` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`id`, `Name`, `Phone`, `Email`) VALUES
(29, 'Maxim Shirokov', '+7 (464) 575 67 56', 'proekt929@mail.ru'),
(31, 'Maxim Shirokov', '+7 (566) 786 78 67', 'proekt929@mail.r'),
(33, 'Maxim Shirokov', '', 'proekt929@mail.5'),
(34, 'Maxim Shirokov', '+7 (567) 68_ __ __', 'proekt92@mail.ru'),
(69, 'Maxim Shirokov', '+7 (456) 456 45 34', 'proekt944529@mail.ru'),
(72, 'Maxim Shirokov', '+7 (757) 687 97 89', 'proek56t929@mail.ru'),
(120, 'Maxim Shirokov', '+7 (757) 687 97 89', 'proek11t929@mail.ru'),
(134, 'Maxim Shirokov', '+7 (757) 687 97 89', 'prrroek11t929@mail.ru'),
(135, 'Maxim Shirokov', '+7 (243) 534 64 57', 'proekt1212929@mail.ru'),
(136, 'Maxim Shirokov', '+7 (235) 435 64 56', 'proe345464567kt929@mail.ru'),
(151, 'Maxim Shirokov', '+7 (575) 687 56 86', 'proekt7777929@mail.ru'),
(157, 'Maxim Shirokov', '+7 (534) 346 45 64', 'proek555t929@mail.ru');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Orders_id_uindex` (`id`),
  ADD KEY `Users_fk` (`User_id`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Users_id_uindex` (`id`),
  ADD UNIQUE KEY `Users_Email_uindex` (`Email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Orders`
--
ALTER TABLE `Orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `Users_fk` FOREIGN KEY (`User_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
