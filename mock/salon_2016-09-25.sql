# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.14)
# Database: salon
# Generation Time: 2016-09-25 18:42:28 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table addon
# ------------------------------------------------------------

DROP TABLE IF EXISTS `addon`;

CREATE TABLE `addon` (
  `addon_id` int(4) NOT NULL,
  `name` varchar(35) NOT NULL,
  `timeblock` int(3) NOT NULL,
  `create_admin` int(4) NOT NULL DEFAULT '0',
  `update_admin` int(4) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`addon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `addon` WRITE;
/*!40000 ALTER TABLE `addon` DISABLE KEYS */;

INSERT INTO `addon` (`addon_id`, `name`, `timeblock`, `create_admin`, `update_admin`, `create_ts`, `update_ts`)
VALUES
	(1000,'Deep Condition',45,0,NULL,'2016-09-19 15:41:30','2016-09-19 15:41:30'),
	(2000,'Clarifying Treatment',45,0,NULL,'2016-09-19 15:41:30','2016-09-19 15:41:30'),
	(3000,'Haircut',30,0,NULL,'2016-09-19 15:41:30','2016-09-19 15:41:30');

/*!40000 ALTER TABLE `addon` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table appointment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `appointment_id` int(8) NOT NULL,
  `service_id` int(4) DEFAULT NULL,
  `customer_id` int(4) NOT NULL,
  `promotion_id` int(4) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `is_repeated` tinyint(1) DEFAULT NULL,
  `staff_id` int(4) DEFAULT NULL,
  `resources` varchar(255) DEFAULT NULL,
  `status_code` int(4) DEFAULT NULL,
  `check_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scheduled_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_admin` int(4) NOT NULL DEFAULT '0',
  `update_admin` int(4) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`appointment_id`),
  KEY `service_id` (`service_id`),
  KEY `customer_id` (`customer_id`),
  KEY `promotion_id` (`promotion_id`),
  KEY `staff_id` (`staff_id`),
  KEY `status_code` (`status_code`),
  CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`promotion_id`) REFERENCES `promotion` (`promotion_id`),
  CONSTRAINT `appointment_ibfk_4` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `appointment_ibfk_5` FOREIGN KEY (`status_code`) REFERENCES `status` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table change
# ------------------------------------------------------------

DROP TABLE IF EXISTS `change`;

CREATE TABLE `change` (
  `change_id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `table_name` varchar(35) NOT NULL,
  `column_name` varchar(35) NOT NULL,
  `previous_value` varchar(255) NOT NULL,
  `current_value` varchar(255) NOT NULL,
  `change_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_undone` tinyint(1) DEFAULT '0',
  `create_admin` int(4) NOT NULL DEFAULT '0',
  `update_admin` int(4) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`change_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table count
# ------------------------------------------------------------

DROP TABLE IF EXISTS `count`;

CREATE TABLE `count` (
  `count_id` int(6) NOT NULL AUTO_INCREMENT,
  `count_date` date DEFAULT NULL,
  `count_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data` mediumtext,
  `is_erroneous` tinyint(1) DEFAULT '0',
  `create_admin` int(4) NOT NULL DEFAULT '0',
  `update_admin` int(4) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`count_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customer_id` int(4) NOT NULL AUTO_INCREMENT,
  `first` varchar(35) NOT NULL,
  `last` varchar(35) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(75) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `postal` char(5) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `alt_phone` varchar(12) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `preferred_staff` int(4) DEFAULT NULL,
  `discount_type` int(4) DEFAULT NULL,
  `referral_source` varchar(50) DEFAULT NULL,
  `create_admin` int(4) NOT NULL DEFAULT '0',
  `update_admin` int(4) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`customer_id`),
  KEY `discount_type` (`discount_type`),
  KEY `preferred_staff` (`preferred_staff`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`discount_type`) REFERENCES `discount` (`discount_type`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`preferred_staff`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=491 DEFAULT CHARSET=utf8;

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;

INSERT INTO `customer` (`customer_id`, `first`, `last`, `email`, `address`, `city`, `state`, `postal`, `phone`, `alt_phone`, `notes`, `preferred_staff`, `discount_type`, `referral_source`, `create_admin`, `update_admin`, `create_ts`, `update_ts`, `is_active`)
VALUES
	(1,'James','Button','jbutt@gmail.com','6649 N Blue Gum St','New Orleans','LA','70116','504-621-8927','504-845-1427',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(2,'Josephine','Darakjy','josephine_darakjy@darakjy.org','4 B Blue Ridge Blvd','Brighton','MI','48116','810-292-9388','810-374-9840',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(3,'Art','Venere','art@venere.org','8 W Cerritos Ave Apt 54','Bridgeport','NJ','8014','856-636-8749','856-264-4130',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(4,'Lenna','Paprocki','lpaprocki@hotmail.com','639 Main St','Anchorage','AK','99501','907-385-4412','907-921-2010',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(5,'Donette','Foller','donette.foller@cox.net','34 Center St','Hamilton','OH','45011','513-570-1893','513-549-4561',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(6,'Simona','Morasca','simona@morasca.com','3 Mcauley Dr','Ashland','OH','44805','419-503-2484','419-800-6759',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(7,'Mitsue','Tollner','mitsue_tollner@yahoo.com','7 Eads St','Chicago','IL','60632','773-573-6914','773-924-8565',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(8,'Leota','Dilliard','leota@hotmail.com','7 W Jackson Blvd','San Jose','CA','95111','408-752-3500','408-813-1105',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(9,'Sage','Wieser','sage_wieser@cox.net','5 Boston Ave Apt 88','Sioux Falls','SD','57105','605-414-2147','605-794-4895',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(10,'Kris','Marrier','kris@gmail.com','228 Runamuck Pl Apt 2808','Baltimore','MD','21224','410-655-8723','410-804-4694',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(11,'Minna','Amigon','minna_amigon@yahoo.com','2371 Jerrold Ave','Kulpsville','PA','19443','215-874-1229','215-422-8694',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(12,'Abel','Maclead','amaclead@gmail.com','37275 St  Rt 17m M','Middle Island','NY','11953','631-335-3414','631-677-3675',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(13,'Kiley','Caldarera','kiley.caldarera@aol.com','25 E 75th St Apt 69','Los Angeles','CA','90034','310-498-5651','310-254-3084',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(14,'Graciela','Ruta','gruta@cox.net','98 Connecticut Ave Nw','Chagrin Falls','OH','44023','440-780-8425','440-579-7763',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(15,'Cammy','Albares','calbares@gmail.com','56 E Morehead St','Laredo','TX','78045','956-537-6195','956-841-7216',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(16,'Mattie','Poquette','mattie@aol.com','73 State Road 434 E','Phoenix','AZ','85013','602-277-4385','602-953-6360',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(17,'Meaghan','Garufi','meaghan@hotmail.com','69734 E Carrillo St','Mc Minnville','TN','37110','931-313-9635','931-235-7959',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(18,'Gladys','Rim','gladys.rim@rim.org','322 New Horizon Blvd','Milwaukee','WI','53207','414-661-9598','414-377-2880',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(19,'Yuki','Whobrey','yuki_whobrey@aol.com','1 State Route 27','Taylor','MI','48180','313-288-7937','313-341-4470',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(20,'Fletcher','Flosi','fletcher.flosi@yahoo.com','394 Manchester Blvd','Rockford','IL','61109','815-828-2147','815-426-5657',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(21,'Bette','Nicka','bette_nicka@cox.net','6 S 33rd St','Aston','PA','19014','610-545-3615','610-492-4643',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(22,'Veronika','Inouye','vinouye@aol.com','6 Greenleaf Ave','San Jose','CA','95111','408-540-1785','408-813-4592',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(23,'Willard','Kolmetz','willard@hotmail.com','618 W Yakima Ave','Irving','TX','75062','972-303-9197','972-896-4882',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(24,'Maryann','Royster','mroyster@royster.com','74 S Westgate St','Albany','NY','12204','518-966-7987','518-448-8982',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(25,'Alisha','Slusarski','alisha@slusarski.com','3273 State St','Middlesex','NJ','8846','732-658-3154','732-635-3453',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(26,'Allene','Iturbide','allene_iturbide@cox.net','1 Central Ave','Stevens Point','WI','54481','715-662-6764','715-530-9863',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(27,'Chanel','Caudy','chanel.caudy@caudy.org','86 Nw 66th St Apt 8673','Shawnee','KS','66218','913-388-2079','913-899-1103',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(28,'Ezekiel','Chui','ezekiel@chui.com','2 Cedar Ave Apt 84','Easton','MD','21601','410-669-1642','410-235-8738',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(29,'Willow','Kusko','wkusko@yahoo.com','90991 Thorburn Ave','New York','NY','10011','212-582-4976','212-934-5167',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(30,'Bernardo','Figeroa','bfigeroa@aol.com','386 9th Ave N','Conroe','TX','77301','936-336-3951','936-597-3614',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(31,'Ammie','Corrio','ammie@corrio.com','74874 Atlantic Ave','Columbus','OH','43215','614-801-9788','614-648-3265',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(32,'Francine','Vocelka','francine_vocelka@vocelka.com','366 South Dr','Las Cruces','NM','88011','505-977-3911','505-335-5293',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(33,'Ernie','Stenseth','ernie_stenseth@aol.com','45 E Liberty St','Ridgefield Park','NJ','7660','201-709-6245','201-387-9093',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(34,'Albina','Glick','albina@glick.com','4 Ralph Ct','Dunellen','NJ','8812','732-924-7882','732-782-6701',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(35,'Alishia','Sergi','asergi@gmail.com','2742 Distribution Way','New York','NY','10025','212-860-1579','212-753-2740',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(36,'Solange','Shinko','solange@shinko.com','426 Wolf St','Metairie','LA','70002','504-979-9175','504-265-8174',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(37,'Jose','Stockham','jose@yahoo.com','128 Bransten Rd','New York','NY','10011','212-675-8570','212-569-4233',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(38,'Rozella','Ostrosky','rozella.ostrosky@ostrosky.com','17 Morena Blvd','Camarillo','CA','93012','805-832-6163','805-609-1531',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(39,'Valentine','Gillian','valentine_gillian@gmail.com','775 W 17th St','San Antonio','TX','78204','210-812-9597','210-300-6244',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(40,'Kati','Rulapaugh','kati.rulapaugh@hotmail.com','6980 Dorsett Rd','Abilene','KS','67410','785-463-7829','785-219-7724',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(41,'Youlanda','Schemmer','youlanda@aol.com','2881 Lewis Rd','Prineville','OR','97754','541-548-8197','541-993-2611',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(42,'Dyan','Oldroyd','doldroyd@aol.com','7219 Woodfield Rd','Overland Park','KS','66204','913-413-4604','913-645-8918',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(43,'Roxane','Campain','roxane@hotmail.com','1048 Main St','Fairbanks','AK','99708','907-231-4722','907-335-6568',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(44,'Lavera','Perin','lperin@perin.org','678 3rd Ave','Miami','FL','33196','305-606-7291','305-995-2078',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(45,'Erick','Ferencz','erick.ferencz@aol.com','20 S Babcock St','Fairbanks','AK','99712','907-741-1044','907-227-6777',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(46,'Fatima','Saylors','fsaylors@saylors.org','2 Lighthouse Ave','Hopkins','MN','55343','952-768-2416','952-479-2375',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(47,'Jina','Briddick','jina_briddick@briddick.com','38938 Park Blvd','Boston','MA','2128','617-399-5124','617-997-5771',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(48,'Kanisha','Waycott','kanisha_waycott@yahoo.com','5 Tomahawk Dr','Los Angeles','CA','90006','323-453-2780','323-315-7314',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(49,'Emerson','Bowley','emerson.bowley@bowley.org','762 S Main St','Madison','WI','53711','608-336-7444','608-658-7940',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(50,'Blair','Malet','bmalet@yahoo.com','209 Decker Dr','Philadelphia','PA','19132','215-907-9111','215-794-4519',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(51,'Brock','Bolognia','bbolognia@yahoo.com','4486 W O St Apt 1','New York','NY','10003','212-402-9216','212-617-5063',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(52,'Lorrie','Nestle','lnestle@hotmail.com','39 S 7th St','Tullahoma','TN','37388','931-875-6644','931-303-6041',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(53,'Sabra','Uyetake','sabra@uyetake.org','98839 Hawthorne Blvd Apt 6101','Columbia','SC','29201','803-925-5213','803-681-3678',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(54,'Marjory','Mastella','mmastella@mastella.com','71 San Mateo Ave','Wayne','PA','19087','610-814-5533','610-379-7125',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(55,'Karl','Klonowski','karl_klonowski@yahoo.com','76 Brooks St Apt 9','Flemington','NJ','8822','908-877-6135','908-470-4661',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(56,'Tonette','Wenner','twenner@aol.com','4545 Courthouse Rd','Westbury','NY','11590','516-968-6051','516-333-4861',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(57,'Amber','Monarrez','amber_monarrez@monarrez.org','14288 Foster Ave Apt 4121','Jenkintown','PA','19046','215-934-8655','215-329-6386',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(58,'Shenika','Seewald','shenika@gmail.com','4 Otis St','Van Nuys','CA','91405','818-423-4007','818-749-8650',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(59,'Delmy','Ahle','delmy.ahle@hotmail.com','65895 S 16th St','Providence','RI','2909','401-458-2547','401-559-8961',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(60,'Deeanna','Juhas','deeanna_juhas@gmail.com','14302 Pennsylvania Ave','Huntingdon Valley','PA','19006','215-211-9589','215-417-9563',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(61,'Blondell','Pugh','bpugh@aol.com','201 Hawk Ct','Providence','RI','2904','401-960-8259','401-300-8122',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(62,'Jamal','Vanausdal','jamal@vanausdal.org','53075 Sw 152nd Ter Apt 615','Monroe Township','NJ','8831','732-234-1546','732-904-2931',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(63,'Cecily','Hollack','cecily@hollack.org','59 N Groesbeck Hwy','Austin','TX','78731','512-486-3817','512-861-3814',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(64,'Carmelina','Lindall','carmelina_lindall@lindall.com','2664 Lewis Rd','Littleton','CO','80126','303-724-7371','303-874-5160',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(65,'Maurine','Yglesias','maurine_yglesias@yglesias.com','59 Shady Ln Apt 53','Milwaukee','WI','53214','414-748-1374','414-573-7719',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(66,'Tawna','Buvens','tawna@gmail.com','3305 Nabell Ave Apt 679','New York','NY','10009','212-674-9610','212-462-9157',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(67,'Penney','Weight','penney_weight@aol.com','18 Fountain St','Anchorage','AK','99515','907-797-9628','907-873-2882',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(68,'Elly','Morocco','elly_morocco@gmail.com','7 W 32nd St','Erie','PA','16502','814-393-5571','814-420-3553',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(69,'Ilene','Eroman','ilene.eroman@hotmail.com','2853 S Central Expy','Glen Burnie','MD','21061','410-914-9018','410-937-4543',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(70,'Vallie','Mondella','vmondella@mondella.com','74 W College St','Boise','ID','83707','208-862-5339','208-737-8439',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(71,'Kallie','Blackwood','kallie.blackwood@gmail.com','701 S Harrison Rd','San Francisco','CA','94104','415-315-2761','415-604-7609',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(72,'Johnetta','Abdallah','johnetta_abdallah@aol.com','1088 Pinehurst St','Chapel Hill','NC','27514','919-225-9345','919-715-3791',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(73,'Bobbye','Rhym','brhym@rhym.com','30 W 80th St Apt 1995','San Carlos','CA','94070','650-528-5783','650-811-9032',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(74,'Micaela','Rhymes','micaela_rhymes@gmail.com','20932 Hedley St','Concord','CA','94520','925-647-3298','925-522-7798',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(75,'Tamar','Hoogland','tamar@hotmail.com','2737 Pistorio Rd Apt 9230','London','OH','43140','740-343-8575','740-526-5410',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(76,'Moon','Parlato','moon@yahoo.com','74989 Brandon St','Wellsville','NY','14895','585-866-8313','585-498-4278',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(77,'Laurel','Reitler','laurel_reitler@reitler.com','6 Kains Ave','Baltimore','MD','21215','410-520-4832','410-957-6903',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(78,'Delisa','Crupi','delisa.crupi@crupi.com','47565 W Grand Ave','Newark','NJ','7105','973-354-2040','973-847-9611',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(79,'Viva','Toelkes','viva.toelkes@gmail.com','4284 Dorigo Ln','Chicago','IL','60647','773-446-5569','773-352-3437',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(80,'Elza','Lipke','elza@yahoo.com','6794 Lake Dr E','Newark','NJ','7104','973-927-3447','973-796-3667',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(81,'Devorah','Chickering','devorah@hotmail.com','31 Douglas Blvd Apt 950','Clovis','NM','88101','505-975-8559','505-950-1763',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(82,'Timothy','Mulqueen','timothy_mulqueen@mulqueen.org','44 W 4th St','Staten Island','NY','10309','718-332-6527','718-654-7063',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(83,'Arlette','Honeywell','ahoneywell@honeywell.com','11279 Loytan St','Jacksonville','FL','32254','904-775-4480','904-514-9918',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(84,'Dominque','Dickerson','dominque.dickerson@dickerson.org','69 Marquette Ave','Hayward','CA','94545','510-993-3758','510-901-7640',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(85,'Lettie','Isenhower','lettie_isenhower@yahoo.com','70 W Main St','Beachwood','OH','44122','216-657-7668','216-733-8494',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(86,'Myra','Munns','mmunns@cox.net','461 Prospect Pl Apt 316','Euless','TX','76040','817-914-7518','817-451-3518',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(87,'Stephaine','Barfield','stephaine@barfield.com','47154 Whipple Ave Nw','Gardena','CA','90247','310-774-7643','310-968-1219',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(88,'Lai','Gato','lai.gato@gato.org','37 Alabama Ave','Evanston','IL','60201','847-728-7286','847-957-4614',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(89,'Stephen','Emigh','stephen_emigh@hotmail.com','3777 E Richmond St Apt 900','Akron','OH','44302','330-537-5358','330-700-2312',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(90,'Tyra','Shields','tshields@gmail.com','3 Fort Worth Ave','Philadelphia','PA','19106','215-255-1641','215-228-8264',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(91,'Tammara','Wardrip','twardrip@cox.net','4800 Black Horse Pike','Burlingame','CA','94010','650-803-1936','650-216-5075',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(92,'Cory','Gibes','cory.gibes@gmail.com','83649 W Belmont Ave','San Gabriel','CA','91776','626-572-1096','626-696-2777',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(93,'Danica','Bruschke','danica_bruschke@gmail.com','840 15th Ave','Waco','TX','76708','254-782-8569','254-205-1422',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(94,'Wilda','Giguere','wilda@cox.net','1747 Calle Amanecer Apt 2','Anchorage','AK','99501','907-870-5536','907-914-9482',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(95,'Elvera','Benimadho','elvera.benimadho@cox.net','99385 Charity St Apt 840','San Jose','CA','95110','408-703-8505','408-440-8447',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(96,'Carma','Vanheusen','carma@cox.net','68556 Central Hwy','San Leandro','CA','94577','510-503-7169','510-452-4835',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(97,'Malinda','Hochard','malinda.hochard@yahoo.com','55 Riverside Ave','Indianapolis','IN','46202','317-722-5066','317-472-2412',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(98,'Natalie','Fern','natalie.fern@hotmail.com','7140 University Ave','Rock Springs','WY','82901','307-704-8713','307-279-3793',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(99,'Lisha','Centini','lisha@centini.org','64 5th Ave Apt 1153','Mc Lean','VA','22102','703-235-3937','703-475-7568',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(100,'Arlene','Klusman','arlene_klusman@gmail.com','3 Secor Rd','New Orleans','LA','70112','504-710-5840','504-946-1807',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(101,'Alease','Buemi','alease@buemi.com','4 Webbs Chapel Rd','Boulder','CO','80303','303-301-4946','303-521-9860',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(102,'Louisa','Cronauer','louisa@cronauer.com','524 Louisiana Ave Nw','San Leandro','CA','94577','510-828-7047','510-472-7758',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(103,'Angella','Cetta','angella.cetta@hotmail.com','185 Blackstone Bldge','Honolulu','HI','96817','808-892-7943','808-475-2310',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(104,'Cyndy','Goldammer','cgoldammer@cox.net','170 Wyoming Ave','Burnsville','MN','55337','952-334-9408','952-938-9457',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(105,'Rosio','Cork','rosio.cork@gmail.com','4 10th St W','High Point','NC','27263','336-243-5659','336-497-4407',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(106,'Celeste','Korando','ckorando@hotmail.com','7 W Pinhook Rd','Lynbrook','NY','11563','516-509-2347','516-365-7266',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(107,'Twana','Felger','twana.felger@felger.org','1 Commerce Way','Portland','OR','97224','503-939-3153','503-909-7167',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(108,'Estrella','Samu','estrella@aol.com','64 Lakeview Ave','Beloit','WI','53511','608-976-7199','608-942-8836',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(109,'Donte','Kines','dkines@hotmail.com','3 Aspen St','Worcester','MA','1602','508-429-8576','508-843-1426',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(110,'Tiffiny','Steffensmeier','tiffiny_steffensmeier@cox.net','32860 Sierra Rd','Miami','FL','33133','305-385-9695','305-304-6573',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(111,'Edna','Miceli','emiceli@miceli.org','555 Main St','Erie','PA','16502','814-460-2655','814-299-2877',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(112,'Sue','Kownacki','sue@aol.com','2 Se 3rd Ave','Mesquite','TX','75149','972-666-3413','972-742-4000',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(113,'Jesusa','Shin','jshin@shin.com','2239 Shawnee Mission Pky','Tullahoma','TN','37388','931-273-8709','931-739-1551',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(114,'Rolland','Francescon','rolland@cox.net','2726 Charcot Ave','Paterson','NJ','7501','973-649-2922','973-284-4048',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(115,'Pamella','Schmierer','pamella.schmierer@schmierer.org','5161 Dorsett Rd','Homestead','FL','33030','305-420-8970','305-575-8481',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(116,'Glory','Kulzer','gkulzer@kulzer.org','55892 Jacksonville Rd','Owings Mills','MD','21117','410-224-9462','410-916-8015',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(117,'Shawna','Palaspas','shawna_palaspas@palaspas.org','5 N Cleveland Massillon Rd','Thousand Oaks','CA','91362','805-275-3566','805-638-6617',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(118,'Brandon','Callaro','brandon_callaro@hotmail.com','7 Benton Dr','Honolulu','HI','96819','808-215-6832','808-240-5168',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(119,'Scarlet','Cartan','scarlet.cartan@yahoo.com','9390 S Howell Ave','Albany','GA','31701','229-735-3378','229-365-9658',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(120,'Oretha','Menter','oretha_menter@yahoo.com','8 County Center Dr Apt 647','Boston','MA','2210','617-418-5043','617-697-6024',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(121,'Ty','Smith','tsmith@aol.com','4646 Kaahumanu St','Hackensack','NJ','7601','201-672-1553','201-995-3149',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(122,'Xuan','Rochin','xuan@gmail.com','2 Monroe St','San Mateo','CA','94403','650-933-5072','650-247-2625',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(123,'Lindsey','Dilello','lindsey.dilello@hotmail.com','52777 Leaders Heights Rd','Ontario','CA','91761','909-639-9887','909-589-1693',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(124,'Devora','Perez','devora_perez@perez.org','72868 Blackington Ave','Oakland','CA','94606','510-955-3016','510-755-9274',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(125,'Herman','Demesa','hdemesa@cox.net','9 Norristown Rd','Troy','NY','12180','518-497-2940','518-931-7852',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(126,'Rory','Papasergi','rpapasergi@cox.net','83 County Road 437 Apt 8581','Clarks Summit','PA','18411','570-867-7489','570-469-8401',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(127,'Talia','Riopelle','talia_riopelle@aol.com','1 N Harlem Ave Apt 9','Orange','NJ','7050','973-245-2133','973-818-9788',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(128,'Van','Shire','van.shire@shire.com','90131 J St','Pittstown','NJ','8867','908-409-2890','908-448-1209',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(129,'Lucina','Lary','lucina_lary@cox.net','8597 W National Ave','Cocoa','FL','32922','321-749-4981','321-632-4668',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(130,'Bok','Isaacs','bok.isaacs@aol.com','6 Gilson St','Bronx','NY','10468','718-809-3762','718-478-8568',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(131,'Rolande','Spickerman','rolande.spickerman@spickerman.com','65 W Maple Ave','Pearl City','HI','96782','808-315-3077','808-526-5863',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(132,'Howard','Paulas','hpaulas@gmail.com','866 34th Ave','Denver','CO','80231','303-623-4241','303-692-3118',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(133,'Kimbery','Madarang','kimbery_madarang@cox.net','798 Lund Farm Way','Rockaway','NJ','7866','973-310-1634','973-225-6259',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(134,'Thurman','Manno','thurman.manno@yahoo.com','9387 Charcot Ave','Absecon','NJ','8201','609-524-3586','609-234-8376',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(135,'Becky','Mirafuentes','becky.mirafuentes@mirafuentes.com','30553 Washington Rd','Plainfield','NJ','7062','908-877-8409','908-426-8272',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(136,'Beatriz','Corrington','beatriz@yahoo.com','481 W Lemon St','Middleboro','MA','2346','508-584-4279','508-315-3867',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(137,'Marti','Maybury','marti.maybury@yahoo.com','4 Warehouse Point Rd Apt 7','Chicago','IL','60638','773-775-4522','773-539-1058',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(138,'Nieves','Gotter','nieves_gotter@gmail.com','4940 Pulaski Park Dr','Portland','OR','97202','503-527-5274','503-455-3094',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(139,'Leatha','Hagele','lhagele@cox.net','627 Walford Ave','Dallas','TX','75227','214-339-1809','214-225-5850',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(140,'Valentin','Klimek','vklimek@klimek.org','137 Pioneer Way','Chicago','IL','60604','312-303-5453','312-512-2338',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(141,'Melissa','Wiklund','melissa@cox.net','61 13 Stoneridge Apt 835','Findlay','OH','45840','419-939-3613','419-254-4591',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(142,'Sheridan','Zane','sheridan.zane@zane.com','2409 Alabama Rd','Riverside','CA','92501','951-645-3605','951-248-6822',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(143,'Bulah','Padilla','bulah_padilla@hotmail.com','8927 Vandever Ave','Waco','TX','76707','254-463-4368','254-816-8417',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(144,'Audra','Kohnert','audra@kohnert.com','134 Lewis Rd','Nashville','TN','37211','615-406-7854','615-448-9249',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(145,'Daren','Weirather','dweirather@aol.com','9 N College Ave Apt 3','Milwaukee','WI','53216','414-959-2540','414-838-3151',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(146,'Fernanda','Jillson','fjillson@aol.com','60480 Old Us Highway 51','Preston','MD','21655','410-387-5260','410-724-6472',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(147,'Gearldine','Gellinger','gearldine_gellinger@gellinger.com','4 Bloomfield Ave','Irving','TX','75061','972-934-6914','972-821-7118',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(148,'Chau','Kitzman','chau@gmail.com','429 Tiger Ln','Beverly Hills','CA','90212','310-560-8022','310-969-7230',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(149,'Theola','Frey','theola_frey@frey.com','54169 N Main St','Massapequa','NY','11758','516-948-5768','516-357-3362',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(150,'Cheryl','Haroldson','cheryl@haroldson.org','92 Main St','Atlantic City','NJ','8401','609-518-7697','609-263-9243',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(151,'Laticia','Merced','lmerced@gmail.com','72 Mannix Dr','Cincinnati','OH','45203','513-508-7371','513-418-1566',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(152,'Carissa','Batman','carissa.batman@yahoo.com','12270 Caton Center Dr','Eugene','OR','97401','541-326-4074','541-801-5717',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(153,'Lezlie','Craghead','lezlie.craghead@craghead.org','749 W 18th St Apt 45','Smithfield','NC','27577','919-533-3762','919-885-2453',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(154,'Ozell','Shealy','oshealy@hotmail.com','8 Industry Ln','New York','NY','10002','212-332-8435','212-880-8865',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(155,'Arminda','Parvis','arminda@parvis.com','1 Huntwood Ave','Phoenix','AZ','85017','602-906-9419','602-277-3025',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(156,'Reita','Leto','reita.leto@gmail.com','55262 N French Rd','Indianapolis','IN','46240','317-234-1135','317-787-5514',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(157,'Yolando','Luczki','yolando@cox.net','422 E 21st St','Syracuse','NY','13214','315-304-4759','315-640-6357',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(158,'Lizette','Stem','lizette.stem@aol.com','501 N 19th Ave','Cherry Hill','NJ','8002','856-487-5412','856-702-3676',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(159,'Gregoria','Pawlowicz','gpawlowicz@yahoo.com','455 N Main Ave','Garden City','NY','11530','516-212-1915','516-376-4230',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(160,'Carin','Deleo','cdeleo@deleo.com','1844 Southern Blvd','Little Rock','AR','72202','501-308-1040','501-409-6072',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(161,'Chantell','Maynerich','chantell@yahoo.com','2023 Greg St','Saint Paul','MN','55101','651-591-2583','651-776-9688',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(162,'Dierdre','Yum','dyum@yahoo.com','63381 Jenks Ave','Philadelphia','PA','19134','215-325-3042','215-346-4666',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(163,'Larae','Gudroe','larae_gudroe@gmail.com','6651 Municipal Rd','Houma','LA','70360','985-890-7262','985-261-5783',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(164,'Latrice','Tolfree','latrice.tolfree@hotmail.com','81 Norris Ave Apt 525','Ronkonkoma','NY','11779','631-957-7624','631-998-2102',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(165,'Kerry','Theodorov','kerry.theodorov@gmail.com','6916 W Main St','Sacramento','CA','95827','916-591-3277','916-770-7448',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(166,'Dorthy','Hidvegi','dhidvegi@yahoo.com','9635 S Main St','Boise','ID','83704','208-649-2373','208-690-3315',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(167,'Fannie','Lungren','fannie.lungren@yahoo.com','17 Us Highway 111','Round Rock','TX','78664','512-587-5746','512-528-9933',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(168,'Evangelina','Radde','evangelina@aol.com','992 Civic Center Dr','Philadelphia','PA','19123','215-964-3284','215-417-5612',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(169,'Novella','Degroot','novella_degroot@degroot.org','303 N Radcliffe St','Hilo','HI','96720','808-477-4775','808-746-1865',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(170,'Clay','Hoa','choa@hoa.org','73 Saint Ann St Apt 86','Reno','NV','89502','775-501-8109','775-848-9135',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(171,'Jennifer','Fallick','jfallick@yahoo.com','44 58th St','Wheeling','IL','60090','847-979-9545','847-800-3054',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(172,'Irma','Wolfgramm','irma.wolfgramm@hotmail.com','9745 W Main St','Randolph','NJ','7869','973-545-7355','973-868-8660',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(173,'Eun','Coody','eun@yahoo.com','84 Bloomfield Ave','Spartanburg','SC','29301','864-256-3620','864-594-4578',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(174,'Sylvia','Cousey','sylvia_cousey@cousey.org','287 Youngstown Warren Rd','Hampstead','MD','21074','410-209-9545','410-863-8263',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(175,'Nana','Wrinkles','nana@aol.com','6 Van Buren St','Mount Vernon','NY','10553','914-855-2115','914-796-3775',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(176,'Layla','Springe','layla.springe@cox.net','229 N Forty Driv','New York','NY','10011','212-260-3151','212-253-7448',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(177,'Joesph','Degonia','joesph_degonia@degonia.org','2887 Knowlton St Apt 5435','Berkeley','CA','94710','510-677-9785','510-942-5916',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(178,'Annabelle','Boord','annabelle.boord@cox.net','523 Marquette Ave','Concord','MA','1742','978-697-6263','978-289-7717',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(179,'Stephaine','Vinning','stephaine@cox.net','3717 Hamann Industrial Pky','San Francisco','CA','94104','415-767-6596','415-712-9530',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(180,'Nelida','Sawchuk','nelida@gmail.com','3 State Route 35 S','Paramus','NJ','7652','201-971-1638','201-247-8925',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(181,'Marguerita','Hiatt','marguerita.hiatt@gmail.com','82 N Highway 67','Oakley','CA','94561','925-634-7158','925-541-8521',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(182,'Carmela','Cookey','ccookey@cookey.org','9 Murfreesboro Rd','Chicago','IL','60623','773-494-4195','773-297-9391',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(183,'Junita','Brideau','jbrideau@aol.com','6 S Broadway St','Cedar Grove','NJ','7009','973-943-3423','973-582-5469',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(184,'Claribel','Varriano','claribel_varriano@cox.net','6 Harry L Dr Apt 6327','Perrysburg','OH','43551','419-544-4900','419-573-2033',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(185,'Benton','Skursky','benton.skursky@aol.com','47939 Porter Ave','Gardena','CA','90248','310-579-2907','310-694-8466',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(186,'Hillary','Skulski','hillary.skulski@aol.com','9 Wales Rd Ne Apt 914','Homosassa','FL','34448','352-242-2570','352-990-5946',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(187,'Merilyn','Bayless','merilyn_bayless@cox.net','195 13n N','Santa Clara','CA','95054','408-758-5015','408-346-2180',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(188,'Teri','Ennaco','tennaco@gmail.com','99 Tank Farm Rd','Hazleton','PA','18201','570-889-5187','570-355-1665',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(189,'Merlyn','Lawler','merlyn_lawler@hotmail.com','4671 Alemany Blvd','Jersey City','NJ','7304','201-588-7810','201-858-9960',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(190,'Georgene','Montezuma','gmontezuma@cox.net','98 University Dr','San Ramon','CA','94583','925-615-5185','925-943-3449',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(191,'Jettie','Mconnell','jmconnell@hotmail.com','50 E Wacker Dr','Bridgewater','NJ','8807','908-802-3564','908-602-5258',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(192,'Lemuel','Latzke','lemuel.latzke@gmail.com','70 Euclid Ave Apt 722','Bohemia','NY','11716','631-748-6479','631-291-4976',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(193,'Melodie','Knipp','mknipp@gmail.com','326 E Main St Apt 6496','Thousand Oaks','CA','91362','805-690-1682','805-810-8964',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(194,'Candida','Corbley','candida_corbley@hotmail.com','406 Main St','Somerville','NJ','8876','908-275-8357','908-943-6103',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(195,'Karan','Karpin','karan_karpin@gmail.com','3 Elmwood Dr','Beaverton','OR','97005','503-940-8327','503-707-5812',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(196,'Andra','Scheyer','andra@gmail.com','9 Church St','Salem','OR','97302','503-516-2189','503-950-3068',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(197,'Felicidad','Poullion','fpoullion@poullion.com','9939 N 14th St','Riverton','NJ','8077','856-305-9731','856-828-6021',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(198,'Belen','Strassner','belen_strassner@aol.com','5384 Southwyck Blvd','Douglasville','GA','30135','770-507-8791','770-802-4003',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(199,'Gracia','Melnyk','gracia@melnyk.com','97 Airport Loop Dr','Jacksonville','FL','32216','904-235-3633','904-627-4341',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(200,'Jolanda','Hanafan','jhanafan@gmail.com','37855 Nolan Rd','Bangor','ME','4401','207-458-9196','207-233-6185',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(201,'Barrett','Toyama','barrett.toyama@toyama.org','4252 N Washington Ave Apt 9','Kennedale','TX','76060','817-765-5781','817-577-6151',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(202,'Helga','Fredicks','helga_fredicks@yahoo.com','42754 S Ash Ave','Buffalo','NY','14228','716-752-4114','716-854-9845',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(203,'Ashlyn','Pinilla','apinilla@cox.net','703 Beville Rd','Opa Locka','FL','33054','305-670-9628','305-857-5489',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(204,'Fausto','Agramonte','fausto_agramonte@yahoo.com','5 Harrison Rd','New York','NY','10038','212-313-1783','212-778-3063',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(205,'Ronny','Caiafa','ronny.caiafa@caiafa.org','73 Southern Blvd','Philadelphia','PA','19103','215-605-7570','215-511-3531',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(206,'Marge','Limmel','marge@gmail.com','189 Village Park Rd','Crestview','FL','32536','850-430-1663','850-330-8079',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(207,'Norah','Waymire','norah.waymire@gmail.com','6 Middlegate Rd Apt 106','San Francisco','CA','94107','415-306-7897','415-874-2984',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(208,'Aliza','Baltimore','aliza@aol.com','1128 Delaware St','San Jose','CA','95132','408-504-3552','408-425-1994',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(209,'Mozell','Pelkowski','mpelkowski@pelkowski.org','577 Parade St','South San Francisco','CA','94080','650-947-1215','650-960-1069',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(210,'Viola','Bitsuie','viola@gmail.com','70 Mechanic St','Northridge','CA','91325','818-864-4875','818-481-5787',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(211,'Franklyn','Emard','femard@emard.com','4379 Highway 116','Philadelphia','PA','19103','215-558-8189','215-483-3003',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(212,'Willodean','Konopacki','willodean_konopacki@konopacki.org','55 Hawthorne Blvd','Lafayette','LA','70506','337-253-8384','337-774-7564',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(213,'Beckie','Silvestrini','beckie.silvestrini@silvestrini.com','7116 Western Ave','Dearborn','MI','48126','313-533-4884','313-390-7855',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(214,'Rebecka','Gesick','rgesick@gesick.org','2026 N Plankinton Ave Apt 3','Austin','TX','78754','512-213-8574','512-693-8345',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(215,'Frederica','Blunk','frederica_blunk@gmail.com','99586 Main St','Dallas','TX','75207','214-428-2285','214-529-1949',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(216,'Glen','Bartolet','glen_bartolet@hotmail.com','8739 Hudson St','Vashon','WA','98070','206-697-5796','206-389-1482',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(217,'Freeman','Gochal','freeman_gochal@aol.com','383 Gunderman Rd Apt 197','Coatesville','PA','19320','610-476-3501','610-752-2683',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(218,'Vincent','Meinerding','vincent.meinerding@hotmail.com','4441 Point Term Mkt','Philadelphia','PA','19143','215-372-1718','215-829-4221',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(219,'Rima','Bevelacqua','rima@cox.net','2972 Lafayette Ave','Gardena','CA','90248','310-858-5079','310-499-4200',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(220,'Glendora','Sarbacher','gsarbacher@gmail.com','2140 Diamond Blvd','Rohnert Park','CA','94928','707-653-8214','707-881-3154',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(221,'Avery','Steier','avery@cox.net','93 Redmond Rd Apt 492','Orlando','FL','32803','407-808-9439','407-945-8566',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(222,'Cristy','Lother','cristy@lother.com','3989 Portage Tr','Escondido','CA','92025','760-971-4322','760-465-4762',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(223,'Nicolette','Brossart','nicolette_brossart@brossart.com','1 Midway Rd','Westborough','MA','1581','508-837-9230','508-504-6388',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(224,'Tracey','Modzelewski','tracey@hotmail.com','77132 Coon Rapids Blvd Nw','Conroe','TX','77301','936-264-9294','936-988-8171',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(225,'Virgina','Tegarden','virgina_tegarden@tegarden.com','755 Harbor Way','Milwaukee','WI','53226','414-214-8697','414-411-5744',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(226,'Tiera','Frankel','tfrankel@aol.com','87 Sierra Rd','El Monte','CA','91731','626-636-4117','626-638-4241',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(227,'Alaine','Bergesen','alaine_bergesen@cox.net','7667 S Hulen St Apt 42','Yonkers','NY','10701','914-300-9193','914-654-1426',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(228,'Earleen','Mai','earleen_mai@cox.net','75684 S Withlapopka Dr Apt 32','Dallas','TX','75227','214-289-1973','214-785-6750',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(229,'Leonida','Gobern','leonida@gobern.org','5 Elmwood Park Blvd','Biloxi','MS','39530','228-235-5615','228-432-4635',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(230,'Ressie','Auffrey','ressie.auffrey@yahoo.com','23 Palo Alto Sq','Miami','FL','33134','305-604-8981','305-287-4743',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(231,'Justine','Mugnolo','jmugnolo@yahoo.com','38062 E Main St','New York','NY','10048','212-304-9225','212-311-6377',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(232,'Eladia','Saulter','eladia@saulter.com','3958 S Dupont Hwy Apt 7','Ramsey','NJ','7446','201-474-4924','201-365-8698',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(233,'Chaya','Malvin','chaya@malvin.com','560 Civic Center Dr','Ann Arbor','MI','48103','734-928-5182','734-408-8174',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(234,'Gwenn','Suffield','gwenn_suffield@suffield.org','3270 Dequindre Rd','Deer Park','NY','11729','631-258-6558','631-295-9879',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(235,'Salena','Karpel','skarpel@cox.net','1 Garfield Ave Apt 7','Canton','OH','44707','330-791-8557','330-618-2579',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(236,'Yoko','Fishburne','yoko@fishburne.com','9122 Carpenter Ave','New Haven','CT','6511','203-506-4706','203-840-8634',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(237,'Taryn','Moyd','taryn.moyd@hotmail.com','48 Lenox St','Fairfax','VA','22030','703-322-4041','703-938-7939',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(238,'Katina','Polidori','katina_polidori@aol.com','5 Little River Tpke','Wilmington','MA','1887','978-626-2978','978-679-7429',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(239,'Rickie','Plumer','rickie.plumer@aol.com','3 N Groesbeck Hwy','Toledo','OH','43613','419-693-1334','419-313-5571',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(240,'Alex','Loader','alex@loader.com','37 N Elm St Apt 916','Tacoma','WA','98409','253-660-7821','253-875-9222',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(241,'Lashon','Vizarro','lashon@aol.com','433 Westminster Blvd Apt 590','Roseville','CA','95661','916-741-7884','916-289-4526',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(242,'Lauran','Burnard','lburnard@burnard.com','66697 Park Pl Apt 3224','Riverton','WY','82501','307-342-7795','307-453-7589',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(243,'Ceola','Setter','ceola.setter@setter.org','96263 Greenwood Pl','Warren','ME','4864','207-627-7565','207-297-5029',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(244,'My','Rantanen','my@hotmail.com','8 Mcarthur Ln','Richboro','PA','18954','215-491-5633','215-647-2158',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(245,'Lorrine','Worlds','lorrine.worlds@worlds.com','8 Fair Lawn Ave','Tampa','FL','33614','813-769-2939','813-863-6467',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(246,'Peggie','Sturiale','peggie@cox.net','9 N 14th St','El Cajon','CA','92020','619-608-1763','619-695-8086',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(247,'Marvel','Raymo','mraymo@yahoo.com','9 Vanowen St','College Station','TX','77840','979-718-8968','979-809-5770',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(248,'Daron','Dinos','daron_dinos@cox.net','18 Waterloo Geneva Rd','Highland Park','IL','60035','847-233-3075','847-265-6609',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(249,'An','Fritz','an_fritz@hotmail.com','506 S Hacienda Dr','Atlantic City','NJ','8401','609-228-5265','609-854-7156',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(250,'Portia','Stimmel','portia.stimmel@aol.com','3732 Sherman Ave','Bridgewater','NJ','8807','908-722-7128','908-670-4712',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(251,'Rhea','Aredondo','rhea_aredondo@cox.net','25657 Live Oak St','Brooklyn','NY','11226','718-560-9537','718-280-4183',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(252,'Benedict','Sama','bsama@cox.net','4923 Carey Ave','Saint Louis','MO','63104','314-787-1588','314-858-4832',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(253,'Alyce','Arias','alyce@arias.org','3196 S Rider Trl','Stockton','CA','95207','209-317-1801','209-242-7022',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(254,'Heike','Berganza','heike@gmail.com','3 Railway Ave Apt 75','Little Falls','NJ','7424','973-936-5095','973-822-8827',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(255,'Carey','Dopico','carey_dopico@dopico.org','87393 E Highland Rd','Indianapolis','IN','46220','317-578-2453','317-441-5848',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(256,'Dottie','Hellickson','dottie@hellickson.org','67 E Chestnut Hill Rd','Seattle','WA','98133','206-540-6076','206-295-5631',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(257,'Deandrea','Hughey','deandrea@yahoo.com','33 Lewis Rd Apt 46','Burlington','NC','27215','336-822-7652','336-467-3095',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(258,'Kimberlie','Duenas','kimberlie_duenas@yahoo.com','8100 Jacksonville Rd Apt 7','Hays','KS','67601','785-629-8542','785-616-1685',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(259,'Martina','Staback','martina_staback@staback.com','7 W Wabansia Ave Apt 227','Orlando','FL','32822','407-471-6908','407-429-2145',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(260,'Skye','Fillingim','skye_fillingim@yahoo.com','25 Minters Chapel Rd Apt 9','Minneapolis','MN','55401','612-508-2655','612-664-6304',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(261,'Jade','Farrar','jade.farrar@yahoo.com','6882 Torresdale Ave','Columbia','SC','29201','803-352-5387','803-975-3405',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(262,'Charlene','Hamilton','charlene.hamilton@hotmail.com','985 E 6th Ave','Santa Rosa','CA','95407','707-300-1771','707-821-8037',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(263,'Geoffrey','Acey','geoffrey@gmail.com','7 West Ave Apt 1','Palatine','IL','60067','847-222-1734','847-556-2909',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(264,'Stevie','Westerbeck','stevie.westerbeck@yahoo.com','26659 N 13th St','Costa Mesa','CA','92626','949-867-4077','949-903-3898',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(265,'Pamella','Fortino','pamella@fortino.com','669 Packerland Dr Apt 1438','Denver','CO','80212','303-404-2210','303-794-1341',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(266,'Harrison','Haufler','hhaufler@hotmail.com','759 Eldora St','New Haven','CT','6515','203-801-6193','203-801-8497',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(267,'Johnna','Engelberg','jengelberg@engelberg.org','5 S Colorado Blvd Apt 449','Bothell','WA','98021','425-986-7573','425-700-3751',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(268,'Buddy','Cloney','buddy.cloney@yahoo.com','944 Gaither Dr','Strongsville','OH','44136','440-989-5826','440-327-2093',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(269,'Dalene','Riden','dalene.riden@aol.com','66552 Malone Rd','Plaistow','NH','3865','603-315-6839','603-745-7497',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(270,'Jerry','Zurcher','jzurcher@zurcher.org','77 Massillon Rd Apt 822','Satellite Beach','FL','32937','321-518-5938','321-597-2159',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(271,'Haydee','Denooyer','hdenooyer@denooyer.org','25346 New Rd','New York','NY','10016','212-792-8658','212-782-3493',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(272,'Joseph','Cryer','joseph_cryer@cox.net','60 Fillmore Ave','Huntington Beach','CA','92647','714-584-2237','714-698-2170',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(273,'Deonna','Kippley','deonna_kippley@hotmail.com','57 Haven Ave Apt 90','Southfield','MI','48075','248-913-4677','248-793-4966',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(274,'Raymon','Calvaresi','raymon.calvaresi@gmail.com','6538 E Pomona St Apt 60','Indianapolis','IN','46222','317-825-4724','317-342-1532',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(275,'Alecia','Bubash','alecia@aol.com','6535 Joyce St','Wichita Falls','TX','76301','940-276-7922','940-302-3036',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(276,'Ma','Layous','mlayous@hotmail.com','78112 Morris Ave','North Haven','CT','6473','203-721-3388','203-564-1543',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(277,'Detra','Coyier','detra@aol.com','96950 Hidden Ln','Aberdeen','MD','21001','410-739-9277','410-259-2118',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(278,'Terrilyn','Rodeigues','terrilyn.rodeigues@cox.net','3718 S Main St','New Orleans','LA','70130','504-463-4384','504-635-8518',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(279,'Salome','Lacovara','slacovara@gmail.com','9677 Commerce Dr','Richmond','VA','23219','804-550-5097','804-858-1011',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(280,'Garry','Keetch','garry_keetch@hotmail.com','5 Green Pond Rd Apt 4','Southampton','PA','18966','215-979-8776','215-846-9046',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(281,'Matthew','Neither','mneither@yahoo.com','636 Commerce Dr Apt 42','Shakopee','MN','55379','952-651-7597','952-906-4597',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(282,'Theodora','Restrepo','theodora.restrepo@restrepo.com','42744 Hamann Industrial Pky Apt 82','Miami','FL','33136','305-936-8226','305-573-1085',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(283,'Noah','Kalafatis','noah.kalafatis@aol.com','1950 5th Ave','Milwaukee','WI','53209','414-263-5287','414-660-9766',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(284,'Carmen','Sweigard','csweigard@sweigard.com','61304 N French Rd','Somerset','NJ','8873','732-941-2621','732-445-6940',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(285,'Lavonda','Hengel','lavonda@cox.net','87 Imperial Ct Apt 79','Fargo','ND','58102','701-898-2154','701-421-7080',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(286,'Junita','Stoltzman','junita@aol.com','94 W Dodge Rd','Carson City','NV','89701','775-638-9963','775-578-1214',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(287,'Herminia','Nicolozakes','herminia@nicolozakes.org','4 58th St Apt 3519','Scottsdale','AZ','85254','602-954-5141','602-304-6433',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(288,'Casie','Good','casie.good@aol.com','5221 Bear Valley Rd','Nashville','TN','37211','615-390-2251','615-825-4297',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(289,'Reena','Maisto','reena@hotmail.com','9648 S Main','Salisbury','MD','21801','410-351-1863','410-951-2667',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(290,'Mirta','Mallett','mirta_mallett@gmail.com','7 S San Marcos Rd','New York','NY','10004','212-870-1286','212-745-6948',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(291,'Cathrine','Pontoriero','cathrine.pontoriero@pontoriero.com','812 S Haven St','Amarillo','TX','79109','806-703-1435','806-558-5848',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(292,'Filiberto','Tawil','ftawil@hotmail.com','3882 W Congress St Apt 799','Los Angeles','CA','90016','323-765-2528','323-842-8226',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(293,'Raul','Upthegrove','rupthegrove@yahoo.com','4 E Colonial Dr','La Mesa','CA','91942','619-509-5282','619-666-4765',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(294,'Sarah','Candlish','sarah.candlish@gmail.com','45 2nd Ave Apt 9759','Atlanta','GA','30328','770-732-1194','770-531-2842',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(295,'Lucy','Treston','lucy@cox.net','57254 Brickell Ave Apt 372','Worcester','MA','1602','508-769-5250','508-502-5634',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(296,'Judy','Aquas','jaquas@aquas.com','8977 Connecticut Ave Nw Apt 3','Niles','MI','49120','269-756-7222','269-431-9464',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(297,'Yvonne','Tjepkema','yvonne.tjepkema@hotmail.com','9 Waydell St','Fairfield','NJ','7004','973-714-1721','973-976-8627',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(298,'Kayleigh','Lace','kayleigh.lace@yahoo.com','43 Huey P Long Ave','Lafayette','LA','70508','337-740-9323','337-751-2326',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(299,'Felix','Hirpara','felix_hirpara@cox.net','7563 Cornwall Rd Apt 4462','Denver','PA','17517','717-491-5643','717-583-1497',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(300,'Tresa','Sweely','tresa_sweely@hotmail.com','22 Bridle Ln','Valley Park','MO','63088','314-359-9566','314-231-3514',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(301,'Kristeen','Turinetti','kristeen@gmail.com','70099 E North Ave','Arlington','TX','76013','817-213-8851','817-947-9480',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(302,'Jenelle','Regusters','jregusters@regusters.com','3211 E Northeast Loop','Tampa','FL','33619','813-932-8715','813-357-7296',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(303,'Renea','Monterrubio','renea@hotmail.com','26 Montgomery St','Atlanta','GA','30328','770-679-4752','770-930-9967',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(304,'Olive','Matuszak','olive@aol.com','13252 Lighthouse Ave','Cathedral City','CA','92234','760-938-6069','760-745-2649',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(305,'Ligia','Reiber','lreiber@cox.net','206 Main St Apt 2804','Lansing','MI','48933','517-906-1108','517-747-7664',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(306,'Christiane','Eschberger','christiane.eschberger@yahoo.com','96541 W Central Blvd','Phoenix','AZ','85034','602-390-4944','602-330-6894',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(307,'Goldie','Schirpke','goldie.schirpke@yahoo.com','34 Saint George Ave Apt 2','Bangor','ME','4401','207-295-7569','207-748-3722',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(308,'Loreta','Timenez','loreta.timenez@hotmail.com','47857 Coney Island Ave','Clinton','MD','20735','301-696-6420','301-392-6698',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(309,'Fabiola','Hauenstein','fabiola.hauenstein@hauenstein.org','8573 Lincoln Blvd','York','PA','17404','717-809-3119','717-344-2804',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(310,'Amie','Perigo','amie.perigo@yahoo.com','596 Santa Maria Ave Apt 7913','Mesquite','TX','75150','972-419-7946','972-898-1033',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(311,'Raina','Brachle','raina.brachle@brachle.org','3829 Ventura Blvd','Butte','MT','59701','406-318-1515','406-374-7752',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(312,'Erinn','Canlas','erinn.canlas@canlas.com','13 S Hacienda Dr','Livingston','NJ','7039','973-767-3008','973-563-9502',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(313,'Cherry','Lietz','cherry@lietz.com','40 9th Ave Sw Apt 91','Waterford','MI','48329','248-980-6904','248-697-7722',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(314,'Kattie','Vonasek','kattie@vonasek.org','2845 Boulder Crescent St','Cleveland','OH','44103','216-923-3715','216-270-9653',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(315,'Lilli','Scriven','lilli@aol.com','33 State St','Abilene','TX','79601','325-631-1560','325-667-7868',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(316,'Whitley','Tomasulo','whitley.tomasulo@aol.com','2 S 15th St','Fort Worth','TX','76107','817-526-4408','817-819-7799',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(317,'Barbra','Adkin','badkin@hotmail.com','4 Kohler Memorial Dr','Brooklyn','NY','11230','718-201-3751','718-732-9475',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(318,'Hermila','Thyberg','hermila_thyberg@hotmail.com','1 Rancho Del Mar Shopping C','Providence','RI','2903','401-893-4882','401-885-7681',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(319,'Jesusita','Flister','jesusita.flister@hotmail.com','3943 N Highland Ave','Lancaster','PA','17601','717-885-9118','717-686-7564',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(320,'Caitlin','Julia','caitlin.julia@julia.org','5 Williams St','Johnston','RI','2919','401-948-4982','401-552-9059',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(321,'Roosevelt','Hoffis','roosevelt.hoffis@aol.com','60 Old Dover Rd','Hialeah','FL','33014','305-622-4739','305-302-1135',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(322,'Helaine','Halter','hhalter@yahoo.com','8 Sheridan Rd','Jersey City','NJ','7304','201-832-4168','201-412-3040',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(323,'Lorean','Martabano','lorean.martabano@hotmail.com','85092 Southern Blvd','San Antonio','TX','78204','210-856-4979','210-634-2447',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(324,'France','Buzick','france.buzick@yahoo.com','64 Newman Springs Rd E','Brooklyn','NY','11219','718-478-8504','718-853-3740',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(325,'Justine','Ferrario','jferrario@hotmail.com','48 Stratford Ave','Pomona','CA','91768','909-993-3242','909-631-5703',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(326,'Adelina','Nabours','adelina_nabours@gmail.com','80 Pittsford Victor Rd Apt 9','Cleveland','OH','44103','216-230-4892','216-937-5320',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(327,'Derick','Dhamer','ddhamer@cox.net','87163 N Main Ave','New York','NY','10013','212-304-4515','212-225-9676',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(328,'Jerry','Dallen','jerry.dallen@yahoo.com','393 Lafayette Ave','Richmond','VA','23219','804-762-9576','804-808-9574',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(329,'Leota','Ragel','leota.ragel@gmail.com','99 5th Ave Apt 33','Trion','GA','30753','706-221-4243','706-616-5131',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(330,'Jutta','Amyot','jamyot@hotmail.com','49 N Mays St','Broussard','LA','70518','337-515-1438','337-991-8070',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(331,'Aja','Gehrett','aja_gehrett@hotmail.com','993 Washington Ave','Nutley','NJ','7110','973-544-2677','973-986-4456',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(332,'Kirk','Herritt','kirk.herritt@aol.com','88 15th Ave Ne','Vestal','NY','13850','607-407-3716','607-350-7690',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(333,'Leonora','Mauson','leonora@yahoo.com','3381 E 40th Ave','Passaic','NJ','7055','973-412-2995','973-355-2120',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(334,'Winfred','Brucato','winfred_brucato@hotmail.com','201 Ridgewood Rd','Moscow','ID','83843','208-252-4552','208-793-4108',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(335,'Tarra','Nachor','tarra.nachor@cox.net','39 Moccasin Dr','San Francisco','CA','94104','415-411-1775','415-284-2730',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(336,'Corinne','Loder','corinne@loder.org','4 Carroll St','North Attleboro','MA','2760','508-942-4186','508-618-7826',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(337,'Dulce','Labreche','dulce_labreche@yahoo.com','9581 E Arapahoe Rd','Rochester','MI','48307','248-357-8718','248-811-5696',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(338,'Kate','Keneipp','kate_keneipp@yahoo.com','33 N Michigan Ave','Green Bay','WI','54301','920-353-6377','920-355-1610',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(339,'Kaitlyn','Ogg','kaitlyn.ogg@gmail.com','2 S Biscayne Blvd','Baltimore','MD','21230','410-665-4903','410-773-3862',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(340,'Sherita','Saras','sherita.saras@cox.net','8 Us Highway 22','Colorado Springs','CO','80937','719-669-1664','719-547-9543',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(341,'Lashawnda','Stuer','lstuer@cox.net','7422 Martin Ave Apt 8','Toledo','OH','43607','419-588-8719','419-399-1744',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(342,'Ernest','Syrop','ernest@cox.net','94 Chase Rd','Hyattsville','MD','20785','301-998-9644','301-257-4883',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(343,'Nobuko','Halsey','nobuko.halsey@yahoo.com','8139 I Hwy 10 Apt 92','New Bedford','MA','2745','508-855-9887','508-897-7916',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(344,'Lavonna','Wolny','lavonna.wolny@hotmail.com','5 Cabot Rd','Mc Lean','VA','22102','703-483-1970','703-892-2914',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(345,'Lashaunda','Lizama','llizama@cox.net','3387 Ryan Dr','Hanover','MD','21076','410-678-2473','410-912-6032',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(346,'Mariann','Bilden','mariann.bilden@aol.com','3125 Packer Ave Apt 9851','Austin','TX','78753','512-223-4791','512-742-1149',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(347,'Helene','Rodenberger','helene@aol.com','347 Chestnut St','Peoria','AZ','85381','623-461-8551','623-426-4907',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(348,'Roselle','Estell','roselle.estell@hotmail.com','8116 Mount Vernon Ave','Bucyrus','OH','44820','419-571-5920','419-488-6648',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(349,'Samira','Heintzman','sheintzman@hotmail.com','8772 Old County Rd Apt 5410','Kent','WA','98032','206-311-4137','206-923-6042',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(350,'Margart','Meisel','margart_meisel@yahoo.com','868 State St Apt 38','Cincinnati','OH','45251','513-617-2362','513-747-9603',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(351,'Kristofer','Bennick','kristofer.bennick@yahoo.com','772 W River Dr','Bloomington','IN','47404','812-368-1511','812-442-8544',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(352,'Weldon','Acuff','wacuff@gmail.com','73 W Barstow Ave','Arlington Heights','IL','60004','847-353-2156','847-613-5866',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(353,'Shalon','Shadrick','shalon@cox.net','61047 Mayfield Ave','Brooklyn','NY','11223','718-232-2337','718-394-4974',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(354,'Denise','Patak','denise@patak.org','2139 Santa Rosa Ave','Orlando','FL','32801','407-446-4358','407-808-3254',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(355,'Louvenia','Beech','louvenia.beech@beech.com','598 43rd St','Beverly Hills','CA','90210','310-820-2117','310-652-2379',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(356,'Audry','Yaw','audry.yaw@yaw.org','70295 Pioneer Ct','Brandon','FL','33511','813-797-4816','813-744-7100',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(357,'Kristel','Ehmann','kristel.ehmann@aol.com','92899 Kalakaua Ave','El Paso','TX','79925','915-452-1290','915-300-6100',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(358,'Vincenza','Zepp','vzepp@gmail.com','395 S 6th St Apt 2','El Cajon','CA','92020','619-603-5125','619-935-6661',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(359,'Elouise','Gwalthney','egwalthney@yahoo.com','9506 Edgemore Ave','Bladensburg','MD','20710','301-841-5012','301-591-3034',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(360,'Venita','Maillard','venita_maillard@gmail.com','72119 S Walker Ave Apt 63','Anaheim','CA','92801','714-523-6653','714-663-9740',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(361,'Kasandra','Semidey','kasandra_semidey@semidey.com','369 Latham St Apt 500','Saint Louis','MO','63102','314-732-9131','314-697-3652',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(362,'Xochitl','Discipio','xdiscipio@gmail.com','3158 Runamuck Pl','Round Rock','TX','78664','512-233-1831','512-942-3411',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(363,'Maile','Linahan','mlinahan@yahoo.com','9 Plainsboro Rd Apt 598','Greensboro','NC','27409','336-670-2640','336-364-6037',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(364,'Krissy','Rauser','krauser@cox.net','8728 S Broad St','Coram','NY','11727','631-443-4710','631-288-2866',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(365,'Pete','Dubaldi','pdubaldi@hotmail.com','2215 Prosperity Dr','Lyndhurst','NJ','7071','201-825-2514','201-749-8866',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(366,'Linn','Paa','linn_paa@paa.com','1 S Pine St','Memphis','TN','38112','901-412-4381','901-573-9024',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(367,'Paris','Wide','paris@hotmail.com','187 Market St','Atlanta','GA','30342','404-505-4445','404-607-8435',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(368,'Wynell','Dorshorst','wynell_dorshorst@dorshorst.org','94290 S Buchanan St','Pacifica','CA','94044','650-473-1262','650-749-9879',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(369,'Quentin','Birkner','qbirkner@aol.com','7061 N 2nd St','Burnsville','MN','55337','952-702-7993','952-314-5871',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(370,'Regenia','Kannady','regenia.kannady@cox.net','10759 Main St','Scottsdale','AZ','85260','480-726-1280','480-205-5121',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(371,'Sheron','Louissant','sheron@aol.com','97 E 3rd St Apt 9','Long Island City','NY','11101','718-976-8610','718-613-9994',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(372,'Izetta','Funnell','izetta.funnell@hotmail.com','82 Winsor St Apt 54','Atlanta','GA','30340','770-844-3447','770-584-4119',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(373,'Rodolfo','Butzen','rodolfo@hotmail.com','41 Steel Ct','Northfield','MN','55057','507-210-3510','507-590-5237',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(374,'Zona','Colla','zona@hotmail.com','49440 Dearborn St','Norwalk','CT','6854','203-461-1949','203-938-2557',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(375,'Serina','Zagen','szagen@aol.com','7 S Beverly Dr','Fort Wayne','IN','46802','260-273-3725','260-382-4869',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(376,'Paz','Sahagun','paz_sahagun@cox.net','919 Wall Blvd','Meridian','MS','39307','601-927-8287','601-249-4511',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(377,'Markus','Lukasik','markus@yahoo.com','89 20th St E Apt 779','Sterling Heights','MI','48310','586-970-7380','586-247-1614',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(378,'Jaclyn','Bachman','jaclyn@aol.com','721 Interstate 45 S','Colorado Springs','CO','80919','719-853-3600','719-223-2074',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(379,'Cyril','Daufeldt','cyril_daufeldt@daufeldt.com','3 Lawton St','New York','NY','10013','212-745-8484','212-422-5427',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(380,'Gayla','Schnitzler','gschnitzler@gmail.com','38 Pleasant Hill Rd','Hayward','CA','94545','510-686-3407','510-441-4055',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(381,'Erick','Nievas','erick_nievas@aol.com','45 E Acacia Ct','Chicago','IL','60624','773-704-9903','773-359-6109',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(382,'Jennie','Drymon','jennie@cox.net','63728 Poway Rd Apt 1','Scranton','PA','18509','570-218-4831','570-868-8688',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(383,'Mitsue','Scipione','mscipione@scipione.com','77 222 Dr','Oroville','CA','95965','530-986-9272','530-399-3254',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(384,'Ciara','Ventura','cventura@yahoo.com','53 W Carey St','Port Jervis','NY','12771','845-823-8877','845-694-7919',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(385,'Galen','Cantres','galen@yahoo.com','617 Nw 36th Ave','Brook Park','OH','44142','216-600-6111','216-871-6876',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(386,'Truman','Feichtner','tfeichtner@yahoo.com','539 Coldwater Canyon Ave','Bloomfield','NJ','7003','973-852-2736','973-473-5108',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(387,'Gail','Kitty','gail@kitty.com','735 Crawford Dr','Anchorage','AK','99501','907-435-9166','907-770-3542',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(388,'Dalene','Schoeneck','dalene@schoeneck.org','910 Rahway Ave','Philadelphia','PA','19102','215-268-1275','215-380-8820',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(389,'Gertude','Witten','gertude.witten@gmail.com','7 Tarrytown Rd','Cincinnati','OH','45217','513-977-7043','513-863-9471',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(390,'Lizbeth','Kohl','lizbeth@yahoo.com','35433 Blake St Apt 588','Gardena','CA','90248','310-699-1222','310-955-5788',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(391,'Glenn','Berray','gberray@gmail.com','29 Cherry St Apt 7073','Des Moines','IA','50315','515-370-7348','515-372-1738',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(392,'Lashandra','Klang','lashandra@yahoo.com','810 N La Brea Ave','King of Prussia','PA','19406','610-809-1818','610-378-7332',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(393,'Lenna','Newville','lnewville@newville.com','987 Main St','Raleigh','NC','27601','919-623-2524','919-254-5987',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(394,'Laurel','Pagliuca','laurel@yahoo.com','36 Enterprise St Se','Richland','WA','99352','509-695-5199','509-595-6485',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(395,'Mireya','Frerking','mireya.frerking@hotmail.com','8429 Miller Rd','Pelham','NY','10803','914-868-5965','914-883-3061',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(396,'Annelle','Tagala','annelle@yahoo.com','5 W 7th St','Parkville','MD','21234','410-757-1035','410-234-2267',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(397,'Dean','Ketelsen','dean_ketelsen@gmail.com','2 Flynn Rd','Hicksville','NY','11801','516-847-4418','516-732-6649',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(398,'Levi','Munis','levi.munis@gmail.com','2094 Ne 36th Ave','Worcester','MA','1603','508-456-4907','508-658-7802',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(399,'Sylvie','Ryser','sylvie@aol.com','649 Tulane Ave','Tulsa','OK','74105','918-644-9555','918-565-1706',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(400,'Sharee','Maile','sharee_maile@aol.com','2094 Montour Blvd','Muskegon','MI','49442','231-467-9978','231-265-6940',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(401,'Cordelia','Storment','cordelia_storment@aol.com','393 Hammond Dr','Lafayette','LA','70506','337-566-6001','337-255-3427',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(402,'Mollie','Mcdoniel','mollie_mcdoniel@yahoo.com','8590 Lake Lizzie Dr','Bowling Green','OH','43402','419-975-3182','419-417-4674',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(403,'Brett','Mccullan','brett.mccullan@mccullan.com','87895 Concord Rd','La Mesa','CA','91942','619-461-9984','619-727-3892',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(404,'Teddy','Pedrozo','teddy_pedrozo@aol.com','46314 Route 130','Bridgeport','CT','6610','203-892-3863','203-918-3939',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(405,'Tasia','Andreason','tasia_andreason@yahoo.com','4 Cowesett Ave','Kearny','NJ','7032','201-920-9002','201-969-7063',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(406,'Hubert','Walthall','hubert@walthall.org','95 Main Ave Apt 2','Barberton','OH','44203','330-903-1345','330-566-8898',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(407,'Arthur','Farrow','arthur.farrow@yahoo.com','28 S 7th St Apt 2824','Englewood','NJ','7631','201-238-5688','201-772-4377',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(408,'Vilma','Berlanga','vberlanga@berlanga.com','79 S Howell Ave','Grand Rapids','MI','49546','616-737-3085','616-568-4113',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(409,'Billye','Miro','billye_miro@cox.net','36 Lancaster Dr Se','Pearl','MS','39208','601-567-5386','601-637-5479',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(410,'Glenna','Slayton','glenna_slayton@cox.net','2759 Livingston Ave','Memphis','TN','38118','901-640-9178','901-869-4314',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(411,'Mitzie','Hudnall','mitzie_hudnall@yahoo.com','17 Jersey Ave','Englewood','CO','80110','303-402-1940','303-997-7760',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(412,'Bernardine','Rodefer','bernardine_rodefer@yahoo.com','2 W Grand Ave','Memphis','TN','38112','901-901-4726','901-739-5892',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(413,'Staci','Schmaltz','staci_schmaltz@aol.com','18 Coronado Ave Apt 563','Pasadena','CA','91106','626-866-2339','626-293-7678',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(414,'Nichelle','Meteer','nichelle_meteer@meteer.com','72 Beechwood Ter','Chicago','IL','60657','773-225-9985','773-857-2231',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(415,'Janine','Rhoden','jrhoden@yahoo.com','92 Broadway','Astoria','NY','11103','718-228-5894','718-728-5051',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(416,'Ettie','Hoopengardner','ettie.hoopengardner@hotmail.com','39 Franklin Ave','Richland','WA','99352','509-755-5393','509-847-3352',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(417,'Eden','Jayson','eden_jayson@yahoo.com','4 Iwaena St','Baltimore','MD','21202','410-890-7866','410-429-4888',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(418,'Lynelle','Auber','lynelle_auber@gmail.com','32820 Corkwood Rd','Newark','NJ','7104','973-860-8610','973-605-6492',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(419,'Merissa','Tomblin','merissa.tomblin@gmail.com','34 Raritan Center Pky','Bellflower','CA','90706','562-579-6900','562-719-7922',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(420,'Golda','Kaniecki','golda_kaniecki@yahoo.com','6201 S Nevada Ave','Toms River','NJ','8755','732-628-9909','732-617-5310',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(421,'Catarina','Gleich','catarina_gleich@hotmail.com','78 Maryland Dr Apt 146','Denville','NJ','7834','973-210-3994','973-491-8723',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(422,'Virgie','Kiel','vkiel@hotmail.com','76598 Rd  I 95 Apt 1','Denver','CO','80216','303-776-7548','303-845-5408',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(423,'Jolene','Ostolaza','jolene@yahoo.com','1610 14th St Nw','Newport News','VA','23608','757-682-7116','757-940-1741',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(424,'Keneth','Borgman','keneth@yahoo.com','86350 Roszel Rd','Phoenix','AZ','85012','602-919-4211','602-442-3092',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(425,'Rikki','Nayar','rikki@nayar.com','1644 Clove Rd','Miami','FL','33155','305-968-9487','305-978-2069',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(426,'Elke','Sengbusch','elke_sengbusch@yahoo.com','9 W Central Ave','Phoenix','AZ','85013','602-896-2993','602-575-3457',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(427,'Hoa','Sarao','hoa@sarao.org','27846 Lafayette Ave','Oak Hill','FL','32759','386-526-7800','386-599-7296',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(428,'Trinidad','Mcrae','trinidad_mcrae@yahoo.com','10276 Brooks St','San Francisco','CA','94105','415-331-9634','415-419-1597',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(429,'Mari','Lueckenbach','mari_lueckenbach@yahoo.com','1 Century Park E','San Diego','CA','92110','858-793-9684','858-228-5683',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(430,'Selma','Husser','selma.husser@cox.net','9 State Highway 57 Apt 22','Jersey City','NJ','7306','201-991-8369','201-772-7699',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(431,'Antione','Onofrio','aonofrio@onofrio.com','4 S Washington Ave','San Bernardino','CA','92410','909-430-7765','909-665-3223',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(432,'Luisa','Jurney','ljurney@hotmail.com','25 Se 176th Pl','Cambridge','MA','2138','617-365-2134','617-544-2541',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(433,'Clorinda','Heimann','clorinda.heimann@hotmail.com','105 Richmond Valley Rd','Escondido','CA','92025','760-291-5497','760-261-4786',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(434,'Dick','Wenzinger','dick@yahoo.com','22 Spruce St Apt 595','Gardena','CA','90248','310-510-9713','310-936-2258',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(435,'Ahmed','Angalich','ahmed.angalich@angalich.com','2 W Beverly Blvd','Harrisburg','PA','17110','717-528-8996','717-632-5831',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(436,'Iluminada','Ohms','iluminada.ohms@yahoo.com','72 Southern Blvd','Mesa','AZ','85204','480-293-2882','480-866-6544',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(437,'Joanna','Leinenbach','joanna_leinenbach@hotmail.com','1 Washington St','Lake Worth','FL','33461','561-470-4574','561-951-9734',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(438,'Caprice','Suell','caprice@aol.com','90177 N 55th Ave','Nashville','TN','37211','615-246-1824','615-726-4537',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(439,'Stephane','Myricks','stephane_myricks@cox.net','9 Tower Ave','Burlington','KY','41005','859-717-7638','859-308-4286',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(440,'Quentin','Swayze','quentin_swayze@yahoo.com','278 Bayview Ave','Milan','MI','48160','734-561-6170','734-851-8571',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(441,'Annmarie','Castros','annmarie_castros@gmail.com','80312 W 32nd St','Conroe','TX','77301','936-751-7961','936-937-2334',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(442,'Shonda','Greenbush','shonda_greenbush@cox.net','82 Us Highway 46','Clifton','NJ','7011','973-482-2430','973-644-2974',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(443,'Cecil','Lapage','clapage@lapage.com','4 Stovall St Apt 72','Union City','NJ','7087','201-693-3967','201-856-2720',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(444,'Jeanice','Claucherty','jeanice.claucherty@yahoo.com','19 Amboy Ave','Miami','FL','33142','305-988-4162','305-306-7834',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(445,'Josphine','Villanueva','josphine_villanueva@villanueva.com','63 Smith Ln Apt 8343','Moss','TN','38575','931-553-9774','931-486-6946',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(446,'Daniel','Perruzza','dperruzza@perruzza.com','11360 S Halsted St','Santa Ana','CA','92705','714-771-3880','714-531-1391',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(447,'Cassi','Wildfong','cassi.wildfong@aol.com','26849 Jefferson Hwy','Rolling Meadows','IL','60008','847-633-3216','847-755-9041',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(448,'Britt','Galam','britt@galam.org','2500 Pringle Rd Se Apt 508','Hatfield','PA','19440','215-888-3304','215-351-8523',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(449,'Adell','Lipkin','adell.lipkin@lipkin.com','65 Mountain View Dr','Whippany','NJ','7981','973-654-1561','973-662-8988',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(450,'Jacqueline','Rowling','jacqueline.rowling@yahoo.com','1 N San Saba','Erie','PA','16501','814-865-8113','814-481-1700',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(451,'Lonny','Weglarz','lonny_weglarz@gmail.com','51120 State Route 18','Salt Lake City','UT','84115','801-293-9853','801-892-8781',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(452,'Lonna','Diestel','lonna_diestel@gmail.com','1482 College Ave','Fayetteville','NC','28301','910-922-3672','910-200-7912',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(453,'Cristal','Samara','cristal@cox.net','4119 Metropolitan Dr','Los Angeles','CA','90021','213-975-8026','213-696-8004',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(454,'Kenneth','Grenet','kenneth.grenet@grenet.org','2167 Sierra Rd','East Lansing','MI','48823','517-499-2322','517-867-8077',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(455,'Elli','Mclaird','emclaird@mclaird.com','6 Sunrise Ave','Utica','NY','13501','315-818-2638','315-474-5570',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(456,'Alline','Jeanty','ajeanty@gmail.com','55713 Lake City Hwy','South Bend','IN','46601','574-656-2800','574-405-1983',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(457,'Sharika','Eanes','sharika.eanes@aol.com','75698 N Fiesta Blvd','Orlando','FL','32806','407-312-1691','407-472-1332',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(458,'Nu','Mcnease','nu@gmail.com','88 Sw 28th Ter','Harrison','NJ','7029','973-751-9003','973-903-4175',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(459,'Daniela','Comnick','dcomnick@cox.net','7 Flowers Rd Apt 403','Trenton','NJ','8611','609-200-8577','609-398-2805',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(460,'Cecilia','Colaizzo','cecilia_colaizzo@colaizzo.com','4 Nw 12th St Apt 3849','Madison','WI','53717','608-382-4541','608-302-3387',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(461,'Leslie','Threets','leslie@cox.net','2 A Kelley Dr','Katonah','NY','10536','914-861-9748','914-396-2615',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(462,'Nan','Koppinger','nan@koppinger.com','88827 Frankford Ave','Greensboro','NC','27401','336-370-5333','336-564-1492',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(463,'Izetta','Dewar','idewar@dewar.com','2 W Scyene Rd Apt 3','Baltimore','MD','21217','410-473-1708','410-522-7621',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(464,'Tegan','Arceo','tegan.arceo@arceo.org','62260 Park Stre','Monroe Township','NJ','8831','732-730-2692','732-705-6719',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(465,'Ruthann','Keener','ruthann@hotmail.com','3424 29th St Se','Kerrville','TX','78028','830-258-2769','830-919-5991',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(466,'Joni','Breland','joni_breland@cox.net','35 E Main St Apt 43','Elk Grove Village','IL','60007','847-519-5906','847-740-5304',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(467,'Vi','Rentfro','vrentfro@cox.net','7163 W Clark Rd','Freehold','NJ','7728','732-605-4781','732-724-7251',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(468,'Colette','Kardas','colette.kardas@yahoo.com','21575 S Apple Creek Rd','Omaha','NE','68124','402-896-5943','402-707-1602',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(469,'Malcolm','Tromblay','malcolm_tromblay@cox.net','747 Leonis Blvd','Annandale','VA','22003','703-221-5602','703-874-4248',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(470,'Ryan','Harnos','ryan@cox.net','13 Gunnison St','Plano','TX','75075','972-558-1665','972-961-4968',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(471,'Jess','Chaffins','jess.chaffins@chaffins.org','18 3rd Ave','New York','NY','10016','212-510-4633','212-428-9538',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(472,'Sharen','Bourbon','sbourbon@yahoo.com','62 W Austin St','Syosset','NY','11791','516-816-1541','516-749-3188',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(473,'Nickolas','Juvera','nickolas_juvera@cox.net','177 S Rider Trl Apt 52','Crystal River','FL','34429','352-598-8301','352-947-6152',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(474,'Gary','Nunlee','gary_nunlee@nunlee.org','2 W Mount Royal Ave','Fortville','IN','46040','317-542-6023','317-887-8486',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(475,'Diane','Devreese','diane@cox.net','1953 Telegraph Rd','Saint Joseph','MO','64504','816-557-9673','816-329-5565',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(476,'Roslyn','Chavous','roslyn.chavous@chavous.org','63517 Dupont St','Jackson','MS','39211','601-234-9632','601-973-5754',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(477,'Glory','Schieler','glory@yahoo.com','5 E Truman Rd','Abilene','TX','79602','325-869-2649','325-740-3778',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(478,'Rasheeda','Sayaphon','rasheeda@aol.com','251 Park Ave Apt 979','Saratoga','CA','95070','408-805-4309','408-997-7490',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(479,'Alpha','Palaia','alpha@yahoo.com','43496 Commercial Dr Apt 29','Cherry Hill','NJ','8003','856-312-2629','856-513-7024',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(480,'Refugia','Jacobos','refugia.jacobos@jacobos.com','2184 Worth St','Hayward','CA','94545','510-974-8671','510-509-3496',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(481,'Shawnda','Yori','shawnda.yori@yahoo.com','50126 N Plankinton Ave','Longwood','FL','32750','407-538-5106','407-564-8113',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(482,'Mona','Delasancha','mdelasancha@hotmail.com','38773 Gravois Ave','Cheyenne','WY','82001','307-403-1488','307-816-7115',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(483,'Gilma','Liukko','gilma_liukko@gmail.com','16452 Greenwich St','Garden City','NY','11530','516-393-9967','516-407-9573',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(484,'Janey','Gabisi','jgabisi@hotmail.com','40 Cambridge Ave','Madison','WI','53715','608-967-7194','608-586-6912',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(485,'Lili','Paskin','lili.paskin@cox.net','20113 4th Ave E','Kearny','NJ','7032','201-431-2989','201-478-8540',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(486,'Loren','Asar','loren.asar@aol.com','6 Ridgewood Center Dr','Old Forge','PA','18518','570-648-3035','570-569-2356',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(487,'Dorothy','Chesterfield','dorothy@cox.net','469 Outwater Ln','San Diego','CA','92126','858-617-7834','858-732-1884',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(488,'Gail','Similton','gail_similton@similton.com','62 Monroe St','Thousand Palms','CA','92276','760-616-5388','760-493-9208',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(489,'Catalina','Tillotson','catalina@hotmail.com','3338 A Lockport Pl Apt 6','Margate City','NJ','8402','609-373-3332','609-826-4990',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(490,'Lawrence','Lorens','lawrence.lorens@hotmail.com','9 Hwy','Providence','RI','2906','401-465-6432','401-893-1820',NULL,NULL,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1);

/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table discount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `discount`;

CREATE TABLE `discount` (
  `discount_type` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `amount` decimal(5,2) DEFAULT NULL,
  `create_admin` int(4) NOT NULL DEFAULT '0',
  `update_admin` int(4) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`discount_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table example
# ------------------------------------------------------------

DROP TABLE IF EXISTS `example`;

CREATE TABLE `example` (
  `example_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `example_parent` int(11) NOT NULL DEFAULT '0',
  `example_name` varchar(220) DEFAULT NULL,
  PRIMARY KEY (`example_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

LOCK TABLES `example` WRITE;
/*!40000 ALTER TABLE `example` DISABLE KEYS */;

INSERT INTO `example` (`example_id`, `example_parent`, `example_name`)
VALUES
	(1,0,'Bookmarks Menu'),
	(2,0,'Web Dev'),
	(3,0,'School'),
	(4,0,'Work'),
	(8,0,'Music'),
	(9,0,'News'),
	(10,2,'CSS'),
	(11,2,'PHP'),
	(12,2,'HTML'),
	(13,2,'jQuery'),
	(14,2,'Graphics'),
	(15,8,'Production Tools'),
	(16,8,'Samples'),
	(17,8,'Forums'),
	(18,8,'Labels'),
	(19,2,'Tools'),
	(20,2,'Tips'),
	(21,2,'User Interface'),
	(22,2,'Resources'),
	(23,0,'Shopping'),
	(24,0,'Travel'),
	(25,2,'SEO'),
	(26,24,'Properties'),
	(27,2,'Databases'),
	(28,2,'MySQL');

/*!40000 ALTER TABLE `example` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `upc_code` bigint(12) NOT NULL,
  `category` varchar(35) DEFAULT NULL,
  `size` varchar(35) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `vendor_id` int(4) NOT NULL,
  `quantity` int(3) DEFAULT '0',
  `status_code` int(4) DEFAULT '400',
  `wholesale_cost` decimal(5,2) NOT NULL DEFAULT '0.00',
  `retail_price` decimal(5,2) NOT NULL DEFAULT '0.00',
  `brand` varchar(35) NOT NULL,
  `create_admin` int(4) NOT NULL DEFAULT '0',
  `update_admin` int(4) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`product_id`),
  KEY `vendor_id` (`vendor_id`),
  KEY `status_code` (`status_code`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status` (`status_code`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;

INSERT INTO `product` (`product_id`, `name`, `upc_code`, `category`, `size`, `notes`, `vendor_id`, `quantity`, `status_code`, `wholesale_cost`, `retail_price`, `brand`, `create_admin`, `update_admin`, `create_ts`, `update_ts`, `is_active`)
VALUES
	(1,'Kerasilk Rich Shampoo',127296424470,'Shampoo','8 oz',NULL,1000,0,400,9.29,20.90,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(2,'Kerasilk Rich Conditioner',477832639590,'Conditioner','8 oz',NULL,1000,0,400,9.79,22.03,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(3,'Kerasilk Ultra Rich Shampoo ',907511877828,'Shampoo','8 oz',NULL,1000,0,400,9.29,20.90,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(4,'Kerasilk Ultra Rich Conditoner',926829489880,'Conditioner','8 oz',NULL,1000,0,400,9.79,22.03,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(5,'Sleek Perfection',261823414825,'Styling Aid','3 oz',NULL,1000,0,400,11.00,24.75,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(6,'Hot Form',872077478562,'Styling Aid','5 oz',NULL,1000,0,400,8.50,19.12,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(7,'Flat Marvel',362034930382,'Styling Aid','3 oz',NULL,1000,0,400,8.50,19.12,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(8,'Roughman',164097469300,'Styling Aid','3 oz',NULL,1000,0,400,8.50,19.12,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(9,'Unlimitor',718338844367,'Styling Aid','4 oz',NULL,1000,0,400,10.79,24.28,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(10,'Mellogoo',798387357034,'Styling Aid','3 oz',NULL,1000,0,400,10.29,23.15,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(11,'Sprayer Hair Sprayer',791675744579,'Hairspray','8 oz',NULL,1000,0,400,10.79,24.28,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(12,'Lagoom Jam',157784925308,'Styling Aid','5 oz',NULL,1000,0,400,8.50,19.12,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(13,'Top Whip',420869839378,'Styling Aid','10 oz',NULL,1000,0,400,10.29,23.15,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(14,'Double Boost',189854776952,'Styling Aid','6 oz',NULL,1000,0,400,9.50,21.37,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(15,'Big Finish',754464211874,'Styling Aid','9 oz',NULL,1000,0,400,10.79,24.28,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(16,'Magic Finish',292849183082,'Styling Aid','9 oz',NULL,1000,0,400,9.00,20.25,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(17,'Diamond Gloss',710326091387,'Styling Aid','4 oz',NULL,1000,0,400,9.00,20.25,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(18,'Full Rebel',306597988121,'Styling Aid','3 oz',NULL,1000,0,400,13.99,31.48,'Goldwell',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(19,'Volumizing Shampoo',204979118425,'Shampoo','1 liter',NULL,2000,0,400,27.00,60.75,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(20,'Volumizing Shampoo',457030021585,'Shampoo','10 oz',NULL,2000,0,400,12.50,28.12,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(21,'Volumizing Conditioner',10099049657,'Conditioner','1 liter',NULL,2000,0,400,29.00,65.25,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(22,'Volumizing Conditioner',441243567038,'Conditioner','10 oz',NULL,2000,0,400,13.50,30.37,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(23,'Smoothing Shampoo',690547566395,'Shampoo','1 liter',NULL,2000,0,400,27.00,60.75,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(24,'Smoothing Shampoo',993223156780,'Shampoo','10 oz',NULL,2000,0,400,12.50,28.12,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(25,'Smoothing Conditioner',942902830430,'Conditioner','1 liter',NULL,2000,0,400,29.00,65.25,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(26,'Smoothing Conditioner',353089076001,'Conditioner','10 oz',NULL,2000,0,400,13.50,30.37,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(27,'Moisturizing Shampoo',371553134639,'Shampoo','1 liter',NULL,2000,0,400,27.00,60.75,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(28,'Moisturizing Shampoo',210768929217,'Shampoo','10 oz',NULL,2000,0,400,13.50,30.37,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(29,'Moisturizing Conditioner',553409304936,'Conditioner','1 liter',NULL,2000,0,400,29.00,65.25,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(30,'Moisturizing Conditioner',817575542722,'Conditioner','10 oz',NULL,2000,0,400,13.50,30.37,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(31,'Weekender Shampoo',515604717657,'Shampoo','1 liter',NULL,2000,0,400,26.50,59.63,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(32,'Weekender Shampoo',590191673488,'Shampoo','8 oz',NULL,2000,0,400,11.00,24.75,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(33,'Blonda Shampoo',758524261881,'Shampoo','8 oz',NULL,2000,0,400,12.50,28.12,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(34,'Blonda Shampoo',161061131861,'Shampoo','2 oz',NULL,2000,0,400,4.50,10.13,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(35,'Blonda Conditioner',287049117964,'Conditioner','8 oz',NULL,2000,0,400,13.50,30.37,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(36,'Blonda Conditioner',242040420882,'Conditioner','2 oz',NULL,2000,0,400,4.50,10.13,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(37,'7 Seconds Dry Shampoo',652496007271,'Shampoo','3 oz',NULL,2000,0,400,13.00,29.25,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(38,'7 Seconds Leave in Conditioner',872613841202,'Conditioner','8 oz',NULL,2000,0,400,13.00,29.25,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(39,'7 Seconds Leave in Conditioner',296996555757,'Conditioner','2 oz',NULL,2000,0,400,4.75,10.13,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(40,'Beach Day',762014904060,'Styling Aid','8 oz',NULL,2000,0,400,12.50,28.12,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(41,'U Luxury Shampoo',102656908799,'Shampoo','8 oz',NULL,2000,0,400,17.50,39.38,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(42,'U Luxury Conditioner',328183905687,'Conditioner','8 oz',NULL,2000,0,400,19.50,43.88,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(43,'U Luxury Intense Mask',300494969357,'Conditioner','6 oz',NULL,2000,0,400,30.00,67.50,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(44,'U Luxury Defrizz',806531845592,'Styling Aid','3 oz',NULL,2000,0,400,15.00,33.75,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(45,'U Luxury U Oil Argan',54792184382,'Oil','3 oz',NULL,2000,0,400,20.00,45.00,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(46,'Expand Root Spray',646429043729,'Hairspray','8 oz',NULL,2000,0,400,13.00,29.25,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(47,'Session Max Spray',694082407281,'Hairspray','10 oz',NULL,2000,0,400,13.50,30.37,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(48,'Tricky Hair Spray',686363468878,'Hairspray','7 oz',NULL,2000,0,400,13.50,30.37,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(49,'Tricky Lite Spray',453033357393,'Hairspray','7 oz',NULL,2000,0,400,13.50,30.37,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(50,'Smooth & Shine',480608658399,'Styling Aid','3 oz',NULL,2000,0,400,12.00,27.00,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(51,'Elevate Mousse',25928811635,'Mousse','6 oz',NULL,2000,0,400,12.50,28.12,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(52,'Max Control Hair Spray',647822650150,'Hairspray','10 oz',NULL,2000,0,400,13.00,29.25,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(53,'Go 365 Hair Spray',566300510429,'Hairspray','10 oz',NULL,2000,0,400,12.00,27.00,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(54,'Expanda Dust',91768338810,'Styling Aid','8 oz',NULL,2000,0,400,12.00,27.00,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(55,'Shina Mist Spray',792594936677,'Hairspray','4 oz',NULL,2000,0,400,11.50,25.87,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(56,'Conundrum Paste',927664443851,'Styling Aid','2 oz',NULL,2000,0,400,12.00,27.00,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(57,'Second Day',748798073735,'Styling Aid','2 oz',NULL,2000,0,400,11.50,25.87,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(58,'Smoothing Gift Bag',86393671576,'Gift Bag','1 bag',NULL,2000,0,400,29.00,58.50,'Unite',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(59,'Moisture Repair Shampoo',227566558867,'Shampoo','8 oz',NULL,3000,0,400,12.00,27.00,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(60,'Moisture Repair Conditioner',919019856491,'Conditioner','8 oz',NULL,3000,0,400,12.50,28.12,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(61,'Hydrating Shampoo',718873382546,'Shampoo','8 oz',NULL,3000,0,400,11.50,25.87,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(62,'Hydrating Conditioner',774564438965,'Conditioner','8 oz',NULL,3000,0,400,12.00,27.00,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(63,'Extra Volume Shampoo',51101812627,'Shampoo','8 oz',NULL,3000,0,400,12.00,27.00,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(64,'Extra Volume Conditioner',637192695867,'Conditioner','8 oz',NULL,3000,0,400,12.50,28.12,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(65,'Smoothing Shampoo',344624893274,'Shampoo','8 oz',NULL,3000,0,400,14.00,31.50,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(66,'Smoothing Conditioner',574246705975,'Conditioner','8 oz',NULL,3000,0,400,14.50,32.63,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(67,'Moroccan Oil',482527089305,'Oil','3 oz',NULL,3000,0,400,22.00,49.50,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(68,'Moroccan Oil',741540414281,'Oil','1 oz',NULL,3000,0,400,8.50,19.12,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(69,'Moroccan Oil Lite',622789966408,'Oil','3 oz',NULL,3000,0,400,22.00,49.50,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(70,'Morroccin Oil Lite',215950558893,'Oil','1 oz',NULL,3000,0,400,8.50,19.12,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(71,'Hyrdrating Styling Cream',514043293428,'Styling Aid','10 oz',NULL,3000,0,400,17.00,38.25,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(72,'Intense Curl Cream',612160380464,'Styling Aid','10 oz',NULL,3000,0,400,17.00,38.25,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(73,'Curl Control Mousse',916390243452,'Mousse','8 oz',NULL,3000,0,400,14.50,32.63,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(74,'Styling Gel Medium',793564316817,'Styling Aid','6 oz',NULL,3000,0,400,10.00,22.50,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(75,'Molding Cream',501372893807,'Styling Aid','3 oz',NULL,3000,0,400,14.00,31.50,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(76,'Curl Defining Cream',286277108360,'Styling Aid','8 oz',NULL,3000,0,400,17.00,38.25,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(77,'Thickening Lotion',538560669404,'Styling Aid','3 oz',NULL,3000,0,400,14.50,32.63,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(78,'Root Boost',305236345622,'Styling Aid','8 oz',NULL,3000,0,400,14.50,32.63,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(79,'Volumizing Mousse',633809675928,'Mousse','8 oz',NULL,3000,0,400,14.95,33.64,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(80,'Luminous Hairspray Medium',463329283055,'Hairspray','10 oz',NULL,3000,0,400,12.00,27.00,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(81,'Luminous Hairspray Strong',253224969841,'Hairspray','10 oz',NULL,3000,0,400,12.00,27.00,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(82,'Luminous Hairspray Extra Strong',691610307899,'Hairspray','10 oz',NULL,3000,0,400,12.00,27.00,'Moroccan',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(83,'West Coast Cool',792311872356,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(84,'Do You Harajuku',122651080135,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(85,'Lip Service',885340578389,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(86,'Ella of a Girl',951463086531,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(87,'Prettier n Pink',587830201723,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(88,'A Touch of Sass',162463628687,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(89,'Take The Lead',828179013916,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(90,'Bright Side',969875187614,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(91,'Tan My Hide',216546361800,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(92,'Beach Babe',812322194688,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(93,'My Carriage Awaits',916838380043,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(94,'Manga-round With Me',271006564609,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(95,'Adorned In Diamonds',259810926392,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(96,'Texas Me Later',664569854736,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(97,'Need for Speed Top Coat',383991532493,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(98,'Stick With It Base Coat',925451063086,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(99,'Gifted In Platinum',316258818842,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(100,'Ruby Two Shoes',423048571683,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(101,'Im So Hot',104333837516,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(102,'A Little Naughty',932765070815,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(103,'All Wrapped Up',692907291465,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(104,'Tinsel My Fancy',662686451338,'Nail Polish','1 bottle',NULL,3000,0,400,4.50,10.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(105,'Morgan Taylor Mini Polish Gift Set',316880547441,'Gift Bag','1 set',NULL,3000,0,400,22.00,32.13,'Morgan Taylor Polish',0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1);

/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table promotion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `promotion`;

CREATE TABLE `promotion` (
  `promotion_id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `discount_type` int(4) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT NULL,
  `limit` int(4) DEFAULT NULL,
  `requires_code` tinyint(1) DEFAULT NULL,
  `valid_codes` varchar(255) DEFAULT NULL,
  `valid_services` varchar(255) DEFAULT NULL,
  `create_admin` int(4) NOT NULL DEFAULT '0',
  `update_admin` int(4) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`promotion_id`),
  KEY `discount_type` (`discount_type`),
  CONSTRAINT `promotion_ibfk_1` FOREIGN KEY (`discount_type`) REFERENCES `discount` (`discount_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `resource`;

CREATE TABLE `resource` (
  `resource_id` int(4) NOT NULL,
  `name` varchar(35) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `type` varchar(35) NOT NULL,
  `schedule_id` int(4) DEFAULT NULL,
  `status_code` int(4) DEFAULT NULL,
  `create_admin` int(4) NOT NULL DEFAULT '0',
  `update_admin` int(4) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`resource_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `status_code` (`status_code`),
  CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`),
  CONSTRAINT `resource_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;

INSERT INTO `resource` (`resource_id`, `name`, `description`, `notes`, `type`, `schedule_id`, `status_code`, `create_admin`, `update_admin`, `create_ts`, `update_ts`, `is_active`)
VALUES
	(1000,'Sink 1',NULL,NULL,'Sink',NULL,NULL,0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(1010,'Sink 2',NULL,NULL,'Sink',NULL,NULL,0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(1020,'Sink 3',NULL,NULL,'Sink',NULL,NULL,0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(1030,'Sink 4',NULL,NULL,'Sink',NULL,NULL,0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(1040,'Sink 5',NULL,NULL,'Sink',NULL,NULL,0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(2000,'Drying Chair 1',NULL,NULL,'Hooded Dryer',NULL,NULL,0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(2010,'Drying Chair 2',NULL,NULL,'Hooded Dryer',NULL,NULL,0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(2020,'Drying Chair 3',NULL,NULL,'Hooded Dryer',NULL,NULL,0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1),
	(2030,'Drying Chair 4',NULL,NULL,'Hooded Dryer',NULL,NULL,0,NULL,'2016-09-18 20:15:24','2016-09-18 20:15:24',1);

/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(4) NOT NULL,
  `name` varchar(35) NOT NULL,
  `create_admin` int(4) NOT NULL DEFAULT '0',
  `update_admin` int(4) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`role_id`, `name`, `create_admin`, `update_admin`, `create_ts`, `update_ts`)
VALUES
	(1000,'Stylist',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23'),
	(2000,'Senior Stylist',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23'),
	(3000,'Master Stylist',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23'),
	(4000,'System',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23');

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table schedule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `schedule_id` int(4) NOT NULL AUTO_INCREMENT,
  `staff_id` int(4) DEFAULT NULL,
  `resource_id` int(4) DEFAULT NULL,
  `service_id` int(4) DEFAULT NULL,
  `monday_start` datetime NOT NULL,
  `tuesday_start` datetime NOT NULL,
  `wedday_start` datetime NOT NULL,
  `thursday_start` datetime NOT NULL,
  `friday_start` datetime NOT NULL,
  `saturday_start` datetime NOT NULL,
  `sunday_start` datetime NOT NULL,
  `monday_end` datetime NOT NULL,
  `tuesday_end` datetime NOT NULL,
  `wedday_end` datetime NOT NULL,
  `thursday_end` datetime NOT NULL,
  `friday_end` datetime NOT NULL,
  `saturday_end` datetime NOT NULL,
  `sunday_end` datetime NOT NULL,
  `create_admin` int(4) NOT NULL DEFAULT '0',
  `update_admin` int(4) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `staff_id` (`staff_id`),
  KEY `resource_id` (`resource_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`),
  CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `service` (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table service
# ------------------------------------------------------------

DROP TABLE IF EXISTS `service`;

CREATE TABLE `service` (
  `service_id` int(4) NOT NULL,
  `name` varchar(35) NOT NULL,
  `category` varchar(35) NOT NULL,
  `service_code` char(4) NOT NULL,
  `addon_id` int(4) DEFAULT NULL,
  `timeblock` int(3) NOT NULL,
  `role_id` int(4) NOT NULL,
  `base_price` decimal(5,2) NOT NULL,
  `schedule_id` int(4) DEFAULT NULL,
  `status_code` int(4) DEFAULT NULL,
  `create_admin` int(4) NOT NULL DEFAULT '0',
  `update_admin` int(4) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;

INSERT INTO `service` (`service_id`, `name`, `category`, `service_code`, `addon_id`, `timeblock`, `role_id`, `base_price`, `schedule_id`, `status_code`, `create_admin`, `update_admin`, `create_ts`, `update_ts`, `is_active`)
VALUES
	(1000,'Mens Haircut','Haircuts','MEHC',NULL,45,1000,39.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(1010,'Womens Haircut','Haircuts','WOHC',NULL,45,1000,39.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(1020,'Childrens Haircut','Haircuts','CHHC',NULL,45,1000,32.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(2000,'Shampoo & Style','Styles','SHST',NULL,30,1000,30.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(2010,'Formal Styles','Styles','FOST',NULL,60,1000,65.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(3000,'Full Color Service','Color Services','COSE',NULL,90,1000,65.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(3010,'Full Highlight Service','Color Services','HISE',NULL,90,1000,65.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(3020,'Partial Color Service','Color Services','PCSE',NULL,90,1000,65.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(3030,'Partial Highlight Service','Color Services','PHSE',NULL,90,1000,65.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(3040,'Corective Color Service','Color Services','CCSE',NULL,60,1000,45.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(4000,'Perm','Chemical Services','PECS',NULL,90,1000,65.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(4010,'Brazillian Blowout','Chemical Services','BBCS',NULL,180,1000,100.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(5000,'Deep Conditioning Treatment','Treatments','DCTR',NULL,45,1000,45.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(5010,'Clarifying Treatment','Treatments','CLTR',NULL,45,1000,35.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(6000,'Manicure','Nail Services','MANS',NULL,60,1000,35.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(6010,'Pedicure','Nail Services','PENS',NULL,60,1000,35.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(6020,'Manicure & Pedicure','Nail Services','MPNS',NULL,120,1000,55.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(6030,'Nail Repair','Nail Services','NRNS',NULL,15,1000,20.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(6040,'Polish Change','Nail Services','PCNS',NULL,15,1000,25.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(6050,'Silk Wrap','Nail Services','SWNS',NULL,90,1000,45.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(6060,'Silk Wrap w/ Tips','Nail Services','STNS',NULL,120,1000,55.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(7000,'Brow Wax','Waxing Services','BRWS',NULL,15,1000,15.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(7010,'Lip Wax','Waxing Services','LIWS',NULL,15,1000,15.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(7020,'Chin Wax','Waxing Services','CIWS',NULL,15,1000,15.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(7030,'Back Wax','Waxing Services','BAWS',NULL,60,1000,45.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(7040,'Chest Wax','Waxing Services','CHWS',NULL,60,1000,45.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(7050,'Full Leg Wax','Waxing Services','FLWS',NULL,60,1000,50.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(7060,'Bikini Wax','Waxing Services','BKWS',NULL,60,1000,55.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(7070,'Brazillian Wax','Waxing Services','BRWS',NULL,60,1000,65.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(7080,'Half Leg Wax','Waxing Services','HLWS',NULL,30,1000,25.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(7090,'Under Arm Wax','Waxing Services','UAWS',NULL,30,1000,25.00,NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1);

/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shift
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shift`;

CREATE TABLE `shift` (
  `shift_id` int(4) NOT NULL AUTO_INCREMENT,
  `start_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `staff_id` int(4) DEFAULT NULL,
  `create_admin` int(4) NOT NULL DEFAULT '0',
  `update_admin` int(4) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`shift_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `shift_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table staff
# ------------------------------------------------------------

DROP TABLE IF EXISTS `staff`;

CREATE TABLE `staff` (
  `staff_id` int(4) NOT NULL,
  `first` varchar(35) NOT NULL,
  `last` varchar(35) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(75) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `postal` char(5) DEFAULT NULL,
  `phone` varchar(12) NOT NULL,
  `alt_phone` varchar(12) DEFAULT NULL,
  `role_id` int(4) NOT NULL,
  `services` varchar(255) DEFAULT NULL,
  `status_code` int(4) DEFAULT NULL,
  `create_admin` int(4) NOT NULL DEFAULT '0',
  `update_admin` int(4) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  `PASSWORD` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `role_id` (`role_id`),
  KEY `status_code` (`status_code`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;

INSERT INTO `staff` (`staff_id`, `first`, `last`, `email`, `address`, `city`, `state`, `postal`, `phone`, `alt_phone`, `role_id`, `services`, `status_code`, `create_admin`, `update_admin`, `create_ts`, `update_ts`, `is_active`, `PASSWORD`)
VALUES
	(0,'Store','System','system@salon.com',NULL,NULL,NULL,NULL,'678-555-5555',NULL,4000,'',NULL,0,NULL,'2016-09-18 22:36:18','2016-09-18 22:36:18',1,'root'),
	(1235,'Patrick','Ludtke','patrickl@gillaspie.com','67 Rv Cent','Boise','ID','83709','208-709-1235','208-206-9848',1000,'',NULL,0,NULL,'2016-09-18 22:36:18','2016-09-18 22:36:18',1,'root'),
	(1454,'Colleen','Johnson','colleenj@kampa.org','2 Sw Nyberg Rd','Elkhart','IN','46514','574-499-1454','574-330-1884',1000,'',NULL,0,NULL,'2016-09-18 22:36:18','2016-09-18 22:36:18',1,'root'),
	(1805,'Rebecca','Reimer','rebeccar@hotmail.com','8284 Hart St','Abilene','KS','67410','785-347-1805','785-253-7049',1000,'',NULL,0,NULL,'2016-09-18 22:36:18','2016-09-18 22:36:18',1,'root'),
	(2182,'Janelle','Kreidler','janellek @cox.net','89992 E 15th St','Alliance','NE','69301','308-726-2182','308-250-6987',1000,'',NULL,0,NULL,'2016-09-18 22:36:18','2016-09-18 22:36:18',1,'root'),
	(3294,'Jenny','Klug','jennyk@gmail.com','1933 Packer Ave Apt 2','Novato','CA','94945','415-423-3294','415-926-6089',1000,'',NULL,0,NULL,'2016-09-18 22:36:18','2016-09-18 22:36:18',1,'root'),
	(3571,'Mel','Moore','melm@ankeny.org','5 Washington St Apt 1','Roseville','CA','95678','916-920-3571','916-459-2433',1000,'',NULL,0,NULL,'2016-09-18 22:36:18','2016-09-18 22:36:18',1,'root'),
	(4118,'Lynn','Snyder','lynns@gmail.com','8 S Haven St','Daytona Beach','FL','32114','386-248-4118','386-208-6976',1000,'',NULL,0,NULL,'2016-09-18 22:36:18','2016-09-18 22:36:18',1,'root'),
	(4842,'Lee','Stafford','lees@aol.com','63 E Aurora Dr','Orlando','FL','32804','407-413-4842','407-557-8857',2000,'',NULL,0,NULL,'2016-09-18 22:36:18','2016-09-18 22:36:18',1,'root'),
	(6498,'Chaz','Dean','chazd@yahoo.com','61556 W 20th Ave','Seattle','WA','98104','206-711-6498','206-395-6284',3000,'',NULL,0,NULL,'2016-09-18 22:36:18','2016-09-18 22:36:18',1,'root'),
	(7516,'Kim Marie','Franckowiak','kim_marief @hixenbaugh.org','9 Front St','Washington','DC','20001','202-646-7516','202-276-6826',1000,'',NULL,0,NULL,'2016-09-18 22:36:18','2016-09-18 22:36:18',1,'root');

/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `status_code` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `class` char(10) DEFAULT NULL,
  `create_admin` int(4) NOT NULL DEFAULT '0',
  `update_admin` int(4) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`status_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8;

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;

INSERT INTO `status` (`status_code`, `name`, `class`, `create_admin`, `update_admin`, `create_ts`, `update_ts`, `is_active`)
VALUES
	(100,'Available','',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',NULL),
	(200,'Unavailable','warning',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',NULL),
	(300,'Ordered','info',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',NULL),
	(400,'In-Stock','',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',NULL),
	(500,'Out-of-Stock','danger',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',NULL),
	(600,'Shipped','success',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',NULL),
	(700,'Scheduled','info',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',NULL),
	(800,'Confirmed','success',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',NULL),
	(900,'Active','',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',NULL),
	(1000,'Completed','disabled',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',NULL);

/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table vendor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vendor`;

CREATE TABLE `vendor` (
  `vendor_id` int(4) NOT NULL,
  `name` varchar(35) NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `create_admin` int(4) NOT NULL DEFAULT '0',
  `update_admin` int(4) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;

INSERT INTO `vendor` (`vendor_id`, `name`, `details`, `notes`, `create_admin`, `update_admin`, `create_ts`, `update_ts`, `is_active`)
VALUES
	(1000,'Premier Beauty Systems',NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(2000,'Beauty Craft',NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(3000,'National Salon Services',NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1);

/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
