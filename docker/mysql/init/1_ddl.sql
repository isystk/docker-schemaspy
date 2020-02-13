CREATE DATABASE IF NOT EXISTS sample DEFAULT CHARACTER SET utf8mb4;

CREATE TABLE `sample`.`t_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `name` varchar(255) NOT NULL COMMENT '名前',
  `description` text NOT NULL COMMENT '説明',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ユーザー';
