DROP TABLE IF EXISTS `change`;

CREATE TABLE `change` (
  `change_id` varchar(255) NOT NULL,
  `name` varchar(35) NOT NULL,
  `table_name` varchar(35) NOT NULL,
  `column_name` varchar(35) NOT NULL,
  `previous_value` varchar(255) NOT NULL,
  `current_value` varchar(255) NOT NULL,
  `change_ts` datetime DEFAULT NULL,
  `is_undone` tinyint(1) DEFAULT '0',
  `create_admin` varchar(255) NOT NULL DEFAULT '0',
  `update_admin` varchar(255) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`change_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
