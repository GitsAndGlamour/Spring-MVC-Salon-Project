CREATE TABLE `addon` (
  `addon_id` varchar(255) NOT NULL,
  `name` varchar(35) NOT NULL,
  `timeblock` int(3) NOT NULL,
  `create_admin` varchar(255) NOT NULL DEFAULT '0',
  `update_admin` varchar(255) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` datetime DEFAULT NULL,
  PRIMARY KEY (`addon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `addon` (`addon_id`, `name`, `timeblock`, `create_admin`, `update_admin`, `create_ts`, `update_ts`)
VALUES
	(1000,'Deep Condition',45,0,NULL,'2016-09-19 15:41:30','2016-09-19 15:41:30'),
	(2000,'Clarifying Treatment',45,0,NULL,'2016-09-19 15:41:30','2016-09-19 15:41:30'),
	(3000,'Haircut',30,0,NULL,'2016-09-19 15:41:30','2016-09-19 15:41:30');
