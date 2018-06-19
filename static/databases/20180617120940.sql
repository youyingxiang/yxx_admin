/*
MySQL Database Backup Tools
Data:2018-06-17 12:09:40
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
INSERT INTO `alembic_version`(`version_num`)  VALUES ('5db0cbe43198');
-- ----------------------------
-- Table structure for tb_link
-- ----------------------------
DROP TABLE IF EXISTS `tb_link`;
CREATE TABLE `tb_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `link` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_link
-- ----------------------------
INSERT INTO `tb_link`(`id`,`name`,`link`,`slug`)  VALUES ('1','中控韩文','http://www.zkteco.com/cn','');
INSERT INTO `tb_link`(`id`,`name`,`link`,`slug`)  VALUES ('2','中控英文','http://www.zkteco.com/en','');
INSERT INTO `tb_link`(`id`,`name`,`link`,`slug`)  VALUES ('3','【Python】Python的单引号字符串和转义引号','','');
INSERT INTO `tb_link`(`id`,`name`,`link`,`slug`)  VALUES ('4','中那个','http://www.zkteco.com/cn','中那个121');
INSERT INTO `tb_link`(`id`,`name`,`link`,`slug`)  VALUES ('5','中控智慧','http://www.zkteco.com/en','');
INSERT INTO `tb_link`(`id`,`name`,`link`,`slug`)  VALUES ('6','英文网站','http://www.zkteco.com/en','');
