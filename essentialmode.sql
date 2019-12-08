-- --------------------------------------------------------
-- Värd:                         127.0.0.1
-- Serverversion:                10.4.10-MariaDB - mariadb.org binary distribution
-- Server-OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
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
REPLACE INTO `addon_account` (`name`, `label`, `shared`) VALUES
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
REPLACE INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
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
REPLACE INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
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

-- Dumpar data för tabell essentialmode.characters: ~0 rows (ungefär)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
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
REPLACE INTO `datastore` (`name`, `label`, `shared`) VALUES
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
  `data` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.datastore_data: ~2 rows (ungefär)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
REPLACE INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_police', NULL, '{}'),
	(14, 'society_taxi', NULL, '{}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.disc_ammo
CREATE TABLE IF NOT EXISTS `disc_ammo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner` text COLLATE utf8mb4_bin NOT NULL,
  `hash` text COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_ammo: ~0 rows (ungefär)
/*!40000 ALTER TABLE `disc_ammo` DISABLE KEYS */;
/*!40000 ALTER TABLE `disc_ammo` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.disc_inventory
CREATE TABLE IF NOT EXISTS `disc_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` text COLLATE utf8mb4_bin NOT NULL,
  `type` text COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_inventory: ~0 rows (ungefär)
/*!40000 ALTER TABLE `disc_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `disc_inventory` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.disc_inventory_itemdata
CREATE TABLE IF NOT EXISTS `disc_inventory_itemdata` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_bin NOT NULL,
  `description` text COLLATE utf8mb4_bin DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `closeonuse` tinyint(1) NOT NULL DEFAULT 0,
  `max` int(11) NOT NULL DEFAULT 100,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_inventory_itemdata: ~28 rows (ungefär)
/*!40000 ALTER TABLE `disc_inventory_itemdata` DISABLE KEYS */;
REPLACE INTO `disc_inventory_itemdata` (`id`, `name`, `description`, `weight`, `closeonuse`, `max`) VALUES
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
  `sold` tinyint(1) DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `locked` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_property: ~13 rows (ungefär)
/*!40000 ALTER TABLE `disc_property` DISABLE KEYS */;
REPLACE INTO `disc_property` (`id`, `name`, `sold`, `price`, `locked`) VALUES
	(1, '3655 Wild Oats Drive', 0, 300000, 1),
	(2, '2044 North Conker Avenue', 0, 250000, 1),
	(3, '2044 Hillcrest Avenue', 0, 275000, 1),
	(4, '2862 Hillcrest Avenue', 0, 265000, 1),
	(5, '2868 Hillcrest Avenue', 0, 200000, 1),
	(6, '2045 North Conker Avenue', 0, 235000, 1),
	(7, '2677 Whispymound Drive', 0, 150000, 1),
	(8, '2133 Mad Wayne Thunder Drive', 0, 125000, 1),
	(9, '1052 Grove Street', 0, 65000, 1),
	(10, '3092 West Mirror Park Drive', 0, 105000, 1),
	(11, '1054 Grove Street', 0, 75000, 1),
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
  `inventory_name` text COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_property_inventory: ~0 rows (ungefär)
/*!40000 ALTER TABLE `disc_property_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `disc_property_inventory` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.disc_property_owners
CREATE TABLE IF NOT EXISTS `disc_property_owners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_bin DEFAULT NULL,
  `identifier` text COLLATE utf8mb4_bin DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `owner` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_property_owners: ~0 rows (ungefär)
/*!40000 ALTER TABLE `disc_property_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `disc_property_owners` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.favoriteanimation
CREATE TABLE IF NOT EXISTS `favoriteanimation` (
  `identifier` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `lib` varchar(255) COLLATE utf8mb4_bin DEFAULT 'mini@strip_club@idles@bouncer@base',
  `animation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'base',
  `scenario` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.favoriteanimation: ~0 rows (ungefär)
/*!40000 ALTER TABLE `favoriteanimation` DISABLE KEYS */;
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
REPLACE INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
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
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(1) NOT NULL DEFAULT 0,
  `can_remove` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.items: ~141 rows (ungefär)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
REPLACE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
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
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.jobs: ~13 rows (ungefär)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
REPLACE INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
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
REPLACE INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
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
	(16, 'ambulance', 0, 'ambulance', 'AT-läkare', 140, '{"bracelets_1":-1,"tshirt_2":0,"shoes_2":0,"chain_1":126,"watches_1":-1,"shoes_1":24,"helmet_1":-1,"torso_1":55,"bproof_1":0,"decals_1","tshirt_1":15,"arms":85,"chain_2":0,"bags_2":0,"bags_1":0,"pants_2":0,"torso_2":0,"helmet_2":1,"pants_1":46,"mask_1":0,"decals_1":0,"arms":85}\r\n\r\n', '{"decals_1":0,"bracelets_1":-1,"shoes_2":0,"helmet_2":0,"watches_2":0,"bracelets_2":0,"chain_1":0,"pants_2":0,"glasses_1":5,"decals_1":0,"mask_1":0,"tshirt_2":0,"arms":100,"pants_1":48,"torso_2":0,"torso_1":48,"helmet_1":-1,"watches_1":-1,"tshirt_1":15,"shoes_1":24,"bags_1":0,"bproof_1":0}'),
	(17, 'ambulance', 1, 'doctor', 'ST-läkare', 200, '{"bracelets_1":-1,"tshirt_2":0,"shoes_2":0,"chain_1":126,"watches_1":-1,"shoes_1":24,"helmet_1":-1,"torso_1":55,"bproof_1":0,"decals_1","tshirt_1":15,"arms":85,"chain_2":0,"bags_2":0,"bags_1":0,"pants_2":0,"torso_2":0,"helmet_2":1,"pants_1":46,"mask_1":0,"decals_1":0,"arms":85}\r\n\r\n', '{"decals_1":0,"bracelets_1":-1,"shoes_2":0,"helmet_2":0,"watches_2":0,"bracelets_2":0,"chain_1":0,"pants_2":0,"glasses_1":5,"decals_1":0,"mask_1":0,"tshirt_2":0,"arms":100,"pants_1":48,"torso_2":0,"torso_1":48,"helmet_1":-1,"watches_1":-1,"tshirt_1":15,"shoes_1":24,"bags_1":0,"bproof_1":0}'),
	(18, 'ambulance', 2, 'chief_doctor', 'Överläkare', 260, '{"bracelets_1":-1,"tshirt_2":0,"shoes_2":0,"chain_1":126,"watches_1":-1,"shoes_1":24,"helmet_1":-1,"torso_1":55,"bproof_1":0,"decals_1","tshirt_1":15,"arms":85,"chain_2":0,"bags_2":0,"bags_1":0,"pants_2":0,"torso_2":0,"helmet_2":1,"pants_1":46,"mask_1":0,"decals_1":0,"arms":85}\r\n\r\n', '{"decals_1":0,"bracelets_1":-1,"shoes_2":0,"helmet_2":0,"watches_2":0,"bracelets_2":0,"chain_1":0,"pants_2":0,"glasses_1":5,"decals_1":0,"mask_1":0,"tshirt_2":0,"arms":100,"pants_1":48,"torso_2":0,"torso_1":48,"helmet_1":-1,"watches_1":-1,"tshirt_1":15,"shoes_1":24,"bags_1":0,"bproof_1":0}'),
	(19, 'ambulance', 3, 'boss', 'Sjukhusdirektör', 320, '{"bracelets_1":-1,"tshirt_2":0,"shoes_2":0,"chain_1":126,"watches_1":-1,"shoes_1":24,"helmet_1":-1,"torso_1":55,"bproof_1":0,"decals_1","tshirt_1":15,"arms":85,"chain_2":0,"bags_2":0,"bags_1":0,"pants_2":0,"torso_2":0,"helmet_2":1,"pants_1":46,"mask_1":0,"decals_1":0,"arms":85}\r\n\r\n', '{"decals_1":0,"bracelets_1":-1,"shoes_2":0,"helmet_2":0,"watches_2":0,"bracelets_2":0,"chain_1":0,"pants_2":0,"glasses_1":5,"decals_1":0,"mask_1":0,"tshirt_2":0,"arms":100,"pants_1":48,"torso_2":0,"torso_1":48,"helmet_1":-1,"watches_1":-1,"tshirt_1":15,"shoes_1":24,"bags_1":0,"bproof_1":0}'),
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
	(30, 'mechanic', 0, 'recrue', 'Provanställd', 50, '{"bracelets_1":-1,"bracelets_2":0,"bproof_1":0,"arms":38,"mask_1":0,"decals_1":0,"tshirt_2":0,"torso_1":259,"tshirt_1":15,"pants_1":102,"pants_2":0,"torso_2":0,"bags_1":0}', '{"tshirt_2":0,"mask_1":0,"arms_2":0,"arms":38,"pants_2":0,"bproof_1":0,"tshirt_1":15,"decals_1":0,"torso_1":268,"pants_1":109,"bags_1":0,"bracelets_1":-1,"torso_2":0}'),
	(31, 'mechanic', 1, 'novice', 'Anställd', 60, '{"bracelets_1":-1,"bracelets_2":0,"bproof_1":0,"arms":38,"mask_1":0,"decals_1":0,"tshirt_2":0,"torso_1":259,"tshirt_1":15,"pants_1":102,"pants_2":0,"torso_2":0,"bags_1":0}', '{"tshirt_2":0,"mask_1":0,"arms_2":0,"arms":38,"pants_2":0,"bproof_1":0,"tshirt_1":15,"decals_1":0,"torso_1":268,"pants_1":109,"bags_1":0,"bracelets_1":-1,"torso_2":0}'),
	(32, 'mechanic', 2, 'experimente', 'Mellanchef', 65, '{"bracelets_1":-1,"bracelets_2":0,"bproof_1":0,"arms":38,"mask_1":0,"decals_1":0,"tshirt_2":0,"torso_1":259,"tshirt_1":15,"pants_1":102,"pants_2":0,"torso_2":0,"bags_1":0}', '{"tshirt_2":0,"mask_1":0,"arms_2":0,"arms":38,"pants_2":0,"bproof_1":0,"tshirt_1":15,"decals_1":0,"torso_1":268,"pants_1":109,"bags_1":0,"bracelets_1":-1,"torso_2":0}'),
	(33, 'mechanic', 3, 'chief', 'Chef', 70, '{"bracelets_1":-1,"bracelets_2":0,"bproof_1":0,"arms":38,"mask_1":0,"decals_1":0,"tshirt_2":0,"torso_1":259,"tshirt_1":15,"pants_1":102,"pants_2":0,"torso_2":0,"bags_1":0}', '{"tshirt_2":0,"mask_1":0,"arms_2":0,"arms":38,"pants_2":0,"bproof_1":0,"tshirt_1":15,"decals_1":0,"torso_1":268,"pants_1":109,"bags_1":0,"bracelets_1":-1,"torso_2":0}'),
	(34, 'mechanic', 4, 'boss', 'VD', 75, '{"bracelets_1":-1,"bracelets_2":0,"bproof_1":0,"arms":38,"mask_1":0,"decals_1":0,"tshirt_2":0,"torso_1":259,"tshirt_1":15,"pants_1":102,"pants_2":0,"torso_2":0,"bags_1":0}', '{"tshirt_2":0,"mask_1":0,"arms_2":0,"arms":38,"pants_2":0,"bproof_1":0,"tshirt_1":15,"decals_1":0,"torso_1":268,"pants_1":109,"bags_1":0,"bracelets_1":-1,"torso_2":0}'),
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
REPLACE INTO `licenses` (`type`, `label`) VALUES
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
  `vehicle` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT 'car',
  `job` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.owned_vehicles: ~0 rows (ungefär)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.phone_app_chat
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
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
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
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
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT NULL,
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
  `is_dead` tinyint(1) DEFAULT 0,
  `status` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `last_motel` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `last_motel_room` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `tattoos` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `phone_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.users: ~0 rows (ungefär)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dumpar data för tabell essentialmode.user_accessories: 0 rows
/*!40000 ALTER TABLE `user_accessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_accessories` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.user_accounts
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `money` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.user_accounts: ~0 rows (ungefär)
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.user_drugs
CREATE TABLE IF NOT EXISTS `user_drugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `drugnumber` int(11) NOT NULL,
  `water` int(11) NOT NULL DEFAULT 2,
  `time` int(11) NOT NULL DEFAULT 15,
  `x` varchar(255) NOT NULL,
  `y` varchar(255) NOT NULL,
  `z` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumpar data för tabell essentialmode.user_drugs: ~0 rows (ungefär)
/*!40000 ALTER TABLE `user_drugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_drugs` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.user_inventory
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=647 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.user_inventory: ~0 rows (ungefär)
/*!40000 ALTER TABLE `user_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_inventory` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.user_lastcharacter
CREATE TABLE IF NOT EXISTS `user_lastcharacter` (
  `steamid` varchar(255) NOT NULL,
  `charid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpar data för tabell essentialmode.user_lastcharacter: ~0 rows (ungefär)
/*!40000 ALTER TABLE `user_lastcharacter` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_lastcharacter` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.user_licenses: ~0 rows (ungefär)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.user_tenue
CREATE TABLE IF NOT EXISTS `user_tenue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `tenue` longtext COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.user_tenue: 0 rows
/*!40000 ALTER TABLE `user_tenue` DISABLE KEYS */;
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
REPLACE INTO `vehicles` (`id`, `name`, `model`, `price`, `category`) VALUES
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
  `price` int(11) NOT NULL DEFAULT 0,
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
REPLACE INTO `vehicle_categories` (`name`, `label`) VALUES
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
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpar data för tabell essentialmode.yellow_tweets: ~0 rows (ungefär)
/*!40000 ALTER TABLE `yellow_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `yellow_tweets` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
