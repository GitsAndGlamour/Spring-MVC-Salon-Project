DROP TABLE IF EXISTS `count`;

CREATE TABLE `count` (
  `count_id` int(6) NOT NULL AUTO_INCREMENT,
  `count_date` date DEFAULT NULL,
  `count_ts` datetime DEFAULT NULL,
  `data` mediumtext,
  `is_erroneous` tinyint(1) DEFAULT '0',
  `create_admin` varchar(255) NOT NULL DEFAULT '0',
  `update_admin` varchar(255) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`count_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
