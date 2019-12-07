-- --------------------------------------------------------
-- Värd:                         127.0.0.1
-- Serverversion:                10.1.38-MariaDB - mariadb.org binary distribution
-- Server-OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumpar databasstruktur för essentialmode
CREATE DATABASE IF NOT EXISTS `essentialmode` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `essentialmode`;

-- Dumpar struktur för tabell essentialmode.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.addon_account: ~8 rows (ungefär)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT IGNORE INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('motels_bed_black_money', 'Motels Black Money Bed', 0),
	('motels_black_money', 'Motels Black Money ', 0),
	('society_ambulance', 'Ambulance', 1),
	('society_bennys', 'bennys', 1),
	('society_cardealer', 'Bilförsäljare', 1),
	('society_mechanic', 'Mekaniker', 1),
	('society_police', 'Polis', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.addon_account_data: ~12 rows (ungefär)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
INSERT IGNORE INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_cardealer', 8854005, NULL),
	(3, 'society_police', 0, NULL),
	(4, 'motels_bed_black_money', 0, 'steam:110000109c2ddf3'),
	(5, 'motels_black_money', 0, 'steam:110000109c2ddf3'),
	(9, 'society_bennys', 983936, NULL),
	(10, 'society_taxi', 0, NULL),
	(11, 'society_ambulance', 0, NULL),
	(12, 'society_mechanic', 0, NULL),
	(15, 'motels_bed_black_money', 0, 'Char1:110000105dbc118'),
	(16, 'motels_black_money', 0, 'Char1:110000105dbc118'),
	(17, 'motels_bed_black_money', 0, 'steam:110000105dbc118'),
	(18, 'motels_black_money', 0, 'steam:110000105dbc118');
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.addon_inventory: ~7 rows (ungefär)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT IGNORE INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('motels', 'Motels Inventory', 0),
	('motels_bed', 'Motels Bed Inventory', 0),
	('society_bennys', 'bennys', 1),
	('society_cardealer', 'Bilförsäljare', 1),
	('society_mechanic', 'Mekaniker', 1),
	('society_police', 'Polis', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.addon_inventory_items: ~0 rows (ungefär)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.billing: ~0 rows (ungefär)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.cardealer_vehicles: ~0 rows (ungefär)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
INSERT IGNORE INTO `cardealer_vehicles` (`id`, `vehicle`, `price`) VALUES
	(1, 'ardent', 1150000);
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `dateofbirth` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sex` varchar(1) COLLATE utf8mb4_bin NOT NULL DEFAULT 'M',
  `height` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  `lastdigits` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.characters: ~2 rows (ungefär)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT IGNORE INTO `characters` (`id`, `identifier`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `lastdigits`) VALUES
	(7, 'Char1:110000105dbc118', 'Test', 'Tester', '1990-01-01', 'M', '188', '7531'),
	(8, 'steam:110000105dbc118', 'Aide', 'Aide', '1990-01-01', 'M', '188', '4987'),
	(9, 'steam:110000109c2ddf3', 'Hen', 'Tai', '1990-01-01', 'F', '123', '4987');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.datastore: ~9 rows (ungefär)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT IGNORE INTO `datastore` (`name`, `label`, `shared`) VALUES
	('motels', 'Motels Datastore', 0),
	('motels_bed', 'Motels Bed Datastore', 0),
	('society_police', 'Polis', 1),
	('society_taxi', 'Taxi', 1),
	('user_ears', 'Öronsmycken', 0),
	('user_glasses', 'Glasögon', 0),
	('user_helmet', 'Hjälmar', 0),
	('user_mask', 'Masker', 0),
	('user_watches', 'Klockor', 0);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.datastore_data: ~22 rows (ungefär)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
INSERT IGNORE INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_police', NULL, '{}'),
	(2, 'user_ears', 'steam:110000109c2ddf3', '{}'),
	(3, 'user_glasses', 'steam:110000109c2ddf3', '{}'),
	(4, 'user_mask', 'steam:110000109c2ddf3', '{}'),
	(5, 'user_helmet', 'steam:110000109c2ddf3', '{}'),
	(6, 'motels', 'steam:110000109c2ddf3', '{}'),
	(7, 'motels_bed', 'steam:110000109c2ddf3', '{}'),
	(14, 'society_taxi', NULL, '{}'),
	(21, 'user_mask', 'Char1:110000105dbc118', '{}'),
	(22, 'motels', 'Char1:110000105dbc118', '{}'),
	(23, 'motels_bed', 'Char1:110000105dbc118', '{}'),
	(24, 'user_ears', 'Char1:110000105dbc118', '{}'),
	(25, 'user_glasses', 'Char1:110000105dbc118', '{}'),
	(26, 'user_helmet', 'Char1:110000105dbc118', '{}'),
	(27, 'motels', 'steam:110000105dbc118', '{}'),
	(28, 'user_ears', 'steam:110000105dbc118', '{"hasEars":true,"skin":{"ears_2":0,"ears_1":3}}'),
	(29, 'motels_bed', 'steam:110000105dbc118', '{}'),
	(30, 'user_glasses', 'steam:110000105dbc118', '{}'),
	(31, 'user_mask', 'steam:110000105dbc118', '{}'),
	(32, 'user_helmet', 'steam:110000105dbc118', '{}'),
	(33, 'user_watches', 'steam:110000105dbc118', '{"skin":{"watches_2":1,"watches_1":4},"hasWatches":true}'),
	(34, 'user_watches', 'steam:110000109c2ddf3', '{}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.disc_ammo
CREATE TABLE IF NOT EXISTS `disc_ammo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner` text COLLATE utf8mb4_bin NOT NULL,
  `hash` text COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_ammo: ~7 rows (ungefär)
/*!40000 ALTER TABLE `disc_ammo` DISABLE KEYS */;
INSERT IGNORE INTO `disc_ammo` (`id`, `owner`, `hash`, `count`) VALUES
	(1, 'steam:110000109c2ddf3', '453432689', 0),
	(2, 'steam:110000109c2ddf3', '-1063057011', 33),
	(3, 'steam:110000109c2ddf3', '487013001', 20),
	(4, 'steam:110000109c2ddf3', '1593441988', 70),
	(5, 'steam:110000109c2ddf3', '911657153', 1),
	(6, 'steam:110000109c2ddf3', '1737195953', 0),
	(7, 'steam:110000109c2ddf3', '736523883', 0);
/*!40000 ALTER TABLE `disc_ammo` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.disc_inventory
CREATE TABLE IF NOT EXISTS `disc_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` text COLLATE utf8mb4_bin NOT NULL,
  `type` text COLLATE utf8mb4_bin,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_inventory: ~4 rows (ungefär)
/*!40000 ALTER TABLE `disc_inventory` DISABLE KEYS */;
INSERT IGNORE INTO `disc_inventory` (`id`, `owner`, `type`, `data`) VALUES
	(22, 'Polis Förråd', 'stash', '{"1":{"count":12,"name":"bread"},"2":{"name":"WEAPON_PISTOL50","count":6}}'),
	(24, 'steam:110000105dbc118', 'player', '{"18":{"count":1,"usable":false,"name":"fishingrod","price":125},"1":{"count":100,"name":"cocaineleaf"},"2":{"count":1,"name":"fishingrod"},"7":{"price":200,"usable":false,"name":"fuel","count":1},"8":{"price":150,"usable":false,"name":"grinder","count":1},"9":{"price":15,"usable":false,"name":"plasticbag","count":1},"10":{"price":200,"usable":false,"name":"scale","count":1},"3":{"count":100,"name":"cocaineleaf"},"4":{"count":100,"name":"cocaineleaf"},"5":{"count":100,"name":"cocaineleaf"},"6":{"price":100,"usable":false,"name":"chemicals","count":1},"11":{"price":450,"usable":false,"name":"seed","count":1},"15":{"count":1,"usable":false,"name":"fishingrod","price":125},"19":{"count":1,"usable":false,"name":"fishingrod","price":125},"13":{"count":9,"usable":false,"name":"bait","price":50},"12":{"price":100,"usable":false,"name":"chemicals","count":1}}'),
	(26, 'steam:110000109c2ddf3', 'player', '{"15":{"count":1,"name":"radio"},"13":{"count":1,"name":"phone"},"11":{"count":20,"name":"cigarett"},"1":{"count":1,"name":"cannabis"},"20":{"count":1,"name":"lighter"}}');
/*!40000 ALTER TABLE `disc_inventory` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.disc_inventory_itemdata
CREATE TABLE IF NOT EXISTS `disc_inventory_itemdata` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin,
  `weight` int(11) NOT NULL DEFAULT '0',
  `closeonuse` tinyint(1) NOT NULL DEFAULT '0',
  `max` int(11) NOT NULL DEFAULT '100',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_inventory_itemdata: ~26 rows (ungefär)
/*!40000 ALTER TABLE `disc_inventory_itemdata` DISABLE KEYS */;
INSERT IGNORE INTO `disc_inventory_itemdata` (`id`, `name`, `description`, `weight`, `closeonuse`, `max`) VALUES
	(3, 'adrenaline', 'En adrenalinpenna för vuxna', 0, 0, 100),
	(4, 'bandage', 'Hjälper när du är skadad', 0, 0, 100),
	(5, 'beer', 'Ölen är ofta mild och maltig i smaken och beskan är sällan särskilt framträdande. ', 0, 0, 100),
	(6, 'bread', 'En smarrig ostsmörgås', 0, 0, 100),
	(7, 'coke', 'Påverkar hela ditt centrala nervsystem. Små doser kan göra att du får ökad energi, ökad vakenhet och medvetenhet.', 0, 0, 100),
	(8, 'disc_ammo_pistol', 'Ammunition för pistoler', 0, 0, 100),
	(9, 'disc_ammo_pistol_large', 'Ammunition för pistoler', 0, 0, 100),
	(10, 'disc_ammo_smg', 'Ammunition för smg', 0, 0, 100),
	(11, 'disc_ammo_smg_large', 'Ammunition för smg', 0, 0, 100),
	(12, 'disc_ammo_rifle', 'Ammunition för gevär', 0, 0, 100),
	(13, 'disc_ammo_rifle_large', 'Ammunition för gevär', 0, 0, 100),
	(14, 'disc_ammo_shotgun', 'Ammunition för hagelgevär', 0, 0, 100),
	(15, 'disc_ammo_shotgun_large', 'Ammunition för hagelgevär', 0, 0, 100),
	(16, 'disc_ammo_snp', 'Ammunition för prickskyttegevär', 0, 0, 100),
	(17, 'disc_ammo_snp_large', 'Ammunition för prickskyttegevär', 0, 0, 100),
	(18, 'firstaid', 'Hjälper när du är skadad', 0, 0, 100),
	(19, 'gauze', 'Stoppar blödning', 0, 0, 100),
	(20, 'hydrocodone', 'Smärtstillande', 0, 0, 100),
	(21, 'medkit', 'Stoppar frakturer', 0, 0, 100),
	(22, 'meth', 'Påverkar hela ditt centrala nervsystem. Små doser kan göra att du får ökad energi, ökad vakenhet och medvetenhet.', 0, 0, 100),
	(23, 'morphine', 'Morfin används vid vissa typer av långvarig och svår smärta, som till exempel cancersmärta. ', 0, 0, 100),
	(24, 'patch', 'Lindrar blödningar', 0, 0, 100),
	(25, 'phone', 'Hallå någon där?', 0, 0, 100),
	(26, 'vicodin', 'Tramadol används vid vissa typer av smärta. Det har delvis liknande effekt som morfin.', 0, 0, 100),
	(27, 'water', 'En klassiker är tillbaka, with a lemon twist – eller förlåt, en lime twist ska det vara. Lite uppdaterad, lite godare – helt enkelt ett härligt möte mellan sött och friskt!', 0, 0, 100),
	(28, 'weed', 'Cannabisruset kan ge positiva upplevelser såsom: en större känsla av lugn och avslappning, större känslighet i sociala sammanhang, högre självmedvetenhet, bättre insikt och tolerans, bättre förståelse av en själv, högre kreativitet eller ett positivare synsätt.', 10, 0, 100),
	(29, 'WEAPON_ADVANCEDRIFLE', 'Konstruktionen skapades av Zalmen Shebs och Bor Erez, Amnon Shiloni, Motti Rosen med det uttalade syftet att göra ett gevär mer anpassat till stadskrigföring. Utvecklingen skedde ca 1991-2001, tillverkning började 2000. TAR-21 är vattentätt och lätt.', 3180, 0, 100),
	(30, 'WEAPON_APPISTOL', 'The resulting weapon, embodied in a single SCAMP prototype built in 1971, was designed to give an individual operator a huge increase in firepower, with only a slight bump in weight and bulk. Both the pistol, and the unique ammunition developed for the pistol, were shopped unsuccessfully around to the military through 1974.', 1020, 0, 100);
/*!40000 ALTER TABLE `disc_inventory_itemdata` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.disc_property
CREATE TABLE IF NOT EXISTS `disc_property` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_bin NOT NULL,
  `sold` tinyint(1) DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `locked` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_property: ~11 rows (ungefär)
/*!40000 ALTER TABLE `disc_property` DISABLE KEYS */;
INSERT IGNORE INTO `disc_property` (`id`, `name`, `sold`, `price`, `locked`) VALUES
	(1, '3655 Wild Oats Drive', 1, 300000, 1),
	(2, '2044 North Conker Avenue', 1, 250000, 1),
	(3, '2044 Hillcrest Avenue', 0, 275000, 1),
	(4, '2862 Hillcrest Avenue', 0, 265000, 1),
	(5, '2868 Hillcrest Avenue', 0, 200000, 1),
	(6, '2045 North Conker Avenue', 0, 235000, 1),
	(7, '2677 Whispymound Drive', 0, 150000, 1),
	(8, '2133 Mad Wayne Thunder Drive', 0, 125000, 1),
	(9, '1052 Grove Street', 0, 65000, 1),
	(10, '3092 West Mirror Park Drive', 0, 105000, 1),
	(11, '1054 Grove Street', 1, 75000, 1),
	(12, 'THE LOST MC', 0, 175000, 1),
	(13, 'Playboy Mansion', 0, 535000, 1);
/*!40000 ALTER TABLE `disc_property` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.disc_property_garage_vehicles
CREATE TABLE IF NOT EXISTS `disc_property_garage_vehicles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_bin NOT NULL,
  `plate` text COLLATE utf8mb4_bin NOT NULL,
  `props` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_property_garage_vehicles: ~0 rows (ungefär)
/*!40000 ALTER TABLE `disc_property_garage_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `disc_property_garage_vehicles` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.disc_property_inventory
CREATE TABLE IF NOT EXISTS `disc_property_inventory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `inventory_name` text COLLATE utf8mb4_bin,
  `data` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_property_inventory: ~0 rows (ungefär)
/*!40000 ALTER TABLE `disc_property_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `disc_property_inventory` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.disc_property_owners
CREATE TABLE IF NOT EXISTS `disc_property_owners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_bin,
  `identifier` text COLLATE utf8mb4_bin,
  `active` tinyint(1) DEFAULT '1',
  `owner` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_property_owners: ~3 rows (ungefär)
/*!40000 ALTER TABLE `disc_property_owners` DISABLE KEYS */;
INSERT IGNORE INTO `disc_property_owners` (`id`, `name`, `identifier`, `active`, `owner`) VALUES
	(3, '3655 Wild Oats Drive', 'steam:110000109c2ddf3', 1, 1),
	(5, '1054 Grove Street', 'steam:110000109c2ddf3', 1, 1),
	(6, '2044 North Conker Avenue', 'steam:110000109c2ddf3', 1, 1);
/*!40000 ALTER TABLE `disc_property_owners` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.favoriteanimation
CREATE TABLE IF NOT EXISTS `favoriteanimation` (
  `identifier` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `lib` varchar(255) COLLATE utf8mb4_bin DEFAULT 'mini@strip_club@idles@bouncer@base',
  `animation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'base',
  `scenario` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.favoriteanimation: ~2 rows (ungefär)
/*!40000 ALTER TABLE `favoriteanimation` DISABLE KEYS */;
INSERT IGNORE INTO `favoriteanimation` (`identifier`, `lib`, `animation`, `scenario`) VALUES
	('license:44be92faf675f784f2128ac35340fb9a172cefa3', 'mini@strip_club@idles@bouncer@base', 'base', 0),
	('steam:110000105dbc118', 'mini@strip_club@idles@bouncer@base', 'base', 0),
	('steam:110000109c2ddf3', 'mini@strip_club@idles@bouncer@base', 'base', 0);
/*!40000 ALTER TABLE `favoriteanimation` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.fine_types: ~52 rows (ungefär)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT IGNORE INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Missbruk av tuta', 30, 0),
	(2, 'Köra över heldragen linje', 40, 0),
	(3, 'Kört i motsatt riktning i rondell', 250, 0),
	(4, 'Olaglig u-sväng', 250, 0),
	(5, 'Olovlig körning i terräng', 170, 0),
	(6, 'Kört för nära bil framför', 30, 0),
	(7, 'Trafikfarlig stopp', 150, 0),
	(8, 'Olaglig parkering', 70, 0),
	(9, 'Använder inte högerregeln', 70, 0),
	(10, 'Aktar sig inte för tjänstefordon i utryckning', 90, 0),
	(11, 'Kört förbi stoppskylt', 105, 0),
	(12, 'Kört mot rött', 130, 0),
	(13, 'Farlig omkörning', 100, 0),
	(14, 'Fordon i dåligt skick', 100, 0),
	(15, 'Kört utan körkort', 1500, 0),
	(16, 'Smitning från olycka', 800, 0),
	(17, 'Kört för fort < 5 kmh', 90, 0),
	(18, 'Kört för fort 5-15 kmh', 120, 0),
	(19, 'Kört för fort 15-30 kmh', 180, 0),
	(20, 'Kört för fort > 30 kmh', 300, 0),
	(21, 'Blockerar trafiken', 110, 1),
	(22, 'Förstört allmän egendom', 90, 1),
	(23, 'Olaga diskriminering', 90, 1),
	(24, 'förhindrar polisens verksamhet', 130, 1),
	(25, 'Hets mot folkgrupp', 75, 1),
	(26, 'Dåligt beteende mot tjänsteman', 110, 1),
	(27, 'Verbalt hot mot annan person', 90, 1),
	(28, 'Verbalt hot mot en tjänsteman', 150, 1),
	(29, 'Olaglig protest', 250, 1),
	(30, 'Försök till mutning', 1500, 1),
	(31, 'Icke livshotande vapen på allmän plats ex. Hammare', 120, 2),
	(32, 'Dödligt vapen på allmän plats', 300, 2),
	(33, 'Vapen på allmän plats med licens (Licens Fel)', 600, 2),
	(34, 'Innehaft olaga vapen', 700, 2),
	(35, 'Försökt bryta sig in', 300, 2),
	(36, 'Bilstöld', 1800, 2),
	(37, 'Försäljning av droger', 1500, 2),
	(38, 'Tillverkning av droger', 1500, 2),
	(39, 'Innehav av droger', 650, 2),
	(40, 'Hålla gisslan/Hålla person mot dess vilja', 1500, 2),
	(41, 'Kidnappa en tjänsteman', 2000, 2),
	(42, 'Rån', 650, 2),
	(43, 'Butiksrån', 650, 2),
	(44, 'Bankrån', 1500, 2),
	(45, 'Skjutit en person', 2000, 3),
	(46, 'Skjutit en tjänsteman', 2500, 3),
	(47, 'Mordförsök', 3000, 3),
	(48, 'Mordförsök på tjänsteman', 6000, 3),
	(49, 'Mord', 10000, 3),
	(50, 'Mord på tjänsteman', 30000, 3),
	(51, 'Dråp', 1800, 3),
	(52, 'Olagliga aktiviteter inom ett företag', 2000, 2);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '1',
  `rare` tinyint(1) NOT NULL DEFAULT '0',
  `can_remove` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.items: ~135 rows (ungefär)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT IGNORE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('WEAPON_ADVANCEDRIFLE', 'CTAR-21', 1, 0, 1),
	('WEAPON_APPISTOL', 'Colt SCAMP', 1, 0, 1),
	('WEAPON_ASSAULTRIFLE', 'Armi Jager ap-80', 1, 0, 1),
	('WEAPON_ASSAULTSHOTGUN', 'UTAS UTS-15', 1, 0, 1),
	('WEAPON_ASSAULTSMG', 'Magpul PDR-C', 1, 0, 1),
	('WEAPON_AUTOSHOTGUN', 'Armsel Protecta', 1, 0, 1),
	('WEAPON_BALL', 'Boll', 1, 0, 1),
	('WEAPON_BAT', 'Slagträ', 1, 0, 1),
	('WEAPON_BATTLEAXE', 'Stridsyxa', 1, 0, 1),
	('WEAPON_BOTTLE', 'Flaska', 1, 0, 1),
	('WEAPON_BULLPUPRIFLE', 'Norinco QBZ-95', 1, 0, 1),
	('WEAPON_BULLPUPSHOTGUN', 'Kel-Tec KSG', 1, 0, 1),
	('WEAPON_BZGAS', 'M18 Rökgranat', 1, 0, 1),
	('WEAPON_CARBINERIFLE', 'M4A1', 1, 0, 1),
	('WEAPON_COMBATMG', 'FN Mk 48 Mod 1', 1, 0, 1),
	('WEAPON_COMBATPDW', 'SIG-Sauer MPX-SD', 1, 0, 1),
	('WEAPON_COMBATPISTOL', 'H&K P226 Sig Sauer', 1, 0, 1),
	('WEAPON_COMPACTLAUNCHER', 'M79 grenade launcher', 1, 0, 1),
	('WEAPON_COMPACTRIFLE', 'Micro Draco AK Pistol', 1, 0, 1),
	('WEAPON_CROWBAR', 'Kofot', 1, 0, 1),
	('WEAPON_DAGGER', 'Dolk', 1, 0, 1),
	('WEAPON_DBSHOTGUN', 'Zabala Short Barreled Shotgun', 1, 0, 1),
	('WEAPON_DIGISCANNER', 'Digiscanner', 1, 0, 1),
	('WEAPON_DOUBLEACTION', '.44 Magnum', 1, 0, 1),
	('WEAPON_FIREEXTINGUISHER', 'Brandsläckare', 1, 0, 1),
	('WEAPON_FIREWORK', 'Panzerschreck', 1, 0, 1),
	('WEAPON_FLARE', 'Bengal', 1, 0, 1),
	('WEAPON_FLAREGUN', 'Signalpistol', 1, 0, 1),
	('WEAPON_FLASHLIGHT', 'Ficklampa', 1, 0, 1),
	('WEAPON_GARBAGEBAG', 'Soppåse', 1, 0, 1),
	('WEAPON_GOLFCLUB', 'Golfklubba', 1, 0, 1),
	('WEAPON_GRENADE', 'M61 Granat', 1, 0, 1),
	('WEAPON_GRENADELAUNCHER', 'Milkor Mark 14 MGL', 1, 0, 1),
	('WEAPON_GUSENBERG', 'Thompson M1928A1', 1, 0, 1),
	('WEAPON_HAMMER', 'Hammare', 1, 0, 1),
	('WEAPON_HANDCUFFS', 'Handklovar', 1, 0, 1),
	('WEAPON_HATCHET', 'Yxa', 1, 0, 1),
	('WEAPON_HEAVYPISTOL', 'EAWB 1911', 1, 0, 1),
	('WEAPON_HEAVYSHOTGUN', 'Saiga 12', 1, 0, 1),
	('WEAPON_HEAVYSNIPER', 'Barrett M107', 1, 0, 1),
	('WEAPON_HOMINGLAUNCHER', 'FIM-92 Stinger', 1, 0, 1),
	('WEAPON_KNIFE', 'Kniv', 1, 0, 1),
	('WEAPON_KNUCKLE', 'Knogjärn', 1, 0, 1),
	('WEAPON_MACHETE', 'Machete', 1, 0, 1),
	('WEAPON_MACHINEPISTOL', 'TEC-9', 1, 0, 1),
	('WEAPON_MARKSMANPISTOL', 'Thompson Center Arms Contender', 1, 0, 1),
	('WEAPON_MARKSMANRIFLE', 'Ruger Mini-30', 1, 0, 1),
	('WEAPON_MG', 'PKM', 1, 0, 1),
	('WEAPON_MICROSMG', 'Mini Uzi', 1, 0, 1),
	('WEAPON_MINIGUN', 'GE M134 Minigun', 1, 0, 1),
	('WEAPON_MINISMG', 'Skorpion', 1, 0, 1),
	('WEAPON_MOLOTOV', 'Brandbomb', 1, 0, 1),
	('WEAPON_MUSKET', 'Musköt', 1, 0, 1),
	('WEAPON_NIGHTSTICK', 'Teleskop Batong', 1, 0, 1),
	('WEAPON_PETROLCAN', 'Bensindunk', 1, 0, 1),
	('WEAPON_PIPEBOMB', 'Rörbomb', 1, 0, 1),
	('WEAPON_PISTOL', 'Taurus PT92AF', 1, 0, 1),
	('WEAPON_PISTOL50', 'Desert Eagle', 1, 0, 1),
	('WEAPON_POOLCUE', 'Biljardkö', 1, 0, 1),
	('WEAPON_PROXMINE', 'Proximity Mine', 1, 0, 1),
	('WEAPON_PUMPSHOTGUN', 'Remington M870', 1, 0, 1),
	('WEAPON_RAILGUN', 'Rail Gun', 1, 0, 1),
	('WEAPON_REVOLVER', 'Colt M1909', 1, 0, 1),
	('WEAPON_RPG', 'RPG-7', 1, 0, 1),
	('WEAPON_SAWNOFFSHOTGUN', 'Remington M870 Avsågad', 1, 0, 1),
	('WEAPON_SMG', 'MP5N', 1, 0, 1),
	('WEAPON_SMOKEGRENADE', 'Rökgranat', 1, 0, 1),
	('WEAPON_SNIPERRIFLE', 'AW-F', 1, 0, 1),
	('WEAPON_SNOWBALL', 'Snöboll', 1, 0, 1),
	('WEAPON_SNSPISTOL', 'H&K P7M10', 1, 0, 1),
	('WEAPON_SPECIALCARBINE', 'H&K G36C', 1, 0, 1),
	('WEAPON_STICKYBOMB', 'M112 C4', 1, 0, 1),
	('WEAPON_STINGER', 'Stinger', 1, 0, 1),
	('WEAPON_STUNGUN', 'Stinger S-200', 1, 0, 1),
	('WEAPON_SWITCHBLADE', 'Stilett', 1, 0, 1),
	('WEAPON_VINTAGEPISTOL', 'PRO LASER III', 1, 0, 1),
	('WEAPON_WRENCH', 'Rörtång', 1, 0, 1),
	('adrenaline', 'EpiPen', 1, 0, 1),
	('bait', 'Fiskebete', 1, 0, 1),
	('bandage', 'Bandage', 1, 0, 1),
	('beer', 'Öl', 1, 0, 1),
	('blowpipe', 'Blåslampa', 1, 0, 1),
	('bread', 'Bröd', 1, 0, 1),
	('cannabis', 'Cannabis', 1, 0, 1),
	('carokit', 'Karosskit', 1, 0, 1),
	('carotool', 'Verktyg', 1, 0, 1),
	('causticsoda', 'Kaustiksoda', 1, 0, 1),
	('cement', 'Cement', 1, 0, 1),
	('chemicals', 'Kemikalier', 1, 0, 1),
	('cigarett', 'Cigarett', 1, 0, 1),
	('cigaretter', 'Cigarettpaket', 1, 0, 1),
	('cocaine', 'Pakterad Kokain', 1, 0, 1),
	('cocaineleaf', 'Kokablad', 1, 0, 1),
	('cocainepowder', 'Kokainpulver', 1, 0, 1),
	('disc_ammo_pistol', 'Pistol Ammo', 1, 0, 1),
	('disc_ammo_pistol_large', 'Pistol Ammo Large', 1, 0, 1),
	('disc_ammo_rifle', 'Gevär Ammo', 1, 0, 1),
	('disc_ammo_rifle_large', 'Gevär Ammo Large', 1, 0, 1),
	('disc_ammo_shotgun', 'Hagelpatroner', 1, 0, 1),
	('disc_ammo_shotgun_large', 'Hagelpatroner Large', 1, 0, 1),
	('disc_ammo_smg', 'SMG Ammo', 1, 0, 1),
	('disc_ammo_smg_large', 'SMG Ammo Large', 1, 0, 1),
	('disc_ammo_snp', 'Prickskyttegevär Ammo', 1, 0, 1),
	('disc_ammo_snp_large', 'Prickskyttegevär Ammo Large', 1, 0, 1),
	('firstaid', 'Första Hjälpen Kit', 1, 0, 1),
	('fish', 'Fisk', 1, 0, 1),
	('fishingrod', 'Fiskespö', 1, 0, 1),
	('fixkit', 'Reparationssats', 1, 0, 1),
	('fixtool', 'Reparationsverktyg', 1, 0, 1),
	('fuel', 'Bensin', 1, 0, 1),
	('gauze', 'Gasbinda', 1, 0, 1),
	('gazbottle', 'Gas Flaska', 1, 0, 1),
	('grinder', 'Grinder', 1, 0, 1),
	('hydrocodone', 'Ipren 400mg', 1, 0, 1),
	('jager', 'Jägermeister', 1, 0, 1),
	('jagerbomb', 'Jäger Bomb', 1, 0, 1),
	('jewels', 'Juvel', 1, 0, 1),
	('joint', 'Joint', 1, 0, 1),
	('lighter', 'Tändare', 1, 0, 1),
	('martini', 'Martini', 1, 0, 1),
	('medkit', 'Medicinlåda', 1, 0, 1),
	('meth', 'Amfetamin', 1, 0, 1),
	('morphine', 'Morfin', 1, 0, 1),
	('opium', 'Opium', 1, 0, 1),
	('patch', 'Salvequick Hello Kitty Plåster', 1, 0, 1),
	('phone', 'Telefon', 1, 0, 1),
	('plasticbag', 'Zip-påse', 1, 0, 1),
	('radio', 'Komradio', 1, 0, 1),
	('rawcocaine', 'Kokain', 1, 0, 1),
	('rhum', 'Rom', 1, 0, 1),
	('rizla', 'Rizla', 1, 0, 1),
	('safetyhammer', 'Busshammare', 100, 0, 1),
	('scale', 'Bordsvåg', 1, 0, 1),
	('seed', 'Cannabisfrön', 1, 0, 1),
	('snus', 'Snus', 1, 0, 1),
	('snusdosa', 'Snusdosa', 1, 0, 1),
	('tequilla', 'Tequilla', 1, 0, 1),
	('vicodin', 'Tramadol', 1, 0, 1),
	('water', 'Loka Smultron', 1, 0, 1),
	('weed', 'Cannabis', 1, 0, 1),
	('whisky', 'Whisky', 1, 0, 1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.jail
CREATE TABLE IF NOT EXISTS `jail` (
  `identifier` varchar(100) NOT NULL,
  `isjailed` tinyint(1) DEFAULT NULL,
  `J_Time` datetime NOT NULL,
  `J_Cell` varchar(20) NOT NULL,
  `Jailer` varchar(100) NOT NULL,
  `Jailer_ID` varchar(100) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpar data för tabell essentialmode.jail: ~0 rows (ungefär)
/*!40000 ALTER TABLE `jail` DISABLE KEYS */;
/*!40000 ALTER TABLE `jail` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.jobs: ~13 rows (ungefär)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT IGNORE INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'Sjukvårdare', 1),
	('bennys', 'Bennys', 1),
	('cardealer', 'Bilförsäljare', 1),
	('mechanic', 'Mekaniker', 1),
	('offambulance', 'Sjukvårdare', 1),
	('offbennys', 'Bennys', 1),
	('offcardeler', 'Bilförsäljare', 1),
	('offmechanic', 'Mekaniker', 1),
	('offpolice', 'Polis', 1),
	('offtaxi', 'Taxi', 1),
	('police', 'Polis', 1),
	('taxi', 'Taxi', 1),
	('unemployed', 'Arbetslös', 0);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_bin NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.job_grades: ~57 rows (ungefär)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT IGNORE INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 30, '{}', '{}'),
	(2, 'cardealer', 0, 'recruit', 'Provanställd', 50, '{}', '{}'),
	(3, 'cardealer', 1, 'novice', 'Anställd', 60, '{}', '{}'),
	(4, 'cardealer', 2, 'experienced', 'VD', 65, '{}', '{}'),
	(5, 'cardealer', 3, 'boss', 'Chef', 70, '{}', '{}'),
	(11, 'police', 0, 'recruit', 'Aspirant', 140, '{}', '{}'),
	(12, 'police', 1, 'officer', 'Biträdande Rikspolischef', 200, '{}', '{}'),
	(13, 'police', 2, 'sergeant', 'Assistent', 260, '{}', '{}'),
	(14, 'police', 3, 'lieutenant', 'Inspektör', 320, '{}', '{}'),
	(15, 'police', 4, 'boss', 'Rikspolischef', 380, '{}', '{}'),
	(16, 'ambulance', 0, 'ambulance', 'AT-läkare', 140, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(17, 'ambulance', 1, 'doctor', 'ST-läkare', 200, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(18, 'ambulance', 2, 'chief_doctor', 'Överläkare', 260, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(19, 'ambulance', 3, 'boss', 'Sjukhusdirektör', 320, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(20, 'bennys', 0, 'recrue', 'Provanställd', 60, '{}', '{}'),
	(21, 'bennys', 1, 'novice', 'Anställd', 65, '{}', '{}'),
	(22, 'bennys', 2, 'experimente', 'Erfaren', 70, '{}', '{}'),
	(23, 'bennys', 3, 'chief', 'Chef', 75, '{}', '{}'),
	(24, 'bennys', 4, 'boss', 'VD', 80, '{}', '{}'),
	(25, 'taxi', 0, 'recrue', 'Taxi', 50, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(26, 'taxi', 1, 'novice', 'Taxi', 60, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(27, 'taxi', 2, 'experimente', 'Taxi', 65, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(28, 'taxi', 3, 'uber', 'Personal Chef', 70, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(29, 'taxi', 4, 'boss', 'VD', 75, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(30, 'mechanic', 0, 'recrue', 'Provanställd', 50, '{}', '{}'),
	(31, 'mechanic', 1, 'novice', 'Anställd', 60, '{}', '{}'),
	(32, 'mechanic', 2, 'experimente', 'Mellanchef', 65, '{}', '{}'),
	(33, 'mechanic', 3, 'chief', 'Chef', 70, '{}', '{}'),
	(34, 'mechanic', 4, 'boss', 'VD', 75, '{}', '{}'),
	(35, 'offcardealer', 0, 'recruit', 'Ej i Tjänst', 0, '{}', '{}'),
	(36, 'offcardealer', 1, 'novice', 'Ej i Tjänst', 0, '{}', '{}'),
	(37, 'offcardealer', 2, 'experienced', 'Ej i Tjänst', 0, '{}', '{}'),
	(38, 'offcardealer', 3, 'boss', 'Ej i Tjänst', 0, '{}', '{}'),
	(39, 'offpolice', 0, 'recruit', 'Ej i Tjänst', 0, '{}', '{}'),
	(40, 'offpolice', 1, 'officer', 'Ej i Tjänst', 0, '{}', '{}'),
	(41, 'offpolice', 2, 'sergeant', 'Ej i Tjänst', 0, '{}', '{}'),
	(42, 'offpolice', 3, 'lieutenant', 'Ej i Tjänst', 0, '{}', '{}'),
	(43, 'offpolice', 4, 'boss', 'Ej i Tjänst', 0, '{}', '{}'),
	(44, 'offambulance', 0, 'ambulance', 'Ej i Tjänst', 0, '{}', '{}'),
	(45, 'offambulance', 1, 'doctor', 'Ej i Tjänst', 0, '{}', '{}'),
	(46, 'offambulance', 2, 'chief_doctor', 'Ej i Tjänst', 0, '{}', '{}'),
	(47, 'offambulance', 3, 'boss', 'Ej i Tjänst', 0, '{}', '{}'),
	(48, 'offbennys', 0, 'recrue', 'Ej i Tjänst', 0, '{}', '{}'),
	(49, 'offbennys', 1, 'novice', 'Ej i Tjänst', 0, '{}', '{}'),
	(50, 'offbennys', 2, 'experimente', 'Ej i Tjänst', 0, '{}', '{}'),
	(51, 'offbennys', 3, 'chief', 'Ej i Tjänst', 0, '{}', '{}'),
	(52, 'offbennys', 4, 'boss', 'Ej i Tjänst', 0, '{}', '{}'),
	(53, 'offtaxi', 0, 'recrue', 'Ej i Tjänst', 0, '{}', '{}'),
	(54, 'offtaxi', 1, 'novice', 'Ej i Tjänst', 0, '{}', '{}'),
	(55, 'offtaxi', 2, 'experimente', 'Ej i Tjänst', 0, '{}', '{}'),
	(56, 'offtaxi', 3, 'uber', 'Ej i Tjänst', 0, '{}', '{}'),
	(57, 'offtaxi', 4, 'boss', 'Ej i Tjänst', 0, '{}', '{}'),
	(58, 'offmechanic', 0, 'recrue', 'Ej i Tjänst', 0, '{}', '{}'),
	(59, 'offmechanic', 1, 'novice', 'Ej i Tjänst', 0, '{}', '{}'),
	(60, 'offmechanic', 2, 'experimente', 'Ej i Tjänst', 0, '{}', '{}'),
	(61, 'offmechanic', 3, 'chief', 'Ej i Tjänst', 0, '{}', '{}'),
	(62, 'offmechanic', 4, 'boss', 'Ej i Tjänst', 0, '{}', '{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.licenses: ~4 rows (ungefär)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT IGNORE INTO `licenses` (`type`, `label`) VALUES
	('dmv', 'Teoriprov'),
	('drive', 'B-Körkort'),
	('drive_bike', 'A-Körkort'),
	('drive_truck', 'C-Körkort');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.motell
CREATE TABLE IF NOT EXISTS `motell` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT,
  `ident` varchar(50) NOT NULL,
  `motel_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `motel_id` (`motel_id`),
  KEY `ident` (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumpar data för tabell essentialmode.motell: ~0 rows (ungefär)
/*!40000 ALTER TABLE `motell` DISABLE KEYS */;
/*!40000 ALTER TABLE `motell` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT 'car',
  `job` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `stored` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.owned_vehicles: ~7 rows (ungefär)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
INSERT IGNORE INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `job`, `stored`) VALUES
	('steam:110000109c2ddf3', 'ARM 942', '{"modTank":-1,"modAPlate":-1,"modTrimB":-1,"modSeats":-1,"modFender":-1,"windowTint":-1,"color2":0,"modAerials":-1,"engineHealth":1000.0,"modAirFilter":-1,"modSteeringWheel":-1,"modOrnaments":-1,"modFrontWheels":-1,"modPlateHolder":-1,"modDashboard":-1,"modSpeakers":-1,"pearlescentColor":111,"modSideSkirt":-1,"modBackWheels":-1,"plateIndex":0,"neonEnabled":[false,false,false,false],"extras":{"12":true,"10":false},"modTrimA":-1,"modDoorSpeaker":-1,"neonColor":[255,0,255],"modFrame":-1,"modSmokeEnabled":false,"modHorns":-1,"modArchCover":-1,"modTransmission":-1,"wheels":0,"modShifterLeavers":-1,"modGrille":-1,"modXenon":false,"modVanityPlate":-1,"modLivery":-1,"modRearBumper":-1,"color1":6,"modSpoilers":-1,"dirtLevel":5.1,"modDial":-1,"modTrunk":-1,"modSuspension":-1,"modHydrolic":-1,"modStruts":-1,"modTurbo":false,"modFrontBumper":-1,"bodyHealth":1000.0,"model":-344943009,"modRightFender":-1,"modExhaust":-1,"modBrakes":-1,"plate":"ARM 942","modWindows":-1,"wheelColor":156,"modEngineBlock":-1,"fuelLevel":64.6,"modRoof":-1,"modArmor":-1,"tyreSmokeColor":[255,255,255],"modHood":-1,"modEngine":-1}', 'car', '', 1),
	('steam:110000109c2ddf3', 'ETZ 864', '{"modTrimA":-1,"modAirFilter":-1,"modArchCover":-1,"modRearBumper":-1,"engineHealth":1000.0,"modXenon":false,"modSpoilers":-1,"bodyHealth":1000.0,"modFrame":-1,"modAPlate":-1,"dirtLevel":3.0,"modRightFender":-1,"modBrakes":-1,"color1":2,"color2":0,"modSuspension":-1,"modTransmission":-1,"modSideSkirt":-1,"plateIndex":4,"modFrontWheels":-1,"tyreSmokeColor":[255,255,255],"modTrimB":-1,"neonColor":[255,0,255],"modPlateHolder":-1,"modTank":-1,"modHydrolic":-1,"neonEnabled":[false,false,false,false],"modVanityPlate":-1,"modWindows":-1,"modTurbo":false,"windowTint":-1,"modLivery":-1,"model":-1973172295,"modTrunk":-1,"modHorns":-1,"plate":"ETZ 864","modArmor":-1,"modRoof":-1,"pearlescentColor":134,"wheels":1,"modSpeakers":-1,"modOrnaments":-1,"modFrontBumper":-1,"modExhaust":-1,"modSeats":-1,"modDial":-1,"extras":{"5":false,"4":false,"7":false,"6":false,"1":false,"9":false,"3":false,"2":false},"fuelLevel":65.0,"modFender":-1,"modEngineBlock":-1,"modHood":-1,"wheelColor":156,"modDashboard":-1,"modAerials":-1,"modSteeringWheel":-1,"modStruts":-1,"modEngine":-1,"modDoorSpeaker":-1,"modGrille":-1,"modShifterLeavers":-1,"modSmokeEnabled":false,"modBackWheels":-1}', 'car', 'police', 1),
	('steam:110000109c2ddf3', 'GPC 545', '{"modTrunk":-1,"modEngine":-1,"neonEnabled":[false,false,false,false],"modArmor":-1,"modAerials":-1,"modWindows":-1,"modSteeringWheel":-1,"modTrimA":-1,"color1":33,"modSmokeEnabled":false,"modBackWheels":-1,"modTurbo":false,"modTank":-1,"modStruts":-1,"engineHealth":1000.0,"modShifterLeavers":-1,"tyreSmokeColor":[255,255,255],"modVanityPlate":-1,"modGrille":-1,"fuelLevel":64.9,"wheelColor":156,"extras":{"12":false,"10":true},"modBrakes":-1,"modPlateHolder":-1,"plateIndex":0,"modRightFender":-1,"plate":"GPC 545","modFrontWheels":-1,"modFender":-1,"color2":0,"modHood":-1,"modSuspension":-1,"modSideSkirt":-1,"modTrimB":-1,"modSpeakers":-1,"modDashboard":-1,"model":2072687711,"modAirFilter":-1,"neonColor":[255,0,255],"modExhaust":-1,"modDoorSpeaker":-1,"modRearBumper":-1,"modHorns":-1,"modXenon":false,"modSpoilers":-1,"modRoof":-1,"modLivery":-1,"modDial":-1,"bodyHealth":1000.0,"pearlescentColor":30,"modArchCover":-1,"windowTint":-1,"dirtLevel":6.5,"modOrnaments":-1,"modFrontBumper":-1,"modAPlate":-1,"modSeats":-1,"modEngineBlock":-1,"modTransmission":-1,"wheels":7,"modHydrolic":-1,"modFrame":-1}', 'car', '', 1),
	('steam:110000109c2ddf3', 'HVJ 136', '{"tyreSmokeColor":[255,255,255],"modRearBumper":-1,"modXenon":false,"pearlescentColor":112,"modAerials":-1,"modDashboard":-1,"modExhaust":-1,"model":1171614426,"modStruts":-1,"windowTint":-1,"fuelLevel":68.9,"modAPlate":-1,"modPlateHolder":-1,"neonColor":[255,0,255],"modFender":-1,"color2":28,"modTurbo":false,"plate":"HVJ 136","modArmor":-1,"modSpeakers":-1,"modFrontWheels":-1,"modBackWheels":-1,"wheels":0,"modSeats":-1,"modOrnaments":-1,"modSteeringWheel":-1,"modFrame":-1,"modRightFender":-1,"neonEnabled":[false,false,false,false],"modHood":-1,"modTank":-1,"modEngineBlock":-1,"extras":{"3":false,"2":true,"1":true,"7":false,"5":false,"4":false},"modArchCover":-1,"dirtLevel":2.2,"modHorns":-1,"bodyHealth":1000.0,"modRoof":-1,"modSideSkirt":-1,"modVanityPlate":-1,"plateIndex":4,"engineHealth":1000.0,"modSpoilers":-1,"modTrimB":-1,"modSmokeEnabled":false,"modHydrolic":-1,"modWindows":-1,"modTrunk":-1,"modAirFilter":-1,"modSuspension":-1,"modShifterLeavers":-1,"modFrontBumper":-1,"wheelColor":156,"modDial":-1,"modLivery":-1,"modTransmission":-1,"modBrakes":-1,"modGrille":-1,"color1":112,"modDoorSpeaker":-1,"modTrimA":-1,"modEngine":-1}', 'car', 'ambulance', 1),
	('steam:110000109c2ddf3', 'JQO 440', '{"bodyHealth":1000.0,"modTransmission":-1,"modHydrolic":-1,"wheelColor":156,"modSmokeEnabled":false,"plate":"JQO 440","modSpeakers":-1,"modExhaust":-1,"modSpoilers":-1,"modSideSkirt":-1,"modFrontWheels":-1,"modBackWheels":-1,"windowTint":-1,"model":2046537925,"modEngine":-1,"fuelLevel":64.2,"neonEnabled":[false,false,false,false],"modWindows":-1,"wheels":1,"modTrunk":-1,"modFrontBumper":-1,"modBrakes":-1,"modTank":-1,"modArmor":-1,"modFender":-1,"modDashboard":-1,"modTrimB":-1,"modSuspension":-1,"modTrimA":-1,"tyreSmokeColor":[255,255,255],"modAerials":-1,"plateIndex":4,"modFrame":-1,"modRearBumper":-1,"modRoof":-1,"modEngineBlock":-1,"engineHealth":1000.0,"modSeats":-1,"modHorns":-1,"color1":134,"color2":134,"pearlescentColor":0,"modDoorSpeaker":-1,"modRightFender":-1,"dirtLevel":8.7,"modXenon":false,"modVanityPlate":-1,"modGrille":-1,"modOrnaments":-1,"modArchCover":-1,"modShifterLeavers":-1,"modAPlate":-1,"extras":{"2":false,"1":true},"neonColor":[255,0,255],"modSteeringWheel":-1,"modTurbo":false,"modDial":-1,"modStruts":-1,"modAirFilter":-1,"modHood":-1,"modPlateHolder":-1,"modLivery":5}', 'car', 'police', 1),
	('steam:110000109c2ddf3', 'OWG 990', '{"modRoof":-1,"extras":{"12":false,"1":false},"modLivery":7,"model":-1627000575,"engineHealth":1000.0,"modGrille":-1,"modAerials":-1,"modBrakes":-1,"tyreSmokeColor":[255,255,255],"plateIndex":4,"modRightFender":-1,"modSeats":-1,"modTank":-1,"wheels":0,"modSideSkirt":-1,"modShifterLeavers":-1,"modDial":-1,"bodyHealth":1000.0,"plate":"OWG 990","modBackWheels":-1,"dirtLevel":1.1,"modHood":-1,"modStruts":-1,"modSteeringWheel":-1,"neonEnabled":[false,false,false,false],"modArchCover":-1,"modFrame":-1,"modEngine":-1,"modPlateHolder":-1,"modSuspension":-1,"modWindows":-1,"modOrnaments":-1,"modEngineBlock":-1,"fuelLevel":64.3,"modExhaust":-1,"modSpeakers":-1,"modAirFilter":-1,"pearlescentColor":0,"modTrimB":-1,"wheelColor":156,"modRearBumper":-1,"modSmokeEnabled":false,"neonColor":[255,0,255],"modHorns":-1,"modHydrolic":-1,"modFrontBumper":-1,"modXenon":false,"color1":134,"modAPlate":-1,"modDoorSpeaker":-1,"modTransmission":-1,"color2":0,"modSpoilers":-1,"modVanityPlate":-1,"windowTint":-1,"modTrunk":-1,"modTrimA":-1,"modFrontWheels":-1,"modArmor":-1,"modFender":-1,"modDashboard":-1,"modTurbo":false}', 'car', 'police', 1),
	('steam:110000109c2ddf3', 'PLC 142', '{"modFrontWheels":-1,"modHorns":-1,"modBrakes":-1,"modTrimB":-1,"modEngine":-1,"windowTint":-1,"fuelLevel":63.8,"modArchCover":-1,"modArmor":-1,"modSeats":-1,"modVanityPlate":-1,"dirtLevel":5.2,"wheels":6,"modRightFender":-1,"modSpeakers":-1,"modTrunk":-1,"modFrontBumper":-1,"color2":0,"wheelColor":156,"plateIndex":3,"modOrnaments":-1,"modXenon":false,"modDoorSpeaker":-1,"modSuspension":-1,"modAerials":-1,"modSpoilers":-1,"modSteeringWheel":-1,"engineHealth":1000.0,"color1":33,"modDial":-1,"modHood":-1,"modStruts":-1,"modLivery":-1,"modBackWheels":-1,"modPlateHolder":-1,"modTank":-1,"model":-2140431165,"modExhaust":-1,"modAPlate":-1,"modDashboard":-1,"modShifterLeavers":-1,"neonEnabled":[false,false,false,false],"modFrame":-1,"bodyHealth":1000.0,"modRearBumper":-1,"modSideSkirt":-1,"modAirFilter":-1,"plate":"PLC 142","tyreSmokeColor":[255,255,255],"pearlescentColor":33,"modFender":-1,"modWindows":-1,"modTransmission":-1,"neonColor":[255,0,255],"modHydrolic":-1,"modRoof":-1,"modTrimA":-1,"extras":[],"modSmokeEnabled":false,"modGrille":-1,"modTurbo":false,"modEngineBlock":-1}', 'car', '', 1);
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.phone_app_chat
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumpar data för tabell essentialmode.phone_app_chat: ~0 rows (ungefär)
/*!40000 ALTER TABLE `phone_app_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_app_chat` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.phone_calls
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumpar data för tabell essentialmode.phone_calls: ~0 rows (ungefär)
/*!40000 ALTER TABLE `phone_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_calls` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isRead` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- Dumpar data för tabell essentialmode.phone_messages: 0 rows
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.phone_users_contacts
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumpar data för tabell essentialmode.phone_users_contacts: 0 rows
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.rented_vehicles: ~0 rows (ungefär)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.society_moneywash: ~0 rows (ungefär)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.trunk_inventory
CREATE TABLE IF NOT EXISTS `trunk_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  `data` text COLLATE utf8mb4_bin NOT NULL,
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.trunk_inventory: ~0 rows (ungefär)
/*!40000 ALTER TABLE `trunk_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `trunk_inventory` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.twitter_accounts
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.twitter_accounts: ~0 rows (ungefär)
/*!40000 ALTER TABLE `twitter_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_accounts` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.twitter_likes
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.twitter_likes: ~0 rows (ungefär)
/*!40000 ALTER TABLE `twitter_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_likes` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `likes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpar data för tabell essentialmode.twitter_tweets: ~0 rows (ungefär)
/*!40000 ALTER TABLE `twitter_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_tweets` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  `loadout` longtext COLLATE utf8mb4_bin,
  `position` varchar(36) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `lastdigits` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT '0',
  `status` longtext COLLATE utf8mb4_bin,
  `last_motel` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `last_motel_room` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `tattoos` longtext COLLATE utf8mb4_bin,
  `phone_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.users: ~3 rows (ungefär)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`identifier`, `license`, `money`, `name`, `skin`, `job`, `job_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `lastdigits`, `is_dead`, `status`, `last_motel`, `last_motel_room`, `tattoos`, `phone_number`) VALUES
	('Char1:110000105dbc118', 'license:4f3d30d5ce73246ea1e6742b5495d7a32c051f58', 0, 'chrono', '{"sun_2":0,"eyebrows_2":0,"lipstick_1":0,"bodyb_1":0,"hair_color_2":0,"glasses_2":0,"torso_1":0,"makeup_3":0,"chain_1":0,"hair_1":3,"helmet_2":0,"chest_2":0,"makeup_1":0,"blemishes_1":0,"beard_1":0,"blush_1":0,"arms":0,"decals_2":0,"bracelets_2":0,"mask_1":0,"watches_1":-1,"makeup_2":0,"chain_2":0,"hair_2":0,"face":5,"ears_1":-1,"hair_color_1":0,"lipstick_2":0,"complexion_2":0,"ears_2":0,"eyebrows_3":0,"eyebrows_4":0,"glasses_1":0,"lipstick_4":0,"bproof_2":0,"decals_1":0,"pants_1":0,"lipstick_3":0,"bodyb_2":0,"helmet_1":-1,"torso_2":0,"moles_1":0,"sex":0,"moles_2":0,"beard_4":0,"bags_2":0,"bags_1":0,"sun_1":0,"age_1":0,"eye_color":0,"mask_2":0,"complexion_1":0,"watches_2":0,"eyebrows_1":0,"age_2":0,"tshirt_2":0,"skin":3,"arms_2":0,"makeup_4":0,"blush_3":0,"bracelets_1":-1,"tshirt_1":0,"blemishes_2":0,"beard_2":0,"pants_2":0,"shoes_1":0,"bproof_1":0,"blush_2":0,"chest_3":0,"beard_3":0,"chest_1":0,"shoes_2":0}', 'police', 3, '[]', '{"z":48.0,"y":5178.5,"x":1945.1}', 1000000, 0, 'superadmin', 'Test', 'Tester', '1990-01-01', 'M', '188', '7531', 0, '[{"name":"hunger","percent":67.5,"val":675000},{"name":"thirst","percent":75.625,"val":756250},{"name":"drunk","percent":0.0,"val":0},{"name":"drug","percent":0.0,"val":0}]', NULL, NULL, NULL, NULL),
	('steam:110000105dbc118', 'license:4f3d30d5ce73246ea1e6742b5495d7a32c051f58', 350, 'chrono', '{"eyebrows_4":0,"lipstick_2":0,"beard_3":0,"bracelets_2":0,"helmet_2":0,"blush_1":0,"beard_2":0,"blemishes_1":0,"age_1":0,"complexion_1":0,"bags_1":0,"arms_2":0,"hair_color_2":0,"beard_4":0,"helmet_1":-1,"shoes_2":0,"complexion_2":0,"torso_1":0,"ears_2":0,"lipstick_1":0,"sun_1":0,"moles_1":0,"tshirt_2":0,"blemishes_2":0,"glasses_2":0,"bodyb_2":0,"torso_2":0,"pants_2":0,"eye_color":0,"sun_2":0,"eyebrows_2":0,"chest_2":0,"makeup_2":0,"bproof_1":0,"moles_2":0,"arms":0,"eyebrows_1":0,"face":2,"bracelets_1":-1,"tshirt_1":0,"hair_color_1":0,"chest_1":0,"decals_1":0,"chest_3":0,"hair_2":0,"chain_1":0,"shoes_1":0,"bproof_2":0,"skin":2,"age_2":0,"lipstick_3":0,"sex":0,"watches_2":0,"makeup_1":0,"mask_2":0,"beard_1":0,"blush_2":0,"ears_1":-1,"makeup_4":0,"mask_1":0,"bodyb_1":0,"hair_1":3,"watches_1":-1,"pants_1":0,"lipstick_4":0,"bags_2":0,"blush_3":0,"decals_2":0,"glasses_1":0,"makeup_3":0,"eyebrows_3":0,"chain_2":0}', 'bennys', 4, '[]', '{"x":189.4,"z":45.7,"y":2795.1}', 1130, 0, 'superadmin', 'Aide', 'Aide', '1990-01-01', 'M', '188', '4987', 0, '[{"val":205600,"name":"hunger","percent":20.56},{"val":279200,"name":"thirst","percent":27.92},{"val":0,"name":"drunk","percent":0.0},{"val":0,"name":"drug","percent":0.0}]', NULL, NULL, NULL, NULL),
	('steam:110000109c2ddf3', 'license:44be92faf675f784f2128ac35340fb9a172cefa3', 1288275257, 'Mirrox', '{"blush_1":0,"chain_2":0,"lipstick_1":0,"makeup_2":10,"sex":1,"skin":0,"tshirt_2":1,"bags_1":0,"moles_2":0,"tshirt_1":52,"glasses_1":5,"lipstick_2":0,"chest_1":0,"beard_4":0,"pants_2":1,"eye_color":0,"arms":25,"helmet_2":0,"eyebrows_4":0,"eyebrows_3":0,"watches_2":0,"shoes_2":3,"bproof_1":0,"blemishes_1":0,"hair_color_1":38,"bags_2":0,"age_2":0,"beard_1":0,"glasses_2":0,"chest_2":0,"helmet_1":-1,"bodyb_2":0,"decals_2":0,"bodyb_1":0,"eyebrows_2":10,"lipstick_4":0,"torso_2":0,"mask_1":0,"arms_2":0,"blush_2":0,"hair_1":45,"shoes_1":11,"hair_2":0,"decals_1":0,"watches_1":-1,"bproof_2":0,"chain_1":0,"bracelets_2":0,"eyebrows_1":0,"mask_2":0,"makeup_3":0,"beard_3":0,"lipstick_3":0,"chest_3":0,"age_1":0,"hair_color_2":37,"beard_2":0,"complexion_1":0,"torso_1":1,"blemishes_2":0,"face":21,"ears_2":0,"sun_2":0,"moles_1":0,"complexion_2":0,"sun_1":0,"blush_3":0,"makeup_1":0,"bracelets_1":-1,"pants_1":43,"makeup_4":0,"ears_1":-1}', 'taxi', 4, '[{"name":"WEAPON_PETROLCAN","components":[],"ammo":4370,"label":"Bensindunk"}]', '{"z":74.1,"y":-174.6,"x":906.0}', 0, 4, 'superadmin', 'Hen', 'Tai', '1990-01-01', 'F', '123', '4987', 0, '[{"name":"hunger","val":632100,"percent":63.21},{"name":"thirst","val":724075,"percent":72.4075},{"name":"drunk","val":0,"percent":0.0},{"name":"drug","val":0,"percent":0.0}]', NULL, NULL, NULL, '0734152526');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.user_accessories
CREATE TABLE IF NOT EXISTS `user_accessories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `mask` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin DEFAULT 'Masque',
  `type` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.user_accessories: 1 rows
/*!40000 ALTER TABLE `user_accessories` DISABLE KEYS */;
INSERT IGNORE INTO `user_accessories` (`id`, `identifier`, `mask`, `label`, `type`, `index`) VALUES
	(38, 'steam:110000109c2ddf3', '{"mask_2":0,"mask_1":47}', 'Casque d\'aviateur', 'Hatt', NULL);
/*!40000 ALTER TABLE `user_accessories` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.user_accounts
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `money` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.user_accounts: ~4 rows (ungefär)
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
INSERT IGNORE INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
	(3, 'steam:110000109c2ddf3', 'black_money', 0),
	(5, 'Char3:110000105dbc118', 'black_money', 0),
	(6, 'Char1:110000105dbc118', 'black_money', 0),
	(7, 'steam:110000105dbc118', 'black_money', 0);
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.user_drugs
CREATE TABLE IF NOT EXISTS `user_drugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `drugnumber` int(11) NOT NULL,
  `water` int(11) NOT NULL DEFAULT '2',
  `time` int(11) NOT NULL DEFAULT '15',
  `x` varchar(255) NOT NULL,
  `y` varchar(255) NOT NULL,
  `z` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumpar data för tabell essentialmode.user_drugs: ~0 rows (ungefär)
/*!40000 ALTER TABLE `user_drugs` DISABLE KEYS */;
INSERT IGNORE INTO `user_drugs` (`id`, `identifier`, `drugnumber`, `water`, `time`, `x`, `y`, `z`) VALUES
	(15, 'steam:110000105dbc118', 38, 2, 0, '1060.84', '-3187.57', '-39.14');
/*!40000 ALTER TABLE `user_drugs` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.user_inventory
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=647 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.user_inventory: ~528 rows (ungefär)
/*!40000 ALTER TABLE `user_inventory` DISABLE KEYS */;
INSERT IGNORE INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
	(1, 'steam:110000109c2ddf3', 'bread', 0),
	(2, 'steam:110000109c2ddf3', 'water', 0),
	(3, 'steam:110000109c2ddf3', 'rhum', 0),
	(4, 'steam:110000109c2ddf3', 'beer', 0),
	(5, 'steam:110000109c2ddf3', 'coke', 0),
	(6, 'steam:110000109c2ddf3', 'martini', 0),
	(7, 'steam:110000109c2ddf3', 'jager', 0),
	(8, 'steam:110000109c2ddf3', 'whisky', 0),
	(9, 'steam:110000109c2ddf3', 'jagerbomb', 0),
	(10, 'steam:110000109c2ddf3', 'opium', 0),
	(11, 'steam:110000109c2ddf3', 'tequilla', 0),
	(12, 'steam:110000109c2ddf3', 'meth', 0),
	(13, 'steam:110000109c2ddf3', 'weed', 0),
	(132, 'Char3:110000105dbc118', 'jagerbomb', 0),
	(133, 'Char3:110000105dbc118', 'water', 0),
	(134, 'Char3:110000105dbc118', 'WEAPON_MINIGUN', 0),
	(135, 'Char3:110000105dbc118', 'WEAPON_GOLFCLUB', 0),
	(136, 'Char3:110000105dbc118', 'disc_ammo_shotgun', 0),
	(137, 'Char3:110000105dbc118', 'WEAPON_PISTOL', 0),
	(138, 'Char3:110000105dbc118', 'WEAPON_COMBATPISTOL', 0),
	(139, 'Char3:110000105dbc118', 'WEAPON_COMBATMG', 0),
	(140, 'Char3:110000105dbc118', 'WEAPON_AUTOSHOTGUN', 0),
	(141, 'Char3:110000105dbc118', 'WEAPON_NIGHTSTICK', 0),
	(142, 'Char3:110000105dbc118', 'disc_ammo_smg_large', 0),
	(143, 'Char3:110000105dbc118', 'WEAPON_GRENADE', 0),
	(144, 'Char3:110000105dbc118', 'WEAPON_KNUCKLE', 0),
	(145, 'Char3:110000105dbc118', 'WEAPON_REVOLVER', 0),
	(146, 'Char3:110000105dbc118', 'WEAPON_APPISTOL', 0),
	(147, 'Char3:110000105dbc118', 'morphine', 0),
	(148, 'Char3:110000105dbc118', 'disc_ammo_rifle', 0),
	(149, 'Char3:110000105dbc118', 'WEAPON_BZGAS', 0),
	(150, 'Char3:110000105dbc118', 'WEAPON_PISTOL50', 0),
	(151, 'Char3:110000105dbc118', 'weed', 0),
	(152, 'Char3:110000105dbc118', 'WEAPON_HEAVYSHOTGUN', 0),
	(153, 'Char3:110000105dbc118', 'vicodin', 0),
	(154, 'Char3:110000105dbc118', 'disc_ammo_snp', 0),
	(155, 'Char3:110000105dbc118', 'tequilla', 0),
	(156, 'Char3:110000105dbc118', 'WEAPON_PROXMINE', 0),
	(157, 'Char3:110000105dbc118', 'WEAPON_HEAVYSNIPER', 0),
	(158, 'Char3:110000105dbc118', 'WEAPON_MACHINEPISTOL', 0),
	(159, 'Char3:110000105dbc118', 'WEAPON_PIPEBOMB', 0),
	(160, 'Char3:110000105dbc118', 'safetyhammer', 0),
	(161, 'Char3:110000105dbc118', 'WEAPON_CROWBAR', 0),
	(162, 'Char3:110000105dbc118', 'WEAPON_RPG', 0),
	(163, 'Char3:110000105dbc118', 'WEAPON_ASSAULTRIFLE', 0),
	(164, 'Char3:110000105dbc118', 'WEAPON_STINGER', 0),
	(165, 'Char3:110000105dbc118', 'WEAPON_HATCHET', 0),
	(166, 'Char3:110000105dbc118', 'patch', 0),
	(167, 'Char3:110000105dbc118', 'disc_ammo_smg', 0),
	(168, 'Char3:110000105dbc118', 'WEAPON_RAILGUN', 0),
	(169, 'Char3:110000105dbc118', 'opium', 0),
	(170, 'Char3:110000105dbc118', 'whisky', 0),
	(171, 'Char3:110000105dbc118', 'WEAPON_SNSPISTOL', 0),
	(172, 'Char3:110000105dbc118', 'jewels', 0),
	(173, 'Char3:110000105dbc118', 'martini', 0),
	(174, 'Char3:110000105dbc118', 'jager', 0),
	(175, 'Char3:110000105dbc118', 'WEAPON_BATTLEAXE', 0),
	(176, 'Char3:110000105dbc118', 'hydrocodone', 0),
	(177, 'Char3:110000105dbc118', 'WEAPON_SMG', 0),
	(178, 'Char3:110000105dbc118', 'WEAPON_FIREEXTINGUISHER', 0),
	(179, 'Char3:110000105dbc118', 'WEAPON_DOUBLEACTION', 0),
	(180, 'Char3:110000105dbc118', 'fixtool', 0),
	(181, 'Char3:110000105dbc118', 'gauze', 0),
	(182, 'Char3:110000105dbc118', 'firstaid', 0),
	(183, 'Char3:110000105dbc118', 'WEAPON_DIGISCANNER', 0),
	(184, 'Char3:110000105dbc118', 'WEAPON_SWITCHBLADE', 0),
	(185, 'Char3:110000105dbc118', 'meth', 0),
	(186, 'Char3:110000105dbc118', 'phone', 0),
	(187, 'Char3:110000105dbc118', 'disc_ammo_shotgun_large', 0),
	(188, 'Char3:110000105dbc118', 'disc_ammo_rifle_large', 0),
	(189, 'Char3:110000105dbc118', 'WEAPON_DBSHOTGUN', 0),
	(190, 'Char3:110000105dbc118', 'WEAPON_GUSENBERG', 0),
	(191, 'Char3:110000105dbc118', 'carokit', 0),
	(192, 'Char3:110000105dbc118', 'WEAPON_MOLOTOV', 0),
	(193, 'Char3:110000105dbc118', 'WEAPON_PUMPSHOTGUN', 0),
	(194, 'Char3:110000105dbc118', 'disc_ammo_pistol', 0),
	(195, 'Char3:110000105dbc118', 'WEAPON_SMOKEGRENADE', 0),
	(196, 'Char3:110000105dbc118', 'WEAPON_MINISMG', 0),
	(197, 'Char3:110000105dbc118', 'coke', 0),
	(198, 'Char3:110000105dbc118', 'WEAPON_MARKSMANRIFLE', 0),
	(199, 'Char3:110000105dbc118', 'carotool', 0),
	(200, 'Char3:110000105dbc118', 'WEAPON_BOTTLE', 0),
	(201, 'Char3:110000105dbc118', 'disc_ammo_pistol_large', 0),
	(202, 'Char3:110000105dbc118', 'WEAPON_BALL', 0),
	(203, 'Char3:110000105dbc118', 'bread', 3),
	(204, 'Char3:110000105dbc118', 'WEAPON_SAWNOFFSHOTGUN', 0),
	(205, 'Char3:110000105dbc118', 'WEAPON_STUNGUN', 0),
	(206, 'Char3:110000105dbc118', 'beer', 0),
	(207, 'Char3:110000105dbc118', 'WEAPON_HAMMER', 0),
	(208, 'Char3:110000105dbc118', 'WEAPON_FIREWORK', 0),
	(209, 'Char3:110000105dbc118', 'bandage', 0),
	(210, 'Char3:110000105dbc118', 'WEAPON_ASSAULTSHOTGUN', 0),
	(211, 'Char3:110000105dbc118', 'WEAPON_HOMINGLAUNCHER', 0),
	(212, 'Char3:110000105dbc118', 'WEAPON_POOLCUE', 0),
	(213, 'Char3:110000105dbc118', 'adrenaline', 0),
	(214, 'Char3:110000105dbc118', 'WEAPON_GARBAGEBAG', 0),
	(215, 'Char3:110000105dbc118', 'WEAPON_WRENCH', 0),
	(216, 'Char3:110000105dbc118', 'blowpipe', 0),
	(217, 'Char3:110000105dbc118', 'rhum', 0),
	(218, 'Char3:110000105dbc118', 'disc_ammo_snp_large', 0),
	(219, 'Char3:110000105dbc118', 'WEAPON_VINTAGEPISTOL', 0),
	(220, 'Char3:110000105dbc118', 'WEAPON_STICKYBOMB', 0),
	(221, 'Char3:110000105dbc118', 'WEAPON_BULLPUPRIFLE', 0),
	(222, 'Char3:110000105dbc118', 'WEAPON_SPECIALCARBINE', 0),
	(223, 'Char3:110000105dbc118', 'WEAPON_SNIPERRIFLE', 0),
	(224, 'Char3:110000105dbc118', 'WEAPON_SNOWBALL', 0),
	(225, 'Char3:110000105dbc118', 'WEAPON_MARKSMANPISTOL', 0),
	(226, 'Char3:110000105dbc118', 'WEAPON_MG', 0),
	(227, 'Char3:110000105dbc118', 'WEAPON_DAGGER', 0),
	(228, 'Char3:110000105dbc118', 'WEAPON_HANDCUFFS', 0),
	(229, 'Char3:110000105dbc118', 'WEAPON_CARBINERIFLE', 0),
	(230, 'Char3:110000105dbc118', 'WEAPON_GRENADELAUNCHER', 0),
	(231, 'Char3:110000105dbc118', 'gazbottle', 0),
	(232, 'Char3:110000105dbc118', 'WEAPON_ASSAULTSMG', 0),
	(233, 'Char3:110000105dbc118', 'medkit', 0),
	(234, 'Char3:110000105dbc118', 'WEAPON_BULLPUPSHOTGUN', 0),
	(235, 'Char3:110000105dbc118', 'WEAPON_ADVANCEDRIFLE', 0),
	(236, 'Char3:110000105dbc118', 'WEAPON_KNIFE', 0),
	(237, 'Char3:110000105dbc118', 'WEAPON_FLASHLIGHT', 0),
	(238, 'Char3:110000105dbc118', 'WEAPON_FLAREGUN', 0),
	(239, 'Char3:110000105dbc118', 'WEAPON_COMPACTLAUNCHER', 0),
	(240, 'Char3:110000105dbc118', 'WEAPON_BAT', 0),
	(241, 'Char3:110000105dbc118', 'WEAPON_FLARE', 0),
	(242, 'Char3:110000105dbc118', 'WEAPON_COMBATPDW', 0),
	(243, 'Char3:110000105dbc118', 'WEAPON_MUSKET', 0),
	(244, 'Char3:110000105dbc118', 'WEAPON_PETROLCAN', 0),
	(245, 'Char3:110000105dbc118', 'fixkit', 0),
	(246, 'Char3:110000105dbc118', 'WEAPON_MICROSMG', 0),
	(247, 'Char3:110000105dbc118', 'WEAPON_MACHETE', 0),
	(248, 'Char3:110000105dbc118', 'WEAPON_COMPACTRIFLE', 0),
	(249, 'Char3:110000105dbc118', 'WEAPON_HEAVYPISTOL', 0),
	(250, 'Char1:110000105dbc118', 'WEAPON_SNSPISTOL', 0),
	(251, 'Char1:110000105dbc118', 'vicodin', 0),
	(252, 'Char1:110000105dbc118', 'WEAPON_HAMMER', 0),
	(253, 'Char1:110000105dbc118', 'WEAPON_MUSKET', 0),
	(254, 'Char1:110000105dbc118', 'WEAPON_HANDCUFFS', 0),
	(255, 'Char1:110000105dbc118', 'water', 0),
	(256, 'Char1:110000105dbc118', 'rhum', 0),
	(257, 'Char1:110000105dbc118', 'disc_ammo_snp_large', 0),
	(258, 'Char1:110000105dbc118', 'opium', 0),
	(259, 'Char1:110000105dbc118', 'WEAPON_DOUBLEACTION', 0),
	(260, 'Char1:110000105dbc118', 'weed', 0),
	(261, 'Char1:110000105dbc118', 'WEAPON_SMG', 0),
	(262, 'Char1:110000105dbc118', 'WEAPON_BULLPUPRIFLE', 0),
	(263, 'Char1:110000105dbc118', 'WEAPON_GOLFCLUB', 0),
	(264, 'Char1:110000105dbc118', 'WEAPON_MINISMG', 0),
	(265, 'Char1:110000105dbc118', 'WEAPON_FIREWORK', 0),
	(266, 'Char1:110000105dbc118', 'whisky', 0),
	(267, 'Char1:110000105dbc118', 'morphine', 0),
	(268, 'Char1:110000105dbc118', 'patch', 0),
	(269, 'Char1:110000105dbc118', 'WEAPON_MACHINEPISTOL', 0),
	(270, 'Char1:110000105dbc118', 'tequilla', 0),
	(271, 'Char1:110000105dbc118', 'WEAPON_GUSENBERG', 0),
	(272, 'Char1:110000105dbc118', 'phone', 0),
	(273, 'Char1:110000105dbc118', 'WEAPON_GARBAGEBAG', 0),
	(274, 'Char1:110000105dbc118', 'fixkit', 0),
	(275, 'Char1:110000105dbc118', 'WEAPON_HOMINGLAUNCHER', 0),
	(276, 'Char1:110000105dbc118', 'WEAPON_POOLCUE', 0),
	(277, 'Char1:110000105dbc118', 'WEAPON_COMPACTLAUNCHER', 0),
	(278, 'Char1:110000105dbc118', 'meth', 0),
	(279, 'Char1:110000105dbc118', 'safetyhammer', 0),
	(280, 'Char1:110000105dbc118', 'jager', 0),
	(281, 'Char1:110000105dbc118', 'WEAPON_BALL', 0),
	(282, 'Char1:110000105dbc118', 'WEAPON_HEAVYSHOTGUN', 0),
	(283, 'Char1:110000105dbc118', 'WEAPON_ASSAULTSHOTGUN', 0),
	(284, 'Char1:110000105dbc118', 'WEAPON_COMBATMG', 0),
	(285, 'Char1:110000105dbc118', 'WEAPON_BATTLEAXE', 0),
	(286, 'Char1:110000105dbc118', 'WEAPON_RPG', 0),
	(287, 'Char1:110000105dbc118', 'jagerbomb', 0),
	(288, 'Char1:110000105dbc118', 'WEAPON_MINIGUN', 0),
	(289, 'Char1:110000105dbc118', 'WEAPON_MOLOTOV', 0),
	(290, 'Char1:110000105dbc118', 'WEAPON_DAGGER', 0),
	(291, 'Char1:110000105dbc118', 'WEAPON_REVOLVER', 0),
	(292, 'Char1:110000105dbc118', 'jewels', 0),
	(293, 'Char1:110000105dbc118', 'carokit', 0),
	(294, 'Char1:110000105dbc118', 'hydrocodone', 0),
	(295, 'Char1:110000105dbc118', 'medkit', 0),
	(296, 'Char1:110000105dbc118', 'WEAPON_AUTOSHOTGUN', 0),
	(297, 'Char1:110000105dbc118', 'gazbottle', 0),
	(298, 'Char1:110000105dbc118', 'WEAPON_GRENADELAUNCHER', 0),
	(299, 'Char1:110000105dbc118', 'WEAPON_GRENADE', 0),
	(300, 'Char1:110000105dbc118', 'gauze', 0),
	(301, 'Char1:110000105dbc118', 'disc_ammo_smg', 0),
	(302, 'Char1:110000105dbc118', 'firstaid', 0),
	(303, 'Char1:110000105dbc118', 'disc_ammo_snp', 0),
	(304, 'Char1:110000105dbc118', 'WEAPON_PETROLCAN', 0),
	(305, 'Char1:110000105dbc118', 'disc_ammo_rifle', 0),
	(306, 'Char1:110000105dbc118', 'WEAPON_PISTOL', 0),
	(307, 'Char1:110000105dbc118', 'disc_ammo_rifle_large', 0),
	(308, 'Char1:110000105dbc118', 'WEAPON_SMOKEGRENADE', 0),
	(309, 'Char1:110000105dbc118', 'disc_ammo_smg_large', 0),
	(310, 'Char1:110000105dbc118', 'fixtool', 0),
	(311, 'Char1:110000105dbc118', 'blowpipe', 0),
	(312, 'Char1:110000105dbc118', 'WEAPON_FLARE', 0),
	(313, 'Char1:110000105dbc118', 'WEAPON_STICKYBOMB', 0),
	(314, 'Char1:110000105dbc118', 'disc_ammo_shotgun_large', 0),
	(315, 'Char1:110000105dbc118', 'disc_ammo_shotgun', 0),
	(316, 'Char1:110000105dbc118', 'WEAPON_CARBINERIFLE', 0),
	(317, 'Char1:110000105dbc118', 'WEAPON_DIGISCANNER', 0),
	(318, 'Char1:110000105dbc118', 'disc_ammo_pistol_large', 0),
	(319, 'Char1:110000105dbc118', 'WEAPON_MACHETE', 0),
	(320, 'Char1:110000105dbc118', 'carotool', 0),
	(321, 'Char1:110000105dbc118', 'WEAPON_PIPEBOMB', 0),
	(322, 'Char1:110000105dbc118', 'WEAPON_VINTAGEPISTOL', 0),
	(323, 'Char1:110000105dbc118', 'beer', 0),
	(324, 'Char1:110000105dbc118', 'WEAPON_ASSAULTSMG', 0),
	(325, 'Char1:110000105dbc118', 'adrenaline', 0),
	(326, 'Char1:110000105dbc118', 'WEAPON_HATCHET', 0),
	(327, 'Char1:110000105dbc118', 'bandage', 0),
	(328, 'Char1:110000105dbc118', 'WEAPON_WRENCH', 0),
	(329, 'Char1:110000105dbc118', 'WEAPON_COMBATPISTOL', 0),
	(330, 'Char1:110000105dbc118', 'WEAPON_MG', 0),
	(331, 'Char1:110000105dbc118', 'bread', -12),
	(332, 'Char1:110000105dbc118', 'WEAPON_SWITCHBLADE', 0),
	(333, 'Char1:110000105dbc118', 'WEAPON_PUMPSHOTGUN', 0),
	(334, 'Char1:110000105dbc118', 'WEAPON_ADVANCEDRIFLE', 0),
	(335, 'Char1:110000105dbc118', 'WEAPON_SPECIALCARBINE', 0),
	(336, 'Char1:110000105dbc118', 'WEAPON_STINGER', 0),
	(337, 'Char1:110000105dbc118', 'WEAPON_PROXMINE', 0),
	(338, 'Char1:110000105dbc118', 'WEAPON_BOTTLE', 0),
	(339, 'Char1:110000105dbc118', 'WEAPON_BZGAS', 0),
	(340, 'Char1:110000105dbc118', 'WEAPON_BAT', 0),
	(341, 'Char1:110000105dbc118', 'WEAPON_SNIPERRIFLE', 0),
	(342, 'Char1:110000105dbc118', 'WEAPON_SNOWBALL', 0),
	(343, 'Char1:110000105dbc118', 'WEAPON_SAWNOFFSHOTGUN', 0),
	(344, 'Char1:110000105dbc118', 'WEAPON_COMPACTRIFLE', 0),
	(345, 'Char1:110000105dbc118', 'WEAPON_ASSAULTRIFLE', 0),
	(346, 'Char1:110000105dbc118', 'WEAPON_MARKSMANPISTOL', 0),
	(347, 'Char1:110000105dbc118', 'WEAPON_DBSHOTGUN', 0),
	(348, 'Char1:110000105dbc118', 'martini', 0),
	(349, 'Char1:110000105dbc118', 'WEAPON_RAILGUN', 0),
	(350, 'Char1:110000105dbc118', 'WEAPON_MARKSMANRIFLE', 0),
	(351, 'Char1:110000105dbc118', 'WEAPON_COMBATPDW', 0),
	(352, 'Char1:110000105dbc118', 'WEAPON_FLASHLIGHT', 0),
	(353, 'Char1:110000105dbc118', 'WEAPON_KNUCKLE', 0),
	(354, 'Char1:110000105dbc118', 'WEAPON_CROWBAR', 0),
	(355, 'Char1:110000105dbc118', 'WEAPON_NIGHTSTICK', 0),
	(356, 'Char1:110000105dbc118', 'WEAPON_PISTOL50', 0),
	(357, 'Char1:110000105dbc118', 'WEAPON_FIREEXTINGUISHER', 0),
	(358, 'Char1:110000105dbc118', 'coke', 0),
	(359, 'Char1:110000105dbc118', 'WEAPON_KNIFE', 0),
	(360, 'Char1:110000105dbc118', 'WEAPON_HEAVYPISTOL', 0),
	(361, 'Char1:110000105dbc118', 'WEAPON_BULLPUPSHOTGUN', 0),
	(362, 'Char1:110000105dbc118', 'WEAPON_APPISTOL', 0),
	(363, 'Char1:110000105dbc118', 'WEAPON_MICROSMG', 0),
	(364, 'Char1:110000105dbc118', 'WEAPON_STUNGUN', 0),
	(365, 'Char1:110000105dbc118', 'WEAPON_FLAREGUN', 0),
	(366, 'Char1:110000105dbc118', 'disc_ammo_pistol', 0),
	(367, 'Char1:110000105dbc118', 'WEAPON_HEAVYSNIPER', 0),
	(368, 'Char1:110000105dbc118', 'cannabis', 0),
	(369, 'Char1:110000105dbc118', 'joint', 0),
	(370, 'Char1:110000105dbc118', 'rizla', 0),
	(371, 'Char1:110000105dbc118', 'seed', 0),
	(372, 'Char1:110000105dbc118', 'fuel', 0),
	(373, 'Char1:110000105dbc118', 'plasticbag', 0),
	(374, 'Char1:110000105dbc118', 'grinder', 0),
	(375, 'Char1:110000105dbc118', 'cocaineleaf', 0),
	(376, 'Char1:110000105dbc118', 'cocainepowder', 0),
	(377, 'Char1:110000105dbc118', 'causticsoda', 0),
	(378, 'Char1:110000105dbc118', 'cocaine', 0),
	(379, 'Char1:110000105dbc118', 'scale', 0),
	(380, 'Char1:110000105dbc118', 'cement', 0),
	(381, 'Char1:110000105dbc118', 'chemicals', 0),
	(382, 'Char1:110000105dbc118', 'rawcocaine', 0),
	(383, 'steam:110000105dbc118', 'water', -1),
	(384, 'steam:110000105dbc118', 'carokit', 0),
	(385, 'steam:110000105dbc118', 'grinder', 1),
	(386, 'steam:110000105dbc118', 'WEAPON_COMPACTRIFLE', 0),
	(387, 'steam:110000105dbc118', 'cannabis', 0),
	(388, 'steam:110000105dbc118', 'WEAPON_ASSAULTSMG', 0),
	(389, 'steam:110000105dbc118', 'WEAPON_COMBATPDW', 0),
	(390, 'steam:110000105dbc118', 'WEAPON_HEAVYSNIPER', 0),
	(391, 'steam:110000105dbc118', 'WEAPON_SMG', 0),
	(392, 'steam:110000105dbc118', 'WEAPON_NIGHTSTICK', 0),
	(393, 'steam:110000105dbc118', 'WEAPON_BOTTLE', 0),
	(394, 'steam:110000105dbc118', 'rizla', 0),
	(395, 'steam:110000105dbc118', 'fixtool', 0),
	(396, 'steam:110000105dbc118', 'WEAPON_VINTAGEPISTOL', 0),
	(397, 'steam:110000105dbc118', 'disc_ammo_snp_large', 0),
	(398, 'steam:110000105dbc118', 'morphine', 0),
	(399, 'steam:110000105dbc118', 'disc_ammo_smg', 0),
	(400, 'steam:110000105dbc118', 'whisky', 0),
	(401, 'steam:110000105dbc118', 'WEAPON_HAMMER', 0),
	(402, 'steam:110000105dbc118', 'rawcocaine', 0),
	(403, 'steam:110000105dbc118', 'hydrocodone', 0),
	(404, 'steam:110000105dbc118', 'bread', 0),
	(405, 'steam:110000105dbc118', 'WEAPON_FLAREGUN', 0),
	(406, 'steam:110000105dbc118', 'WEAPON_BALL', 0),
	(407, 'steam:110000105dbc118', 'WEAPON_HANDCUFFS', 0),
	(408, 'steam:110000105dbc118', 'WEAPON_MARKSMANRIFLE', 0),
	(409, 'steam:110000105dbc118', 'WEAPON_DBSHOTGUN', 0),
	(410, 'steam:110000105dbc118', 'joint', 3),
	(411, 'steam:110000105dbc118', 'WEAPON_RAILGUN', 0),
	(412, 'steam:110000105dbc118', 'WEAPON_CARBINERIFLE', 0),
	(413, 'steam:110000105dbc118', 'WEAPON_MG', 0),
	(414, 'steam:110000105dbc118', 'gazbottle', 0),
	(415, 'steam:110000105dbc118', 'disc_ammo_pistol', 0),
	(416, 'steam:110000105dbc118', 'causticsoda', 0),
	(417, 'steam:110000105dbc118', 'WEAPON_HEAVYSHOTGUN', 0),
	(418, 'steam:110000105dbc118', 'cocainepowder', 1),
	(419, 'steam:110000105dbc118', 'disc_ammo_rifle_large', 0),
	(420, 'steam:110000105dbc118', 'rhum', 0),
	(421, 'steam:110000105dbc118', 'fixkit', 0),
	(422, 'steam:110000105dbc118', 'chemicals', 2),
	(423, 'steam:110000105dbc118', 'WEAPON_GUSENBERG', 0),
	(424, 'steam:110000105dbc118', 'WEAPON_SWITCHBLADE', 0),
	(425, 'steam:110000105dbc118', 'WEAPON_ASSAULTRIFLE', 0),
	(426, 'steam:110000105dbc118', 'WEAPON_FLARE', 0),
	(427, 'steam:110000105dbc118', 'WEAPON_HOMINGLAUNCHER', 0),
	(428, 'steam:110000105dbc118', 'WEAPON_MARKSMANPISTOL', 0),
	(429, 'steam:110000105dbc118', 'WEAPON_MOLOTOV', 0),
	(430, 'steam:110000105dbc118', 'WEAPON_PISTOL', 0),
	(431, 'steam:110000105dbc118', 'WEAPON_HEAVYPISTOL', 0),
	(432, 'steam:110000105dbc118', 'blowpipe', 0),
	(433, 'steam:110000105dbc118', 'meth', 0),
	(434, 'steam:110000105dbc118', 'weed', 0),
	(435, 'steam:110000105dbc118', 'WEAPON_GARBAGEBAG', 0),
	(436, 'steam:110000105dbc118', 'WEAPON_SNSPISTOL', 0),
	(437, 'steam:110000105dbc118', 'WEAPON_AUTOSHOTGUN', 0),
	(438, 'steam:110000105dbc118', 'WEAPON_COMBATMG', 0),
	(439, 'steam:110000105dbc118', 'WEAPON_WRENCH', 0),
	(440, 'steam:110000105dbc118', 'firstaid', 0),
	(441, 'steam:110000105dbc118', 'WEAPON_SAWNOFFSHOTGUN', 0),
	(442, 'steam:110000105dbc118', 'opium', 0),
	(443, 'steam:110000105dbc118', 'WEAPON_STINGER', 0),
	(444, 'steam:110000105dbc118', 'WEAPON_SNIPERRIFLE', 0),
	(445, 'steam:110000105dbc118', 'WEAPON_HATCHET', 0),
	(446, 'steam:110000105dbc118', 'WEAPON_FLASHLIGHT', 0),
	(447, 'steam:110000105dbc118', 'WEAPON_SPECIALCARBINE', 0),
	(448, 'steam:110000105dbc118', 'adrenaline', 0),
	(449, 'steam:110000105dbc118', 'WEAPON_GRENADELAUNCHER', 0),
	(450, 'steam:110000105dbc118', 'WEAPON_REVOLVER', 0),
	(451, 'steam:110000105dbc118', 'WEAPON_FIREEXTINGUISHER', 0),
	(452, 'steam:110000105dbc118', 'cocaine', 15),
	(453, 'steam:110000105dbc118', 'WEAPON_DAGGER', 0),
	(454, 'steam:110000105dbc118', 'beer', 0),
	(455, 'steam:110000105dbc118', 'disc_ammo_snp', 0),
	(456, 'steam:110000105dbc118', 'jagerbomb', 0),
	(457, 'steam:110000105dbc118', 'carotool', 0),
	(458, 'steam:110000105dbc118', 'WEAPON_MUSKET', 0),
	(459, 'steam:110000105dbc118', 'disc_ammo_pistol_large', 0),
	(460, 'steam:110000105dbc118', 'WEAPON_DOUBLEACTION', 0),
	(461, 'steam:110000105dbc118', 'disc_ammo_shotgun', 0),
	(462, 'steam:110000105dbc118', 'WEAPON_MACHINEPISTOL', 0),
	(463, 'steam:110000105dbc118', 'WEAPON_PIPEBOMB', 0),
	(464, 'steam:110000105dbc118', 'WEAPON_COMBATPISTOL', 0),
	(465, 'steam:110000105dbc118', 'WEAPON_DIGISCANNER', 0),
	(466, 'steam:110000105dbc118', 'plasticbag', 1),
	(467, 'steam:110000105dbc118', 'WEAPON_KNUCKLE', 0),
	(468, 'steam:110000105dbc118', 'fuel', 4),
	(469, 'steam:110000105dbc118', 'WEAPON_BULLPUPRIFLE', 0),
	(470, 'steam:110000105dbc118', 'WEAPON_ASSAULTSHOTGUN', 0),
	(471, 'steam:110000105dbc118', 'WEAPON_PISTOL50', 0),
	(472, 'steam:110000105dbc118', 'WEAPON_FIREWORK', 0),
	(473, 'steam:110000105dbc118', 'WEAPON_BULLPUPSHOTGUN', 0),
	(474, 'steam:110000105dbc118', 'WEAPON_PROXMINE', 0),
	(475, 'steam:110000105dbc118', 'WEAPON_RPG', 0),
	(476, 'steam:110000105dbc118', 'vicodin', 0),
	(477, 'steam:110000105dbc118', 'tequilla', 0),
	(478, 'steam:110000105dbc118', 'phone', 0),
	(479, 'steam:110000105dbc118', 'WEAPON_GOLFCLUB', 0),
	(480, 'steam:110000105dbc118', 'WEAPON_POOLCUE', 0),
	(481, 'steam:110000105dbc118', 'medkit', 0),
	(482, 'steam:110000105dbc118', 'seed', 1),
	(483, 'steam:110000105dbc118', 'WEAPON_SMOKEGRENADE', 0),
	(484, 'steam:110000105dbc118', 'disc_ammo_shotgun_large', 0),
	(485, 'steam:110000105dbc118', 'scale', 3),
	(486, 'steam:110000105dbc118', 'safetyhammer', 0),
	(487, 'steam:110000105dbc118', 'gauze', 0),
	(488, 'steam:110000105dbc118', 'WEAPON_PUMPSHOTGUN', 0),
	(489, 'steam:110000105dbc118', 'WEAPON_BATTLEAXE', 0),
	(490, 'steam:110000105dbc118', 'disc_ammo_rifle', 0),
	(491, 'steam:110000105dbc118', 'WEAPON_STUNGUN', 0),
	(492, 'steam:110000105dbc118', 'patch', 0),
	(493, 'steam:110000105dbc118', 'WEAPON_BAT', 0),
	(494, 'steam:110000105dbc118', 'WEAPON_MACHETE', 0),
	(495, 'steam:110000105dbc118', 'WEAPON_MINIGUN', 0),
	(496, 'steam:110000105dbc118', 'WEAPON_MICROSMG', 0),
	(497, 'steam:110000105dbc118', 'WEAPON_CROWBAR', 0),
	(498, 'steam:110000105dbc118', 'martini', 0),
	(499, 'steam:110000105dbc118', 'cocaineleaf', 400),
	(500, 'steam:110000105dbc118', 'jewels', 0),
	(501, 'steam:110000105dbc118', 'WEAPON_APPISTOL', 0),
	(502, 'steam:110000105dbc118', 'jager', 0),
	(503, 'steam:110000105dbc118', 'disc_ammo_smg_large', 0),
	(504, 'steam:110000105dbc118', 'WEAPON_SNOWBALL', 0),
	(505, 'steam:110000105dbc118', 'WEAPON_MINISMG', 0),
	(506, 'steam:110000105dbc118', 'WEAPON_KNIFE', 0),
	(507, 'steam:110000105dbc118', 'cement', 1),
	(508, 'steam:110000105dbc118', 'WEAPON_ADVANCEDRIFLE', 0),
	(509, 'steam:110000105dbc118', 'WEAPON_STICKYBOMB', 0),
	(510, 'steam:110000105dbc118', 'WEAPON_COMPACTLAUNCHER', 0),
	(511, 'steam:110000105dbc118', 'WEAPON_GRENADE', 0),
	(512, 'steam:110000105dbc118', 'WEAPON_BZGAS', 0),
	(513, 'steam:110000105dbc118', 'WEAPON_PETROLCAN', 0),
	(514, 'steam:110000105dbc118', 'bandage', 0),
	(515, 'steam:110000105dbc118', 'bait', 9),
	(516, 'steam:110000105dbc118', 'fish', 0),
	(517, 'steam:110000105dbc118', 'fishingrod', 4),
	(518, 'steam:110000109c2ddf3', 'WEAPON_HATCHET', 0),
	(519, 'steam:110000109c2ddf3', 'blowpipe', 0),
	(520, 'steam:110000109c2ddf3', 'disc_ammo_shotgun', 0),
	(521, 'steam:110000109c2ddf3', 'WEAPON_ASSAULTSHOTGUN', 0),
	(522, 'steam:110000109c2ddf3', 'WEAPON_KNIFE', 0),
	(523, 'steam:110000109c2ddf3', 'WEAPON_POOLCUE', 0),
	(524, 'steam:110000109c2ddf3', 'WEAPON_PUMPSHOTGUN', 0),
	(525, 'steam:110000109c2ddf3', 'WEAPON_REVOLVER', 0),
	(526, 'steam:110000109c2ddf3', 'WEAPON_ADVANCEDRIFLE', 0),
	(527, 'steam:110000109c2ddf3', 'WEAPON_DAGGER', 0),
	(528, 'steam:110000109c2ddf3', 'WEAPON_STUNGUN', 0),
	(529, 'steam:110000109c2ddf3', 'WEAPON_APPISTOL', 0),
	(530, 'steam:110000109c2ddf3', 'WEAPON_SWITCHBLADE', 0),
	(531, 'steam:110000109c2ddf3', 'WEAPON_GRENADE', 0),
	(532, 'steam:110000109c2ddf3', 'safetyhammer', 0),
	(533, 'steam:110000109c2ddf3', 'WEAPON_GARBAGEBAG', 0),
	(534, 'steam:110000109c2ddf3', 'WEAPON_STINGER', 0),
	(535, 'steam:110000109c2ddf3', 'WEAPON_BAT', 0),
	(536, 'steam:110000109c2ddf3', 'causticsoda', 0),
	(537, 'steam:110000109c2ddf3', 'WEAPON_COMPACTRIFLE', 0),
	(538, 'steam:110000109c2ddf3', 'WEAPON_FLASHLIGHT', 0),
	(539, 'steam:110000109c2ddf3', 'WEAPON_CROWBAR', 0),
	(540, 'steam:110000109c2ddf3', 'WEAPON_GUSENBERG', 0),
	(541, 'steam:110000109c2ddf3', 'fixtool', 0),
	(542, 'steam:110000109c2ddf3', 'WEAPON_FLAREGUN', 0),
	(543, 'steam:110000109c2ddf3', 'WEAPON_BULLPUPSHOTGUN', 0),
	(544, 'steam:110000109c2ddf3', 'WEAPON_COMBATMG', 0),
	(545, 'steam:110000109c2ddf3', 'WEAPON_DOUBLEACTION', 0),
	(546, 'steam:110000109c2ddf3', 'scale', 0),
	(547, 'steam:110000109c2ddf3', 'gazbottle', 0),
	(548, 'steam:110000109c2ddf3', 'WEAPON_KNUCKLE', 0),
	(549, 'steam:110000109c2ddf3', 'WEAPON_ASSAULTRIFLE', 0),
	(550, 'steam:110000109c2ddf3', 'cocainepowder', 0),
	(551, 'steam:110000109c2ddf3', 'disc_ammo_pistol', 0),
	(552, 'steam:110000109c2ddf3', 'WEAPON_CARBINERIFLE', 0),
	(553, 'steam:110000109c2ddf3', 'WEAPON_DBSHOTGUN', 0),
	(554, 'steam:110000109c2ddf3', 'WEAPON_AUTOSHOTGUN', 0),
	(555, 'steam:110000109c2ddf3', 'cocaineleaf', 0),
	(556, 'steam:110000109c2ddf3', 'WEAPON_SAWNOFFSHOTGUN', 0),
	(557, 'steam:110000109c2ddf3', 'WEAPON_BZGAS', 0),
	(558, 'steam:110000109c2ddf3', 'WEAPON_VINTAGEPISTOL', 0),
	(559, 'steam:110000109c2ddf3', 'WEAPON_PIPEBOMB', 0),
	(560, 'steam:110000109c2ddf3', 'fuel', 0),
	(561, 'steam:110000109c2ddf3', 'cement', 0),
	(562, 'steam:110000109c2ddf3', 'grinder', 0),
	(563, 'steam:110000109c2ddf3', 'gauze', 0),
	(564, 'steam:110000109c2ddf3', 'WEAPON_SPECIALCARBINE', 0),
	(565, 'steam:110000109c2ddf3', 'medkit', 0),
	(566, 'steam:110000109c2ddf3', 'patch', 0),
	(567, 'steam:110000109c2ddf3', 'bandage', 0),
	(568, 'steam:110000109c2ddf3', 'WEAPON_RPG', 0),
	(569, 'steam:110000109c2ddf3', 'WEAPON_MACHINEPISTOL', 0),
	(570, 'steam:110000109c2ddf3', 'WEAPON_FIREEXTINGUISHER', 0),
	(571, 'steam:110000109c2ddf3', 'seed', 0),
	(572, 'steam:110000109c2ddf3', 'WEAPON_BOTTLE', 0),
	(573, 'steam:110000109c2ddf3', 'adrenaline', 0),
	(574, 'steam:110000109c2ddf3', 'WEAPON_FLARE', 0),
	(575, 'steam:110000109c2ddf3', 'WEAPON_MINIGUN', 0),
	(576, 'steam:110000109c2ddf3', 'WEAPON_MOLOTOV', 0),
	(577, 'steam:110000109c2ddf3', 'disc_ammo_smg', 0),
	(578, 'steam:110000109c2ddf3', 'WEAPON_GOLFCLUB', 0),
	(579, 'steam:110000109c2ddf3', 'WEAPON_HEAVYSHOTGUN', 0),
	(580, 'steam:110000109c2ddf3', 'disc_ammo_smg_large', 0),
	(581, 'steam:110000109c2ddf3', 'disc_ammo_pistol_large', 0),
	(582, 'steam:110000109c2ddf3', 'WEAPON_NIGHTSTICK', 0),
	(583, 'steam:110000109c2ddf3', 'bait', 0),
	(584, 'steam:110000109c2ddf3', 'WEAPON_BALL', 0),
	(585, 'steam:110000109c2ddf3', 'fishingrod', 0),
	(586, 'steam:110000109c2ddf3', 'WEAPON_ASSAULTSMG', 0),
	(587, 'steam:110000109c2ddf3', 'carokit', 0),
	(588, 'steam:110000109c2ddf3', 'WEAPON_MUSKET', 0),
	(589, 'steam:110000109c2ddf3', 'WEAPON_DIGISCANNER', 0),
	(590, 'steam:110000109c2ddf3', 'hydrocodone', 0),
	(591, 'steam:110000109c2ddf3', 'WEAPON_RAILGUN', 0),
	(592, 'steam:110000109c2ddf3', 'WEAPON_BULLPUPRIFLE', 0),
	(593, 'steam:110000109c2ddf3', 'carotool', 0),
	(594, 'steam:110000109c2ddf3', 'chemicals', 0),
	(595, 'steam:110000109c2ddf3', 'WEAPON_PISTOL', 0),
	(596, 'steam:110000109c2ddf3', 'WEAPON_BATTLEAXE', 0),
	(597, 'steam:110000109c2ddf3', 'WEAPON_MARKSMANRIFLE', 0),
	(598, 'steam:110000109c2ddf3', 'WEAPON_SNOWBALL', 0),
	(599, 'steam:110000109c2ddf3', 'WEAPON_PETROLCAN', 0),
	(600, 'steam:110000109c2ddf3', 'disc_ammo_rifle_large', 0),
	(601, 'steam:110000109c2ddf3', 'disc_ammo_snp_large', 0),
	(602, 'steam:110000109c2ddf3', 'WEAPON_HANDCUFFS', 0),
	(603, 'steam:110000109c2ddf3', 'WEAPON_MICROSMG', 0),
	(604, 'steam:110000109c2ddf3', 'fixkit', 0),
	(605, 'steam:110000109c2ddf3', 'vicodin', 0),
	(606, 'steam:110000109c2ddf3', 'WEAPON_SMG', 0),
	(607, 'steam:110000109c2ddf3', 'plasticbag', 0),
	(608, 'steam:110000109c2ddf3', 'disc_ammo_rifle', 0),
	(609, 'steam:110000109c2ddf3', 'WEAPON_FIREWORK', 0),
	(610, 'steam:110000109c2ddf3', 'WEAPON_SNSPISTOL', 0),
	(611, 'steam:110000109c2ddf3', 'WEAPON_MINISMG', 0),
	(612, 'steam:110000109c2ddf3', 'WEAPON_MG', 0),
	(613, 'steam:110000109c2ddf3', 'WEAPON_WRENCH', 0),
	(614, 'steam:110000109c2ddf3', 'WEAPON_MARKSMANPISTOL', 0),
	(615, 'steam:110000109c2ddf3', 'morphine', 0),
	(616, 'steam:110000109c2ddf3', 'rizla', 0),
	(617, 'steam:110000109c2ddf3', 'WEAPON_PROXMINE', 0),
	(618, 'steam:110000109c2ddf3', 'WEAPON_SNIPERRIFLE', 0),
	(619, 'steam:110000109c2ddf3', 'WEAPON_SMOKEGRENADE', 0),
	(620, 'steam:110000109c2ddf3', 'WEAPON_HAMMER', 0),
	(621, 'steam:110000109c2ddf3', 'WEAPON_STICKYBOMB', 0),
	(622, 'steam:110000109c2ddf3', 'disc_ammo_shotgun_large', 0),
	(623, 'steam:110000109c2ddf3', 'joint', 0),
	(624, 'steam:110000109c2ddf3', 'rawcocaine', 0),
	(625, 'steam:110000109c2ddf3', 'phone', 1),
	(626, 'steam:110000109c2ddf3', 'cannabis', 1),
	(627, 'steam:110000109c2ddf3', 'cocaine', 0),
	(628, 'steam:110000109c2ddf3', 'fish', 0),
	(629, 'steam:110000109c2ddf3', 'WEAPON_HEAVYSNIPER', 0),
	(630, 'steam:110000109c2ddf3', 'WEAPON_HOMINGLAUNCHER', 0),
	(631, 'steam:110000109c2ddf3', 'WEAPON_MACHETE', 0),
	(632, 'steam:110000109c2ddf3', 'jewels', 0),
	(633, 'steam:110000109c2ddf3', 'WEAPON_PISTOL50', 0),
	(634, 'steam:110000109c2ddf3', 'WEAPON_GRENADELAUNCHER', 0),
	(635, 'steam:110000109c2ddf3', 'disc_ammo_snp', 0),
	(636, 'steam:110000109c2ddf3', 'WEAPON_COMPACTLAUNCHER', 0),
	(637, 'steam:110000109c2ddf3', 'WEAPON_HEAVYPISTOL', 0),
	(638, 'steam:110000109c2ddf3', 'firstaid', 0),
	(639, 'steam:110000109c2ddf3', 'WEAPON_COMBATPISTOL', 0),
	(640, 'steam:110000109c2ddf3', 'WEAPON_COMBATPDW', 0),
	(641, 'steam:110000109c2ddf3', 'radio', 1),
	(642, 'steam:110000109c2ddf3', 'lighter', 1),
	(643, 'steam:110000109c2ddf3', 'snusdosa', 0),
	(644, 'steam:110000109c2ddf3', 'snus', 0),
	(645, 'steam:110000109c2ddf3', 'cigarett', 20),
	(646, 'steam:110000109c2ddf3', 'cigaretter', 0);
/*!40000 ALTER TABLE `user_inventory` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.user_lastcharacter
CREATE TABLE IF NOT EXISTS `user_lastcharacter` (
  `steamid` varchar(255) NOT NULL,
  `charid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpar data för tabell essentialmode.user_lastcharacter: ~2 rows (ungefär)
/*!40000 ALTER TABLE `user_lastcharacter` DISABLE KEYS */;
INSERT IGNORE INTO `user_lastcharacter` (`steamid`, `charid`) VALUES
	('steam:110000109c2ddf3', 1),
	('steam:110000105dbc118', 2);
/*!40000 ALTER TABLE `user_lastcharacter` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.user_licenses: ~12 rows (ungefär)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
INSERT IGNORE INTO `user_licenses` (`id`, `type`, `owner`) VALUES
	(1, 'dmv', 'steam:110000105dbc118'),
	(2, 'dmv', 'steam:110000105dbc118'),
	(3, 'dmv', 'steam:110000105dbc118'),
	(4, 'dmv', 'steam:110000105dbc118'),
	(5, 'dmv', 'steam:110000105dbc118'),
	(6, 'dmv', 'steam:110000105dbc118'),
	(7, 'dmv', 'steam:110000105dbc118'),
	(8, 'dmv', 'steam:110000105dbc118'),
	(9, 'dmv', 'steam:110000105dbc118'),
	(10, 'drive', 'steam:110000105dbc118'),
	(11, 'dmv', 'steam:110000105dbc118'),
	(12, 'dmv', 'steam:110000105dbc118');
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.user_tenue
CREATE TABLE IF NOT EXISTS `user_tenue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `tenue` longtext COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.user_tenue: 2 rows
/*!40000 ALTER TABLE `user_tenue` DISABLE KEYS */;
INSERT IGNORE INTO `user_tenue` (`id`, `identifier`, `tenue`, `label`) VALUES
	(47, 'steam:110000109c2ddf3', '{"hair_1":45,"bodyb_1":0,"blemishes_2":0,"blush_1":0,"eyebrows_3":0,"face":21,"complexion_2":0,"sun_1":0,"eyebrows_2":10,"blush_2":0,"shoes_2":3,"lipstick_2":0,"lipstick_1":0,"bags_1":0,"bproof_2":0,"glasses_1":5,"glasses_2":0,"beard_3":0,"decals_1":0,"arms":25,"eye_color":0,"skin":0,"lipstick_3":0,"makeup_1":0,"bodyb_2":0,"eyebrows_4":0,"moles_2":0,"helmet_2":0,"beard_1":0,"helmet_1":-1,"hair_color_2":37,"ears_1":-1,"torso_1":8,"bracelets_1":-1,"moles_1":0,"makeup_2":10,"mask_2":0,"sun_2":0,"tshirt_1":17,"pants_2":1,"shoes_1":11,"makeup_4":0,"sex":1,"age_2":0,"blemishes_1":0,"blush_3":0,"complexion_1":0,"age_1":0,"chest_1":0,"hair_color_1":38,"arms_2":0,"chest_3":0,"eyebrows_1":0,"bracelets_2":0,"lipstick_4":0,"tshirt_2":3,"makeup_3":0,"beard_4":0,"bags_2":0,"ears_2":0,"hair_2":0,"watches_2":0,"beard_2":0,"pants_1":43,"mask_1":0,"chain_1":0,"chain_2":0,"torso_2":0,"watches_1":-1,"chest_2":0,"bproof_1":0,"decals_2":0}', 'Tenue'),
	(48, 'steam:110000109c2ddf3', '{"hair_1":45,"bodyb_1":0,"blemishes_2":0,"blush_1":0,"eyebrows_3":0,"face":21,"complexion_2":0,"sun_1":0,"eyebrows_2":10,"blush_2":0,"shoes_2":3,"lipstick_2":0,"lipstick_1":0,"bags_1":0,"bproof_2":0,"glasses_1":5,"glasses_2":0,"beard_3":0,"decals_1":0,"arms":25,"eye_color":0,"skin":0,"lipstick_3":0,"makeup_1":0,"bodyb_2":0,"eyebrows_4":0,"moles_2":0,"helmet_2":0,"beard_1":0,"helmet_1":-1,"hair_color_2":37,"ears_1":-1,"torso_1":1,"bracelets_1":-1,"moles_1":0,"makeup_2":10,"mask_2":0,"sun_2":0,"tshirt_1":52,"pants_2":1,"makeup_4":0,"shoes_1":11,"sex":1,"age_2":0,"blemishes_1":0,"blush_3":0,"chest_1":0,"age_1":0,"complexion_1":0,"hair_color_1":38,"arms_2":0,"chest_3":0,"eyebrows_1":0,"bracelets_2":0,"lipstick_4":0,"makeup_3":0,"bags_2":0,"beard_4":0,"beard_2":0,"ears_2":0,"hair_2":0,"watches_2":0,"pants_1":43,"chain_1":0,"mask_1":0,"tshirt_2":1,"torso_2":1,"decals_2":0,"watches_1":-1,"chest_2":0,"bproof_1":0,"chain_2":0}', 'Tenue');
/*!40000 ALTER TABLE `user_tenue` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=458 DEFAULT CHARSET=latin1;

-- Dumpar data för tabell essentialmode.vehicles: ~223 rows (ungefär)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT IGNORE INTO `vehicles` (`id`, `name`, `model`, `price`, `category`) VALUES
	(235, 'Adder', 'adder', 140000, 'super'),
	(236, 'Akuma', 'AKUMA', 15000, 'motorcycles'),
	(237, 'Alpha', 'alpha', 50000, 'sports'),
	(238, 'Asea', 'asea', 10000, 'sedans'),
	(239, 'Autarch', 'autarch', 190000, 'super'),
	(240, 'Avarus', 'avarus', 50000, 'motorcycles'),
	(241, 'Bagger', 'bagger', 37500, 'motorcycles'),
	(242, 'Baller', 'baller2', 10000, 'suvs'),
	(243, 'Baller Sport', 'baller3', 35000, 'suvs'),
	(244, 'Banshee', 'banshee', 60000, 'sports'),
	(245, 'Banshee 900R', 'banshee2', 100000, 'super'),
	(246, 'Bati 801', 'bati', 80000, 'motorcycles'),
	(247, 'Bati 801RR', 'bati2', 140000, 'motorcycles'),
	(248, 'Bestia GTS', 'bestiagts', 80000, 'sports'),
	(249, 'BF400', 'bf400', 25000, 'motorcycles'),
	(250, 'Bf Injection', 'bfinjection', 15000, 'offroad'),
	(251, 'Bifta', 'bifta', 20000, 'offroad'),
	(252, 'Bison', 'bison', 7000, 'vans'),
	(253, 'Blade', 'blade', 15000, 'muscle'),
	(254, 'Blazer', 'blazer', 35000, 'offroad'),
	(255, 'Blazer Sport', 'blazer4', 42500, 'offroad'),
	(256, 'Blista', 'blista', 9000, 'compacts'),
	(257, 'BMX (velo)', 'bmx', 750, 'motorcycles'),
	(258, 'Bobcat XL', 'bobcatxl', 28000, 'vans'),
	(259, 'Brawler', 'brawler', 40000, 'offroad'),
	(260, 'Brioso R/A', 'brioso', 20000, 'compacts'),
	(261, 'Btype', 'btype', 35000, 'sportsclassics'),
	(262, 'Btype Hotroad', 'btype2', 100000, 'sportsclassics'),
	(263, 'Btype Luxe', 'btype3', 55000, 'sportsclassics'),
	(264, 'Buccaneer', 'buccaneer', 18000, 'muscle'),
	(265, 'Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	(266, 'Buffalo', 'buffalo', 17500, 'sports'),
	(267, 'Buffalo S', 'buffalo2', 35000, 'sports'),
	(268, 'Burrito', 'burrito3', 9500, 'vans'),
	(269, 'Camper', 'camper', 21000, 'vans'),
	(270, 'Carbonizzare', 'carbonizzare', 37500, 'sports'),
	(271, 'Carbon RS', 'carbonrs', 90000, 'motorcycles'),
	(272, 'Casco', 'casco', 65000, 'sportsclassics'),
	(273, 'Cavalcade', 'cavalcade2', 15000, 'suvs'),
	(274, 'Cheetah', 'cheetah', 112500, 'super'),
	(275, 'Chimera', 'chimera', 100000, 'motorcycles'),
	(276, 'Chino', 'chino', 13500, 'muscle'),
	(277, 'Chino Luxe', 'chino2', 22500, 'muscle'),
	(278, 'Cliffhanger', 'cliffhanger', 47500, 'motorcycles'),
	(279, 'Cognoscenti Cabrio', 'cogcabrio', 15000, 'coupes'),
	(280, 'Cognoscenti', 'cognoscenti', 20000, 'sedans'),
	(281, 'Comet', 'comet2', 59500, 'sports'),
	(282, 'Comet 5', 'comet5', 72500, 'sports'),
	(283, 'Contender', 'contender', 15000, 'suvs'),
	(284, 'Coquette', 'coquette', 50000, 'sports'),
	(285, 'Coquette Classic', 'coquette2', 56500, 'sportsclassics'),
	(286, 'Coquette BlackFin', 'coquette3', 62000, 'muscle'),
	(287, 'Cruiser (velo)', 'cruiser', 900, 'motorcycles'),
	(288, 'Cyclone', 'cyclone', 94500, 'super'),
	(289, 'Daemon', 'daemon', 55250, 'motorcycles'),
	(290, 'Daemon High', 'daemon2', 65250, 'motorcycles'),
	(291, 'Defiler', 'defiler', 50000, 'motorcycles'),
	(292, 'Double T', 'double', 62500, 'motorcycles'),
	(293, 'Dubsta', 'dubsta', 22500, 'suvs'),
	(294, 'Dubsta Luxuary', 'dubsta2', 30000, 'suvs'),
	(295, 'Dubsta 6x6', 'dubsta3', 60000, 'offroad'),
	(296, 'Dukes', 'dukes', 20000, 'muscle'),
	(297, 'Dune Buggy', 'dune', 25000, 'offroad'),
	(298, 'Elegy', 'elegy2', 32750, 'sports'),
	(299, 'Emperor', 'emperor', 7500, 'sedans'),
	(300, 'Enduro', 'enduro', 32500, 'motorcycles'),
	(301, 'Entity XF', 'entityxf', 84500, 'super'),
	(302, 'Esskey', 'esskey', 23500, 'motorcycles'),
	(303, 'Exemplar', 'exemplar', 50000, 'coupes'),
	(304, 'F620', 'f620', 17500, 'coupes'),
	(305, 'Faction', 'faction', 10000, 'muscle'),
	(306, 'Faction Rider', 'faction2', 37500, 'muscle'),
	(307, 'Faggio', 'faggio', 5500, 'motorcycles'),
	(308, 'Vespa', 'faggio2', 5500, 'motorcycles'),
	(309, 'Felon', 'felon', 16000, 'coupes'),
	(310, 'Felon GT', 'felon2', 27500, 'coupes'),
	(311, 'Feltzer', 'feltzer2', 27500, 'sports'),
	(312, 'Stirling GT', 'feltzer3', 82500, 'sportsclassics'),
	(313, 'Fixter (velo)', 'fixter', 600, 'motorcycles'),
	(314, 'FMJ', 'fmj', 92500, 'super'),
	(315, 'Fhantom', 'fq2', 8500, 'suvs'),
	(316, 'Fugitive', 'fugitive', 12500, 'sedans'),
	(317, 'Furore GT', 'furoregt', 37500, 'sports'),
	(318, 'Fusilade', 'fusilade', 10000, 'sports'),
	(319, 'Gargoyle', 'gargoyle', 32750, 'motorcycles'),
	(320, 'Gauntlet', 'gauntlet', 33500, 'muscle'),
	(321, 'Gang Burrito', 'gburrito', 22500, 'vans'),
	(322, 'Burrito', 'gburrito2', 12500, 'vans'),
	(323, 'Glendale', 'glendale', 6250, 'sedans'),
	(324, 'Granger', 'granger', 25000, 'suvs'),
	(325, 'Gresley', 'gresley', 8750, 'suvs'),
	(326, 'GT 500', 'gt500', 62500, 'sportsclassics'),
	(327, 'Guardian', 'guardian', 22500, 'offroad'),
	(328, 'Hakuchou', 'hakuchou', 87500, 'motorcycles'),
	(329, 'Hakuchou Sport', 'hakuchou2', 100000, 'motorcycles'),
	(330, 'Hermes', 'hermes', 112500, 'muscle'),
	(331, 'Hexer', 'hexer', 25000, 'motorcycles'),
	(332, 'Hotknife', 'hotknife', 62500, 'muscle'),
	(333, 'Huntley S', 'huntley', 15000, 'suvs'),
	(334, 'Hustler', 'hustler', 100000, 'muscle'),
	(335, 'Infernus', 'infernus', 90000, 'super'),
	(336, 'Innovation', 'innovation', 50250, 'motorcycles'),
	(337, 'Intruder', 'intruder', 5000, 'sedans'),
	(338, 'Issi', 'issi2', 6000, 'compacts'),
	(339, 'Jackal', 'jackal', 10000, 'coupes'),
	(340, 'Jester', 'jester', 50000, 'sports'),
	(341, 'Jester(Racecar)', 'jester2', 67500, 'sports'),
	(342, 'Journey', 'journey', 5000, 'vans'),
	(343, 'Kamacho', 'kamacho', 82500, 'offroad'),
	(344, 'Khamelion', 'khamelion', 33500, 'sports'),
	(345, 'Kuruma', 'kuruma', 15000, 'sports'),
	(346, 'Landstalker', 'landstalker', 10000, 'suvs'),
	(347, 'RE-7B', 'le7b', 132500, 'super'),
	(348, 'Lynx', 'lynx', 20000, 'sports'),
	(349, 'Mamba', 'mamba', 35000, 'sports'),
	(350, 'Manana', 'manana', 6400, 'sportsclassics'),
	(351, 'Manchez', 'manchez', 10000, 'motorcycles'),
	(352, 'Massacro', 'massacro', 40000, 'sports'),
	(353, 'Massacro(Racecar)', 'massacro2', 65000, 'sports'),
	(354, 'Mesa', 'mesa', 12500, 'suvs'),
	(355, 'Mesa Trail', 'mesa3', 20000, 'suvs'),
	(356, 'Minivan', 'minivan', 7000, 'vans'),
	(357, 'Monroe', 'monroe', 50000, 'sportsclassics'),
	(358, 'The Liberator', 'monster', 105000, 'offroad'),
	(359, 'Moonbeam', 'moonbeam', 27500, 'vans'),
	(360, 'Nemesis', 'nemesis', 29000, 'motorcycles'),
	(361, 'Neon', 'neon', 62500, 'sports'),
	(362, 'Nightblade', 'nightblade', 38000, 'motorcycles'),
	(363, 'Nightshade', 'nightshade', 45000, 'muscle'),
	(364, '9F', 'ninef', 45000, 'sports'),
	(365, '9F Cabrio', 'ninef2', 45000, 'sports'),
	(366, 'Omnis', 'omnis', 45000, 'sports'),
	(367, 'Oracle XS', 'oracle2', 12500, 'coupes'),
	(368, 'Osiris', 'osiris', 82500, 'super'),
	(369, 'Panto', 'panto', 5000, 'compacts'),
	(370, 'Paradise', 'paradise', 22500, 'vans'),
	(371, 'Pariah', 'pariah', 95000, 'sports'),
	(372, 'Patriot', 'patriot', 27500, 'suvs'),
	(373, 'PCJ-600', 'pcj', 30000, 'motorcycles'),
	(374, 'Penumbra', 'penumbra', 14000, 'sports'),
	(375, 'Pfister', 'pfister811', 85000, 'super'),
	(376, 'Phoenix', 'phoenix', 7250, 'muscle'),
	(377, 'Picador', 'picador', 7250, 'muscle'),
	(378, 'Pigalle', 'pigalle', 12500, 'sportsclassics'),
	(379, 'Prairie', 'prairie', 7500, 'compacts'),
	(380, 'Premier', 'premier', 7500, 'sedans'),
	(381, 'Primo Custom', 'primo2', 7500, 'sedans'),
	(382, 'X80 Proto', 'prototipo', 110000, 'super'),
	(383, 'Radius', 'radi', 7500, 'suvs'),
	(384, 'raiden', 'raiden', 75000, 'sports'),
	(385, 'Rapid GT', 'rapidgt', 10000, 'sports'),
	(386, 'Rapid GT3', 'rapidgt3', 60000, 'sportsclassics'),
	(387, 'Reaper', 'reaper', 100000, 'super'),
	(388, 'Rebel', 'rebel2', 17500, 'offroad'),
	(389, 'Regina', 'regina', 6250, 'sedans'),
	(390, 'Retinue', 'retinue', 32500, 'sportsclassics'),
	(391, 'Revolter', 'revolter', 62500, 'sports'),
	(392, 'riata', 'riata', 40000, 'offroad'),
	(393, 'Rocoto', 'rocoto', 7000, 'suvs'),
	(394, 'Ruffian', 'ruffian', 82500, 'motorcycles'),
	(395, 'Rumpo', 'rumpo', 7500, 'vans'),
	(396, 'Rumpo Trail', 'rumpo3', 10000, 'vans'),
	(397, 'Sabre Turbo', 'sabregt', 30000, 'muscle'),
	(398, 'Sanchez', 'sanchez', 50000, 'motorcycles'),
	(399, 'Sanchez Sport', 'sanchez2', 62750, 'motorcycles'),
	(400, 'Sanctus', 'sanctus', 112500, 'motorcycles'),
	(401, 'Sandking', 'sandking', 37500, 'offroad'),
	(402, 'Savestra', 'savestra', 60000, 'sportsclassics'),
	(403, 'SC 1', 'sc1', 87500, 'super'),
	(404, 'Schafter', 'schafter2', 7500, 'sedans'),
	(405, 'Schafter V12', 'schafter3', 25000, 'sports'),
	(406, 'Scorcher (velo)', 'scorcher', 750, 'motorcycles'),
	(407, 'Seminole', 'seminole', 17500, 'suvs'),
	(408, 'Seven 70', 'seven70', 77750, 'sports'),
	(409, 'ETR1', 'sheava', 87500, 'super'),
	(410, 'Shotaro Concept', 'shotaro', 185000, 'motorcycles'),
	(411, 'Slam Van', 'slamvan3', 12750, 'muscle'),
	(412, 'Sovereign', 'sovereign', 35000, 'motorcycles'),
	(413, 'Stinger', 'stinger', 90000, 'sportsclassics'),
	(414, 'Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	(415, 'Streiter', 'streiter', 75000, 'sports'),
	(416, 'Stretch', 'stretch', 125000, 'sedans'),
	(417, 'Sultan', 'sultan', 12500, 'sports'),
	(418, 'Sultan RS', 'sultanrs', 50000, 'super'),
	(419, 'Super Diamond', 'superd', 52250, 'sedans'),
	(420, 'Surano', 'surano', 35000, 'sports'),
	(421, 'Surfer', 'surfer', 7500, 'vans'),
	(422, 'T20', 't20', 100000, 'super'),
	(423, 'Tailgater', 'tailgater', 10000, 'sedans'),
	(424, 'Tampa', 'tampa', 25000, 'muscle'),
	(425, 'Drift Tampa', 'tampa2', 80000, 'sports'),
	(426, 'Thrust', 'thrust', 42500, 'motorcycles'),
	(427, 'Tri bike (velo)', 'tribike3', 750, 'motorcycles'),
	(428, 'Trophy Truck', 'trophytruck', 30000, 'offroad'),
	(429, 'Tropos', 'tropos', 75250, 'sports'),
	(430, 'Turismo R', 'turismor', 100000, 'super'),
	(431, 'Tyrus', 'tyrus', 100000, 'super'),
	(432, 'Vacca', 'vacca', 90000, 'super'),
	(433, 'Vader', 'vader', 36000, 'motorcycles'),
	(434, 'Verlierer', 'verlierer2', 55000, 'sports'),
	(435, 'Vigero', 'vigero', 6750, 'muscle'),
	(436, 'Virgo', 'virgo', 7500, 'muscle'),
	(437, 'Viseris', 'viseris', 87500, 'sportsclassics'),
	(438, 'Visione', 'visione', 112500, 'super'),
	(439, 'Voltic', 'voltic', 32000, 'super'),
	(440, 'Voodoo', 'voodoo', 7500, 'muscle'),
	(441, 'Vortex', 'vortex', 32500, 'motorcycles'),
	(442, 'Warrener', 'warrener', 7500, 'sedans'),
	(443, 'Washington', 'washington', 7500, 'sedans'),
	(444, 'Windsor', 'windsor', 55000, 'coupes'),
	(445, 'Windsor Drop', 'windsor2', 62500, 'coupes'),
	(446, 'Wolfsbane', 'wolfsbane', 25000, 'motorcycles'),
	(447, 'XLS', 'xls', 17500, 'suvs'),
	(448, 'Yosemite', 'yosemite', 60250, 'muscle'),
	(449, 'Youga', 'youga', 10250, 'vans'),
	(450, 'Youga Luxuary', 'youga2', 12750, 'vans'),
	(451, 'Z190', 'z190', 87500, 'sportsclassics'),
	(452, 'Zentorno', 'zentorno', 115000, 'super'),
	(453, 'Zion', 'zion', 22500, 'coupes'),
	(454, 'Zion Cabrio', 'zion2', 25000, 'coupes'),
	(455, 'Zombie', 'zombiea', 25000, 'motorcycles'),
	(456, 'Zombie Luxuary', 'zombieb', 20000, 'motorcycles'),
	(457, 'Z-Type', 'ztype', 200000, 'sportsclassics');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.vehicles_for_sale
CREATE TABLE IF NOT EXISTS `vehicles_for_sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) NOT NULL,
  `vehicleProps` longtext NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumpar data för tabell essentialmode.vehicles_for_sale: ~0 rows (ungefär)
/*!40000 ALTER TABLE `vehicles_for_sale` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicles_for_sale` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.vehicle_categories: ~11 rows (ungefär)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT IGNORE INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Kompakt'),
	('coupes', 'Coupé'),
	('motorcycles', 'Motorcykel'),
	('muscle', 'Muskel'),
	('offroad', 'Terräng'),
	('sedans', 'Sedan'),
	('sports', 'Sport'),
	('sportsclassics', 'Sport Klassiskt'),
	('super', 'Super'),
	('suvs', 'Stadsjeep'),
	('vans', 'Skåpbil');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `soldby` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.vehicle_sold: ~0 rows (ungefär)
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.yellow_tweets
CREATE TABLE IF NOT EXISTS `yellow_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` int(11) DEFAULT NULL,
  `firstname` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpar data för tabell essentialmode.yellow_tweets: ~0 rows (ungefär)
/*!40000 ALTER TABLE `yellow_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `yellow_tweets` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
