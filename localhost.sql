-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Фев 18 2019 г., 09:25
-- Версия сервера: 10.1.37-MariaDB-0+deb9u1
-- Версия PHP: 7.2.14-1+0~20190205200805.15+stretch~1.gbpd83c69

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Users`
--
CREATE DATABASE IF NOT EXISTS `Users` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `Users`;

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE `Users` (
  `User` text NOT NULL,
  `Password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`User`, `Password`) VALUES
('username', 'Password'),
('username', 'Password'),
('username', 'Password');
--
-- База данных: `inventory`
--
CREATE DATABASE IF NOT EXISTS `inventory` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `inventory`;

-- --------------------------------------------------------

--
-- Структура таблицы `Audio`
--

CREATE TABLE `Audio` (
  `id` int(11) DEFAULT NULL,
  `name` text,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `state` text,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `Audio`
--

INSERT INTO `Audio` (`id`, `name`, `quantity`, `price`, `state`, `comment`) VALUES
(45, 'Радиомикрофоны MIPRO MR-823 (база,2радиомикрофона)', 1, 2500, 'В работе', ''),
(46, 'Проводной микрофон Senheiser e 835s', 1, 3300, 'В работе', ''),
(47, 'Проводной микрофон Sony ECM - XM1', 3, 9000, 'В работе', ''),
(48, 'Петличный микрофон с базой MIPRO MT801', 1, 2500, 'В работе', ''),
(49, 'Проводной микрофон Senheiser K6 + ME 64', 1, 12000, 'В работе', ''),
(50, 'Наушники SONY MDR-7506', 2, 8000, 'В работе', ''),
(51, 'Наушники AudioTechnica ATH - M50', 2, 10000, 'В работе', ''),
(52, 'Гарнитура Beyerdinamic DT297', 2, 12000, 'В работе', ''),
(53, 'Усилитель распределитель HeadAMP4 ART', 2, 3000, 'В работе', ''),
(54, 'D-BOX ART Dpdb', 1, 1000, 'В работе', ''),
(55, 'Микшер YAMAHA MG102C', 1, 5000, 'В работе', ''),
(56, 'Микшер YAMAHA MG102C', 1, 5000, 'Необходим ремонт', ''),
(57, 'Микшер Allen&Heath ZED sixty 14FX ', 1, 13000, 'В работе', ''),
(58, 'Sennheiser HD 206', 1, 1200, 'В работе', ''),
(59, ' Гарнитура German Maestro ', 1, 3000, 'В работе', ''),
(60, 'PANASONIC RP-HT161', 8, 3000, 'В работе', '');

-- --------------------------------------------------------

--
-- Структура таблицы `Commutation`
--

CREATE TABLE `Commutation` (
  `id` int(11) DEFAULT NULL,
  `name` text,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `state` text,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `Commutation`
--

INSERT INTO `Commutation` (`id`, `name`, `quantity`, `price`, `state`, `comment`) VALUES
(61, 'Кабель SDI 50м + UTP', 1, 1700, 'В работе', ''),
(62, 'Кабель SDI 50м.', 4, 6200, 'В работе', ''),
(63, 'Кабель SDI 60м.', 2, 3600, 'В работе', ''),
(64, 'Кабель SDI 80м.', 4, 9600, 'В работе', ''),
(65, 'Кабель SDI 80м. + UTP', 2, 5000, 'В работе', ''),
(66, 'Кабель SDI 10м.', 3, 1400, 'В работе', ''),
(67, 'Кабель SDI 5м.', 8, 2680, 'В работе', ''),
(68, 'Кабель SDI 15 м.', 4, 2400, 'В работе', ''),
(69, 'Кабель SDI 25 м.', 2, 1100, 'В работе', ''),
(70, 'Сетевой фильтр 5 m', 1, 300, 'В работе', ''),
(71, 'Сетевой фильтр 1,5 m', 8, 2000, 'В работе', ''),
(72, 'Аудиокабель XLR 50 m', 6, 2100, 'В работе', ''),
(73, 'Аудиокабель XLR 15 m', 4, 1000, 'В работе', ''),
(74, 'Катушка UTP 300 метров', 5, 4000, 'В работе', ''),
(88, 'Удлинительные катушки 220v x 30м ', 2, 800, 'В работе', ''),
(89, 'Удлинительная катушка 220v x 40м', 1, 500, 'В работе', ''),
(90, 'Удлинительная катушка 220v x 80м', 2, 1000, 'В работе', ''),
(94, 'Аудиокабель XLR TO JACK', 4, 1000, 'Необходим ремонт', ''),
(95, 'Аудиокабель RCA TO MiniJACK', 4, 400, 'Необходим ремонт', '');

-- --------------------------------------------------------

--
-- Структура таблицы `Computer`
--

CREATE TABLE `Computer` (
  `id` int(11) DEFAULT NULL,
  `name` text,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `state` text,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `Computer`
--

INSERT INTO `Computer` (`id`, `name`, `quantity`, `price`, `state`, `comment`) VALUES
(1, 'Монитор DELL ST2320LF', 1, 9500, 'В работе', 'Выдан Диме Пилину'),
(2, 'Монитор ASUS PG221', 1, 6000, 'В работе', ''),
(3, 'Монитор VS 197D', 1, 2200, 'В работе', ''),
(4, ' Core i7-3770K; 4Gb DD3; GIGABYTE GA-Z77-D3H; GeForce GTX 1050; HDD WD 1000GB ; Карта захвата PCI blackmagic SDI', 1, 26800, 'В работе', ''),
(5, 'Core i7-7700; 16Gb DD4; Asus PRIME H270+; GeForce GTX 750Ti; SDD GOODRAM 256Gb; ; Карта захвата PCI blackmagic SDI x 2', 1, 38050, 'В работе', ''),
(6, 'Core i7-3770; 8Gb DD3; GIGABYTE GA-H61M-DS2V; GeForce GT 710;SSD KINGSTON 240GB; HDD ST 1000Gb; Карта PCI blackmagic DeckLink Mini Monitor x 2 ', 1, 25800, 'В работе', ''),
(7, 'Core i7-3770; 8Gb DD3; Asus P8z77-v Pro; HDD SG 2000Gb x 4; SSD Corsair 180Gb  DVD-RW ASUS; Карта захвата FD 422 x 3', 1, 405000, 'В работе', 'Система повторов'),
(8, 'Core i7-7700; 24Gb DDR4; GeForceGTX 1080;HDD  WD 2000 Gb x2; SDD ADATA 120Gb; SDD Transcend 240Gb', 1, 43500, 'В работе', ''),
(9, 'Core i7-7700; GigaByte GA-B250-HD3R; 12 Gb DDR4; GeForce GTX 780Ti; HDD ST 3000Gb; SSD SP 240Gb', 1, 33000, 'В работе', ''),
(10, 'Core i7-7700K; 16Gb DDR4; ASUS PRIME Z270-K; GeForce GTX 1060; TS 120Gb; ST 2000 Gb', 1, 28000, 'В работе', ''),
(11, 'Монитор Dell SE2717h/HX 27\"', 2, 11000, 'В работе', ''),
(12, 'SP PHD 3.0 1000Gb', 2, 3000, 'В работе', ''),
(13, 'ST BUP Slim Bl 2000Gb', 2, 4500, 'В работе', ''),
(14, 'Клавиатура мышь Logitech K220', 1, 600, 'В работе', ''),
(15, 'Клавиатура Logitech K120, мышь Logitech B100', 2, 1600, 'В работе', ''),
(16, 'Монитор Dell SE2416H', 1, 7600, 'В работе', ''),
(17, 'Монитор AOC 215L', 1, 2800, 'В работе', ''),
(18, 'SAMSUNG UE19D', 1, 5000, 'В работе', ''),
(19, 'w4 - hp proliant dl180 g6 | 4CPU x2GHz | 16GB RAM | 1 TB HDD (780GB free), 2TB HDD (1.4TB free)', 1, 54600, 'В работе', ''),
(20, 'w3 - hp proliant dl180 g6 | 8cpu x2.4GHz| 16GB RAM|2TB HDD(680GB free) ', 1, 72800, 'В работе', ''),
(21, 'wow - hp proliant dl180 g9 | 8CPU x2.1GHz | 65GB RAM| 300 GB HDD (95 GB free)', 1, 91000, 'В работе', ''),
(22, 'MV - Intel core i7 6700k 4GHz| 16GB RAM | Geforce GTS 450 | SSD 250 GB', 1, 21840, 'В работе', ''),
(23, 'NAS QNAP TS-231 + 4 HDD', 1, 14560, 'В работе', ''),
(24, 'hp proliant DL180G9 ', 1, 12000, 'В работе', ''),
(25, 'hp proliant DL180G6 ', 1, 18000, 'В работе', ''),
(26, 'vMix 4K ', 2, 39200, 'В работе', ''),
(27, 'proliant DL320e', 1, 11350, 'В работе', ''),
(28, 'Монитор DELL U2917W', 1, 13500, 'В работе', '');

-- --------------------------------------------------------

--
-- Структура таблицы `LastUpdate`
--

CREATE TABLE `LastUpdate` (
  `date` text NOT NULL,
  `id` text,
  `name` text,
  `changed` text,
  `state` text NOT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `LastUpdate`
--

INSERT INTO `LastUpdate` (`date`, `id`, `name`, `changed`, `state`, `comment`) VALUES
('2019-02-18 09:16:54', '1 (Computer)', 'Монитор DELL ST2320LF', 'k.merkulov', 'В работе', 'Выдан Диме Пилину'),
('2019-02-17 20:41:54', '23 (Computer)', 'NAS QNAP TS-231 + 4 HDD', 'k.merkulov', 'В работе', ''),
('2019-02-17 20:39:20', '94 (Commutation)', 'Аудиокабель XLR TO JACK', 'k.merkulov', 'Необходим ремонт', ''),
('2019-02-17 20:34:12', '95(Commutation)', 'Аудиокабель RCA TO MiniJACK', 'k.merkulov', 'Необходим ремонт', '');

-- --------------------------------------------------------

--
-- Структура таблицы `Others`
--

CREATE TABLE `Others` (
  `id` int(11) DEFAULT NULL,
  `name` text,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `state` text,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `Others`
--

INSERT INTO `Others` (`id`, `name`, `quantity`, `price`, `state`, `comment`) VALUES
(75, 'Роутер ASUS WL-520GU', 1, 1500, 'В работе', ''),
(76, 'Роутер TP-LINK TL-WR 841N', 1, 500, 'В работе', ''),
(77, 'Switch D-Link DSG-1008D', 1, 250, 'В работе', ''),
(78, 'Свет для камеры MINIMA LED Lighting', 1, 0, 'Необходим ремонт', ''),
(79, 'Рюкзак KATA 103', 3, 6000, 'В работе', ''),
(80, 'Штатив    Libec LS-38(2A)', 1, 12000, 'В работе', ''),
(81, 'Штатив    Libec LS-38(2A)', 1, 12000, 'Необходим ремонт', ''),
(82, 'Штатив LIBEC TH-650DV', 1, 5000, 'В работе', ''),
(83, ' Штатив SLIK ', 1, 3000, 'В работе', ''),
(84, 'Удочка для микрофона', 2, 1200, 'В работе', ''),
(85, 'Свет стационарный', 4, 5500, 'В работе', ''),
(86, 'Связь Intercom', 8, 0, 'В работе', '1 - сломана'),
(87, 'UPS APC 1500', 1, 10200, 'В работе', ''),
(91, 'Карты памяти SD  32Gb', 6, 1500, 'В работе', ''),
(92, 'AIR-SOFT VOYAGER ', 6, 4800, 'В работе', ''),
(93, 'Стол раскладной', 1, 1500, 'В работе', '');

-- --------------------------------------------------------

--
-- Структура таблицы `Video`
--

CREATE TABLE `Video` (
  `id` int(11) DEFAULT NULL,
  `name` text,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `state` text,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `Video`
--

INSERT INTO `Video` (`id`, `name`, `quantity`, `price`, `state`, `comment`) VALUES
(29, 'Камера SONY NX5E', 3, 324000, 'В работе', ''),
(30, 'Конвертер HD-SDI to HDMI EverFocus EHA-SRX', 1, 1500, 'В работе', ''),
(31, 'Конвертер HD-SDI to HDMI EverFocus EHA-SRX', 1, 1500, 'Ремонту не подлежит', ''),
(32, 'HDMI SPLITTER 1*4', 2, 800, 'В работе', ''),
(33, 'HD-SDI усилитель распределитель AJA HD5DA', 3, 15000, 'В работе', ''),
(34, 'HD-SDI REPEATER', 2, 3000, 'В работе', ''),
(35, 'Видео пульт DataVideo HS-2000', 1, 135000, 'В работе', ''),
(36, 'Видео пульт DataVideo HS-2800', 1, 270000, 'В работе', ''),
(37, 'TERADEK VIDIU', 1, 25000, 'В работе', ''),
(38, 'BlackMagik UPDownCross Converter', 2, 16000, 'В работе', ''),
(39, 'Nikon 810', 2, 97600, 'В работе', ''),
(40, 'Обьектив Nikon 28-300 3.5-6.3', 1, 18000, 'В работе', ''),
(41, 'Обьектив Nikon 70-200 2.8', 1, 43000, 'В работе', ''),
(42, 'SONY HDR-SR2E', 1, 0, 'В работе', 'Камера Сергея Васильевича'),
(43, 'BlackMagic SDI to HDMI converter', 1, 2000, 'В работе', ''),
(44, 'TV приставка MAG 254', 1, 1500, 'В работе', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
