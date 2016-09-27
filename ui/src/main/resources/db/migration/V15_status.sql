CREATE TABLE `status` (
  `status_code` varchar(255) NOT NULL,
  `name` varchar(35) NOT NULL,
  `class` char(10) DEFAULT NULL,
  `create_admin` varchar(255) NOT NULL DEFAULT '0',
  `update_admin` varchar(255) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
