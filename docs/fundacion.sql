-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-06-2016 a las 18:22:49
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fundacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_domains`
--

CREATE TABLE `core_domains` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `site_id` int(11) NOT NULL,
  `type` enum('park','redirect') NOT NULL DEFAULT 'park'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_settings`
--

CREATE TABLE `core_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores settings for the multi-site interface';

--
-- Volcado de datos para la tabla `core_settings`
--

INSERT INTO `core_settings` (`slug`, `default`, `value`) VALUES
('date_format', 'g:ia -- m/d/y', 'g:ia -- m/d/y'),
('lang_direction', 'ltr', 'ltr'),
('status_message', 'This site has been disabled by a super-administrator.', 'This site has been disabled by a super-administrator.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_sites`
--

CREATE TABLE `core_sites` (
  `id` int(5) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ref` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `core_sites`
--

INSERT INTO `core_sites` (`id`, `name`, `ref`, `domain`, `active`, `created_on`, `updated_on`) VALUES
(1, 'Default Site', 'default', 'nucleo.local', 1, 1394062760, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_users`
--

CREATE TABLE `core_users` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Super User Information';

--
-- Volcado de datos para la tabla `core_users`
--

INSERT INTO `core_users` (`id`, `email`, `password`, `salt`, `group_id`, `ip_address`, `active`, `activation_code`, `created_on`, `last_login`, `username`, `forgotten_password_code`, `remember_code`) VALUES
(1, 'brayan.acebo@imaginamos.co', '338bccf91d210f7f31577bfdd9e26937e4fbc469', '02dcb', 1, '', 1, '', 1394062758, 1394802644, 'brayanacebo', NULL, 'd95f7f92800589c4acec3978799d78589181fbfa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_about_us`
--

CREATE TABLE `default_about_us` (
  `id` int(11) NOT NULL,
  `footer` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_about_us`
--

INSERT INTO `default_about_us` (`id`, `footer`, `intro`, `video`, `text`, `lang`) VALUES
(1, 'Somos <strong>gente9</strong> con mente abierta, innovadores y con pensamiento social', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consequatur doloremque, nihil sit magni quibusdam qui alias nisi, dignissimos incidunt tenetur quia at illum blanditiis praesentium veritatis, rem asperiores aliquid accusamus!', 'uploads/default/about_us/f01283d5eb354687da06ecf8f55d1368.mp4', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore architecto dolor ipsa consectetur iusto iure consequuntur aliquam. Ad impedit temporibus deleniti quo possimus, ut quod iusto placeat <strong>expedita suscipit</strong> reiciendis!<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur <strong>adipisicing</strong> elit. Eaque nesciunt fugit dicta similique tenetur iste aliquam asperiores, molestias, excepturi vitae maxime voluptate earum tempore, facere porro nihil cupiditate! Quibusdam, earum. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolore architecto dolor ipsa consectetur iusto iure <strong>consequuntur</strong> aliquam. Ad impedit temporibus deleniti quo possimus, ut quod iusto placeat expedita suscipit reiciendis! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eaque nesciunt fugit dicta <strong>similique</strong> tenetur iste aliquam asperiores, molestias, excepturi vitae maxime voluptate earum tempore, facere porro nihil cupiditate! Quibusdam, earum.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur <strong>adipisicing</strong> elit. Dolore architecto dolor ipsa consectetur iusto iure consequuntur aliquam. Ad impedit temporibus deleniti quo possimus, ut quod iusto placeat expedita <strong>suscipit</strong> reiciendis!', 'es'),
(2, 'title', 'uploads/default/about_us/323a6572619b28ec198330bfa20bf2e1.jpg', '', 'text', 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_about_us_allies`
--

CREATE TABLE `default_about_us_allies` (
  `id` int(11) NOT NULL,
  `name` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_about_us_allies`
--

INSERT INTO `default_about_us_allies` (`id`, `name`, `image`) VALUES
(2, 'imagen 1', 'uploads/default/about_us/61d18e973f32e59b8ec9dae75971e6b1.jpg'),
(3, 'imagen 2', 'uploads/default/about_us/b340f5c83a0c9aa985f46382a93dd42f.jpg'),
(4, 'imagen 3', 'uploads/default/about_us/38cca2f024e1be8039746e5ed1af112f.jpg'),
(5, 'imagen 4', 'uploads/default/about_us/bd41d7a4a7de1f827901c3899293eca5.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_about_us_intro`
--

CREATE TABLE `default_about_us_intro` (
  `id` int(11) NOT NULL,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `section` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_about_us_intro`
--

INSERT INTO `default_about_us_intro` (`id`, `title`, `intro`, `image`, `text`, `section`) VALUES
(1, 'Acerca De', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit molestias, amet atque praesentium sequi, est nostrum et officia asperiores. Earum expedita explicabo odio minima aliquid, est dolorum facilis eaque asperiores!&nbsp;pisicing elit. Impedit molestias, amet atque praesentium sequi, est nostrum et officia asperiores.', 'uploads/default/about_us_multiples/67458f26ffe3e3e4d22117ca220f71eb.jpg', '<strong>HISTORIA</strong><br />\r\n<br />\r\nAtque praesentium sequi, est nostrum et officia asperiores. Earum expedita explicabo odio minima aliquid, est dolorum facilis eaque asperiores!&nbsp;atque praesentium sequi, est nostrum et officia asperiores. Earum expedita explicabo odio minima aliquid, est dolorum facilis eaque asperiores!', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_about_us_multiples`
--

CREATE TABLE `default_about_us_multiples` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `slug` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `introduction` text COLLATE utf8_unicode_ci,
  `date` datetime DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `outstanding` int(1) DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_about_us_partners`
--

CREATE TABLE `default_about_us_partners` (
  `id` int(11) NOT NULL,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_about_us_partners`
--

INSERT INTO `default_about_us_partners` (`id`, `image`, `link`) VALUES
(6, 'uploads/default/about_us_multiples/f80c004c7a066e3e8a6ab0d7d99490c7.png', 'http://www.jcs-arqs.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_about_us_slide`
--

CREATE TABLE `default_about_us_slide` (
  `id` int(11) NOT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `link` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_about_us_slide`
--

INSERT INTO `default_about_us_slide` (`id`, `image`, `link`) VALUES
(5, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem magni, alias esse sit soluta.&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem magni, alias esse sit soluta.&nbsp;', 'EMPAQUES'),
(6, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem magni, alias esse sit soluta. Officiis fuga ab magnam aperiam fugiat excepturi iure consequatur nam. Laudantium sapiente earum illo necessitatibus.&nbsp;', 'POR QUE CONTRATARNOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_ask`
--

CREATE TABLE `default_ask` (
  `id` int(11) NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci,
  `title1` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text1` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title2` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text2` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_ask`
--

INSERT INTO `default_ask` (`id`, `text`, `title1`, `text1`, `title2`, `text2`, `footer`, `lang`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit eius nisi expedita voluptatibus suscipit laborum labore delectus accusantium, maiores, tempora sapiente deserunt, illum, soluta quo iste libero veritatis dignissimos consequatur.', 'consectetur adipisicing elit', 'Lorem ipsum dolor sit amet. Dicta debitis ipsa molestias perferendis.', 'Cuéntanos más como ayudarte', 'Lorem ipsum dolor sit amet, consectetur', 'Somos <strong>gente9</strong> con mente abierta, innovadores y con pensamiento social', 'es'),
(2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit eius nisi expedita voluptatibus suscipit laborum labore delectus accusantium, maiores, tempora sapiente deserunt, illum, soluta quo iste libero veritatis dignissimos consequatur.s', 'consectetur adipisicing elit', 'Lorem ipsum dolor sit amet. Dicta debitis ipsa molestias perferendis.', 'Cuéntanos más como ayudarte', 'Lorem ipsum dolor sit amet, consectetur', 'Somos <strong>gente9</strong> con mente abierta, innovadores y con pensamiento socials', 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_ask_allies`
--

CREATE TABLE `default_ask_allies` (
  `id` int(11) NOT NULL,
  `name` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_ask_allies`
--

INSERT INTO `default_ask_allies` (`id`, `name`, `image`, `text`, `lang`) VALUES
(1, 'Consultor 1', 'uploads/default/ask/3eae99256ae61d5b542feb08f8c283aa.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'es'),
(2, 'Consultor 2', 'uploads/default/ask/37a687841cd85eab82377c932a81f37e.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'es'),
(3, 'Consultor 3', 'uploads/default/ask/55eb6a2179a1d7a0e98adc4e8863f35a.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.', 'en'),
(4, 'Consultor 4', 'uploads/default/ask/5c8ccd02b4247f10e9207d9adb25c9ef.png', 'Lorem Ipsum dolor sit amet', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_ask_mail`
--

CREATE TABLE `default_ask_mail` (
  `id` int(11) NOT NULL,
  `place` varchar(445) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(445) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `date` datetime DEFAULT NULL,
  `status` int(2) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_ask_mail`
--

INSERT INTO `default_ask_mail` (`id`, `place`, `type`, `message`, `date`, `status`) VALUES
(1, 'colombia', 'Consultor 2', 'consulta', '2015-05-20 14:17:39', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_blog`
--

CREATE TABLE `default_blog` (
  `id` int(9) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `keywords` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `comments_enabled` enum('no','1 day','1 week','2 weeks','1 month','3 months','always') COLLATE utf8_unicode_ci NOT NULL DEFAULT '3 months',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `type` set('html','markdown','wysiwyg-advanced','wysiwyg-simple') COLLATE utf8_unicode_ci NOT NULL,
  `preview_hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image` char(15) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_blog`
--

INSERT INTO `default_blog` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `intro`, `title`, `slug`, `category_id`, `body`, `parsed`, `keywords`, `author_id`, `created_on`, `updated_on`, `comments_enabled`, `status`, `type`, `preview_hash`, `image`) VALUES
(1, '2014-03-06 14:12:00', '2014-03-06 14:12:00', 1, 1, '<span style="font-size: 13px;">Lorem Ipsum</span><span style="font-size: 13px;">&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto...</span>', 'Lorem Ipsum', 'lorem-ipsum', 0, 'Lorem Ipsum&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno est&aacute;ndar de las industrias desde el a&ntilde;o 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido us&oacute; una galer&iacute;a de textos y los mezcl&oacute; de tal manera que logr&oacute; hacer un libro de textos especimen. No s&oacute;lo sobrevivi&oacute; 500 a&ntilde;os, sino que tambien ingres&oacute; como texto de relleno en documentos electr&oacute;nicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creaci&oacute;n de las hojas &quot;Letraset&quot;, las cuales contenian pasajes de Lorem Ipsum, y m&aacute;s recientemente con software de autoedici&oacute;n, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.', '', '', 1, 1394111520, 1394111520, '3 months', 'live', 'wysiwyg-advanced', '', '0bcab0293fd6c5f');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_blog_categories`
--

CREATE TABLE `default_blog_categories` (
  `id` int(11) NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_chat`
--

CREATE TABLE `default_chat` (
  `id` int(9) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_hour` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_hour` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_chat`
--

INSERT INTO `default_chat` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `day`, `start_hour`, `end_hour`) VALUES
(1, '2014-10-31 16:38:04', NULL, 2, 1, 'Fri', '00:00', '23:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_chat_assign`
--

CREATE TABLE `default_chat_assign` (
  `id` int(9) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `assign_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assign_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assign_user_id` int(11) DEFAULT NULL,
  `assign_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `assign_start_on` datetime DEFAULT NULL,
  `assign_finished_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_chat_assign`
--

INSERT INTO `default_chat_assign` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `assign_name`, `assign_email`, `assign_user_id`, `assign_status`, `assign_start_on`, `assign_finished_on`) VALUES
(1, '2014-10-31 16:38:23', '2014-10-31 16:38:46', 2, 1, 'luis', 'luis.salazar@imagina.co', 2, 'close', '2014-10-31 16:38:30', '2014-10-31 16:38:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_chat_message`
--

CREATE TABLE `default_chat_message` (
  `id` int(9) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `message_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_assign_id` int(11) DEFAULT NULL,
  `message_sender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message_username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_chat_message`
--

INSERT INTO `default_chat_message` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `message_text`, `message_assign_id`, `message_sender`, `message_username`) VALUES
(1, '2014-10-31 16:38:23', NULL, 2, 1, 'prueba', 1, 'client', 'luis'),
(2, '2014-10-31 16:38:33', NULL, NULL, NULL, 'aja', 1, 'admin', 'Asesor'),
(3, '2014-10-31 16:38:46', NULL, 2, 2, 'La conversación ha finalizado, fue un placer atenderlo.', 1, 'admin', 'Asesor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_chat_state`
--

CREATE TABLE `default_chat_state` (
  `state` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_chat_state`
--

INSERT INTO `default_chat_state` (`state`) VALUES
(0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_ci_sessions`
--

CREATE TABLE `default_ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_ci_sessions`
--

INSERT INTO `default_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('dcc84001c1a318ead2d281cb8052a27d', '190.7.131.42', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2137.2 Safari/537.36', 1409265597, ''),
('540d005a76bd175aa22c33b7523a3e51', '157.55.39.193', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1409258421, ''),
('78def228a0b2f8126eace17bf2a9769e', '66.249.65.50', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1409258607, ''),
('d50fd111d7a1bc62dca16c894acd65e5', '66.249.65.50', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1409261355, ''),
('8d0ee489c2e9af77801868b0531230d9', '66.249.65.50', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1409258146, ''),
('9fa9f1da869ab5b42d3a1515ed080927', '66.249.65.66', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1409258146, ''),
('de56b3359966c6d3fef1807000190364', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1409048798, 'a:6:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('5cb53358edf2f7bb3124194f00c18d24', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1409049105, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('ba35ed247e2f3fd8ed80a73b11b895ad', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1409049105, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('c6a06eda31191f463dce9cd97f80fdc2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1409151866, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('e898cbe974c3093c325b13a65b3b4a7d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1409151875, ''),
('83933fbf63a54717d348105bc7595b44', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1409151876, 'a:1:{s:14:"admin_redirect";s:5:"admin";}'),
('1c8c764b5a19226a4e8ef33d3ad0dfee', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1409177834, 'a:6:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('49ffb9eb13971ccdfdcc42e6324ef7d4', '190.7.131.42', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1409175258, ''),
('cfd2a150c2bdf5f5879f2cf065846dd6', '190.9.192.75', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1409175440, ''),
('87650b0c52cd9e5a13533ce76cc7a933', '190.9.192.225', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1409194143, 'a:6:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('8beac25e4ac0a584f28bb81c8d33400f', '190.7.131.42', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1409181907, ''),
('04694a87eb864f76ef1cba491a151fc1', '190.7.131.42', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:31.0) Gecko/20100101 Firefox/31.0', 1409181973, ''),
('27604628c42bfe45f2c4b3a8e74137b1', '190.25.236.246', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1409183615, ''),
('13cc80504faef7cb7a90599ab6ee9f3b', '190.7.131.42', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1409186549, 'a:1:{s:14:"admin_redirect";s:5:"admin";}'),
('c60c81cd09edf2922c709b43c8766e2c', '190.7.131.42', 'Mozilla/5.0 (Linux; Android 4.1.2; GT-I9300 Build/JZO54K) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mo', 1409195055, ''),
('a2e6a572f576e5d075d525285ee60854', '186.31.224.232', 'Mozilla/5.0 (Linux; Android 4.1.2; GT-I9300 Build/JZO54K) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.166 Mo', 1409195862, ''),
('61ef8ac0b8b62f97885f3a9a50719458', '190.13.109.249', 'Mozilla/5.0 (Linux; Android 4.2.1; BLU Life View Build/JOP40D) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.1', 1409195916, ''),
('96a9c6bb17a863ef0e5110ed59587f61', '157.55.39.193', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1409216038, ''),
('3831ef769a885d44f05bc653987b233c', '157.55.39.193', 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)', 1409216041, ''),
('be2bffa8aeeb0a7d3abde6d4ce624c06', '190.9.192.66', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1409245652, ''),
('312a1982c6310c8fc3152cf7066d2fd4', '66.249.65.50', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)', 1409258145, ''),
('203ade3257e3ae8d3409cd1d87458d01', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1409245225, ''),
('64f68165dd17d3f4aac725342f9414e2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1409746720, 'a:6:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('895bace3ac26baf6737d140ca9e32ad1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.143 Safari/537.36', 1409770208, 'a:1:{s:14:"admin_redirect";s:5:"admin";}'),
('a84dd5960621e6e5dab1ee16a69f956d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410172443, ''),
('1ed90a47de61c4b024a69c0642c8bed3', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410266145, ''),
('e16649919d8d4a107dbb288ea25d2e22', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410266151, 'a:1:{s:14:"admin_redirect";s:5:"admin";}'),
('37609c31332597aaf53ea2fa6066b198', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410272491, 'a:6:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('2618d45eef1601a413151bbff031d2ac', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410273697, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('bad3677d99a830d1f40d60044326f392', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410314975, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('cf66a448bb4db71ca032e934981eb8bd', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410380277, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('2058fe497524a9b4276cc42ec0106518', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410292844, ''),
('912d0d9218d367143f985c429a4f079d', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410294786, 'a:6:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('ac2ad0e57c94d4faeb76d4003269b059', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410294799, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('6627d726a5ac04f7229ef99c963843f5', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410294799, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('fc1091c4e6380ade4f972edd246de458', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410294799, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('dc75ee293e3b1b178f6fbab34193953b', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410294799, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('e88d1e3328a4c6cb70ba9a87a154f156', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410294799, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('c83158bb13b7ab466be095a65d77e608', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410294800, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('df20ff71e1659e52ecc8b9caf1652cbe', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410294800, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('af94a0f9534eae0e5cea1082f559a65b', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410294800, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('a6ba518b1db2b187affcb149bd45f6c8', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410294800, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('bc06fe6821605b212ed0e39e88cde087', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410294800, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('bee4f4da25fa2f49bd47e36ee434d0f7', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410294800, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('f67e90f6fd25d6a3293b820eeb16999b', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410294801, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('a4c57f69d3e4f557e98ed9a86ffa4c93', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410324229, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('561b14bd294701da1ce51e4d5062bcdf', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410299029, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('4e6e817387ee4ee3a335c3d96e61e973', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.103 Safari/537.36', 1410381708, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('073a66135998a57fc912e0d15b9acb4d', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36', 1410433008, ''),
('08eb2d5919c3dab35c79232216a4fd46', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36', 1411171774, 'a:6:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('1db572df94738a71f2891e00b7c3f4db', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.120 Safari/537.36', 1410433014, 'a:1:{s:14:"admin_redirect";s:5:"admin";}'),
('3a65580ca74060e42861b937871da2e6', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412009632, ''),
('33c8321564e990b3ce65afecae29b97c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412074557, 'a:6:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('da45f69571ee449ff4ad12c95817c77e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412075463, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('57edcf42d079a93a195e9eed1ec3e384', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412103216, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('2bf131c3d06cd8d1f7a035d258b3f5c7', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412113455, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('147e3bf4302a4930e1e173d347ab626f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412114114, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('225a0b6739a92e97b99b442e1e228c41', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412132043, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('7aff33275691c129bba84d4f66e78bb4', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412106845, ''),
('796ca845f8d55e887cb86be82d628958', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412247348, 'a:6:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('11055628a1d883e67d9879846fbd71ff', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412261107, 'a:6:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('3e4e85d2652f0b06f021ba7e1a2fa576', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412261110, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('b5cd10ce7960e1c6198cbaf30e978c6e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412269383, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('3eb63d24a04d46909eeee148a84d8d87', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412765239, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('1fbe90cea824099602bbb9f4bb3056c0', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412765252, ''),
('3f7cf95a77aeda265c9033029a4bd347', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412791335, 'a:6:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('acbc4b45d9d8a7da8f455323f0c1d249', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412793486, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('b33c56efe2cdfa430d37d7529a93c339', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412796421, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('a33acafaad089e085ebb19b8e0be9f0c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1412796424, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('54c726a2c909b1c8998bc2a04ec49547', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36', 1413806172, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('5b39cd063ce7d1a4023b0cbf8e4beb5f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36', 1413806180, 'a:1:{s:14:"admin_redirect";s:5:"admin";}'),
('51fa983f52b3aa4c42d63caa867ced7c', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36', 1414525553, 'a:7:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('750bdce90187ae58fa30f52b219d4c02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36', 1414170248, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('2d216fce4078e2e4a5afe0f5662c2399', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.104 Safari/537.36', 1414525560, 'a:6:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('ebb5ee9afb57fac857cd7e6a61401c11', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 1414786808, 'a:1:{s:14:"admin_redirect";s:5:"admin";}'),
('7974cf90ce0a9992a17ff5a9274ced0f', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 1415104335, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('dce6bcc4869418f61468658d5723a98a', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 1415127211, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('8320b16d4027d93ad42a55aa6f4295a8', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 1415151645, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('9c7d7611c80b532b220c3d5f154ed2fb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 1415739321, 'a:1:{s:14:"admin_redirect";s:5:"admin";}'),
('b69c97137851c365fe814ebd74faacad', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 1415760934, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('84732aa8e71652c6e0985b0cbf438ef3', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1421556353, 'a:7:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('b766f95dbb2b597e6af10eddf235d85b', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 1421869243, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('bd9b2cd96938f36abe00bdbbf76a8660', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 1421847155, 'a:1:{s:9:"lang_code";s:2:"en";}'),
('367915f44eccea277a3bb9ce91932eb7', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36', 1421815176, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('d5227e725cb243a94be2f976c101c635', '::1', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 1421868765, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('595969494897409e12daab41aa4e8e92', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 1424690146, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('07132ceb94bb95c229c5bd517b90f78e', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36', 1424690567, 'a:6:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('27f11868a18a2277af2691dc24bb9f68', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', 1426508669, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('f9fb9d0cc4bf0e8828e162d2ae3db4f5', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', 1426508671, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('9530ec86eeab3894c380308f8e4f08c4', '::1', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36', 1426509368, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('7608c03a623293db28c1c3859684ed01', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1426716460, 'a:7:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('b85db9fea57eef9d87ac76234d65ef86', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1427375524, 'a:7:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('ddc67113d24b90b61d80bc9504b94fd7', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1427314061, 'a:1:{s:9:"lang_code";s:2:"en";}'),
('1d08ca5e9def75af350060bb48da582d', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1427741156, 'a:7:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('231b1a93ce8eab860f39506ef5b22662', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1427460239, 'a:7:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('871b674e2218bb07277fd9f74ffff115', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1427485940, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('33ba01df02666ca2434c742c68b5572b', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1428355978, 'a:6:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('27a72f0d5e7c6b8659cb0f12a3752d73', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1428409500, 'a:7:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('d97dc59ccd536c0d3e0bf0e19e0899bf', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1428409503, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('c6554211853c253bb2e4713c18c3d9d9', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1428411591, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('47a4bb237a0b5177fc6a81953745692e', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1428411594, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('efa1551da6c61cb51f3402318f3b0652', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1428415274, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('f9c03e4f63d8a245876f2307262149f8', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1428415276, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('b87a3add776868278275b4b3a4e3e2d1', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1428415278, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('fb38fa3eb3d184523bdf8d3c25983d9f', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1428415579, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('23861d75a42a2a6acb0a53707ba9b293', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1428417327, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('77ba14cd98951781953b5a0b66726ee8', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1428419237, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('df66f6e5d83d8e37a5d86627294d6ec7', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1428432242, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('ec85485b1424729fba8087358b314802', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1429565130, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('8d888918063f13feb583f8309d1f3bac', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36', 1429550323, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('0d3f329015ef076f5ea99d84c6e8121b', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1429551516, 'a:1:{s:14:"admin_redirect";s:13:"admin/widgets";}'),
('6964dd2d55984e879c17dc09e4ff5c65', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1429582264, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('e32d3d289c1ceb7d4f2cad99e35caa20', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1429582264, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('0021aab0247840b2f208f3069d8dc7b8', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1429582266, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('02db8532477a19cba8edc7f89eb2748b', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36', 1429590988, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('a687b0178d4ecbe34f7ff4d6de3f1ecc', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1430997899, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('2389f769279c9edef3bfd90c5821a72c', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1430998436, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('593eeb116b191c3b84a68b0341f694a8', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1430999551, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('383763c0b58e8222469523f851247995', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1430999803, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('63290a873ee6ce216efea7056497ced1', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431017296, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('e975a9baf91b0ce5078a3b6b05aa902e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431017464, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('8e81e4970cb6d6f609a6f285b6e0b0d7', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431030900, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('1e1bf85ccbf435d1197077bcfb72be66', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431109170, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('4f171c00147066d3bd686dca08bb7a57', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431428346, 'a:2:{s:9:"lang_code";s:2:"es";s:14:"admin_redirect";s:5:"admin";}'),
('b8feeb8ed84c18969410444c0d98f4f9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431429854, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('6d8b6cec0949aad2646c8683fff8b724', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431459704, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('2c3e0b3f95478c85dc43dd64a1783625', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431436200, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('5df36b96262a7fd8ec2ff243924817c1', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431466693, 'a:7:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";s:16:"products_contact";a:1:{s:0:"";a:5:{s:2:"id";N;s:4:"name";N;s:11:"description";N;s:5:"image";s:22:"uploads/default/files/";s:6:"pagina";s:8:"products";}}}'),
('5765423309354619862ec7bdd236757e', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431477807, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('be22df07a8419603fad94d8669312449', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431456974, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('8ee740de0b6007c487d4c74e57091bef', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431494654, 'a:7:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";s:16:"products_contact";a:0:{}}'),
('0cd3649787544aba57fa0daab428ff77', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431520696, 'a:8:{s:9:"lang_code";s:2:"es";s:16:"products_contact";a:1:{s:0:"";a:5:{s:2:"id";N;s:4:"name";N;s:11:"description";N;s:5:"image";s:22:"uploads/default/files/";s:6:"pagina";s:8:"products";}}s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('f4d5e25f6ce50000f0c67f7d1a0113a2', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431521026, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('a092b54083a81da5727e036d3771e737', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431527909, 'a:7:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";s:16:"products_contact";a:0:{}}'),
('5f0644064b8a08f513fbcfa288a9f6a9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431531353, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('94da8a4cd19475d73355ffd0f15e6849', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431557448, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('d125347dfb667072143cd19aa3d4e401', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431536556, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('d30ca78c3a05d586b8c0d88abcb43d69', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431569718, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('f8730ed7c9201ee7f3e1abcc64c681b9', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431610370, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('9c85fcdcc2b9da800fdeddf6a3c258cc', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431610397, ''),
('431e04011f61a5fa8ba803358497d200', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431610399, ''),
('8f6144bbc185888a7f1d2b4e4242f614', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431621591, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('bb3dc3e2befb1eb2c33dd8d3c2d0d49c', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431621595, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('ceaffffd303087814933dfa6da598fc3', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431632755, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('b19c6c8700349f0d6556123ac8793391', '181.143.140.59', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36', 1431640912, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('35ee7fa1788e65fd7d2159760c73c0fa', '181.143.140.59', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1431704067, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('177e36902a9aff769fac6195c3e1f010', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1432063950, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('ab15c8fdf1fbe7913cdf7c3a578ca742', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1432063951, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('1afb324e85279e65ec1762babf9a3d5b', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1432121872, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('38b79140047cd0077726f16ec6bde8c7', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1432207715, 'a:8:{s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";s:16:"products_contact";a:0:{}}'),
('3253abbc60a5f72b171869564af03ee6', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1432145011, 'a:6:{s:8:"username";s:7:"usuario";s:5:"email";s:18:"usuario@imagina.co";s:2:"id";s:1:"5";s:7:"user_id";s:1:"5";s:8:"group_id";s:1:"2";s:5:"group";s:4:"user";}'),
('3247d5243f6ff81419278bb404b03701', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1432145642, 'a:6:{s:8:"username";s:7:"usuario";s:5:"email";s:18:"usuario@imagina.co";s:2:"id";s:1:"5";s:7:"user_id";s:1:"5";s:8:"group_id";s:1:"2";s:5:"group";s:4:"user";}'),
('d4c0191fbe9166c5271a807f93a11a56', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36', 1432238405, 'a:8:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";s:16:"products_contact";a:0:{}s:16:"services_contact";a:0:{}}'),
('ff69942403f79ed525f556d79c1fc474', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432841660, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('8fb7784a44b017818d67fbb2f1a37e9a', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432904750, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('00ff25e86a1aedca2c262b3fd8abf549', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432905346, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('f48e516fbfe2d8682dc73e12df8e8981', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928906, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('bcda56583369bdee7fee6aae42a62481', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928911, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('a0461c1e75fb87dcf45beafa58ea27fe', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928913, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('50015ba11ecbfe4b09f0ec7cf832f682', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928918, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('d9b1ff9594cb5d7086cfb920ceddb63e', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928919, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('5b23991f328e6779d5387f81079c647c', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928920, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('e420b0f152f8e46b4f9b413e2d13cd07', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928921, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('2c7e9be95c2bd0aa309ddc5b186585e4', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928922, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('8839e889d0dfd7f2f2fa94e9817eed44', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928923, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('db9b9a2ded6c1b8ff9989a1e79242341', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928924, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}');
INSERT INTO `default_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('38d222a88b3d1e1e15e80f669c2e1fb9', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928925, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('012a6a24af83dbac856c9e2d55b9bbdd', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928926, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('2160a258ecc52cfcab15be66607c3b20', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928928, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('f6e6384d43f232e169a9fb5a05edbe6b', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928929, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('f51126cb329500dbe95f99e00ff7d97d', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928930, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('f203e6a5192c6d1be51bfc0c57b190d8', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928931, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('a8064eb058e55fa056d9dacaa21052ae', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928932, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('e2c487e24177ef480b7ecd16e90c5888', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928933, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('8a8b743537b07cb872548aefeaa8e062', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928934, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('f92122b3db2f778384b551824162ff22', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928934, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('fcf9496c80e6ac3a43033b4ad25ea7b1', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928935, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('e49cc33d9aa2086ab8ce093161a224a0', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928936, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('89bce0bf3a6b3025aa58004d4c7979bb', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928938, ''),
('f27bd2ab91afc4f76f4a9957806ad4e6', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928938, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('c6559542f582371260eb0fabdf801514', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928939, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('cf391ec48e4a21cf22a9fbe47dfb0b13', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928940, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('ac8d8d0e2fed6862af9e63ee6ccc7a67', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928941, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('4e51247acef9db688051c6f8d93d04d0', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928942, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('5244afb15647fe3e92ac77b6b7a970c4', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928943, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('30a8632d80423bd74bfe52b9da7a0c90', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928944, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('cb27b0ce942634f9d92260f919d7d625', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928945, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('f60b2c2095a305db38d37db2c762d3fd', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928946, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('2fea8f6a4f615708bbfacd225de7e33d', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432928947, ''),
('4471dda1d70a1eb1f896bb581aa0c5a8', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432929999, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('7f33d18a54ed9283c30cffeb134cc253', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1432930613, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('816ef4705b197991d251cc79326b7023', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1433184722, 'a:1:{s:17:"flash:old:success";s:24:"Has salido de tu cuenta.";}'),
('f65a2f6ba82c02307249564ba8adff86', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1433361902, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('9cd7ba30e5d6778ed2a8da04f2ced4eb', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1433362985, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('6ca2a2ac079360476b2617b40b6b0f5b', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1433392852, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('32b183fa6abb89f935b11f9a08507015', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1433366574, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:10:"Juan.Perez";s:5:"email";s:16:"procesos@pha.com";s:2:"id";s:1:"3";s:7:"user_id";s:1:"3";s:8:"group_id";s:1:"3";s:5:"group";s:7:"cliente";}'),
('d73fbcdfeabae5edf2b2782cdfa31c12', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1433367773, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:10:"Juan.Perez";s:5:"email";s:16:"procesos@pha.com";s:2:"id";s:1:"3";s:7:"user_id";s:1:"3";s:8:"group_id";s:1:"3";s:5:"group";s:7:"cliente";}'),
('b8aabf76b291e603dc0292a52fabd987', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1433423004, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:10:"Juan.Perez";s:5:"email";s:16:"procesos@pha.com";s:2:"id";s:1:"3";s:7:"user_id";s:1:"3";s:8:"group_id";s:1:"3";s:5:"group";s:7:"cliente";}'),
('d6588e994febb5122926697182c5f806', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36', 1433450695, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('4ab6038b186859e58c07106c5da568ae', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36', 1433936987, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('1115bb7d52c4d6a18ec0020bd85cfa9d', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36', 1433972341, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('ab0010a1d7f5dfb21da25d9825aaaf75', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36', 1433972612, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('057523a28714a08b4575b92bc57d98cd', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36', 1434027893, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('d4a51d47078e2880df4119adff4b8bd3', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36', 1434032791, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('27a0b300853e2ef38ce1c67931a4bef4', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36', 1434054178, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('4678096326eedcaad377a5f41e27ef0c', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36', 1434137258, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('bc1c59b1f0f2518c37f4a1e4e35cf490', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 1435255819, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('5820493519f891be5dffc04b4ed0f702', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 1435843486, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('405b89ec757d6cd3cc0cf162647fad0b', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 1436204805, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('42254fddba4b7257147f91c61b37f76f', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 1435753976, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('b3987e170f957312a9718e0de4635106', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36', 1436267536, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('63ec8e9f98ef14c6706e01151be659c6', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36', 1436350645, 'a:1:{s:14:"admin_redirect";s:5:"admin";}'),
('1910ce5fdaff0d1229bb4751fa3523e2', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36', 1436354311, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('2b5aff84a600ea170cd0fe19dc572a9e', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36', 1436354311, 'a:5:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('a8bf3d70ae35d910bba2153d9412d02e', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36', 1436385025, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('3d41a4fba2948ee1639ced705da1728a', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36', 1436403973, 'a:8:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:16:"services_contact";a:1:{i:5;a:5:{s:2:"id";s:1:"5";s:4:"name";s:20:"Lorem Ipsum sit amet";s:11:"description";s:2107:"Nulla porttitor accumsan tincidunt. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada. <strong>Cras ultricies</strong> ligula sed magna dictum porta. Sed porttitor lectus nibh. Nulla porttitor accumsan tincidunt. Quisque velit nisi, pretium ut lacinia in, <strong>elementum id enim</strong>. Vivamus suscipit tortor eget felis porttitor volutpat. Cras ultricies ligula sed magna dictum porta. Quisque velit nisi, pretium ut lacinia in, elementum id enim.<br />\r\n<br />\r\nNulla porttitor accumsan tincidunt. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada. Cras <strong>ultricies ligula</strong> sed magna dictum porta. Sed porttitor lectus nibh. Nulla porttitor accumsan tincidunt. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus suscipit tortor eget felis porttitor volutpat. Cras ultricies ligula sed magna dictum porta. Quisque velit nisi, pretium ut lacinia in, elementum id enim.<br />\r\n<br />\r\n<span style="font-size: 13px; line-height: 20.7999992370605px;">Nulla porttitor accumsan tincidunt. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada. Cras&nbsp;</span><strong style="font-size: 13px; line-height: 20.7999992370605px;">ultricies ligula</strong><span style="font-size: 13px; line-height: 20.7999992370605px;">&nbsp;sed magna dictum porta. Sed porttitor lectus nibh. Nulla porttitor accumsan tincidunt. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Vivamus suscipit tortor eget felis porttitor volutpat. Cras ultricies ligula sed magna dictum porta. Quisque velit nisi, pretium ut lacinia in, elementum id enim.</span>\r\n\r\n<ul>\r\n <li>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.&nbsp;</li>\r\n <li>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.&nbsp;</li>\r\n <li>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.&nbsp;</li>\r\n <li>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.&nbsp;</li>\r\n</ul>";s:5:"image";s:103:"http://localhost/diegoteam/aceros-bonilla/uploads/default/services/21e63a93ada5ba1ba4e8759866567742.jpg";s:6:"pagina";s:8:"services";}}}'),
('dc3c0ed8e5e92882d5931c218e6bd023', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36', 1436384817, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('c780692a4b8103edbe996f09ff231cc4', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36', 1436388188, 'a:7:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";s:15:"flash:old:error";s:0:"";}'),
('f5d377a3c833130d39c8b95b0c41f69b', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36', 1436416876, 'a:6:{s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('e3571a43e5538a86c025337a56567998', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', 1436969705, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:12:"luis.salazar";s:5:"email";s:23:"luis.salazar@imagina.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('56a7da3247e3e760f43914f7d6350790', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', 1437416683, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('092ca21baec938433d69bd60791fe61b', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', 1437444223, 'a:6:{s:8:"username";s:7:"usuario";s:5:"email";s:18:"usuario@imagina.co";s:2:"id";s:1:"5";s:7:"user_id";s:1:"5";s:8:"group_id";s:1:"2";s:5:"group";s:4:"user";}'),
('c0ed785ca542d4f30344629f2d91dfa0', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', 1437563577, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('e0330d35b5bd482735a47857266c3526', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', 1437610336, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:18:"carolina.rodriguez";s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('6a1b596b1b07cd63d89de54fce7e2c2a', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.125 Safari/537.36', 1438736330, 'a:7:{s:8:"username";s:7:"usuario";s:5:"email";s:18:"usuario@imagina.co";s:2:"id";s:1:"5";s:7:"user_id";s:1:"5";s:8:"group_id";s:1:"2";s:5:"group";s:4:"user";s:9:"lang_code";s:2:"es";}'),
('bdd2ac656cb7ab55d8b8b044536e6e4d', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 1438883148, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('bcd7a518b6db46f4677b4756d3535938', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.125 Safari/537.36', 1438900178, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('56f06806b3a88b7bde32f71acd302886', '161.18.93.122', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 1438894779, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('ec3425e8f143ca16d1084257654a2772', '161.18.93.122', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 1438900035, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('8ad923667fa31a73ec24b5bd3b9ea0ce', '161.18.93.122', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 1438900192, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('1aaa80d4f9b56b32a2f1af6eda73dd99', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 1438900329, 'a:7:{s:8:"username";s:18:"carolina.rodriguez";s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('1df9f9caef3f0a5504fce5c37a290d1e', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 1439587643, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:18:"carolina.rodriguez";s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('c1773bb083ae54acaa65ff4bb5067d77', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.155 Safari/537.36', 1439591631, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('f18e51022aa62d516737b24081227847', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.155 Safari/537.36', 1439610185, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:18:"carolina.rodriguez";s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('b875803d563ffe6cbbfd273201b0a7db', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1439659351, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('283236eb92b1e24c8eacd99cd1516a8b', '181.56.157.46', 'Mozilla/5.0 (iPad; CPU OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H143 Safari/60', 1439659761, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('bf7f9322dbb6fdb0364cfc722860aa44', '186.103.75.216', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H143 ', 1439678827, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('a0f3a9bbdce70e8d9e2091aa28a9951d', '191.106.131.204', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H143 ', 1439691045, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('b540eb6b9c0d3a67dd5b9c78343afbc0', '186.30.107.17', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1439709865, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('c31feda1a1fe598060f201458b0b1efd', '186.30.107.17', 'Mozilla/5.0 (iPad; CPU OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H143 Safari/60', 1439732920, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('f2f0a599eec8edf4ae91912e4b4062c1', '186.98.126.199', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H143 ', 1439738519, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('8062bd88fff1e1f39c53eaaf034d5acb', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1440353766, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('696a405dfc4f0e4ab3935b15909dc8d9', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.155 Safari/537.36', 1439934607, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:18:"carolina.rodriguez";s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('6635e8a6da5c9ef27088c0534b0e2406', '181.56.157.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H143 ', 1439931295, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('aa042c41863803c907a36b5b30c939cb', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1439933065, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('82f7943ba7d5dab43cbd70137deb1c6e', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H32', 1439952403, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('1da0b180eb1a6003a336ef236b512514', '181.56.157.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H32', 1440109695, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('a87048ad5401cdb0dbcaedd6868bb8c1', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1440110676, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('e9c09446e8160efa6ecb066eb221907f', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1440110676, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('7bf8fa3fded311468a5fc28023940411', '181.56.157.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B410 ', 1440110677, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('9c1876b48fe7c0eab26f7af272a38009', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H321', 1440123341, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('6e0a221b98ee9ce7e2cf779e060a48dd', '190.147.109.115', 'Mozilla/5.0 (iPad; CPU OS 8_3 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12F69', 1440127272, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('69f9f85151709723ef073e585e4847d8', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H32', 1440204033, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('2df39f37a06d5776cb027a4e63ebb90a', '186.168.217.212', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H32', 1440215304, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('b9813be26b4fd326f37155cad0fbe7ef', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H32', 1440216507, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('11b4ffaca0cdfc2616ea2b5e82344305', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H32', 1440293967, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('6afb0ced2e920cb1646c0af0294138f5', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1440513205, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('46c575aa88e3e589a31cf82f4637fa63', '181.56.157.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B410 ', 1440513206, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('c805600599718827311b8bb83b39792c', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H321', 1440562629, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('3f882d14145c4a3fafe2d6f50bec8486', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H32', 1440563268, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('385da085fd22a7cdf790864f8ef57961', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H32', 1440595140, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('89f2c8eb8283f25bfc5749c3daea98dc', '186.98.3.108', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H32', 1440639981, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('67c60590f822322270a1bdfdd84be82e', '181.236.64.162', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H32', 1440649065, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('cae91a047057d8c13eb4785a1ec3a06d', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H32', 1440650970, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('842722572fd8f599dbba55bdf036d462', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H32', 1440683042, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('297ac0ef84a75b762a403d4573651360', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', 1440687327, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('8f328bc258b90a137c2f99f8bdae8dac', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', 1440693227, 'a:7:{s:8:"username";s:18:"carolina.rodriguez";s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('e16d9673bfd3491b37396f4bb2fdf60a', '191.104.46.200', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H32', 1440692273, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('75e3982c8256ffafc3d4eef4f0926c43', '191.110.45.78', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H32', 1440700475, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('307c4494b404a5b6264b4387f1eeafb5', '190.25.134.132', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1440710360, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('82c9c4cd744cefa90d1823ac26f97e2d', '190.25.134.132', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1440710360, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('44b640595a76c4fc62028e866f4159bc', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1440862946, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('2948d4c6d0e17bfbfe56707e1799c4ea', '181.56.157.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B410 ', 1440862947, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('a0cae737b0195b527b9de1ec6c84ff10', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1440968280, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('ead8a268bd5c8f889358a08e071d6d8c', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H321', 1441026995, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('e1533a1f45cf54fe9a37c993711f8321', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', 1441045717, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('c9e1ae547b13d9520be20a9f8c414840', '190.7.131.42', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', 1441045751, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('100e849eb9d18478ea0d29a820f4b66e', '190.25.134.132', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1441143806, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('87f1659661648032dd2c4748a4c5b9e9', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1441208575, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('6e075056cdbda4110c0702de98fdda8c', '181.56.157.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B410 ', 1441208576, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('1dc4401fd64f28ccc21f0f36cde75f32', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1441231942, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('b58bf0500b320feba6b09b3bfb8071dc', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Mobile/12H321', 1441283013, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('e11bf502d1f656ff04e38746bdbe377a', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', 1441290648, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:18:"carolina.rodriguez";s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('fd89bd6c07144c53a022ea1ec0c42269', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1441290269, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('0d4aad72deda40cd7bb31ca0a5470568', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1441290269, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('4872f00479b1f5e6964e62d4fc78080d', '190.25.134.132', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1441314037, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('20202ecbb025360065709951881c6e24', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', 1441811949, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('dcf096b1098333ff3b0b98211973227f', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', 1441376693, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('97b20be42aef5f57c33d23fe8f9a7d5a', '190.147.109.115', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1441566445, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('2b9a76b37aa63c6259693a3e979bca75', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B410 ', 1441566446, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('0af02408a348a8e6d6a7c2c94999f0ed', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442171007, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('6728d10e8897a9bbc745c26c23043c32', '186.99.101.33', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H32', 1441816629, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('4546f2cfd58bd181eea1a7f7a49ad188', '191.104.110.184', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_4_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12H32', 1441844334, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('4245623089605633ac113a5c1b5debc1', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1441920054, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('de619c3b3d6118536d32e79791f01d70', '181.56.157.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B410 ', 1441920055, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('64cf0e8dc73cfefd488006a800a6e3a6', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 1442007544, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('0db53b45b5b983ca68f426fe3fcd7d2c', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 1441927395, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('fb4fd01aa800beb3253fe1a6bfaa37c8', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 1442000753, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('6d26106bd685868c257b16fd122bfe2b', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 1442000754, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('937cb61527b64ae37282ddb7e2528c12', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 1442070942, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('d26a7446ff6143ab2ce0d10b67dc2f32', '181.143.140.58', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B43', 1442008160, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('6800795a5eaf371991e78d77f13f99d5', '186.29.98.7', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B43', 1442025700, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('799c6664b1579028881379355f9766b7', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 1442263048, 'a:8:{s:9:"lang_code";s:2:"es";s:8:"username";s:18:"carolina.rodriguez";s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:15:"flash:old:error";s:0:"";}'),
('c4bd8d1e98257c22b2e12d22f9752c9e', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 1442263325, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('e08d3d05602fd6227b28b4c5047003fb', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 1442263341, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('613ef3a340d9042a8b84e9675ce85b7b', '190.147.109.115', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442273954, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('5aadc45730df0c9f63cfc20058e4abd0', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B410 ', 1442273955, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('6306fb7b32b8c4849e227fc6ee0a47ab', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442343186, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('602c62b12705cd16a63cfcc25fd7a5c7', '190.147.109.115', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442461468, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('c5f61930fa1f54c6c8a850708cdb1447', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442504669, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('e1fdef06e674d05e32bed87ccd293d67', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 1442524371, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('9f6169b98764fd2327f1d40587e35f7c', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442526158, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('1b94dce0c82b89b77b062ecac6ada381', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442526849, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('14d4d33247617e17f584ff1d23038087', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 1442597566, 'a:7:{s:8:"username";s:13:"administrador";s:5:"email";s:22:"admin@escalaurbana.com";s:2:"id";s:1:"5";s:7:"user_id";s:1:"5";s:8:"group_id";s:1:"2";s:5:"group";s:4:"user";s:9:"lang_code";s:2:"es";}'),
('d174115ecfc28ccc1275466357647d22', '186.171.68.213', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_0 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13A344', 1442601774, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('918c5c02c03311156216e02e5a7360f0', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 1442622723, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:13:"administrador";s:5:"email";s:22:"admin@escalaurbana.com";s:2:"id";s:1:"5";s:7:"user_id";s:1:"5";s:8:"group_id";s:1:"2";s:5:"group";s:4:"user";}'),
('35818b3c54440bc6df22a18341102abb', '181.143.140.58', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442629031, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:13:"administrador";s:5:"email";s:22:"admin@escalaurbana.com";s:2:"id";s:1:"5";s:7:"user_id";s:1:"5";s:8:"group_id";s:1:"2";s:5:"group";s:4:"user";}'),
('ddab7e8cf7aea886cf725abc98ab1652', '181.143.140.58', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 1442609053, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('b3e4652000f5502dace677e8f6318873', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 1442609112, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('735dbe90f2770111fab3c39125cffa03', '181.235.237.214', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_0 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13A344', 1442669664, ''),
('abc4d59c7759a4f038ceca17b09f4100', '181.235.237.214', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_0 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13A344', 1442669664, ''),
('143a4fd6687d6e8a23498f6c632e99d0', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442682697, 'a:6:{s:5:"email";s:22:"admin@escalaurbana.com";s:2:"id";s:1:"5";s:7:"user_id";s:1:"5";s:8:"group_id";s:1:"2";s:5:"group";s:4:"user";s:9:"lang_code";s:2:"es";}'),
('a7fd0195b1c9a617a9f4b7ad19c60e92', '181.56.157.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B410 ', 1442682698, 'a:6:{s:5:"email";s:22:"admin@escalaurbana.com";s:2:"id";s:1:"5";s:7:"user_id";s:1:"5";s:8:"group_id";s:1:"2";s:5:"group";s:4:"user";s:9:"lang_code";s:2:"es";}'),
('7b0e6d636afcaff249a216f192f2a2ba', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442696564, 'a:6:{s:5:"email";s:22:"admin@escalaurbana.com";s:2:"id";s:1:"5";s:7:"user_id";s:1:"5";s:8:"group_id";s:1:"2";s:5:"group";s:4:"user";s:9:"lang_code";s:2:"es";}'),
('afe3c4bc71c421d657e2955ae94fefa9', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442768503, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('54dd0a00a4e377ba242440e9573bb6c6', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/600.8.9 (KHTML, like Gecko) Version/8.0.8 Safari/600.8.9', 1442871562, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('0027daf9e36dd25d182bd6ad5d4724f3', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 1442770632, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('d5f46001051efa4f9e57d6965518d457', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442945986, 'a:7:{s:8:"username";s:13:"administrador";s:5:"email";s:22:"admin@escalaurbana.com";s:2:"id";s:1:"5";s:7:"user_id";s:1:"5";s:8:"group_id";s:1:"2";s:5:"group";s:4:"user";s:9:"lang_code";s:2:"es";}'),
('5adf1361584a33757c02431afa87a78f', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442780857, 'a:1:{s:14:"admin_redirect";s:19:"admin/home/index/es";}'),
('e315a62e3fa8e81c5b81e18175cb3793', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442780857, ''),
('49dd0bbb32fe2f65e3e07a6ab7489e97', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442780861, 'a:1:{s:14:"admin_redirect";s:10:"admin/home";}'),
('a1f6dd8522dc7268e55ac95f66053765', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442780861, ''),
('edf27356cccec29ba39e930bff92fb4f', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442781357, 'a:1:{s:14:"admin_redirect";s:19:"admin/home/index/es";}'),
('e6b4243ff2ec8cd6cd28c2ef839cdff2', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442781225, 'a:1:{s:14:"admin_redirect";s:19:"admin/home/index/es";}'),
('6a9dbef7b7705eb7209c67b964f22edc', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442781226, ''),
('fb288e10de29cee4726f8004733dd1f8', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442781229, 'a:1:{s:14:"admin_redirect";s:10:"admin/home";}'),
('7b060e432f4b9cd678fb8dfcaab0d6fa', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442781229, ''),
('effa199aaa29d64ae08e939f8231ab26', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442781358, ''),
('cc1d5439b6e4fd55972bbc7be94a9232', '66.249.88.118', 'Google favicon', 1442839323, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('9d2375cf8168976000b6e3ab3b2b33f6', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442781570, 'a:1:{s:14:"admin_redirect";s:10:"admin/home";}'),
('2ca8a636afb7a3f1402290fa98c02e9c', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442781570, ''),
('fffe5f6465d74b101449b7235ce6c30d', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 1442843928, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('ae0e9ac1ae82c9d58831aa6736318ab5', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 1442938619, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:13:"administrador";s:5:"email";s:22:"admin@escalaurbana.com";s:2:"id";s:1:"5";s:7:"user_id";s:1:"5";s:8:"group_id";s:1:"2";s:5:"group";s:4:"user";}'),
('0691ef34eaeb2c9caffafcf0206e1506', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 1442881439, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:18:"carolina.rodriguez";s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('b63db524b9b7a7ded2ac02f2f763e372', '181.56.157.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_0 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13A344', 1442866601, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('0db964cb65c0be8b660f12602dd57c3f', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 1442871645, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('9812c7b650db828bf64acdf216353d3e', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 1442870952, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('c70919a3af3ee26c05ed005dbf29d720', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_0 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13A344', 1442883550, '');
INSERT INTO `default_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('6e765abdb659f208ec113643916dc3ea', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_0 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13A344', 1442884059, ''),
('6c2224cfdd70d06b9b8fc0090d908991', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_0 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13A344', 1442884059, ''),
('3d3d4a0458fd251914959d9acf08409a', '66.249.88.13', 'Google favicon', 1442927537, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('046e48ff5a569040ca95c58e419e50f0', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 1442930961, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('200be42bb61b7730df9eb53c7e903dc3', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 1442929439, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('6ec8c3e3c80c0eb9473b7307faae2d83', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 1442929790, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('d9aaae3e3135355931319e34610245db', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 1442948992, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:18:"carolina.rodriguez";s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('17d947e50b0a1803ac379ab308e7b344', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 1442932250, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('bc9b666b262e9e9b831f17b88f7e3ee9', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 1442939944, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('9d0713c9a01d37906bc605c4a868cb13', '181.56.157.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_0 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13A344', 1442938843, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('4e06a3fd0c106d3badddcfc9b9f23f80', '190.25.134.132', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/600.8.9 (KHTML, like Gecko) Version/8.0.8 Safari/600.8.9', 1442959021, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('cd60f9c275a55951e2c4288b3eaf16ff', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 1442940499, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('00285db701f72f5e26e9f44dd05d3bc8', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 1442940500, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('002131c77fc05b8be506f11b5060857c', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 1442949466, 'a:6:{s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('cb47e0574a8b5d0e11cb56994a895070', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 1442957280, 'a:6:{s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('31d2fe939c2c5bc0401098db5c250469', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 1442949798, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('33d22fa860634d4b31d2d5a9cb813e7d', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 1442951041, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('76d0ea31282d6d09bc6b7369318e6723', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 1442951273, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('e86984683c59b5df30bc16768e67761c', '181.143.140.58', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B43', 1442951381, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('49b804b9e2e9229517ea775a99d448ea', '181.143.140.58', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B43', 1442951430, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('d9dff34035c1b1d325a63a78921da990', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 1442951635, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('fc264cc9c9c6c1b18104e5adb54aeb4c', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 1442951747, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('efe4c83c5ed89ffde5e5c9706b2295dd', '181.143.140.58', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B43', 1442955358, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('759576893353af37f33c235a325bee49', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 1442956377, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('c33c5471f7357b60e3817dbd44cf6e98', '181.143.140.58', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 1442956475, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('54fcc284aa54b0d06e7bd161b5b76c2e', '181.143.140.58', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.1.25 (KHTML, like Gecko) Version/8.0 Safari/600.1.25', 1442956592, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('3f95e1d4eef830c9ec1c69da9c66fb16', '181.143.140.58', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B43', 1442958651, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('6a81ddb0515c9e03489bd99f8b7ca871', '181.143.140.58', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345', 1442957318, 'a:6:{s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('b859d73b193d3d257aa625d6992b4aec', '181.143.140.58', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X; en-us) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile', 1442957329, 'a:6:{s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('c265ccdb67957659d0916252e09c9787', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 1442957758, 'a:6:{s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('43ff41b0ecf7a9d62f2b34af8a0e95cc', '181.143.140.58', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X; en-us) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile', 1442957764, 'a:6:{s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('68bf81e45830a7ac132457ed8c84bdbf', '181.143.140.58', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B43', 1442959745, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('c7bdad5ddd9e28c96eb02f57dd31695d', '190.147.109.115', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1442978103, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('bf614b1ec26bc10f111a8f95aacaeebe', '66.249.88.13', 'Google favicon', 1443018348, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('ddccca4dec5442a8c5f9c74367bf1376', '191.104.225.151', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_0 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13A344', 1443021308, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('8eeb515c4663cb4e05a3580223ca9dfb', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1443122774, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:13:"administrador";s:5:"email";s:22:"admin@escalaurbana.com";s:2:"id";s:1:"5";s:7:"user_id";s:1:"5";s:8:"group_id";s:1:"2";s:5:"group";s:4:"user";}'),
('0ce0b46d8687f2a3c0f2fe3b43357f69', '181.143.140.58', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X; en-us) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile', 1443028237, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('09bf021300eaa900564d06c2e30bef7a', '66.249.88.180', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443028268, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('7669f65ac4d59e3a99d913486887c28d', '66.249.88.180', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443028268, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('396be2aa90f391343ffe7ca1f5ca8e57', '66.249.88.170', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443028273, ''),
('ee4d59bcf0c6c0aba544cf7571aea6d9', '66.249.88.170', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443028273, ''),
('2813863e9f6ed9d97de7df6f4973b4e6', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443028275, ''),
('d50a237b1271d5830922dcae15281b84', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 1443042434, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('27a61c692a36b65ad87e8df58a599909', '66.249.88.175', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443036956, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('149bb5c18fbdf6a8cf3e64671ad10e1c', '66.249.88.175', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443036956, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('bb235324163cb36c8ce191cf5220ca35', '66.249.88.170', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443036959, ''),
('98fd557d6dee81dbc97afae68156d3c8', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443036963, ''),
('dedca6706b0e6fb70ed30462dd0fc64a', '66.249.88.175', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443037041, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('75a962cd6ba0393999c600261839f3e5', '66.249.88.175', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443037041, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('8b1a5494cab785127178256caa45283f', '66.249.88.180', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443037044, ''),
('67aedb4b7e8809c5cda535acba5629ab', '66.249.88.170', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443037045, ''),
('feb97519fd26024e54a1b634b9852a78', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443037047, ''),
('c433a0e48c6b8779183f79ac4ea6a8c4', '66.249.88.175', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443037251, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('fa4b28ce07981efa960a9cda2a72d583', '66.249.88.175', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443037251, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('29dc7044e10e09eef55ddbe46c739d76', '66.249.88.180', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443037254, ''),
('b65945d5eccc4a3ea715f795b2b89b70', '66.249.88.170', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443037260, ''),
('e2b1cad48b95cc76fa84175a593f7a9e', '66.249.88.180', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443037260, ''),
('03cb24caacc16e8db18ccbc2dde8788a', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 1443037877, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('758fa4105d501c451685263078cee9ce', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443037884, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('8abff0e265a843903b682d3c5abdea8a', '66.249.88.170', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443037885, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('d063255b88eaaca4bfe7011b619f6688', '66.249.88.175', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443037888, ''),
('b1fa7a7c1c2a8154a3da4e2f70b42aeb', '66.249.88.180', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443037888, ''),
('710b3e5cfbcb29487b4398a322e1127c', '66.249.88.175', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443037890, ''),
('aafdaa0e26553cb2f841d88ee9e358ea', '66.249.88.175', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443037890, ''),
('789c13cde41a7b0fbb5c712029061aee', '66.249.88.170', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443038066, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('4e661e82701a4ac7b34a83a660a1dfd0', '66.249.88.175', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443038066, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('5e2054fcdd9dcf3bbbf6806166861249', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443038068, ''),
('d14bfb42f24d7b1922e4f6de7aaefc2c', '66.249.88.180', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443038072, ''),
('9322cb12d3c69e7cf6b883d7bd69ad9d', '66.249.88.180', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443038072, ''),
('df67fb64eeedb1d314df335add80e32b', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1443038132, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('e1010e0c8920c410e9f536de4da8b8ad', '181.56.157.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B410 ', 1443038133, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('21979dc6dcaedf9efdecaa8dfffdffe1', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 1443038270, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('cc1c592fc436c947ab1cf5788c09e33d', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 1443038271, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('1ac5eb44efcca7c13e445da9def5ab74', '66.249.88.175', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443038425, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('7dc5c8a58a61523e52807441137d80b5', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443038425, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('1f5b612d56b97c77b156c906ed816251', '66.249.88.180', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443038428, ''),
('0072d955f3b86b382d41956f8f1243f0', '66.249.88.175', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443038430, ''),
('6d0a2ab9c18d852ba816f3342089e553', '66.249.88.180', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443038431, ''),
('2a377af8b0bfa13940da759339bbfe90', '181.56.157.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_0_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13A4', 1443039042, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('efcdd7667d5bb36dab83aa649bbbe155', '181.143.140.58', 'Mozilla/5.0 (Linux; Android 5.0.2; XT1068 Build/LXB22.99-16) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.94 ', 1443044014, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('a7457a09bae44af9550a58de8711f92c', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 1443042682, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('f55ef49beceea00e4a75b9abe52fe30a', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 1443042434, ''),
('d1f322364c64eccd81259d458190b2e3', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 1443047806, 'a:7:{s:8:"username";s:18:"carolina.rodriguez";s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('73ec357ddca685439df2a5a4dd027478', '181.143.140.58', 'Mozilla/5.0 (Linux; Android 5.0.2; XT1068 Build/LXB22.99-16) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.94 ', 1443043068, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('7ae43f38969fc46bdb379c8c9d082895', '181.143.140.58', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/44.0.2403.65 Mobil', 1443043831, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('7465494099c8656d566aa13868cc76c1', '181.143.140.58', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/44.0.2403.65 Mobil', 1443043864, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('c5fceb1474aa3683d1bd09dc349ce965', '181.143.140.58', 'Mozilla/5.0 (Linux; Android 5.1.1; Nexus 6 Build/LMY48M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.94 Mobi', 1443043938, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('c4a16b377aa2690d269d0b17666a0fdc', '181.143.140.58', 'Mozilla/5.0 (Linux; Android 5.0.2; XT1068 Build/LXB22.99-16) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.94 ', 1443044015, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('99d7566726fdcc5596c7e4a1d9938c28', '66.249.88.180', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443044128, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('170b7706e1812077334d2b8df8717bef', '66.249.88.175', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443044128, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('b5ebb7efc97652960f015aa968ef6e75', '66.249.88.170', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443044131, ''),
('18cc6d769f6664f37dc42d9e690cca68', '66.249.88.180', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443044131, ''),
('8111adf96e9618b6b0f00163e02ae37d', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443044133, ''),
('5b56d8f717c9fe36cb0d6c204d6637c7', '66.249.88.175', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443044133, ''),
('18f57537b63d51a3d881ad5a04ad412f', '66.249.88.180', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443044165, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('6c87015f9abd00f2d333fa392f5847e2', '66.249.88.175', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443044165, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('9be6eda58a9c8d00719f7fc7fa59dcf8', '66.249.88.175', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443044169, ''),
('c6736394f34e0b9db6656bf45af19e6e', '66.249.88.175', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443044169, ''),
('d681ae112e9558be448aa8c6905e98ff', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443044171, ''),
('752218a2786d0b07ecc6afe28825079a', '66.249.88.180', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443044865, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('43a7fce2909127b8b3501a0400c5d788', '66.249.88.180', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443044865, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('9dc89bf5083a58149b49bcd26b974ee4', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443044871, ''),
('6a46fe4e188242c900513f7557b8591c', '66.249.88.175', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443044871, ''),
('9c1e30c233950ac6d0d8b02514ba57b0', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443045120, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('9d9b4eb9f12614c19cd3184cacec3bb5', '66.249.88.175', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443045120, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('384b9f125a72aa0a5d348131db02f516', '66.249.88.170', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443045125, ''),
('0df93c8f60f3821a49f18e21fb06905d', '66.249.88.175', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443045125, ''),
('4c4591d069a1a2d32310e39fdf9082fd', '66.249.88.175', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443045125, ''),
('7b4940b1c83eefd16d9cf21632f9e37d', '66.249.88.180', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443045151, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('9e97a87510a177e122cba8f07ca60a7d', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443045152, ''),
('80d3eddbcac5862ad310f0827953d849', '66.249.88.180', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443045216, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('cf2f39c86fd194efb6396a850e50027a', '66.249.88.180', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443045216, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('bf54907e7b95b2f523e8826d10fc5c02', '66.249.88.170', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443045711, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('6d381ffeba734013c789b3f0e66939fe', '66.249.88.180', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443045711, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('1c3080e9ab69b5111d614287098e1aca', '66.249.88.175', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443045875, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('4a2aa8df640de0b218dc628bcbe7d09e', '66.249.88.180', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443045875, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('d3fc5bff8c13f4cbfa96ece97053de67', '66.249.88.175', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443046328, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('c10a07fb8e0f4747aece1b9e207d3b5e', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443046328, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('1cd88fa6f89e0335a7ebd265723710dd', '66.249.88.180', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443046720, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('c4d0fec4ab23f2561c5acb9c6ca41b43', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443046720, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('d4fef6840bf6277a18730e05785ab1f7', '66.249.88.170', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443046917, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('f5ed2a23048af493c3f792f9ecc354fb', '66.249.88.180', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443046917, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('81310b98379f8dd4ac7710e4e4735302', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443046934, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('464d7a2ea94a013dcc841ab70ba87cea', '66.249.88.175', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443047164, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('010a7f1f35895ea838a68fc36adea60a', '66.249.88.180', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443047164, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('11e30208c8fb8faf50af246666f5d76c', '66.249.88.170', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443047252, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('4b24536c7c979a419620011faf98b174', '66.249.88.180', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443047252, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('13a9157ce5b9824c2139b15f260c30d5', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443047555, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('d3e580d5f2f29edf124788fee0716958', '66.249.88.175', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443047555, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('f521b80c7afd8fa688f805d025787ead', '66.249.88.170', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443047665, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('b62b410ef770675fb1c4b4667d7b6cff', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443047665, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('8d170059bfa91eb26d655c8855f663a2', '66.249.88.175', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443048439, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('10678103f1471e9a8900b629867be7a3', '66.249.88.175', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443048439, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('21d88ea7928df5bf833612ac15da7395', '66.249.88.180', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443048914, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('8f3368cb74353cb2316fd2593d94684d', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443048914, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('5a8e017dc60030d0c8342e111cbe4979', '66.249.88.175', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443048982, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('aacc913d82a348c6166dc0a8614abf70', '66.249.88.180', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443049199, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('1c674281c90adafe387ff82f5a47d5de', '66.249.88.180', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443049199, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('7cbee3293b499801cee23ae14e56c8cd', '66.249.88.175', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443049283, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('3246556cbbbf648dff58b281399a7070', '66.249.88.180', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443049283, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('a2a6fdfa09b19ce72508e86822848982', '66.249.88.180', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443049335, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('22f2f1c62b1cbbccd2dcce6f5b8a12f2', '66.249.88.180', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443049635, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('47a8c045267a5a2350494df74f6509e2', '66.249.88.175', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443049635, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('6c9c20448f3070f09ec3e0b97317febd', '66.249.88.175', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_3 like Mac OS X) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights)', 1443049684, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('bc15b1baaaab59d305b66c564249d226', '66.249.88.170', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko; Google Page Speed Insights) Chrome/27.0.1453 Safa', 1443049684, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('4d085543fecb5d74655c84b67ed55575', '66.249.88.2', 'Google favicon', 1443113326, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('d030d3449deec169f068eef24f827391', '181.56.157.46', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_0_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13A4', 1443122227, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('7cbaeee6eaa1be663adc159ae9944e70', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1443209079, 'a:6:{s:5:"email";s:22:"admin@escalaurbana.com";s:2:"id";s:1:"5";s:7:"user_id";s:1:"5";s:8:"group_id";s:1:"2";s:5:"group";s:4:"user";s:9:"lang_code";s:2:"es";}'),
('b10c812716b9ab99817001d476a2cd8c', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 1443125091, 'a:6:{s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('54550fc5d23915b7b79f2cdc7b9084d5', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 1443199393, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('bf14ff4107a6b7f0a8f0f3eac7c02f98', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 1443187802, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('a1c25cba25fea2b62ab3c0d0cae29dce', '181.236.189.148', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_0_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13A4', 1443188774, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('7b02f4a34397311f71cc6ef8871537d5', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 1443211201, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('2f8f9a4cf40026a992740f72ab71edcb', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 1443215179, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('c1f8e1c31017a7cb5ebbe58878a5b372', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 1443209348, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('aaa232372061e7ffbe9485024fa07e99', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1443375131, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:13:"administrador";s:5:"email";s:22:"admin@escalaurbana.com";s:2:"id";s:1:"5";s:7:"user_id";s:1:"5";s:8:"group_id";s:1:"2";s:5:"group";s:4:"user";}'),
('d329b91142a556d1c2a17411db933696', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 1443209456, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('721127857e6def85bc791ca4d69651aa', '181.143.140.58', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/600.8.9 (KHTML, like Gecko) Version/8.0.8 Safari/600.8.9', 1443210104, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('d73874634ce1780ce9f73c7c95964a84', '181.143.140.58', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2517.0 Safari/537.36', 1443209815, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('7b91ada0267aa3dbb71230aa0fbcdfe0', '181.143.140.58', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 1443210677, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('e07215118953389e6984c28ef41c70c9', '181.143.140.58', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/600.8.9 (KHTML, like Gecko) Version/8.0.8 Safari/600.8.9', 1443210986, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('3484f1c72c181a712053a170bc88da79', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 1443211836, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('8e171b58a4354e556841bdc2f09ef40c', '181.143.140.58', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2', 1443211796, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('f6de9d35d682d31d35503cbad5227d8a', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_0_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13A4', 1443241685, 'a:2:{s:9:"lang_code";s:2:"es";s:14:"admin_redirect";s:10:"admin/home";}'),
('a848ce3e41982cfd3869c7e9ded0505e', '190.147.109.115', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1443409815, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('c18652c38c7842af2e2285473fc736bb', '190.147.109.115', 'Mozilla/5.0 (iPhone; CPU iPhone OS 8_1 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) Version/8.0 Mobile/12B410 ', 1443409816, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('2c0873099ed0c380a69ef65de0561a14', '181.56.157.46', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12', 1443450616, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('54088d035d0813f463b13c5cc4d3f878', '66.249.88.13', 'Google favicon', 1443452298, 'a:1:{s:9:"lang_code";s:2:"es";}'),
('80a0779dfe90bb2e56149da78eb67d7c', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', 1445982832, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:18:"carolina.rodriguez";s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('8d0185149116f5de570a3378768d3f99', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', 1446055223, 'a:6:{s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('097316a92238666be71620ebe7a638b1', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', 1446067194, 'a:6:{s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('14aa910d0e6d25060acd7c7f06f44833', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', 1446214596, 'a:7:{s:9:"lang_code";s:2:"es";s:8:"username";s:18:"carolina.rodriguez";s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";}'),
('20fcf6e0a2f6f4fea44171cb28ba9ed5', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', 1446647797, 'a:6:{s:5:"email";s:30:"carolina.bonilla@imaginamos.co";s:2:"id";s:1:"2";s:7:"user_id";s:1:"2";s:8:"group_id";s:1:"1";s:5:"group";s:5:"admin";s:9:"lang_code";s:2:"es";}'),
('5b1e94e8111b142905644b6b390ed74c', '::1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', 1446651372, 'a:2:{s:9:"lang_code";s:2:"es";s:14:"admin_redirect";s:5:"admin";}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_comments`
--

CREATE TABLE `default_comments` (
  `id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `parsed` text COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `entry_title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entry_plural` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_comments`
--

INSERT INTO `default_comments` (`id`, `is_active`, `user_id`, `user_name`, `user_email`, `user_website`, `comment`, `parsed`, `module`, `entry_id`, `entry_title`, `entry_key`, `entry_plural`, `uri`, `cp_uri`, `created_on`, `ip_address`) VALUES
(1, 1, 1, '', '', '', 'esto es una prueba', '<p>esto es una prueba</p>\n', 'blog', '1', 'Lorem Ipsum', 'blog:post', 'blog:posts', 'blog/2014/03/lorem-ipsum', NULL, 1395451369, '127.0.0.1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_comment_blacklists`
--

CREATE TABLE `default_comment_blacklists` (
  `id` int(11) NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_contact_log`
--

CREATE TABLE `default_contact_log` (
  `id` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `sender_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sender_os` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sent_at` int(11) NOT NULL DEFAULT '0',
  `attachments` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_contact_us`
--

CREATE TABLE `default_contact_us` (
  `id` int(11) NOT NULL,
  `facebook` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adress` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `map` text COLLATE utf8_unicode_ci,
  `schedule` text COLLATE utf8_unicode_ci,
  `intro` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_contact_us`
--

INSERT INTO `default_contact_us` (`id`, `facebook`, `twitter`, `youtube`, `linkedin`, `instagram`, `adress`, `phone`, `email`, `map`, `schedule`, `intro`, `footer`, `image`, `lang`) VALUES
(1, 'https://www.facebook.com/es', 'https://twitter.com/', '', '', '', 'Calle 93 No. 14-20 Oficina 303', '+57 (1) 6184034', 'ksteve9519@gmail.com', '', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia repellat, officiis dolorem? Non accusantium, dolores quibusdam fugiat sapiente tempora labore animi corporis repellat quod accusamus, vitae laboriosam, eaque officiis quis tempora labore animi corporis repellat quod accusamus!!', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus natus doloribus assumenda rem iure quasi, libero sit fugiat nam accusantium! Dicta mollitia doloribus quibusdam placeat iusto blanditiis sequi quos doloremque.', 'Somos <strong>gente9</strong> con mente abierta, innovadores y con pensamiento social', 'mapa.jpg', 'es'),
(2, 'https://www.facebook.com/en', 'https://twitter.com/en', 'https://co.linkedin.com/en', NULL, NULL, 'Cra 50 A # 31C - 23', '(57) 224 14 17 123', 'william.daza.66@gmail.com', '', 'Horario oficina', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus natus doloribus assumenda rem iure quasi, libero sit fugiat nam accusantium! Dicta mollitia doloribus quibusdam placeat iusto blanditiis sequi quos doloremque.', 'Somos <strong>gente9</strong> con mente abierta, innovadores y con pensamiento social', NULL, 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_contact_us_emails`
--

CREATE TABLE `default_contact_us_emails` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cell` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_contact_us_emails`
--

INSERT INTO `default_contact_us_emails` (`id`, `name`, `email`, `phone`, `cell`, `company`, `city`, `message`, `date`, `status`, `lang`) VALUES
(16, 'LOREM IPSUM DOLOR SIT AMET', 'carolina.rodriguez@imagina.co', '571+6134923', '3119380282', 'imaginamos', 'Bogota', 'Mensaje de Prueba -- no responder --', '2015-05-21 10:08:38', 1, 'es'),
(17, 'Carolina Rodriguez', 'carolina.bonilla@imaginamos.co', '8445755', NULL, 'Imaginamos', 'Bogota D.C', 'Mensaje de prueba', '2015-09-18 12:21:19', 1, 'es'),
(18, 'Kevin', 'steverp95@outlook.es', 'Romero', NULL, 'Pepsi', 'Bogota', 'Test de Funcionamiento', '2016-06-02 11:02:39', 0, 'es'),
(19, 'Kevin', 'steverp95@outlook.es', 'Romero', NULL, 'Pepsi', 'Bogota', 'Test de Funcionamiento', '2016-06-02 11:03:01', 0, 'es'),
(20, 'Kevin', 'steverp95@outlook.es', 'Romero', NULL, 'Pepsi', 'Bogota', 'Test de Funcionamiento', '2016-06-02 11:03:22', 0, 'es'),
(21, 'Kevin', 'steverp95@outlook.es', 'Romero', NULL, 'Pepsi', 'Bogota', 'Test de Funcionamiento', '2016-06-02 11:03:42', 0, 'es'),
(22, 'Kevin', 'steverp95@outlook.es', 'Romero', NULL, 'Pepsi', 'Bogota', 'Test de Funcionamiento', '2016-06-02 11:04:03', 0, 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_contact_us_emails_area`
--

CREATE TABLE `default_contact_us_emails_area` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title_en` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_contact_us_emails_area`
--

INSERT INTO `default_contact_us_emails_area` (`id`, `title`, `title_en`, `email`, `created_at`, `lang`) VALUES
(1, 'Desarrollo', 'Dev', 'william.daza.66@gmail.com', '2015-04-07 15:41:25', 'es'),
(3, 'English', 'English', 'william.daza.66@gmail.com', '2015-04-07 16:01:33', 'en'),
(4, 'Prueba 1', 'Test 1', 'carolina.rodriguez@imagina.co', '2015-05-20 15:07:29', 'es'),
(5, 'Prueba 2', 'Test 2', 'carolina.rodriguez169@gmail.com', '2015-05-20 15:07:48', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_contact_us_email_products`
--

CREATE TABLE `default_contact_us_email_products` (
  `id` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_email` int(11) DEFAULT NULL,
  `pagina` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_contact_us_email_products`
--

INSERT INTO `default_contact_us_email_products` (`id`, `id_product`, `id_email`, `pagina`) VALUES
(1, 7, 5, NULL),
(2, 7, 6, NULL),
(3, 5, 6, NULL),
(4, 4, 20, 'services'),
(5, 4, 22, 'services');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_data_fields`
--

CREATE TABLE `default_data_fields` (
  `id` int(11) UNSIGNED NOT NULL,
  `field_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `field_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `field_data` blob,
  `view_options` blob,
  `is_locked` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_data_fields`
--

INSERT INTO `default_data_fields` (`id`, `field_name`, `field_slug`, `field_namespace`, `field_type`, `field_data`, `view_options`, `is_locked`) VALUES
(1, 'lang:blog:intro_label', 'intro', 'blogs', 'wysiwyg', 0x613a323a7b733a31313a22656469746f725f74797065223b733a363a2273696d706c65223b733a31303a22616c6c6f775f74616773223b733a313a2279223b7d, NULL, 'no'),
(2, 'lang:pages:body_label', 'body', 'pages', 'wysiwyg', 0x613a323a7b733a31313a22656469746f725f74797065223b733a383a22616476616e636564223b733a31303a22616c6c6f775f74616773223b733a313a2279223b7d, NULL, 'no'),
(3, 'lang:user:first_name_label', 'first_name', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a35303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(4, 'lang:user:last_name_label', 'last_name', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a35303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(5, 'lang:profile_company', 'company', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a3130303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(6, 'lang:profile_bio', 'bio', 'users', 'textarea', 0x613a333a7b733a31323a2264656661756c745f74657874223b4e3b733a31303a22616c6c6f775f74616773223b4e3b733a31323a22636f6e74656e745f74797065223b4e3b7d, NULL, 'no'),
(7, 'lang:user:lang', 'lang', 'users', 'pyro_lang', 0x613a313a7b733a31323a2266696c7465725f7468656d65223b733a333a22796573223b7d, NULL, 'no'),
(8, 'lang:profile_dob', 'dob', 'users', 'datetime', 0x613a353a7b733a383a227573655f74696d65223b733a323a226e6f223b733a31303a2273746172745f64617465223b733a353a222d31303059223b733a383a22656e645f64617465223b4e3b733a373a2273746f72616765223b733a343a22756e6978223b733a31303a22696e7075745f74797065223b733a383a2264726f70646f776e223b7d, NULL, 'no'),
(9, 'lang:profile_gender', 'gender', 'users', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a33343a22203a204e6f742054656c6c696e670a6d203a204d616c650a66203a2046656d616c65223b733a31313a2263686f6963655f74797065223b733a383a2264726f70646f776e223b733a31333a2264656661756c745f76616c7565223b4e3b733a31313a226d696e5f63686f69636573223b4e3b733a31313a226d61785f63686f69636573223b4e3b7d, NULL, 'no'),
(10, 'lang:profile_phone', 'phone', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a32303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(11, 'lang:profile_mobile', 'mobile', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a32303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(12, 'lang:profile_address_line1', 'address_line1', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(13, 'lang:profile_address_line2', 'address_line2', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(14, 'lang:profile_address_line3', 'address_line3', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(15, 'lang:profile_address_postcode', 'postcode', 'users', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b693a32303b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(16, 'lang:profile_website', 'website', 'users', 'url', NULL, NULL, 'no'),
(17, 'imagen', 'image', 'blogs', 'image', 0x613a353a7b733a363a22666f6c646572223b733a313a2231223b733a31323a22726573697a655f7769647468223b733a333a22353030223b733a31333a22726573697a655f686569676874223b733a333a22353030223b733a31303a226b6565705f726174696f223b733a333a22796573223b733a31333a22616c6c6f7765645f7479706573223b733a31323a226a70677c6a7065677c706e67223b7d, NULL, 'no'),
(18, 'lang:chat:day', 'day', 'chat', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a3234343a220d0a20202020202020202020202020202020202020204d6f6e203a204c756e65730d0a2020202020202020202020202020202020202020547565203a204d61727465730d0a2020202020202020202020202020202020202020576564203a204d69c3a972636f6c65730d0a2020202020202020202020202020202020202020546875203a204a75657665730d0a2020202020202020202020202020202020202020467269203a20566965726e65730d0a2020202020202020202020202020202020202020536174203a2053c3a16261646f0d0a202020202020202020202020202020202020202053756e203a20446f6d696e676f223b733a31313a2263686f6963655f74797065223b733a383a2264726f70646f776e223b733a31333a2264656661756c745f76616c7565223b4e3b733a31313a226d696e5f63686f69636573223b4e3b733a31313a226d61785f63686f69636573223b4e3b7d, NULL, 'no'),
(19, 'lang:chat:start_hour', 'start_hour', 'chat', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(20, 'lang:chat:end_hour', 'end_hour', 'chat', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(21, 'lang:name_label', 'assign_name', 'chat', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(22, 'lang:global:email', 'assign_email', 'chat', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(23, 'lang:chat:user', 'assign_user_id', 'chat', 'user', 0x613a313a7b733a31343a2272657374726963745f67726f7570223b4e3b7d, NULL, 'no'),
(24, 'lang:chat:status', 'assign_status', 'chat', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a33323a2230203a20300d0a202020202020202020202020202020202020202031203a2031223b733a31313a2263686f6963655f74797065223b733a383a2264726f70646f776e223b733a31333a2264656661756c745f76616c7565223b4e3b733a31313a226d696e5f63686f69636573223b4e3b733a31313a226d61785f63686f69636573223b4e3b7d, NULL, 'no'),
(25, 'lang:chat:start_date', 'assign_start_on', 'chat', 'datetime', 0x613a353a7b733a383a227573655f74696d65223b4e3b733a31303a2273746172745f64617465223b4e3b733a383a22656e645f64617465223b4e3b733a373a2273746f72616765223b4e3b733a31303a22696e7075745f74797065223b4e3b7d, NULL, 'no'),
(26, 'lang:chat:end_date', 'assign_finished_on', 'chat', 'datetime', 0x613a353a7b733a383a227573655f74696d65223b4e3b733a31303a2273746172745f64617465223b4e3b733a383a22656e645f64617465223b4e3b733a373a2273746f72616765223b4e3b733a31303a22696e7075745f74797065223b4e3b7d, NULL, 'no'),
(27, 'lang:chat:message', 'message_text', 'chat', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no'),
(28, 'lang:chat:assing', 'message_assign_id', 'chat', 'relationship', 0x613a323a7b733a31333a2263686f6f73655f73747265616d223b623a303b733a383a226c696e6b5f757269223b4e3b7d, NULL, 'no'),
(29, 'lang:chat:sender', 'message_sender', 'chat', 'choice', 0x613a353a7b733a31313a2263686f6963655f64617461223b733a35303a22636c69656e74203a20636c69656e740d0a202020202020202020202020202020202020202061646d696e203a2061646d696e223b733a31313a2263686f6963655f74797065223b733a383a2264726f70646f776e223b733a31333a2264656661756c745f76616c7565223b4e3b733a31313a226d696e5f63686f69636573223b4e3b733a31313a226d61785f63686f69636573223b4e3b7d, NULL, 'no'),
(30, 'lang:chat:username', 'message_username', 'chat', 'text', 0x613a323a7b733a31303a226d61785f6c656e677468223b4e3b733a31333a2264656661756c745f76616c7565223b4e3b7d, NULL, 'no');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_data_field_assignments`
--

CREATE TABLE `default_data_field_assignments` (
  `id` int(11) UNSIGNED NOT NULL,
  `sort_order` int(11) NOT NULL,
  `stream_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `is_required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `is_unique` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `instructions` text COLLATE utf8_unicode_ci,
  `field_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_data_field_assignments`
--

INSERT INTO `default_data_field_assignments` (`id`, `sort_order`, `stream_id`, `field_id`, `is_required`, `is_unique`, `instructions`, `field_name`) VALUES
(1, 1, 1, 1, 'yes', 'no', NULL, NULL),
(2, 1, 2, 2, 'no', 'no', NULL, NULL),
(3, 1, 3, 3, 'yes', 'no', NULL, NULL),
(4, 2, 3, 4, 'yes', 'no', NULL, NULL),
(5, 3, 3, 5, 'no', 'no', NULL, NULL),
(6, 4, 3, 6, 'no', 'no', NULL, NULL),
(7, 5, 3, 7, 'no', 'no', NULL, NULL),
(8, 6, 3, 8, 'no', 'no', NULL, NULL),
(9, 7, 3, 9, 'no', 'no', NULL, NULL),
(10, 8, 3, 10, 'no', 'no', NULL, NULL),
(11, 9, 3, 11, 'no', 'no', NULL, NULL),
(12, 10, 3, 12, 'no', 'no', NULL, NULL),
(13, 11, 3, 13, 'no', 'no', NULL, NULL),
(14, 12, 3, 14, 'no', 'no', NULL, NULL),
(15, 13, 3, 15, 'no', 'no', NULL, NULL),
(16, 14, 3, 16, 'no', 'no', NULL, NULL),
(17, 2, 1, 17, 'no', 'no', '', NULL),
(18, 1, 4, 18, 'yes', 'no', NULL, NULL),
(19, 2, 4, 19, 'yes', 'no', NULL, NULL),
(20, 3, 4, 20, 'yes', 'no', NULL, NULL),
(21, 1, 5, 21, 'yes', 'no', NULL, NULL),
(22, 2, 5, 22, 'yes', 'no', NULL, NULL),
(23, 3, 5, 23, 'yes', 'no', NULL, NULL),
(24, 4, 5, 24, 'yes', 'no', NULL, NULL),
(25, 5, 5, 25, 'yes', 'no', NULL, NULL),
(26, 6, 5, 26, 'yes', 'no', NULL, NULL),
(27, 1, 6, 27, 'yes', 'no', NULL, NULL),
(28, 2, 6, 28, 'yes', 'no', NULL, NULL),
(29, 3, 6, 29, 'yes', 'no', NULL, NULL),
(30, 4, 6, 30, 'yes', 'no', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_data_streams`
--

CREATE TABLE `default_data_streams` (
  `id` int(10) UNSIGNED NOT NULL,
  `stream_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `stream_namespace` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stream_prefix` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `view_options` blob NOT NULL,
  `title_column` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sorting` enum('title','custom') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `permissions` text COLLATE utf8_unicode_ci,
  `is_hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `menu_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_data_streams`
--

INSERT INTO `default_data_streams` (`id`, `stream_name`, `stream_slug`, `stream_namespace`, `stream_prefix`, `about`, `view_options`, `title_column`, `sorting`, `permissions`, `is_hidden`, `menu_path`) VALUES
(1, 'lang:blog:blog_title', 'blog', 'blogs', NULL, NULL, 0x613a323a7b693a303b733a323a226964223b693a313b733a373a2263726561746564223b7d, NULL, 'title', NULL, 'no', NULL),
(2, 'Default', 'def_page_fields', 'pages', NULL, 'A simple page type with a WYSIWYG editor that will get you started adding content.', 0x613a323a7b693a303b733a323a226964223b693a313b733a373a2263726561746564223b7d, NULL, 'title', NULL, 'no', NULL),
(3, 'lang:user_profile_fields_label', 'profiles', 'users', NULL, 'Profiles for users module', 0x613a313a7b693a303b733a31323a22646973706c61795f6e616d65223b7d, 'display_name', 'title', NULL, 'no', NULL),
(4, 'lang:chat:title', 'chat', 'chat', NULL, NULL, 0x613a323a7b693a303b733a323a226964223b693a313b733a373a2263726561746564223b7d, 'day', 'title', NULL, 'no', NULL),
(5, 'lang:chat:title', 'assign', 'chat', 'chat_', NULL, 0x613a323a7b693a303b733a323a226964223b693a313b733a373a2263726561746564223b7d, 'assign_email', 'title', NULL, 'no', NULL),
(6, 'lang:chat:title', 'message', 'chat', 'chat_', NULL, 0x613a323a7b693a303b733a323a226964223b693a313b733a373a2263726561746564223b7d, NULL, 'title', NULL, 'no', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_data_stream_searches`
--

CREATE TABLE `default_data_stream_searches` (
  `id` int(11) UNSIGNED NOT NULL,
  `stream_slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stream_namespace` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `search_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `search_term` text COLLATE utf8_unicode_ci,
  `ip_address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_results` int(11) NOT NULL,
  `query_string` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_def_page_fields`
--

CREATE TABLE `default_def_page_fields` (
  `id` int(9) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_def_page_fields`
--

INSERT INTO `default_def_page_fields` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `body`) VALUES
(1, '2014-03-06 00:39:41', NULL, 1, NULL, '<p>Welcome to our homepage. We have not quite finished setting up our website yet, but please add us to your bookmarks and come back soon.</p>'),
(2, '2014-03-06 00:39:41', '2014-03-06 15:19:15', 1, NULL, '<p>To contact us please fill out the form below.</p>\n{{ contact:form name=&quot;text|required&quot; email=&quot;text|required|valid_email&quot; subject=&quot;dropdown|Support|Sales|Feedback|Other&quot; message=&quot;textarea&quot; attachment=&quot;file|zip&quot; }}\n\n<div><label for="name">Nombre: {{ name }}</label></div>\n\n<div><label for="email">Email:</label>{{ email }}</div>\n\n<div><label for="subject">Subject:</label>{{ subject }}</div>\n\n<div><label for="message">Message:</label>{{ message }}</div>\n\n<div><label for="attachment">Attach a zip file:</label>{{ attachment }}</div>\n{{ /contact:form }}'),
(3, '2014-03-06 00:39:41', NULL, 1, NULL, '{{ search:form class="search-form" }} \n		<input name="q" placeholder="Search terms..." />\n	{{ /search:form }}'),
(4, '2014-03-06 00:39:41', NULL, 1, NULL, '{{ search:form class="search-form" }} \n		<input name="q" placeholder="Search terms..." />\n	{{ /search:form }}\n\n{{ search:results }}\n\n	{{ total }} results for "{{ query }}".\n\n	<hr />\n\n	{{ entries }}\n\n		<article>\n			<h4>{{ singular }}: <a href="{{ url }}">{{ title }}</a></h4>\n			<p>{{ description }}</p>\n		</article>\n\n	{{ /entries }}\n\n        {{ pagination }}\n\n{{ /search:results }}'),
(5, '2014-03-06 00:39:41', NULL, 1, NULL, '<p>We cannot find the page you are looking for, please click <a title="Home" href="{{ pages:url id=''1'' }}">here</a> to go to the homepage.</p>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_email_templates`
--

CREATE TABLE `default_email_templates` (
  `id` int(11) NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_default` int(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_email_templates`
--

INSERT INTO `default_email_templates` (`id`, `slug`, `name`, `description`, `subject`, `body`, `lang`, `is_default`, `module`) VALUES
(1, 'comments', 'Comment Notification', 'Email that is sent to admin when someone creates a comment', 'You have just received a comment from {{ name }}', '<h3>You have received a comment from {{ name }}</h3>\n				<p>\n				<strong>IP Address: {{ sender_ip }}</strong><br/>\n				<strong>Operating System: {{ sender_os }}<br/>\n				<strong>User Agent: {{ sender_agent }}</strong>\n				</p>\n				<p>{{ comment }}</p>\n				<p>View Comment: {{ redirect_url }}</p>', 'en', 1, 'comments'),
(2, 'contact', 'Contact Notification', 'Template for the contact form', '{{ settings:site_name }} :: {{ subject }}', '<h3>Hola se ha mandado un mensaje a {{ settings:site_name }}</h3>\r\n\r\n<p style="font-size: 13px;">Hay alguien que desea ponerse en contacto, a continuaci&oacute;n sus datos.</p>\r\n<strong style="font-size: 13px;">Nombre:&nbsp;</strong><label style="font-size: 13px;">{{nombre}}</label><br style="font-size: 13px;" />\r\n<strong style="font-size: 13px;">E-mail:&nbsp;</strong><label style="font-size: 13px;">{{ email }}</label><br style="font-size: 13px;" />\r\n<strong style="font-size: 13px;">Tel&eacute;fono:&nbsp;</strong><label style="font-size: 13px;">{{ phone }}</label><br style="font-size: 13px;" />\r\n<strong style="font-size: 13px;">Empresa:&nbsp;</strong><label style="font-size: 13px;">{{ company }}</label><br />\r\n<strong style="font-size: 13px; line-height: 20.7999992370605px;">Ciudad:&nbsp;</strong><label style="font-size: 13px; line-height: 20.7999992370605px;">{{ city }}</label><br style="font-size: 13px;" />\r\n<strong style="font-size: 13px;">Mensaje:</strong>\r\n\r\n<div style="font-size: 13px; width: 700px;"><label>{{ message }}</label><br />\r\n<br style="font-size: 13px;" />\r\n<img src="http://www.blissfulproductivity.com/wp-content/uploads/2013/02/linea.jpg" style="font-size: 13px;" />\r\n<div style="font-size: 13px; text-align: center;">\r\n<p style="color: gray; font-size: 10px;">La informaci&oacute;n contenida en este mensaje es confidencial y s&oacute;lo puede ser utilizada por el individuo o la compa&ntilde;&iacute;a a la cual est&aacute; dirigido. Si no es el receptor autorizado, cualquier retenci&oacute;n, reproducci&oacute;n, difusi&oacute;n, distribuci&oacute;n o copia de este correo electr&oacute;nico es prohibida y ser&aacute; sancionada por la ley. Excepto en casos de culpa grave o dolo, no aceptamos ninguna responsabilidad por p&eacute;rdidas o da&ntilde;o causados por virus inform&aacute;ticos en correos electr&oacute;nicos o en programas de computador (software). El que il&iacute;citamente sustraiga, oculte, extrav&iacute;e, destruya, intercepte, controle o impida esta comunicaci&oacute;n, antes de que llegue a su destinatario, estar&aacute; sujeto a las sanciones penales correspondientes. Igualmente, incurrir&aacute; en sanciones penales el que, en provecho propio o ajeno o con perjuicio de otro, divulgue o emplee la informaci&oacute;n contenida en esta comunicaci&oacute;n. En particular, los servidores p&uacute;blicos que reciban este mensaje est&aacute;n obligados a asegurar y mantener la confidencialidad de la informaci&oacute;n en &eacute;l contenida y, en general, a cumplir con los deberes de custodia, cuidado, manejo y dem&aacute;s previstos en el r&eacute;gimen disciplinario. Si por error recibe este mensaje, le solicitamos enviarlo de vuelta a Imaginamos a la direcci&oacute;n de correo electr&oacute;nico que se lo envi&oacute; y borrarlo de sus archivos electr&oacute;nicos o destruirlo.</p>\r\n\r\n<p style="color: green; font-size: 12px; text-align: justify;">Evite imprimir, piense en su compromiso con el Medio Ambiente.</p>\r\n</div>\r\n</div>', 'en', 1, 'pages'),
(3, 'registered', 'New User Registered', 'Email sent to the site contact e-mail when a new user registers', '{{ settings:site_name }} :: You have just received a registration from {{ name }}', '<h3>You have received a registration from {{ name }}</h3>\n				<p><strong>IP Address: {{ sender_ip }}</strong><br/>\n				<strong>Operating System: {{ sender_os }}</strong><br/>\n				<strong>User Agent: {{ sender_agent }}</strong>\n				</p>', 'en', 1, 'users'),
(4, 'activation', 'Activation Email', 'The email which contains the activation code that is sent to a new user', '{{ settings:site_name }} - Account Activation', '<p>Hello {{ user:first_name }},</p>\n				<p>Thank you for registering at {{ settings:site_name }}. Before we can activate your account, please complete the registration process by clicking on the following link:</p>\n				<p><a href="{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}">{{ url:site }}users/activate/{{ user:id }}/{{ activation_code }}</a></p>\n				<p>&nbsp;</p>\n				<p>In case your email program does not recognize the above link as, please direct your browser to the following URL and enter the activation code:</p>\n				<p><a href="{{ url:site }}users/activate">{{ url:site }}users/activate</a></p>\n				<p><strong>Activation Code:</strong> {{ activation_code }}</p>', 'en', 1, 'users'),
(5, 'forgotten_password', 'Forgotten Password Email', 'The email that is sent containing a password reset code', '{{ settings:site_name }} - Forgotten Password', '<p>Hello {{ user:first_name }},</p>\n				<p>It seems you have requested a password reset. Please click this link to complete the reset: <a href="{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}">{{ url:site }}users/reset_pass/{{ user:forgotten_password_code }}</a></p>\n				<p>If you did not request a password reset please disregard this message. No further action is necessary.</p>', 'en', 1, 'users'),
(6, 'new_password', 'New Password Email', 'After a password is reset this email is sent containing the new password', '{{ settings:site_name }} - New Password', '<p>Hello {{ user:first_name }},</p>\n				<p>Your new password is: {{ new_password }}</p>\n				<p>After logging in you may change your password by visiting <a href="{{ url:site }}edit-profile">{{ url:site }}edit-profile</a></p>', 'en', 1, 'users'),
(7, 'work_with_us', 'Trabaje con nosotros', 'Trabaje con Nosotros HV', 'Se ha enviado una hoja de vida', '<h3>Hola se ha mandado una hoja de vida a {{ settings:site_name }}</h3>\r\n\r\n<p style="font-size: 13px; line-height: 20.7999992370605px;">Hay alguien que desea ponerse en contacto, a continuaci&oacute;n sus datos.</p>\r\n<strong style="font-size: 13px; line-height: 20.7999992370605px;">Nombre y Apellido:&nbsp;</strong><label style="font-size: 13px; line-height: 20.7999992370605px;">{{name}}</label><br style="font-size: 13px; line-height: 20.7999992370605px;" />\r\n<strong style="font-size: 13px; line-height: 20.7999992370605px;">E-mail:&nbsp;</strong><label style="font-size: 13px; line-height: 20.7999992370605px;">{{ email }}</label><br style="font-size: 13px; line-height: 20.7999992370605px;" />\r\n<strong style="font-size: 13px; line-height: 20.7999992370605px;">Tel&eacute;fono:&nbsp;</strong><label style="font-size: 13px; line-height: 20.7999992370605px;">{{ phone }}</label><br style="font-size: 13px; line-height: 20.7999992370605px;" />\r\n<strong style="font-size: 13px; line-height: 20.7999992370605px;">Empresa:&nbsp;</strong><label style="font-size: 13px; line-height: 20.7999992370605px;">{{ company }}</label><br style="font-size: 13px; line-height: 20.7999992370605px;" />\r\n<strong style="font-size: 13px; line-height: 20.7999992370605px;">Mensaje:</strong>\r\n\r\n<div style="font-size: 13px; line-height: 20.7999992370605px; width: 700px;"><label>{{ message }}</label></div>\r\n<br style="font-size: 13px; line-height: 20.7999992370605px;" />\r\n<br style="font-size: 13px; line-height: 20.7999992370605px;" />\r\n<img src="http://www.blissfulproductivity.com/wp-content/uploads/2013/02/linea.jpg" style="font-size: 13px; line-height: 20.7999992370605px;" />\r\n<div style="font-size: 13px; line-height: 20.7999992370605px; text-align: center;">\r\n<p style="color: gray; font-size: 10px;">La informaci&oacute;n contenida en este mensaje es confidencial y s&oacute;lo puede ser utilizada por el individuo o la compa&ntilde;&iacute;a a la cual est&aacute; dirigido. Si no es el receptor autorizado, cualquier retenci&oacute;n, reproducci&oacute;n, difusi&oacute;n, distribuci&oacute;n o copia de este correo electr&oacute;nico es prohibida y ser&aacute; sancionada por la ley. Excepto en casos de culpa grave o dolo, no aceptamos ninguna responsabilidad por p&eacute;rdidas o da&ntilde;o causados por virus inform&aacute;ticos en correos electr&oacute;nicos o en programas de computador (software). El que il&iacute;citamente sustraiga, oculte, extrav&iacute;e, destruya, intercepte, controle o impida esta comunicaci&oacute;n, antes de que llegue a su destinatario, estar&aacute; sujeto a las sanciones penales correspondientes. Igualmente, incurrir&aacute; en sanciones penales el que, en provecho propio o ajeno o con perjuicio de otro, divulgue o emplee la informaci&oacute;n contenida en esta comunicaci&oacute;n. En particular, los servidores p&uacute;blicos que reciban este mensaje est&aacute;n obligados a asegurar y mantener la confidencialidad de la informaci&oacute;n en &eacute;l contenida y, en general, a cumplir con los deberes de custodia, cuidado, manejo y dem&aacute;s previstos en el r&eacute;gimen disciplinario. Si por error recibe este mensaje, le solicitamos enviarlo de vuelta a Imaginamos a la direcci&oacute;n de correo electr&oacute;nico que se lo envi&oacute; y borrarlo de sus archivos electr&oacute;nicos o destruirlo.</p>\r\n\r\n<p style="color: green; font-size: 12px; text-align: justify;">Evite imprimir, piense en su compromiso con el Medio Ambiente.</p>\r\n</div>', 'en', 0, ''),
(8, 'work_with_us_register', 'Trabaje con Nosotros Registro de su hoja de vida', 'Trabaje con Nosotros Registro de su hoja de vida', 'Gracias por enviar tu hoja de vida', '<span style="font-size: 13px; line-height: 20.7999992370605px;">{{name}}&nbsp;</span>Gracias por enviar tu hoja de vida<br />\r\n<br />\r\nEstaremos en contacto.', 'en', 0, ''),
(9, 'pregunta', 'pregunta', 'Template for the contact form', '{{ settings:site_name }} :: Pregunta al experto', '<h3>Hola se ha mandado un mensaje a {{ settings:site_name }}</h3>\r\n\r\n<p style="font-size: 13px;">Alguien tiene una pregunta para el experto.</p>\r\n<strong style="font-size: 13px;">Desde:&nbsp;</strong><label style="font-size: 13px;">{{place}}</label><br style="font-size: 13px;" />\r\n<strong style="font-size: 13px;">Consultor:&nbsp;</strong><label style="font-size: 13px;">{{ type }}</label><br style="font-size: 13px;" />\r\n<strong style="font-size: 13px;">Mensaje:</strong>\r\n\r\n<div style="font-size: 13px; width: 700px;"><label>{{ message }}</label></div>\r\n<br style="font-size: 13px;" />\r\n<br style="font-size: 13px;" />\r\n<img src="http://www.blissfulproductivity.com/wp-content/uploads/2013/02/linea.jpg" style="font-size: 13px;" />\r\n<div style="font-size: 13px; text-align: center;">\r\n<p style="color: gray; font-size: 10px;">La informaci&oacute;n contenida en este mensaje es confidencial y s&oacute;lo puede ser utilizada por el individuo o la compa&ntilde;&iacute;a a la cual est&aacute; dirigido. Si no es el receptor autorizado, cualquier retenci&oacute;n, reproducci&oacute;n, difusi&oacute;n, distribuci&oacute;n o copia de este correo electr&oacute;nico es prohibida y ser&aacute; sancionada por la ley. Excepto en casos de culpa grave o dolo, no aceptamos ninguna responsabilidad por p&eacute;rdidas o da&ntilde;o causados por virus inform&aacute;ticos en correos electr&oacute;nicos o en programas de computador (software). El que il&iacute;citamente sustraiga, oculte, extrav&iacute;e, destruya, intercepte, controle o impida esta comunicaci&oacute;n, antes de que llegue a su destinatario, estar&aacute; sujeto a las sanciones penales correspondientes. Igualmente, incurrir&aacute; en sanciones penales el que, en provecho propio o ajeno o con perjuicio de otro, divulgue o emplee la informaci&oacute;n contenida en esta comunicaci&oacute;n. En particular, los servidores p&uacute;blicos que reciban este mensaje est&aacute;n obligados a asegurar y mantener la confidencialidad de la informaci&oacute;n en &eacute;l contenida y, en general, a cumplir con los deberes de custodia, cuidado, manejo y dem&aacute;s previstos en el r&eacute;gimen disciplinario. Si por error recibe este mensaje, le solicitamos enviarlo de vuelta a Imaginamos a la direcci&oacute;n de correo electr&oacute;nico que se lo envi&oacute; y borrarlo de sus archivos electr&oacute;nicos o destruirlo.</p>\r\n\r\n<p style="color: green; font-size: 12px; text-align: justify;">Evite imprimir, piense en su compromiso con el Medio Ambiente.</p>\r\n</div>', 'en', 0, 'pages'),
(10, 'cambio-en-proceso', 'Cambio en proceso', 'Aviso de cambios en procesos', '{{ settings:site_name }} :: {{ subject }}', '<h3>Se han hecho cambios en el proceso:&nbsp;{{ process }}</h3>\r\n\r\n<p style="font-size: 13px;">{{ message }}</p>\r\n\r\n<div style="font-size: 13px; width: 700px;"><img src="http://www.blissfulproductivity.com/wp-content/uploads/2013/02/linea.jpg" style="font-size: 13px;" />\r\n<div style="font-size: 13px; text-align: center;">\r\n<p style="color: gray; font-size: 10px;">La informaci&oacute;n contenida en este mensaje es confidencial y s&oacute;lo puede ser utilizada por el individuo o la compa&ntilde;&iacute;a a la cual est&aacute; dirigido. Si no es el receptor autorizado, cualquier retenci&oacute;n, reproducci&oacute;n, difusi&oacute;n, distribuci&oacute;n o copia de este correo electr&oacute;nico es prohibida y ser&aacute; sancionada por la ley. Excepto en casos de culpa grave o dolo, no aceptamos ninguna responsabilidad por p&eacute;rdidas o da&ntilde;o causados por virus inform&aacute;ticos en correos electr&oacute;nicos o en programas de computador (software). El que il&iacute;citamente sustraiga, oculte, extrav&iacute;e, destruya, intercepte, controle o impida esta comunicaci&oacute;n, antes de que llegue a su destinatario, estar&aacute; sujeto a las sanciones penales correspondientes. Igualmente, incurrir&aacute; en sanciones penales el que, en provecho propio o ajeno o con perjuicio de otro, divulgue o emplee la informaci&oacute;n contenida en esta comunicaci&oacute;n. En particular, los servidores p&uacute;blicos que reciban este mensaje est&aacute;n obligados a asegurar y mantener la confidencialidad de la informaci&oacute;n en &eacute;l contenida y, en general, a cumplir con los deberes de custodia, cuidado, manejo y dem&aacute;s previstos en el r&eacute;gimen disciplinario. Si por error recibe este mensaje, le solicitamos enviarlo de vuelta a Imaginamos a la direcci&oacute;n de correo electr&oacute;nico que se lo envi&oacute; y borrarlo de sus archivos electr&oacute;nicos o destruirlo.</p>\r\n\r\n<p style="color: green; font-size: 12px; text-align: justify;">Evite imprimir, piense en su compromiso con el Medio Ambiente.</p>\r\n</div>\r\n</div>', 'en', 0, 'pages');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_features`
--

CREATE TABLE `default_features` (
  `id` int(11) NOT NULL,
  `text` varchar(500) NOT NULL,
  `kind` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'es',
  `id_pro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `default_features`
--

INSERT INTO `default_features` (`id`, `text`, `kind`, `lang`, `id_pro`) VALUES
(1, 'Test de Funcionamiento', 1, 'es', 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_files`
--

CREATE TABLE `default_files` (
  `id` char(15) COLLATE utf8_unicode_ci NOT NULL,
  `folder_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '1',
  `type` enum('a','v','d','i','o') COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `extension` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `keywords` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` int(5) DEFAULT NULL,
  `height` int(5) DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `alt_attribute` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `download_count` int(11) NOT NULL DEFAULT '0',
  `date_added` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_files`
--

INSERT INTO `default_files` (`id`, `folder_id`, `user_id`, `type`, `name`, `filename`, `path`, `description`, `extension`, `mimetype`, `keywords`, `width`, `height`, `filesize`, `alt_attribute`, `download_count`, `date_added`, `sort`) VALUES
('0bcab0293fd6c5f', 1, 2, 'i', '0d19f312b94129a4b95fb86fdbe7a0b0.png', '15a01c612ce46ef0b9a8402215591ea6.png', '{{ url:site }}files/large/15a01c612ce46ef0b9a8402215591ea6.png', '', '.png', 'image/png', '', 500, 209, 330, '', 0, 1412248012, 0),
('58b4a7f4dd9a1bc', 2, 2, 'i', 'producto.JPG', 'a3575b12e354c7c351fdb68545ed309c.jpg', '{{ url:site }}files/large/a3575b12e354c7c351fdb68545ed309c.jpg', '', '.jpg', 'image/jpeg', '', 555, 371, 101, '', 0, 1429555410, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_file_folders`
--

CREATE TABLE `default_file_folders` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `remote_container` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `date_added` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_file_folders`
--

INSERT INTO `default_file_folders` (`id`, `parent_id`, `slug`, `name`, `location`, `remote_container`, `date_added`, `sort`, `hidden`) VALUES
(1, 0, 'blog-images', 'blog_images', 'local', '', 1412247967, 1412247967, 0),
(2, 0, 'productos', 'productos', 'local', '', 1429555328, 1429555328, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_gallerys`
--

CREATE TABLE `default_gallerys` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `name` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_gallerys`
--

INSERT INTO `default_gallerys` (`id`, `date`, `name`, `slug`, `image`, `intro`, `position`, `created_at`, `updated_at`, `lang`) VALUES
(1, '2015-09-18', '17A', '17a1', 'uploads/default/gallerys/144370ab9ecf1d5cfaff4a7f77aca483.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum iusto in, cupiditate, possimus quae eum aliquam. Expedita repellat qui, assumenda aspernatur soluta, delectus asperiores fuga harum, aperiam, molestias porro ad', 2, '2015-08-14 10:57:01', '2015-09-21 19:24:06', 'es'),
(2, '2015-09-18', '17A Obra', '17a-obra2', 'uploads/default/gallerys/5c8dd2d1fac7502f1fdbd7de0cb27d39.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum iusto in, cupiditate, possimus quae eum aliquam. Expedita repellat qui, assumenda aspernatur soluta, delectus asperiores fuga harum, aperiam, molestias porro ad', 3, '2015-08-14 11:11:36', '2015-09-21 21:12:22', 'es'),
(3, '2015-09-18', 'Parque BS obra', 'parque-bs-obra3', 'uploads/default/gallerys/56c6d834d6d52bbac871f16901dbbb0a.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum iusto in, cupiditate, possimus quae eum aliquam. Expedita repellat qui, assumenda aspernatur soluta, delectus asperiores fuga harum, aperiam, molestias porro ad', 1, '2015-08-14 11:16:25', '2015-09-21 21:12:22', 'es'),
(4, '2015-09-18', 'SAE', 'sae4', 'uploads/default/gallerys/eb77c3a72b3269b8e9248b6d7f838486.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nostrum iusto in, cupiditate, possimus quae eum aliquam. Expedita repellat qui, assumenda aspernatur soluta, delectus asperiores fuga harum, aperiam, molestias porro ad', 4, '2015-08-14 11:17:02', '2015-09-21 19:24:06', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_gallerys_categories`
--

CREATE TABLE `default_gallerys_categories` (
  `gallery_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_gallerys_categories`
--

INSERT INTO `default_gallerys_categories` (`gallery_id`, `category_id`) VALUES
(2, 1),
(3, 2),
(4, 3),
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_gallerys_intro`
--

CREATE TABLE `default_gallerys_intro` (
  `id` int(11) NOT NULL,
  `title` varchar(455) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_gallerys_intro`
--

INSERT INTO `default_gallerys_intro` (`id`, `title`, `text`, `lang`) VALUES
(1, 'GALER&Iacute;A DE <strong>IMAGENES</strong>', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure, unde, sapiente. Deserunt quos quasi eum odio voluptate asperiores eius eveniet. Labore quod suscipit hic quisquam, aperiam. Maiores quibusdam dolorum, pariatur!', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_gallery_categories`
--

CREATE TABLE `default_gallery_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `parent` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_gallery_categories`
--

INSERT INTO `default_gallery_categories` (`id`, `title`, `position`, `parent`, `slug`, `created_at`, `updated_at`, `lang`) VALUES
(1, '17A', NULL, 0, '17a', '2015-08-14 10:57:32', '2015-08-18 15:59:59', 'es'),
(2, 'Parque BS', NULL, 0, 'parque-bs', '2015-08-14 11:11:53', '2015-08-18 16:31:24', 'es'),
(3, 'SAE', NULL, 0, 'sae', '2015-08-18 11:34:20', '2015-08-18 16:34:20', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_gallery_images`
--

CREATE TABLE `default_gallery_images` (
  `id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_gallery_images`
--

INSERT INTO `default_gallery_images` (`id`, `gallery_id`, `title`, `path`, `video`, `position`, `created_at`) VALUES
(1, 1, 'lorem ipsum', 'uploads/default/gallerys/06fafb0a29442900a639cf2595303845.JPG', NULL, NULL, '2015-09-18 17:01:49'),
(2, 2, 'Lorem ipsum dolor ', 'uploads/default/gallerys/9070f45489f6c1864cadf60f76a8488d.jpg', NULL, NULL, '2015-08-18 16:08:18'),
(3, 2, 'Lorem ipsum dolor ', 'uploads/default/gallerys/79bdfb3b79734cb79ac15520d0bccc5b.jpg', NULL, NULL, '2015-08-18 16:08:27'),
(4, 2, 'Lorem ipsum dolor ', 'uploads/default/gallerys/a494485458a5af67078c0a2bf825f1b4.jpg', NULL, NULL, '2015-08-18 16:08:38'),
(5, 1, 'lorem ipsum 2', 'uploads/default/gallerys/015e0d4d4f11633459ef6d8a3a8f9a81.jpg', NULL, NULL, '2015-09-18 17:01:57'),
(6, 1, 'Lorem Ipsum Dolor Sit Amet', 'uploads/default/gallerys/045adb1301e81e15fcef0cd4ef7e76f0.JPG', NULL, NULL, '2015-09-18 17:04:08'),
(7, 1, 'lorem ipsum 3', 'uploads/default/gallerys/36bf4896e114e085d77d99f7d41046f4.jpg', NULL, NULL, '2015-09-18 17:04:16'),
(8, 2, 'Lorem ipsum dolor', 'uploads/default/gallerys/31acaf62d7ecda76581360a2f94586a5.jpg', NULL, NULL, '2015-08-18 16:07:49'),
(9, 3, 'Lorem ipsum dolor ', 'uploads/default/gallerys/ee5e6a73e75c46734cfe29dba485e0b2.jpg', NULL, NULL, '2015-08-18 16:30:42'),
(10, 3, 'Lorem ipsum dolor', 'uploads/default/gallerys/41d02ed5cf8d8a11b560e37f819bca95.jpg', NULL, NULL, '2015-08-18 16:32:36'),
(11, 3, 'Lorem ipsum dolor', 'uploads/default/gallerys/d0adcf033e1ada94225cbd9bebf8f3da.jpg', NULL, NULL, '2015-08-18 16:33:35'),
(12, 4, 'Lorem ipsum dolor', 'uploads/default/gallerys/8da2125f081f650f70cefd8c1f764673.jpg', NULL, NULL, '2015-08-18 16:35:31'),
(13, 4, 'Lorem ipsum dolor', 'uploads/default/gallerys/c22192e6c98dd3b29a738866027ab739.jpg', NULL, NULL, '2015-08-18 16:35:49'),
(14, 4, 'Lorem ipsum dolor', 'uploads/default/gallerys/d3d8ce841ffb0d52e58faabaddfc1b87.jpg', NULL, NULL, '2015-08-18 16:36:05'),
(15, 4, 'Lorem ipsum dolor', 'uploads/default/gallerys/34477f203c94c95fe3d6208a821846ce.jpg', NULL, NULL, '2015-08-18 16:36:17'),
(16, 4, 'Lorem ipsum dolor', 'uploads/default/gallerys/ffa012b3f3cec9a3d990ba34c24ebcb5.jpg', NULL, NULL, '2015-08-18 16:36:31'),
(17, 4, 'Lorem ipsum dolor', 'uploads/default/gallerys/8554058a32143c1f619c87c420b87493.jpg', NULL, NULL, '2015-08-18 16:37:02'),
(18, 4, 'Lorem ipsum dolor', 'uploads/default/gallerys/0a5a7fa40af79cdfb8a7b6be4fadf7a5.jpg', NULL, NULL, '2015-08-18 16:38:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_gallery_intro`
--

CREATE TABLE `default_gallery_intro` (
  `id` int(11) NOT NULL,
  `text` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_gallery_intro`
--

INSERT INTO `default_gallery_intro` (`id`, `text`) VALUES
(1, 'Lorem Ipsum&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno est&aacute;ndar de las industrias desde el');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_google_maps`
--

CREATE TABLE `default_google_maps` (
  `id` int(11) NOT NULL,
  `adress` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `schedule` text COLLATE utf8_unicode_ci,
  `coordinate1` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coordinate2` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_google_maps`
--

INSERT INTO `default_google_maps` (`id`, `adress`, `name`, `slug`, `description`, `schedule`, `coordinate1`, `coordinate2`, `image`, `position`, `created_at`, `updated_at`, `lang`) VALUES
(1, NULL, 'Escala Urbana', 'escala-urbana', NULL, NULL, '4.676567692734162', '-74.0514298240509', 'uploads/default/google_maps/4f92685fa215ad188604c6c24294de29.jpg', NULL, '2015-04-07 18:04:32', '2015-09-19 19:46:47', 'es'),
(2, 'calle 93 numero 15-59', 'Imagine', 'imagine', 'Prueba de mapa en', 'Ofice', '4.676961660332573', '-74.05235184232788', 'uploads/default/google_maps/cf886183c8800967032fd51622b7fdf0.jpg', NULL, '2015-04-07 18:06:07', '2015-04-07 16:06:07', 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_google_maps_categories`
--

CREATE TABLE `default_google_maps_categories` (
  `google_map_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_google_maps_categories`
--

INSERT INTO `default_google_maps_categories` (`google_map_id`, `category_id`) VALUES
(2, 2),
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_google_maps_intro`
--

CREATE TABLE `default_google_maps_intro` (
  `id` int(11) NOT NULL,
  `text` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_google_map_categories`
--

CREATE TABLE `default_google_map_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `parent` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `outstanding` int(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_google_map_categories`
--

INSERT INTO `default_google_map_categories` (`id`, `title`, `position`, `parent`, `slug`, `outstanding`, `created_at`, `updated_at`, `lang`) VALUES
(1, 'Bogota es', NULL, 0, 'bogota-es', 1, '2015-04-07 18:02:17', '2015-04-07 16:02:17', 'es'),
(2, 'Bogota en', NULL, 0, 'bogota-en', 1, '2015-04-07 18:05:03', '2015-04-07 16:05:03', 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_groups`
--

CREATE TABLE `default_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_groups`
--

INSERT INTO `default_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'user', 'User');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_history_numbers`
--

CREATE TABLE `default_history_numbers` (
  `id` int(11) NOT NULL,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_history_numbers`
--

INSERT INTO `default_history_numbers` (`id`, `title`, `text`, `image`, `link`, `lang`) VALUES
(1, '18 años', 'de experiencia', NULL, NULL, 'en'),
(2, '175 mm', 'ahorros en sanciones cambiarios', NULL, NULL, 'en'),
(3, 'Empaque <strong>frio</strong>', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. A natus similique quo, ipsa hic sapiente, accusantium minus ipsum maiores officiis, assumenda dolorum odit temporibus aperiam ex quaerat dolores doloremque eligendi!', 'uploads/default/home_customers/4c9fef071c7a30976cdf49cac5b918a3.JPG', 'http://imaginamos.com', 'es'),
(6, 'Empaquestrong>Refrigerante</strong>', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. A natus similique quo, ipsa hic sapiente, accusantium minus ipsum maiores officiis, assumenda dolorum odit temporibus aperiam ex quaerat dolores doloremque eligendi!\r\nsimilique quo, ipsa hic sapiente, accusantium minus ipsum maiores officiis, assumenda dolorum odit temporibus aperiam ex quaerat dolores doloremque eligendi!', 'uploads/default/home_customers/7e905928076fa14f73d8d54250bd46ba.jpg', 'http://facebook.com', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_home_banner`
--

CREATE TABLE `default_home_banner` (
  `id` int(11) NOT NULL,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `solution` text COLLATE utf8_unicode_ci,
  `position_text` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color_text` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_home_banner`
--

INSERT INTO `default_home_banner` (`id`, `image`, `title`, `text`, `solution`, `position_text`, `color_text`, `link`, `lang`) VALUES
(1, 'uploads/default/home_banner/868d05d7b04df270864e2905c2a48e6b.jpg', 'Conoce nuestros productos', '', '', 'left', '#00ffff', 'https://www.google.com.co', 'es'),
(2, 'uploads/default/home_banner/8ab2d6b738dbe14db99c5134c6aa052d.jpg', 'Conozca nuestros servicios', '', '', 'right', '#fcf50c', 'http://eltiempo.com', 'es'),
(6, 'uploads/default/home_banner/82a530e759e36146f38f42e4c5c4b36e.jpg', 'Imaginamos', 'Estrategias Digitales apoyadas en desarrollos innovadores que atrapan a sus clientes.', '<ul>  <li>Inversi&oacute;n extranjera</li>  <li>Comercio exterior</li>  <li>Negocio internacionales</li></ul>', NULL, '', 'https://www.facebook.com/', 'en'),
(7, 'uploads/default/home_banner/511f0c5b1df084dd90d6fb36206a2100.jpg', 'Bitbucket', 'Git the whole picture in JIRA Keep team leads, project managers and product own', '<ul>  <li>Inversi&oacute;n extranjera</li>  <li>Comercio exterior</li>  <li>Negocio internacionales</li></ul>', NULL, '', 'http://imaginamos.com/', 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_home_links`
--

CREATE TABLE `default_home_links` (
  `id` int(11) NOT NULL,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_home_links`
--

INSERT INTO `default_home_links` (`id`, `title`, `link`, `lang`) VALUES
(1, 'Lorem ipsum', '', 'es'),
(3, 'Lorem ipsum', '', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_home_links_intro`
--

CREATE TABLE `default_home_links_intro` (
  `id` int(11) NOT NULL,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkbanner` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titlelinkbanner` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_home_links_intro`
--

INSERT INTO `default_home_links_intro` (`id`, `title`, `logo`, `linkbanner`, `titlelinkbanner`, `lang`) VALUES
(1, 'Lorem ipsum dolor sit amet.', 'uploads/default/home_links_intro/0b3b9f9ec82363144c492043c1200b7a.png', '', '', 'es'),
(2, 's', 's', NULL, NULL, 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_home_video_info`
--

CREATE TABLE `default_home_video_info` (
  `id` int(11) NOT NULL,
  `title1` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clientes` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_home_video_info`
--

INSERT INTO `default_home_video_info` (`id`, `title1`, `image`, `clientes`, `title`, `text`, `video`, `lang`) VALUES
(1, 'Producto<strong> Destacado</strong>', 'uploads/default/home_video_info/a7ca29029332349bc2af16048aafb518.jpg', 'Nuestros <strong>Clientes</strong>', '<b>Agrollano</b><br />\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit.&nbsp;<br />\r\n&nbsp;', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime blanditiis facere animi quidem assumenda.', 'uploads/default/home_video_info/07179eadfb5ac7ec66dfe408f18bd796.mp4', 'es'),
(2, NULL, 'uploads/default/home_video_info/642dab08c82051e0abe69ffef7c1ae3a.jpg', NULL, '<strong>9</strong>Alliance', 'Lorem ipsum dolor sit amet.', 'uploads/default/home_video_info/5bb21f876bccb2654ef2d7ca0abb5bb2.mp4', 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_keywords`
--

CREATE TABLE `default_keywords` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_keywords_applied`
--

CREATE TABLE `default_keywords_applied` (
  `id` int(11) NOT NULL,
  `hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keyword_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_migrations`
--

CREATE TABLE `default_migrations` (
  `version` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_migrations`
--

INSERT INTO `default_migrations` (`version`) VALUES
(128);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_modules`
--

CREATE TABLE `default_modules` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `skip_xss` tinyint(1) NOT NULL,
  `is_frontend` tinyint(1) NOT NULL,
  `is_backend` tinyint(1) NOT NULL,
  `menu` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `installed` tinyint(1) NOT NULL,
  `is_core` tinyint(1) NOT NULL,
  `updated_on` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_modules`
--

INSERT INTO `default_modules` (`id`, `name`, `slug`, `version`, `type`, `description`, `skip_xss`, `is_frontend`, `is_backend`, `menu`, `enabled`, `installed`, `is_core`, `updated_on`) VALUES
(1, 'a:25:{s:2:"en";s:8:"Settings";s:2:"ar";s:18:"الإعدادات";s:2:"br";s:15:"Configurações";s:2:"pt";s:15:"Configurações";s:2:"cs";s:10:"Nastavení";s:2:"da";s:13:"Indstillinger";s:2:"de";s:13:"Einstellungen";s:2:"el";s:18:"Ρυθμίσεις";s:2:"es";s:15:"Configuraciones";s:2:"fa";s:14:"تنظیمات";s:2:"fi";s:9:"Asetukset";s:2:"fr";s:11:"Paramètres";s:2:"he";s:12:"הגדרות";s:2:"id";s:10:"Pengaturan";s:2:"it";s:12:"Impostazioni";s:2:"lt";s:10:"Nustatymai";s:2:"nl";s:12:"Instellingen";s:2:"pl";s:10:"Ustawienia";s:2:"ru";s:18:"Настройки";s:2:"sl";s:10:"Nastavitve";s:2:"tw";s:12:"網站設定";s:2:"cn";s:12:"网站设定";s:2:"hu";s:14:"Beállítások";s:2:"th";s:21:"ตั้งค่า";s:2:"se";s:14:"Inställningar";}', 'settings', '1.0.0', NULL, 'a:25:{s:2:"en";s:89:"Allows administrators to update settings like Site Name, messages and email address, etc.";s:2:"ar";s:161:"تمكن المدراء من تحديث الإعدادات كإسم الموقع، والرسائل وعناوين البريد الإلكتروني، .. إلخ.";s:2:"br";s:120:"Permite com que administradores e a equipe consigam trocar as configurações do website incluindo o nome e descrição.";s:2:"pt";s:113:"Permite com que os administradores consigam alterar as configurações do website incluindo o nome e descrição.";s:2:"cs";s:102:"Umožňuje administrátorům měnit nastavení webu jako jeho jméno, zprávy a emailovou adresu apod.";s:2:"da";s:90:"Lader administratorer opdatere indstillinger som sidenavn, beskeder og email adresse, etc.";s:2:"de";s:92:"Erlaubt es Administratoren die Einstellungen der Seite wie Name und Beschreibung zu ändern.";s:2:"el";s:230:"Επιτρέπει στους διαχειριστές να τροποποιήσουν ρυθμίσεις όπως το Όνομα του Ιστοτόπου, τα μηνύματα και τις διευθύνσεις email, κ.α.";s:2:"es";s:131:"Permite a los administradores y al personal configurar los detalles del sitio como el nombre del sitio y la descripción del mismo.";s:2:"fa";s:105:"تنظیمات سایت در این ماژول توسط ادمین هاس سایت انجام می شود";s:2:"fi";s:105:"Mahdollistaa sivuston asetusten muokkaamisen, kuten sivuston nimen, viestit ja sähköpostiosoitteet yms.";s:2:"fr";s:118:"Permet aux admistrateurs de modifier les paramètres du site : nom du site, description, messages, adresse email, etc.";s:2:"he";s:116:"ניהול הגדרות שונות של האתר כגון: שם האתר, הודעות, כתובות דואר וכו";s:2:"id";s:112:"Memungkinkan administrator untuk dapat memperbaharui pengaturan seperti nama situs, pesan dan alamat email, dsb.";s:2:"it";s:109:"Permette agli amministratori di aggiornare impostazioni quali Nome del Sito, messaggi e indirizzo email, etc.";s:2:"lt";s:104:"Leidžia administratoriams keisti puslapio vavadinimą, žinutes, administratoriaus el. pašta ir kitą.";s:2:"nl";s:114:"Maakt het administratoren en medewerkers mogelijk om websiteinstellingen zoals naam en beschrijving te veranderen.";s:2:"pl";s:103:"Umożliwia administratorom zmianę ustawień strony jak nazwa strony, opis, e-mail administratora, itd.";s:2:"ru";s:135:"Управление настройками сайта - Имя сайта, сообщения, почтовые адреса и т.п.";s:2:"sl";s:98:"Dovoljuje administratorjem posodobitev nastavitev kot je Ime strani, sporočil, email naslova itd.";s:2:"tw";s:99:"網站管理者可更新的重要網站設定。例如：網站名稱、訊息、電子郵件等。";s:2:"cn";s:99:"网站管理者可更新的重要网站设定。例如：网站名称、讯息、电子邮件等。";s:2:"hu";s:125:"Lehetővé teszi az adminok számára a beállítások frissítését, mint a weboldal neve, üzenetek, e-mail címek, stb...";s:2:"th";s:232:"ให้ผู้ดูแลระบบสามารถปรับปรุงการตั้งค่าเช่นชื่อเว็บไซต์ ข้อความและอีเมล์เป็นต้น";s:2:"se";s:84:"Administratören kan uppdatera webbplatsens titel, meddelanden och E-postadress etc.";}', 1, 0, 1, 'settings', 1, 1, 1, 1439567495),
(2, 'a:11:{s:2:"en";s:12:"Streams Core";s:2:"pt";s:14:"Núcleo Fluxos";s:2:"fr";s:10:"Noyau Flux";s:2:"el";s:23:"Πυρήνας Ροών";s:2:"se";s:18:"Streams grundmodul";s:2:"tw";s:14:"Streams 核心";s:2:"cn";s:14:"Streams 核心";s:2:"ar";s:31:"الجداول الأساسية";s:2:"it";s:12:"Streams Core";s:2:"fa";s:26:"هسته استریم ها";s:2:"fi";s:13:"Striimit ydin";}', 'streams_core', '1.0.0', NULL, 'a:11:{s:2:"en";s:29:"Core data module for streams.";s:2:"pt";s:37:"Módulo central de dados para fluxos.";s:2:"fr";s:32:"Noyau de données pour les Flux.";s:2:"el";s:113:"Προγραμματιστικός πυρήνας για την λειτουργία ροών δεδομένων.";s:2:"se";s:50:"Streams grundmodul för enklare hantering av data.";s:2:"tw";s:29:"Streams 核心資料模組。";s:2:"cn";s:29:"Streams 核心资料模组。";s:2:"ar";s:57:"وحدة البيانات الأساسية للجداول";s:2:"it";s:17:"Core dello Stream";s:2:"fa";s:48:"ماژول مرکزی برای استریم ها";s:2:"fi";s:48:"Ydin datan hallinoiva moduuli striimejä varten.";}', 1, 0, 0, '0', 1, 1, 1, 1439567495),
(3, 'a:21:{s:2:"en";s:15:"Email Templates";s:2:"ar";s:48:"قوالب الرسائل الإلكترونية";s:2:"br";s:17:"Modelos de e-mail";s:2:"pt";s:17:"Modelos de e-mail";s:2:"da";s:16:"Email skabeloner";s:2:"el";s:22:"Δυναμικά email";s:2:"es";s:19:"Plantillas de email";s:2:"fa";s:26:"قالب های ایمیل";s:2:"fr";s:17:"Modèles d''emails";s:2:"he";s:12:"תבניות";s:2:"id";s:14:"Template Email";s:2:"lt";s:22:"El. laiškų šablonai";s:2:"nl";s:15:"Email sjablonen";s:2:"ru";s:25:"Шаблоны почты";s:2:"sl";s:14:"Email predloge";s:2:"tw";s:12:"郵件範本";s:2:"cn";s:12:"邮件范本";s:2:"hu";s:15:"E-mail sablonok";s:2:"fi";s:25:"Sähköposti viestipohjat";s:2:"th";s:33:"แม่แบบอีเมล";s:2:"se";s:12:"E-postmallar";}', 'templates', '1.1.0', NULL, 'a:21:{s:2:"en";s:46:"Create, edit, and save dynamic email templates";s:2:"ar";s:97:"أنشئ، عدّل واحفظ قوالب البريد الإلكترني الديناميكية.";s:2:"br";s:51:"Criar, editar e salvar modelos de e-mail dinâmicos";s:2:"pt";s:51:"Criar, editar e salvar modelos de e-mail dinâmicos";s:2:"da";s:49:"Opret, redigér og gem dynamiske emailskabeloner.";s:2:"el";s:108:"Δημιουργήστε, επεξεργαστείτε και αποθηκεύστε δυναμικά email.";s:2:"es";s:54:"Crear, editar y guardar plantillas de email dinámicas";s:2:"fa";s:92:"ایحاد، ویرایش و ذخیره ی قالب های ایمیل به صورت پویا";s:2:"fr";s:61:"Créer, éditer et sauver dynamiquement des modèles d''emails";s:2:"he";s:54:"ניהול של תבניות דואר אלקטרוני";s:2:"id";s:55:"Membuat, mengedit, dan menyimpan template email dinamis";s:2:"lt";s:58:"Kurk, tvarkyk ir saugok dinaminius el. laiškų šablonus.";s:2:"nl";s:49:"Maak, bewerk, en beheer dynamische emailsjablonen";s:2:"ru";s:127:"Создавайте, редактируйте и сохраняйте динамические почтовые шаблоны";s:2:"sl";s:52:"Ustvari, uredi in shrani spremenljive email predloge";s:2:"tw";s:61:"新增、編輯與儲存可顯示動態資料的 email 範本";s:2:"cn";s:61:"新增、编辑与储存可显示动态资料的 email 范本";s:2:"hu";s:63:"Csináld, szerkeszd és mentsd el a dinamikus e-mail sablonokat";s:2:"fi";s:66:"Lisää, muokkaa ja tallenna dynaamisia sähköposti viestipohjia.";s:2:"th";s:129:"การสร้างแก้ไขและบันทึกแม่แบบอีเมลแบบไดนามิก";s:2:"se";s:49:"Skapa, redigera och spara dynamiska E-postmallar.";}', 1, 0, 1, 'structure', 1, 1, 1, 1439567495),
(4, 'a:25:{s:2:"en";s:7:"Add-ons";s:2:"ar";s:16:"الإضافات";s:2:"br";s:12:"Complementos";s:2:"pt";s:12:"Complementos";s:2:"cs";s:8:"Doplňky";s:2:"da";s:7:"Add-ons";s:2:"de";s:13:"Erweiterungen";s:2:"el";s:16:"Πρόσθετα";s:2:"es";s:9:"Agregados";s:2:"fa";s:17:"افزونه ها";s:2:"fi";s:9:"Lisäosat";s:2:"fr";s:10:"Extensions";s:2:"he";s:12:"תוספות";s:2:"id";s:7:"Pengaya";s:2:"it";s:7:"Add-ons";s:2:"lt";s:7:"Priedai";s:2:"nl";s:7:"Add-ons";s:2:"pl";s:12:"Rozszerzenia";s:2:"ru";s:20:"Дополнения";s:2:"sl";s:11:"Razširitve";s:2:"tw";s:12:"附加模組";s:2:"cn";s:12:"附加模组";s:2:"hu";s:14:"Bővítmények";s:2:"th";s:27:"ส่วนเสริม";s:2:"se";s:8:"Tillägg";}', 'addons', '2.0.0', NULL, 'a:25:{s:2:"en";s:59:"Allows admins to see a list of currently installed modules.";s:2:"ar";s:91:"تُمكّن المُدراء من معاينة جميع الوحدات المُثبّتة.";s:2:"br";s:75:"Permite aos administradores ver a lista dos módulos instalados atualmente.";s:2:"pt";s:75:"Permite aos administradores ver a lista dos módulos instalados atualmente.";s:2:"cs";s:68:"Umožňuje administrátorům vidět seznam nainstalovaných modulů.";s:2:"da";s:63:"Lader administratorer se en liste over de installerede moduler.";s:2:"de";s:56:"Zeigt Administratoren alle aktuell installierten Module.";s:2:"el";s:152:"Επιτρέπει στους διαχειριστές να προβάλουν μια λίστα των εγκατεστημένων πρόσθετων.";s:2:"es";s:71:"Permite a los administradores ver una lista de los módulos instalados.";s:2:"fa";s:93:"مشاهده لیست افزونه ها و مدیریت آنها برای ادمین سایت";s:2:"fi";s:60:"Listaa järjestelmänvalvojalle käytössä olevat moduulit.";s:2:"fr";s:66:"Permet aux administrateurs de voir la liste des modules installés";s:2:"he";s:160:"נותן אופציה למנהל לראות רשימה של המודולים אשר מותקנים כעת באתר או להתקין מודולים נוספים";s:2:"id";s:57:"Memperlihatkan kepada admin daftar modul yang terinstall.";s:2:"it";s:83:"Permette agli amministratori di vedere una lista dei moduli attualmente installati.";s:2:"lt";s:75:"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.";s:2:"nl";s:79:"Stelt admins in staat om een overzicht van geinstalleerde modules te genereren.";s:2:"pl";s:81:"Umożliwiają administratorowi wgląd do listy obecnie zainstalowanych modułów.";s:2:"ru";s:83:"Список модулей, которые установлены на сайте.";s:2:"sl";s:65:"Dovoljuje administratorjem pregled trenutno nameščenih modulov.";s:2:"tw";s:54:"管理員可以檢視目前已經安裝模組的列表";s:2:"cn";s:54:"管理员可以检视目前已经安装模组的列表";s:2:"hu";s:79:"Lehetővé teszi az adminoknak, hogy lássák a telepített modulok listáját.";s:2:"th";s:162:"ช่วยให้ผู้ดูแลระบบดูรายการของโมดูลที่ติดตั้งในปัจจุบัน";s:2:"se";s:67:"Gör det möjligt för administratören att se installerade mouler.";}', 0, 0, 1, '0', 1, 1, 1, 1439567495),
(5, 'a:17:{s:2:"en";s:4:"Blog";s:2:"ar";s:16:"المدوّنة";s:2:"br";s:4:"Blog";s:2:"pt";s:4:"Blog";s:2:"el";s:18:"Ιστολόγιο";s:2:"fa";s:8:"بلاگ";s:2:"he";s:8:"בלוג";s:2:"id";s:4:"Blog";s:2:"lt";s:6:"Blogas";s:2:"pl";s:4:"Blog";s:2:"ru";s:8:"Блог";s:2:"tw";s:6:"文章";s:2:"cn";s:6:"文章";s:2:"hu";s:4:"Blog";s:2:"fi";s:5:"Blogi";s:2:"th";s:15:"บล็อก";s:2:"se";s:5:"Blogg";}', 'blog', '2.0.0', NULL, 'a:25:{s:2:"en";s:18:"Post blog entries.";s:2:"ar";s:48:"أنشر المقالات على مدوّنتك.";s:2:"br";s:30:"Escrever publicações de blog";s:2:"pt";s:39:"Escrever e editar publicações no blog";s:2:"cs";s:49:"Publikujte nové články a příspěvky na blog.";s:2:"da";s:17:"Skriv blogindlæg";s:2:"de";s:47:"Veröffentliche neue Artikel und Blog-Einträge";s:2:"sl";s:23:"Objavite blog prispevke";s:2:"fi";s:28:"Kirjoita blogi artikkeleita.";s:2:"el";s:93:"Δημιουργήστε άρθρα και εγγραφές στο ιστολόγιο σας.";s:2:"es";s:54:"Escribe entradas para los artículos y blog (web log).";s:2:"fa";s:44:"مقالات منتشر شده در بلاگ";s:2:"fr";s:34:"Poster des articles d''actualités.";s:2:"he";s:19:"ניהול בלוג";s:2:"id";s:15:"Post entri blog";s:2:"it";s:36:"Pubblica notizie e post per il blog.";s:2:"lt";s:40:"Rašykite naujienas bei blog''o įrašus.";s:2:"nl";s:41:"Post nieuwsartikelen en blogs op uw site.";s:2:"pl";s:27:"Dodawaj nowe wpisy na blogu";s:2:"ru";s:49:"Управление записями блога.";s:2:"tw";s:42:"發表新聞訊息、部落格等文章。";s:2:"cn";s:42:"发表新闻讯息、部落格等文章。";s:2:"th";s:48:"โพสต์รายการบล็อก";s:2:"hu";s:32:"Blog bejegyzések létrehozása.";s:2:"se";s:18:"Inlägg i bloggen.";}', 1, 1, 1, 'content', 0, 1, 1, 1439567495),
(6, 'a:25:{s:2:"en";s:8:"Comments";s:2:"ar";s:18:"التعليقات";s:2:"br";s:12:"Comentários";s:2:"pt";s:12:"Comentários";s:2:"cs";s:11:"Komentáře";s:2:"da";s:11:"Kommentarer";s:2:"de";s:10:"Kommentare";s:2:"el";s:12:"Σχόλια";s:2:"es";s:11:"Comentarios";s:2:"fi";s:9:"Kommentit";s:2:"fr";s:12:"Commentaires";s:2:"fa";s:10:"نظرات";s:2:"he";s:12:"תגובות";s:2:"id";s:8:"Komentar";s:2:"it";s:8:"Commenti";s:2:"lt";s:10:"Komentarai";s:2:"nl";s:8:"Reacties";s:2:"pl";s:10:"Komentarze";s:2:"ru";s:22:"Комментарии";s:2:"sl";s:10:"Komentarji";s:2:"tw";s:6:"回應";s:2:"cn";s:6:"回应";s:2:"hu";s:16:"Hozzászólások";s:2:"th";s:33:"ความคิดเห็น";s:2:"se";s:11:"Kommentarer";}', 'comments', '1.1.0', NULL, 'a:25:{s:2:"en";s:76:"Users and guests can write comments for content like blog, pages and photos.";s:2:"ar";s:152:"يستطيع الأعضاء والزوّار كتابة التعليقات على المُحتوى كالأخبار، والصفحات والصّوَر.";s:2:"br";s:97:"Usuários e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.";s:2:"pt";s:100:"Utilizadores e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.";s:2:"cs";s:100:"Uživatelé a hosté mohou psát komentáře k obsahu, např. neovinkám, stránkám a fotografiím.";s:2:"da";s:83:"Brugere og besøgende kan skrive kommentarer til indhold som blog, sider og fotoer.";s:2:"de";s:65:"Benutzer und Gäste können für fast alles Kommentare schreiben.";s:2:"el";s:224:"Οι χρήστες και οι επισκέπτες μπορούν να αφήνουν σχόλια για περιεχόμενο όπως το ιστολόγιο, τις σελίδες και τις φωτογραφίες.";s:2:"es";s:130:"Los usuarios y visitantes pueden escribir comentarios en casi todo el contenido con el soporte de un sistema de captcha incluído.";s:2:"fa";s:168:"کاربران و مهمان ها می توانند نظرات خود را بر روی محتوای سایت در بلاگ و دیگر قسمت ها ارائه دهند";s:2:"fi";s:107:"Käyttäjät ja vieraat voivat kirjoittaa kommentteja eri sisältöihin kuten uutisiin, sivuihin ja kuviin.";s:2:"fr";s:130:"Les utilisateurs et les invités peuvent écrire des commentaires pour quasiment tout grâce au générateur de captcha intégré.";s:2:"he";s:94:"משתמשי האתר יכולים לרשום תגובות למאמרים, תמונות וכו";s:2:"id";s:100:"Pengguna dan pengunjung dapat menuliskan komentaruntuk setiap konten seperti blog, halaman dan foto.";s:2:"it";s:85:"Utenti e visitatori possono scrivere commenti ai contenuti quali blog, pagine e foto.";s:2:"lt";s:75:"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.";s:2:"nl";s:52:"Gebruikers en gasten kunnen reageren op bijna alles.";s:2:"pl";s:93:"Użytkownicy i goście mogą dodawać komentarze z wbudowanym systemem zabezpieczeń captcha.";s:2:"ru";s:187:"Пользователи и гости могут добавлять комментарии к новостям, информационным страницам и фотографиям.";s:2:"sl";s:89:"Uporabniki in obiskovalci lahko vnesejo komentarje na vsebino kot je blok, stra ali slike";s:2:"tw";s:75:"用戶和訪客可以針對新聞、頁面與照片等內容發表回應。";s:2:"cn";s:75:"用户和访客可以针对新闻、页面与照片等内容发表回应。";s:2:"hu";s:117:"A felhasználók és a vendégek hozzászólásokat írhatnak a tartalomhoz (bejegyzésekhez, oldalakhoz, fotókhoz).";s:2:"th";s:240:"ผู้ใช้งานและผู้เยี่ยมชมสามารถเขียนความคิดเห็นในเนื้อหาของหน้าเว็บบล็อกและภาพถ่าย";s:2:"se";s:98:"Användare och besökare kan skriva kommentarer till innehåll som blogginlägg, sidor och bilder.";}', 0, 0, 1, 'content', 0, 1, 1, 1439567495),
(105, 'a:25:{s:2:"en";s:7:"Contact";s:2:"ar";s:14:"الإتصال";s:2:"br";s:7:"Contato";s:2:"pt";s:8:"Contacto";s:2:"cs";s:7:"Kontakt";s:2:"da";s:7:"Kontakt";s:2:"de";s:7:"Kontakt";s:2:"el";s:22:"Επικοινωνία";s:2:"es";s:8:"Contacto";s:2:"fa";s:18:"تماس با ما";s:2:"fi";s:13:"Ota yhteyttä";s:2:"fr";s:7:"Contact";s:2:"he";s:17:"יצירת קשר";s:2:"id";s:6:"Kontak";s:2:"it";s:10:"Contattaci";s:2:"lt";s:18:"Kontaktinė formą";s:2:"nl";s:7:"Contact";s:2:"pl";s:7:"Kontakt";s:2:"ru";s:27:"Обратная связь";s:2:"sl";s:7:"Kontakt";s:2:"tw";s:12:"聯絡我們";s:2:"cn";s:12:"联络我们";s:2:"hu";s:9:"Kapcsolat";s:2:"th";s:18:"ติดต่อ";s:2:"se";s:7:"Kontakt";}', 'contact', '1.0.0', NULL, 'a:25:{s:2:"en";s:112:"Adds a form to your site that allows visitors to send emails to you without disclosing an email address to them.";s:2:"ar";s:157:"إضافة استمارة إلى موقعك تُمكّن الزوّار من مراسلتك دون علمهم بعنوان البريد الإلكتروني.";s:2:"br";s:139:"Adiciona um formulário para o seu site permitir aos visitantes que enviem e-mails para voce sem divulgar um endereço de e-mail para eles.";s:2:"pt";s:116:"Adiciona um formulário ao seu site que permite aos visitantes enviarem e-mails sem divulgar um endereço de e-mail.";s:2:"cs";s:149:"Přidá na web kontaktní formulář pro návštěvníky a uživatele, díky kterému vás mohou kontaktovat i bez znalosti vaší e-mailové adresy.";s:2:"da";s:123:"Tilføjer en formular på din side som tillader besøgende at sende mails til dig, uden at du skal opgive din email-adresse";s:2:"de";s:119:"Fügt ein Formular hinzu, welches Besuchern erlaubt Emails zu schreiben, ohne die Kontakt Email-Adresse offen zu legen.";s:2:"el";s:273:"Προσθέτει μια φόρμα στον ιστότοπό σας που επιτρέπει σε επισκέπτες να σας στέλνουν μηνύμα μέσω email χωρίς να τους αποκαλύπτεται η διεύθυνση του email σας.";s:2:"fa";s:239:"فرم تماس را به سایت اضافه می کند تا مراجعین بتوانند بدون اینکه ایمیل شما را بدانند برای شما پیغام هایی را از طریق ایمیل ارسال نمایند.";s:2:"es";s:156:"Añade un formulario a tu sitio que permitirá a los visitantes enviarte correos electrónicos a ti sin darles tu dirección de correo directamente a ellos.";s:2:"fi";s:128:"Luo lomakkeen sivustollesi, josta kävijät voivat lähettää sähköpostia tietämättä vastaanottajan sähköpostiosoitetta.";s:2:"fr";s:122:"Ajoute un formulaire à votre site qui permet aux visiteurs de vous envoyer un e-mail sans révéler votre adresse e-mail.";s:2:"he";s:155:"מוסיף תופס יצירת קשר לאתר על מנת לא לחסוף כתובת דואר האלקטרוני של האתר למנועי פרסומות";s:2:"id";s:149:"Menambahkan formulir ke dalam situs Anda yang memungkinkan pengunjung untuk mengirimkan email kepada Anda tanpa memberikan alamat email kepada mereka";s:2:"it";s:119:"Aggiunge un modulo al tuo sito che permette ai visitatori di inviarti email senza mostrare loro il tuo indirizzo email.";s:2:"lt";s:124:"Prideda jūsų puslapyje formą leidžianti lankytojams siūsti jums el. laiškus neatskleidžiant jūsų el. pašto adreso.";s:2:"nl";s:125:"Voegt een formulier aan de site toe waarmee bezoekers een email kunnen sturen, zonder dat u ze een emailadres hoeft te tonen.";s:2:"pl";s:126:"Dodaje formularz kontaktowy do Twojej strony, który pozwala użytkownikom wysłanie maila za pomocą formularza kontaktowego.";s:2:"ru";s:234:"Добавляет форму обратной связи на сайт, через которую посетители могут отправлять вам письма, при этом адрес Email остаётся скрыт.";s:2:"sl";s:113:"Dodaj obrazec za kontakt da vam lahko obiskovalci pošljejo sporočilo brez da bi jim razkrili vaš email naslov.";s:2:"tw";s:147:"為您的網站新增「聯絡我們」的功能，對訪客是較為清楚便捷的聯絡方式，也無須您將電子郵件公開在網站上。";s:2:"cn";s:147:"为您的网站新增“联络我们”的功能，对访客是较为清楚便捷的联络方式，也无须您将电子邮件公开在网站上。";s:2:"th";s:316:"เพิ่มแบบฟอร์มในเว็บไซต์ของคุณ ช่วยให้ผู้เยี่ยมชมสามารถส่งอีเมลถึงคุณโดยไม่ต้องเปิดเผยที่อยู่อีเมลของพวกเขา";s:2:"hu";s:156:"Létrehozható vele olyan űrlap, amely lehetővé teszi a látogatók számára, hogy e-mailt küldjenek neked úgy, hogy nem feded fel az e-mail címedet.";s:2:"se";s:53:"Lägger till ett kontaktformulär till din webbplats.";}', 0, 0, 0, '0', 1, 1, 1, 1439567495),
(8, 'a:8:{s:2:"en";s:7:"Domains";s:2:"el";s:7:"Domains";s:2:"fr";s:8:"Domaines";s:2:"se";s:8:"Domäner";s:2:"it";s:6:"Domini";s:2:"ar";s:27:"أسماء النطاقات";s:2:"tw";s:6:"網域";s:2:"cn";s:6:"网域";}', 'domains', '1.0.0', NULL, 'a:8:{s:2:"en";s:39:"Create domain aliases for your website.";s:2:"el";s:91:"Διαχειριστείτε συνώνυμα domain για τον ιστότοπό σας.";s:2:"fr";s:47:"Créer des alias de domaine pour votre site web";s:2:"se";s:36:"Skapa domänalias för din webbplats";s:2:"it";s:26:"Crea alias per il tuo sito";s:2:"ar";s:57:"أنشئ أسماء نطاقات بديلة لموقعك.";s:2:"tw";s:33:"為您的網站建立網域別名";s:2:"cn";s:33:"为您的网站建立网域别名";}', 0, 0, 1, 'structure', 1, 1, 1, 1439567495),
(9, 'a:24:{s:2:"en";s:5:"Files";s:2:"ar";s:16:"الملفّات";s:2:"br";s:8:"Arquivos";s:2:"pt";s:9:"Ficheiros";s:2:"cs";s:7:"Soubory";s:2:"da";s:5:"Filer";s:2:"de";s:7:"Dateien";s:2:"el";s:12:"Αρχεία";s:2:"es";s:8:"Archivos";s:2:"fa";s:13:"فایل ها";s:2:"fi";s:9:"Tiedostot";s:2:"fr";s:8:"Fichiers";s:2:"he";s:10:"קבצים";s:2:"id";s:4:"File";s:2:"it";s:4:"File";s:2:"lt";s:6:"Failai";s:2:"nl";s:9:"Bestanden";s:2:"ru";s:10:"Файлы";s:2:"sl";s:8:"Datoteke";s:2:"tw";s:6:"檔案";s:2:"cn";s:6:"档案";s:2:"hu";s:7:"Fájlok";s:2:"th";s:12:"ไฟล์";s:2:"se";s:5:"Filer";}', 'files', '2.0.0', NULL, 'a:24:{s:2:"en";s:40:"Manages files and folders for your site.";s:2:"ar";s:50:"إدارة ملفات ومجلّدات موقعك.";s:2:"br";s:53:"Permite gerenciar facilmente os arquivos de seu site.";s:2:"pt";s:59:"Permite gerir facilmente os ficheiros e pastas do seu site.";s:2:"cs";s:43:"Spravujte soubory a složky na vašem webu.";s:2:"da";s:41:"Administrer filer og mapper for dit site.";s:2:"de";s:35:"Verwalte Dateien und Verzeichnisse.";s:2:"el";s:100:"Διαχειρίζεται αρχεία και φακέλους για το ιστότοπό σας.";s:2:"es";s:43:"Administra archivos y carpetas en tu sitio.";s:2:"fa";s:79:"مدیریت فایل های چند رسانه ای و فولدر ها سایت";s:2:"fi";s:43:"Hallitse sivustosi tiedostoja ja kansioita.";s:2:"fr";s:46:"Gérer les fichiers et dossiers de votre site.";s:2:"he";s:47:"ניהול תיקיות וקבצים שבאתר";s:2:"id";s:42:"Mengatur file dan folder dalam situs Anda.";s:2:"it";s:38:"Gestisci file e cartelle del tuo sito.";s:2:"lt";s:28:"Katalogų ir bylų valdymas.";s:2:"nl";s:41:"Beheer bestanden en mappen op uw website.";s:2:"ru";s:78:"Управление файлами и папками вашего сайта.";s:2:"sl";s:38:"Uredi datoteke in mape na vaši strani";s:2:"tw";s:33:"管理網站中的檔案與目錄";s:2:"cn";s:33:"管理网站中的档案与目录";s:2:"hu";s:41:"Fájlok és mappák kezelése az oldalon.";s:2:"th";s:141:"บริหารจัดการไฟล์และโฟลเดอร์สำหรับเว็บไซต์ของคุณ";s:2:"se";s:45:"Hanterar filer och mappar för din webbplats.";}', 0, 0, 1, 'content', 0, 1, 1, 1439567495),
(10, 'a:24:{s:2:"en";s:6:"Groups";s:2:"ar";s:18:"المجموعات";s:2:"br";s:6:"Grupos";s:2:"pt";s:6:"Grupos";s:2:"cs";s:7:"Skupiny";s:2:"da";s:7:"Grupper";s:2:"de";s:7:"Gruppen";s:2:"el";s:12:"Ομάδες";s:2:"es";s:6:"Grupos";s:2:"fa";s:13:"گروه ها";s:2:"fi";s:7:"Ryhmät";s:2:"fr";s:7:"Groupes";s:2:"he";s:12:"קבוצות";s:2:"id";s:4:"Grup";s:2:"it";s:6:"Gruppi";s:2:"lt";s:7:"Grupės";s:2:"nl";s:7:"Groepen";s:2:"ru";s:12:"Группы";s:2:"sl";s:7:"Skupine";s:2:"tw";s:6:"群組";s:2:"cn";s:6:"群组";s:2:"hu";s:9:"Csoportok";s:2:"th";s:15:"กลุ่ม";s:2:"se";s:7:"Grupper";}', 'groups', '1.0.0', NULL, 'a:24:{s:2:"en";s:54:"Users can be placed into groups to manage permissions.";s:2:"ar";s:100:"يمكن وضع المستخدمين في مجموعات لتسهيل إدارة صلاحياتهم.";s:2:"br";s:72:"Usuários podem ser inseridos em grupos para gerenciar suas permissões.";s:2:"pt";s:74:"Utilizadores podem ser inseridos em grupos para gerir as suas permissões.";s:2:"cs";s:77:"Uživatelé mohou být rozřazeni do skupin pro lepší správu oprávnění.";s:2:"da";s:49:"Brugere kan inddeles i grupper for adgangskontrol";s:2:"de";s:85:"Benutzer können zu Gruppen zusammengefasst werden um diesen Zugriffsrechte zu geben.";s:2:"el";s:168:"Οι χρήστες μπορούν να τοποθετηθούν σε ομάδες και έτσι να διαχειριστείτε τα δικαιώματά τους.";s:2:"es";s:75:"Los usuarios podrán ser colocados en grupos para administrar sus permisos.";s:2:"fa";s:149:"کاربرها می توانند در گروه های ساماندهی شوند تا بتوان اجازه های مختلفی را ایجاد کرد";s:2:"fi";s:84:"Käyttäjät voidaan liittää ryhmiin, jotta käyttöoikeuksia voidaan hallinnoida.";s:2:"fr";s:82:"Les utilisateurs peuvent appartenir à des groupes afin de gérer les permissions.";s:2:"he";s:62:"נותן אפשרות לאסוף משתמשים לקבוצות";s:2:"id";s:68:"Pengguna dapat dikelompokkan ke dalam grup untuk mengatur perizinan.";s:2:"it";s:69:"Gli utenti possono essere inseriti in gruppi per gestirne i permessi.";s:2:"lt";s:67:"Vartotojai gali būti priskirti grupei tam, kad valdyti jų teises.";s:2:"nl";s:73:"Gebruikers kunnen in groepen geplaatst worden om rechten te kunnen geven.";s:2:"ru";s:134:"Пользователей можно объединять в группы, для управления правами доступа.";s:2:"sl";s:64:"Uporabniki so lahko razvrščeni v skupine za urejanje dovoljenj";s:2:"tw";s:45:"用戶可以依群組分類並管理其權限";s:2:"cn";s:45:"用户可以依群组分类并管理其权限";s:2:"hu";s:73:"A felhasználók csoportokba rendezhetőek a jogosultságok kezelésére.";s:2:"th";s:84:"สามารถวางผู้ใช้ลงในกลุ่มเพื่";s:2:"se";s:76:"Användare kan delas in i grupper för att hantera roller och behörigheter.";}', 0, 0, 1, 'users', 1, 1, 1, 1439567495),
(11, 'a:17:{s:2:"en";s:8:"Keywords";s:2:"ar";s:21:"كلمات البحث";s:2:"br";s:14:"Palavras-chave";s:2:"pt";s:14:"Palavras-chave";s:2:"da";s:9:"Nøgleord";s:2:"el";s:27:"Λέξεις Κλειδιά";s:2:"fa";s:21:"کلمات کلیدی";s:2:"fr";s:10:"Mots-Clés";s:2:"id";s:10:"Kata Kunci";s:2:"nl";s:14:"Sleutelwoorden";s:2:"tw";s:6:"鍵詞";s:2:"cn";s:6:"键词";s:2:"hu";s:11:"Kulcsszavak";s:2:"fi";s:10:"Avainsanat";s:2:"sl";s:15:"Ključne besede";s:2:"th";s:15:"คำค้น";s:2:"se";s:9:"Nyckelord";}', 'keywords', '1.1.0', NULL, 'a:17:{s:2:"en";s:71:"Maintain a central list of keywords to label and organize your content.";s:2:"ar";s:124:"أنشئ مجموعة من كلمات البحث التي تستطيع من خلالها وسم وتنظيم المحتوى.";s:2:"br";s:85:"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.";s:2:"pt";s:85:"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.";s:2:"da";s:72:"Vedligehold en central liste af nøgleord for at organisere dit indhold.";s:2:"el";s:181:"Συντηρεί μια κεντρική λίστα από λέξεις κλειδιά για να οργανώνετε μέσω ετικετών το περιεχόμενό σας.";s:2:"fa";s:110:"حفظ و نگهداری لیست مرکزی از کلمات کلیدی برای سازماندهی محتوا";s:2:"fr";s:87:"Maintenir une liste centralisée de Mots-Clés pour libeller et organiser vos contenus.";s:2:"id";s:71:"Memantau daftar kata kunci untuk melabeli dan mengorganisasikan konten.";s:2:"nl";s:91:"Beheer een centrale lijst van sleutelwoorden om uw content te categoriseren en organiseren.";s:2:"tw";s:64:"集中管理可用於標題與內容的鍵詞(keywords)列表。";s:2:"cn";s:64:"集中管理可用于标题与内容的键词(keywords)列表。";s:2:"hu";s:65:"Ez egy központi kulcsszó lista a cimkékhez és a tartalmakhoz.";s:2:"fi";s:92:"Hallinnoi keskitettyä listaa avainsanoista merkitäksesi ja järjestelläksesi sisältöä.";s:2:"sl";s:82:"Vzdržuj centralni seznam ključnih besed za označevanje in ogranizacijo vsebine.";s:2:"th";s:189:"ศูนย์กลางการปรับปรุงคำค้นในการติดฉลากและจัดระเบียบเนื้อหาของคุณ";s:2:"se";s:61:"Hantera nyckelord för att organisera webbplatsens innehåll.";}', 0, 0, 1, 'data', 1, 1, 1, 1439567495),
(12, 'a:15:{s:2:"en";s:11:"Maintenance";s:2:"pt";s:12:"Manutenção";s:2:"ar";s:14:"الصيانة";s:2:"el";s:18:"Συντήρηση";s:2:"hu";s:13:"Karbantartás";s:2:"fa";s:15:"نگه داری";s:2:"fi";s:9:"Ylläpito";s:2:"fr";s:11:"Maintenance";s:2:"id";s:12:"Pemeliharaan";s:2:"it";s:12:"Manutenzione";s:2:"se";s:10:"Underhåll";s:2:"sl";s:12:"Vzdrževanje";s:2:"th";s:39:"การบำรุงรักษา";s:2:"tw";s:6:"維護";s:2:"cn";s:6:"维护";}', 'maintenance', '1.0.0', NULL, 'a:15:{s:2:"en";s:63:"Manage the site cache and export information from the database.";s:2:"pt";s:68:"Gerir o cache do seu site e exportar informações da base de dados.";s:2:"ar";s:81:"حذف عناصر الذاكرة المخبأة عبر واجهة الإدارة.";s:2:"el";s:142:"Διαγραφή αντικειμένων προσωρινής αποθήκευσης μέσω της περιοχής διαχείρισης.";s:2:"id";s:60:"Mengatur cache situs dan mengexport informasi dari database.";s:2:"it";s:65:"Gestisci la cache del sito e esporta le informazioni dal database";s:2:"fa";s:73:"مدیریت کش سایت و صدور اطلاعات از دیتابیس";s:2:"fr";s:71:"Gérer le cache du site et exporter les contenus de la base de données";s:2:"fi";s:59:"Hallinoi sivuston välimuistia ja vie tietoa tietokannasta.";s:2:"hu";s:66:"Az oldal gyorsítótár kezelése és az adatbázis exportálása.";s:2:"se";s:76:"Underhåll webbplatsens cache och exportera data från webbplatsens databas.";s:2:"sl";s:69:"Upravljaj s predpomnilnikom strani (cache) in izvozi podatke iz baze.";s:2:"th";s:150:"การจัดการแคชเว็บไซต์และข้อมูลการส่งออกจากฐานข้อมูล";s:2:"tw";s:45:"經由管理介面手動刪除暫存資料。";s:2:"cn";s:45:"经由管理介面手动删除暂存资料。";}', 0, 0, 1, 'data', 1, 1, 1, 1439567495),
(13, 'a:25:{s:2:"en";s:10:"Navigation";s:2:"ar";s:14:"الروابط";s:2:"br";s:11:"Navegação";s:2:"pt";s:11:"Navegação";s:2:"cs";s:8:"Navigace";s:2:"da";s:10:"Navigation";s:2:"de";s:10:"Navigation";s:2:"el";s:16:"Πλοήγηση";s:2:"es";s:11:"Navegación";s:2:"fa";s:11:"منو ها";s:2:"fi";s:10:"Navigointi";s:2:"fr";s:10:"Navigation";s:2:"he";s:10:"ניווט";s:2:"id";s:8:"Navigasi";s:2:"it";s:11:"Navigazione";s:2:"lt";s:10:"Navigacija";s:2:"nl";s:9:"Navigatie";s:2:"pl";s:9:"Nawigacja";s:2:"ru";s:18:"Навигация";s:2:"sl";s:10:"Navigacija";s:2:"tw";s:12:"導航選單";s:2:"cn";s:12:"导航选单";s:2:"th";s:36:"ตัวช่วยนำทาง";s:2:"hu";s:11:"Navigáció";s:2:"se";s:10:"Navigation";}', 'navigation', '1.1.0', NULL, 'a:25:{s:2:"en";s:78:"Manage links on navigation menus and all the navigation groups they belong to.";s:2:"ar";s:85:"إدارة روابط وقوائم ومجموعات الروابط في الموقع.";s:2:"br";s:91:"Gerenciar links do menu de navegação e todos os grupos de navegação pertencentes a ele.";s:2:"pt";s:93:"Gerir todos os grupos dos menus de navegação e os links de navegação pertencentes a eles.";s:2:"cs";s:73:"Správa odkazů v navigaci a všech souvisejících navigačních skupin.";s:2:"da";s:82:"Håndtér links på navigationsmenuerne og alle navigationsgrupperne de tilhører.";s:2:"de";s:76:"Verwalte Links in Navigationsmenüs und alle zugehörigen Navigationsgruppen";s:2:"el";s:207:"Διαχειριστείτε τους συνδέσμους στα μενού πλοήγησης και όλες τις ομάδες συνδέσμων πλοήγησης στις οποίες ανήκουν.";s:2:"es";s:102:"Administra links en los menús de navegación y en todos los grupos de navegación al cual pertenecen.";s:2:"fa";s:68:"مدیریت منو ها و گروه های مربوط به آنها";s:2:"fi";s:91:"Hallitse linkkejä navigointi valikoissa ja kaikkia navigointi ryhmiä, joihin ne kuuluvat.";s:2:"fr";s:97:"Gérer les liens du menu Navigation et tous les groupes de navigation auxquels ils appartiennent.";s:2:"he";s:73:"ניהול שלוחות תפריטי ניווט וקבוצות ניווט";s:2:"id";s:73:"Mengatur tautan pada menu navigasi dan semua pengelompokan grup navigasi.";s:2:"it";s:97:"Gestisci i collegamenti dei menu di navigazione e tutti i gruppi di navigazione da cui dipendono.";s:2:"lt";s:95:"Tvarkyk nuorodas navigacijų menių ir visas navigacijų grupes kurioms tos nuorodos priklauso.";s:2:"nl";s:92:"Beheer koppelingen op de navigatiemenu&apos;s en alle navigatiegroepen waar ze onder vallen.";s:2:"pl";s:95:"Zarządzaj linkami w menu nawigacji oraz wszystkimi grupami nawigacji do których one należą.";s:2:"ru";s:136:"Управление ссылками в меню навигации и группах, к которым они принадлежат.";s:2:"sl";s:64:"Uredi povezave v meniju in vse skupine povezav ki jim pripadajo.";s:2:"tw";s:72:"管理導航選單中的連結，以及它們所隸屬的導航群組。";s:2:"cn";s:72:"管理导航选单中的连结，以及它们所隶属的导航群组。";s:2:"th";s:108:"จัดการการเชื่อมโยงนำทางและกลุ่มนำทาง";s:2:"se";s:33:"Hantera länkar och länkgrupper.";s:2:"hu";s:100:"Linkek kezelése a navigációs menükben és a navigációs csoportok kezelése, amikhez tartoznak.";}', 0, 0, 1, 'structure', 1, 1, 1, 1439567495),
(14, 'a:25:{s:2:"en";s:5:"Pages";s:2:"ar";s:14:"الصفحات";s:2:"br";s:8:"Páginas";s:2:"pt";s:8:"Páginas";s:2:"cs";s:8:"Stránky";s:2:"da";s:5:"Sider";s:2:"de";s:6:"Seiten";s:2:"el";s:14:"Σελίδες";s:2:"es";s:8:"Páginas";s:2:"fa";s:14:"صفحه ها ";s:2:"fi";s:5:"Sivut";s:2:"fr";s:5:"Pages";s:2:"he";s:8:"דפים";s:2:"id";s:7:"Halaman";s:2:"it";s:6:"Pagine";s:2:"lt";s:9:"Puslapiai";s:2:"nl";s:13:"Pagina&apos;s";s:2:"pl";s:6:"Strony";s:2:"ru";s:16:"Страницы";s:2:"sl";s:6:"Strani";s:2:"tw";s:6:"頁面";s:2:"cn";s:6:"页面";s:2:"hu";s:7:"Oldalak";s:2:"th";s:21:"หน้าเพจ";s:2:"se";s:5:"Sidor";}', 'pages', '2.2.0', NULL, 'a:25:{s:2:"en";s:55:"Add custom pages to the site with any content you want.";s:2:"ar";s:99:"إضافة صفحات مُخصّصة إلى الموقع تحتوي أية مُحتوى تريده.";s:2:"br";s:82:"Adicionar páginas personalizadas ao site com qualquer conteúdo que você queira.";s:2:"pt";s:86:"Adicionar páginas personalizadas ao seu site com qualquer conteúdo que você queira.";s:2:"cs";s:74:"Přidávejte vlastní stránky na web s jakýmkoliv obsahem budete chtít.";s:2:"da";s:71:"Tilføj brugerdefinerede sider til dit site med det indhold du ønsker.";s:2:"de";s:49:"Füge eigene Seiten mit anpassbaren Inhalt hinzu.";s:2:"el";s:152:"Προσθέστε και επεξεργαστείτε σελίδες στον ιστότοπό σας με ό,τι περιεχόμενο θέλετε.";s:2:"es";s:77:"Agrega páginas customizadas al sitio con cualquier contenido que tu quieras.";s:2:"fa";s:96:"ایحاد صفحات جدید و دلخواه با هر محتوایی که دوست دارید";s:2:"fi";s:47:"Lisää mitä tahansa sisältöä sivustollesi.";s:2:"fr";s:89:"Permet d''ajouter sur le site des pages personalisées avec le contenu que vous souhaitez.";s:2:"he";s:35:"ניהול דפי תוכן האתר";s:2:"id";s:75:"Menambahkan halaman ke dalam situs dengan konten apapun yang Anda perlukan.";s:2:"it";s:73:"Aggiungi pagine personalizzate al sito con qualsiesi contenuto tu voglia.";s:2:"lt";s:46:"Pridėkite nuosavus puslapius betkokio turinio";s:2:"nl";s:70:"Voeg aangepaste pagina&apos;s met willekeurige inhoud aan de site toe.";s:2:"pl";s:53:"Dodaj własne strony z dowolną treścią do witryny.";s:2:"ru";s:134:"Управление информационными страницами сайта, с произвольным содержимым.";s:2:"sl";s:44:"Dodaj stran s kakršno koli vsebino želite.";s:2:"tw";s:39:"為您的網站新增自定的頁面。";s:2:"cn";s:39:"为您的网站新增自定的页面。";s:2:"th";s:168:"เพิ่มหน้าเว็บที่กำหนดเองไปยังเว็บไซต์ของคุณตามที่ต้องการ";s:2:"hu";s:67:"Saját oldalak hozzáadása a weboldalhoz, akármilyen tartalommal.";s:2:"se";s:39:"Lägg till egna sidor till webbplatsen.";}', 1, 1, 1, 'content', 1, 1, 1, 1439567495),
(15, 'a:25:{s:2:"en";s:11:"Permissions";s:2:"ar";s:18:"الصلاحيات";s:2:"br";s:11:"Permissões";s:2:"pt";s:11:"Permissões";s:2:"cs";s:12:"Oprávnění";s:2:"da";s:14:"Adgangskontrol";s:2:"de";s:14:"Zugriffsrechte";s:2:"el";s:20:"Δικαιώματα";s:2:"es";s:8:"Permisos";s:2:"fa";s:15:"اجازه ها";s:2:"fi";s:16:"Käyttöoikeudet";s:2:"fr";s:11:"Permissions";s:2:"he";s:12:"הרשאות";s:2:"id";s:9:"Perizinan";s:2:"it";s:8:"Permessi";s:2:"lt";s:7:"Teisės";s:2:"nl";s:15:"Toegangsrechten";s:2:"pl";s:11:"Uprawnienia";s:2:"ru";s:25:"Права доступа";s:2:"sl";s:10:"Dovoljenja";s:2:"tw";s:6:"權限";s:2:"cn";s:6:"权限";s:2:"hu";s:14:"Jogosultságok";s:2:"th";s:18:"สิทธิ์";s:2:"se";s:13:"Behörigheter";}', 'permissions', '1.0.0', NULL, 'a:25:{s:2:"en";s:68:"Control what type of users can see certain sections within the site.";s:2:"ar";s:127:"التحكم بإعطاء الصلاحيات للمستخدمين للوصول إلى أقسام الموقع المختلفة.";s:2:"br";s:68:"Controle quais tipos de usuários podem ver certas seções no site.";s:2:"pt";s:75:"Controle quais os tipos de utilizadores podem ver certas secções no site.";s:2:"cs";s:93:"Spravujte oprávnění pro jednotlivé typy uživatelů a ke kterým sekcím mají přístup.";s:2:"da";s:72:"Kontroller hvilken type brugere der kan se bestemte sektioner på sitet.";s:2:"de";s:70:"Regelt welche Art von Benutzer welche Sektion in der Seite sehen kann.";s:2:"el";s:180:"Ελέγξτε τα δικαιώματα χρηστών και ομάδων χρηστών όσο αφορά σε διάφορες λειτουργίες του ιστοτόπου.";s:2:"es";s:81:"Controla que tipo de usuarios pueden ver secciones específicas dentro del sitio.";s:2:"fa";s:59:"مدیریت اجازه های گروه های کاربری";s:2:"fi";s:72:"Hallitse minkä tyyppisiin osioihin käyttäjät pääsevät sivustolla.";s:2:"fr";s:104:"Permet de définir les autorisations des groupes d''utilisateurs pour afficher les différentes sections.";s:2:"he";s:75:"ניהול הרשאות כניסה לאיזורים מסוימים באתר";s:2:"id";s:76:"Mengontrol tipe pengguna mana yang dapat mengakses suatu bagian dalam situs.";s:2:"it";s:78:"Controlla che tipo di utenti posssono accedere a determinate sezioni del sito.";s:2:"lt";s:72:"Kontroliuokite kokio tipo varotojai kokią dalį puslapio gali pasiekti.";s:2:"nl";s:71:"Bepaal welke typen gebruikers toegang hebben tot gedeeltes van de site.";s:2:"pl";s:79:"Ustaw, którzy użytkownicy mogą mieć dostęp do odpowiednich sekcji witryny.";s:2:"ru";s:209:"Управление правами доступа, ограничение доступа определённых групп пользователей к произвольным разделам сайта.";s:2:"sl";s:85:"Uredite dovoljenja kateri tip uporabnika lahko vidi določena področja vaše strani.";s:2:"tw";s:81:"用來控制不同類別的用戶，設定其瀏覽特定網站內容的權限。";s:2:"cn";s:81:"用来控制不同类别的用户，设定其浏览特定网站内容的权限。";s:2:"hu";s:129:"A felhasználók felügyelet alatt tartására, hogy milyen típusú felhasználók, mit láthatnak, mely szakaszain az oldalnak.";s:2:"th";s:117:"ควบคุมว่าผู้ใช้งานจะเห็นหมวดหมู่ไหนบ้าง";s:2:"se";s:27:"Hantera gruppbehörigheter.";}', 0, 0, 1, 'users', 1, 1, 1, 1439567495),
(16, 'a:24:{s:2:"en";s:9:"Redirects";s:2:"ar";s:18:"التوجيهات";s:2:"br";s:17:"Redirecionamentos";s:2:"pt";s:17:"Redirecionamentos";s:2:"cs";s:16:"Přesměrování";s:2:"da";s:13:"Omadressering";s:2:"el";s:30:"Ανακατευθύνσεις";s:2:"es";s:13:"Redirecciones";s:2:"fa";s:17:"انتقال ها";s:2:"fi";s:18:"Uudelleenohjaukset";s:2:"fr";s:12:"Redirections";s:2:"he";s:12:"הפניות";s:2:"id";s:8:"Redirect";s:2:"it";s:11:"Reindirizzi";s:2:"lt";s:14:"Peradresavimai";s:2:"nl";s:12:"Verwijzingen";s:2:"ru";s:30:"Перенаправления";s:2:"sl";s:12:"Preusmeritve";s:2:"tw";s:6:"轉址";s:2:"cn";s:6:"转址";s:2:"hu";s:17:"Átirányítások";s:2:"pl";s:14:"Przekierowania";s:2:"th";s:42:"เปลี่ยนเส้นทาง";s:2:"se";s:14:"Omdirigeringar";}', 'redirects', '1.0.0', NULL, 'a:24:{s:2:"en";s:33:"Redirect from one URL to another.";s:2:"ar";s:47:"التوجيه من رابط URL إلى آخر.";s:2:"br";s:39:"Redirecionamento de uma URL para outra.";s:2:"pt";s:40:"Redirecionamentos de uma URL para outra.";s:2:"cs";s:43:"Přesměrujte z jedné adresy URL na jinou.";s:2:"da";s:35:"Omadresser fra en URL til en anden.";s:2:"el";s:81:"Ανακατευθείνετε μια διεύθυνση URL σε μια άλλη";s:2:"es";s:34:"Redireccionar desde una URL a otra";s:2:"fa";s:63:"انتقال دادن یک صفحه به یک آدرس دیگر";s:2:"fi";s:45:"Uudelleenohjaa käyttäjän paikasta toiseen.";s:2:"fr";s:34:"Redirection d''une URL à un autre.";s:2:"he";s:43:"הפניות מכתובת אחת לאחרת";s:2:"id";s:40:"Redirect dari satu URL ke URL yang lain.";s:2:"it";s:35:"Reindirizza da una URL ad un altra.";s:2:"lt";s:56:"Peradresuokite puslapį iš vieno adreso (URL) į kitą.";s:2:"nl";s:38:"Verwijs vanaf een URL naar een andere.";s:2:"ru";s:78:"Перенаправления с одного адреса на другой.";s:2:"sl";s:44:"Preusmeritev iz enega URL naslova na drugega";s:2:"tw";s:33:"將網址轉址、重新定向。";s:2:"cn";s:33:"将网址转址、重新定向。";s:2:"hu";s:38:"Egy URL átirányítása egy másikra.";s:2:"pl";s:44:"Przekierowanie z jednego adresu URL na inny.";s:2:"th";s:123:"เปลี่ยนเส้นทางจากที่หนึ่งไปยังอีกที่หนึ่ง";s:2:"se";s:38:"Omdirigera från en URL till en annan.";}', 0, 0, 1, 'structure', 1, 1, 1, 1439567495),
(17, 'a:9:{s:2:"en";s:6:"Search";s:2:"fr";s:9:"Recherche";s:2:"se";s:4:"Sök";s:2:"ar";s:10:"البحث";s:2:"tw";s:6:"搜尋";s:2:"cn";s:6:"搜寻";s:2:"it";s:7:"Ricerca";s:2:"fa";s:10:"جستجو";s:2:"fi";s:4:"Etsi";}', 'search', '1.0.0', NULL, 'a:9:{s:2:"en";s:72:"Search through various types of content with this modular search system.";s:2:"fr";s:84:"Rechercher parmi différents types de contenus avec système de recherche modulaire.";s:2:"se";s:36:"Sök igenom olika typer av innehåll";s:2:"ar";s:102:"ابحث في أنواع مختلفة من المحتوى باستخدام نظام البحث هذا.";s:2:"tw";s:63:"此模組可用以搜尋網站中不同類型的資料內容。";s:2:"cn";s:63:"此模组可用以搜寻网站中不同类型的资料内容。";s:2:"it";s:71:"Cerca tra diversi tipi di contenuti con il sistema di reicerca modulare";s:2:"fa";s:115:"توسط این ماژول می توانید در محتواهای مختلف وبسایت جستجو نمایید.";s:2:"fi";s:76:"Etsi eri tyypistä sisältöä tällä modulaarisella hakujärjestelmällä.";}', 0, 0, 0, '0', 1, 1, 1, 1439567495),
(18, 'a:20:{s:2:"en";s:7:"Sitemap";s:2:"ar";s:23:"خريطة الموقع";s:2:"br";s:12:"Mapa do Site";s:2:"pt";s:12:"Mapa do Site";s:2:"de";s:7:"Sitemap";s:2:"el";s:31:"Χάρτης Ιστότοπου";s:2:"es";s:14:"Mapa del Sitio";s:2:"fa";s:17:"نقشه سایت";s:2:"fi";s:10:"Sivukartta";s:2:"fr";s:12:"Plan du site";s:2:"id";s:10:"Peta Situs";s:2:"it";s:14:"Mappa del sito";s:2:"lt";s:16:"Svetainės medis";s:2:"nl";s:7:"Sitemap";s:2:"ru";s:21:"Карта сайта";s:2:"tw";s:12:"網站地圖";s:2:"cn";s:12:"网站地图";s:2:"th";s:21:"ไซต์แมพ";s:2:"hu";s:13:"Oldaltérkép";s:2:"se";s:9:"Sajtkarta";}', 'sitemap', '1.3.0', NULL, 'a:21:{s:2:"en";s:87:"The sitemap module creates an index of all pages and an XML sitemap for search engines.";s:2:"ar";s:120:"وحدة خريطة الموقع تنشئ فهرساً لجميع الصفحات وملف XML لمحركات البحث.";s:2:"br";s:102:"O módulo de mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.";s:2:"pt";s:102:"O módulo do mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.";s:2:"da";s:86:"Sitemapmodulet opretter et indeks over alle sider og et XML sitemap til søgemaskiner.";s:2:"de";s:92:"Die Sitemap Modul erstellt einen Index aller Seiten und eine XML-Sitemap für Suchmaschinen.";s:2:"el";s:190:"Δημιουργεί έναν κατάλογο όλων των σελίδων και έναν χάρτη σελίδων σε μορφή XML για τις μηχανές αναζήτησης.";s:2:"es";s:111:"El módulo de mapa crea un índice de todas las páginas y un mapa del sitio XML para los motores de búsqueda.";s:2:"fa";s:150:"ماژول نقشه سایت یک لیست از همه ی صفحه ها به فرمت فایل XML برای موتور های جستجو می سازد";s:2:"fi";s:82:"sivukartta moduuli luo hakemisto kaikista sivuista ja XML sivukartta hakukoneille.";s:2:"fr";s:106:"Le module sitemap crée un index de toutes les pages et un plan de site XML pour les moteurs de recherche.";s:2:"id";s:110:"Modul peta situs ini membuat indeks dari setiap halaman dan sebuah format XML untuk mempermudah mesin pencari.";s:2:"it";s:104:"Il modulo mappa del sito crea un indice di tutte le pagine e una sitemap in XML per i motori di ricerca.";s:2:"lt";s:86:"struktūra modulis sukuria visų puslapių ir XML Sitemap paieškos sistemų indeksas.";s:2:"nl";s:89:"De sitemap module maakt een index van alle pagina''s en een XML sitemap voor zoekmachines.";s:2:"ru";s:144:"Карта модуль создает индекс всех страниц и карта сайта XML для поисковых систем.";s:2:"tw";s:84:"站點地圖模塊創建一個索引的所有網頁和XML網站地圖搜索引擎。";s:2:"cn";s:84:"站点地图模块创建一个索引的所有网页和XML网站地图搜索引擎。";s:2:"th";s:202:"โมดูลไซต์แมพสามารถสร้างดัชนีของหน้าเว็บทั้งหมดสำหรับเครื่องมือค้นหา.";s:2:"hu";s:94:"Ez a modul indexeli az összes oldalt és egy XML oldaltéképet generál a keresőmotoroknak.";s:2:"se";s:86:"Sajtkarta, modulen skapar ett index av alla sidor och en XML-sitemap för sökmotorer.";}', 0, 1, 0, 'content', 1, 1, 1, 1439567495),
(19, 'a:6:{s:2:"en";s:7:"Streams";s:2:"es";s:7:"Streams";s:2:"de";s:7:"Streams";s:2:"el";s:8:"Ροές";s:2:"lt";s:7:"Srautai";s:2:"fr";s:7:"Streams";}', 'streams', '2.3.3', NULL, 'a:6:{s:2:"en";s:36:"Manage, structure, and display data.";s:2:"es";s:41:"Administra, estructura, y presenta datos.";s:2:"de";s:49:"Verwalte, strukturiere und veröffentliche Daten.";s:2:"el";s:106:"Διαχείριση, δόμηση και προβολή πληροφοριών και δεδομένων.";s:2:"lt";N;s:2:"fr";s:43:"Gérer, structurer et afficher des données";}', 0, 0, 1, 'content', 1, 1, 1, 1439567495),
(20, 'a:25:{s:2:"en";s:5:"Users";s:2:"ar";s:20:"المستخدمون";s:2:"br";s:9:"Usuários";s:2:"pt";s:12:"Utilizadores";s:2:"cs";s:11:"Uživatelé";s:2:"da";s:7:"Brugere";s:2:"de";s:8:"Benutzer";s:2:"el";s:14:"Χρήστες";s:2:"es";s:8:"Usuarios";s:2:"fa";s:14:"کاربران";s:2:"fi";s:12:"Käyttäjät";s:2:"fr";s:12:"Utilisateurs";s:2:"he";s:14:"משתמשים";s:2:"id";s:8:"Pengguna";s:2:"it";s:6:"Utenti";s:2:"lt";s:10:"Vartotojai";s:2:"nl";s:10:"Gebruikers";s:2:"pl";s:12:"Użytkownicy";s:2:"ru";s:24:"Пользователи";s:2:"sl";s:10:"Uporabniki";s:2:"tw";s:6:"用戶";s:2:"cn";s:6:"用户";s:2:"hu";s:14:"Felhasználók";s:2:"th";s:27:"ผู้ใช้งาน";s:2:"se";s:10:"Användare";}', 'users', '1.1.0', NULL, 'a:25:{s:2:"en";s:81:"Let users register and log in to the site, and manage them via the control panel.";s:2:"ar";s:133:"تمكين المستخدمين من التسجيل والدخول إلى الموقع، وإدارتهم من لوحة التحكم.";s:2:"br";s:125:"Permite com que usuários se registrem e entrem no site e também que eles sejam gerenciáveis apartir do painel de controle.";s:2:"pt";s:125:"Permite com que os utilizadores se registem e entrem no site e também que eles sejam geriveis apartir do painel de controlo.";s:2:"cs";s:103:"Umožňuje uživatelům se registrovat a přihlašovat a zároveň jejich správu v Kontrolním panelu.";s:2:"da";s:89:"Lader brugere registrere sig og logge ind på sitet, og håndtér dem via kontrolpanelet.";s:2:"de";s:108:"Erlaube Benutzern das Registrieren und Einloggen auf der Seite und verwalte sie über die Admin-Oberfläche.";s:2:"el";s:208:"Παρέχει λειτουργίες εγγραφής και σύνδεσης στους επισκέπτες. Επίσης από εδώ γίνεται η διαχείριση των λογαριασμών.";s:2:"es";s:138:"Permite el registro de nuevos usuarios quienes podrán loguearse en el sitio. Estos podrán controlarse desde el panel de administración.";s:2:"fa";s:151:"به کاربر ها امکان ثبت نام و لاگین در سایت را بدهید و آنها را در پنل مدیریت نظارت کنید";s:2:"fi";s:126:"Antaa käyttäjien rekisteröityä ja kirjautua sisään sivustolle sekä mahdollistaa niiden muokkaamisen hallintapaneelista.";s:2:"fr";s:112:"Permet aux utilisateurs de s''enregistrer et de se connecter au site et de les gérer via le panneau de contrôle";s:2:"he";s:62:"ניהול משתמשים: רישום, הפעלה ומחיקה";s:2:"id";s:102:"Memungkinkan pengguna untuk mendaftar dan masuk ke dalam situs, dan mengaturnya melalui control panel.";s:2:"it";s:95:"Fai iscrivere de entrare nel sito gli utenti, e gestiscili attraverso il pannello di controllo.";s:2:"lt";s:106:"Leidžia vartotojams registruotis ir prisijungti prie puslapio, ir valdyti juos per administravimo panele.";s:2:"nl";s:88:"Laat gebruikers registreren en inloggen op de site, en beheer ze via het controlepaneel.";s:2:"pl";s:87:"Pozwól użytkownikom na logowanie się na stronie i zarządzaj nimi za pomocą panelu.";s:2:"ru";s:155:"Управление зарегистрированными пользователями, активирование новых пользователей.";s:2:"sl";s:96:"Dovoli uporabnikom za registracijo in prijavo na strani, urejanje le teh preko nadzorne plošče";s:2:"tw";s:87:"讓用戶可以註冊並登入網站，並且管理者可在控制台內進行管理。";s:2:"cn";s:87:"让用户可以注册并登入网站，并且管理者可在控制台内进行管理。";s:2:"th";s:210:"ให้ผู้ใช้ลงทะเบียนและเข้าสู่เว็บไซต์และจัดการกับพวกเขาผ่านทางแผงควบคุม";s:2:"hu";s:120:"Hogy a felhasználók tudjanak az oldalra regisztrálni és belépni, valamint lehessen őket kezelni a vezérlőpulton.";s:2:"se";s:111:"Låt dina besökare registrera sig och logga in på webbplatsen. Hantera sedan användarna via kontrollpanelen.";}', 0, 0, 1, '0', 1, 1, 1, 1439567495),
(21, 'a:25:{s:2:"en";s:9:"Variables";s:2:"ar";s:20:"المتغيّرات";s:2:"br";s:10:"Variáveis";s:2:"pt";s:10:"Variáveis";s:2:"cs";s:10:"Proměnné";s:2:"da";s:8:"Variable";s:2:"de";s:9:"Variablen";s:2:"el";s:20:"Μεταβλητές";s:2:"es";s:9:"Variables";s:2:"fa";s:16:"متغییرها";s:2:"fi";s:9:"Muuttujat";s:2:"fr";s:9:"Variables";s:2:"he";s:12:"משתנים";s:2:"id";s:8:"Variabel";s:2:"it";s:9:"Variabili";s:2:"lt";s:10:"Kintamieji";s:2:"nl";s:10:"Variabelen";s:2:"pl";s:7:"Zmienne";s:2:"ru";s:20:"Переменные";s:2:"sl";s:13:"Spremenljivke";s:2:"tw";s:12:"系統變數";s:2:"cn";s:12:"系统变数";s:2:"th";s:18:"ตัวแปร";s:2:"se";s:9:"Variabler";s:2:"hu";s:10:"Változók";}', 'variables', '1.0.0', NULL, 'a:25:{s:2:"en";s:59:"Manage global variables that can be accessed from anywhere.";s:2:"ar";s:97:"إدارة المُتغيّرات العامة لاستخدامها في أرجاء الموقع.";s:2:"br";s:61:"Gerencia as variáveis globais acessíveis de qualquer lugar.";s:2:"pt";s:58:"Gerir as variáveis globais acessíveis de qualquer lugar.";s:2:"cs";s:56:"Spravujte globální proměnné přístupné odkudkoliv.";s:2:"da";s:51:"Håndtér globale variable som kan tilgås overalt.";s:2:"de";s:74:"Verwaltet globale Variablen, auf die von überall zugegriffen werden kann.";s:2:"el";s:129:"Διαχείριση μεταβλητών που είναι προσβάσιμες από παντού στον ιστότοπο.";s:2:"es";s:50:"Manage global variables to access from everywhere.";s:2:"fa";s:136:"مدیریت متغییر های جامع که می توانند در هر جای سایت مورد استفاده قرار بگیرند";s:2:"fi";s:66:"Hallitse globaali muuttujia, joihin pääsee käsiksi mistä vain.";s:2:"fr";s:92:"Gérer des variables globales pour pouvoir y accéder depuis n''importe quel endroit du site.";s:2:"he";s:96:"ניהול משתנים גלובליים אשר ניתנים להמרה בכל חלקי האתר";s:2:"id";s:59:"Mengatur variabel global yang dapat diakses dari mana saja.";s:2:"it";s:58:"Gestisci le variabili globali per accedervi da ogni parte.";s:2:"lt";s:64:"Globalių kintamujų tvarkymas kurie yra pasiekiami iš bet kur.";s:2:"nl";s:54:"Beheer globale variabelen die overal beschikbaar zijn.";s:2:"pl";s:86:"Zarządzaj globalnymi zmiennymi do których masz dostęp z każdego miejsca aplikacji.";s:2:"ru";s:136:"Управление глобальными переменными, которые доступны в любом месте сайта.";s:2:"sl";s:53:"Urejanje globalnih spremenljivk za dostop od kjerkoli";s:2:"th";s:148:"จัดการตัวแปรทั่วไปโดยที่สามารถเข้าถึงได้จากทุกที่.";s:2:"tw";s:45:"管理此網站內可存取的全局變數。";s:2:"cn";s:45:"管理此网站内可存取的全局变数。";s:2:"hu";s:62:"Globális változók kezelése a hozzáféréshez, bárhonnan.";s:2:"se";s:66:"Hantera globala variabler som kan avändas över hela webbplatsen.";}', 0, 0, 1, 'data', 1, 1, 1, 1439567495);
INSERT INTO `default_modules` (`id`, `name`, `slug`, `version`, `type`, `description`, `skip_xss`, `is_frontend`, `is_backend`, `menu`, `enabled`, `installed`, `is_core`, `updated_on`) VALUES
(22, 'a:23:{s:2:"en";s:7:"Widgets";s:2:"br";s:7:"Widgets";s:2:"pt";s:7:"Widgets";s:2:"cs";s:7:"Widgety";s:2:"da";s:7:"Widgets";s:2:"de";s:7:"Widgets";s:2:"el";s:7:"Widgets";s:2:"es";s:7:"Widgets";s:2:"fa";s:13:"ویجت ها";s:2:"fi";s:9:"Vimpaimet";s:2:"fr";s:7:"Widgets";s:2:"id";s:6:"Widget";s:2:"it";s:7:"Widgets";s:2:"lt";s:11:"Papildiniai";s:2:"nl";s:7:"Widgets";s:2:"ru";s:14:"Виджеты";s:2:"sl";s:9:"Vtičniki";s:2:"tw";s:9:"小組件";s:2:"cn";s:9:"小组件";s:2:"hu";s:9:"Widget-ek";s:2:"th";s:21:"วิดเจ็ต";s:2:"se";s:8:"Widgetar";s:2:"ar";s:14:"الودجتس";}', 'widgets', '1.2.0', NULL, 'a:23:{s:2:"en";s:69:"Manage small sections of self-contained logic in blocks or "Widgets".";s:2:"ar";s:132:"إدارة أقسام صغيرة من البرمجيات في مساحات الموقع أو ما يُسمّى بالـ"ودجتس".";s:2:"br";s:77:"Gerenciar pequenas seções de conteúdos em bloco conhecidos como "Widgets".";s:2:"pt";s:74:"Gerir pequenas secções de conteúdos em bloco conhecidos como "Widgets".";s:2:"cs";s:56:"Spravujte malé funkční části webu neboli "Widgety".";s:2:"da";s:74:"Håndter små sektioner af selv-opretholdt logik i blokke eller "Widgets".";s:2:"de";s:62:"Verwaltet kleine, eigentständige Bereiche, genannt "Widgets".";s:2:"el";s:149:"Διαχείριση μικρών τμημάτων αυτόνομης προγραμματιστικής λογικής σε πεδία ή "Widgets".";s:2:"es";s:75:"Manejar pequeñas secciones de lógica autocontenida en bloques o "Widgets"";s:2:"fa";s:76:"مدیریت قسمت های کوچکی از سایت به طور مستقل";s:2:"fi";s:81:"Hallitse pieniä osioita, jotka sisältävät erillisiä lohkoja tai "Vimpaimia".";s:2:"fr";s:41:"Gérer des mini application ou "Widgets".";s:2:"id";s:101:"Mengatur bagian-bagian kecil dari blok-blok yang memuat sesuatu atau dikenal dengan istilah "Widget".";s:2:"it";s:70:"Gestisci piccole sezioni di logica a se stante in blocchi o "Widgets".";s:2:"lt";s:43:"Nedidelių, savarankiškų blokų valdymas.";s:2:"nl";s:75:"Beheer kleine onderdelen die zelfstandige logica bevatten, ofwel "Widgets".";s:2:"ru";s:91:"Управление небольшими, самостоятельными блоками.";s:2:"sl";s:61:"Urejanje manjših delov blokov strani ti. Vtičniki (Widgets)";s:2:"tw";s:103:"可將小段的程式碼透過小組件來管理。即所謂 "Widgets"，或稱為小工具、部件。";s:2:"cn";s:103:"可将小段的程式码透过小组件来管理。即所谓 "Widgets"，或称为小工具、部件。";s:2:"hu";s:56:"Önálló kis logikai tömbök vagy widget-ek kezelése.";s:2:"th";s:152:"จัดการส่วนเล็ก ๆ ในรูปแบบของตัวเองในบล็อกหรือวิดเจ็ต";s:2:"se";s:83:"Hantera små sektioner med egen logik och innehåll på olika delar av webbplatsen.";}', 1, 0, 1, 'content', 1, 1, 1, 1439567495),
(23, 'a:9:{s:2:"en";s:7:"WYSIWYG";s:2:"fa";s:7:"WYSIWYG";s:2:"fr";s:7:"WYSIWYG";s:2:"pt";s:7:"WYSIWYG";s:2:"se";s:15:"HTML-redigerare";s:2:"tw";s:7:"WYSIWYG";s:2:"cn";s:7:"WYSIWYG";s:2:"ar";s:27:"المحرر الرسومي";s:2:"it";s:7:"WYSIWYG";}', 'wysiwyg', '1.0.0', NULL, 'a:10:{s:2:"en";s:60:"Provides the WYSIWYG editor for PyroCMS powered by CKEditor.";s:2:"fa";s:73:"ویرایشگر WYSIWYG که توسطCKEditor ارائه شده است. ";s:2:"fr";s:63:"Fournit un éditeur WYSIWYG pour PyroCMS propulsé par CKEditor";s:2:"pt";s:61:"Fornece o editor WYSIWYG para o PyroCMS, powered by CKEditor.";s:2:"el";s:113:"Παρέχει τον επεξεργαστή WYSIWYG για το PyroCMS, χρησιμοποιεί το CKEDitor.";s:2:"se";s:37:"Redigeringsmodul för HTML, CKEditor.";s:2:"tw";s:83:"提供 PyroCMS 所見即所得（WYSIWYG）編輯器，由 CKEditor 技術提供。";s:2:"cn";s:83:"提供 PyroCMS 所见即所得（WYSIWYG）编辑器，由 CKEditor 技术提供。";s:2:"ar";s:76:"توفر المُحرّر الرسومي لـPyroCMS من خلال CKEditor.";s:2:"it";s:57:"Fornisce l''editor WYSIWYG per PtroCMS creato con CKEditor";}', 0, 0, 0, '0', 1, 1, 1, 1439567495),
(24, 'a:4:{s:2:"en";s:14:"API Management";s:2:"el";s:24:"Διαχείριση API";s:2:"fr";s:18:"Gestionnaire d''API";s:2:"hu";s:12:"API Kezelés";}', 'api', '1.0.0', NULL, 'a:4:{s:2:"en";s:66:"Set up a RESTful API with API Keys and out in JSON, XML, CSV, etc.";s:2:"el";s:129:"Ρυθμίσεις για ένα RESTful API με κλειδιά API και αποτελέσματα σε JSON, XML, CSV, κτλ.";s:2:"fr";s:79:"Paramétrage d''une API RESTgul avec clés API et export en JSON, XML, CSV, etc.";s:2:"hu";s:159:"Körültekintően állítsd be az API-t (alkalmazásprogramozási felület) az API Kulcsokkal együtt és küldd JSON-ba, XML-be, CSV-be, vagy bármi egyébbe.";}', 0, 1, 1, 'utilities', 0, 0, 0, 1439567495),
(31, 'a:2:{s:2:"es";s:6:"Inicio";s:2:"en";s:4:"Home";}', 'home', '1.1', NULL, 'a:2:{s:2:"es";s:13:"Modulo Inicio";s:2:"en";s:11:"Home module";}', 0, 1, 1, 'content', 1, 1, 0, 1439567496),
(26, 'a:2:{s:2:"es";s:14:"Sobre Nosotros";s:2:"en";s:8:"About Us";}', 'about_us', '1.1', NULL, 'a:2:{s:2:"es";s:30:"Sobre Nosotros © Brayan Acebo";s:2:"en";s:24:"About Us © Brayan Acebo";}', 0, 1, 1, 'content', 1, 1, 0, 1439567495),
(30, 'a:2:{s:2:"es";s:14:"Nuestro Equipo";s:2:"en";s:8:"Our Team";}', 'our_team', '1.1', NULL, 'a:2:{s:2:"es";s:30:"Nuestro Equipo © Brayan Acebo";s:2:"en";s:24:"Our Team © Brayan Acebo";}', 0, 1, 1, 'content', 0, 0, 0, 1394138583),
(95, 'a:2:{s:2:"es";s:28:"Herramientas de Maquetación";s:2:"en";s:5:"Tools";}', 'tools', '1.0', NULL, 'a:2:{s:2:"es";s:48:"Herramientas de Maquetación © Adrian Rodriguez";s:2:"en";s:32:"Layout Tools © Adrian Rodriguez";}', 0, 0, 1, 'content', 0, 0, 0, 1439567496),
(91, 'a:2:{s:2:"en";s:12:"Upload Files";s:2:"es";s:15:"Cargar Archivos";}', 'multi_upload_files', '1.2', NULL, 'a:2:{s:2:"en";s:42:"Upload Files © Luis Fernando Salazar 2014";s:2:"es";s:38:"Archivos © Luis Fernando Salazar 2014";}', 0, 1, 1, 'content', 0, 0, 0, 1439567496),
(34, 'a:2:{s:2:"en";s:18:"News with comments";s:2:"es";s:9:"Novedades";}', 'news', '1.1', NULL, 'a:2:{s:2:"en";s:54:"This is a module of news © Brayan Acebo, Luis Salazar";s:2:"es";s:48:"Modulo de Noticias © Brayan Acebo, Luis Salazar";}', 0, 1, 1, 'content', 1, 1, 0, 1439567496),
(35, 'a:2:{s:2:"es";s:14:"Widget Twitter";s:2:"en";s:0:"";}', 'widget_twitter', '1.0', NULL, 'a:2:{s:2:"es";s:48:"Añade cualquier cronología pública de Twitter";s:2:"en";s:0:"";}', 0, 1, 1, 'content', 0, 0, 0, 1394800827),
(40, 'a:2:{s:2:"en";s:8:"Articles";s:2:"es";s:9:"Articulos";}', 'articles', '1.2', NULL, 'a:2:{s:2:"en";s:33:"This is a module to CRUD articles";s:2:"es";s:16:"Modulo articulos";}', 0, 1, 1, 'content', 0, 0, 0, 1395073620),
(41, 'a:2:{s:2:"es";s:7:"Autores";s:2:"en";s:7:"Authors";}', 'authors', '1.0', NULL, 'a:2:{s:2:"es";s:17:"Modulo de autores";s:2:"en";s:14:"Authors module";}', 0, 1, 1, 'content', 0, 0, 0, 1395073623),
(42, 'a:2:{s:2:"es";s:10:"Categorias";s:2:"en";s:10:"Categories";}', 'categories', '1.0', NULL, 'a:2:{s:2:"es";s:36:"Modulo de categorias y subcategorias";s:2:"en";s:35:"Categories and subcategories module";}', 0, 0, 1, 'content', 0, 0, 0, 1395070027),
(43, 'a:2:{s:2:"es";s:4:"Tags";s:2:"en";s:4:"Tags";}', 'tags', '1.0', NULL, 'a:2:{s:2:"es";s:50:"Tags libres listo para relacionar a varios modulos";s:2:"en";s:50:"Tags libres listo para relacionar a varios modulos";}', 0, 0, 1, 'content', 0, 0, 0, 1439567496),
(45, 'a:2:{s:2:"en";s:7:"Galeria";s:2:"es";s:7:"Galeria";}', 'galeria', '1.0', NULL, 'a:2:{s:2:"en";s:51:"Module galeria title and text © Jeyson Garcia 2013";s:2:"es";s:54:"Modulo de galeria titulo y texto © Jeyson Garcia 2013";}', 0, 1, 1, 'content', 1, 1, 0, 1395074494),
(85, 'a:2:{s:2:"en";s:8:"Products";s:2:"es";s:9:"Productos";}', 'products', '1.2', NULL, 'a:2:{s:2:"en";s:52:"Products © Brayan Acebo, luis fernando salazar 2014";s:2:"es";s:53:"Productos © Brayan Acebo, luis fernando salazar 2014";}', 0, 1, 1, 'content', 1, 1, 0, 1439567496),
(109, 'a:2:{s:2:"es";s:7:"Galeria";s:2:"en";s:7:"Gallery";}', 'gallery', '1.1', NULL, 'a:2:{s:2:"es";s:37:"Modulo Galeria Simple © Brayan Acebo";s:2:"en";s:37:"Module Simple Gallery © Brayan Acebo";}', 0, 1, 1, 'content', 0, 0, 0, 1439560307),
(75, 'a:2:{s:2:"en";s:8:"services";s:2:"es";s:9:"Servicios";}', 'services', '1.2', NULL, 'a:2:{s:2:"en";s:52:"services © Brayan Acebo, luis fernando salazar 2014";s:2:"es";s:53:"servicios © Brayan Acebo, luis fernando salazar 2014";}', 0, 1, 1, 'content', 1, 1, 0, 1439567496),
(55, 'a:2:{s:2:"es";s:21:"Otras configuraciones";s:2:"en";s:20:"Other configurations";}', 'others_conf', '1.2', NULL, 'a:2:{s:2:"es";s:58:"Otras configuraciones como el logo. @Luis Fernando Salazar";s:2:"en";s:52:"Other configuration like logo @Luis Fernando Salazar";}', 0, 1, 1, 'content', 1, 1, 0, 1439567496),
(83, 'a:2:{s:2:"en";s:3:"FAQ";s:2:"es";s:20:"Preguntas Frecuentes";}', 'faqs', '1.2', NULL, 'a:2:{s:2:"en";s:47:"FAQ © Brayan Acebo, luis fernando salazar 2014";s:2:"es";s:64:"Preguntas Frecuentes © Brayan Acebo, luis fernando salazar 2014";}', 0, 1, 1, 'content', 0, 0, 0, 1439567495),
(101, 'a:2:{s:2:"es";s:20:"Trabaja con nosotros";s:2:"en";s:12:"Work with us";}', 'work_with_us', '1.0', NULL, 'a:2:{s:2:"es";s:71:"Modulo de envio de hojas de vida © Brayan Acebo, Luis Fernando Salazar";s:2:"en";s:52:"Work with us ©  Brayan Acebo, Luis fernando Salazar";}', 0, 1, 1, 'content', 0, 0, 0, 1439567496),
(62, 'a:2:{s:2:"en";s:6:"albums";s:2:"es";s:7:"albunes";}', 'albums', '1.2', NULL, 'a:2:{s:2:"en";s:50:"albums © Brayan Acebo, luis fernando salazar 2014";s:2:"es";s:51:"albunes © Brayan Acebo, luis fernando salazar 2014";}', 0, 1, 1, 'content', 0, 0, 0, 1408996715),
(67, 'a:2:{s:2:"en";s:4:"Chat";s:2:"es";s:12:"Chat Interno";}', 'chat', '1.0', NULL, 'a:2:{s:2:"en";s:30:"This is a PyroCMS module chat.";s:2:"es";s:32:"Administrador de chat principal.";}', 0, 1, 1, 'content', 1, 1, 0, 1439567495),
(73, 'a:2:{s:2:"en";s:11:"Google Maps";s:2:"es";s:15:"Mapas de Google";}', 'google_maps', '1.2', NULL, 'a:1:{s:2:"en";s:45:"Mapas de Google © Luis Fernando Salazar 2014";}', 0, 0, 1, 'content', 0, 0, 0, 1426510031),
(99, 'a:2:{s:2:"en";s:18:"about us multiples";s:2:"es";s:8:"Nosotros";}', 'about_us_multiples', '1.2', NULL, 'a:2:{s:2:"en";s:58:"This is a module of About Us © Brayan Acebo, Luis Salazar";s:2:"es";s:54:"Modulo de Sobre Nosotros © Brayan Acebo, Luis Salazar";}', 0, 1, 1, 'content', 1, 1, 0, 1439567495),
(97, 'a:2:{s:2:"en";s:12:"Advance News";s:2:"es";s:18:"Noticias Avanzadas";}', 'advance_news', '1.2', NULL, 'a:2:{s:2:"en";s:62:"This is a module of advance_news © Brayan Acebo, Luis Salazar";s:2:"es";s:48:"Modulo de Noticias © Brayan Acebo, Luis Salazar";}', 0, 1, 1, 'content', 0, 0, 0, 1439567495),
(78, 'a:2:{s:2:"es";s:17:"Datos de Contacto";s:2:"en";s:11:"Contactenos";}', 'contact_us', '1.3', NULL, 'a:2:{s:2:"es";s:111:"Modulo información de contacto, con control de mapas © Brayan Acebo, Luis Fernando Salazar, Christian España";s:2:"en";s:75:"Manage Info Data © Christian España , Brayan Acebo, Luis fernando Salazar";}', 0, 1, 1, 'content', 1, 1, 0, 1439567495),
(79, 'a:2:{s:2:"en";s:9:"Solutions";s:2:"es";s:9:"Proyectos";}', 'projects', '1.2', NULL, 'a:2:{s:2:"en";s:52:"projects © Brayan Acebo, luis fernando salazar 2014";s:2:"es";s:53:"Proyectos © Brayan Acebo, luis fernando salazar 2014";}', 0, 1, 1, 'content', 1, 1, 0, 1439567496),
(80, 'a:2:{s:2:"es";s:11:"Preguntanos";s:2:"en";s:3:"Ask";}', 'ask', '1.3', NULL, 'a:2:{s:2:"es";s:19:"Pregunta al experto";s:2:"en";s:3:"Ask";}', 0, 1, 1, 'content', 1, 1, 0, 1439567495),
(106, 'a:2:{s:2:"en";s:7:"Process";s:2:"es";s:8:"Procesos";}', 'process', '1.2', NULL, 'a:2:{s:2:"en";s:51:"process © Brayan Acebo, luis fernando salazar 2014";s:2:"es";s:53:"Servicios © Brayan Acebo, luis fernando salazar 2014";}', 0, 1, 1, 'content', 1, 1, 0, 1439567496),
(107, 'a:2:{s:2:"en";s:7:"Gallery";s:2:"es";s:19:"Galeria de imagenes";}', 'gallerys', '1.2', NULL, 'a:2:{s:2:"en";s:14:"Images gallery";s:2:"es";s:19:"Galeria de Imagenes";}', 0, 1, 1, 'content', 1, 1, 0, 1439560296);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_multi_upload_files`
--

CREATE TABLE `default_multi_upload_files` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `extencion` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_multi_upload_files`
--

INSERT INTO `default_multi_upload_files` (`id`, `category`, `image`, `extencion`, `lang`) VALUES
(39, 1, 'uploads/default/multi_upload_files/1/lolsito.pdf', '.pdf', 'es'),
(40, 1, 'uploads/default/multi_upload_files/1/03ee696ebd0a5ed202346cacd058ce3f.pdf', '.pdf', 'es'),
(41, 1, 'uploads/default/multi_upload_files/1/917d4edcd69bdd00a63ae8b400fc19d9.jpg', '.jpg', 'es'),
(42, 2, 'uploads/default/multi_upload_files/2/12d5abac75e13d8668417f27f10b7060.pdf', '.pdf', 'es'),
(43, 2, 'uploads/default/multi_upload_files/2/ad9f90b5b36f7f12ace21030833e5528.pdf', '.pdf', 'es'),
(44, 2, 'uploads/default/multi_upload_files/2/69c39842c97c0377c85df2a1ebc88832.pdf', '.pdf', 'es'),
(45, 2, 'uploads/default/multi_upload_files/2/9d47efd05b8c029e6da14c6d91d081dc.pdf', '.pdf', 'es'),
(46, 2, 'uploads/default/multi_upload_files/2/e7277c0b0a284344d6fb33fdca040637.pdf', '.pdf', 'es'),
(47, 1, 'uploads/default/multi_upload_files/1/27cef7798fa1eb1f57e5693763590be7.jpg', '.jpg', 'es'),
(48, 1, 'uploads/default/multi_upload_files/1/622b20ea7c7f2c7605b9bbd915024955.jpg', '.jpg', 'es'),
(49, 3, 'uploads/default/multi_upload_files/3/0e3160dc6e3a21e862df6d140fe5d84e.jpg', '.jpg', 'es'),
(50, 3, 'uploads/default/multi_upload_files/3/79f6d9d8ae38cea7c4afefabf7578782.png', '.png', 'es'),
(51, 3, 'uploads/default/multi_upload_files/3/5a8f5d82c8c18fb66867c8a68b868397.jpg', '.jpg', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_navigation_groups`
--

CREATE TABLE `default_navigation_groups` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `abbrev` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_navigation_groups`
--

INSERT INTO `default_navigation_groups` (`id`, `title`, `abbrev`) VALUES
(1, 'Header', 'header'),
(2, 'Sidebar', 'sidebar'),
(3, 'Footer', 'footer'),
(4, 'Header-en', 'headeren'),
(5, 'footer-en', 'footeren');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_navigation_links`
--

CREATE TABLE `default_navigation_links` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` int(11) DEFAULT NULL,
  `link_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'uri',
  `page_id` int(11) DEFAULT NULL,
  `module_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `navigation_group_id` int(5) NOT NULL DEFAULT '0',
  `position` int(5) NOT NULL DEFAULT '0',
  `target` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_navigation_links`
--

INSERT INTO `default_navigation_links` (`id`, `title`, `parent`, `link_type`, `page_id`, `module_name`, `url`, `uri`, `navigation_group_id`, `position`, `target`, `restricted_to`, `class`) VALUES
(3, 'Contacto', 0, 'uri', 0, '', '', 'contactenos', 1, 5, '', '0', ''),
(5, 'Sobre Nosotros', 0, 'module', 0, 'about_us', '', '', 3, 1, '', '0', ''),
(6, 'Blog', 0, 'module', 0, 'blog', '', '', 3, 5, '', '0', ''),
(8, 'Home', 0, 'module', 0, 'home', '', '', 3, 0, '', '0', ''),
(9, 'Contacto', 0, 'module', 0, 'contact_us', '', '', 3, 9, '', '0', ''),
(10, 'Noticias', 0, 'uri', 0, '', '', 'noticias', 1, 1, '', '0', ''),
(11, 'Noticias', 0, 'module', 0, 'news', '', '', 3, 2, '', '0', ''),
(12, 'Galeria', 0, 'module', 0, 'gallery', '', '', 3, 4, '', '0', ''),
(13, 'Galeria', 0, 'uri', 0, '', '', 'galeria', 1, 4, '', '0', ''),
(15, 'Productos', 0, 'module', 0, 'products', '', '', 3, 3, '', '0', ''),
(16, 'Servicios', 0, 'uri', 0, '', '', 'servicios', 1, 2, '', '0', ''),
(18, 'Trabaje con Nosotros', 0, 'module', 0, 'work_with_us', '', '', 3, 8, '', '0', ''),
(19, 'Servicios', 0, 'module', 0, 'services', '', '', 3, 6, '', '0', ''),
(20, 'Archivos', 0, 'module', 0, 'multi_upload_files', '', '', 3, 7, '', '0', ''),
(21, 'Sobre Nosotros', 0, 'uri', 0, '', '', 'sobre-nosotros', 1, 0, '', '0', ''),
(22, 'About Us', NULL, 'uri', 0, '', '', 'about-us', 4, 1, '', '0', ''),
(23, 'News', NULL, 'module', 0, 'news', '', '', 4, 2, '', '0', ''),
(24, 'Noticias Avanzadas', 0, 'module', 0, 'advance_news', '', '', 3, 2, '', '0', ''),
(26, 'Productos', 0, 'uri', 0, '', '', 'productos', 1, 3, '', '0', ''),
(27, 'Products', NULL, 'uri', 0, '', '', 'products', 4, 3, '', '0', ''),
(28, 'FAQ', NULL, 'uri', 0, '', '', 'FAQ', 4, 4, '', '0', ''),
(29, 'Services', NULL, 'module', 0, 'services', '', '', 4, 5, '', '0', ''),
(30, 'Contact us', NULL, 'module', 0, 'contact_us', '', '', 4, 6, '', '0', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_news`
--

CREATE TABLE `default_news` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `slug` varchar(455) COLLATE utf8_unicode_ci NOT NULL,
  `autor` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `video` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `introduction` text COLLATE utf8_unicode_ci,
  `date` datetime NOT NULL,
  `position` int(11) NOT NULL,
  `outstanding` int(1) DEFAULT '0',
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_news`
--

INSERT INTO `default_news` (`id`, `title`, `slug`, `autor`, `image`, `video`, `content`, `introduction`, `date`, `position`, `outstanding`, `lang`) VALUES
(1, 'El pasaje estándar Lorem Ipsum', 'el-pasaje-estandar-lorem-ipsum', 'Lorem Ipsum', 'uploads/default/news/3eca91e4b018d4d9c0d319122e2e8a2e.jpg', 'uploads/default/news/b7388b4437697a51b1ee2cbb14c0cefd.mp4', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. <strong>Ut enim ad minim veniam</strong>, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot; Secci&oacute;n 1.10.32 de &quot;de Finibus Bonorum et Malorum&quot;, escrito por Cicero en el 45 antes de Cristo &quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione <strong>voluptatem sequi nesciunt</strong>. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot; Traducci&oacute;n hecha por H. Rackham en 1914 &quot;<strong>But I must explain</strong> to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally <strong>encounter</strong> consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great <strong>pleasure</strong>. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that <strong>produces</strong> no resultant pleasure?&quot; Secci&oacute;n 1.10.33 de &quot;de Finibus Bonorum et Malorum&quot;, escrito por Cicero en el 45 antes de Cristo &quot;At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolo', 'Nulla quis lorem ut libero malesuada feugiat. Proin eget tortor risus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Sed porttitor lectus nibh. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Lorem ipsum dolor sit amet,', '2014-03-11 00:00:00', 1, 1, 'es'),
(4, 'News', 'news', 'Lorem Ipsum', 'uploads/default/news/bab2cae7598f0f10377bf35122848189.JPG', NULL, '<br />\r\nSecci&oacute;n 1.10.32 de &quot;de Finibus Bonorum et Malorum&quot;, escrito por Cicero en el 45 antes de Cristo<br />\r\n<br />\r\n&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro isquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;', 'Sección 1.10.32 de "de Finibus Bonorum et Malorum", escrito por Cicero en el 45 antes de Cristo\r\n\r\n"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.', '2015-03-25 21:49:11', 1, 0, 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_news_comments`
--

CREATE TABLE `default_news_comments` (
  `id` int(10) NOT NULL,
  `id_new` int(10) DEFAULT '0',
  `email` varchar(100) DEFAULT '',
  `name` varchar(100) DEFAULT '',
  `comment` text
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `default_news_comments`
--

INSERT INTO `default_news_comments` (`id`, `id_new`, `email`, `name`, `comment`) VALUES
(6, 1, 'luis.salazar@imagina.co', 'Luis Fernando Salazar Buitrago', 'Comentario de prueba'),
(7, 1, 'will22@gmail.com', 'dsds', 'dsadasdas'),
(8, 1, 'william.daza.66@gmail.com', 'William Daza', 'Prueba de comentario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_new_info`
--

CREATE TABLE `default_new_info` (
  `id` int(11) NOT NULL,
  `intro` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `footer` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_new_info`
--

INSERT INTO `default_new_info` (`id`, `intro`, `footer`, `lang`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit eius nisi expedita voluptatibus suscipit laborum labore delectus accusantium, maiores, tempora sapiente deserunt, illum, soluta quo iste libero veritatis dignissimos consequatur.', 'Somos <strong>gente9</strong> con mente abierta, innovadores y con pensamiento social', 'es'),
(2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit eius nisi expedita voluptatibus suscipit laborum labore delectus accusantium, maiores, tempora sapiente deserunt, illum, soluta quo iste libero veritatis dignissimos consequatur.', 'Somos <strong>gente9</strong> con mente abierta, innovadores y con pensamiento social', 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_others_conf`
--

CREATE TABLE `default_others_conf` (
  `id` int(11) NOT NULL,
  `logo` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_others_conf`
--

INSERT INTO `default_others_conf` (`id`, `logo`, `city`) VALUES
(1, 'uploads/default/others_conf/0d72cec5257deee039f84cdc894bc628.jpg', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_pages`
--

CREATE TABLE `default_pages` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `class` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` text COLLATE utf8_unicode_ci,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `type_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_robots_no_index` tinyint(1) DEFAULT NULL,
  `meta_robots_no_follow` tinyint(1) DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `rss_enabled` int(1) NOT NULL DEFAULT '0',
  `comments_enabled` int(1) NOT NULL DEFAULT '0',
  `status` enum('draft','live') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0',
  `restricted_to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_home` int(1) NOT NULL DEFAULT '0',
  `strict_uri` tinyint(1) NOT NULL DEFAULT '1',
  `order` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_pages`
--

INSERT INTO `default_pages` (`id`, `slug`, `class`, `title`, `uri`, `parent_id`, `type_id`, `entry_id`, `css`, `js`, `meta_title`, `meta_keywords`, `meta_robots_no_index`, `meta_robots_no_follow`, `meta_description`, `rss_enabled`, `comments_enabled`, `status`, `created_on`, `updated_on`, `restricted_to`, `is_home`, `strict_uri`, `order`) VALUES
(1, 'home', '', 'Home', 'home', 0, '1', '1', NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 0, 'live', 1394062781, 0, '', 1, 1, 0),
(2, 'contact', '', 'Contact', 'contact', 0, '1', '2', '', '', '', '', 0, 0, '', 0, 0, 'live', 1394062781, 1394111955, '0', 0, 1, 1),
(3, 'search', '', 'Search', 'search', 0, '1', '3', NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 0, 'live', 1394062781, 0, '', 0, 1, 3),
(4, 'results', '', 'Results', 'search/results', 3, '1', '4', NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 0, 'live', 1394062781, 0, '', 0, 0, 0),
(5, '404', '', 'Page missing', '404', 0, '1', '5', NULL, NULL, NULL, '', NULL, NULL, NULL, 0, 0, 'live', 1394062781, 0, '', 0, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_page_types`
--

CREATE TABLE `default_page_types` (
  `id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `stream_id` int(11) NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `css` text COLLATE utf8_unicode_ci,
  `js` text COLLATE utf8_unicode_ci,
  `theme_layout` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `updated_on` int(11) NOT NULL,
  `save_as_files` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'n',
  `content_label` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_label` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_page_types`
--

INSERT INTO `default_page_types` (`id`, `slug`, `title`, `description`, `stream_id`, `meta_title`, `meta_keywords`, `meta_description`, `body`, `css`, `js`, `theme_layout`, `updated_on`, `save_as_files`, `content_label`, `title_label`) VALUES
(1, 'default', 'Default', 'A simple page type with a WYSIWYG editor that will get you started adding content.', 2, NULL, NULL, NULL, '<h2>{{ page:title }}</h2>\n\n{{ body }}', '', '', 'default', 1394062781, 'n', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_people`
--

CREATE TABLE `default_people` (
  `id` int(11) NOT NULL,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_people`
--

INSERT INTO `default_people` (`id`, `image`, `title`, `text`, `lang`) VALUES
(2, NULL, 'Cumque quaerat', '<ul>\r\n                                <li>lorem ipsum</li>\r\n                                <li>lorem ipsum</li>\r\n                                <li>lorem ipsum</li>\r\n                            </ul>', 'en'),
(9, 'uploads/default/people/6918cbd4d8833f1d54ae8400f34391aa.png', 'SAE Institute Colombia', '', 'es'),
(10, 'uploads/default/people/56a7927d00786eebc40682059e32504f.gif', 'Lorem ipsum', '', 'es'),
(11, 'uploads/default/people/e79e9bfbe7f263095e94c02e31382f6b.gif', 'Lorem ipsum', '', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_permissions`
--

CREATE TABLE `default_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roles` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_permissions`
--

INSERT INTO `default_permissions` (`id`, `group_id`, `module`, `roles`) VALUES
(12, 2, 'contact_us', NULL),
(13, 2, 'gallerys', NULL),
(14, 2, 'home', NULL),
(15, 2, 'about_us_multiples', NULL),
(16, 2, 'projects', NULL),
(17, 2, 'services', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_process`
--

CREATE TABLE `default_process` (
  `id` int(11) NOT NULL,
  `name` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reference` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introduction` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `outstanding` int(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_process_categories`
--

CREATE TABLE `default_process_categories` (
  `proces_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_process_doc`
--

CREATE TABLE `default_process_doc` (
  `id` int(11) NOT NULL,
  `file` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_user_process` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_process_doc`
--

INSERT INTO `default_process_doc` (`id`, `file`, `name`, `id_user_process`) VALUES
(1, 'uploads/default/user_process/8ae0b9d1f15a042e94eb96156ab74122.pdf', 'Documento 12', 2),
(3, 'uploads/default/user_process/9a60039e0c61bc290185e6aad19d67ab.pdf', 'documento proceso 1', 3),
(4, 'uploads/default/user_process/024dba9c0e9dfb48a7e0ac89a8abf842.pdf', 'doc proceso 1', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_process_intro`
--

CREATE TABLE `default_process_intro` (
  `id` int(11) NOT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_process_intro`
--

INSERT INTO `default_process_intro` (`id`, `text`, `lang`) VALUES
(1, '', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_process_state`
--

CREATE TABLE `default_process_state` (
  `id` int(11) NOT NULL,
  `name` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_process_state`
--

INSERT INTO `default_process_state` (`id`, `name`) VALUES
(1, 'Actuación 1'),
(2, 'Actuación 2'),
(3, 'Actuación 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_proces_categories`
--

CREATE TABLE `default_proces_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `parent` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_proces_images`
--

CREATE TABLE `default_proces_images` (
  `id` int(11) NOT NULL,
  `proces_id` int(11) NOT NULL,
  `path` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_products`
--

CREATE TABLE `default_products` (
  `id` int(11) NOT NULL,
  `name` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introduction` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `outstanding` int(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_products`
--

INSERT INTO `default_products` (`id`, `name`, `video`, `slug`, `introduction`, `description`, `image`, `price`, `position`, `outstanding`, `created_at`, `updated_at`, `lang`) VALUES
(26, 'Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus', 'uploads/default/products/c41f5ae6ea3b33114bab50c51cc0d068.mp4', 'vivamus-magna-justo-lacinia-eget-consectetur-sed-convallis-at-tellus', 'Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Pellentesque in ipsum id orci porta dapibus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Cras ultricies ligula sed magna dictum porta. Nulla porttitor accumsan tincidunt. Vivamus suscipit tortor eget felis porttitor volutpat. Pellentesque in ipsum id orci porta dapibus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla porttitor accumsan tincidunt.', 'Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Pellentesque in ipsum id orci porta dapibus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Cras ultricies ligula sed magna dictum porta. Nulla porttitor accumsan tincidunt. Vivamus suscipit tortor eget felis porttitor volutpat. Pellentesque in ipsum id orci porta dapibus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla porttitor accumsan tincidunt.&nbsp;Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Pellentesque in ipsum id orci porta dapibus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Cras ultricies ligula sed magna dictum porta. Nulla porttitor accumsan tincidunt. Vivamus suscipit tortor eget felis porttitor volutpat. Pellentesque in ipsum id orci porta dapibus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Nulla porttitor accumsan tincidunt.', 'uploads/default/products/f9999ef01aea2c2b44d68f2d0a46651f.jpg', NULL, NULL, 0, '2015-05-12 19:25:52', '2015-05-21 14:38:34', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_products_categories`
--

CREATE TABLE `default_products_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_products_categories`
--

INSERT INTO `default_products_categories` (`product_id`, `category_id`) VALUES
(26, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_products_intro`
--

CREATE TABLE `default_products_intro` (
  `id` int(11) NOT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `footer` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_products_intro`
--

INSERT INTO `default_products_intro` (`id`, `text`, `footer`, `lang`) VALUES
(1, '', NULL, 'es'),
(2, '', NULL, 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_product_categories`
--

CREATE TABLE `default_product_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `parent` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_product_categories`
--

INSERT INTO `default_product_categories` (`id`, `title`, `position`, `parent`, `slug`, `created_at`, `updated_at`, `lang`) VALUES
(1, 'Inversión extranjera', 3, 0, 'inversion-extranjera', '2014-03-18 17:20:12', '2015-05-13 04:46:58', 'es'),
(3, 'Comercio Internacional', 1, 0, 'comercio-internacional', '2014-03-20 15:05:28', '2015-05-13 04:45:55', 'es'),
(7, 'Consultoría para negocios', 2, 0, 'consultoria-para-negocios', '2014-03-21 13:31:37', '2015-05-13 04:46:20', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_product_images`
--

CREATE TABLE `default_product_images` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `path` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_profiles`
--

CREATE TABLE `default_profiles` (
  `id` int(9) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `bio` text COLLATE utf8_unicode_ci,
  `dob` int(11) DEFAULT NULL,
  `gender` set('m','f','') COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_profiles`
--

INSERT INTO `default_profiles` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `user_id`, `display_name`, `first_name`, `last_name`, `company`, `lang`, `bio`, `dob`, `gender`, `phone`, `mobile`, `address_line1`, `address_line2`, `address_line3`, `postcode`, `website`, `updated_on`) VALUES
(2, '2014-07-12 17:01:24', NULL, 1, 1, 2, 'Carolina Rodriguez', 'Carolina', 'Rodriguez Bonilla', 'Imaginamos S.A.S', 'es', '', -3600, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1437417107),
(5, '2015-02-21 18:38:34', NULL, NULL, 4, 5, 'usuario', 'usuario', 'usuario', NULL, 'es', '', -3600, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1442589865);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_projects`
--

CREATE TABLE `default_projects` (
  `id` int(11) NOT NULL,
  `name` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introduction` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `video` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seefile` int(1) NOT NULL DEFAULT '1',
  `position` int(11) DEFAULT NULL,
  `outstanding` int(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_projects`
--

INSERT INTO `default_projects` (`id`, `name`, `file`, `slug`, `introduction`, `description`, `image`, `category`, `video`, `seefile`, `position`, `outstanding`, `created_at`, `updated_at`, `lang`) VALUES
(2, 'Lorem Ipsum sit amet', 'uploads/default/projects/4f1e63e88f3e612d47147bb752aafd0a.pdf', 'lorem-ipsum-sit-amet', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem magni, alias esse sit soluta. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem magni, alias esse sit soluta.', '<span style="font-size: 13px; line-height: 20.8px;">Lorem ipsum dolor sit amet, <strong>consectetur adipisicing</strong> elit. Quidem magni, alias esse sit soluta.&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem magni, alias esse sit soluta,&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem magni, alias esse sit soluta.&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem magni, alias esse sit soluta.&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem magni, alias esse sit soluta.&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem magni, alias esse sit soluta.&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem magni, alias esse sit soluta.&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem magni, alias esse sit soluta.&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem magni, alias esse sit soluta.&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem magni, alias esse sit soluta.&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem magni, alias esse sit soluta.&nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem magni, alias <strong>esse sit soluta.</strong>&nbsp;</span>', 'uploads/default/projects/c161a31730b69a7f3f88d653c35b572b.jpg', 1, NULL, 1, 1, NULL, '2015-05-12 09:19:47', '2015-10-28 16:23:51', 'es'),
(5, '17AS', 'uploads/default/projects/c1be45536abf8822d26e7f7983ffba97.pdf', '17as', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure alias perspiciatis nostrum nulla iusto necessitatibus explicabo. Quaerat vel animi, veniam veritatis praesentium error molestias facere voluptate maxime eveniet ex iste.', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure alias perspiciatis nostrum nulla iusto necessitatibus explicabo. <strong>Quaerat</strong> vel animi, veniam veritatis praesentium error molestias facere voluptate maxime eveniet <strong>ex iste.</strong><br />\r\n<br />\r\n<strong>Lorem ipsum dolor sit amet</strong>, consectetur adipisicing elit. Iure alias perspiciatis nostrum nulla iusto necessitatibus explicabo. Quaerat vel animi, veniam veritatis praesentium error molestias facere voluptate maxime eveniet ex iste.', 'uploads/default/projects/1e0605bbd918ceace334c96677cc5361.jpg', 1, NULL, 1, NULL, NULL, '2015-07-20 21:24:19', '2015-10-28 16:23:07', 'es'),
(6, 'LOREM IPSUM 2', 'uploads/default/projects/07c8fc4ddc130f12b4d5d72dc11a29dc.pdf', 'lorem-ipsum-2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure alias perspiciatis nostrum nulla iusto necessitatibus explicabo. Quaerat vel', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure alias perspiciatis nostrum nulla iusto necessitatibus explicabo. Quaerat vel animi, veniam veritatis praesentium error molestias facere voluptate maxime eveniet ex iste.<br />\r\n<br />\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Iure alias perspiciatis nostrum nulla iusto necessitatibus explicabo<strong>. Quaerat vel animi</strong>, veniam veritatis praesentium error molestias facere voluptate maxime eveniet <strong>ex iste.</strong>', 'uploads/default/projects/41e924bb37ba71d96d0a73caac421f3a.png', 1, NULL, 0, NULL, NULL, '2015-09-18 11:22:23', '2015-10-28 16:23:35', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_projects_categories`
--

CREATE TABLE `default_projects_categories` (
  `project_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_projects_categories`
--

INSERT INTO `default_projects_categories` (`project_id`, `category_id`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_projects_intro`
--

CREATE TABLE `default_projects_intro` (
  `id` int(11) NOT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_projects_intro`
--

INSERT INTO `default_projects_intro` (`id`, `text`, `title`, `lang`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. <strong>Mauris</strong> blandit aliquet elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus nibh.', 'NUESTROS <strong>PROYECTOS</strong>', 'es'),
(2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Cras ultricies ligula sed magna dictum porta. Sed porttitor lectus nibh.', 'Somos <strong>gente9</strong> con mente abierta, innovadores y con pensamiento social', 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_project_categories`
--

CREATE TABLE `default_project_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `parent` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_project_categories`
--

INSERT INTO `default_project_categories` (`id`, `title`, `position`, `parent`, `slug`, `created_at`, `updated_at`, `lang`) VALUES
(1, 'Proyectos Realizados', NULL, 0, 'proyectos-realizados', '2015-05-12 08:28:43', '2015-08-14 22:43:19', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_project_images`
--

CREATE TABLE `default_project_images` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `path` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_project_images`
--

INSERT INTO `default_project_images` (`id`, `project_id`, `path`, `video`, `created_at`) VALUES
(1, 7, 'uploads/default/projects/e682484ecce9aaaf3444f8b5931a5a9a.gif', NULL, '2015-05-21 13:49:30'),
(2, 7, 'uploads/default/projects/ebf8bdca78c6928699c001c2c1e4878c.gif', NULL, '2015-05-21 13:49:37'),
(3, 7, 'uploads/default/projects/d2912997bcfa002b6cd646a75696fe4c.gif', NULL, '2015-05-21 13:49:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_quiz`
--

CREATE TABLE `default_quiz` (
  `id` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `text` varchar(500) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_redirects`
--

CREATE TABLE `default_redirects` (
  `id` int(11) NOT NULL,
  `from` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(3) NOT NULL DEFAULT '302'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_search_index`
--

CREATE TABLE `default_search_index` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `keywords` text COLLATE utf8_unicode_ci,
  `keyword_hash` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_plural` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_edit_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp_delete_uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_search_index`
--

INSERT INTO `default_search_index` (`id`, `title`, `description`, `keywords`, `keyword_hash`, `module`, `entry_key`, `entry_plural`, `entry_id`, `uri`, `cp_edit_uri`, `cp_delete_uri`) VALUES
(1, 'Home', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '1', 'home', 'admin/pages/edit/1', 'admin/pages/delete/1'),
(8, 'Contact', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '2', 'contact', 'admin/pages/edit/2', 'admin/pages/delete/2'),
(3, 'Search', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '3', 'search', 'admin/pages/edit/3', 'admin/pages/delete/3'),
(4, 'Results', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '4', 'search/results', 'admin/pages/edit/4', 'admin/pages/delete/4'),
(5, 'Page missing', '', NULL, NULL, 'pages', 'pages:page', 'pages:pages', '5', '404', 'admin/pages/edit/5', 'admin/pages/delete/5'),
(10, 'Lorem Ipsum', 'Lorem Ipsum&nbsp;es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno est&aacute;ndar de las industrias desde el a&ntilde;o 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido us&oacute; una galer&iacute;a de textos y los mezcl&oacute; de tal manera que logr&oacute; hacer un libro de textos especimen. No s&oacute;lo sobrevivi&oacute; 500 a&ntilde;os, sino que tambien ingres&oacute; como texto de relleno en documentos electr&oacute;nicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creaci&oacute;n de las hojas &quot;Letraset&quot;, las cuales contenian pasajes de Lorem Ipsum, y m&aacute;s recientemente con software de autoedici&oacute;n, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.', NULL, NULL, 'blog', 'blog:post', 'blog:posts', '1', 'blog/2014/03/lorem-ipsum', 'admin/blog/edit/1', 'admin/blog/delete/1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_services`
--

CREATE TABLE `default_services` (
  `id` int(11) NOT NULL,
  `name` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introduction` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seefile` int(1) NOT NULL DEFAULT '1',
  `position` int(11) DEFAULT NULL,
  `outstanding` int(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_services`
--

INSERT INTO `default_services` (`id`, `name`, `file`, `slug`, `introduction`, `description`, `image`, `seefile`, `position`, `outstanding`, `created_at`, `updated_at`, `lang`) VALUES
(2, 'Service test', 'uploads/default/services/207c1055188f1e400c079ef6d4ffc555.mp4', 'service-test', 'Sección 1.10.32 de "de Finibus Bonorum et Malorum", escrito por Cicero en el 45 antes de Cristo\r\n\r\n"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium,', '<br />\r\nSecci&oacute;n 1.10.32 de &quot;de Finibus Bonorum et Malorum&quot;, escrito por Cicero en el 45 antes de Cristo<br />\r\n<br />\r\n&quot;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro isquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&quot;', 'uploads/default/services/2f83410fcbd0a9d04a5d8fa2343327b6.jpg', 1, NULL, 0, '2015-03-25 18:56:45', '2015-09-18 16:15:22', 'en'),
(8, 'Lorem Ipsum sit amet', 'uploads/default/services/a8fdd1ae65022085e81bc21fdd58879b.pdf', 'lorem-ipsum-sit-amet', 'Sed porttitor lectus nibh. Proin eget tortor risus. Proin eget tortor risus. Vivamus suscipit tortor eget felis porttitor volutpat.', 'Sed porttitor lectus nibh. Proin eget tortor risus. Proin eget tortor risus. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur aliquet quam id dui posuere blandit. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada.', 'uploads/default/services/ed72ed3165b0edbe6d76356040327304.jpg', 1, 1, 1, '2015-06-12 15:11:24', '2015-09-18 21:10:58', 'es'),
(9, 'LOREM IPSUM', NULL, 'lorem-ipsum', 'Sed porttitor lectus nibh. Proin eget tortor risus. Proin eget tortor risus. Vivamus suscipit tortor', 'Sed porttitor lectus nibh. Proin eget tortor risus. Proin eget tortor risus. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur aliquet quam id dui posuere blandit. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada.', 'uploads/default/services/272104430acf9af7d88ef80d88c119ec.jpg', 0, 4, 0, '2015-09-18 10:45:39', '2015-09-18 21:11:39', 'es'),
(10, 'SIT AMET 2', NULL, 'sit-amet-2', 'Sed porttitor lectus nibh. Proin eget tortor risus. Proin eget tortor risus. Vivamus suscipit tortor', 'Sed porttitor lectus nibh. Proin eget tortor risus. Proin eget tortor risus. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur aliquet quam id dui posuere blandit. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada.', 'uploads/default/services/627a0f9cff7db200795e2fd85757b9bd.png', 0, 2, 1, '2015-09-18 10:46:08', '2015-09-18 21:11:39', 'es'),
(11, 'LOREM IPSUM 3', 'uploads/default/services/a3160a066b8fda9510c2f658bd06ca28.pdf', 'lorem-ipsum-3', 'Sed porttitor lectus nibh. Proin eget tortor risus. Proin eget tortor risus. Vivamus suscipit tortor', 'Sed porttitor lectus nibh. Proin eget tortor risus. Proin eget tortor risus. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur aliquet quam id dui posuere blandit. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada.', 'uploads/default/services/911659a6d31501908d59317c35f0349b.png', 1, 3, 0, '2015-09-18 10:46:53', '2015-09-18 21:11:39', 'es'),
(12, 'SIT AMET 5', 'uploads/default/services/fc58834244f869cc950f3ffa0d75db8f.pdf', 'sit-amet-5', 'Sed porttitor lectus nibh. Proin eget tortor risus. Proin eget tortor risus. Vivamus suscipit tortor', 'Sed porttitor lectus nibh. Proin eget tortor risus. Proin eget tortor risus. Vivamus suscipit tortor eget felis porttitor volutpat. Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Curabitur aliquet quam id dui posuere blandit. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Donec sollicitudin molestie malesuada.', 'uploads/default/services/1d76fabfd750845dcf36641332c12163.jpg', 1, 5, 0, '2015-09-18 10:47:34', '2015-09-18 16:15:28', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_services_categories`
--

CREATE TABLE `default_services_categories` (
  `service_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_services_categories`
--

INSERT INTO `default_services_categories` (`service_id`, `category_id`) VALUES
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_services_intro`
--

CREATE TABLE `default_services_intro` (
  `id` int(11) NOT NULL,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `section` int(1) DEFAULT '1',
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_services_intro`
--

INSERT INTO `default_services_intro` (`id`, `title`, `text`, `section`, `lang`) VALUES
(1, 'NUESTROS<strong> SERVICIOS</strong>', 'De la mano con el <strong>crecimiento</strong> de su <strong>empresa</strong>', 1, 'es'),
(2, NULL, 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula. Vivamus suscipit tortor eget felis porttitor volutpat.&nbsp;', 1, 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_service_categories`
--

CREATE TABLE `default_service_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `parent` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_service_categories`
--

INSERT INTO `default_service_categories` (`id`, `title`, `position`, `parent`, `slug`, `created_at`, `updated_at`, `lang`) VALUES
(1, 'Categoria de servicio', NULL, 0, 'categoria-de-servicio', '2015-03-25 18:52:00', '2015-03-25 23:52:00', 'es'),
(2, 'Services Category', NULL, 0, 'services-category', '2015-03-25 18:55:20', '2015-03-25 23:55:20', 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_service_images`
--

CREATE TABLE `default_service_images` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `path` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_service_images`
--

INSERT INTO `default_service_images` (`id`, `service_id`, `path`, `video`, `created_at`) VALUES
(1, 3, 'uploads/default/services/41979f97f738f146552d73089ebd5202.gif', NULL, '2015-05-21 14:16:48'),
(2, 3, 'uploads/default/services/d740af9ff1e7dc6c8bbed3035291a60a.gif', NULL, '2015-05-21 14:16:59'),
(3, 4, 'uploads/default/services/85594e39df81bdb9e714f15bea843ccb.gif', NULL, '2015-05-21 14:17:11'),
(4, 4, 'uploads/default/services/1994b760c24f0217fb613cafe8327644.gif', NULL, '2015-05-21 14:17:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_settings`
--

CREATE TABLE `default_settings` (
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox') COLLATE utf8_unicode_ci NOT NULL,
  `default` text COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `is_gui` int(1) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_settings`
--

INSERT INTO `default_settings` (`slug`, `title`, `description`, `type`, `default`, `value`, `options`, `is_required`, `is_gui`, `module`, `order`) VALUES
('activation_email', 'Activation Email', 'Send out an e-mail with an activation link when a user signs up. Disable this so that admins must manually activate each account.', 'select', '1', '', '0=activate_by_admin|1=activate_by_email|2=no_activation', 0, 1, 'users', 961),
('addons_upload', 'Addons Upload Permissions', 'Keeps mere admins from uploading addons by default', 'text', '0', '1', '', 1, 0, '', 0),
('admin_force_https', 'Force HTTPS for Control Panel?', 'Allow only the HTTPS protocol when using the Control Panel?', 'radio', '0', '', '1=Yes|0=No', 1, 1, '', 0),
('admin_theme', 'Control Panel Theme', 'Select the theme for the control panel.', '', '', 'pyrocms', 'func:get_themes', 1, 0, '', 0),
('akismet_api_key', 'Akismet API Key', 'Akismet is a spam-blocker from the WordPress team. It keeps spam under control without forcing users to get past human-checking CAPTCHA forms.', 'text', '', '', '', 0, 1, 'integration', 981),
('api_enabled', 'API Enabled', 'Allow API access to all modules which have an API controller.', 'select', '0', '0', '0=Disabled|1=Enabled', 0, 0, 'api', 0),
('api_user_keys', 'API User Keys', 'Allow users to sign up for API keys (if the API is Enabled).', 'select', '0', '0', '0=Disabled|1=Enabled', 0, 0, 'api', 0),
('auto_username', 'Auto Username', 'Create the username automatically, meaning users can skip making one on registration.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 964),
('cdn_domain', 'CDN Domain', 'CDN domains allow you to offload static content to various edge servers, like Amazon CloudFront or MaxCDN.', 'text', '', '', '', 0, 1, 'integration', 1000),
('ckeditor_config', 'CKEditor Config', 'You can find a list of valid configuration items in <a target="_blank" href="http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html">CKEditor''s documentation.</a>', 'textarea', '', '{{# this is a wysiwyg-simple editor customized for the blog module (it allows images to be inserted) #}}\r\n$(''textarea#intro.wysiwyg-simple'').ckeditor({\r\n	toolbar: [\r\n		[''pyroimages''],\r\n		[''Bold'', ''Italic'', ''-'', ''NumberedList'', ''BulletedList'', ''-'', ''Link'', ''Unlink'']\r\n	  ],\r\n	extraPlugins: ''pyroimages'',\r\n	width: ''99%'',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: ''#000'',\r\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\r\n	language: ''{{ global:current_language }}''\r\n});\r\n\r\n{{# this is the config for all wysiwyg-simple textareas #}}\r\n$(''textarea.wysiwyg-simple'').ckeditor({\r\n	toolbar: [\r\n		[''Bold'', ''Italic'', ''-'', ''NumberedList'', ''BulletedList'', ''-'', ''Link'', ''Unlink'', ''RemoveFormat'', ''Source'']\r\n	  ],\r\n	width: ''99%'',\r\n	height: 100,\r\n	dialog_backgroundCoverColor: ''#000'',\r\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\r\n	language: ''{{ global:current_language }}''\r\n});\r\n\r\n{{# and this is the advanced editor #}}\r\n$(''textarea.wysiwyg-advanced'').ckeditor({\r\n	toolbar: [\r\n		[''Maximize''],\r\n		[''pyroimages'', ''pyrofiles''],\r\n		[''Cut'',''Copy'',''Paste'',''PasteFromWord''],\r\n		[''Undo'',''Redo'',''-'',''Find'',''Replace''],\r\n		[''Link'',''Unlink''],\r\n		[''Table'',''HorizontalRule'',''SpecialChar''],\r\n		[''Bold'',''Italic'',''StrikeThrough''],\r\n		[''JustifyLeft'',''JustifyCenter'',''JustifyRight'',''JustifyBlock'',''-'',''BidiLtr'',''BidiRtl''],\r\n		[''TextColor'',''BGColor'',''Format'', ''FontSize'', ''Subscript'',''Superscript'', ''NumberedList'',''BulletedList'',''Outdent'',''Indent'',''Blockquote''],\r\n		[''ShowBlocks'', ''RemoveFormat'', ''Source''],\r\n	],\r\n	extraPlugins: ''pyroimages,pyrofiles'',\r\n	width: ''99%'',\r\n	height: 400,\r\n	dialog_backgroundCoverColor: ''#000'',\r\n	removePlugins: ''elementspath'',\r\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\r\n	language: ''{{ global:current_language }}''\r\n});', '', 1, 1, 'wysiwyg', 993),
('comment_markdown', 'Allow Markdown', 'Do you want to allow visitors to post comments using Markdown?', 'select', '0', '0', '0=Text Only|1=Allow Markdown', 1, 1, 'comments', 965),
('comment_order', 'Comment Order', 'Sort order in which to display comments.', 'select', 'ASC', 'ASC', 'ASC=Oldest First|DESC=Newest First', 1, 1, 'comments', 966),
('contact_email', 'Contact E-mail', 'All e-mails from users, guests and the site will go to this e-mail address.', 'text', 'brayan.acebo@imaginamos.co', 'luis.salazar@imagina.co', '', 1, 1, 'email', 979),
('currency', 'Currency', 'The currency symbol for use on products, services, etc.', 'text', '&pound;', '', '', 1, 1, '', 994),
('dashboard_rss', 'Dashboard RSS Feed', 'Link to an RSS feed that will be displayed on the dashboard.', 'text', 'https://www.pyrocms.com/blog/rss/all.rss', '', '', 0, 1, '', 990),
('dashboard_rss_count', 'Dashboard RSS Items', 'How many RSS items would you like to display on the dashboard?', 'text', '5', '5', '', 1, 1, '', 989),
('date_format', 'Date Format', 'How should dates be displayed across the website and control panel? Using the <a target="_blank" href="http://php.net/manual/en/function.date.php">date format</a> from PHP - OR - Using the format of <a target="_blank" href="http://php.net/manual/en/function.strftime.php">strings formatted as date</a> from PHP.', 'text', 'F j, Y', '', '', 1, 1, '', 995),
('default_theme', 'Default Theme', 'Select the theme you want users to see by default.', '', 'default', 'picasso', 'func:get_themes', 1, 0, '', 0),
('enable_comments', 'Enable Comments', 'Enable comments.', 'radio', '1', '1', '1=Enabled|0=Disabled', 1, 1, 'comments', 968),
('enable_profiles', 'Enable profiles', 'Allow users to add and edit profiles.', 'radio', '1', '', '1=Enabled|0=Disabled', 1, 1, 'users', 963),
('enable_registration', 'Enable user registration', 'Allow users to register in your site.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 961),
('files_cache', 'Files Cache', 'When outputting an image via site.com/files what shall we set the cache expiration for?', 'select', '480', '480', '0=no-cache|1=1-minute|60=1-hour|180=3-hour|480=8-hour|1440=1-day|43200=30-days', 1, 1, 'files', 986),
('files_cf_api_key', 'Rackspace Cloud Files API Key', 'You also must provide your Cloud Files API Key. You will find it at the same location as your Username in your Rackspace account.', 'text', '', '', '', 0, 1, 'files', 989),
('files_cf_username', 'Rackspace Cloud Files Username', 'To enable cloud file storage in your Rackspace Cloud Files account please enter your Cloud Files Username. <a href="https://manage.rackspacecloud.com/APIAccess.do">Find your credentials</a>', 'text', '', '', '', 0, 1, 'files', 990),
('files_enabled_providers', 'Enabled File Storage Providers', 'Which file storage providers do you want to enable? (If you enable a cloud provider you must provide valid auth keys below', 'checkbox', '0', '0', 'amazon-s3=Amazon S3|rackspace-cf=Rackspace Cloud Files', 0, 1, 'files', 994),
('files_s3_access_key', 'Amazon S3 Access Key', 'To enable cloud file storage in your Amazon S3 account provide your Access Key. <a href="https://aws-portal.amazon.com/gp/aws/securityCredentials#access_credentials">Find your credentials</a>', 'text', '', '', '', 0, 1, 'files', 993),
('files_s3_geographic_location', 'Amazon S3 Geographic Location', 'Either US or EU. If you change this you must also change the S3 URL.', 'radio', 'US', 'US', 'US=United States|EU=Europe', 1, 1, 'files', 991),
('files_s3_secret_key', 'Amazon S3 Secret Key', 'You also must provide your Amazon S3 Secret Key. You will find it at the same location as your Access Key in your Amazon account.', 'text', '', '', '', 0, 1, 'files', 992),
('files_s3_url', 'Amazon S3 URL', 'Change this if using one of Amazon''s EU locations or a custom domain.', 'text', 'http://{{ bucket }}.s3.amazonaws.com/', 'http://{{ bucket }}.s3.amazonaws.com/', '', 0, 1, 'files', 991),
('files_upload_limit', 'Filesize Limit', 'Maximum filesize to allow when uploading. Specify the size in MB. Example: 5', 'text', '5', '5', '', 1, 1, 'files', 987),
('frontend_enabled', 'Site Status', 'Use this option to the user-facing part of the site on or off. Useful when you want to take the site down for maintenance.', 'radio', '1', '', '1=Open|0=Closed', 1, 1, '', 988),
('ga_email', 'Google Analytic E-mail', 'E-mail address used for Google Analytics, we need this to show the graph on the dashboard.', 'text', '', 'luis.salazar@imagina.co', '', 0, 1, 'integration', 983),
('ga_password', 'Google Analytic Password', 'This is also needed to show the graph on the dashboard. You will need to allow access to Google to get this to work. See <a href="https://accounts.google.com/b/0/IssuedAuthSubTokens?hl=en_US" target="_blank">Authorized Access to your Google Account</a>', 'password', '', 'bogota', '', 0, 1, 'integration', 982),
('ga_profile', 'Google Analytic Profile ID', 'Profile ID for this website in Google Analytics', 'text', '', '', '', 0, 1, 'integration', 984),
('ga_tracking', 'Google Tracking Code', 'Enter your Google Analytic Tracking Code to activate Google Analytics view data capturing. E.g: UA-19483569-6', 'text', '', '', '', 0, 1, 'integration', 985),
('mail_line_endings', 'Email Line Endings', 'Change from the standard \\r\\n line ending to PHP_EOL for some email servers.', 'select', '1', '1', '0=PHP_EOL|1=\\r\\n', 0, 1, 'email', 972),
('mail_protocol', 'Mail Protocol', 'Select desired email protocol.', 'select', 'mail', 'smtp', 'mail=Mail|sendmail=Sendmail|smtp=SMTP', 1, 1, 'email', 977),
('mail_sendmail_path', 'Sendmail Path', 'Path to server sendmail binary.', 'text', '', '', '', 0, 1, 'email', 972),
('mail_smtp_host', 'SMTP Host Name', 'The host name of your smtp server.', 'text', '', 'mail.fastproject.co', '', 0, 1, 'email', 976),
('mail_smtp_pass', 'SMTP password', 'SMTP password.', 'password', '', 'y#hsPaQ2GyD8', '', 0, 1, 'email', 975),
('mail_smtp_port', 'SMTP Port', 'SMTP port number.', 'text', '', '25', '', 0, 1, 'email', 974),
('mail_smtp_user', 'SMTP User Name', 'SMTP user name.', 'text', '', 'info@fastproject.co', '', 0, 1, 'email', 973),
('meta_topic', 'Meta Topic', 'Two or three words describing this type of company/website.', 'text', 'Content Management', '', '', 0, 1, '', 998),
('moderate_comments', 'Moderate Comments', 'Force comments to be approved before they appear on the site.', 'radio', '1', '1', '1=Enabled|0=Disabled', 1, 1, 'comments', 967),
('profile_visibility', 'Profile Visibility', 'Specify who can view user profiles on the public site', 'select', 'public', '', 'public=profile_public|owner=profile_owner|hidden=profile_hidden|member=profile_member', 0, 1, 'users', 960),
('records_per_page', 'Records Per Page', 'How many records should we show per page in the admin section?', 'select', '25', '', '10=10|25=25|50=50|100=100', 1, 1, '', 992),
('registered_email', 'User Registered Email', 'Send a notification email to the contact e-mail when someone registers.', 'radio', '1', '', '1=Enabled|0=Disabled', 0, 1, 'users', 962),
('rss_feed_items', 'Feed item count', 'How many items should we show in RSS/blog feeds?', 'select', '25', '', '10=10|25=25|50=50|100=100', 1, 1, '', 991),
('server_email', 'Server E-mail', 'All e-mails to users will come from this e-mail address.', 'text', 'admin@localhost', 'info@fastproject.co', '', 1, 1, 'email', 978),
('site_lang', 'Site Language', 'The native language of the website, used to choose templates of e-mail notifications, contact form, and other features that should not depend on the language of a user.', 'select', 'en', 'es', 'func:get_supported_lang', 1, 1, '', 997),
('site_name', 'Site Name', 'The name of the website for page titles and for use around the site.', 'text', 'Un-named Website', 'Agrollano', '', 1, 1, '', 1000),
('site_public_lang', 'Public Languages', 'Which are the languages really supported and offered on the front-end of your website?', 'checkbox', 'en', 'es', 'func:get_supported_lang', 1, 1, '', 996),
('site_slogan', 'Site Slogan', 'The slogan of the website for page titles and for use around the site', 'text', '', '', '', 0, 1, '', 999),
('unavailable_message', 'Unavailable Message', 'When the site is turned off or there is a major problem, this message will show to users.', 'textarea', 'Sorry, this website is currently unavailable.', '', '', 0, 1, '', 987);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_theme_options`
--

CREATE TABLE `default_theme_options` (
  `id` int(11) NOT NULL,
  `slug` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `type` set('text','textarea','password','select','select-multiple','radio','checkbox','colour-picker') COLLATE utf8_unicode_ci NOT NULL,
  `default` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `is_required` int(1) NOT NULL,
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_theme_options`
--

INSERT INTO `default_theme_options` (`id`, `slug`, `title`, `description`, `type`, `default`, `value`, `options`, `is_required`, `theme`) VALUES
(1, 'pyrocms_recent_comments', 'Recent Comments', 'Would you like to display recent comments on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(2, 'pyrocms_news_feed', 'News Feed', 'Would you like to display the news feed on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(3, 'pyrocms_quick_links', 'Quick Links', 'Would you like to display quick links on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(4, 'pyrocms_analytics_graph', 'Analytics Graph', 'Would you like to display the graph on the dashboard?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'pyrocms'),
(5, 'show_breadcrumbs', 'Show Breadcrumbs', 'Would you like to display breadcrumbs?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'default'),
(6, 'layout', 'Layout', 'Which type of layout shall we use?', 'select', '2 column', '2 column', '2 column=Two Column|full-width=Full Width|full-width-home=Full Width Home Page', 1, 'default'),
(7, 'background', 'Background', 'Choose the default background for the theme.', 'select', 'fabric', 'fabric', 'black=Black|fabric=Fabric|graph=Graph|leather=Leather|noise=Noise|texture=Texture', 1, 'base'),
(8, 'slider', 'Slider', 'Would you like to display the slider on the homepage?', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'base'),
(9, 'color', 'Default Theme Color', 'This changes things like background color, link colors etc…', 'select', 'pink', 'pink', 'red=Red|orange=Orange|yellow=Yellow|green=Green|blue=Blue|pink=Pink', 1, 'base'),
(10, 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'yes', 'yes', 'yes=Yes|no=No', 1, 'base'),
(21, 'show_breadcrumbs', 'Do you want to show breadcrumbs?', 'If selected it shows a string of breadcrumbs at the top of the page.', 'radio', 'no', 'no', 'yes=Yes|no=No', 1, 'bootstrapThree'),
(22, 'bootSwatch_layout', 'Theme', 'Choose the default bootstrap.css or select the bootswatch theme that you prefer', 'select', 'bootstrap', 'bootstrap', 'bootstrap=Default - Bootstrap|amelia=Amelia|cerulean=Cerulean|cosmo=Cosmo|cyborg=Cyborg|flatly=Flatly|journal=Journal|readable=Readable|simplex=Simplex|slate=Slate|spacelab=Spacelab|united=United|yeti=Yeti', 1, 'bootstrapThree'),
(66, 'framework', 'Framework', 'Cambia el framework css', 'select', 'Picasso', 'frameworks/materialize', 'frameworks/materialize = Materialize CSS | frameworks/bootstrap = Boostrap 3 | framework/foundation = Foundation 5', 1, 'picasso'),
(67, 'jquery', 'Versión Jquery', 'Cambia el la versión de Jquery', 'select', 'Picasso', 'libs/jquery/jquery-1.11.0', 'libs/jquery/jquery-1.11.0 = 1.11.0 | libs/jquery/jquery-1.9.1 = 1.9.1', 1, 'picasso'),
(68, 'theme', 'Tema', 'Cambia el tema predeterminado', 'select', 'Picasso', 'themes/default', 'themes/default = Default | themes/custom = Custom', 1, 'picasso'),
(69, 'tipo', 'Tipografía', 'Cambia la tipografía del sitio', 'select', 'Picasso', 'variations/style1/default', 'variations/style1/default = Default | style1/tipo = Estilo 1 | style2/tipo = Estilo 2 | style3/tipo = Estilo 3', 1, 'picasso'),
(70, 'show_acordeon', 'Habilitar destacados en acordeón', 'Si selecciones si, se mostraran los destacados como un acordeon.', 'radio', 'no', 'no', 'yes=Yes|no=No', 0, 'picasso'),
(71, 'showmenu_footer', 'Habilita el menú del footer', 'Si selecciones si, se mostraran la navegación en el footer.', 'radio', 'no', 'no', 'yes=Yes|no=No', 0, 'picasso'),
(72, 'aboutus', 'Quienes Somos', 'Cambia el layout de Quienes Somos', 'select', 'Picasso', 'variations/style1/default', 'variations/style1/default = Default | variations/style1/aboutus = Estilo 1 | variations/style2/aboutus = Estilo 2 | variations/style3/aboutus = Estilo 3', 1, 'picasso'),
(73, 'show_modernlayout', 'Habilitar destacados en acordeón', 'Si selecciones si, se mostraran los destacados como un acordeon.', 'radio', 'no', 'no', 'yes=Yes|no=No', 0, 'picasso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_users`
--

CREATE TABLE `default_users` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT NULL,
  `activation_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` int(11) NOT NULL,
  `last_login` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Registered User Information';

--
-- Volcado de datos para la tabla `default_users`
--

INSERT INTO `default_users` (`id`, `email`, `password`, `salt`, `group_id`, `ip_address`, `active`, `activation_code`, `created_on`, `last_login`, `username`, `forgotten_password_code`, `remember_code`) VALUES
(2, 'carolina.bonilla@imaginamos.co', '59cd9599b4523c87f6d3f723454784c0aa96e266', 'f12a55', 1, '127.0.0.1', 1, NULL, 1405184484, 1464871823, 'carolina.rodriguez', NULL, '728fe8b07b15736caf3752d3762c325c9548d282'),
(5, 'admin@escalaurbana.com', 'dbc8a33683f1cf79528274e47b2c6211bdcbb1f2', 'fafdd9', 2, '::1', 1, '37c137ca094851082f1bb97b6bed6057d220f2b7', 1424601514, 1443295123, 'administrador', NULL, '68f5566baedc3c7b1c5ece916054326f5d65c985');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_user_process`
--

CREATE TABLE `default_user_process` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `cod` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introduction` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_user_process`
--

INSERT INTO `default_user_process` (`id`, `id_user`, `cod`, `introduction`, `description`, `title`, `id_estado`) VALUES
(2, 3, 'CO125', 'Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta.&nbsp;', 'Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur aliquet quam id dui posuere blandit. Cras ultricies ligula sed magna dictum porta. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Sed porttitor lectus nibh. Quisque velit nisi, pretium ut lacinia in, elementum id enim. Cras ultricies ligula sed magna dictum porta. Cras ultricies ligula sed magna dictum porta. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus.', 'Lorem Ipsum is simply', 3),
(3, 3, 'CO124', 'Proin eget tortor risus. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Quisque velit nisi, pretium ut lacinia in, elementum id enim.', 'Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Cras ultricies ligula sed magna dictum porta. Nulla quis lorem ut libero malesuada feugiat. Donec rutrum congue leo eget malesuada. Sed porttitor lectus nibh. Donec rutrum congue leo eget malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;&nbsp;', 'Donec sollicitudin molestie malesuada.', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_variables`
--

CREATE TABLE `default_variables` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_variables`
--

INSERT INTO `default_variables` (`id`, `name`, `data`) VALUES
(1, 'chat_server_url', 'http://localhost/nucleo-base/');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_widgets`
--

CREATE TABLE `default_widgets` (
  `id` int(11) NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `enabled` int(1) NOT NULL DEFAULT '1',
  `order` int(10) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_widgets`
--

INSERT INTO `default_widgets` (`id`, `slug`, `title`, `description`, `author`, `website`, `version`, `enabled`, `order`, `updated_on`) VALUES
(1, 'google_maps', 'a:10:{s:2:"en";s:11:"Google Maps";s:2:"el";s:19:"Χάρτης Google";s:2:"nl";s:11:"Google Maps";s:2:"br";s:11:"Google Maps";s:2:"pt";s:11:"Google Maps";s:2:"ru";s:17:"Карты Google";s:2:"id";s:11:"Google Maps";s:2:"fi";s:11:"Google Maps";s:2:"fr";s:11:"Google Maps";s:2:"fa";s:17:"نقشه گوگل";}', 'a:10:{s:2:"en";s:32:"Display Google Maps on your site";s:2:"el";s:78:"Προβάλετε έναν Χάρτη Google στον ιστότοπό σας";s:2:"nl";s:27:"Toon Google Maps in uw site";s:2:"br";s:34:"Mostra mapas do Google no seu site";s:2:"pt";s:34:"Mostra mapas do Google no seu site";s:2:"ru";s:80:"Выводит карты Google на страницах вашего сайта";s:2:"id";s:37:"Menampilkan Google Maps di Situs Anda";s:2:"fi";s:39:"Näytä Google Maps kartta sivustollasi";s:2:"fr";s:42:"Publiez un plan Google Maps sur votre site";s:2:"fa";s:59:"نمایش داده نقشه گوگل بر روی سایت ";}', 'Gregory Athons', 'http://www.gregathons.com', '1.0.0', 1, 1, 1446229630),
(2, 'html', 's:4:"HTML";', 'a:10:{s:2:"en";s:28:"Create blocks of custom HTML";s:2:"el";s:80:"Δημιουργήστε περιοχές με δικό σας κώδικα HTML";s:2:"br";s:41:"Permite criar blocos de HTML customizados";s:2:"pt";s:41:"Permite criar blocos de HTML customizados";s:2:"nl";s:30:"Maak blokken met maatwerk HTML";s:2:"ru";s:83:"Создание HTML-блоков с произвольным содержимым";s:2:"id";s:24:"Membuat blok HTML apapun";s:2:"fi";s:32:"Luo lohkoja omasta HTML koodista";s:2:"fr";s:36:"Créez des blocs HTML personnalisés";s:2:"fa";s:58:"ایجاد قسمت ها به صورت اچ تی ام ال";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', 1, 2, 1446229630),
(3, 'login', 'a:10:{s:2:"en";s:5:"Login";s:2:"el";s:14:"Σύνδεση";s:2:"nl";s:5:"Login";s:2:"br";s:5:"Login";s:2:"pt";s:5:"Login";s:2:"ru";s:22:"Вход на сайт";s:2:"id";s:5:"Login";s:2:"fi";s:13:"Kirjautuminen";s:2:"fr";s:9:"Connexion";s:2:"fa";s:10:"لاگین";}', 'a:10:{s:2:"en";s:36:"Display a simple login form anywhere";s:2:"el";s:96:"Προβάλετε μια απλή φόρμα σύνδεσης χρήστη οπουδήποτε";s:2:"br";s:69:"Permite colocar um formulário de login em qualquer lugar do seu site";s:2:"pt";s:69:"Permite colocar um formulário de login em qualquer lugar do seu site";s:2:"nl";s:32:"Toon overal een simpele loginbox";s:2:"ru";s:72:"Выводит простую форму для входа на сайт";s:2:"id";s:32:"Menampilkan form login sederhana";s:2:"fi";s:52:"Näytä yksinkertainen kirjautumislomake missä vain";s:2:"fr";s:54:"Affichez un formulaire de connexion où vous souhaitez";s:2:"fa";s:70:"نمایش یک لاگین ساده در هر قسمتی از سایت";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', 1, 3, 1446229630),
(4, 'navigation', 'a:10:{s:2:"en";s:10:"Navigation";s:2:"el";s:16:"Πλοήγηση";s:2:"nl";s:9:"Navigatie";s:2:"br";s:11:"Navegação";s:2:"pt";s:11:"Navegação";s:2:"ru";s:18:"Навигация";s:2:"id";s:8:"Navigasi";s:2:"fi";s:10:"Navigaatio";s:2:"fr";s:10:"Navigation";s:2:"fa";s:10:"منوها";}', 'a:10:{s:2:"en";s:40:"Display a navigation group with a widget";s:2:"el";s:100:"Προβάλετε μια ομάδα στοιχείων πλοήγησης στον ιστότοπο";s:2:"nl";s:38:"Toon een navigatiegroep met een widget";s:2:"br";s:62:"Exibe um grupo de links de navegação como widget em seu site";s:2:"pt";s:62:"Exibe um grupo de links de navegação como widget no seu site";s:2:"ru";s:88:"Отображает навигационную группу внутри виджета";s:2:"id";s:44:"Menampilkan grup navigasi menggunakan widget";s:2:"fi";s:37:"Näytä widgetillä navigaatio ryhmä";s:2:"fr";s:47:"Affichez un groupe de navigation dans un widget";s:2:"fa";s:71:"نمایش گروهی از منوها با استفاده از ویجت";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.2.0', 1, 4, 1446229631),
(5, 'rss_feed', 'a:10:{s:2:"en";s:8:"RSS Feed";s:2:"el";s:24:"Τροφοδοσία RSS";s:2:"nl";s:8:"RSS Feed";s:2:"br";s:8:"Feed RSS";s:2:"pt";s:8:"Feed RSS";s:2:"ru";s:31:"Лента новостей RSS";s:2:"id";s:8:"RSS Feed";s:2:"fi";s:10:"RSS Syöte";s:2:"fr";s:8:"Flux RSS";s:2:"fa";s:19:"خبر خوان RSS";}', 'a:10:{s:2:"en";s:41:"Display parsed RSS feeds on your websites";s:2:"el";s:82:"Προβάλετε τα περιεχόμενα μιας τροφοδοσίας RSS";s:2:"nl";s:28:"Toon RSS feeds op uw website";s:2:"br";s:48:"Interpreta e exibe qualquer feed RSS no seu site";s:2:"pt";s:48:"Interpreta e exibe qualquer feed RSS no seu site";s:2:"ru";s:94:"Выводит обработанную ленту новостей на вашем сайте";s:2:"id";s:42:"Menampilkan kutipan RSS feed di situs Anda";s:2:"fi";s:39:"Näytä purettu RSS syöte sivustollasi";s:2:"fr";s:39:"Affichez un flux RSS sur votre site web";s:2:"fa";s:46:"نمایش خوراک های RSS در سایت";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.2.0', 1, 5, 1446229631),
(6, 'social_bookmark', 'a:10:{s:2:"en";s:15:"Social Bookmark";s:2:"el";s:35:"Κοινωνική δικτύωση";s:2:"nl";s:19:"Sociale Bladwijzers";s:2:"br";s:15:"Social Bookmark";s:2:"pt";s:15:"Social Bookmark";s:2:"ru";s:37:"Социальные закладки";s:2:"id";s:15:"Social Bookmark";s:2:"fi";s:24:"Sosiaalinen kirjanmerkki";s:2:"fr";s:13:"Liens sociaux";s:2:"fa";s:52:"بوکمارک های شبکه های اجتماعی";}', 'a:10:{s:2:"en";s:47:"Configurable social bookmark links from AddThis";s:2:"el";s:111:"Παραμετροποιήσιμα στοιχεία κοινωνικής δικτυώσης από το AddThis";s:2:"nl";s:43:"Voeg sociale bladwijzers toe vanuit AddThis";s:2:"br";s:87:"Adiciona links de redes sociais usando o AddThis, podendo fazer algumas configurações";s:2:"pt";s:87:"Adiciona links de redes sociais usando o AddThis, podendo fazer algumas configurações";s:2:"ru";s:90:"Конфигурируемые социальные закладки с сайта AddThis";s:2:"id";s:60:"Tautan social bookmark yang dapat dikonfigurasi dari AddThis";s:2:"fi";s:59:"Konfiguroitava sosiaalinen kirjanmerkki linkit AddThis:stä";s:2:"fr";s:43:"Liens sociaux personnalisables avec AddThis";s:2:"fa";s:71:"تنظیم و نمایش لینک های شبکه های اجتماعی";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', 1, 6, 1446229631),
(7, 'archive', 'a:8:{s:2:"en";s:7:"Archive";s:2:"br";s:15:"Arquivo do Blog";s:2:"fa";s:10:"آرشیو";s:2:"pt";s:15:"Arquivo do Blog";s:2:"el";s:33:"Αρχείο Ιστολογίου";s:2:"fr";s:16:"Archives du Blog";s:2:"ru";s:10:"Архив";s:2:"id";s:7:"Archive";}', 'a:8:{s:2:"en";s:64:"Display a list of old months with links to posts in those months";s:2:"br";s:95:"Mostra uma lista navegação cronológica contendo o índice dos artigos publicados mensalmente";s:2:"fa";s:101:"نمایش لیست ماه های گذشته به همراه لینک به پست های مربوطه";s:2:"pt";s:95:"Mostra uma lista navegação cronológica contendo o índice dos artigos publicados mensalmente";s:2:"el";s:155:"Προβάλλει μια λίστα μηνών και συνδέσμους σε αναρτήσεις που έγιναν σε κάθε από αυτούς";s:2:"fr";s:95:"Permet d''afficher une liste des mois passés avec des liens vers les posts relatifs à ces mois";s:2:"ru";s:114:"Выводит список по месяцам со ссылками на записи в этих месяцах";s:2:"id";s:63:"Menampilkan daftar bulan beserta tautan post di setiap bulannya";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', 0, 7, 1446229630),
(8, 'blog_categories', 'a:8:{s:2:"en";s:15:"Blog Categories";s:2:"br";s:18:"Categorias do Blog";s:2:"pt";s:18:"Categorias do Blog";s:2:"el";s:41:"Κατηγορίες Ιστολογίου";s:2:"fr";s:19:"Catégories du Blog";s:2:"ru";s:29:"Категории Блога";s:2:"id";s:12:"Kateori Blog";s:2:"fa";s:28:"مجموعه های بلاگ";}', 'a:8:{s:2:"en";s:30:"Show a list of blog categories";s:2:"br";s:57:"Mostra uma lista de navegação com as categorias do Blog";s:2:"pt";s:57:"Mostra uma lista de navegação com as categorias do Blog";s:2:"el";s:97:"Προβάλει την λίστα των κατηγοριών του ιστολογίου σας";s:2:"fr";s:49:"Permet d''afficher la liste de Catégories du Blog";s:2:"ru";s:57:"Выводит список категорий блога";s:2:"id";s:35:"Menampilkan daftar kategori tulisan";s:2:"fa";s:55:"نمایش لیستی از مجموعه های بلاگ";}', 'Stephen Cozart', 'http://github.com/clip/', '1.0.0', 0, 8, 1446229630),
(9, 'latest_posts', 'a:8:{s:2:"en";s:12:"Latest posts";s:2:"br";s:24:"Artigos recentes do Blog";s:2:"fa";s:26:"آخرین ارسال ها";s:2:"pt";s:24:"Artigos recentes do Blog";s:2:"el";s:62:"Τελευταίες αναρτήσεις ιστολογίου";s:2:"fr";s:17:"Derniers articles";s:2:"ru";s:31:"Последние записи";s:2:"id";s:12:"Post Terbaru";}', 'a:8:{s:2:"en";s:39:"Display latest blog posts with a widget";s:2:"br";s:81:"Mostra uma lista de navegação para abrir os últimos artigos publicados no Blog";s:2:"fa";s:65:"نمایش آخرین پست های وبلاگ در یک ویجت";s:2:"pt";s:81:"Mostra uma lista de navegação para abrir os últimos artigos publicados no Blog";s:2:"el";s:103:"Προβάλει τις πιο πρόσφατες αναρτήσεις στο ιστολόγιό σας";s:2:"fr";s:68:"Permet d''afficher la liste des derniers posts du blog dans un Widget";s:2:"ru";s:100:"Выводит список последних записей блога внутри виджета";s:2:"id";s:51:"Menampilkan posting blog terbaru menggunakan widget";}', 'Erik Berman', 'http://www.nukleo.fr', '1.0.0', 0, 9, 1446229630),
(10, 'shearch_product', 'a:2:{s:2:"en";s:30:"Buscador de Productos (Widget)";s:2:"es";s:25:"Shearch Products (Widget)";}', 'a:2:{s:2:"en";s:16:"Shearch Products";s:2:"es";s:22:"Buscador de productos.";}', 'Luis Fernando Salazar Buitrago', 'www.imaginamos.com', '1.0', 1, 10, 1446229631),
(11, 'logo_pagina', 'a:2:{s:2:"en";s:21:"Logo Página (Widget)";s:2:"es";s:22:"Web site Logo (Widget)";}', 'a:2:{s:2:"en";s:0:"";s:2:"es";s:24:"Configuración del logo.";}', 'Luis Fernando Salazar Buitrago', 'www.imaginamos.com', '1.0', 1, 11, 1446229630),
(12, 'footer_contact_data', 'a:2:{s:2:"en";s:19:"footer_contact_data";s:2:"es";s:39:"Datos de contacto en el footer (Widget)";}', 'a:2:{s:2:"en";s:0:"";s:2:"es";s:60:"Configuración de footer datos con el modulo de contactenos.";}', 'Luis Fernando Salazar Buitrago', 'www.imaginamos.com', '1.0', 1, 12, 1446229630),
(14, 'menu_categories_product', 'a:2:{s:2:"en";s:27:"Menu de categorias (Widget)";s:2:"es";s:24:"Categories Menu (Widget)";}', 'a:2:{s:2:"en";s:15:"Categories Menu";s:2:"es";s:19:"Menu de categorias.";}', 'Luis Fernando Salazar Buitrago', 'www.imaginamos.com', '1.0', 1, 14, 1446229630),
(15, 'social_media', 'a:2:{s:2:"en";s:12:"Social Media";s:2:"es";s:39:"Datos de contacto en el footer (Widget)";}', 'a:2:{s:2:"en";s:0:"";s:2:"es";s:15:"Redes sociales.";}', 'Carolina Rodriguez', 'www.imaginamos.com', '1.0', 1, 15, 1446229631);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_widget_areas`
--

CREATE TABLE `default_widget_areas` (
  `id` int(11) NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_widget_areas`
--

INSERT INTO `default_widget_areas` (`id`, `slug`, `title`) VALUES
(1, 'sidebar', 'Sidebar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_widget_instances`
--

CREATE TABLE `default_widget_instances` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `widget_id` int(11) DEFAULT NULL,
  `widget_area_id` int(11) DEFAULT NULL,
  `options` text COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) NOT NULL DEFAULT '0',
  `created_on` int(11) NOT NULL DEFAULT '0',
  `updated_on` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_widget_instances`
--

INSERT INTO `default_widget_instances` (`id`, `title`, `widget_id`, `widget_area_id`, `options`, `order`, `created_on`, `updated_on`) VALUES
(1, 'buscador productos', 10, 1, 'a:0:{}', 1, 1399480395, 0),
(2, 'Logo página', 11, 1, 'a:0:{}', 2, 1401566352, 0),
(3, 'Datos de contacto', 12, 1, 'a:0:{}', 3, 1401567694, 0),
(4, 'chat', 13, 1, 'a:0:{}', 4, 1409246084, 0),
(5, 'productos menu', 14, 1, 'a:0:{}', 5, 1410291101, 0),
(6, 'redes sociales', 15, 1, 'a:0:{}', 6, 1432124604, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_work_team`
--

CREATE TABLE `default_work_team` (
  `id` int(11) NOT NULL,
  `link` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outstanding` int(1) DEFAULT '0',
  `lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `default_work_team`
--

INSERT INTO `default_work_team` (`id`, `link`, `image`, `outstanding`, `lang`) VALUES
(15, 'http://www.google.com', 'uploads/default/about_us_multiples/2fccd6c755396ab846b3eebe112a73af.png', 0, 'es'),
(17, 'http://www.google.com', 'uploads/default/about_us_multiples/e21687d4f11a7a0b022cb5f8414a1395.png', 0, 'es');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `core_domains`
--
ALTER TABLE `core_domains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`domain`),
  ADD KEY `domain` (`domain`);

--
-- Indices de la tabla `default_about_us_intro`
--
ALTER TABLE `default_about_us_intro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_about_us_multiples`
--
ALTER TABLE `default_about_us_multiples`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_about_us_partners`
--
ALTER TABLE `default_about_us_partners`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_about_us_slide`
--
ALTER TABLE `default_about_us_slide`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_contact_us`
--
ALTER TABLE `default_contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_contact_us_emails`
--
ALTER TABLE `default_contact_us_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_features`
--
ALTER TABLE `default_features`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_gallerys`
--
ALTER TABLE `default_gallerys`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_gallerys_intro`
--
ALTER TABLE `default_gallerys_intro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_gallery_categories`
--
ALTER TABLE `default_gallery_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_gallery_images`
--
ALTER TABLE `default_gallery_images`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_google_maps`
--
ALTER TABLE `default_google_maps`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_google_map_categories`
--
ALTER TABLE `default_google_map_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_history_numbers`
--
ALTER TABLE `default_history_numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_home_banner`
--
ALTER TABLE `default_home_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_home_links`
--
ALTER TABLE `default_home_links`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_home_links_intro`
--
ALTER TABLE `default_home_links_intro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_home_video_info`
--
ALTER TABLE `default_home_video_info`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_modules`
--
ALTER TABLE `default_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_people`
--
ALTER TABLE `default_people`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_permissions`
--
ALTER TABLE `default_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_process`
--
ALTER TABLE `default_process`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_process_intro`
--
ALTER TABLE `default_process_intro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_proces_categories`
--
ALTER TABLE `default_proces_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_proces_images`
--
ALTER TABLE `default_proces_images`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_projects`
--
ALTER TABLE `default_projects`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_projects_intro`
--
ALTER TABLE `default_projects_intro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_project_categories`
--
ALTER TABLE `default_project_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_project_images`
--
ALTER TABLE `default_project_images`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_services`
--
ALTER TABLE `default_services`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_services_intro`
--
ALTER TABLE `default_services_intro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `default_work_team`
--
ALTER TABLE `default_work_team`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `core_domains`
--
ALTER TABLE `core_domains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `default_about_us_intro`
--
ALTER TABLE `default_about_us_intro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `default_about_us_multiples`
--
ALTER TABLE `default_about_us_multiples`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `default_about_us_partners`
--
ALTER TABLE `default_about_us_partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `default_about_us_slide`
--
ALTER TABLE `default_about_us_slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `default_contact_us`
--
ALTER TABLE `default_contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `default_contact_us_emails`
--
ALTER TABLE `default_contact_us_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `default_features`
--
ALTER TABLE `default_features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `default_gallerys`
--
ALTER TABLE `default_gallerys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `default_gallerys_intro`
--
ALTER TABLE `default_gallerys_intro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `default_gallery_categories`
--
ALTER TABLE `default_gallery_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `default_gallery_images`
--
ALTER TABLE `default_gallery_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `default_google_maps`
--
ALTER TABLE `default_google_maps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `default_google_map_categories`
--
ALTER TABLE `default_google_map_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `default_history_numbers`
--
ALTER TABLE `default_history_numbers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `default_home_banner`
--
ALTER TABLE `default_home_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `default_home_links`
--
ALTER TABLE `default_home_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `default_home_links_intro`
--
ALTER TABLE `default_home_links_intro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `default_home_video_info`
--
ALTER TABLE `default_home_video_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `default_modules`
--
ALTER TABLE `default_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
--
-- AUTO_INCREMENT de la tabla `default_people`
--
ALTER TABLE `default_people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `default_permissions`
--
ALTER TABLE `default_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT de la tabla `default_process`
--
ALTER TABLE `default_process`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `default_process_intro`
--
ALTER TABLE `default_process_intro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `default_proces_categories`
--
ALTER TABLE `default_proces_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `default_proces_images`
--
ALTER TABLE `default_proces_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `default_projects`
--
ALTER TABLE `default_projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `default_projects_intro`
--
ALTER TABLE `default_projects_intro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `default_project_categories`
--
ALTER TABLE `default_project_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `default_project_images`
--
ALTER TABLE `default_project_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `default_services`
--
ALTER TABLE `default_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `default_services_intro`
--
ALTER TABLE `default_services_intro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `default_work_team`
--
ALTER TABLE `default_work_team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
