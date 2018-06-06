/*
MySQL Database Backup Tools
Data:2018-06-05 12:12:34
*/
SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS `alembic_version`;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of alembic_version
-- ----------------------------
INSERT INTO `alembic_version`(`version_num`)  VALUES ('cf66c13e272b');
-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(100) NOT NULL,
  `_password` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `account` varchar(32) NOT NULL,
  `sex` smallint(6) NOT NULL,
  `state` smallint(6) NOT NULL,
  `_last_time` int(11) NOT NULL,
  `_create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin`(`id`,`admin_name`,`_password`,`img`,`account`,`sex`,`state`,`_last_time`,`_create_time`)  VALUES ('1','yxx','pbkdf2:sha256:50000$2cYoOeQj$4e5b601033cd93cf7775fc634fedd24febc86ae0962acb1a7b5317fadd331928','/static/uploads/image/2018/6/3/1528018920.jpg','666666','1','1','1528082236','1527956548');
INSERT INTO `tb_admin`(`id`,`admin_name`,`_password`,`img`,`account`,`sex`,`state`,`_last_time`,`_create_time`)  VALUES ('3','test','pbkdf2:sha256:50000$II0medr6$fefc252fb793b17a7d6f7dfb9b2361867bf7de76f48044e269ec28b30667d6a1','/static/uploads/image/2018/6/3/1528021622.jpg','123456','1','1','1528082273','1528011755');
INSERT INTO `tb_admin`(`id`,`admin_name`,`_password`,`img`,`account`,`sex`,`state`,`_last_time`,`_create_time`)  VALUES ('4','test','pbkdf2:sha256:50000$II0medr6$fefc252fb793b17a7d6f7dfb9b2361867bf7de76f48044e269ec28b30667d6a1','/static/uploads/image/2018/6/3/1528021622.jpg','123412156','1','1','1528082273','1528011755');
