CREATE TABLE `discount` (
  `discount_type` varchar(255) NOT NULL,
  `name` varchar(35) NOT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `amount` decimal(5,2) DEFAULT NULL,
  `create_admin` varchar(255) NOT NULL DEFAULT '0',
  `update_admin` varchar(255) DEFAULT NULL,
  `create_ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_ts` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`discount_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
