-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 13 2022 г., 15:11
-- Версия сервера: 5.7.29
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `skorodumov`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(1, 'Лазерный принтер'),
(2, 'Струйный принтер'),
(3, 'Термопринтер');

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_status` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `order_structure`
--

CREATE TABLE `order_structure` (
  `id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `country` varchar(255) NOT NULL,
  `year` int(11) NOT NULL,
  `model` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `title`, `img`, `price`, `country`, `year`, `model`, `count`, `id_category`) VALUES
(1, 'Принтер лазерный HP Laser', 'pr1.PNG', 18980, 'Китай', 2021, '107r черно-белый, цвет: белый', 20, 1),
(2, 'Принтер струйный HP Ink Tank ', 'pr2.PNG', 24990, 'Китай', 2021, '115 цветной, цвет: черный', 20, 2),
(3, 'Принтер лазерный HP Color LaserJet Laser ', 'pr3.PNG', 39990, 'Китай', 2020, '150a цветной, цвет: белый', 25, 1),
(4, 'Принтер струйный HP OfficeJet ', 'pr4.PNG', 15530, 'Корея', 2022, '202 цветной, цвет: черный', 10, 2),
(5, 'Термопринтер стационарный Brother ', 'pr5.PNG', 90940, 'Корея', 2022, 'PT-P950NW, светло-серый [ptp950nwr1]', 10, 3),
(6, 'Термопринтер стационарный TSC ', 'pr6.PNG', 46390, 'Корея', 2022, 'TC200, черный [99-059a003-6002]', 5, 3),
(7, 'Термопринтер стационарный TSC ', 'pr7.PNG', 95090, 'Россия', 2021, 'MB340T, черный [99-068a002-1202]', 5, 3),
(8, 'Принтер струйный Canon Pixma ', 'pr8.PNG', 10990, 'Китай', 2020, 'TS304 цветной, цвет: черный [2321c007]', 15, 2),
(9, 'Принтер лазерный Brother ', 'pr9.PNG', 17380, 'Корея', 2021, 'HL-L2300DR черно-белый, цвет: черный [hll2300dr1]', 8, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `title`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `patronymic` varchar(255) DEFAULT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `auth_key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `surname`, `patronymic`, `login`, `password`, `email`, `role_id`, `auth_key`) VALUES
(1, 'Виталий', 'Скородумов', 'Сергеевич', 'Vitalik', '$2y$13$Tm7kCJvyFOqhnfPOQvZ2vOCE0vd7bYopzt/aiufn396UkRUYDw7dK', 'pochta1@mail.ru', 2, 'wQSWx-T9HK1Mj8s8DzNsoFjCrk64oPn5'),
(2, 'Иван', 'Иванов', 'Иванович', 'admin', '$2y$13$XGX9.aG3CnITF7OQ/rCcIOLerYjA7yzJBdW0JsyECqT6jNA8gh9Ni', 'admin@gmail.com', 1, '8zsEkn9Wb6ZXlFWEE9uVJJ8iRG6F8eUB');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_ibfk_1` (`id_user`),
  ADD KEY `id_status` (`id_status`);

--
-- Индексы таблицы `order_structure`
--
ALTER TABLE `order_structure`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_product` (`id_product`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `password` (`password`),
  ADD KEY `role_id` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order_structure`
--
ALTER TABLE `order_structure`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`);

--
-- Ограничения внешнего ключа таблицы `order_structure`
--
ALTER TABLE `order_structure`
  ADD CONSTRAINT `order_structure_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_structure_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`);

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`);

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
