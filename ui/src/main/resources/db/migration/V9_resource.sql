CREATE TABLE `resource` (
  `resource_id` varchar(255) NOT NULL,
  `name` varchar(35) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `type` varchar(35) NOT NULL,
  `schedule_id` varchar(255) DEFAULT NULL,
  `status_code` varchar(255) DEFAULT NULL,
  `create_admin` varchar(255) NOT NULL DEFAULT '0',
  `update_admin` varchar(255) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`resource_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `status_code` (`status_code`),
  CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`),
  CONSTRAINT `resource_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
