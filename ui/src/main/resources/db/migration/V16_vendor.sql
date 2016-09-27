CREATE TABLE `vendor` (
  `vendor_id` varchar(255) NOT NULL,
  `name` varchar(35) NOT NULL,
  `details` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `create_admin` varchar(255) NOT NULL DEFAULT '0',
  `update_admin` varchar(255) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `vendor` (`vendor_id`, `name`, `details`, `notes`, `create_admin`, `update_admin`, `create_ts`, `update_ts`, `is_active`)
VALUES
	(1000,'Premier Beauty Systems',NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(2000,'Beauty Craft',NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1),
	(3000,'National Salon Services',NULL,NULL,0,NULL,'2016-09-18 20:15:23','2016-09-18 20:15:23',1);
