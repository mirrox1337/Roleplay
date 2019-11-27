create table mirrox_inventory
(
    id int auto_increment
        primary key,
    owner text not null,
    type text null,
    data longtext not null
);

create table mirrox_inventory_itemdata
(
    id bigint unsigned auto_increment,
    name text not null,
    description text null,
    weight int default 0 not null,
    closeonuse tinyint(1) default 0 not null,
    constraint id
        unique (id)
);

create table mirrox_ammo
(
    id bigint unsigned auto_increment,
    owner text not null,
    hash text not null,
    count int default 0 not null,
    constraint id
        unique (id)
);

alter table mirrox_ammo
    add primary key (id);

INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_ADVANCEDRIFLE', 'CTAR-21', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_APPISTOL', 'Colt SCAMP', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_ASSAULTRIFLE', 'Norinco Type 56-2', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_ASSAULTSHOTGUN', 'UTAS UTS-15', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_ASSAULTSMG', 'Magpul PDR-C', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_AUTOSHOTGUN', 'Armsel Protecta', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_BALL', 'Boll', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_BAT', 'Slagträ', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_BATTLEAXE', 'Stridsyxa', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_BOTTLE', 'Flaska', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_BULLPUPRIFLE', 'Norinco QBZ-95-', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_BULLPUPSHOTGUN', 'Kel-Tec KSG', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_BZGAS', 'M18 Smoke Grenade', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_CARBINERIFLE', 'AR-15', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_COMBATMG', 'FN Mk 48 Mod 1', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_COMBATPDW', 'SIG-Sauer MPX-SD', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_COMBATPISTOL', 'H&K P2000', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_COMPACTLAUNCHER', 'M79 grenade launcher', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_COMPACTRIFLE', 'Micro Draco AK Pistol', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_CROWBAR', 'Kofot', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_DAGGER', 'Dolk', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_DBSHOTGUN', 'Zabala short barreled shotgun', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_DOUBLEACTION', '.44 Magnum', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_FIREEXTINGUISHER', 'Brandsläckare', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_FIREWORK', 'Panzerschreck', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_FLARE', 'Bengal', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_FLAREGUN', 'Signalpistol', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_FLASHLIGHT', 'Ficklampa', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_GOLFCLUB', 'Golfklubba', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_GRENADE', 'M61 Granat', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_GRENADELAUNCHER', 'Milkor Mark 14 MGL', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_GUSENBERG', 'Thompson M1928A1', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_HAMMER', 'Hammare', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_HATCHET', 'Yxa', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_HEAVYPISTOL', 'EAWB 1911', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_HEAVYSHOTGUN', 'Saiga 12', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_HEAVYSNIPER', 'Barrett M107', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_HOMINGLAUNCHER', 'FIM-92 Stinger', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_KNIFE', 'Kniv', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_KNUCKLE', 'Knogjärn', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_MACHETE', 'Machete', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_MACHINEPISTOL', 'TEC-9', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_MARKSMANPISTOL', 'Thompson Center Arms Contender', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_MARKSMANRIFLE', 'Ruger Mini-30', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_MG', 'PKM', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_MICROSMG', 'Mini Uzi', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_MINIGUN', 'GE M134 Minigun', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_MINISMG', 'Skorpion', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_MOLOTOV', 'Molotov', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_MUSKET', 'Musket', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_NIGHTSTICK', 'Batong', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_PETROLCAN', 'Bensindunk', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_PIPEBOMB', 'Rörbomb', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_PISTOL', 'Taurus PT92AF', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_PISTOL50', 'Desert Eagle', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_POOLCUE', 'Biljardkö', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_PROXMINE', 'Proximity Mine', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_PUMPSHOTGUN', 'Mossberg 590', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_RAILGUN', 'Rail Gun', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_REVOLVER', 'Colt M1909', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_RPG', 'RPG-7', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_SAWNOFFSHOTGUN', 'Mossberg 500', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_SMG', 'MP5N', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_SNIPERRIFLE', 'AW-F', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_SNOWBALL', 'Snöboll', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_SNSPISTOL', 'H&K P7M10', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_SPECIALCARBINE', 'H&K G36C', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_STICKYBOMB', 'M112 C4', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_STUNGUN', 'Stinger S-200', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_SWITCHBLADE', 'Stilett', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_VINTAGEPISTOL', 'FN Model 1922', 1, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('WEAPON_WRENCH', 'Skiftnyckel', 1, 0, 1);

INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('1', 'WEAPON_ADVANCEDRIFLE', 'CTAR-21 är ett israeliskt bullpup-gevär för 5.56x45mm NATO eller 9×19 mm ammunition.', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('2', 'WEAPON_APPISTOL', '"Small Caliber Machine Pistol"', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('3', 'WEAPON_ASSAULTRIFLE', 'Type 56 är en kinesisk variant utav den sovietiska AK-47', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('4', 'WEAPON_ASSAULTSHOTGUN', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('5', 'WEAPON_ASSAULTSMG', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('6', 'WEAPON_AUTOSHOTGUN', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('7', 'WEAPON_BALL', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('8', 'WEAPON_BAT', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('9', 'WEAPON_BATTLEAXE', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('10', 'WEAPON_BOTTLE', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('11', 'WEAPON_BULLPUPRIFLE', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('12', 'WEAPON_BULLPUPSHOTGUN', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('13', 'WEAPON_BZGAS', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('14', 'WEAPON_CARBINERIFLE', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('15', 'WEAPON_COMBATMG', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('16', 'WEAPON_COMBATPDW', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('17', 'WEAPON_COMBATPISTOL', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('18', 'WEAPON_COMPACTLAUNCHER', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('19', 'WEAPON_COMPACTRIFLE', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('20', 'WEAPON_CROWBAR', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('21', 'WEAPON_DAGGER', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('22', 'WEAPON_DBSHOTGUN', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('23', 'WEAPON_DOUBLEACTION', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('24', 'WEAPON_FIREEXTINGUISHER', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('25', 'WEAPON_FIREWORK', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('26', 'WEAPON_FLARE', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('27', 'WEAPON_FLAREGUN', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('28', 'WEAPON_FLASHLIGHT', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('29', 'WEAPON_GOLFCLUB', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('30', 'WEAPON_GRENADE', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('31', 'WEAPON_GRENADELAUNCHER', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('32', 'WEAPON_GUSENBERG', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('33', 'WEAPON_HAMMER', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('34', 'WEAPON_HATCHET', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('35', 'WEAPON_HEAVYPISTOL', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('36', 'WEAPON_HEAVYSHOTGUN', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('37', 'WEAPON_HEAVYSNIPER', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('38', 'WEAPON_HOMINGLAUNCHER', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('39', 'WEAPON_KNIFE', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('40', 'WEAPON_KNUCKLE', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('41', 'WEAPON_MACHETE', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('42', 'WEAPON_MACHINEPISTOL', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('43', 'WEAPON_MARKSMANPISTOL', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('44', 'WEAPON_MARKSMANRIFLE', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('45', 'WEAPON_MG', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('46', 'WEAPON_MICROSMG', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('47', 'WEAPON_MINIGUN', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('48', 'WEAPON_MINISMG', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('49', 'WEAPON_MOLOTOV', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('50', 'WEAPON_MUSKET', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('51', 'WEAPON_NIGHTSTICK', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('52', 'WEAPON_PETROLCAN', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('53', 'WEAPON_PIPEBOMB', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('54', 'WEAPON_PISTOL', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('55', 'WEAPON_PISTOL50', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('56', 'WEAPON_POOLCUE', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('57', 'WEAPON_PROXMINE', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('58', 'WEAPON_PUMPSHOTGUN', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('59', 'WEAPON_RAILGUN', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('60', 'WEAPON_REVOLVER', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('61', 'WEAPON_RPG', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('62', 'WEAPON_SAWNOFFSHOTGUN', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('63', 'WEAPON_SMG', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('64', 'WEAPON_SNIPERRIFLE', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('65', 'WEAPON_SNOWBALL', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('66', 'WEAPON_SNSPISTOL', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('67', 'WEAPON_SPECIALCARBINE', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('68', 'WEAPON_STICKYBOMB', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('69', 'WEAPON_STUNGUN', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('70', 'WEAPON_SWITCHBLADE', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('71', 'WEAPON_VINTAGEPISTOL', 'Beskrivning', 0);
INSERT INTO never.mirrox_inventory_itemdata (`id`, `name`, `description`, `weight`) VALUES ('72', 'WEAPON_WRENCH', 'Beskrivning', 0);

INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('ammo_pistol', '9mm Ammo', -10, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('ammo_pistol_large', '9mm Ammo StorPack', -10, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('ammo_rifle', '5.56x45 Ammo', 10, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('ammo_rifle_large', '5.56x45 Ammo StorPack', 10, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('ammo_shotgun', 'Hagelpatroner 12/70', 10, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('ammo_shotgun_large', 'Hagelpatroner 12/70 StorPack', 10, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('ammo_smg', '.45 ACP Ammo', 10, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('ammo_smg_large', '.45 ACP Ammo StorPack', 10, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('ammo_snp', '7.62×51 Ammo', 10, 0, 1);
INSERT INTO never.items (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES ('ammo_snp_large', '7.62×51 Ammo StorPack', 10, 0, 1);