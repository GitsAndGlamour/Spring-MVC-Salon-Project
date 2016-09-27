CREATE TABLE `role` (
  `role_id` varchar(255) NOT NULL,
  `name` varchar(35) NOT NULL,
  `create_admin` varchar(255) NOT NULL DEFAULT '0',
  `update_admin` varchar(255) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` datetime DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `role` (`role_id`, `name`, `create_admin`, `update_admin`, `create_ts`, `update_ts`)
VALUES
	(1000,'Stylist',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23'),
	(2000,'Senior Stylist',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23'),
	(3000,'Master Stylist',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23'),
	(4000,'System',0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23');
