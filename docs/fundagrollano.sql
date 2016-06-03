-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 03-06-2016 a las 09:09:05
-- Versión del servidor: 5.5.45-cll-lve
-- Versión de PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `fundagrollano`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_domains`
--

CREATE TABLE IF NOT EXISTS `core_domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `site_id` int(11) NOT NULL,
  `type` enum('park','redirect') NOT NULL DEFAULT 'park',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`domain`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_settings`
--

CREATE TABLE IF NOT EXISTS `core_settings` (
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

CREATE TABLE IF NOT EXISTS `core_sites` (
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

CREATE TABLE IF NOT EXISTS `core_users` (
  `id` smallint(5) unsigned NOT NULL,
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

CREATE TABLE IF NOT EXISTS `default_about_us` (
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

CREATE TABLE IF NOT EXISTS `default_about_us_allies` (
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

CREATE TABLE IF NOT EXISTS `default_about_us_intro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `section` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `default_about_us_intro`
--

INSERT INTO `default_about_us_intro` (`id`, `title`, `intro`, `image`, `text`, `section`) VALUES
(1, '<strong>Trabajamos para el futuro de nuestro campo</strong>', '', 'uploads/default/about_us_multiples/67458f26ffe3e3e4d22117ca220f71eb.jpg', '<span  13px; line-height: 20.8px;"><strong>Mision</strong><br />\n<br />\nImplementar y Lograr un desarrollo agropecuario sostenible altamente tecnificado , desarrollar&nbsp;campa&ntilde;as de sensibilizaci&oacute;n y educaci&oacute;n con la poblaci&oacute;n activa con responsabilidad ambiental,&nbsp;para reconstruir la vida social de familias en la regi&oacute;n del llano.</span><br />\n<br />\n<strong>Vision</strong><br />\n<br />\nLa fundaci&oacute;n quiere una regi&oacute;n l&iacute;der, competitiva en el desarrollo productivo agropecuario y&nbsp;programas de gesti&oacute;n socio ambiental, modelo en proyectos productivos y que contribuyan al&nbsp;desarrollo rural y protecci&oacute;n del medio ambiente a nivel nacional e internacional.<br />\n<br />\n<strong>Objetivos</strong><br />\n<br />\nElaborar, fomentar, difundir, crear, promover, sostener, dirigir, y administrar modelos&nbsp;empresariales agropecuarios sostenibles, mediante desarrollo de proyectos altamente productivos&nbsp;en la regi&oacute;n del llano.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_about_us_multiples`
--

CREATE TABLE IF NOT EXISTS `default_about_us_multiples` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_unicode_ci,
  `slug` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `content` text COLLATE utf8_unicode_ci,
  `introduction` text COLLATE utf8_unicode_ci,
  `date` datetime DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `outstanding` int(1) DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_about_us_partners`
--

CREATE TABLE IF NOT EXISTS `default_about_us_partners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `default_about_us_partners`
--

INSERT INTO `default_about_us_partners` (`id`, `image`, `link`) VALUES
(6, 'uploads/default/about_us_multiples/f80c004c7a066e3e8a6ab0d7d99490c7.png', 'http://www.jcs-arqs.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_about_us_slide`
--

CREATE TABLE IF NOT EXISTS `default_about_us_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` text COLLATE utf8_unicode_ci,
  `link` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

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

CREATE TABLE IF NOT EXISTS `default_ask` (
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

CREATE TABLE IF NOT EXISTS `default_ask_allies` (
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

CREATE TABLE IF NOT EXISTS `default_ask_mail` (
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

CREATE TABLE IF NOT EXISTS `default_blog` (
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

CREATE TABLE IF NOT EXISTS `default_blog_categories` (
  `id` int(11) NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_chat`
--

CREATE TABLE IF NOT EXISTS `default_chat` (
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

CREATE TABLE IF NOT EXISTS `default_chat_assign` (
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

CREATE TABLE IF NOT EXISTS `default_chat_message` (
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

CREATE TABLE IF NOT EXISTS `default_chat_state` (
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

CREATE TABLE IF NOT EXISTS `default_ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_comments`
--

CREATE TABLE IF NOT EXISTS `default_comments` (
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

CREATE TABLE IF NOT EXISTS `default_comment_blacklists` (
  `id` int(11) NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_contact_log`
--

CREATE TABLE IF NOT EXISTS `default_contact_log` (
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

CREATE TABLE IF NOT EXISTS `default_contact_us` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

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

CREATE TABLE IF NOT EXISTS `default_contact_us_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cell` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `default_contact_us_emails`
--

INSERT INTO `default_contact_us_emails` (`id`, `name`, `email`, `phone`, `cell`, `company`, `city`, `message`, `date`, `status`, `lang`) VALUES
(18, 'Kevin', 'steverp95@outlook.es', 'Romero', NULL, 'Pepsi', 'Bogota', 'Test de Funcionamiento', '2016-06-02 11:02:39', 0, 'es'),
(19, 'Kevin', 'steverp95@outlook.es', 'Romero', NULL, 'Pepsi', 'Bogota', 'Test de Funcionamiento', '2016-06-02 11:03:01', 0, 'es'),
(20, 'Kevin', 'steverp95@outlook.es', 'Romero', NULL, 'Pepsi', 'Bogota', 'Test de Funcionamiento', '2016-06-02 11:03:22', 0, 'es'),
(21, 'Kevin', 'steverp95@outlook.es', 'Romero', NULL, 'Pepsi', 'Bogota', 'Test de Funcionamiento', '2016-06-02 11:03:42', 0, 'es'),
(22, 'Kevin', 'steverp95@outlook.es', 'Romero', NULL, 'Pepsi', 'Bogota', 'Test de Funcionamiento', '2016-06-02 11:04:03', 0, 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_contact_us_emails_area`
--

CREATE TABLE IF NOT EXISTS `default_contact_us_emails_area` (
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

CREATE TABLE IF NOT EXISTS `default_contact_us_email_products` (
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

CREATE TABLE IF NOT EXISTS `default_data_fields` (
  `id` int(11) unsigned NOT NULL,
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

CREATE TABLE IF NOT EXISTS `default_data_field_assignments` (
  `id` int(11) unsigned NOT NULL,
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

CREATE TABLE IF NOT EXISTS `default_data_streams` (
  `id` int(10) unsigned NOT NULL,
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

CREATE TABLE IF NOT EXISTS `default_data_stream_searches` (
  `id` int(11) unsigned NOT NULL,
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

CREATE TABLE IF NOT EXISTS `default_def_page_fields` (
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

CREATE TABLE IF NOT EXISTS `default_email_templates` (
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

CREATE TABLE IF NOT EXISTS `default_features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(500) NOT NULL,
  `kind` int(11) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'es',
  `id_pro` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `default_features`
--

INSERT INTO `default_features` (`id`, `text`, `kind`, `lang`, `id_pro`) VALUES
(1, 'Test de Funcionamiento', 1, 'es', 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_files`
--

CREATE TABLE IF NOT EXISTS `default_files` (
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

CREATE TABLE IF NOT EXISTS `default_file_folders` (
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

CREATE TABLE IF NOT EXISTS `default_gallerys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `name` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

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

CREATE TABLE IF NOT EXISTS `default_gallerys_categories` (
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

CREATE TABLE IF NOT EXISTS `default_gallerys_intro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(455) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `default_gallerys_intro`
--

INSERT INTO `default_gallerys_intro` (`id`, `title`, `text`, `lang`) VALUES
(1, 'GALER&Iacute;A DE <strong>IMAGENES</strong>', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure, unde, sapiente. Deserunt quos quasi eum odio voluptate asperiores eius eveniet. Labore quod suscipit hic quisquam, aperiam. Maiores quibusdam dolorum, pariatur!', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_gallery_categories`
--

CREATE TABLE IF NOT EXISTS `default_gallery_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `parent` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

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

CREATE TABLE IF NOT EXISTS `default_gallery_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) NOT NULL,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=19 ;

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

CREATE TABLE IF NOT EXISTS `default_gallery_intro` (
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

CREATE TABLE IF NOT EXISTS `default_google_maps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

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

CREATE TABLE IF NOT EXISTS `default_google_maps_categories` (
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

CREATE TABLE IF NOT EXISTS `default_google_maps_intro` (
  `id` int(11) NOT NULL,
  `text` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_google_map_categories`
--

CREATE TABLE IF NOT EXISTS `default_google_map_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `parent` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `outstanding` int(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

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

CREATE TABLE IF NOT EXISTS `default_groups` (
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

CREATE TABLE IF NOT EXISTS `default_history_numbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

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

CREATE TABLE IF NOT EXISTS `default_home_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `solution` text COLLATE utf8_unicode_ci,
  `position_text` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color_text` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

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

CREATE TABLE IF NOT EXISTS `default_home_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

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

CREATE TABLE IF NOT EXISTS `default_home_links_intro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkbanner` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titlelinkbanner` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

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

CREATE TABLE IF NOT EXISTS `default_home_video_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title1` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clientes` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `default_home_video_info`
--

INSERT INTO `default_home_video_info` (`id`, `title1`, `image`, `clientes`, `title`, `text`, `video`, `lang`) VALUES
(1, 'Producto<strong> Destacado</strong>', 'uploads/default/home_video_info/a7ca29029332349bc2af16048aafb518.jpg', '', '<b>Agrollano</b><br />\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit.&nbsp;<br />\r\n&nbsp;', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Maxime blanditiis facere animi quidem assumenda.', 'uploads/default/home_video_info/07179eadfb5ac7ec66dfe408f18bd796.mp4', 'es'),
(2, NULL, 'uploads/default/home_video_info/642dab08c82051e0abe69ffef7c1ae3a.jpg', NULL, '<strong>9</strong>Alliance', 'Lorem ipsum dolor sit amet.', 'uploads/default/home_video_info/5bb21f876bccb2654ef2d7ca0abb5bb2.mp4', 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_keywords`
--

CREATE TABLE IF NOT EXISTS `default_keywords` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_keywords_applied`
--

CREATE TABLE IF NOT EXISTS `default_keywords_applied` (
  `id` int(11) NOT NULL,
  `hash` char(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `keyword_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_migrations`
--

CREATE TABLE IF NOT EXISTS `default_migrations` (
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

CREATE TABLE IF NOT EXISTS `default_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `updated_on` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=112 ;

--
-- Volcado de datos para la tabla `default_modules`
--

INSERT INTO `default_modules` (`id`, `name`, `slug`, `version`, `type`, `description`, `skip_xss`, `is_frontend`, `is_backend`, `menu`, `enabled`, `installed`, `is_core`, `updated_on`) VALUES
(1, 'a:25:{s:2:"en";s:8:"Settings";s:2:"ar";s:18:"الإعدادات";s:2:"br";s:15:"Configurações";s:2:"pt";s:15:"Configurações";s:2:"cs";s:10:"Nastavení";s:2:"da";s:13:"Indstillinger";s:2:"de";s:13:"Einstellungen";s:2:"el";s:18:"Ρυθμίσεις";s:2:"es";s:15:"Configuraciones";s:2:"fa";s:14:"تنظیمات";s:2:"fi";s:9:"Asetukset";s:2:"fr";s:11:"Paramètres";s:2:"he";s:12:"הגדרות";s:2:"id";s:10:"Pengaturan";s:2:"it";s:12:"Impostazioni";s:2:"lt";s:10:"Nustatymai";s:2:"nl";s:12:"Instellingen";s:2:"pl";s:10:"Ustawienia";s:2:"ru";s:18:"Настройки";s:2:"sl";s:10:"Nastavitve";s:2:"tw";s:12:"網站設定";s:2:"cn";s:12:"网站设定";s:2:"hu";s:14:"Beállítások";s:2:"th";s:21:"ตั้งค่า";s:2:"se";s:14:"Inställningar";}', 'settings', '1.0.0', NULL, 'a:25:{s:2:"en";s:89:"Allows administrators to update settings like Site Name, messages and email address, etc.";s:2:"ar";s:161:"تمكن المدراء من تحديث الإعدادات كإسم الموقع، والرسائل وعناوين البريد الإلكتروني، .. إلخ.";s:2:"br";s:120:"Permite com que administradores e a equipe consigam trocar as configurações do website incluindo o nome e descrição.";s:2:"pt";s:113:"Permite com que os administradores consigam alterar as configurações do website incluindo o nome e descrição.";s:2:"cs";s:102:"Umožňuje administrátorům měnit nastavení webu jako jeho jméno, zprávy a emailovou adresu apod.";s:2:"da";s:90:"Lader administratorer opdatere indstillinger som sidenavn, beskeder og email adresse, etc.";s:2:"de";s:92:"Erlaubt es Administratoren die Einstellungen der Seite wie Name und Beschreibung zu ändern.";s:2:"el";s:230:"Επιτρέπει στους διαχειριστές να τροποποιήσουν ρυθμίσεις όπως το Όνομα του Ιστοτόπου, τα μηνύματα και τις διευθύνσεις email, κ.α.";s:2:"es";s:131:"Permite a los administradores y al personal configurar los detalles del sitio como el nombre del sitio y la descripción del mismo.";s:2:"fa";s:105:"تنظیمات سایت در این ماژول توسط ادمین هاس سایت انجام می شود";s:2:"fi";s:105:"Mahdollistaa sivuston asetusten muokkaamisen, kuten sivuston nimen, viestit ja sähköpostiosoitteet yms.";s:2:"fr";s:118:"Permet aux admistrateurs de modifier les paramètres du site : nom du site, description, messages, adresse email, etc.";s:2:"he";s:116:"ניהול הגדרות שונות של האתר כגון: שם האתר, הודעות, כתובות דואר וכו";s:2:"id";s:112:"Memungkinkan administrator untuk dapat memperbaharui pengaturan seperti nama situs, pesan dan alamat email, dsb.";s:2:"it";s:109:"Permette agli amministratori di aggiornare impostazioni quali Nome del Sito, messaggi e indirizzo email, etc.";s:2:"lt";s:104:"Leidžia administratoriams keisti puslapio vavadinimą, žinutes, administratoriaus el. pašta ir kitą.";s:2:"nl";s:114:"Maakt het administratoren en medewerkers mogelijk om websiteinstellingen zoals naam en beschrijving te veranderen.";s:2:"pl";s:103:"Umożliwia administratorom zmianę ustawień strony jak nazwa strony, opis, e-mail administratora, itd.";s:2:"ru";s:135:"Управление настройками сайта - Имя сайта, сообщения, почтовые адреса и т.п.";s:2:"sl";s:98:"Dovoljuje administratorjem posodobitev nastavitev kot je Ime strani, sporočil, email naslova itd.";s:2:"tw";s:99:"網站管理者可更新的重要網站設定。例如：網站名稱、訊息、電子郵件等。";s:2:"cn";s:99:"网站管理者可更新的重要网站设定。例如：网站名称、讯息、电子邮件等。";s:2:"hu";s:125:"Lehetővé teszi az adminok számára a beállítások frissítését, mint a weboldal neve, üzenetek, e-mail címek, stb...";s:2:"th";s:232:"ให้ผู้ดูแลระบบสามารถปรับปรุงการตั้งค่าเช่นชื่อเว็บไซต์ ข้อความและอีเมล์เป็นต้น";s:2:"se";s:84:"Administratören kan uppdatera webbplatsens titel, meddelanden och E-postadress etc.";}', 1, 0, 1, 'settings', 1, 1, 1, 1464908272),
(2, 'a:11:{s:2:"en";s:12:"Streams Core";s:2:"pt";s:14:"Núcleo Fluxos";s:2:"fr";s:10:"Noyau Flux";s:2:"el";s:23:"Πυρήνας Ροών";s:2:"se";s:18:"Streams grundmodul";s:2:"tw";s:14:"Streams 核心";s:2:"cn";s:14:"Streams 核心";s:2:"ar";s:31:"الجداول الأساسية";s:2:"it";s:12:"Streams Core";s:2:"fa";s:26:"هسته استریم ها";s:2:"fi";s:13:"Striimit ydin";}', 'streams_core', '1.0.0', NULL, 'a:11:{s:2:"en";s:29:"Core data module for streams.";s:2:"pt";s:37:"Módulo central de dados para fluxos.";s:2:"fr";s:32:"Noyau de données pour les Flux.";s:2:"el";s:113:"Προγραμματιστικός πυρήνας για την λειτουργία ροών δεδομένων.";s:2:"se";s:50:"Streams grundmodul för enklare hantering av data.";s:2:"tw";s:29:"Streams 核心資料模組。";s:2:"cn";s:29:"Streams 核心资料模组。";s:2:"ar";s:57:"وحدة البيانات الأساسية للجداول";s:2:"it";s:17:"Core dello Stream";s:2:"fa";s:48:"ماژول مرکزی برای استریم ها";s:2:"fi";s:48:"Ydin datan hallinoiva moduuli striimejä varten.";}', 1, 0, 0, '0', 1, 1, 1, 1464908272),
(3, 'a:21:{s:2:"en";s:15:"Email Templates";s:2:"ar";s:48:"قوالب الرسائل الإلكترونية";s:2:"br";s:17:"Modelos de e-mail";s:2:"pt";s:17:"Modelos de e-mail";s:2:"da";s:16:"Email skabeloner";s:2:"el";s:22:"Δυναμικά email";s:2:"es";s:19:"Plantillas de email";s:2:"fa";s:26:"قالب های ایمیل";s:2:"fr";s:17:"Modèles d''emails";s:2:"he";s:12:"תבניות";s:2:"id";s:14:"Template Email";s:2:"lt";s:22:"El. laiškų šablonai";s:2:"nl";s:15:"Email sjablonen";s:2:"ru";s:25:"Шаблоны почты";s:2:"sl";s:14:"Email predloge";s:2:"tw";s:12:"郵件範本";s:2:"cn";s:12:"邮件范本";s:2:"hu";s:15:"E-mail sablonok";s:2:"fi";s:25:"Sähköposti viestipohjat";s:2:"th";s:33:"แม่แบบอีเมล";s:2:"se";s:12:"E-postmallar";}', 'templates', '1.1.0', NULL, 'a:21:{s:2:"en";s:46:"Create, edit, and save dynamic email templates";s:2:"ar";s:97:"أنشئ، عدّل واحفظ قوالب البريد الإلكترني الديناميكية.";s:2:"br";s:51:"Criar, editar e salvar modelos de e-mail dinâmicos";s:2:"pt";s:51:"Criar, editar e salvar modelos de e-mail dinâmicos";s:2:"da";s:49:"Opret, redigér og gem dynamiske emailskabeloner.";s:2:"el";s:108:"Δημιουργήστε, επεξεργαστείτε και αποθηκεύστε δυναμικά email.";s:2:"es";s:54:"Crear, editar y guardar plantillas de email dinámicas";s:2:"fa";s:92:"ایحاد، ویرایش و ذخیره ی قالب های ایمیل به صورت پویا";s:2:"fr";s:61:"Créer, éditer et sauver dynamiquement des modèles d''emails";s:2:"he";s:54:"ניהול של תבניות דואר אלקטרוני";s:2:"id";s:55:"Membuat, mengedit, dan menyimpan template email dinamis";s:2:"lt";s:58:"Kurk, tvarkyk ir saugok dinaminius el. laiškų šablonus.";s:2:"nl";s:49:"Maak, bewerk, en beheer dynamische emailsjablonen";s:2:"ru";s:127:"Создавайте, редактируйте и сохраняйте динамические почтовые шаблоны";s:2:"sl";s:52:"Ustvari, uredi in shrani spremenljive email predloge";s:2:"tw";s:61:"新增、編輯與儲存可顯示動態資料的 email 範本";s:2:"cn";s:61:"新增、编辑与储存可显示动态资料的 email 范本";s:2:"hu";s:63:"Csináld, szerkeszd és mentsd el a dinamikus e-mail sablonokat";s:2:"fi";s:66:"Lisää, muokkaa ja tallenna dynaamisia sähköposti viestipohjia.";s:2:"th";s:129:"การสร้างแก้ไขและบันทึกแม่แบบอีเมลแบบไดนามิก";s:2:"se";s:49:"Skapa, redigera och spara dynamiska E-postmallar.";}', 1, 0, 1, 'structure', 1, 1, 1, 1464908272),
(4, 'a:25:{s:2:"en";s:7:"Add-ons";s:2:"ar";s:16:"الإضافات";s:2:"br";s:12:"Complementos";s:2:"pt";s:12:"Complementos";s:2:"cs";s:8:"Doplňky";s:2:"da";s:7:"Add-ons";s:2:"de";s:13:"Erweiterungen";s:2:"el";s:16:"Πρόσθετα";s:2:"es";s:9:"Agregados";s:2:"fa";s:17:"افزونه ها";s:2:"fi";s:9:"Lisäosat";s:2:"fr";s:10:"Extensions";s:2:"he";s:12:"תוספות";s:2:"id";s:7:"Pengaya";s:2:"it";s:7:"Add-ons";s:2:"lt";s:7:"Priedai";s:2:"nl";s:7:"Add-ons";s:2:"pl";s:12:"Rozszerzenia";s:2:"ru";s:20:"Дополнения";s:2:"sl";s:11:"Razširitve";s:2:"tw";s:12:"附加模組";s:2:"cn";s:12:"附加模组";s:2:"hu";s:14:"Bővítmények";s:2:"th";s:27:"ส่วนเสริม";s:2:"se";s:8:"Tillägg";}', 'addons', '2.0.0', NULL, 'a:25:{s:2:"en";s:59:"Allows admins to see a list of currently installed modules.";s:2:"ar";s:91:"تُمكّن المُدراء من معاينة جميع الوحدات المُثبّتة.";s:2:"br";s:75:"Permite aos administradores ver a lista dos módulos instalados atualmente.";s:2:"pt";s:75:"Permite aos administradores ver a lista dos módulos instalados atualmente.";s:2:"cs";s:68:"Umožňuje administrátorům vidět seznam nainstalovaných modulů.";s:2:"da";s:63:"Lader administratorer se en liste over de installerede moduler.";s:2:"de";s:56:"Zeigt Administratoren alle aktuell installierten Module.";s:2:"el";s:152:"Επιτρέπει στους διαχειριστές να προβάλουν μια λίστα των εγκατεστημένων πρόσθετων.";s:2:"es";s:71:"Permite a los administradores ver una lista de los módulos instalados.";s:2:"fa";s:93:"مشاهده لیست افزونه ها و مدیریت آنها برای ادمین سایت";s:2:"fi";s:60:"Listaa järjestelmänvalvojalle käytössä olevat moduulit.";s:2:"fr";s:66:"Permet aux administrateurs de voir la liste des modules installés";s:2:"he";s:160:"נותן אופציה למנהל לראות רשימה של המודולים אשר מותקנים כעת באתר או להתקין מודולים נוספים";s:2:"id";s:57:"Memperlihatkan kepada admin daftar modul yang terinstall.";s:2:"it";s:83:"Permette agli amministratori di vedere una lista dei moduli attualmente installati.";s:2:"lt";s:75:"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.";s:2:"nl";s:79:"Stelt admins in staat om een overzicht van geinstalleerde modules te genereren.";s:2:"pl";s:81:"Umożliwiają administratorowi wgląd do listy obecnie zainstalowanych modułów.";s:2:"ru";s:83:"Список модулей, которые установлены на сайте.";s:2:"sl";s:65:"Dovoljuje administratorjem pregled trenutno nameščenih modulov.";s:2:"tw";s:54:"管理員可以檢視目前已經安裝模組的列表";s:2:"cn";s:54:"管理员可以检视目前已经安装模组的列表";s:2:"hu";s:79:"Lehetővé teszi az adminoknak, hogy lássák a telepített modulok listáját.";s:2:"th";s:162:"ช่วยให้ผู้ดูแลระบบดูรายการของโมดูลที่ติดตั้งในปัจจุบัน";s:2:"se";s:67:"Gör det möjligt för administratören att se installerade mouler.";}', 0, 0, 1, '0', 1, 1, 1, 1464908272),
(5, 'a:17:{s:2:"en";s:4:"Blog";s:2:"ar";s:16:"المدوّنة";s:2:"br";s:4:"Blog";s:2:"pt";s:4:"Blog";s:2:"el";s:18:"Ιστολόγιο";s:2:"fa";s:8:"بلاگ";s:2:"he";s:8:"בלוג";s:2:"id";s:4:"Blog";s:2:"lt";s:6:"Blogas";s:2:"pl";s:4:"Blog";s:2:"ru";s:8:"Блог";s:2:"tw";s:6:"文章";s:2:"cn";s:6:"文章";s:2:"hu";s:4:"Blog";s:2:"fi";s:5:"Blogi";s:2:"th";s:15:"บล็อก";s:2:"se";s:5:"Blogg";}', 'blog', '2.0.0', NULL, 'a:25:{s:2:"en";s:18:"Post blog entries.";s:2:"ar";s:48:"أنشر المقالات على مدوّنتك.";s:2:"br";s:30:"Escrever publicações de blog";s:2:"pt";s:39:"Escrever e editar publicações no blog";s:2:"cs";s:49:"Publikujte nové články a příspěvky na blog.";s:2:"da";s:17:"Skriv blogindlæg";s:2:"de";s:47:"Veröffentliche neue Artikel und Blog-Einträge";s:2:"sl";s:23:"Objavite blog prispevke";s:2:"fi";s:28:"Kirjoita blogi artikkeleita.";s:2:"el";s:93:"Δημιουργήστε άρθρα και εγγραφές στο ιστολόγιο σας.";s:2:"es";s:54:"Escribe entradas para los artículos y blog (web log).";s:2:"fa";s:44:"مقالات منتشر شده در بلاگ";s:2:"fr";s:34:"Poster des articles d''actualités.";s:2:"he";s:19:"ניהול בלוג";s:2:"id";s:15:"Post entri blog";s:2:"it";s:36:"Pubblica notizie e post per il blog.";s:2:"lt";s:40:"Rašykite naujienas bei blog''o įrašus.";s:2:"nl";s:41:"Post nieuwsartikelen en blogs op uw site.";s:2:"pl";s:27:"Dodawaj nowe wpisy na blogu";s:2:"ru";s:49:"Управление записями блога.";s:2:"tw";s:42:"發表新聞訊息、部落格等文章。";s:2:"cn";s:42:"发表新闻讯息、部落格等文章。";s:2:"th";s:48:"โพสต์รายการบล็อก";s:2:"hu";s:32:"Blog bejegyzések létrehozása.";s:2:"se";s:18:"Inlägg i bloggen.";}', 1, 1, 1, 'content', 0, 1, 1, 1464908272),
(6, 'a:25:{s:2:"en";s:8:"Comments";s:2:"ar";s:18:"التعليقات";s:2:"br";s:12:"Comentários";s:2:"pt";s:12:"Comentários";s:2:"cs";s:11:"Komentáře";s:2:"da";s:11:"Kommentarer";s:2:"de";s:10:"Kommentare";s:2:"el";s:12:"Σχόλια";s:2:"es";s:11:"Comentarios";s:2:"fi";s:9:"Kommentit";s:2:"fr";s:12:"Commentaires";s:2:"fa";s:10:"نظرات";s:2:"he";s:12:"תגובות";s:2:"id";s:8:"Komentar";s:2:"it";s:8:"Commenti";s:2:"lt";s:10:"Komentarai";s:2:"nl";s:8:"Reacties";s:2:"pl";s:10:"Komentarze";s:2:"ru";s:22:"Комментарии";s:2:"sl";s:10:"Komentarji";s:2:"tw";s:6:"回應";s:2:"cn";s:6:"回应";s:2:"hu";s:16:"Hozzászólások";s:2:"th";s:33:"ความคิดเห็น";s:2:"se";s:11:"Kommentarer";}', 'comments', '1.1.0', NULL, 'a:25:{s:2:"en";s:76:"Users and guests can write comments for content like blog, pages and photos.";s:2:"ar";s:152:"يستطيع الأعضاء والزوّار كتابة التعليقات على المُحتوى كالأخبار، والصفحات والصّوَر.";s:2:"br";s:97:"Usuários e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.";s:2:"pt";s:100:"Utilizadores e convidados podem escrever comentários para quase tudo com suporte nativo ao captcha.";s:2:"cs";s:100:"Uživatelé a hosté mohou psát komentáře k obsahu, např. neovinkám, stránkám a fotografiím.";s:2:"da";s:83:"Brugere og besøgende kan skrive kommentarer til indhold som blog, sider og fotoer.";s:2:"de";s:65:"Benutzer und Gäste können für fast alles Kommentare schreiben.";s:2:"el";s:224:"Οι χρήστες και οι επισκέπτες μπορούν να αφήνουν σχόλια για περιεχόμενο όπως το ιστολόγιο, τις σελίδες και τις φωτογραφίες.";s:2:"es";s:130:"Los usuarios y visitantes pueden escribir comentarios en casi todo el contenido con el soporte de un sistema de captcha incluído.";s:2:"fa";s:168:"کاربران و مهمان ها می توانند نظرات خود را بر روی محتوای سایت در بلاگ و دیگر قسمت ها ارائه دهند";s:2:"fi";s:107:"Käyttäjät ja vieraat voivat kirjoittaa kommentteja eri sisältöihin kuten uutisiin, sivuihin ja kuviin.";s:2:"fr";s:130:"Les utilisateurs et les invités peuvent écrire des commentaires pour quasiment tout grâce au générateur de captcha intégré.";s:2:"he";s:94:"משתמשי האתר יכולים לרשום תגובות למאמרים, תמונות וכו";s:2:"id";s:100:"Pengguna dan pengunjung dapat menuliskan komentaruntuk setiap konten seperti blog, halaman dan foto.";s:2:"it";s:85:"Utenti e visitatori possono scrivere commenti ai contenuti quali blog, pagine e foto.";s:2:"lt";s:75:"Vartotojai ir svečiai gali komentuoti jūsų naujienas, puslapius ar foto.";s:2:"nl";s:52:"Gebruikers en gasten kunnen reageren op bijna alles.";s:2:"pl";s:93:"Użytkownicy i goście mogą dodawać komentarze z wbudowanym systemem zabezpieczeń captcha.";s:2:"ru";s:187:"Пользователи и гости могут добавлять комментарии к новостям, информационным страницам и фотографиям.";s:2:"sl";s:89:"Uporabniki in obiskovalci lahko vnesejo komentarje na vsebino kot je blok, stra ali slike";s:2:"tw";s:75:"用戶和訪客可以針對新聞、頁面與照片等內容發表回應。";s:2:"cn";s:75:"用户和访客可以针对新闻、页面与照片等内容发表回应。";s:2:"hu";s:117:"A felhasználók és a vendégek hozzászólásokat írhatnak a tartalomhoz (bejegyzésekhez, oldalakhoz, fotókhoz).";s:2:"th";s:240:"ผู้ใช้งานและผู้เยี่ยมชมสามารถเขียนความคิดเห็นในเนื้อหาของหน้าเว็บบล็อกและภาพถ่าย";s:2:"se";s:98:"Användare och besökare kan skriva kommentarer till innehåll som blogginlägg, sidor och bilder.";}', 0, 0, 1, 'content', 0, 1, 1, 1464908272),
(105, 'a:25:{s:2:"en";s:7:"Contact";s:2:"ar";s:14:"الإتصال";s:2:"br";s:7:"Contato";s:2:"pt";s:8:"Contacto";s:2:"cs";s:7:"Kontakt";s:2:"da";s:7:"Kontakt";s:2:"de";s:7:"Kontakt";s:2:"el";s:22:"Επικοινωνία";s:2:"es";s:8:"Contacto";s:2:"fa";s:18:"تماس با ما";s:2:"fi";s:13:"Ota yhteyttä";s:2:"fr";s:7:"Contact";s:2:"he";s:17:"יצירת קשר";s:2:"id";s:6:"Kontak";s:2:"it";s:10:"Contattaci";s:2:"lt";s:18:"Kontaktinė formą";s:2:"nl";s:7:"Contact";s:2:"pl";s:7:"Kontakt";s:2:"ru";s:27:"Обратная связь";s:2:"sl";s:7:"Kontakt";s:2:"tw";s:12:"聯絡我們";s:2:"cn";s:12:"联络我们";s:2:"hu";s:9:"Kapcsolat";s:2:"th";s:18:"ติดต่อ";s:2:"se";s:7:"Kontakt";}', 'contact', '1.0.0', NULL, 'a:25:{s:2:"en";s:112:"Adds a form to your site that allows visitors to send emails to you without disclosing an email address to them.";s:2:"ar";s:157:"إضافة استمارة إلى موقعك تُمكّن الزوّار من مراسلتك دون علمهم بعنوان البريد الإلكتروني.";s:2:"br";s:139:"Adiciona um formulário para o seu site permitir aos visitantes que enviem e-mails para voce sem divulgar um endereço de e-mail para eles.";s:2:"pt";s:116:"Adiciona um formulário ao seu site que permite aos visitantes enviarem e-mails sem divulgar um endereço de e-mail.";s:2:"cs";s:149:"Přidá na web kontaktní formulář pro návštěvníky a uživatele, díky kterému vás mohou kontaktovat i bez znalosti vaší e-mailové adresy.";s:2:"da";s:123:"Tilføjer en formular på din side som tillader besøgende at sende mails til dig, uden at du skal opgive din email-adresse";s:2:"de";s:119:"Fügt ein Formular hinzu, welches Besuchern erlaubt Emails zu schreiben, ohne die Kontakt Email-Adresse offen zu legen.";s:2:"el";s:273:"Προσθέτει μια φόρμα στον ιστότοπό σας που επιτρέπει σε επισκέπτες να σας στέλνουν μηνύμα μέσω email χωρίς να τους αποκαλύπτεται η διεύθυνση του email σας.";s:2:"fa";s:239:"فرم تماس را به سایت اضافه می کند تا مراجعین بتوانند بدون اینکه ایمیل شما را بدانند برای شما پیغام هایی را از طریق ایمیل ارسال نمایند.";s:2:"es";s:156:"Añade un formulario a tu sitio que permitirá a los visitantes enviarte correos electrónicos a ti sin darles tu dirección de correo directamente a ellos.";s:2:"fi";s:128:"Luo lomakkeen sivustollesi, josta kävijät voivat lähettää sähköpostia tietämättä vastaanottajan sähköpostiosoitetta.";s:2:"fr";s:122:"Ajoute un formulaire à votre site qui permet aux visiteurs de vous envoyer un e-mail sans révéler votre adresse e-mail.";s:2:"he";s:155:"מוסיף תופס יצירת קשר לאתר על מנת לא לחסוף כתובת דואר האלקטרוני של האתר למנועי פרסומות";s:2:"id";s:149:"Menambahkan formulir ke dalam situs Anda yang memungkinkan pengunjung untuk mengirimkan email kepada Anda tanpa memberikan alamat email kepada mereka";s:2:"it";s:119:"Aggiunge un modulo al tuo sito che permette ai visitatori di inviarti email senza mostrare loro il tuo indirizzo email.";s:2:"lt";s:124:"Prideda jūsų puslapyje formą leidžianti lankytojams siūsti jums el. laiškus neatskleidžiant jūsų el. pašto adreso.";s:2:"nl";s:125:"Voegt een formulier aan de site toe waarmee bezoekers een email kunnen sturen, zonder dat u ze een emailadres hoeft te tonen.";s:2:"pl";s:126:"Dodaje formularz kontaktowy do Twojej strony, który pozwala użytkownikom wysłanie maila za pomocą formularza kontaktowego.";s:2:"ru";s:234:"Добавляет форму обратной связи на сайт, через которую посетители могут отправлять вам письма, при этом адрес Email остаётся скрыт.";s:2:"sl";s:113:"Dodaj obrazec za kontakt da vam lahko obiskovalci pošljejo sporočilo brez da bi jim razkrili vaš email naslov.";s:2:"tw";s:147:"為您的網站新增「聯絡我們」的功能，對訪客是較為清楚便捷的聯絡方式，也無須您將電子郵件公開在網站上。";s:2:"cn";s:147:"为您的网站新增“联络我们”的功能，对访客是较为清楚便捷的联络方式，也无须您将电子邮件公开在网站上。";s:2:"th";s:316:"เพิ่มแบบฟอร์มในเว็บไซต์ของคุณ ช่วยให้ผู้เยี่ยมชมสามารถส่งอีเมลถึงคุณโดยไม่ต้องเปิดเผยที่อยู่อีเมลของพวกเขา";s:2:"hu";s:156:"Létrehozható vele olyan űrlap, amely lehetővé teszi a látogatók számára, hogy e-mailt küldjenek neked úgy, hogy nem feded fel az e-mail címedet.";s:2:"se";s:53:"Lägger till ett kontaktformulär till din webbplats.";}', 0, 0, 0, '0', 1, 1, 1, 1464908272),
(8, 'a:8:{s:2:"en";s:7:"Domains";s:2:"el";s:7:"Domains";s:2:"fr";s:8:"Domaines";s:2:"se";s:8:"Domäner";s:2:"it";s:6:"Domini";s:2:"ar";s:27:"أسماء النطاقات";s:2:"tw";s:6:"網域";s:2:"cn";s:6:"网域";}', 'domains', '1.0.0', NULL, 'a:8:{s:2:"en";s:39:"Create domain aliases for your website.";s:2:"el";s:91:"Διαχειριστείτε συνώνυμα domain για τον ιστότοπό σας.";s:2:"fr";s:47:"Créer des alias de domaine pour votre site web";s:2:"se";s:36:"Skapa domänalias för din webbplats";s:2:"it";s:26:"Crea alias per il tuo sito";s:2:"ar";s:57:"أنشئ أسماء نطاقات بديلة لموقعك.";s:2:"tw";s:33:"為您的網站建立網域別名";s:2:"cn";s:33:"为您的网站建立网域别名";}', 0, 0, 1, 'structure', 1, 1, 1, 1464908272),
(9, 'a:24:{s:2:"en";s:5:"Files";s:2:"ar";s:16:"الملفّات";s:2:"br";s:8:"Arquivos";s:2:"pt";s:9:"Ficheiros";s:2:"cs";s:7:"Soubory";s:2:"da";s:5:"Filer";s:2:"de";s:7:"Dateien";s:2:"el";s:12:"Αρχεία";s:2:"es";s:8:"Archivos";s:2:"fa";s:13:"فایل ها";s:2:"fi";s:9:"Tiedostot";s:2:"fr";s:8:"Fichiers";s:2:"he";s:10:"קבצים";s:2:"id";s:4:"File";s:2:"it";s:4:"File";s:2:"lt";s:6:"Failai";s:2:"nl";s:9:"Bestanden";s:2:"ru";s:10:"Файлы";s:2:"sl";s:8:"Datoteke";s:2:"tw";s:6:"檔案";s:2:"cn";s:6:"档案";s:2:"hu";s:7:"Fájlok";s:2:"th";s:12:"ไฟล์";s:2:"se";s:5:"Filer";}', 'files', '2.0.0', NULL, 'a:24:{s:2:"en";s:40:"Manages files and folders for your site.";s:2:"ar";s:50:"إدارة ملفات ومجلّدات موقعك.";s:2:"br";s:53:"Permite gerenciar facilmente os arquivos de seu site.";s:2:"pt";s:59:"Permite gerir facilmente os ficheiros e pastas do seu site.";s:2:"cs";s:43:"Spravujte soubory a složky na vašem webu.";s:2:"da";s:41:"Administrer filer og mapper for dit site.";s:2:"de";s:35:"Verwalte Dateien und Verzeichnisse.";s:2:"el";s:100:"Διαχειρίζεται αρχεία και φακέλους για το ιστότοπό σας.";s:2:"es";s:43:"Administra archivos y carpetas en tu sitio.";s:2:"fa";s:79:"مدیریت فایل های چند رسانه ای و فولدر ها سایت";s:2:"fi";s:43:"Hallitse sivustosi tiedostoja ja kansioita.";s:2:"fr";s:46:"Gérer les fichiers et dossiers de votre site.";s:2:"he";s:47:"ניהול תיקיות וקבצים שבאתר";s:2:"id";s:42:"Mengatur file dan folder dalam situs Anda.";s:2:"it";s:38:"Gestisci file e cartelle del tuo sito.";s:2:"lt";s:28:"Katalogų ir bylų valdymas.";s:2:"nl";s:41:"Beheer bestanden en mappen op uw website.";s:2:"ru";s:78:"Управление файлами и папками вашего сайта.";s:2:"sl";s:38:"Uredi datoteke in mape na vaši strani";s:2:"tw";s:33:"管理網站中的檔案與目錄";s:2:"cn";s:33:"管理网站中的档案与目录";s:2:"hu";s:41:"Fájlok és mappák kezelése az oldalon.";s:2:"th";s:141:"บริหารจัดการไฟล์และโฟลเดอร์สำหรับเว็บไซต์ของคุณ";s:2:"se";s:45:"Hanterar filer och mappar för din webbplats.";}', 0, 0, 1, 'content', 0, 1, 1, 1464908272),
(10, 'a:24:{s:2:"en";s:6:"Groups";s:2:"ar";s:18:"المجموعات";s:2:"br";s:6:"Grupos";s:2:"pt";s:6:"Grupos";s:2:"cs";s:7:"Skupiny";s:2:"da";s:7:"Grupper";s:2:"de";s:7:"Gruppen";s:2:"el";s:12:"Ομάδες";s:2:"es";s:6:"Grupos";s:2:"fa";s:13:"گروه ها";s:2:"fi";s:7:"Ryhmät";s:2:"fr";s:7:"Groupes";s:2:"he";s:12:"קבוצות";s:2:"id";s:4:"Grup";s:2:"it";s:6:"Gruppi";s:2:"lt";s:7:"Grupės";s:2:"nl";s:7:"Groepen";s:2:"ru";s:12:"Группы";s:2:"sl";s:7:"Skupine";s:2:"tw";s:6:"群組";s:2:"cn";s:6:"群组";s:2:"hu";s:9:"Csoportok";s:2:"th";s:15:"กลุ่ม";s:2:"se";s:7:"Grupper";}', 'groups', '1.0.0', NULL, 'a:24:{s:2:"en";s:54:"Users can be placed into groups to manage permissions.";s:2:"ar";s:100:"يمكن وضع المستخدمين في مجموعات لتسهيل إدارة صلاحياتهم.";s:2:"br";s:72:"Usuários podem ser inseridos em grupos para gerenciar suas permissões.";s:2:"pt";s:74:"Utilizadores podem ser inseridos em grupos para gerir as suas permissões.";s:2:"cs";s:77:"Uživatelé mohou být rozřazeni do skupin pro lepší správu oprávnění.";s:2:"da";s:49:"Brugere kan inddeles i grupper for adgangskontrol";s:2:"de";s:85:"Benutzer können zu Gruppen zusammengefasst werden um diesen Zugriffsrechte zu geben.";s:2:"el";s:168:"Οι χρήστες μπορούν να τοποθετηθούν σε ομάδες και έτσι να διαχειριστείτε τα δικαιώματά τους.";s:2:"es";s:75:"Los usuarios podrán ser colocados en grupos para administrar sus permisos.";s:2:"fa";s:149:"کاربرها می توانند در گروه های ساماندهی شوند تا بتوان اجازه های مختلفی را ایجاد کرد";s:2:"fi";s:84:"Käyttäjät voidaan liittää ryhmiin, jotta käyttöoikeuksia voidaan hallinnoida.";s:2:"fr";s:82:"Les utilisateurs peuvent appartenir à des groupes afin de gérer les permissions.";s:2:"he";s:62:"נותן אפשרות לאסוף משתמשים לקבוצות";s:2:"id";s:68:"Pengguna dapat dikelompokkan ke dalam grup untuk mengatur perizinan.";s:2:"it";s:69:"Gli utenti possono essere inseriti in gruppi per gestirne i permessi.";s:2:"lt";s:67:"Vartotojai gali būti priskirti grupei tam, kad valdyti jų teises.";s:2:"nl";s:73:"Gebruikers kunnen in groepen geplaatst worden om rechten te kunnen geven.";s:2:"ru";s:134:"Пользователей можно объединять в группы, для управления правами доступа.";s:2:"sl";s:64:"Uporabniki so lahko razvrščeni v skupine za urejanje dovoljenj";s:2:"tw";s:45:"用戶可以依群組分類並管理其權限";s:2:"cn";s:45:"用户可以依群组分类并管理其权限";s:2:"hu";s:73:"A felhasználók csoportokba rendezhetőek a jogosultságok kezelésére.";s:2:"th";s:84:"สามารถวางผู้ใช้ลงในกลุ่มเพื่";s:2:"se";s:76:"Användare kan delas in i grupper för att hantera roller och behörigheter.";}', 0, 0, 1, 'users', 1, 1, 1, 1464908272),
(11, 'a:17:{s:2:"en";s:8:"Keywords";s:2:"ar";s:21:"كلمات البحث";s:2:"br";s:14:"Palavras-chave";s:2:"pt";s:14:"Palavras-chave";s:2:"da";s:9:"Nøgleord";s:2:"el";s:27:"Λέξεις Κλειδιά";s:2:"fa";s:21:"کلمات کلیدی";s:2:"fr";s:10:"Mots-Clés";s:2:"id";s:10:"Kata Kunci";s:2:"nl";s:14:"Sleutelwoorden";s:2:"tw";s:6:"鍵詞";s:2:"cn";s:6:"键词";s:2:"hu";s:11:"Kulcsszavak";s:2:"fi";s:10:"Avainsanat";s:2:"sl";s:15:"Ključne besede";s:2:"th";s:15:"คำค้น";s:2:"se";s:9:"Nyckelord";}', 'keywords', '1.1.0', NULL, 'a:17:{s:2:"en";s:71:"Maintain a central list of keywords to label and organize your content.";s:2:"ar";s:124:"أنشئ مجموعة من كلمات البحث التي تستطيع من خلالها وسم وتنظيم المحتوى.";s:2:"br";s:85:"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.";s:2:"pt";s:85:"Mantém uma lista central de palavras-chave para rotular e organizar o seu conteúdo.";s:2:"da";s:72:"Vedligehold en central liste af nøgleord for at organisere dit indhold.";s:2:"el";s:181:"Συντηρεί μια κεντρική λίστα από λέξεις κλειδιά για να οργανώνετε μέσω ετικετών το περιεχόμενό σας.";s:2:"fa";s:110:"حفظ و نگهداری لیست مرکزی از کلمات کلیدی برای سازماندهی محتوا";s:2:"fr";s:87:"Maintenir une liste centralisée de Mots-Clés pour libeller et organiser vos contenus.";s:2:"id";s:71:"Memantau daftar kata kunci untuk melabeli dan mengorganisasikan konten.";s:2:"nl";s:91:"Beheer een centrale lijst van sleutelwoorden om uw content te categoriseren en organiseren.";s:2:"tw";s:64:"集中管理可用於標題與內容的鍵詞(keywords)列表。";s:2:"cn";s:64:"集中管理可用于标题与内容的键词(keywords)列表。";s:2:"hu";s:65:"Ez egy központi kulcsszó lista a cimkékhez és a tartalmakhoz.";s:2:"fi";s:92:"Hallinnoi keskitettyä listaa avainsanoista merkitäksesi ja järjestelläksesi sisältöä.";s:2:"sl";s:82:"Vzdržuj centralni seznam ključnih besed za označevanje in ogranizacijo vsebine.";s:2:"th";s:189:"ศูนย์กลางการปรับปรุงคำค้นในการติดฉลากและจัดระเบียบเนื้อหาของคุณ";s:2:"se";s:61:"Hantera nyckelord för att organisera webbplatsens innehåll.";}', 0, 0, 1, 'data', 1, 1, 1, 1464908272),
(12, 'a:15:{s:2:"en";s:11:"Maintenance";s:2:"pt";s:12:"Manutenção";s:2:"ar";s:14:"الصيانة";s:2:"el";s:18:"Συντήρηση";s:2:"hu";s:13:"Karbantartás";s:2:"fa";s:15:"نگه داری";s:2:"fi";s:9:"Ylläpito";s:2:"fr";s:11:"Maintenance";s:2:"id";s:12:"Pemeliharaan";s:2:"it";s:12:"Manutenzione";s:2:"se";s:10:"Underhåll";s:2:"sl";s:12:"Vzdrževanje";s:2:"th";s:39:"การบำรุงรักษา";s:2:"tw";s:6:"維護";s:2:"cn";s:6:"维护";}', 'maintenance', '1.0.0', NULL, 'a:15:{s:2:"en";s:63:"Manage the site cache and export information from the database.";s:2:"pt";s:68:"Gerir o cache do seu site e exportar informações da base de dados.";s:2:"ar";s:81:"حذف عناصر الذاكرة المخبأة عبر واجهة الإدارة.";s:2:"el";s:142:"Διαγραφή αντικειμένων προσωρινής αποθήκευσης μέσω της περιοχής διαχείρισης.";s:2:"id";s:60:"Mengatur cache situs dan mengexport informasi dari database.";s:2:"it";s:65:"Gestisci la cache del sito e esporta le informazioni dal database";s:2:"fa";s:73:"مدیریت کش سایت و صدور اطلاعات از دیتابیس";s:2:"fr";s:71:"Gérer le cache du site et exporter les contenus de la base de données";s:2:"fi";s:59:"Hallinoi sivuston välimuistia ja vie tietoa tietokannasta.";s:2:"hu";s:66:"Az oldal gyorsítótár kezelése és az adatbázis exportálása.";s:2:"se";s:76:"Underhåll webbplatsens cache och exportera data från webbplatsens databas.";s:2:"sl";s:69:"Upravljaj s predpomnilnikom strani (cache) in izvozi podatke iz baze.";s:2:"th";s:150:"การจัดการแคชเว็บไซต์และข้อมูลการส่งออกจากฐานข้อมูล";s:2:"tw";s:45:"經由管理介面手動刪除暫存資料。";s:2:"cn";s:45:"经由管理介面手动删除暂存资料。";}', 0, 0, 1, 'data', 1, 1, 1, 1464908272),
(13, 'a:25:{s:2:"en";s:10:"Navigation";s:2:"ar";s:14:"الروابط";s:2:"br";s:11:"Navegação";s:2:"pt";s:11:"Navegação";s:2:"cs";s:8:"Navigace";s:2:"da";s:10:"Navigation";s:2:"de";s:10:"Navigation";s:2:"el";s:16:"Πλοήγηση";s:2:"es";s:11:"Navegación";s:2:"fa";s:11:"منو ها";s:2:"fi";s:10:"Navigointi";s:2:"fr";s:10:"Navigation";s:2:"he";s:10:"ניווט";s:2:"id";s:8:"Navigasi";s:2:"it";s:11:"Navigazione";s:2:"lt";s:10:"Navigacija";s:2:"nl";s:9:"Navigatie";s:2:"pl";s:9:"Nawigacja";s:2:"ru";s:18:"Навигация";s:2:"sl";s:10:"Navigacija";s:2:"tw";s:12:"導航選單";s:2:"cn";s:12:"导航选单";s:2:"th";s:36:"ตัวช่วยนำทาง";s:2:"hu";s:11:"Navigáció";s:2:"se";s:10:"Navigation";}', 'navigation', '1.1.0', NULL, 'a:25:{s:2:"en";s:78:"Manage links on navigation menus and all the navigation groups they belong to.";s:2:"ar";s:85:"إدارة روابط وقوائم ومجموعات الروابط في الموقع.";s:2:"br";s:91:"Gerenciar links do menu de navegação e todos os grupos de navegação pertencentes a ele.";s:2:"pt";s:93:"Gerir todos os grupos dos menus de navegação e os links de navegação pertencentes a eles.";s:2:"cs";s:73:"Správa odkazů v navigaci a všech souvisejících navigačních skupin.";s:2:"da";s:82:"Håndtér links på navigationsmenuerne og alle navigationsgrupperne de tilhører.";s:2:"de";s:76:"Verwalte Links in Navigationsmenüs und alle zugehörigen Navigationsgruppen";s:2:"el";s:207:"Διαχειριστείτε τους συνδέσμους στα μενού πλοήγησης και όλες τις ομάδες συνδέσμων πλοήγησης στις οποίες ανήκουν.";s:2:"es";s:102:"Administra links en los menús de navegación y en todos los grupos de navegación al cual pertenecen.";s:2:"fa";s:68:"مدیریت منو ها و گروه های مربوط به آنها";s:2:"fi";s:91:"Hallitse linkkejä navigointi valikoissa ja kaikkia navigointi ryhmiä, joihin ne kuuluvat.";s:2:"fr";s:97:"Gérer les liens du menu Navigation et tous les groupes de navigation auxquels ils appartiennent.";s:2:"he";s:73:"ניהול שלוחות תפריטי ניווט וקבוצות ניווט";s:2:"id";s:73:"Mengatur tautan pada menu navigasi dan semua pengelompokan grup navigasi.";s:2:"it";s:97:"Gestisci i collegamenti dei menu di navigazione e tutti i gruppi di navigazione da cui dipendono.";s:2:"lt";s:95:"Tvarkyk nuorodas navigacijų menių ir visas navigacijų grupes kurioms tos nuorodos priklauso.";s:2:"nl";s:92:"Beheer koppelingen op de navigatiemenu&apos;s en alle navigatiegroepen waar ze onder vallen.";s:2:"pl";s:95:"Zarządzaj linkami w menu nawigacji oraz wszystkimi grupami nawigacji do których one należą.";s:2:"ru";s:136:"Управление ссылками в меню навигации и группах, к которым они принадлежат.";s:2:"sl";s:64:"Uredi povezave v meniju in vse skupine povezav ki jim pripadajo.";s:2:"tw";s:72:"管理導航選單中的連結，以及它們所隸屬的導航群組。";s:2:"cn";s:72:"管理导航选单中的连结，以及它们所隶属的导航群组。";s:2:"th";s:108:"จัดการการเชื่อมโยงนำทางและกลุ่มนำทาง";s:2:"se";s:33:"Hantera länkar och länkgrupper.";s:2:"hu";s:100:"Linkek kezelése a navigációs menükben és a navigációs csoportok kezelése, amikhez tartoznak.";}', 0, 0, 1, 'structure', 1, 1, 1, 1464908272),
(14, 'a:25:{s:2:"en";s:5:"Pages";s:2:"ar";s:14:"الصفحات";s:2:"br";s:8:"Páginas";s:2:"pt";s:8:"Páginas";s:2:"cs";s:8:"Stránky";s:2:"da";s:5:"Sider";s:2:"de";s:6:"Seiten";s:2:"el";s:14:"Σελίδες";s:2:"es";s:8:"Páginas";s:2:"fa";s:14:"صفحه ها ";s:2:"fi";s:5:"Sivut";s:2:"fr";s:5:"Pages";s:2:"he";s:8:"דפים";s:2:"id";s:7:"Halaman";s:2:"it";s:6:"Pagine";s:2:"lt";s:9:"Puslapiai";s:2:"nl";s:13:"Pagina&apos;s";s:2:"pl";s:6:"Strony";s:2:"ru";s:16:"Страницы";s:2:"sl";s:6:"Strani";s:2:"tw";s:6:"頁面";s:2:"cn";s:6:"页面";s:2:"hu";s:7:"Oldalak";s:2:"th";s:21:"หน้าเพจ";s:2:"se";s:5:"Sidor";}', 'pages', '2.2.0', NULL, 'a:25:{s:2:"en";s:55:"Add custom pages to the site with any content you want.";s:2:"ar";s:99:"إضافة صفحات مُخصّصة إلى الموقع تحتوي أية مُحتوى تريده.";s:2:"br";s:82:"Adicionar páginas personalizadas ao site com qualquer conteúdo que você queira.";s:2:"pt";s:86:"Adicionar páginas personalizadas ao seu site com qualquer conteúdo que você queira.";s:2:"cs";s:74:"Přidávejte vlastní stránky na web s jakýmkoliv obsahem budete chtít.";s:2:"da";s:71:"Tilføj brugerdefinerede sider til dit site med det indhold du ønsker.";s:2:"de";s:49:"Füge eigene Seiten mit anpassbaren Inhalt hinzu.";s:2:"el";s:152:"Προσθέστε και επεξεργαστείτε σελίδες στον ιστότοπό σας με ό,τι περιεχόμενο θέλετε.";s:2:"es";s:77:"Agrega páginas customizadas al sitio con cualquier contenido que tu quieras.";s:2:"fa";s:96:"ایحاد صفحات جدید و دلخواه با هر محتوایی که دوست دارید";s:2:"fi";s:47:"Lisää mitä tahansa sisältöä sivustollesi.";s:2:"fr";s:89:"Permet d''ajouter sur le site des pages personalisées avec le contenu que vous souhaitez.";s:2:"he";s:35:"ניהול דפי תוכן האתר";s:2:"id";s:75:"Menambahkan halaman ke dalam situs dengan konten apapun yang Anda perlukan.";s:2:"it";s:73:"Aggiungi pagine personalizzate al sito con qualsiesi contenuto tu voglia.";s:2:"lt";s:46:"Pridėkite nuosavus puslapius betkokio turinio";s:2:"nl";s:70:"Voeg aangepaste pagina&apos;s met willekeurige inhoud aan de site toe.";s:2:"pl";s:53:"Dodaj własne strony z dowolną treścią do witryny.";s:2:"ru";s:134:"Управление информационными страницами сайта, с произвольным содержимым.";s:2:"sl";s:44:"Dodaj stran s kakršno koli vsebino želite.";s:2:"tw";s:39:"為您的網站新增自定的頁面。";s:2:"cn";s:39:"为您的网站新增自定的页面。";s:2:"th";s:168:"เพิ่มหน้าเว็บที่กำหนดเองไปยังเว็บไซต์ของคุณตามที่ต้องการ";s:2:"hu";s:67:"Saját oldalak hozzáadása a weboldalhoz, akármilyen tartalommal.";s:2:"se";s:39:"Lägg till egna sidor till webbplatsen.";}', 1, 1, 1, 'content', 1, 1, 1, 1464908272),
(15, 'a:25:{s:2:"en";s:11:"Permissions";s:2:"ar";s:18:"الصلاحيات";s:2:"br";s:11:"Permissões";s:2:"pt";s:11:"Permissões";s:2:"cs";s:12:"Oprávnění";s:2:"da";s:14:"Adgangskontrol";s:2:"de";s:14:"Zugriffsrechte";s:2:"el";s:20:"Δικαιώματα";s:2:"es";s:8:"Permisos";s:2:"fa";s:15:"اجازه ها";s:2:"fi";s:16:"Käyttöoikeudet";s:2:"fr";s:11:"Permissions";s:2:"he";s:12:"הרשאות";s:2:"id";s:9:"Perizinan";s:2:"it";s:8:"Permessi";s:2:"lt";s:7:"Teisės";s:2:"nl";s:15:"Toegangsrechten";s:2:"pl";s:11:"Uprawnienia";s:2:"ru";s:25:"Права доступа";s:2:"sl";s:10:"Dovoljenja";s:2:"tw";s:6:"權限";s:2:"cn";s:6:"权限";s:2:"hu";s:14:"Jogosultságok";s:2:"th";s:18:"สิทธิ์";s:2:"se";s:13:"Behörigheter";}', 'permissions', '1.0.0', NULL, 'a:25:{s:2:"en";s:68:"Control what type of users can see certain sections within the site.";s:2:"ar";s:127:"التحكم بإعطاء الصلاحيات للمستخدمين للوصول إلى أقسام الموقع المختلفة.";s:2:"br";s:68:"Controle quais tipos de usuários podem ver certas seções no site.";s:2:"pt";s:75:"Controle quais os tipos de utilizadores podem ver certas secções no site.";s:2:"cs";s:93:"Spravujte oprávnění pro jednotlivé typy uživatelů a ke kterým sekcím mají přístup.";s:2:"da";s:72:"Kontroller hvilken type brugere der kan se bestemte sektioner på sitet.";s:2:"de";s:70:"Regelt welche Art von Benutzer welche Sektion in der Seite sehen kann.";s:2:"el";s:180:"Ελέγξτε τα δικαιώματα χρηστών και ομάδων χρηστών όσο αφορά σε διάφορες λειτουργίες του ιστοτόπου.";s:2:"es";s:81:"Controla que tipo de usuarios pueden ver secciones específicas dentro del sitio.";s:2:"fa";s:59:"مدیریت اجازه های گروه های کاربری";s:2:"fi";s:72:"Hallitse minkä tyyppisiin osioihin käyttäjät pääsevät sivustolla.";s:2:"fr";s:104:"Permet de définir les autorisations des groupes d''utilisateurs pour afficher les différentes sections.";s:2:"he";s:75:"ניהול הרשאות כניסה לאיזורים מסוימים באתר";s:2:"id";s:76:"Mengontrol tipe pengguna mana yang dapat mengakses suatu bagian dalam situs.";s:2:"it";s:78:"Controlla che tipo di utenti posssono accedere a determinate sezioni del sito.";s:2:"lt";s:72:"Kontroliuokite kokio tipo varotojai kokią dalį puslapio gali pasiekti.";s:2:"nl";s:71:"Bepaal welke typen gebruikers toegang hebben tot gedeeltes van de site.";s:2:"pl";s:79:"Ustaw, którzy użytkownicy mogą mieć dostęp do odpowiednich sekcji witryny.";s:2:"ru";s:209:"Управление правами доступа, ограничение доступа определённых групп пользователей к произвольным разделам сайта.";s:2:"sl";s:85:"Uredite dovoljenja kateri tip uporabnika lahko vidi določena področja vaše strani.";s:2:"tw";s:81:"用來控制不同類別的用戶，設定其瀏覽特定網站內容的權限。";s:2:"cn";s:81:"用来控制不同类别的用户，设定其浏览特定网站内容的权限。";s:2:"hu";s:129:"A felhasználók felügyelet alatt tartására, hogy milyen típusú felhasználók, mit láthatnak, mely szakaszain az oldalnak.";s:2:"th";s:117:"ควบคุมว่าผู้ใช้งานจะเห็นหมวดหมู่ไหนบ้าง";s:2:"se";s:27:"Hantera gruppbehörigheter.";}', 0, 0, 1, 'users', 1, 1, 1, 1464908272),
(16, 'a:24:{s:2:"en";s:9:"Redirects";s:2:"ar";s:18:"التوجيهات";s:2:"br";s:17:"Redirecionamentos";s:2:"pt";s:17:"Redirecionamentos";s:2:"cs";s:16:"Přesměrování";s:2:"da";s:13:"Omadressering";s:2:"el";s:30:"Ανακατευθύνσεις";s:2:"es";s:13:"Redirecciones";s:2:"fa";s:17:"انتقال ها";s:2:"fi";s:18:"Uudelleenohjaukset";s:2:"fr";s:12:"Redirections";s:2:"he";s:12:"הפניות";s:2:"id";s:8:"Redirect";s:2:"it";s:11:"Reindirizzi";s:2:"lt";s:14:"Peradresavimai";s:2:"nl";s:12:"Verwijzingen";s:2:"ru";s:30:"Перенаправления";s:2:"sl";s:12:"Preusmeritve";s:2:"tw";s:6:"轉址";s:2:"cn";s:6:"转址";s:2:"hu";s:17:"Átirányítások";s:2:"pl";s:14:"Przekierowania";s:2:"th";s:42:"เปลี่ยนเส้นทาง";s:2:"se";s:14:"Omdirigeringar";}', 'redirects', '1.0.0', NULL, 'a:24:{s:2:"en";s:33:"Redirect from one URL to another.";s:2:"ar";s:47:"التوجيه من رابط URL إلى آخر.";s:2:"br";s:39:"Redirecionamento de uma URL para outra.";s:2:"pt";s:40:"Redirecionamentos de uma URL para outra.";s:2:"cs";s:43:"Přesměrujte z jedné adresy URL na jinou.";s:2:"da";s:35:"Omadresser fra en URL til en anden.";s:2:"el";s:81:"Ανακατευθείνετε μια διεύθυνση URL σε μια άλλη";s:2:"es";s:34:"Redireccionar desde una URL a otra";s:2:"fa";s:63:"انتقال دادن یک صفحه به یک آدرس دیگر";s:2:"fi";s:45:"Uudelleenohjaa käyttäjän paikasta toiseen.";s:2:"fr";s:34:"Redirection d''une URL à un autre.";s:2:"he";s:43:"הפניות מכתובת אחת לאחרת";s:2:"id";s:40:"Redirect dari satu URL ke URL yang lain.";s:2:"it";s:35:"Reindirizza da una URL ad un altra.";s:2:"lt";s:56:"Peradresuokite puslapį iš vieno adreso (URL) į kitą.";s:2:"nl";s:38:"Verwijs vanaf een URL naar een andere.";s:2:"ru";s:78:"Перенаправления с одного адреса на другой.";s:2:"sl";s:44:"Preusmeritev iz enega URL naslova na drugega";s:2:"tw";s:33:"將網址轉址、重新定向。";s:2:"cn";s:33:"将网址转址、重新定向。";s:2:"hu";s:38:"Egy URL átirányítása egy másikra.";s:2:"pl";s:44:"Przekierowanie z jednego adresu URL na inny.";s:2:"th";s:123:"เปลี่ยนเส้นทางจากที่หนึ่งไปยังอีกที่หนึ่ง";s:2:"se";s:38:"Omdirigera från en URL till en annan.";}', 0, 0, 1, 'structure', 1, 1, 1, 1464908272),
(17, 'a:9:{s:2:"en";s:6:"Search";s:2:"fr";s:9:"Recherche";s:2:"se";s:4:"Sök";s:2:"ar";s:10:"البحث";s:2:"tw";s:6:"搜尋";s:2:"cn";s:6:"搜寻";s:2:"it";s:7:"Ricerca";s:2:"fa";s:10:"جستجو";s:2:"fi";s:4:"Etsi";}', 'search', '1.0.0', NULL, 'a:9:{s:2:"en";s:72:"Search through various types of content with this modular search system.";s:2:"fr";s:84:"Rechercher parmi différents types de contenus avec système de recherche modulaire.";s:2:"se";s:36:"Sök igenom olika typer av innehåll";s:2:"ar";s:102:"ابحث في أنواع مختلفة من المحتوى باستخدام نظام البحث هذا.";s:2:"tw";s:63:"此模組可用以搜尋網站中不同類型的資料內容。";s:2:"cn";s:63:"此模组可用以搜寻网站中不同类型的资料内容。";s:2:"it";s:71:"Cerca tra diversi tipi di contenuti con il sistema di reicerca modulare";s:2:"fa";s:115:"توسط این ماژول می توانید در محتواهای مختلف وبسایت جستجو نمایید.";s:2:"fi";s:76:"Etsi eri tyypistä sisältöä tällä modulaarisella hakujärjestelmällä.";}', 0, 0, 0, '0', 1, 1, 1, 1464908272),
(18, 'a:20:{s:2:"en";s:7:"Sitemap";s:2:"ar";s:23:"خريطة الموقع";s:2:"br";s:12:"Mapa do Site";s:2:"pt";s:12:"Mapa do Site";s:2:"de";s:7:"Sitemap";s:2:"el";s:31:"Χάρτης Ιστότοπου";s:2:"es";s:14:"Mapa del Sitio";s:2:"fa";s:17:"نقشه سایت";s:2:"fi";s:10:"Sivukartta";s:2:"fr";s:12:"Plan du site";s:2:"id";s:10:"Peta Situs";s:2:"it";s:14:"Mappa del sito";s:2:"lt";s:16:"Svetainės medis";s:2:"nl";s:7:"Sitemap";s:2:"ru";s:21:"Карта сайта";s:2:"tw";s:12:"網站地圖";s:2:"cn";s:12:"网站地图";s:2:"th";s:21:"ไซต์แมพ";s:2:"hu";s:13:"Oldaltérkép";s:2:"se";s:9:"Sajtkarta";}', 'sitemap', '1.3.0', NULL, 'a:21:{s:2:"en";s:87:"The sitemap module creates an index of all pages and an XML sitemap for search engines.";s:2:"ar";s:120:"وحدة خريطة الموقع تنشئ فهرساً لجميع الصفحات وملف XML لمحركات البحث.";s:2:"br";s:102:"O módulo de mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.";s:2:"pt";s:102:"O módulo do mapa do site cria um índice de todas as páginas e um sitemap XML para motores de busca.";s:2:"da";s:86:"Sitemapmodulet opretter et indeks over alle sider og et XML sitemap til søgemaskiner.";s:2:"de";s:92:"Die Sitemap Modul erstellt einen Index aller Seiten und eine XML-Sitemap für Suchmaschinen.";s:2:"el";s:190:"Δημιουργεί έναν κατάλογο όλων των σελίδων και έναν χάρτη σελίδων σε μορφή XML για τις μηχανές αναζήτησης.";s:2:"es";s:111:"El módulo de mapa crea un índice de todas las páginas y un mapa del sitio XML para los motores de búsqueda.";s:2:"fa";s:150:"ماژول نقشه سایت یک لیست از همه ی صفحه ها به فرمت فایل XML برای موتور های جستجو می سازد";s:2:"fi";s:82:"sivukartta moduuli luo hakemisto kaikista sivuista ja XML sivukartta hakukoneille.";s:2:"fr";s:106:"Le module sitemap crée un index de toutes les pages et un plan de site XML pour les moteurs de recherche.";s:2:"id";s:110:"Modul peta situs ini membuat indeks dari setiap halaman dan sebuah format XML untuk mempermudah mesin pencari.";s:2:"it";s:104:"Il modulo mappa del sito crea un indice di tutte le pagine e una sitemap in XML per i motori di ricerca.";s:2:"lt";s:86:"struktūra modulis sukuria visų puslapių ir XML Sitemap paieškos sistemų indeksas.";s:2:"nl";s:89:"De sitemap module maakt een index van alle pagina''s en een XML sitemap voor zoekmachines.";s:2:"ru";s:144:"Карта модуль создает индекс всех страниц и карта сайта XML для поисковых систем.";s:2:"tw";s:84:"站點地圖模塊創建一個索引的所有網頁和XML網站地圖搜索引擎。";s:2:"cn";s:84:"站点地图模块创建一个索引的所有网页和XML网站地图搜索引擎。";s:2:"th";s:202:"โมดูลไซต์แมพสามารถสร้างดัชนีของหน้าเว็บทั้งหมดสำหรับเครื่องมือค้นหา.";s:2:"hu";s:94:"Ez a modul indexeli az összes oldalt és egy XML oldaltéképet generál a keresőmotoroknak.";s:2:"se";s:86:"Sajtkarta, modulen skapar ett index av alla sidor och en XML-sitemap för sökmotorer.";}', 0, 1, 0, 'content', 1, 1, 1, 1464908272);
INSERT INTO `default_modules` (`id`, `name`, `slug`, `version`, `type`, `description`, `skip_xss`, `is_frontend`, `is_backend`, `menu`, `enabled`, `installed`, `is_core`, `updated_on`) VALUES
(19, 'a:6:{s:2:"en";s:7:"Streams";s:2:"es";s:7:"Streams";s:2:"de";s:7:"Streams";s:2:"el";s:8:"Ροές";s:2:"lt";s:7:"Srautai";s:2:"fr";s:7:"Streams";}', 'streams', '2.3.3', NULL, 'a:6:{s:2:"en";s:36:"Manage, structure, and display data.";s:2:"es";s:41:"Administra, estructura, y presenta datos.";s:2:"de";s:49:"Verwalte, strukturiere und veröffentliche Daten.";s:2:"el";s:106:"Διαχείριση, δόμηση και προβολή πληροφοριών και δεδομένων.";s:2:"lt";N;s:2:"fr";s:43:"Gérer, structurer et afficher des données";}', 0, 0, 1, 'content', 1, 1, 1, 1464908272),
(20, 'a:25:{s:2:"en";s:5:"Users";s:2:"ar";s:20:"المستخدمون";s:2:"br";s:9:"Usuários";s:2:"pt";s:12:"Utilizadores";s:2:"cs";s:11:"Uživatelé";s:2:"da";s:7:"Brugere";s:2:"de";s:8:"Benutzer";s:2:"el";s:14:"Χρήστες";s:2:"es";s:8:"Usuarios";s:2:"fa";s:14:"کاربران";s:2:"fi";s:12:"Käyttäjät";s:2:"fr";s:12:"Utilisateurs";s:2:"he";s:14:"משתמשים";s:2:"id";s:8:"Pengguna";s:2:"it";s:6:"Utenti";s:2:"lt";s:10:"Vartotojai";s:2:"nl";s:10:"Gebruikers";s:2:"pl";s:12:"Użytkownicy";s:2:"ru";s:24:"Пользователи";s:2:"sl";s:10:"Uporabniki";s:2:"tw";s:6:"用戶";s:2:"cn";s:6:"用户";s:2:"hu";s:14:"Felhasználók";s:2:"th";s:27:"ผู้ใช้งาน";s:2:"se";s:10:"Användare";}', 'users', '1.1.0', NULL, 'a:25:{s:2:"en";s:81:"Let users register and log in to the site, and manage them via the control panel.";s:2:"ar";s:133:"تمكين المستخدمين من التسجيل والدخول إلى الموقع، وإدارتهم من لوحة التحكم.";s:2:"br";s:125:"Permite com que usuários se registrem e entrem no site e também que eles sejam gerenciáveis apartir do painel de controle.";s:2:"pt";s:125:"Permite com que os utilizadores se registem e entrem no site e também que eles sejam geriveis apartir do painel de controlo.";s:2:"cs";s:103:"Umožňuje uživatelům se registrovat a přihlašovat a zároveň jejich správu v Kontrolním panelu.";s:2:"da";s:89:"Lader brugere registrere sig og logge ind på sitet, og håndtér dem via kontrolpanelet.";s:2:"de";s:108:"Erlaube Benutzern das Registrieren und Einloggen auf der Seite und verwalte sie über die Admin-Oberfläche.";s:2:"el";s:208:"Παρέχει λειτουργίες εγγραφής και σύνδεσης στους επισκέπτες. Επίσης από εδώ γίνεται η διαχείριση των λογαριασμών.";s:2:"es";s:138:"Permite el registro de nuevos usuarios quienes podrán loguearse en el sitio. Estos podrán controlarse desde el panel de administración.";s:2:"fa";s:151:"به کاربر ها امکان ثبت نام و لاگین در سایت را بدهید و آنها را در پنل مدیریت نظارت کنید";s:2:"fi";s:126:"Antaa käyttäjien rekisteröityä ja kirjautua sisään sivustolle sekä mahdollistaa niiden muokkaamisen hallintapaneelista.";s:2:"fr";s:112:"Permet aux utilisateurs de s''enregistrer et de se connecter au site et de les gérer via le panneau de contrôle";s:2:"he";s:62:"ניהול משתמשים: רישום, הפעלה ומחיקה";s:2:"id";s:102:"Memungkinkan pengguna untuk mendaftar dan masuk ke dalam situs, dan mengaturnya melalui control panel.";s:2:"it";s:95:"Fai iscrivere de entrare nel sito gli utenti, e gestiscili attraverso il pannello di controllo.";s:2:"lt";s:106:"Leidžia vartotojams registruotis ir prisijungti prie puslapio, ir valdyti juos per administravimo panele.";s:2:"nl";s:88:"Laat gebruikers registreren en inloggen op de site, en beheer ze via het controlepaneel.";s:2:"pl";s:87:"Pozwól użytkownikom na logowanie się na stronie i zarządzaj nimi za pomocą panelu.";s:2:"ru";s:155:"Управление зарегистрированными пользователями, активирование новых пользователей.";s:2:"sl";s:96:"Dovoli uporabnikom za registracijo in prijavo na strani, urejanje le teh preko nadzorne plošče";s:2:"tw";s:87:"讓用戶可以註冊並登入網站，並且管理者可在控制台內進行管理。";s:2:"cn";s:87:"让用户可以注册并登入网站，并且管理者可在控制台内进行管理。";s:2:"th";s:210:"ให้ผู้ใช้ลงทะเบียนและเข้าสู่เว็บไซต์และจัดการกับพวกเขาผ่านทางแผงควบคุม";s:2:"hu";s:120:"Hogy a felhasználók tudjanak az oldalra regisztrálni és belépni, valamint lehessen őket kezelni a vezérlőpulton.";s:2:"se";s:111:"Låt dina besökare registrera sig och logga in på webbplatsen. Hantera sedan användarna via kontrollpanelen.";}', 0, 0, 1, '0', 1, 1, 1, 1464908272),
(21, 'a:25:{s:2:"en";s:9:"Variables";s:2:"ar";s:20:"المتغيّرات";s:2:"br";s:10:"Variáveis";s:2:"pt";s:10:"Variáveis";s:2:"cs";s:10:"Proměnné";s:2:"da";s:8:"Variable";s:2:"de";s:9:"Variablen";s:2:"el";s:20:"Μεταβλητές";s:2:"es";s:9:"Variables";s:2:"fa";s:16:"متغییرها";s:2:"fi";s:9:"Muuttujat";s:2:"fr";s:9:"Variables";s:2:"he";s:12:"משתנים";s:2:"id";s:8:"Variabel";s:2:"it";s:9:"Variabili";s:2:"lt";s:10:"Kintamieji";s:2:"nl";s:10:"Variabelen";s:2:"pl";s:7:"Zmienne";s:2:"ru";s:20:"Переменные";s:2:"sl";s:13:"Spremenljivke";s:2:"tw";s:12:"系統變數";s:2:"cn";s:12:"系统变数";s:2:"th";s:18:"ตัวแปร";s:2:"se";s:9:"Variabler";s:2:"hu";s:10:"Változók";}', 'variables', '1.0.0', NULL, 'a:25:{s:2:"en";s:59:"Manage global variables that can be accessed from anywhere.";s:2:"ar";s:97:"إدارة المُتغيّرات العامة لاستخدامها في أرجاء الموقع.";s:2:"br";s:61:"Gerencia as variáveis globais acessíveis de qualquer lugar.";s:2:"pt";s:58:"Gerir as variáveis globais acessíveis de qualquer lugar.";s:2:"cs";s:56:"Spravujte globální proměnné přístupné odkudkoliv.";s:2:"da";s:51:"Håndtér globale variable som kan tilgås overalt.";s:2:"de";s:74:"Verwaltet globale Variablen, auf die von überall zugegriffen werden kann.";s:2:"el";s:129:"Διαχείριση μεταβλητών που είναι προσβάσιμες από παντού στον ιστότοπο.";s:2:"es";s:50:"Manage global variables to access from everywhere.";s:2:"fa";s:136:"مدیریت متغییر های جامع که می توانند در هر جای سایت مورد استفاده قرار بگیرند";s:2:"fi";s:66:"Hallitse globaali muuttujia, joihin pääsee käsiksi mistä vain.";s:2:"fr";s:92:"Gérer des variables globales pour pouvoir y accéder depuis n''importe quel endroit du site.";s:2:"he";s:96:"ניהול משתנים גלובליים אשר ניתנים להמרה בכל חלקי האתר";s:2:"id";s:59:"Mengatur variabel global yang dapat diakses dari mana saja.";s:2:"it";s:58:"Gestisci le variabili globali per accedervi da ogni parte.";s:2:"lt";s:64:"Globalių kintamujų tvarkymas kurie yra pasiekiami iš bet kur.";s:2:"nl";s:54:"Beheer globale variabelen die overal beschikbaar zijn.";s:2:"pl";s:86:"Zarządzaj globalnymi zmiennymi do których masz dostęp z każdego miejsca aplikacji.";s:2:"ru";s:136:"Управление глобальными переменными, которые доступны в любом месте сайта.";s:2:"sl";s:53:"Urejanje globalnih spremenljivk za dostop od kjerkoli";s:2:"th";s:148:"จัดการตัวแปรทั่วไปโดยที่สามารถเข้าถึงได้จากทุกที่.";s:2:"tw";s:45:"管理此網站內可存取的全局變數。";s:2:"cn";s:45:"管理此网站内可存取的全局变数。";s:2:"hu";s:62:"Globális változók kezelése a hozzáféréshez, bárhonnan.";s:2:"se";s:66:"Hantera globala variabler som kan avändas över hela webbplatsen.";}', 0, 0, 1, 'data', 1, 1, 1, 1464908272),
(22, 'a:23:{s:2:"en";s:7:"Widgets";s:2:"br";s:7:"Widgets";s:2:"pt";s:7:"Widgets";s:2:"cs";s:7:"Widgety";s:2:"da";s:7:"Widgets";s:2:"de";s:7:"Widgets";s:2:"el";s:7:"Widgets";s:2:"es";s:7:"Widgets";s:2:"fa";s:13:"ویجت ها";s:2:"fi";s:9:"Vimpaimet";s:2:"fr";s:7:"Widgets";s:2:"id";s:6:"Widget";s:2:"it";s:7:"Widgets";s:2:"lt";s:11:"Papildiniai";s:2:"nl";s:7:"Widgets";s:2:"ru";s:14:"Виджеты";s:2:"sl";s:9:"Vtičniki";s:2:"tw";s:9:"小組件";s:2:"cn";s:9:"小组件";s:2:"hu";s:9:"Widget-ek";s:2:"th";s:21:"วิดเจ็ต";s:2:"se";s:8:"Widgetar";s:2:"ar";s:14:"الودجتس";}', 'widgets', '1.2.0', NULL, 'a:23:{s:2:"en";s:69:"Manage small sections of self-contained logic in blocks or "Widgets".";s:2:"ar";s:132:"إدارة أقسام صغيرة من البرمجيات في مساحات الموقع أو ما يُسمّى بالـ"ودجتس".";s:2:"br";s:77:"Gerenciar pequenas seções de conteúdos em bloco conhecidos como "Widgets".";s:2:"pt";s:74:"Gerir pequenas secções de conteúdos em bloco conhecidos como "Widgets".";s:2:"cs";s:56:"Spravujte malé funkční části webu neboli "Widgety".";s:2:"da";s:74:"Håndter små sektioner af selv-opretholdt logik i blokke eller "Widgets".";s:2:"de";s:62:"Verwaltet kleine, eigentständige Bereiche, genannt "Widgets".";s:2:"el";s:149:"Διαχείριση μικρών τμημάτων αυτόνομης προγραμματιστικής λογικής σε πεδία ή "Widgets".";s:2:"es";s:75:"Manejar pequeñas secciones de lógica autocontenida en bloques o "Widgets"";s:2:"fa";s:76:"مدیریت قسمت های کوچکی از سایت به طور مستقل";s:2:"fi";s:81:"Hallitse pieniä osioita, jotka sisältävät erillisiä lohkoja tai "Vimpaimia".";s:2:"fr";s:41:"Gérer des mini application ou "Widgets".";s:2:"id";s:101:"Mengatur bagian-bagian kecil dari blok-blok yang memuat sesuatu atau dikenal dengan istilah "Widget".";s:2:"it";s:70:"Gestisci piccole sezioni di logica a se stante in blocchi o "Widgets".";s:2:"lt";s:43:"Nedidelių, savarankiškų blokų valdymas.";s:2:"nl";s:75:"Beheer kleine onderdelen die zelfstandige logica bevatten, ofwel "Widgets".";s:2:"ru";s:91:"Управление небольшими, самостоятельными блоками.";s:2:"sl";s:61:"Urejanje manjših delov blokov strani ti. Vtičniki (Widgets)";s:2:"tw";s:103:"可將小段的程式碼透過小組件來管理。即所謂 "Widgets"，或稱為小工具、部件。";s:2:"cn";s:103:"可将小段的程式码透过小组件来管理。即所谓 "Widgets"，或称为小工具、部件。";s:2:"hu";s:56:"Önálló kis logikai tömbök vagy widget-ek kezelése.";s:2:"th";s:152:"จัดการส่วนเล็ก ๆ ในรูปแบบของตัวเองในบล็อกหรือวิดเจ็ต";s:2:"se";s:83:"Hantera små sektioner med egen logik och innehåll på olika delar av webbplatsen.";}', 1, 0, 1, 'content', 1, 1, 1, 1464908272),
(23, 'a:9:{s:2:"en";s:7:"WYSIWYG";s:2:"fa";s:7:"WYSIWYG";s:2:"fr";s:7:"WYSIWYG";s:2:"pt";s:7:"WYSIWYG";s:2:"se";s:15:"HTML-redigerare";s:2:"tw";s:7:"WYSIWYG";s:2:"cn";s:7:"WYSIWYG";s:2:"ar";s:27:"المحرر الرسومي";s:2:"it";s:7:"WYSIWYG";}', 'wysiwyg', '1.0.0', NULL, 'a:10:{s:2:"en";s:60:"Provides the WYSIWYG editor for PyroCMS powered by CKEditor.";s:2:"fa";s:73:"ویرایشگر WYSIWYG که توسطCKEditor ارائه شده است. ";s:2:"fr";s:63:"Fournit un éditeur WYSIWYG pour PyroCMS propulsé par CKEditor";s:2:"pt";s:61:"Fornece o editor WYSIWYG para o PyroCMS, powered by CKEditor.";s:2:"el";s:113:"Παρέχει τον επεξεργαστή WYSIWYG για το PyroCMS, χρησιμοποιεί το CKEDitor.";s:2:"se";s:37:"Redigeringsmodul för HTML, CKEditor.";s:2:"tw";s:83:"提供 PyroCMS 所見即所得（WYSIWYG）編輯器，由 CKEditor 技術提供。";s:2:"cn";s:83:"提供 PyroCMS 所见即所得（WYSIWYG）编辑器，由 CKEditor 技术提供。";s:2:"ar";s:76:"توفر المُحرّر الرسومي لـPyroCMS من خلال CKEditor.";s:2:"it";s:57:"Fornisce l''editor WYSIWYG per PtroCMS creato con CKEditor";}', 0, 0, 0, '0', 1, 1, 1, 1464908272),
(24, 'a:4:{s:2:"en";s:14:"API Management";s:2:"el";s:24:"Διαχείριση API";s:2:"fr";s:18:"Gestionnaire d''API";s:2:"hu";s:12:"API Kezelés";}', 'api', '1.0.0', NULL, 'a:4:{s:2:"en";s:66:"Set up a RESTful API with API Keys and out in JSON, XML, CSV, etc.";s:2:"el";s:129:"Ρυθμίσεις για ένα RESTful API με κλειδιά API και αποτελέσματα σε JSON, XML, CSV, κτλ.";s:2:"fr";s:79:"Paramétrage d''une API RESTgul avec clés API et export en JSON, XML, CSV, etc.";s:2:"hu";s:159:"Körültekintően állítsd be az API-t (alkalmazásprogramozási felület) az API Kulcsokkal együtt és küldd JSON-ba, XML-be, CSV-be, vagy bármi egyébbe.";}', 0, 1, 1, 'utilities', 0, 0, 0, 1464908272),
(31, 'a:2:{s:2:"es";s:6:"Inicio";s:2:"en";s:4:"Home";}', 'home', '1.1', NULL, 'a:2:{s:2:"es";s:13:"Modulo Inicio";s:2:"en";s:11:"Home module";}', 0, 1, 1, 'content', 1, 1, 0, 1464908272),
(26, 'a:2:{s:2:"es";s:14:"Sobre Nosotros";s:2:"en";s:8:"About Us";}', 'about_us', '1.1', NULL, 'a:2:{s:2:"es";s:30:"Sobre Nosotros © Brayan Acebo";s:2:"en";s:24:"About Us © Brayan Acebo";}', 0, 1, 1, 'content', 1, 1, 0, 1464908272),
(30, 'a:2:{s:2:"es";s:14:"Nuestro Equipo";s:2:"en";s:8:"Our Team";}', 'our_team', '1.1', NULL, 'a:2:{s:2:"es";s:30:"Nuestro Equipo © Brayan Acebo";s:2:"en";s:24:"Our Team © Brayan Acebo";}', 0, 1, 1, 'content', 0, 0, 0, 1394138583),
(95, 'a:2:{s:2:"es";s:28:"Herramientas de Maquetación";s:2:"en";s:5:"Tools";}', 'tools', '1.0', NULL, 'a:2:{s:2:"es";s:48:"Herramientas de Maquetación © Adrian Rodriguez";s:2:"en";s:32:"Layout Tools © Adrian Rodriguez";}', 0, 0, 1, 'content', 0, 0, 0, 1464908272),
(91, 'a:2:{s:2:"en";s:12:"Upload Files";s:2:"es";s:15:"Cargar Archivos";}', 'multi_upload_files', '1.2', NULL, 'a:2:{s:2:"en";s:42:"Upload Files © Luis Fernando Salazar 2014";s:2:"es";s:38:"Archivos © Luis Fernando Salazar 2014";}', 0, 1, 1, 'content', 0, 0, 0, 1464908272),
(34, 'a:2:{s:2:"en";s:18:"News with comments";s:2:"es";s:9:"Novedades";}', 'news', '1.1', NULL, 'a:2:{s:2:"en";s:54:"This is a module of news © Brayan Acebo, Luis Salazar";s:2:"es";s:48:"Modulo de Noticias © Brayan Acebo, Luis Salazar";}', 0, 1, 1, 'content', 1, 1, 0, 1464908272),
(35, 'a:2:{s:2:"es";s:14:"Widget Twitter";s:2:"en";s:0:"";}', 'widget_twitter', '1.0', NULL, 'a:2:{s:2:"es";s:48:"Añade cualquier cronología pública de Twitter";s:2:"en";s:0:"";}', 0, 1, 1, 'content', 0, 0, 0, 1394800827),
(40, 'a:2:{s:2:"en";s:8:"Articles";s:2:"es";s:9:"Articulos";}', 'articles', '1.2', NULL, 'a:2:{s:2:"en";s:33:"This is a module to CRUD articles";s:2:"es";s:16:"Modulo articulos";}', 0, 1, 1, 'content', 0, 0, 0, 1395073620),
(41, 'a:2:{s:2:"es";s:7:"Autores";s:2:"en";s:7:"Authors";}', 'authors', '1.0', NULL, 'a:2:{s:2:"es";s:17:"Modulo de autores";s:2:"en";s:14:"Authors module";}', 0, 1, 1, 'content', 0, 0, 0, 1395073623),
(42, 'a:2:{s:2:"es";s:10:"Categorias";s:2:"en";s:10:"Categories";}', 'categories', '1.0', NULL, 'a:2:{s:2:"es";s:36:"Modulo de categorias y subcategorias";s:2:"en";s:35:"Categories and subcategories module";}', 0, 0, 1, 'content', 0, 0, 0, 1395070027),
(43, 'a:2:{s:2:"es";s:4:"Tags";s:2:"en";s:4:"Tags";}', 'tags', '1.0', NULL, 'a:2:{s:2:"es";s:50:"Tags libres listo para relacionar a varios modulos";s:2:"en";s:50:"Tags libres listo para relacionar a varios modulos";}', 0, 0, 1, 'content', 0, 0, 0, 1464908272),
(45, 'a:2:{s:2:"en";s:7:"Galeria";s:2:"es";s:7:"Galeria";}', 'galeria', '1.0', NULL, 'a:2:{s:2:"en";s:51:"Module galeria title and text © Jeyson Garcia 2013";s:2:"es";s:54:"Modulo de galeria titulo y texto © Jeyson Garcia 2013";}', 0, 1, 1, 'content', 1, 1, 0, 1395074494),
(111, 'a:2:{s:2:"en";s:8:"Products";s:2:"es";s:9:"Productos";}', 'products', '1.2', NULL, 'a:2:{s:2:"en";s:52:"Products © Brayan Acebo, luis fernando salazar 2014";s:2:"es";s:53:"Productos © Brayan Acebo, luis fernando salazar 2014";}', 0, 1, 1, 'content', 0, 1, 0, 1464908336),
(109, 'a:2:{s:2:"es";s:7:"Galeria";s:2:"en";s:7:"Gallery";}', 'gallery', '1.1', NULL, 'a:2:{s:2:"es";s:37:"Modulo Galeria Simple © Brayan Acebo";s:2:"en";s:37:"Module Simple Gallery © Brayan Acebo";}', 0, 1, 1, 'content', 0, 0, 0, 1464908272),
(75, 'a:2:{s:2:"en";s:8:"services";s:2:"es";s:9:"Servicios";}', 'services', '1.2', NULL, 'a:2:{s:2:"en";s:52:"services © Brayan Acebo, luis fernando salazar 2014";s:2:"es";s:53:"servicios © Brayan Acebo, luis fernando salazar 2014";}', 0, 1, 1, 'content', 1, 1, 0, 1464908272),
(55, 'a:2:{s:2:"es";s:21:"Otras configuraciones";s:2:"en";s:20:"Other configurations";}', 'others_conf', '1.2', NULL, 'a:2:{s:2:"es";s:58:"Otras configuraciones como el logo. @Luis Fernando Salazar";s:2:"en";s:52:"Other configuration like logo @Luis Fernando Salazar";}', 0, 1, 1, 'content', 1, 1, 0, 1464908272),
(83, 'a:2:{s:2:"en";s:3:"FAQ";s:2:"es";s:20:"Preguntas Frecuentes";}', 'faqs', '1.2', NULL, 'a:2:{s:2:"en";s:47:"FAQ © Brayan Acebo, luis fernando salazar 2014";s:2:"es";s:64:"Preguntas Frecuentes © Brayan Acebo, luis fernando salazar 2014";}', 0, 1, 1, 'content', 0, 0, 0, 1464908272),
(101, 'a:2:{s:2:"es";s:20:"Trabaja con nosotros";s:2:"en";s:12:"Work with us";}', 'work_with_us', '1.0', NULL, 'a:2:{s:2:"es";s:71:"Modulo de envio de hojas de vida © Brayan Acebo, Luis Fernando Salazar";s:2:"en";s:52:"Work with us ©  Brayan Acebo, Luis fernando Salazar";}', 0, 1, 1, 'content', 0, 0, 0, 1464908272),
(62, 'a:2:{s:2:"en";s:6:"albums";s:2:"es";s:7:"albunes";}', 'albums', '1.2', NULL, 'a:2:{s:2:"en";s:50:"albums © Brayan Acebo, luis fernando salazar 2014";s:2:"es";s:51:"albunes © Brayan Acebo, luis fernando salazar 2014";}', 0, 1, 1, 'content', 0, 0, 0, 1408996715),
(67, 'a:2:{s:2:"en";s:4:"Chat";s:2:"es";s:12:"Chat Interno";}', 'chat', '1.0', NULL, 'a:2:{s:2:"en";s:30:"This is a PyroCMS module chat.";s:2:"es";s:32:"Administrador de chat principal.";}', 0, 1, 1, 'content', 1, 1, 0, 1464908272),
(73, 'a:2:{s:2:"en";s:11:"Google Maps";s:2:"es";s:15:"Mapas de Google";}', 'google_maps', '1.2', NULL, 'a:1:{s:2:"en";s:45:"Mapas de Google © Luis Fernando Salazar 2014";}', 0, 0, 1, 'content', 0, 0, 0, 1426510031),
(99, 'a:2:{s:2:"en";s:18:"about us multiples";s:2:"es";s:8:"Nosotros";}', 'about_us_multiples', '1.2', NULL, 'a:2:{s:2:"en";s:58:"This is a module of About Us © Brayan Acebo, Luis Salazar";s:2:"es";s:54:"Modulo de Sobre Nosotros © Brayan Acebo, Luis Salazar";}', 0, 1, 1, 'content', 1, 1, 0, 1464908272),
(97, 'a:2:{s:2:"en";s:12:"Advance News";s:2:"es";s:18:"Noticias Avanzadas";}', 'advance_news', '1.2', NULL, 'a:2:{s:2:"en";s:62:"This is a module of advance_news © Brayan Acebo, Luis Salazar";s:2:"es";s:48:"Modulo de Noticias © Brayan Acebo, Luis Salazar";}', 0, 1, 1, 'content', 0, 0, 0, 1464908272),
(78, 'a:2:{s:2:"es";s:17:"Datos de Contacto";s:2:"en";s:11:"Contactenos";}', 'contact_us', '1.3', NULL, 'a:2:{s:2:"es";s:111:"Modulo información de contacto, con control de mapas © Brayan Acebo, Luis Fernando Salazar, Christian España";s:2:"en";s:75:"Manage Info Data © Christian España , Brayan Acebo, Luis fernando Salazar";}', 0, 1, 1, 'content', 1, 1, 0, 1464908272),
(79, 'a:2:{s:2:"en";s:9:"Solutions";s:2:"es";s:9:"Proyectos";}', 'projects', '1.2', NULL, 'a:2:{s:2:"en";s:52:"projects © Brayan Acebo, luis fernando salazar 2014";s:2:"es";s:53:"Proyectos © Brayan Acebo, luis fernando salazar 2014";}', 0, 1, 1, 'content', 1, 1, 0, 1464908272),
(80, 'a:2:{s:2:"es";s:11:"Preguntanos";s:2:"en";s:3:"Ask";}', 'ask', '1.3', NULL, 'a:2:{s:2:"es";s:19:"Pregunta al experto";s:2:"en";s:3:"Ask";}', 0, 1, 1, 'content', 1, 1, 0, 1464908272),
(106, 'a:2:{s:2:"en";s:7:"Process";s:2:"es";s:8:"Procesos";}', 'process', '1.2', NULL, 'a:2:{s:2:"en";s:51:"process © Brayan Acebo, luis fernando salazar 2014";s:2:"es";s:53:"Servicios © Brayan Acebo, luis fernando salazar 2014";}', 0, 1, 1, 'content', 1, 1, 0, 1464908272),
(107, 'a:2:{s:2:"en";s:7:"Gallery";s:2:"es";s:19:"Galeria de imagenes";}', 'gallerys', '1.2', NULL, 'a:2:{s:2:"en";s:14:"Images gallery";s:2:"es";s:19:"Galeria de Imagenes";}', 0, 1, 1, 'content', 1, 1, 0, 1464908272);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_multi_upload_files`
--

CREATE TABLE IF NOT EXISTS `default_multi_upload_files` (
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

CREATE TABLE IF NOT EXISTS `default_navigation_groups` (
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

CREATE TABLE IF NOT EXISTS `default_navigation_links` (
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
(27, 'Products', NULL, 'uri', 0, '', '', 'products', 4, 3, '', '0', ''),
(28, 'FAQ', NULL, 'uri', 0, '', '', 'FAQ', 4, 4, '', '0', ''),
(29, 'Services', NULL, 'module', 0, 'services', '', '', 4, 5, '', '0', ''),
(30, 'Contact us', NULL, 'module', 0, 'contact_us', '', '', 4, 6, '', '0', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_news`
--

CREATE TABLE IF NOT EXISTS `default_news` (
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

CREATE TABLE IF NOT EXISTS `default_news_comments` (
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

CREATE TABLE IF NOT EXISTS `default_new_info` (
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

CREATE TABLE IF NOT EXISTS `default_others_conf` (
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

CREATE TABLE IF NOT EXISTS `default_pages` (
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

CREATE TABLE IF NOT EXISTS `default_page_types` (
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

CREATE TABLE IF NOT EXISTS `default_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `default_people`
--

INSERT INTO `default_people` (`id`, `image`, `title`, `text`, `lang`) VALUES
(2, NULL, 'Cumque quaerat', '<ul>\r\n                                <li>lorem ipsum</li>\r\n                                <li>lorem ipsum</li>\r\n                                <li>lorem ipsum</li>\r\n                            </ul>', 'en');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_permissions`
--

CREATE TABLE IF NOT EXISTS `default_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roles` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

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

CREATE TABLE IF NOT EXISTS `default_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_process_categories`
--

CREATE TABLE IF NOT EXISTS `default_process_categories` (
  `proces_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_process_doc`
--

CREATE TABLE IF NOT EXISTS `default_process_doc` (
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

CREATE TABLE IF NOT EXISTS `default_process_intro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `default_process_intro`
--

INSERT INTO `default_process_intro` (`id`, `text`, `lang`) VALUES
(1, '', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_process_state`
--

CREATE TABLE IF NOT EXISTS `default_process_state` (
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

CREATE TABLE IF NOT EXISTS `default_proces_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `parent` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_proces_images`
--

CREATE TABLE IF NOT EXISTS `default_proces_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proces_id` int(11) NOT NULL,
  `path` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_products`
--

CREATE TABLE IF NOT EXISTS `default_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_products_categories`
--

CREATE TABLE IF NOT EXISTS `default_products_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_products_intro`
--

CREATE TABLE IF NOT EXISTS `default_products_intro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `default_products_intro`
--

INSERT INTO `default_products_intro` (`id`, `text`, `lang`) VALUES
(1, '', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_product_categories`
--

CREATE TABLE IF NOT EXISTS `default_product_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `parent` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_product_images`
--

CREATE TABLE IF NOT EXISTS `default_product_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `path` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_profiles`
--

CREATE TABLE IF NOT EXISTS `default_profiles` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `ordering_count` int(11) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL,
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
  `updated_on` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `default_profiles`
--

INSERT INTO `default_profiles` (`id`, `created`, `updated`, `created_by`, `ordering_count`, `user_id`, `display_name`, `first_name`, `last_name`, `company`, `lang`, `bio`, `dob`, `gender`, `phone`, `mobile`, `address_line1`, `address_line2`, `address_line3`, `postcode`, `website`, `updated_on`) VALUES
(7, '2016-06-02 22:49:52', NULL, 7, 6, 8, 'Alvaro Forero', 'Alvaro', 'Forero', NULL, 'es', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '2015-02-21 18:38:34', NULL, NULL, 4, 5, 'usuario', 'usuario', 'usuario', NULL, 'es', '', -3600, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1442589865),
(6, '2016-06-02 22:45:23', NULL, 2, 5, 7, 'Kevin Romero', 'Kevin', 'Romero', NULL, 'es', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_projects`
--

CREATE TABLE IF NOT EXISTS `default_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

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

CREATE TABLE IF NOT EXISTS `default_projects_categories` (
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

CREATE TABLE IF NOT EXISTS `default_projects_intro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text COLLATE utf8_unicode_ci,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

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

CREATE TABLE IF NOT EXISTS `default_project_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `parent` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `default_project_categories`
--

INSERT INTO `default_project_categories` (`id`, `title`, `position`, `parent`, `slug`, `created_at`, `updated_at`, `lang`) VALUES
(1, 'Proyectos Realizados', NULL, 0, 'proyectos-realizados', '2015-05-12 08:28:43', '2015-08-14 22:43:19', 'es');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_project_images`
--

CREATE TABLE IF NOT EXISTS `default_project_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `path` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

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

CREATE TABLE IF NOT EXISTS `default_quiz` (
  `id` int(11) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `text` varchar(500) NOT NULL,
  `lang` varchar(4) NOT NULL DEFAULT 'es'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_redirects`
--

CREATE TABLE IF NOT EXISTS `default_redirects` (
  `id` int(11) NOT NULL,
  `from` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(3) NOT NULL DEFAULT '302'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_search_index`
--

CREATE TABLE IF NOT EXISTS `default_search_index` (
  `id` int(10) unsigned NOT NULL,
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

CREATE TABLE IF NOT EXISTS `default_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

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

CREATE TABLE IF NOT EXISTS `default_services_categories` (
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

CREATE TABLE IF NOT EXISTS `default_services_intro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(455) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `section` int(1) DEFAULT '1',
  `lang` varchar(2) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

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

CREATE TABLE IF NOT EXISTS `default_service_categories` (
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

CREATE TABLE IF NOT EXISTS `default_service_images` (
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

CREATE TABLE IF NOT EXISTS `default_settings` (
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
('ckeditor_config', 'CKEditor Config', 'You can find a list of valid configuration items in <a target="_blank" href="http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html">CKEditor''s documentation.</a>', 'textarea', '', '{{# this is a wysiwyg-simple editor customized for the blog module (it allows images to be inserted) #}}\n$(''textarea#intro.wysiwyg-simple'').ckeditor({\n	toolbar: [\n		[''pyroimages''],\n		[''Bold'', ''Italic'', ''-'', ''NumberedList'', ''BulletedList'', ''-'', ''Link'', ''Unlink'']\n	  ],\n	extraPlugins: ''pyroimages'',\n	width: ''99%'',\n	height: 100,\n	dialog_backgroundCoverColor: ''#000'',\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\n	language: ''{{ global:current_language }}''\n});\n\n{{# this is the config for all wysiwyg-simple textareas #}}\n$(''textarea.wysiwyg-simple'').ckeditor({\n	toolbar: [\n		[''Bold'', ''Italic'', ''-'', ''NumberedList'', ''BulletedList'', ''-'', ''Link'', ''Unlink'', ''RemoveFormat'', ''Source'']\n	  ],\n	width: ''99%'',\n	height: 100,\n	dialog_backgroundCoverColor: ''#000'',\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\n	language: ''{{ global:current_language }}''\n});\n\n{{# and this is the advanced editor #}}\n$(''textarea.wysiwyg-advanced'').ckeditor({\n	toolbar: [\n		[''Maximize''],\n		[''pyroimages'', ''pyrofiles''],\n		[''Cut'',''Copy'',''Paste'',''PasteFromWord''],\n		[''Undo'',''Redo'',''-'',''Find'',''Replace''],\n		[''Link'',''Unlink''],\n		[''Table'',''HorizontalRule'',''SpecialChar''],\n		[''Bold'',''Italic'',''StrikeThrough''],\n		[''JustifyLeft'',''JustifyCenter'',''JustifyRight'',''JustifyBlock'',''-'',''BidiLtr'',''BidiRtl''],\n		[''TextColor'',''BGColor'',''Format'', ''FontSize'', ''Subscript'',''Superscript'', ''NumberedList'',''BulletedList'',''Outdent'',''Indent'',''Blockquote''],\n		[''ShowBlocks'', ''RemoveFormat'', ''Source''],\n	],\n	extraPlugins: ''pyroimages,pyrofiles'',\n	width: ''99%'',\n	height: 400,\n	dialog_backgroundCoverColor: ''#000'',\n	removePlugins: ''elementspath'',\n	defaultLanguage: ''{{ helper:config item="default_language" }}'',\n	language: ''{{ global:current_language }}''\n});', '', 1, 1, 'wysiwyg', 993),
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
('site_public_lang', 'Public Languages', 'Which are the languages really supported and offered on the front-end of your website?', 'checkbox', 'en', 'en,es', 'func:get_supported_lang', 1, 1, '', 996),
('site_slogan', 'Site Slogan', 'The slogan of the website for page titles and for use around the site', 'text', '', '', '', 0, 1, '', 999),
('unavailable_message', 'Unavailable Message', 'When the site is turned off or there is a major problem, this message will show to users.', 'textarea', 'Sorry, this website is currently unavailable.', '', '', 0, 1, '', 987);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_theme_options`
--

CREATE TABLE IF NOT EXISTS `default_theme_options` (
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

CREATE TABLE IF NOT EXISTS `default_users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
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
  `remember_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Registered User Information' AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `default_users`
--

INSERT INTO `default_users` (`id`, `email`, `password`, `salt`, `group_id`, `ip_address`, `active`, `activation_code`, `created_on`, `last_login`, `username`, `forgotten_password_code`, `remember_code`) VALUES
(5, 'admin@escalaurbana.com', 'dbc8a33683f1cf79528274e47b2c6211bdcbb1f2', 'fafdd9', 2, '::1', 1, '37c137ca094851082f1bb97b6bed6057d220f2b7', 1424601514, 1443295123, 'administrador', NULL, '68f5566baedc3c7b1c5ece916054326f5d65c985'),
(7, 'steverp95@outlook.es', '4c5275abe44f39604962d7f606e0668f3c138f72', 'a15473', 1, '181.142.193.224', 1, NULL, 1464907523, 1464907562, 'KevinS95', NULL, 'cddd7c480879250580041d4dfa0bd2bd99e5d4e8'),
(8, 'aforeror@gmail.com', '4a365122092ae166f5dee0cf4863d6e97df5c9ad', '7b944f', 1, '181.142.193.224', 1, NULL, 1464907792, 1464908108, 'Alvarof', NULL, 'fd3d963ca51640e7be75931cee79e98e0838e13f');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_user_process`
--

CREATE TABLE IF NOT EXISTS `default_user_process` (
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

CREATE TABLE IF NOT EXISTS `default_variables` (
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

CREATE TABLE IF NOT EXISTS `default_widgets` (
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
(1, 'google_maps', 'a:10:{s:2:"en";s:11:"Google Maps";s:2:"el";s:19:"Χάρτης Google";s:2:"nl";s:11:"Google Maps";s:2:"br";s:11:"Google Maps";s:2:"pt";s:11:"Google Maps";s:2:"ru";s:17:"Карты Google";s:2:"id";s:11:"Google Maps";s:2:"fi";s:11:"Google Maps";s:2:"fr";s:11:"Google Maps";s:2:"fa";s:17:"نقشه گوگل";}', 'a:10:{s:2:"en";s:32:"Display Google Maps on your site";s:2:"el";s:78:"Προβάλετε έναν Χάρτη Google στον ιστότοπό σας";s:2:"nl";s:27:"Toon Google Maps in uw site";s:2:"br";s:34:"Mostra mapas do Google no seu site";s:2:"pt";s:34:"Mostra mapas do Google no seu site";s:2:"ru";s:80:"Выводит карты Google на страницах вашего сайта";s:2:"id";s:37:"Menampilkan Google Maps di Situs Anda";s:2:"fi";s:39:"Näytä Google Maps kartta sivustollasi";s:2:"fr";s:42:"Publiez un plan Google Maps sur votre site";s:2:"fa";s:59:"نمایش داده نقشه گوگل بر روی سایت ";}', 'Gregory Athons', 'http://www.gregathons.com', '1.0.0', 1, 1, 1464908953),
(2, 'html', 's:4:"HTML";', 'a:10:{s:2:"en";s:28:"Create blocks of custom HTML";s:2:"el";s:80:"Δημιουργήστε περιοχές με δικό σας κώδικα HTML";s:2:"br";s:41:"Permite criar blocos de HTML customizados";s:2:"pt";s:41:"Permite criar blocos de HTML customizados";s:2:"nl";s:30:"Maak blokken met maatwerk HTML";s:2:"ru";s:83:"Создание HTML-блоков с произвольным содержимым";s:2:"id";s:24:"Membuat blok HTML apapun";s:2:"fi";s:32:"Luo lohkoja omasta HTML koodista";s:2:"fr";s:36:"Créez des blocs HTML personnalisés";s:2:"fa";s:58:"ایجاد قسمت ها به صورت اچ تی ام ال";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', 1, 2, 1464908953),
(3, 'login', 'a:10:{s:2:"en";s:5:"Login";s:2:"el";s:14:"Σύνδεση";s:2:"nl";s:5:"Login";s:2:"br";s:5:"Login";s:2:"pt";s:5:"Login";s:2:"ru";s:22:"Вход на сайт";s:2:"id";s:5:"Login";s:2:"fi";s:13:"Kirjautuminen";s:2:"fr";s:9:"Connexion";s:2:"fa";s:10:"لاگین";}', 'a:10:{s:2:"en";s:36:"Display a simple login form anywhere";s:2:"el";s:96:"Προβάλετε μια απλή φόρμα σύνδεσης χρήστη οπουδήποτε";s:2:"br";s:69:"Permite colocar um formulário de login em qualquer lugar do seu site";s:2:"pt";s:69:"Permite colocar um formulário de login em qualquer lugar do seu site";s:2:"nl";s:32:"Toon overal een simpele loginbox";s:2:"ru";s:72:"Выводит простую форму для входа на сайт";s:2:"id";s:32:"Menampilkan form login sederhana";s:2:"fi";s:52:"Näytä yksinkertainen kirjautumislomake missä vain";s:2:"fr";s:54:"Affichez un formulaire de connexion où vous souhaitez";s:2:"fa";s:70:"نمایش یک لاگین ساده در هر قسمتی از سایت";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', 1, 3, 1464908953),
(4, 'navigation', 'a:10:{s:2:"en";s:10:"Navigation";s:2:"el";s:16:"Πλοήγηση";s:2:"nl";s:9:"Navigatie";s:2:"br";s:11:"Navegação";s:2:"pt";s:11:"Navegação";s:2:"ru";s:18:"Навигация";s:2:"id";s:8:"Navigasi";s:2:"fi";s:10:"Navigaatio";s:2:"fr";s:10:"Navigation";s:2:"fa";s:10:"منوها";}', 'a:10:{s:2:"en";s:40:"Display a navigation group with a widget";s:2:"el";s:100:"Προβάλετε μια ομάδα στοιχείων πλοήγησης στον ιστότοπο";s:2:"nl";s:38:"Toon een navigatiegroep met een widget";s:2:"br";s:62:"Exibe um grupo de links de navegação como widget em seu site";s:2:"pt";s:62:"Exibe um grupo de links de navegação como widget no seu site";s:2:"ru";s:88:"Отображает навигационную группу внутри виджета";s:2:"id";s:44:"Menampilkan grup navigasi menggunakan widget";s:2:"fi";s:37:"Näytä widgetillä navigaatio ryhmä";s:2:"fr";s:47:"Affichez un groupe de navigation dans un widget";s:2:"fa";s:71:"نمایش گروهی از منوها با استفاده از ویجت";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.2.0', 1, 4, 1464908953),
(5, 'rss_feed', 'a:10:{s:2:"en";s:8:"RSS Feed";s:2:"el";s:24:"Τροφοδοσία RSS";s:2:"nl";s:8:"RSS Feed";s:2:"br";s:8:"Feed RSS";s:2:"pt";s:8:"Feed RSS";s:2:"ru";s:31:"Лента новостей RSS";s:2:"id";s:8:"RSS Feed";s:2:"fi";s:10:"RSS Syöte";s:2:"fr";s:8:"Flux RSS";s:2:"fa";s:19:"خبر خوان RSS";}', 'a:10:{s:2:"en";s:41:"Display parsed RSS feeds on your websites";s:2:"el";s:82:"Προβάλετε τα περιεχόμενα μιας τροφοδοσίας RSS";s:2:"nl";s:28:"Toon RSS feeds op uw website";s:2:"br";s:48:"Interpreta e exibe qualquer feed RSS no seu site";s:2:"pt";s:48:"Interpreta e exibe qualquer feed RSS no seu site";s:2:"ru";s:94:"Выводит обработанную ленту новостей на вашем сайте";s:2:"id";s:42:"Menampilkan kutipan RSS feed di situs Anda";s:2:"fi";s:39:"Näytä purettu RSS syöte sivustollasi";s:2:"fr";s:39:"Affichez un flux RSS sur votre site web";s:2:"fa";s:46:"نمایش خوراک های RSS در سایت";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.2.0', 1, 5, 1464908953),
(6, 'social_bookmark', 'a:10:{s:2:"en";s:15:"Social Bookmark";s:2:"el";s:35:"Κοινωνική δικτύωση";s:2:"nl";s:19:"Sociale Bladwijzers";s:2:"br";s:15:"Social Bookmark";s:2:"pt";s:15:"Social Bookmark";s:2:"ru";s:37:"Социальные закладки";s:2:"id";s:15:"Social Bookmark";s:2:"fi";s:24:"Sosiaalinen kirjanmerkki";s:2:"fr";s:13:"Liens sociaux";s:2:"fa";s:52:"بوکمارک های شبکه های اجتماعی";}', 'a:10:{s:2:"en";s:47:"Configurable social bookmark links from AddThis";s:2:"el";s:111:"Παραμετροποιήσιμα στοιχεία κοινωνικής δικτυώσης από το AddThis";s:2:"nl";s:43:"Voeg sociale bladwijzers toe vanuit AddThis";s:2:"br";s:87:"Adiciona links de redes sociais usando o AddThis, podendo fazer algumas configurações";s:2:"pt";s:87:"Adiciona links de redes sociais usando o AddThis, podendo fazer algumas configurações";s:2:"ru";s:90:"Конфигурируемые социальные закладки с сайта AddThis";s:2:"id";s:60:"Tautan social bookmark yang dapat dikonfigurasi dari AddThis";s:2:"fi";s:59:"Konfiguroitava sosiaalinen kirjanmerkki linkit AddThis:stä";s:2:"fr";s:43:"Liens sociaux personnalisables avec AddThis";s:2:"fa";s:71:"تنظیم و نمایش لینک های شبکه های اجتماعی";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', 1, 6, 1464908954),
(7, 'archive', 'a:8:{s:2:"en";s:7:"Archive";s:2:"br";s:15:"Arquivo do Blog";s:2:"fa";s:10:"آرشیو";s:2:"pt";s:15:"Arquivo do Blog";s:2:"el";s:33:"Αρχείο Ιστολογίου";s:2:"fr";s:16:"Archives du Blog";s:2:"ru";s:10:"Архив";s:2:"id";s:7:"Archive";}', 'a:8:{s:2:"en";s:64:"Display a list of old months with links to posts in those months";s:2:"br";s:95:"Mostra uma lista navegação cronológica contendo o índice dos artigos publicados mensalmente";s:2:"fa";s:101:"نمایش لیست ماه های گذشته به همراه لینک به پست های مربوطه";s:2:"pt";s:95:"Mostra uma lista navegação cronológica contendo o índice dos artigos publicados mensalmente";s:2:"el";s:155:"Προβάλλει μια λίστα μηνών και συνδέσμους σε αναρτήσεις που έγιναν σε κάθε από αυτούς";s:2:"fr";s:95:"Permet d''afficher une liste des mois passés avec des liens vers les posts relatifs à ces mois";s:2:"ru";s:114:"Выводит список по месяцам со ссылками на записи в этих месяцах";s:2:"id";s:63:"Menampilkan daftar bulan beserta tautan post di setiap bulannya";}', 'Phil Sturgeon', 'http://philsturgeon.co.uk/', '1.0.0', 0, 7, 1464908953),
(8, 'blog_categories', 'a:8:{s:2:"en";s:15:"Blog Categories";s:2:"br";s:18:"Categorias do Blog";s:2:"pt";s:18:"Categorias do Blog";s:2:"el";s:41:"Κατηγορίες Ιστολογίου";s:2:"fr";s:19:"Catégories du Blog";s:2:"ru";s:29:"Категории Блога";s:2:"id";s:12:"Kateori Blog";s:2:"fa";s:28:"مجموعه های بلاگ";}', 'a:8:{s:2:"en";s:30:"Show a list of blog categories";s:2:"br";s:57:"Mostra uma lista de navegação com as categorias do Blog";s:2:"pt";s:57:"Mostra uma lista de navegação com as categorias do Blog";s:2:"el";s:97:"Προβάλει την λίστα των κατηγοριών του ιστολογίου σας";s:2:"fr";s:49:"Permet d''afficher la liste de Catégories du Blog";s:2:"ru";s:57:"Выводит список категорий блога";s:2:"id";s:35:"Menampilkan daftar kategori tulisan";s:2:"fa";s:55:"نمایش لیستی از مجموعه های بلاگ";}', 'Stephen Cozart', 'http://github.com/clip/', '1.0.0', 0, 8, 1464908953),
(9, 'latest_posts', 'a:8:{s:2:"en";s:12:"Latest posts";s:2:"br";s:24:"Artigos recentes do Blog";s:2:"fa";s:26:"آخرین ارسال ها";s:2:"pt";s:24:"Artigos recentes do Blog";s:2:"el";s:62:"Τελευταίες αναρτήσεις ιστολογίου";s:2:"fr";s:17:"Derniers articles";s:2:"ru";s:31:"Последние записи";s:2:"id";s:12:"Post Terbaru";}', 'a:8:{s:2:"en";s:39:"Display latest blog posts with a widget";s:2:"br";s:81:"Mostra uma lista de navegação para abrir os últimos artigos publicados no Blog";s:2:"fa";s:65:"نمایش آخرین پست های وبلاگ در یک ویجت";s:2:"pt";s:81:"Mostra uma lista de navegação para abrir os últimos artigos publicados no Blog";s:2:"el";s:103:"Προβάλει τις πιο πρόσφατες αναρτήσεις στο ιστολόγιό σας";s:2:"fr";s:68:"Permet d''afficher la liste des derniers posts du blog dans un Widget";s:2:"ru";s:100:"Выводит список последних записей блога внутри виджета";s:2:"id";s:51:"Menampilkan posting blog terbaru menggunakan widget";}', 'Erik Berman', 'http://www.nukleo.fr', '1.0.0', 0, 9, 1464908953),
(10, 'shearch_product', 'a:2:{s:2:"en";s:30:"Buscador de Productos (Widget)";s:2:"es";s:25:"Shearch Products (Widget)";}', 'a:2:{s:2:"en";s:16:"Shearch Products";s:2:"es";s:22:"Buscador de productos.";}', 'Luis Fernando Salazar Buitrago', 'www.imaginamos.com', '1.0', 1, 10, 1464908953),
(11, 'logo_pagina', 'a:2:{s:2:"en";s:21:"Logo Página (Widget)";s:2:"es";s:22:"Web site Logo (Widget)";}', 'a:2:{s:2:"en";s:0:"";s:2:"es";s:24:"Configuración del logo.";}', 'Luis Fernando Salazar Buitrago', 'www.imaginamos.com', '1.0', 1, 11, 1464908953),
(12, 'footer_contact_data', 'a:2:{s:2:"en";s:19:"footer_contact_data";s:2:"es";s:39:"Datos de contacto en el footer (Widget)";}', 'a:2:{s:2:"en";s:0:"";s:2:"es";s:60:"Configuración de footer datos con el modulo de contactenos.";}', 'Luis Fernando Salazar Buitrago', 'www.imaginamos.com', '1.0', 1, 12, 1464908953),
(14, 'menu_categories_product', 'a:2:{s:2:"en";s:27:"Menu de categorias (Widget)";s:2:"es";s:24:"Categories Menu (Widget)";}', 'a:2:{s:2:"en";s:15:"Categories Menu";s:2:"es";s:19:"Menu de categorias.";}', 'Luis Fernando Salazar Buitrago', 'www.imaginamos.com', '1.0', 1, 14, 1464908953),
(15, 'social_media', 'a:2:{s:2:"en";s:12:"Social Media";s:2:"es";s:39:"Datos de contacto en el footer (Widget)";}', 'a:2:{s:2:"en";s:0:"";s:2:"es";s:15:"Redes sociales.";}', 'Carolina Rodriguez', 'www.imaginamos.com', '1.0', 1, 15, 1464908954);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `default_widget_areas`
--

CREATE TABLE IF NOT EXISTS `default_widget_areas` (
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

CREATE TABLE IF NOT EXISTS `default_widget_instances` (
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

CREATE TABLE IF NOT EXISTS `default_work_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `link` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(400) COLLATE utf8_unicode_ci DEFAULT NULL,
  `outstanding` int(1) DEFAULT '0',
  `lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'es',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Volcado de datos para la tabla `default_work_team`
--

INSERT INTO `default_work_team` (`id`, `link`, `image`, `outstanding`, `lang`) VALUES
(15, 'http://www.google.com', 'uploads/default/about_us_multiples/2fccd6c755396ab846b3eebe112a73af.png', 0, 'es'),
(17, 'http://www.google.com', 'uploads/default/about_us_multiples/e21687d4f11a7a0b022cb5f8414a1395.png', 0, 'es');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
