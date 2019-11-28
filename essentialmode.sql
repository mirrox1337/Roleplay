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

-- Dumpar data för tabell essentialmode.addon_account: ~4 rows (ungefär)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT IGNORE INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('motels_bed_black_money', 'Motels Black Money Bed', 0),
	('motels_black_money', 'Motels Black Money ', 0),
	('society_ambulance', 'Ambulance', 1),
	('society_cardealer', 'Bilförsäljare', 1),
	('society_mechanic', 'Mekaniker', 1),
	('society_police', 'Polis', 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.addon_account_data: ~6 rows (ungefär)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
INSERT IGNORE INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_cardealer', 4005, NULL),
	(3, 'society_police', 0, NULL),
	(4, 'motels_bed_black_money', 0, 'steam:110000109c2ddf3'),
	(5, 'motels_black_money', 0, 'steam:110000109c2ddf3'),
	(6, 'society_ambulance', 0, NULL),
	(7, 'society_mechanic', 0, NULL);
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.addon_inventory: ~4 rows (ungefär)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT IGNORE INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('motels', 'Motels Inventory', 0),
	('motels_bed', 'Motels Bed Inventory', 0),
	('society_cardealer', 'Bilförsäljare', 1),
	('society_mechanic', 'Mekaniker', 1),
	('society_police', 'Polis', 1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.characters: ~2 rows (ungefär)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
INSERT IGNORE INTO `characters` (`id`, `identifier`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `lastdigits`) VALUES
	(3, 'steam:110000109c2ddf3', 'Hen', 'Tai', '1990-01-22', 'F', '123', '4987'),
	(4, 'steam:110000109c2ddf3', 'Hen', 'Tai', '1990-01-01', 'F', '123', '4987');
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.datastore: ~7 rows (ungefär)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT IGNORE INTO `datastore` (`name`, `label`, `shared`) VALUES
	('motels', 'Motels Datastore', 0),
	('motels_bed', 'Motels Bed Datastore', 0),
	('society_police', 'Polis', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.datastore_data: ~7 rows (ungefär)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
INSERT IGNORE INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_police', NULL, '{}'),
	(2, 'user_ears', 'steam:110000109c2ddf3', '{}'),
	(3, 'user_glasses', 'steam:110000109c2ddf3', '{}'),
	(4, 'user_mask', 'steam:110000109c2ddf3', '{}'),
	(5, 'user_helmet', 'steam:110000109c2ddf3', '{}'),
	(6, 'motels', 'steam:110000109c2ddf3', '{}'),
	(7, 'motels_bed', 'steam:110000109c2ddf3', '{}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.disc_ammo
CREATE TABLE IF NOT EXISTS `disc_ammo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner` text COLLATE utf8mb4_bin NOT NULL,
  `hash` text COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_ammo: ~2 rows (ungefär)
/*!40000 ALTER TABLE `disc_ammo` DISABLE KEYS */;
INSERT IGNORE INTO `disc_ammo` (`id`, `owner`, `hash`, `count`) VALUES
	(1, 'steam:110000109c2ddf3', '-1716189206', 0),
	(2, 'steam:110000109c2ddf3', '453432689', 30);
/*!40000 ALTER TABLE `disc_ammo` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.disc_inventory
CREATE TABLE IF NOT EXISTS `disc_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` text COLLATE utf8mb4_bin NOT NULL,
  `type` text COLLATE utf8mb4_bin,
  `data` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_inventory: ~3 rows (ungefär)
/*!40000 ALTER TABLE `disc_inventory` DISABLE KEYS */;
INSERT IGNORE INTO `disc_inventory` (`id`, `owner`, `type`, `data`) VALUES
	(2, 'x373y408z145', 'drop', '{"6":{"name":"bread","count":4}}'),
	(3, 'x-686y605z143', 'drop', '{"6":{"count":1,"name":"WEAPON_PISTOL"}}'),
	(4, 'steam:110000109c2ddf3', 'player', '{"19":{"count":22,"name":"bread"},"2":{"count":1,"name":"WEAPON_PISTOL"},"1":{"count":1,"name":"WEAPON_KNIFE"},"20":{"count":1,"name":"phone"}}');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_inventory_itemdata: ~0 rows (ungefär)
/*!40000 ALTER TABLE `disc_inventory_itemdata` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_property: ~10 rows (ungefär)
/*!40000 ALTER TABLE `disc_property` DISABLE KEYS */;
INSERT IGNORE INTO `disc_property` (`id`, `name`, `sold`, `price`, `locked`) VALUES
	(1, '3655 Wild Oats Drive', 1, 300000, 1),
	(2, '2044 North Conker Avenue', 0, 250000, 1),
	(3, '2044 Hillcrest Avenue', 0, 275000, 1),
	(4, '2862 Hillcrest Avenue', 1, 265000, 1),
	(5, '2868 Hillcrest Avenue', 0, 200000, 1),
	(6, '2045 North Conker Avenue', 1, 235000, 1),
	(7, '2677 Whispymound Drive', 0, 150000, 1),
	(8, '2133 Mad Wayne Thunder Drive', 0, 125000, 1),
	(9, '1052 Grove Street', 0, 65000, 1),
	(10, '3092 West Mirror Park Drive', 1, 105000, 1);
/*!40000 ALTER TABLE `disc_property` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.disc_property_garage_vehicles
CREATE TABLE IF NOT EXISTS `disc_property_garage_vehicles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_bin NOT NULL,
  `plate` text COLLATE utf8mb4_bin NOT NULL,
  `props` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.disc_property_owners: ~4 rows (ungefär)
/*!40000 ALTER TABLE `disc_property_owners` DISABLE KEYS */;
INSERT IGNORE INTO `disc_property_owners` (`id`, `name`, `identifier`, `active`, `owner`) VALUES
	(1, '3092 West Mirror Park Drive', 'steam:110000109c2ddf3', 1, 1),
	(2, '2045 North Conker Avenue', 'steam:110000109c2ddf3', 1, 1),
	(3, '3655 Wild Oats Drive', 'steam:110000109c2ddf3', 1, 1),
	(5, '2862 Hillcrest Avenue', 'steam:110000109c2ddf3', 1, 1);
/*!40000 ALTER TABLE `disc_property_owners` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.favoriteanimation
CREATE TABLE IF NOT EXISTS `favoriteanimation` (
  `identifier` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `lib` varchar(255) COLLATE utf8mb4_bin DEFAULT 'mini@strip_club@idles@bouncer@base',
  `animation` varchar(255) COLLATE utf8mb4_bin DEFAULT 'base',
  `scenario` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.favoriteanimation: ~0 rows (ungefär)
/*!40000 ALTER TABLE `favoriteanimation` DISABLE KEYS */;
INSERT IGNORE INTO `favoriteanimation` (`identifier`, `lib`, `animation`, `scenario`) VALUES
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

-- Dumpar data för tabell essentialmode.items: ~107 rows (ungefär)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT IGNORE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('WEAPON_ADVANCEDRIFLE', 'Advanced Rifle', 1, 0, 1),
	('WEAPON_APPISTOL', 'AP Pistol', 1, 0, 1),
	('WEAPON_ASSAULTRIFLE', 'Assault Rifle', 1, 0, 1),
	('WEAPON_ASSAULTSHOTGUN', 'Assault Shotgun', 1, 0, 1),
	('WEAPON_ASSAULTSMG', 'Assault SMG', 1, 0, 1),
	('WEAPON_AUTOSHOTGUN', 'Auto Shotgun', 1, 0, 1),
	('WEAPON_BALL', 'Ball', 1, 0, 1),
	('WEAPON_BAT', 'Bat', 1, 0, 1),
	('WEAPON_BATTLEAXE', 'Battle Axe', 1, 0, 1),
	('WEAPON_BOTTLE', 'Bottle', 1, 0, 1),
	('WEAPON_BULLPUPRIFLE', 'Bullpup Rifle', 1, 0, 1),
	('WEAPON_BULLPUPSHOTGUN', 'Bullpup Shotgun', 1, 0, 1),
	('WEAPON_BZGAS', 'BZ Gas', 1, 0, 1),
	('WEAPON_CARBINERIFLE', 'Carbine Rifle', 1, 0, 1),
	('WEAPON_COMBATMG', 'Combat MG', 1, 0, 1),
	('WEAPON_COMBATPDW', 'Combat PDW', 1, 0, 1),
	('WEAPON_COMBATPISTOL', 'Combat Pistol', 1, 0, 1),
	('WEAPON_COMPACTLAUNCHER', 'Compact Launcher', 1, 0, 1),
	('WEAPON_COMPACTRIFLE', 'Compact Rifle', 1, 0, 1),
	('WEAPON_CROWBAR', 'Crowbar', 1, 0, 1),
	('WEAPON_DAGGER', 'Dagger', 1, 0, 1),
	('WEAPON_DBSHOTGUN', 'Double Barrel Shotgun', 1, 0, 1),
	('WEAPON_DIGISCANNER', 'Digiscanner', 1, 0, 1),
	('WEAPON_DOUBLEACTION', 'Double Action Revolver', 1, 0, 1),
	('WEAPON_FIREEXTINGUISHER', 'Fire Extinguisher', 1, 0, 1),
	('WEAPON_FIREWORK', 'Firework Launcher', 1, 0, 1),
	('WEAPON_FLARE', 'Flare', 1, 0, 1),
	('WEAPON_FLAREGUN', 'Flare Gun', 1, 0, 1),
	('WEAPON_FLASHLIGHT', 'Flashlight', 1, 0, 1),
	('WEAPON_GARBAGEBAG', 'Garbage Bag', 1, 0, 1),
	('WEAPON_GOLFCLUB', 'Golf Club', 1, 0, 1),
	('WEAPON_GRENADE', 'Gernade', 1, 0, 1),
	('WEAPON_GRENADELAUNCHER', 'Gernade Launcher', 1, 0, 1),
	('WEAPON_GUSENBERG', 'Gusenberg', 1, 0, 1),
	('WEAPON_HAMMER', 'Hammer', 1, 0, 1),
	('WEAPON_HANDCUFFS', 'Handcuffs', 1, 0, 1),
	('WEAPON_HATCHET', 'Hatchet', 1, 0, 1),
	('WEAPON_HEAVYPISTOL', 'Heavy Pistol', 1, 0, 1),
	('WEAPON_HEAVYSHOTGUN', 'Heavy Shotgun', 1, 0, 1),
	('WEAPON_HEAVYSNIPER', 'Heavy Sniper', 1, 0, 1),
	('WEAPON_HOMINGLAUNCHER', 'Homing Launcher', 1, 0, 1),
	('WEAPON_KNIFE', 'Knife', 1, 0, 1),
	('WEAPON_KNUCKLE', 'Knuckle Dusters ', 1, 0, 1),
	('WEAPON_MACHETE', 'Machete', 1, 0, 1),
	('WEAPON_MACHINEPISTOL', 'Machine Pistol', 1, 0, 1),
	('WEAPON_MARKSMANPISTOL', 'Marksman Pistol', 1, 0, 1),
	('WEAPON_MARKSMANRIFLE', 'Marksman Rifle', 1, 0, 1),
	('WEAPON_MG', 'MG', 1, 0, 1),
	('WEAPON_MICROSMG', 'Micro SMG', 1, 0, 1),
	('WEAPON_MINIGUN', 'Minigun', 1, 0, 1),
	('WEAPON_MINISMG', 'Mini SMG', 1, 0, 1),
	('WEAPON_MOLOTOV', 'Molotov', 1, 0, 1),
	('WEAPON_MUSKET', 'Musket', 1, 0, 1),
	('WEAPON_NIGHTSTICK', 'Police Baton', 1, 0, 1),
	('WEAPON_PETROLCAN', 'Petrol Can', 1, 0, 1),
	('WEAPON_PIPEBOMB', 'Pipe Bomb', 1, 0, 1),
	('WEAPON_PISTOL', 'Pistol', 1, 0, 1),
	('WEAPON_PISTOL50', 'Police .50', 1, 0, 1),
	('WEAPON_POOLCUE', 'Pool Cue', 1, 0, 1),
	('WEAPON_PROXMINE', 'Proximity Mine', 1, 0, 1),
	('WEAPON_PUMPSHOTGUN', 'Pump Shotgun', 1, 0, 1),
	('WEAPON_RAILGUN', 'Rail Gun', 1, 0, 1),
	('WEAPON_REVOLVER', 'Revolver', 1, 0, 1),
	('WEAPON_RPG', 'RPG', 1, 0, 1),
	('WEAPON_SAWNOFFSHOTGUN', 'Sawn Off Shotgun', 1, 0, 1),
	('WEAPON_SMG', 'SMG', 1, 0, 1),
	('WEAPON_SMOKEGRENADE', 'Smoke Gernade', 1, 0, 1),
	('WEAPON_SNIPERRIFLE', 'Sniper Rifle', 1, 0, 1),
	('WEAPON_SNOWBALL', 'Snow Ball', 1, 0, 1),
	('WEAPON_SNSPISTOL', 'SNS Pistol', 1, 0, 1),
	('WEAPON_SPECIALCARBINE', 'Special Rifle', 1, 0, 1),
	('WEAPON_STICKYBOMB', 'Sticky Bombs', 1, 0, 1),
	('WEAPON_STINGER', 'Stinger', 1, 0, 1),
	('WEAPON_STUNGUN', 'Police Taser', 1, 0, 1),
	('WEAPON_SWITCHBLADE', 'Switch Blade', 1, 0, 1),
	('WEAPON_VINTAGEPISTOL', 'Vintage Pistol', 1, 0, 1),
	('WEAPON_WRENCH', 'Wrench', 1, 0, 1),
	('beer', 'Öl', 1, 0, 1),
	('blowpipe', 'Blåslampa', 2, 0, 1),
	('bread', 'Bröd', 1, 0, 1),
	('carokit', 'Karosskit', 3, 0, 1),
	('carotool', 'Verktyg', 2, 0, 1),
	('coke', 'Kokain', 1, 0, 1),
	('disc_ammo_pistol', 'Pistol Ammo', 10, 0, 1),
	('disc_ammo_pistol_large', 'Pistol Ammo Large', -10, 0, 1),
	('disc_ammo_rifle', 'Rifle Ammo', 10, 0, 1),
	('disc_ammo_rifle_large', 'Rifle Ammo Large', 10, 0, 1),
	('disc_ammo_shotgun', 'Shotgun Shells', 10, 0, 1),
	('disc_ammo_shotgun_large', 'Shotgun Shells Large', 10, 0, 1),
	('disc_ammo_smg', 'SMG Ammo', 10, 0, 1),
	('disc_ammo_smg_large', 'SMG Ammo Large', 10, 0, 1),
	('disc_ammo_snp', 'Sniper Ammo', 10, 0, 1),
	('disc_ammo_snp_large', 'Sniper Ammo Large', 10, 0, 1),
	('fixkit', 'Reparationssats', 3, 0, 1),
	('fixtool', 'Reparationsverktyg', 2, 0, 1),
	('gazbottle', 'Gas Flaska', 2, 0, 1),
	('jager', 'Jägermeister', 1, 0, 1),
	('jagerbomb', 'Jäger Bomb', 1, 0, 1),
	('martini', 'Martini', 1, 0, 1),
	('meth', 'Amfetamin', 1, 0, 1),
	('opium', 'Opium', 1, 0, 1),
	('phone', 'Telefon', 1, 0, 1),
	('rhum', 'Rom', 1, 0, 1),
	('tequilla', 'Tequilla', 1, 0, 1),
	('water', 'Vatten', 1, 0, 1),
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

-- Dumpar data för tabell essentialmode.jobs: ~4 rows (ungefär)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT IGNORE INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'Sjukvårdare', 0),
	('cardealer', 'Bilförsäljare', 0),
	('mechanic', 'Mekaniker', 0),
	('police', 'Polis', 0),
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.job_grades: ~19 rows (ungefär)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT IGNORE INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 30, '{}', '{}'),
	(2, 'cardealer', 0, 'recruit', 'Provanställd', 60, '{}', '{}'),
	(3, 'cardealer', 1, 'novice', 'Anställd', 75, '{}', '{}'),
	(4, 'cardealer', 2, 'experienced', 'VD', 80, '{}', '{}'),
	(5, 'cardealer', 3, 'boss', 'Chef', 0, '{}', '{}'),
	(11, 'police', 0, 'recruit', 'Aspirant', 20, '{}', '{}'),
	(12, 'police', 1, 'officer', 'Assistant', 40, '{}', '{}'),
	(13, 'police', 2, 'sergeant', 'Inspektör', 60, '{}', '{}'),
	(14, 'police', 3, 'lieutenant', 'Kommissarie', 85, '{}', '{}'),
	(15, 'police', 4, 'boss', 'Polismästare', 100, '{}', '{}'),
	(16, 'ambulance', 0, 'ambulance', 'AT-läkare', 20, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(17, 'ambulance', 1, 'doctor', 'ST-läkare', 40, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(18, 'ambulance', 2, 'chief_doctor', 'Överläkare', 60, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(19, 'ambulance', 3, 'boss', 'Sjukhusdirektör', 80, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(20, 'mechanic', 0, 'recrue', 'Rekryt', 12, '{}', '{}'),
	(21, 'mechanic', 1, 'novice', 'Nyanställd', 24, '{}', '{}'),
	(22, 'mechanic', 2, 'experimente', 'Erfaren', 36, '{}', '{}'),
	(23, 'mechanic', 3, 'chief', 'Chef', 48, '{}', '{}'),
	(24, 'mechanic', 4, 'boss', 'Ägare', 0, '{}', '{}');
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
  `job` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.owned_vehicles: ~3 rows (ungefär)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
INSERT IGNORE INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `job`, `stored`) VALUES
	('steam:110000109c2ddf3', 'JQO 440', '{"bodyHealth":1000.0,"modTransmission":-1,"modHydrolic":-1,"wheelColor":156,"modSmokeEnabled":false,"plate":"JQO 440","modSpeakers":-1,"modExhaust":-1,"modSpoilers":-1,"modSideSkirt":-1,"modFrontWheels":-1,"modBackWheels":-1,"windowTint":-1,"model":2046537925,"modEngine":-1,"fuelLevel":64.2,"neonEnabled":[false,false,false,false],"modWindows":-1,"wheels":1,"modTrunk":-1,"modFrontBumper":-1,"modBrakes":-1,"modTank":-1,"modArmor":-1,"modFender":-1,"modDashboard":-1,"modTrimB":-1,"modSuspension":-1,"modTrimA":-1,"tyreSmokeColor":[255,255,255],"modAerials":-1,"plateIndex":4,"modFrame":-1,"modRearBumper":-1,"modRoof":-1,"modEngineBlock":-1,"engineHealth":1000.0,"modSeats":-1,"modHorns":-1,"color1":134,"color2":134,"pearlescentColor":0,"modDoorSpeaker":-1,"modRightFender":-1,"dirtLevel":8.7,"modXenon":false,"modVanityPlate":-1,"modGrille":-1,"modOrnaments":-1,"modArchCover":-1,"modShifterLeavers":-1,"modAPlate":-1,"extras":{"2":false,"1":true},"neonColor":[255,0,255],"modSteeringWheel":-1,"modTurbo":false,"modDial":-1,"modStruts":-1,"modAirFilter":-1,"modHood":-1,"modPlateHolder":-1,"modLivery":5}', 'car', 'police', 1),
	('steam:110000109c2ddf3', 'KKM 686', '{"modDoorSpeaker":-1,"extras":[],"modAPlate":-1,"modExhaust":-1,"modShifterLeavers":-1,"model":-998177792,"modRearBumper":-1,"modFender":-1,"neonEnabled":[false,false,false,false],"modBackWheels":-1,"plate":"KKM 686","modFrame":-1,"modEngineBlock":-1,"modSideSkirt":-1,"modDial":-1,"modAirFilter":-1,"modTrimB":-1,"modTurbo":false,"modPlateHolder":-1,"modHydrolic":-1,"color2":1,"pearlescentColor":158,"modFrontBumper":-1,"modOrnaments":-1,"windowTint":-1,"modSuspension":-1,"modSpeakers":-1,"modTransmission":-1,"wheelColor":1,"tyreSmokeColor":[255,255,255],"modVanityPlate":-1,"dirtLevel":9.6,"modSmokeEnabled":false,"modSpoilers":-1,"modLivery":-1,"modSteeringWheel":-1,"modRightFender":-1,"modArmor":-1,"modAerials":-1,"modHorns":-1,"modGrille":-1,"modEngine":-1,"modTrimA":-1,"modArchCover":-1,"wheels":7,"modSeats":-1,"neonColor":[255,0,255],"color1":34,"fuelLevel":58.3,"bodyHealth":998.9,"modXenon":false,"modRoof":-1,"modHood":-1,"modStruts":-1,"engineHealth":1000.0,"modTank":-1,"modTrunk":-1,"modDashboard":-1,"modBrakes":-1,"modFrontWheels":-1,"modWindows":-1,"plateIndex":0}', 'car', NULL, 1),
	('steam:110000109c2ddf3', 'YIE 303', '{"modTank":-1,"dirtLevel":8.0,"modAPlate":-1,"modFrame":-1,"modStruts":-1,"wheelColor":112,"modHydrolic":-1,"modTurbo":false,"modWindows":-1,"modEngineBlock":-1,"modLivery":-1,"model":159274291,"modArchCover":-1,"modTrimB":-1,"modAerials":-1,"modEngine":-1,"modShifterLeavers":-1,"modFender":-1,"modAirFilter":-1,"modBrakes":-1,"fuelLevel":60.0,"modDoorSpeaker":-1,"modArmor":-1,"engineHealth":1000.0,"modFrontWheels":-1,"modDial":-1,"modRightFender":-1,"modSmokeEnabled":false,"modXenon":false,"modTrimA":-1,"modVanityPlate":-1,"modFrontBumper":-1,"modSeats":-1,"plate":"YIE 303","modHorns":-1,"bodyHealth":1000.0,"neonEnabled":[false,false,false,false],"color1":88,"modRoof":-1,"modSteeringWheel":-1,"modDashboard":-1,"tyreSmokeColor":[255,255,255],"modGrille":-1,"modHood":-1,"modRearBumper":-1,"wheels":1,"modSpoilers":-1,"modTransmission":-1,"windowTint":-1,"modBackWheels":-1,"modExhaust":-1,"modTrunk":-1,"modSideSkirt":-1,"modSpeakers":-1,"modPlateHolder":-1,"modSuspension":-1,"neonColor":[255,0,255],"color2":0,"pearlescentColor":87,"plateIndex":0,"extras":[],"modOrnaments":-1}', 'car', NULL, 1);
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.phone_app_chat
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

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
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

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
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- Dumpar data för tabell essentialmode.users: ~1 rows (ungefär)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`identifier`, `license`, `money`, `name`, `skin`, `job`, `job_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `lastdigits`, `is_dead`, `status`, `last_motel`, `last_motel_room`, `tattoos`, `phone_number`) VALUES
	('steam:110000109c2ddf3', 'license:44be92faf675f784f2128ac35340fb9a172cefa3', 95710500, 'Mirrox', '{"decals_2":0,"sun_2":0,"torso_2":0,"arms_2":0,"lipstick_2":0,"decals_1":0,"skin":0,"makeup_4":0,"eyebrows_4":0,"blemishes_1":0,"lipstick_1":0,"arms":1,"chain_2":0,"mask_1":0,"mask_2":0,"beard_3":0,"chest_3":0,"helmet_1":-1,"bodyb_2":0,"pants_1":2,"blemishes_2":0,"sex":1,"beard_4":0,"pants_2":2,"ears_2":0,"helmet_2":0,"hair_color_1":34,"ears_1":-1,"beard_1":0,"eyebrows_2":10,"moles_2":0,"beard_2":0,"tshirt_2":0,"moles_1":0,"hair_2":0,"bproof_2":0,"blush_3":0,"makeup_3":0,"hair_color_2":0,"lipstick_4":0,"chain_1":0,"tshirt_1":15,"shoes_2":9,"watches_1":-1,"glasses_1":5,"age_1":0,"makeup_1":0,"age_2":0,"blush_2":0,"chest_2":0,"bracelets_1":-1,"bracelets_2":0,"bodyb_1":0,"watches_2":0,"torso_1":55,"sun_1":0,"complexion_2":0,"chest_1":0,"hair_1":4,"makeup_2":0,"glasses_2":0,"eyebrows_3":0,"bags_1":0,"eye_color":0,"eyebrows_1":0,"bags_2":0,"shoes_1":1,"face":21,"lipstick_3":0,"complexion_1":0,"blush_1":0,"bproof_1":0}', 'mechanic', 4, '[{"ammo":8,"components":["clip_default"],"label":"Pistol","name":"WEAPON_PISTOL"},{"ammo":0,"components":["clip_default"],"label":"Smg","name":"WEAPON_SMG"}]', '{"z":27.0,"y":-1044.2,"x":-266.5}', 103328, 4, 'superadmin', 'Hen', 'Tai', '1990-01-01', 'F', '123', '4987', 1, '[{"percent":93.45,"name":"hunger","val":934500},{"percent":92.92,"name":"thirst","val":929200},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.user_accounts
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `money` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.user_accounts: ~0 rows (ungefär)
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
INSERT IGNORE INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
	(3, 'steam:110000109c2ddf3', 'black_money', 1396);
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.user_inventory
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) COLLATE utf8mb4_bin NOT NULL,
  `item` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.user_inventory: ~107 rows (ungefär)
/*!40000 ALTER TABLE `user_inventory` DISABLE KEYS */;
INSERT IGNORE INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
	(1, 'steam:110000109c2ddf3', 'bread', 25),
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
	(14, 'steam:110000109c2ddf3', 'carotool', 0),
	(15, 'steam:110000109c2ddf3', 'fixkit', 0),
	(16, 'steam:110000109c2ddf3', 'gazbottle', 0),
	(17, 'steam:110000109c2ddf3', 'blowpipe', 0),
	(18, 'steam:110000109c2ddf3', 'fixtool', 0),
	(19, 'steam:110000109c2ddf3', 'carokit', 0),
	(20, 'steam:110000109c2ddf3', 'WEAPON_GUSENBERG', 0),
	(21, 'steam:110000109c2ddf3', 'WEAPON_DBSHOTGUN', 0),
	(22, 'steam:110000109c2ddf3', 'WEAPON_MARKSMANPISTOL', 0),
	(23, 'steam:110000109c2ddf3', 'WEAPON_COMPACTRIFLE', 0),
	(24, 'steam:110000109c2ddf3', 'WEAPON_ASSAULTSMG', 0),
	(25, 'steam:110000109c2ddf3', 'WEAPON_FLASHLIGHT', 0),
	(26, 'steam:110000109c2ddf3', 'WEAPON_KNUCKLE', 0),
	(27, 'steam:110000109c2ddf3', 'WEAPON_MACHETE', 0),
	(28, 'steam:110000109c2ddf3', 'WEAPON_HATCHET', 0),
	(29, 'steam:110000109c2ddf3', 'WEAPON_BAT', 0),
	(30, 'steam:110000109c2ddf3', 'WEAPON_HOMINGLAUNCHER', 0),
	(31, 'steam:110000109c2ddf3', 'WEAPON_MG', 0),
	(32, 'steam:110000109c2ddf3', 'WEAPON_BOTTLE', 0),
	(33, 'steam:110000109c2ddf3', 'WEAPON_BATTLEAXE', 0),
	(34, 'steam:110000109c2ddf3', 'WEAPON_MACHINEPISTOL', 0),
	(35, 'steam:110000109c2ddf3', 'WEAPON_BALL', 0),
	(36, 'steam:110000109c2ddf3', 'WEAPON_HAMMER', 0),
	(37, 'steam:110000109c2ddf3', 'WEAPON_HEAVYSNIPER', 0),
	(38, 'steam:110000109c2ddf3', 'WEAPON_FIREWORK', 0),
	(39, 'steam:110000109c2ddf3', 'WEAPON_MOLOTOV', 0),
	(40, 'steam:110000109c2ddf3', 'WEAPON_PISTOL', 2),
	(41, 'steam:110000109c2ddf3', 'WEAPON_PROXMINE', 0),
	(42, 'steam:110000109c2ddf3', 'WEAPON_CARBINERIFLE', 0),
	(43, 'steam:110000109c2ddf3', 'WEAPON_ADVANCEDRIFLE', 0),
	(44, 'steam:110000109c2ddf3', 'WEAPON_FLARE', 0),
	(45, 'steam:110000109c2ddf3', 'WEAPON_APPISTOL', 0),
	(46, 'steam:110000109c2ddf3', 'WEAPON_HEAVYSHOTGUN', 0),
	(47, 'steam:110000109c2ddf3', 'WEAPON_COMBATPDW', 0),
	(48, 'steam:110000109c2ddf3', 'WEAPON_FLAREGUN', 0),
	(49, 'steam:110000109c2ddf3', 'WEAPON_VINTAGEPISTOL', 0),
	(50, 'steam:110000109c2ddf3', 'WEAPON_MUSKET', 0),
	(51, 'steam:110000109c2ddf3', 'WEAPON_DOUBLEACTION', 0),
	(52, 'steam:110000109c2ddf3', 'WEAPON_SWITCHBLADE', 0),
	(53, 'steam:110000109c2ddf3', 'WEAPON_SNSPISTOL', 0),
	(54, 'steam:110000109c2ddf3', 'WEAPON_GRENADE', 0),
	(55, 'steam:110000109c2ddf3', 'WEAPON_STICKYBOMB', 0),
	(56, 'steam:110000109c2ddf3', 'WEAPON_REVOLVER', 0),
	(57, 'steam:110000109c2ddf3', 'WEAPON_DIGISCANNER', 0),
	(58, 'steam:110000109c2ddf3', 'WEAPON_HANDCUFFS', 0),
	(59, 'steam:110000109c2ddf3', 'WEAPON_FIREEXTINGUISHER', 0),
	(60, 'steam:110000109c2ddf3', 'WEAPON_BZGAS', 0),
	(61, 'steam:110000109c2ddf3', 'WEAPON_RAILGUN', 0),
	(62, 'steam:110000109c2ddf3', 'WEAPON_MINIGUN', 0),
	(63, 'steam:110000109c2ddf3', 'WEAPON_ASSAULTRIFLE', 0),
	(64, 'steam:110000109c2ddf3', 'WEAPON_COMBATMG', 0),
	(65, 'steam:110000109c2ddf3', 'WEAPON_PUMPSHOTGUN', 0),
	(66, 'steam:110000109c2ddf3', 'WEAPON_MARKSMANRIFLE', 0),
	(67, 'steam:110000109c2ddf3', 'WEAPON_SNIPERRIFLE', 0),
	(68, 'steam:110000109c2ddf3', 'WEAPON_MICROSMG', 0),
	(69, 'steam:110000109c2ddf3', 'WEAPON_BULLPUPSHOTGUN', 0),
	(70, 'steam:110000109c2ddf3', 'WEAPON_POOLCUE', 0),
	(71, 'steam:110000109c2ddf3', 'WEAPON_SMG', 0),
	(72, 'steam:110000109c2ddf3', 'WEAPON_WRENCH', 0),
	(73, 'steam:110000109c2ddf3', 'WEAPON_PISTOL50', 0),
	(74, 'steam:110000109c2ddf3', 'WEAPON_STUNGUN', 0),
	(75, 'steam:110000109c2ddf3', 'WEAPON_STINGER', 0),
	(76, 'steam:110000109c2ddf3', 'WEAPON_SPECIALCARBINE', 0),
	(77, 'steam:110000109c2ddf3', 'WEAPON_GARBAGEBAG', 0),
	(78, 'steam:110000109c2ddf3', 'WEAPON_SMOKEGRENADE', 0),
	(79, 'steam:110000109c2ddf3', 'WEAPON_KNIFE', 1),
	(80, 'steam:110000109c2ddf3', 'WEAPON_MINISMG', 0),
	(81, 'steam:110000109c2ddf3', 'WEAPON_CROWBAR', 0),
	(82, 'steam:110000109c2ddf3', 'WEAPON_PIPEBOMB', 0),
	(83, 'steam:110000109c2ddf3', 'WEAPON_BULLPUPRIFLE', 0),
	(84, 'steam:110000109c2ddf3', 'WEAPON_RPG', 0),
	(85, 'steam:110000109c2ddf3', 'WEAPON_SNOWBALL', 0),
	(86, 'steam:110000109c2ddf3', 'WEAPON_SAWNOFFSHOTGUN', 0),
	(87, 'steam:110000109c2ddf3', 'WEAPON_HEAVYPISTOL', 0),
	(88, 'steam:110000109c2ddf3', 'WEAPON_PETROLCAN', 0),
	(89, 'steam:110000109c2ddf3', 'WEAPON_COMBATPISTOL', 0),
	(90, 'steam:110000109c2ddf3', 'WEAPON_ASSAULTSHOTGUN', 0),
	(91, 'steam:110000109c2ddf3', 'WEAPON_GOLFCLUB', 0),
	(92, 'steam:110000109c2ddf3', 'WEAPON_AUTOSHOTGUN', 0),
	(93, 'steam:110000109c2ddf3', 'WEAPON_GRENADELAUNCHER', 0),
	(94, 'steam:110000109c2ddf3', 'WEAPON_DAGGER', 0),
	(95, 'steam:110000109c2ddf3', 'WEAPON_COMPACTLAUNCHER', 0),
	(96, 'steam:110000109c2ddf3', 'WEAPON_NIGHTSTICK', 0),
	(97, 'steam:110000109c2ddf3', 'phone', 1),
	(98, 'steam:110000109c2ddf3', 'disc_ammo_pistol', 0),
	(99, 'steam:110000109c2ddf3', 'disc_ammo_smg_large', 0),
	(100, 'steam:110000109c2ddf3', 'disc_ammo_shotgun_large', 0),
	(101, 'steam:110000109c2ddf3', 'disc_ammo_rifle_large', 0),
	(102, 'steam:110000109c2ddf3', 'disc_ammo_shotgun', 0),
	(103, 'steam:110000109c2ddf3', 'disc_ammo_snp', 0),
	(104, 'steam:110000109c2ddf3', 'disc_ammo_rifle', 0),
	(105, 'steam:110000109c2ddf3', 'disc_ammo_pistol_large', 0),
	(106, 'steam:110000109c2ddf3', 'disc_ammo_smg', 0),
	(107, 'steam:110000109c2ddf3', 'disc_ammo_snp_large', 0);
/*!40000 ALTER TABLE `user_inventory` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.user_lastcharacter
CREATE TABLE IF NOT EXISTS `user_lastcharacter` (
  `steamid` varchar(255) NOT NULL,
  `charid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumpar data för tabell essentialmode.user_lastcharacter: ~0 rows (ungefär)
/*!40000 ALTER TABLE `user_lastcharacter` DISABLE KEYS */;
INSERT IGNORE INTO `user_lastcharacter` (`steamid`, `charid`) VALUES
	('steam:110000109c2ddf3', 1);
/*!40000 ALTER TABLE `user_lastcharacter` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.user_licenses: ~0 rows (ungefär)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Dumpar struktur för tabell essentialmode.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumpar data för tabell essentialmode.vehicles: ~240 rows (ungefär)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT IGNORE INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Adder', 'adder', 900000, 'super'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Blista', 'blista', 8000, 'compacts'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'super'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('FMJ', 'fmj', 185000, 'super'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('Nightblade', 'nightblade', 35000, 'motorcycles'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oppressor', 'oppressor', 3524500, 'super'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'super'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('riata', 'riata', 380000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'super'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Visione', 'visione', 2250000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voltic 2', 'voltic2', 3830400, 'super'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');
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
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumpar data för tabell essentialmode.yellow_tweets: ~0 rows (ungefär)
/*!40000 ALTER TABLE `yellow_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `yellow_tweets` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
