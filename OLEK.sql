-- --------------------------------------------------------
-- Сервер:                       127.0.0.1
-- Версія сервера:               5.5.50 - MySQL Community Server (GPL)
-- ОС сервера:                   Win32
-- HeidiSQL Версія:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for olek
CREATE DATABASE IF NOT EXISTS `olek` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `olek`;


-- Dumping structure for таблиця olek.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table olek.category: ~6 rows (приблизно)
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `title`) VALUES
	(1, 'Sport'),
	(2, 'Show biznes'),
	(3, 'Ecomonic'),
	(4, 'Svarka'),
	(5, 'Политика'),
	(6, 'Аналитика');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


-- Dumping structure for таблиця olek.comment
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `publish_status` enum('moderate','publish') NOT NULL DEFAULT 'moderate',
  `post_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comment_author` (`author_id`),
  KEY `FK_comment_post` (`post_id`),
  CONSTRAINT `FK_comment_author` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_comment_post` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table olek.comment: ~3 rows (приблизно)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`id`, `pid`, `title`, `content`, `publish_status`, `post_id`, `author_id`) VALUES
	(1, NULL, 'sasha', 'fsafasfafa', 'publish', NULL, 1),
	(2, NULL, 'afsf', 'fasfa', 'moderate', 35, 1),
	(3, NULL, 'dsad', 'dasdasdas', 'publish', 35, 2);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;


-- Dumping structure for таблиця olek.post
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `anons` text NOT NULL,
  `content` text NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `publish_status` enum('draft','publish') NOT NULL DEFAULT 'publish',
  `publish_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_post_author` (`author_id`),
  KEY `FK_post_category` (`category_id`),
  CONSTRAINT `FK_post_author` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_post_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- Dumping data for table olek.post: ~7 rows (приблизно)
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` (`id`, `title`, `anons`, `content`, `category_id`, `author_id`, `publish_status`, `publish_date`, `logo`) VALUES
	(30, 'habitasse', 'Phasellus tellus ipsum', 'Phasellus tellus ipsum, malesuada quis dolor at, viverra lacinia nunc. Phasellus nec ligula eu ipsum semper porttitor. Nullam nibh nisl, ultricies sit amet tempor tempus, pulvinar non ligula. Maecenas quis felis urna. Nunc quis tellus consectetur, elementum libero quis, rutrum nisl. Vivamus ut turpis non lorem aliquam mollis.', 2, 1, 'publish', '2016-08-12 15:18:21', 'uploads/habitasse.png'),
	(31, 'porttito', 'Quisque ut laoreet dolor', 'Mauris id hendrerit nisl, ac dignissim arcu. Quisque nec nulla vel neque interdum sollicitudin. Aenean dictum libero vitae mi rhoncus, accumsan mattis orci feugiat. Mauris mauris erat, posuere ac suscipit eget, lobortis at urna. Integer nisi felis, egestas quis quam id, mattis laoreet nisl. Sed a libero ornare, bibendum libero a, tincidunt magna. Maecenas sollicitudin lorem et dapibus vestibulum. Fusce vitae ultricies sapien, ut blandit neque. Sed placerat vitae mi placerat hendrerit.', 2, 1, 'publish', '2016-08-12 15:21:26', 'uploads/porttito.png'),
	(32, 'metus', '', 'fermentum a luctus vel, pellentesque id orci. Quisque quis sem felis. Quisque vel aliquam sapien. Fusce a tortor ligula. Nullam sit amet mauris sit amet purus porttitor tempus eu ut ligula. Cras efficitur est sed risus varius accumsan. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut id tortor at nisl aliquam scelerisque quis in tortor. Aenean tempor molestie vulputate. Aenean tristique eros id nunc placerat, eu venenatis augue consequat. Suspendisse potenti. Praesent volutpat, lorem vitae sodales porttitor, turpis est porttitor ligula, at luctus ligula lectus et libero. Vestibulum cursus id ipsum eu varius. Morbi in gravida arcu.', 3, 1, 'publish', '2016-08-12 15:27:07', 'uploads/metus.png'),
	(33, 'sapien', 'Donec tristique mauris sem,', 'Vestibulum fermentum nisi ac turpis molestie, quis semper ipsum rutrum. Pellentesque faucibus nisi vel massa luctus rutrum. Etiam suscipit urna sem, nec tincidunt eros consequat et. Fusce tincidunt diam vel lectus pretium feugiat. Phasellus enim felis, varius pellentesque sem sed, finibus blandit lectus. Mauris hendrerit diam quis sapien volutpat vestibulum. Ut sodales urna vitae egestas molestie. Nulla facilisi. Nunc dapibus non odio ut consectetur. Nulla diam mi, hendrerit ut justo vitae, ultricies ultrices ante. Aenean mi tortor, dignissim sit amet euismod in, viverra in mi.', 4, 1, 'publish', '2016-08-12 15:45:14', 'uploads/sapien.png'),
	(34, 'farama', '', ' Aenean quam lacus, egestas eu magna a, blandit porta lacus. Donec neque enim, sodales et vestibulum quis, fringilla sit amet nisi. Suspendisse pulvinar fermentum metus, et varius quam maximus quis. Aenean tincidunt, mauris eu suscipit luctus, nisl turpis commodo odio, at consectetur justo turpis eget tortor. Vestibulum imperdiet laoreet scelerisque. Vestibulum at finibus neque, id volutpat turpis. Morbi faucibus posuere felis, eget malesuada libero tristique a. Aliquam quis dui at arcu tempor vulputate. Praesent convallis mauris convallis nibh finibus, vitae tincidunt sem tempor. Nullam vulputate venenatis pellentesque. Nunc quis placerat felis, iaculis finibus odio. Nullam sed elit justo.', 4, 1, 'publish', '2016-08-12 15:47:46', 'uploads/farama.png'),
	(35, 'feugiat', 'Nam feugiat felis sed vehicula porta. Integer viverra scelerisque consectetur', ' Integer ut libero pellentesque, vestibulum lorem sit amet, feugiat libero. Donec faucibus ex eu vehicula placerat. In quam lorem, cursus et odio sed, condimentum pharetra quam. Vivamus a rhoncus orci, rhoncus dapibus felis. Praesent bibendum pulvinar dolor vitae facilisis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed aliquet pretium sem et molestie. Donec aliquet mauris non felis tempus, ac aliquam neque posuere. Ut in venenatis leo.', 3, 1, 'publish', '2016-08-12 15:50:19', 'uploads/feugiat.png'),
	(36, 'semper', 'Cras semper ', 'fermentum enim sit amet commodo. Ut tincidunt sit amet dui cursus ullamcorper. In eget purus metus. Vivamus semper laoreet velit eu tempus. Donec dapibus vulputate nisi, vitae ullamcorper lacus euismod eu. Ut ut neque et massa porttitor laoreet. Mauris gravida nibh eu risus semper eleifend. In vitae ex sed enim varius ultricies. Integer lobortis nisl nec commodo bibendum. Donec nibh est, viverra a mollis eget, ultricies a mi.', 1, 2, 'publish', '2016-08-12 16:04:03', 'uploads/semper.png'),
	(37, 'faramaza', 'dasdas', 'malesuada fames ac ante ipsum primis in faucibus. Curabitur sapien nulla, semper quis lacus id, laoreet cursus est. Duis tempor gravida neque, id eleifend enim maximus vitae. Aliquam sed odio nibh. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque euismod lacinia eros at luctus. Quisque ullamcorper consequat interdum. Aenean elementum mauris mattis bibendum faucibus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Cras vestibulum lorem sed nibh sagittis, eu aliquet lorem fermentum. Sed a pulvinar est. Curabitur nunc eros, commodo eget libero vitae, molestie cursus libero. Morbi sit amet pulvinar metus. Aliquam tempor eget elit eget eleifend.', 2, 2, 'publish', '2016-08-12 16:35:17', 'uploads/faramaza.png'),
	(38, 'sodales', 'fafs', 'Sed eu dolor nec lectus consequat semper at vel turpis. Nunc risus quam, finibus vitae mattis nec, scelerisque ut sem. Quisque ac nisl efficitur, eleifend ligula vel, vulputate urna. Donec nec velit ornare, semper urna feugiat, viverra purus. Phasellus tristique eu lacus vitae venenatis. Quisque luctus, diam vel consectetur imperdiet, arcu tellus sollicitudin elit, a porta diam nisi at sapien. Curabitur et aliquam lectus. Quisque porta magna velit. Cras convallis, magna sed ultricies fermentum, quam libero volutpat massa, sed faucibus enim erat id velit. Nulla dapibus nunc sit amet metus lobortis, vitae blandit lacus maximus. Vivamus rhoncus posuere turpis, eget imperdiet lectus pharetra id.', 1, 2, 'publish', '2016-08-12 16:37:03', 'uploads/sodales.png'),
	(39, 'vulputate', 'dadada', 'Quisque velit erat, vulputate sit amet felis quis, eleifend commodo risus. Aenean quis tortor nulla. Pellentesque vitae efficitur nisi, ac laoreet leo. Etiam lobortis, dui eget vulputate tristique, lacus ante malesuada est, eget congue odio lectus quis dui. In porttitor et nisl ac commodo. Nullam quis ullamcorper nisl. Fusce commodo vel sapien at bibendum. Quisque augue diam, dignissim sed urna at, mattis pellentesque magna. Vestibulum blandit, massa ac ultrices bibendum, dui ante iaculis libero, malesuada mattis tellus mi vel quam. Suspendisse sed feugiat augue, in sollicitudin nisl. Donec elit ipsum, tempus ac lectus accumsan, efficitur varius metus. Etiam quis lectus ac mauris elementum aliquet nec eget nibh. Phasellus eget arcu rutrum, laoreet est egestas, egestas libero.', 3, 2, 'publish', '2016-08-12 16:38:50', 'uploads/vulputate.png'),
	(41, 'viverra', '', 'Curabitur viverra justo erat, sagittis aliquam mauris luctus ut. Aliquam enim diam, imperdiet eleifend rhoncus et, rhoncus sit amet diam. Aliquam interdum condimentum quam. Suspendisse tempor pulvinar neque at sodales. Maecenas feugiat quam lacus, quis egestas velit interdum imperdiet. Pellentesque commodo velit massa, quis placerat nisl gravida non. Praesent vel mauris magna. Proin augue metus, consectetur ut nibh et, luctus faucibus tortor. Curabitur ultrices, ipsum nec rutrum efficitur, ante augue tempus est, vitae blandit erat diam quis sem. In eget velit blandit, convallis ipsum sed, sagittis risus. Vestibulum rutrum vitae sem sagittis varius. Sed non aliquet magna. Morbi ullamcorper purus non augue faucibus, lobortis posuere lorem pulvinar. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.', 4, 2, 'publish', '2016-08-12 16:41:16', 'uploads/viverra.png'),
	(42, 'marakena', '', 'Donec ac lacinia mauris. Ut sed maximus risus. Aliquam erat volutpat. Quisque quis leo consectetur, eleifend ligula non, ullamcorper leo. Integer sed lorem volutpat lectus lobortis bibendum. Phasellus gravida mollis eros nec condimentum. Duis eleifend arcu sed enim imperdiet placerat. Aenean elementum luctus neque ut faucibus. Aliquam sollicitudin accumsan est non ultrices. Nunc vel ipsum enim. Sed in varius mi, a maximus sem. Etiam accumsan molestie lorem ac ullamcorper.', 3, 2, 'publish', '2016-08-12 16:42:15', 'uploads/marakena.png'),
	(44, 'turpis', 'dasda', 'Nulla semper risus augue, a iaculis orci sodales vel. Proin feugiat tellus vitae tellus luctus, a vehicula quam sollicitudin. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec enim nulla, interdum in ante et, ultrices commodo nisi. Morbi ultricies mi lorem. Nunc erat sem, tempus a aliquam vitae, egestas sit amet nisl. Ut imperdiet et sapien sed mattis. Fusce tincidunt ex sit amet elit aliquet, eget tincidunt nibh lacinia. Cras rhoncus gravida nibh. Nunc mattis lacus eget dolor dictum, hendrerit malesuada nulla mollis. Suspendisse et augue dignissim, scelerisque sem quis, faucibus turpis.', 1, 2, 'publish', '2016-08-12 16:47:07', 'uploads/turpis.png'),
	(45, 'parama', '', 'Fusce augue dolor, porttitor quis massa sed, malesuada consequat tortor. Phasellus vitae scelerisque sapien, nec dapibus lorem. Fusce nec iaculis metus. Duis gravida quam tellus, sed euismod libero suscipit eget. Nunc libero sem, pretium sit amet ipsum nec, luctus fermentum metus. Aliquam erat volutpat. Mauris tincidunt varius odio, eleifend porta orci elementum ac. Etiam laoreet quis ligula nec maximus. Aenean vulputate, ex et lacinia maximus, diam massa viverra diam, volutpat viverra lorem ante quis felis. Suspendisse orci sapien, facilisis et vulputate placerat, auctor sit amet tellus. Curabitur sed efficitur metus, at sagittis libero. Mauris in laoreet libero. Curabitur eu est viverra, efficitur ligula vitae, placerat lacus. Morbi consequat efficitur hendrerit.', 1, 2, 'publish', '2016-08-12 16:47:58', 'uploads/parama.png'),
	(46, 'malesuada', '', 'Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque ut feugiat dui. Morbi odio massa, dapibus sit amet aliquam nec, ornare non libero. Morbi posuere dui eget erat commodo, posuere placerat erat convallis. Nullam finibus in purus at condimentum. Ut turpis elit, interdum vel cursus sed, congue ac est. Maecenas faucibus elementum ex ac volutpat. Proin aliquet dui sed tristique placerat. Donec laoreet ex neque, eget dignissim lacus feugiat et. Donec porta erat pretium sapien euismod, a consequat lacus imperdiet. Nam sed iaculis ex, vitae pulvinar nibh.', 1, 2, 'publish', '2016-08-12 16:49:36', 'uploads/malesuada.png'),
	(47, 'fazas', '', 'Fusce augue dolor, porttitor quis massa sed, malesuada consequat tortor. Phasellus vitae scelerisque sapien, nec dapibus lorem. Fusce nec iaculis metus. Duis gravida quam tellus, sed euismod libero suscipit eget. Nunc libero sem, pretium sit amet ipsum nec, luctus fermentum metus. Aliquam erat volutpat. Mauris tincidunt varius odio, eleifend porta orci elementum ac. Etiam laoreet quis ligula nec maximus. Aenean vulputate, ex et lacinia maximus, diam massa viverra diam, volutpat viverra lorem ante quis felis. Suspendisse orci sapien, facilisis et vulputate placerat, auctor sit amet tellus. Curabitur sed efficitur metus, at sagittis libero. Mauris in laoreet libero. Curabitur eu est viverra, efficitur ligula vitae, placerat lacus. Morbi consequat efficitur hendrerit.', 3, 2, 'publish', '2016-08-12 16:50:40', 'uploads/fazas.png'),
	(48, 'davata', '', 'Fusce augue dolor, porttitor quis massa sed, malesuada consequat tortor. Phasellus vitae scelerisque sapien, nec dapibus lorem. Fusce nec iaculis metus. Duis gravida quam tellus, sed euismod libero suscipit eget. Nunc libero sem, pretium sit amet ipsum nec, luctus fermentum metus. Aliquam erat volutpat. Mauris tincidunt varius odio, eleifend porta orci elementum ac. Etiam laoreet quis ligula nec maximus. Aenean vulputate, ex et lacinia maximus, diam massa viverra diam, volutpat viverra lorem ante quis felis. Suspendisse orci sapien, facilisis et vulputate placerat, auctor sit amet tellus. Curabitur sed efficitur metus, at sagittis libero. Mauris in laoreet libero. Curabitur eu est viverra, efficitur ligula vitae, placerat lacus. Morbi consequat efficitur hendrerit.', 3, 2, 'publish', '2016-08-12 16:52:08', 'uploads/davata.png');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;


-- Dumping structure for таблиця olek.tags
CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table olek.tags: ~6 rows (приблизно)
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` (`id`, `title`) VALUES
	(1, 'sens'),
	(2, 'dom'),
	(3, 'olimp'),
	(4, 'dacha'),
	(5, 'sven'),
	(6, 'samura');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;


-- Dumping structure for таблиця olek.tag_post
CREATE TABLE IF NOT EXISTS `tag_post` (
  `tag_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  KEY `FK_tag` (`tag_id`),
  KEY `FK_post` (`post_id`),
  CONSTRAINT `FK_post_tag` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_tag_post` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table olek.tag_post: ~43 rows (приблизно)
/*!40000 ALTER TABLE `tag_post` DISABLE KEYS */;
INSERT INTO `tag_post` (`tag_id`, `post_id`) VALUES
	(3, NULL),
	(4, NULL),
	(5, NULL),
	(1, NULL),
	(4, NULL),
	(5, NULL),
	(6, NULL),
	(3, NULL),
	(4, NULL),
	(2, NULL),
	(3, NULL),
	(4, NULL),
	(2, NULL),
	(3, NULL),
	(4, NULL),
	(2, NULL),
	(3, NULL),
	(4, NULL),
	(2, NULL),
	(3, NULL),
	(4, NULL),
	(2, NULL),
	(3, NULL),
	(4, NULL),
	(5, NULL),
	(1, 30),
	(2, 30),
	(3, 30),
	(3, 31),
	(4, 31),
	(6, 31),
	(1, 32),
	(4, 32),
	(5, 32),
	(1, 33),
	(3, 33),
	(6, 33),
	(1, 34),
	(2, 34),
	(2, 35),
	(5, 35),
	(2, 36),
	(4, 36),
	(1, 37),
	(2, 37),
	(4, 37),
	(3, 38),
	(4, 38),
	(1, 39),
	(3, 39),
	(5, 39),
	(1, NULL),
	(2, NULL),
	(6, NULL),
	(1, 41),
	(5, 41),
	(3, 42),
	(4, 42),
	(1, NULL),
	(2, NULL),
	(1, 44),
	(2, 44),
	(1, 45),
	(2, 45),
	(6, 45),
	(1, 46),
	(2, 46),
	(1, 47),
	(2, 47),
	(3, 47),
	(2, 48),
	(3, 48);
/*!40000 ALTER TABLE `tag_post` ENABLE KEYS */;


-- Dumping structure for таблиця olek.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `role` smallint(6) NOT NULL DEFAULT '10',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table olek.user: ~2 rows (приблизно)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `role`, `status`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Jg6O-7Sho1sxY38OgTcx3RTX30VUlXTi', '$2y$13$MKjLOsF/qyONMpwqhOe99ufFNK.3f8amFf5lB27/4zD9F1Xj4EiVy', NULL, 'admin@lgmail.com', 100, 10, 1470978783, 1470978783),
	(2, 'sasha', 'PXAPFIS6JqTqMGnM6Ll0Oj5T7Iocb-vG', '$2y$13$gn6CggPV12dFFUH/5.82O.yd2mif2h9Jy.GP7EssPRIA/0b56SHrS', NULL, 'sashacherevko@yandex.ru', 100, 10, 1471006823, 1471006823);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
