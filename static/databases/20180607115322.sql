/*
MySQL Database Backup Tools
Data:2018-06-07 11:53:23
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
INSERT INTO `tb_admin`(`id`,`admin_name`,`_password`,`img`,`account`,`sex`,`state`,`_last_time`,`_create_time`)  VALUES ('1','yxx','pbkdf2:sha256:50000$2cYoOeQj$4e5b601033cd93cf7775fc634fedd24febc86ae0962acb1a7b5317fadd331928','/static/uploads/image/2018/6/3/1528018920.jpg','666666','1','1','1528343566','1527956548');
INSERT INTO `tb_admin`(`id`,`admin_name`,`_password`,`img`,`account`,`sex`,`state`,`_last_time`,`_create_time`)  VALUES ('3','test','pbkdf2:sha256:50000$II0medr6$fefc252fb793b17a7d6f7dfb9b2361867bf7de76f48044e269ec28b30667d6a1','/static/uploads/image/2018/6/3/1528021622.jpg','123456','1','1','1528343536','1528011755');
INSERT INTO `tb_admin`(`id`,`admin_name`,`_password`,`img`,`account`,`sex`,`state`,`_last_time`,`_create_time`)  VALUES ('4','test','pbkdf2:sha256:50000$IhVF9laN$2d8911f9ed8783d366f77a12dd495cb87dabe5817547f9996ffa8cacaa32e7f1','/static/uploads/image/2018/6/3/1528021622.jpg','123412156','1','1','1528082273','1528011755');
-- ----------------------------
-- Table structure for tb_config_field
-- ----------------------------
DROP TABLE IF EXISTS `tb_config_field`;
CREATE TABLE `tb_config_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `v` text,
  `k` varchar(50) NOT NULL,
  `desc` text,
  `prompt` varchar(250) NOT NULL,
  `sorts` int(11) NOT NULL,
  `texttype` varchar(100) NOT NULL,
  `textvalue` varchar(100) NOT NULL,
  `_create_time` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `state` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_config_field
-- ----------------------------
INSERT INTO `tb_config_field`(`id`,`v`,`k`,`desc`,`prompt`,`sorts`,`texttype`,`textvalue`,`_create_time`,`type`,`state`)  VALUES ('1','11111111','image_size','上传图片大小','1024：1KB，1048576：1MB，5242880：5MB。建议不要超过1MB，避免图片上传失败','1','text','','1527989310','up','1');
INSERT INTO `tb_config_field`(`id`,`v`,`k`,`desc`,`prompt`,`sorts`,`texttype`,`textvalue`,`_create_time`,`type`,`state`)  VALUES ('2','1111111','file_size','上传文件大小','1024：1KB，1048576：1MB，5242880：5MB。建议不要超过5MB，避免文件上传失败','2','text','','1527989343','up','1');
INSERT INTO `tb_config_field`(`id`,`v`,`k`,`desc`,`prompt`,`sorts`,`texttype`,`textvalue`,`_create_time`,`type`,`state`)  VALUES ('3','jpg,gif,jpeg,png,bmp','image_format','上传图片格式','上传图片格式','3','text','','1527989374','up','1');
INSERT INTO `tb_config_field`(`id`,`v`,`k`,`desc`,`prompt`,`sorts`,`texttype`,`textvalue`,`_create_time`,`type`,`state`)  VALUES ('4','doc,docx,xls,xlsx,ppt,pptx,txt,rar,zip,mp4,pdf','file_format','上传文件格式','上传文件格式','4','text','','1527989398','up','1');
INSERT INTO `tb_config_field`(`id`,`v`,`k`,`desc`,`prompt`,`sorts`,`texttype`,`textvalue`,`_create_time`,`type`,`state`)  VALUES ('5','uploads','upload_path','文件上传目录','文件上传目录','5','text','','1527989462','up','1');
INSERT INTO `tb_config_field`(`id`,`v`,`k`,`desc`,`prompt`,`sorts`,`texttype`,`textvalue`,`_create_time`,`type`,`state`)  VALUES ('6','','image_url','图片上传域名地址','图片上传域名地址，图片路径保存数据库是否带域名，不建议填写，除非很清楚怎么使用','6','text','','1527989503','up','1');
INSERT INTO `tb_config_field`(`id`,`v`,`k`,`desc`,`prompt`,`sorts`,`texttype`,`textvalue`,`_create_time`,`type`,`state`)  VALUES ('7','yxx_admin1','title','网站标题','网站标题【title】','7','text','','1527989551','web','1');
INSERT INTO `tb_config_field`(`id`,`v`,`k`,`desc`,`prompt`,`sorts`,`texttype`,`textvalue`,`_create_time`,`type`,`state`)  VALUES ('8','/static/uploads/image/2018/6/3/1528029860.jpg','logo','网站LOGO(68*34)','网站LOGO，一般用于导航或底部的LOGO图片','99','image','','1527989600','web','1');
INSERT INTO `tb_config_field`(`id`,`v`,`k`,`desc`,`prompt`,`sorts`,`texttype`,`textvalue`,`_create_time`,`type`,`state`)  VALUES ('9','01212312','copyright','网站备案号','网站备案号','99','text','','1527989642','web','1');
INSERT INTO `tb_config_field`(`id`,`v`,`k`,`desc`,`prompt`,`sorts`,`texttype`,`textvalue`,`_create_time`,`type`,`state`)  VALUES ('11','swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb,mp4','media_format','上传视音频格式','上传视音频格式','99','text','','1528031937','up','1');
INSERT INTO `tb_config_field`(`id`,`v`,`k`,`desc`,`prompt`,`sorts`,`texttype`,`textvalue`,`_create_time`,`type`,`state`)  VALUES ('12','swf,flv','flash_format','上传Flash格式','上传Flash格式','99','text','','1528031967','up','1');
INSERT INTO `tb_config_field`(`id`,`v`,`k`,`desc`,`prompt`,`sorts`,`texttype`,`textvalue`,`_create_time`,`type`,`state`)  VALUES ('13','11111111','media_size','上传音频大小','1024：1KB，1048576：1MB，5242880：5MB。建议不要超过5MB，避免音频上传失败','99','text','','1528032165','up','1');
INSERT INTO `tb_config_field`(`id`,`v`,`k`,`desc`,`prompt`,`sorts`,`texttype`,`textvalue`,`_create_time`,`type`,`state`)  VALUES ('14','11111111','flash_size','上传flash大小','1024：1KB，1048576：1MB，5242880：5MB。建议不要超过5MB，避免上传失败','99','text','','1528032209','up','1');
INSERT INTO `tb_config_field`(`id`,`v`,`k`,`desc`,`prompt`,`sorts`,`texttype`,`textvalue`,`_create_time`,`type`,`state`)  VALUES ('17','','test','测试','测试','99','content','','1528173898','web','1');
-- ----------------------------
-- Table structure for tb_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(32) NOT NULL,
  `ip` varchar(64) NOT NULL,
  `log_detail` varchar(128) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `_create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=347 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_log
-- ----------------------------
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('1','add','127.0.0.1','增加操作员失败','1','1527956477');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('2','add','127.0.0.1','增加角色成功','1','1527956507');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('3','add','127.0.0.1','增加角色成功','1','1527956524');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('4','add','127.0.0.1','增加操作员失败','1','1527956544');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('5','add','127.0.0.1','增加操作员成功','1','1527956548');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('6','add','127.0.0.1','增加配置字段成功','1','1527989311');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('7','add','127.0.0.1','增加配置字段成功','1','1527989343');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('8','add','127.0.0.1','增加配置字段成功','1','1527989374');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('9','add','127.0.0.1','增加配置字段成功','1','1527989398');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('10','edit','127.0.0.1','修改配置字段成功','1','1527989400');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('11','edit','127.0.0.1','修改配置字段成功','1','1527989403');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('12','edit','127.0.0.1','修改配置字段成功','1','1527989405');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('13','edit','127.0.0.1','修改配置字段成功','1','1527989409');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('14','edit','127.0.0.1','修改配置字段成功','1','1527989412');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('15','edit','127.0.0.1','修改配置字段成功','1','1527989414');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('16','add','127.0.0.1','增加配置字段成功','1','1527989462');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('17','edit','127.0.0.1','修改配置字段成功','1','1527989468');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('18','add','127.0.0.1','增加配置字段成功','1','1527989503');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('19','add','127.0.0.1','增加配置字段成功','1','1527989551');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('20','edit','127.0.0.1','修改配置字段成功','1','1527989557');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('21','edit','127.0.0.1','修改配置字段成功','1','1527989561');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('22','add','127.0.0.1','增加配置字段成功','1','1527989600');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('23','add','127.0.0.1','增加配置字段成功','1','1527989642');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('24','edit','127.0.0.1','修改操作员失败','1','1527993132');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('25','edit','127.0.0.1','修改配置字段成功','1','1527995065');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('26','edit','127.0.0.1','修改配置字段成功','1','1527995078');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('27','edit','127.0.0.1','修改配置字段成功','1','1527997382');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('28','edit','127.0.0.1','修改配置字段成功','1','1527997830');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('29','edit','127.0.0.1','修改配置字段成功','1','1527997867');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('30','edit','127.0.0.1','修改配置字段成功','1','1527997910');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('31','edit','127.0.0.1','修改配置字段成功','1','1527998208');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('32','edit','127.0.0.1','修改配置字段成功','1','1527999418');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('33','edit','127.0.0.1','修改配置字段成功','1','1527999515');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('34','edit','127.0.0.1','修改配置字段成功','1','1528000190');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('35','edit','127.0.0.1','修改配置字段成功','1','1528000284');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('36','edit','127.0.0.1','修改配置字段成功','1','1528000296');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('37','edit','127.0.0.1','修改配置字段成功','1','1528000547');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('38','add','127.0.0.1','删除日志成功','1','1528006328');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('39','add','127.0.0.1','删除日志成功','1','1528006333');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('40','login','127.0.0.1','登录成功','1','1528009653');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('41','login','127.0.0.1','登录成功','1','1528009911');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('42','login','127.0.0.1','登录成功','1','1528010078');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('43','login','127.0.0.1','登录成功','1','1528010221');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('44','login','127.0.0.1','登录成功','1','1528010477');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('45','login','127.0.0.1','登录成功','1','1528011493');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('46','add','127.0.0.1','增加操作员成功','1','1528011547');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('47','delete','127.0.0.1','删除操作员成功','1','1528011558');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('48','login','127.0.0.1','登录成功','1','1528011716');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('49','add','127.0.0.1','增加操作员成功','1','1528011755');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('50','edit','127.0.0.1','修改角色成功','1','1528011769');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('51','login','127.0.0.1','登录成功','1','1528011803');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('52','login','127.0.0.1','登录成功','1','1528011844');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('53','login','127.0.0.1','登录成功','1','1528011900');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('54','login','127.0.0.1','登录成功','1','1528016059');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('55','login','127.0.0.1','登录成功','1','1528016255');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('56','login','127.0.0.1','登录成功','1','1528016379');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('57','login','127.0.0.1','登录成功','1','1528016448');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('58','login','127.0.0.1','登录成功','1','1528016510');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('59','login','127.0.0.1','登录成功','1','1528017023');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('60','login','127.0.0.1','登录成功','1','1528017719');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('61','login','127.0.0.1','登录成功','1','1528017825');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('62','login','127.0.0.1','登录成功','1','1528018097');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('63','login','127.0.0.1','登录成功','1','1528018127');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('64','add','127.0.0.1','删除日志成功','1','1528018138');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('65','add','127.0.0.1','删除日志成功','1','1528018138');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('66','login','127.0.0.1','登录成功','1','1528018209');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('67','login','127.0.0.1','登录成功','1','1528018265');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('68','edit','127.0.0.1','修改角色失败','1','1528018365');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('69','edit','127.0.0.1','修改角色成功','1','1528018368');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('70','edit','127.0.0.1','修改角色成功','1','1528018376');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('71','login','127.0.0.1','登录成功','1','1528018806');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('72','login','127.0.0.1','登录成功','3','1528019219');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('73','login','127.0.0.1','登录成功','1','1528019243');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('74','login','127.0.0.1','登录成功','1','1528020706');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('75','login','127.0.0.1','登录成功','1','1528020757');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('76','login','127.0.0.1','登录成功','1','1528021100');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('77','edit','127.0.0.1','修改角色成功','1','1528021578');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('78','login','127.0.0.1','登录成功','3','1528021599');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('79','edit','127.0.0.1','修改操作员失败','3','1528021625');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('80','login','127.0.0.1','登录成功','1','1528022115');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('81','edit','127.0.0.1','修改角色成功','1','1528022123');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('82','login','127.0.0.1','登录成功','3','1528022198');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('83','login','127.0.0.1','登录成功','3','1528022358');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('84','login','127.0.0.1','登录成功','1','1528022533');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('85','login','127.0.0.1','登录成功','1','1528022609');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('86','login','127.0.0.1','登录成功','1','1528022884');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('87','login','127.0.0.1','登录成功','1','1528022971');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('88','login','127.0.0.1','登录成功','1','1528023338');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('89','login','127.0.0.1','登录成功','3','1528023365');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('90','login','127.0.0.1','登录成功','1','1528026023');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('91','login','127.0.0.1','登录成功','1','1528026145');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('92','login','127.0.0.1','登录成功','1','1528026302');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('93','login','127.0.0.1','登录成功','1','1528026644');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('94','login','127.0.0.1','登录成功','1','1528026967');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('95','login','127.0.0.1','登录成功','1','1528027218');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('96','delete','127.0.0.1','修改配置字段失败','1','1528027240');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('97','delete','127.0.0.1','修改配置字段失败','1','1528027250');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('98','delete','127.0.0.1','修改配置字段失败','1','1528027275');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('99','delete','127.0.0.1','修改配置字段失败','1','1528027289');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('100','login','127.0.0.1','登录成功','1','1528027357');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('101','delete','127.0.0.1','修改配置字段失败','1','1528027364');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('102','delete','127.0.0.1','修改配置字段失败','1','1528027373');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('103','login','127.0.0.1','登录成功','1','1528027462');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('104','delete','127.0.0.1','修改配置字段失败','1','1528027467');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('105','delete','127.0.0.1','修改配置字段失败','1','1528027473');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('106','delete','127.0.0.1','修改配置字段失败','1','1528027476');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('107','delete','127.0.0.1','修改配置字段失败','1','1528027480');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('108','delete','127.0.0.1','修改配置字段失败','1','1528027483');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('109','login','127.0.0.1','登录成功','1','1528027656');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('110','delete','127.0.0.1','修改配置字段失败','1','1528027663');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('111','login','127.0.0.1','登录成功','1','1528027781');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('112','delete','127.0.0.1','修改配置字段失败','1','1528027797');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('113','delete','127.0.0.1','修改配置字段失败','1','1528027950');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('114','delete','127.0.0.1','修改配置字段失败','1','1528028021');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('115','delete','127.0.0.1','修改配置字段成功','1','1528028051');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('116','delete','127.0.0.1','修改配置字段成功','1','1528028106');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('117','delete','127.0.0.1','修改配置字段成功','1','1528028219');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('118','delete','127.0.0.1','修改配置字段失败','1','1528028248');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('119','delete','127.0.0.1','修改配置字段失败','1','1528028281');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('120','delete','127.0.0.1','修改配置字段失败','1','1528028369');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('121','delete','127.0.0.1','修改配置字段失败','1','1528028381');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('122','delete','127.0.0.1','修改配置字段成功','1','1528028394');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('123','delete','127.0.0.1','修改配置字段失败','1','1528028705');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('124','delete','127.0.0.1','修改配置字段失败','1','1528028730');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('125','delete','127.0.0.1','修改配置字段失败','1','1528028778');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('126','delete','127.0.0.1','修改配置字段失败','1','1528028810');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('127','delete','127.0.0.1','修改配置字段失败','1','1528028847');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('128','delete','127.0.0.1','修改配置字段失败','1','1528028911');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('129','delete','127.0.0.1','修改配置字段成功','1','1528028978');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('130','delete','127.0.0.1','修改配置字段成功','1','1528029076');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('131','delete','127.0.0.1','修改配置字段成功','1','1528029091');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('132','delete','127.0.0.1','修改配置字段成功','1','1528029169');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('133','delete','127.0.0.1','修改配置字段成功','1','1528029190');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('134','delete','127.0.0.1','修改配置字段成功','1','1528029192');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('135','delete','127.0.0.1','修改配置字段成功','1','1528029196');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('136','delete','127.0.0.1','修改配置字段成功','1','1528029200');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('137','delete','127.0.0.1','修改配置字段成功','1','1528029227');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('138','delete','127.0.0.1','修改配置字段成功','1','1528029233');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('139','delete','127.0.0.1','修改配置字段成功','1','1528029237');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('140','delete','127.0.0.1','修改配置字段成功','1','1528029360');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('141','delete','127.0.0.1','修改配置字段成功','1','1528029865');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('142','add','127.0.0.1','增加配置字段成功','1','1528029996');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('143','edit','127.0.0.1','修改配置字段成功','1','1528030037');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('144','edit','127.0.0.1','修改配置字段成功','1','1528030069');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('145','edit','127.0.0.1','修改配置字段成功','1','1528030110');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('146','edit','127.0.0.1','修改配置字段成功','1','1528030123');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('147','edit','127.0.0.1','修改配置字段成功','1','1528030184');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('148','edit','127.0.0.1','修改配置字段成功','1','1528030378');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('149','delete','127.0.0.1','删除配置字段成功','1','1528031904');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('150','add','127.0.0.1','增加配置字段成功','1','1528031937');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('151','add','127.0.0.1','增加配置字段成功','1','1528031967');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('152','add','127.0.0.1','增加配置字段成功','1','1528032165');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('153','add','127.0.0.1','增加配置字段成功','1','1528032209');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('154','add','127.0.0.1','增加配置字段成功','1','1528032241');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('155','delete','127.0.0.1','修改配置字段成功','1','1528032327');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('156','delete','127.0.0.1','修改配置字段成功','1','1528033531');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('157','login','127.0.0.1','登录成功','1','1528034375');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('158','edit','127.0.0.1','修改角色成功','1','1528034393');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('159','login','127.0.0.1','登录成功','3','1528034410');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('160','login','127.0.0.1','登录成功','3','1528034926');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('161','login','127.0.0.1','登录成功','3','1528034991');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('162','login','127.0.0.1','登录成功','3','1528035684');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('163','edit','127.0.0.1','修改角色成功','3','1528035699');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('164','edit','127.0.0.1','修改角色成功','3','1528035713');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('165','login','127.0.0.1','登录成功','3','1528038526');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('166','login','127.0.0.1','登录成功','3','1528038580');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('167','login','127.0.0.1','登录成功','1','1528038658');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('168','login','127.0.0.1','登录成功','1','1528038845');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('169','login','127.0.0.1','登录成功','3','1528038863');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('170','login','127.0.0.1','登录成功','3','1528039213');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('171','edit','127.0.0.1','修改角色成功','3','1528039228');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('172','edit','127.0.0.1','修改角色成功','3','1528039244');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('173','edit','127.0.0.1','修改角色成功','3','1528039270');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('174','edit','127.0.0.1','修改角色成功','3','1528039303');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('175','login','127.0.0.1','登录成功','1','1528040833');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('176','login','127.0.0.1','登录成功','1','1528040878');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('177','delete','127.0.0.1','修改配置字段成功','1','1528040908');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('178','login','127.0.0.1','登录成功','3','1528041003');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('179','edit','127.0.0.1','修改角色成功','3','1528041018');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('180','edit','127.0.0.1','修改角色成功','3','1528041033');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('181','login','127.0.0.1','登录成功','3','1528041221');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('182','login','127.0.0.1','登录成功','3','1528041265');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('183','delete','127.0.0.1','修改配置字段成功','3','1528041286');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('184','delete','127.0.0.1','修改配置字段成功','3','1528041300');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('185','login','127.0.0.1','登录成功','3','1528041405');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('186','edit','127.0.0.1','修改角色成功','3','1528041419');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('187','edit','127.0.0.1','修改配置字段成功','3','1528041424');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('188','delete','127.0.0.1','修改配置字段成功','3','1528041430');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('189','delete','127.0.0.1','修改配置字段成功','3','1528041433');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('190','login','127.0.0.1','登录成功','3','1528042456');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('191','login','127.0.0.1','登录成功','3','1528042653');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('192','delete','127.0.0.1','修改配置字段成功','3','1528042826');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('193','login','127.0.0.1','登录成功','1','1528044105');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('194','login','127.0.0.1','登录成功','1','1528044475');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('195','login','127.0.0.1','登录成功','3','1528044539');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('196','login','127.0.0.1','登录成功','3','1528044787');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('197','login','127.0.0.1','登录成功','3','1528044836');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('198','login','127.0.0.1','登录成功','3','1528045453');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('199','login','127.0.0.1','登录成功','3','1528045563');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('200','delete','127.0.0.1','修改配置字段成功','1','1528081479');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('201','login','127.0.0.1','登录成功','1','1528081524');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('202','login','127.0.0.1','登录成功','3','1528081763');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('203','login','127.0.0.1','登录成功','1','1528081911');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('204','edit','127.0.0.1','修改角色成功','3','1528082023');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('205','edit','127.0.0.1','修改角色成功','3','1528082035');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('206','login','127.0.0.1','登录成功','1','1528082236');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('207','login','127.0.0.1','登录成功','3','1528082273');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('208','add','127.0.0.1','删除日志成功','3','1528082537');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('209','backup','127.0.0.1','备份成功！','1','1528109021');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('210','backup','127.0.0.1','备份成功！','1','1528109076');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('211','backup','127.0.0.1','备份成功！','1','1528109135');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('212','backup','127.0.0.1','备份成功！','1','1528109441');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('213','backup','127.0.0.1','备份成功！','1','1528109456');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('214','backup','127.0.0.1','备份成功！','1','1528109525');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('215','add','127.0.0.1','增加配置字段成功','1','1528109836');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('216','delete','127.0.0.1','删除配置字段成功','1','1528109841');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('217','backup','127.0.0.1','备份成功！','1','1528110244');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('218','backup','127.0.0.1','备份成功！','1','1528110290');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('219','backup','127.0.0.1','备份成功！','1','1528110511');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('220','backup','127.0.0.1','备份成功！','1','1528110574');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('221','backup','127.0.0.1','备份成功！','1','1528110668');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('222','backup','127.0.0.1','备份成功！','1','1528110695');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('223','backup','127.0.0.1','备份成功！','1','1528110723');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('224','backup','127.0.0.1','备份成功！','1','1528110759');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('225','backup','127.0.0.1','备份成功！','1','1528110831');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('226','backup','127.0.0.1','备份成功！','1','1528110864');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('227','backup','127.0.0.1','备份成功！','1','1528110988');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('228','backup','127.0.0.1','备份成功！','1','1528111327');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('229','backup','127.0.0.1','备份成功！','1','1528111388');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('230','backup','127.0.0.1','备份成功！','1','1528111433');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('231','backup','127.0.0.1','备份成功！','1','1528112873');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('232','backup','127.0.0.1','备份成功！','1','1528112876');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('233','backup','127.0.0.1','备份成功！','1','1528112881');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('234','backup','127.0.0.1','备份成功！','1','1528113488');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('235','backup','127.0.0.1','备份成功！','1','1528113491');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('236','download','127.0.0.1','下载备份失败！','1','1528113862');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('237','download','127.0.0.1','下载备份失败！','1','1528113862');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('238','download','127.0.0.1','下载备份失败！','1','1528113902');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('239','download','127.0.0.1','下载备份失败！','1','1528114012');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('240','download','127.0.0.1','下载备份失败！','1','1528114012');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('241','download','127.0.0.1','下载备份失败！','1','1528114018');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('242','download','127.0.0.1','下载备份失败！','1','1528114018');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('243','download','127.0.0.1','下载备份失败！','1','1528114105');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('244','download','127.0.0.1','下载备份失败！','1','1528114105');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('245','download','127.0.0.1','下载备份失败！','1','1528114156');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('246','download','127.0.0.1','下载备份失败！','1','1528114156');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('247','download','127.0.0.1','下载备份失败！','1','1528114198');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('248','download','127.0.0.1','下载备份成功','1','1528114224');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('249','download','127.0.0.1','下载备份失败！','1','1528114257');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('250','download','127.0.0.1','下载备份失败！','1','1528114262');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('251','backup','127.0.0.1','备份成功！','1','1528114329');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('252','backup','127.0.0.1','备份成功！','1','1528114331');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('253','download','127.0.0.1','下载备份成功','1','1528114338');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('254','download','127.0.0.1','下载备份成功','1','1528114338');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('255','download','127.0.0.1','下载备份成功','1','1528114556');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('256','download','127.0.0.1','下载备份成功','1','1528114556');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('257','restore','127.0.0.1','还原备份失败！','1','1528114982');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('258','restore','127.0.0.1','还原备份失败！','1','1528115039');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('259','download','127.0.0.1','下载备份成功','1','1528115046');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('260','download','127.0.0.1','下载备份成功','1','1528115046');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('261','backup','127.0.0.1','备份成功！','1','1528115329');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('262','restore','127.0.0.1','还原备份失败！','1','1528115336');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('263','backup','127.0.0.1','备份成功！','1','1528115438');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('264','restore','127.0.0.1','还原备份失败！','1','1528115448');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('265','restore','127.0.0.1','还原备份失败！','1','1528115574');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('266','download','127.0.0.1','下载备份成功','1','1528115790');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('267','download','127.0.0.1','下载备份成功','1','1528115790');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('268','download','127.0.0.1','下载备份成功','1','1528115858');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('269','download','127.0.0.1','下载备份成功','1','1528115858');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('270','download','127.0.0.1','下载备份成功','1','1528115858');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('271','download','127.0.0.1','下载备份成功','1','1528115863');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('272','download','127.0.0.1','下载备份成功','1','1528115863');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('273','download','127.0.0.1','下载备份成功','1','1528115864');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('274','download','127.0.0.1','下载备份成功','1','1528115869');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('275','download','127.0.0.1','下载备份成功','1','1528115892');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('276','download','127.0.0.1','下载备份成功','1','1528115912');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('277','download','127.0.0.1','下载备份成功','1','1528115912');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('278','download','127.0.0.1','下载备份成功','1','1528115912');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('279','download','127.0.0.1','下载备份成功','1','1528115917');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('280','download','127.0.0.1','下载备份成功','1','1528115940');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('281','download','127.0.0.1','下载备份成功','1','1528115940');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('282','download','127.0.0.1','下载备份成功','1','1528115993');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('283','download','127.0.0.1','下载备份成功','1','1528115993');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('284','restore','127.0.0.1','还原备份失败！','1','1528115995');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('285','restore','127.0.0.1','还原备份失败！','1','1528116294');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('286','download','127.0.0.1','下载备份成功','1','1528116418');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('287','download','127.0.0.1','下载备份成功','1','1528116418');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('288','restore','127.0.0.1','还原备份失败！','1','1528116420');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('289','restore','127.0.0.1','还原备份失败！','1','1528116490');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('290','restore','127.0.0.1','还原备份失败！','1','1528116494');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('291','restore','127.0.0.1','还原备份失败！','1','1528116588');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('292','restore','127.0.0.1','还原备份失败！','1','1528116822');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('293','restore','127.0.0.1','还原备份失败！','1','1528116833');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('294','restore','127.0.0.1','还原备份失败！','1','1528116939');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('295','restore','127.0.0.1','还原备份失败！','1','1528116968');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('296','restore','127.0.0.1','还原备份失败！','1','1528116994');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('297','restore','127.0.0.1','还原备份失败！','1','1528117185');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('298','backup','127.0.0.1','备份成功！','1','1528117277');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('299','restore','127.0.0.1','还原备份失败！','1','1528117292');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('300','backup','127.0.0.1','备份成功！','1','1528117725');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('301','restore','127.0.0.1','还原备份失败！','1','1528117748');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('302','restore','127.0.0.1','还原备份失败！','1','1528117774');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('303','restore','127.0.0.1','还原备份失败！','1','1528117854');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('304','restore','127.0.0.1','还原备份失败！','1','1528117877');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('305','backup','127.0.0.1','备份成功！','1','1528167475');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('306','restore','127.0.0.1','还原备份成功！','1','1528167492');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('307','backup','127.0.0.1','备份成功！','1','1528167724');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('308','backup','127.0.0.1','备份成功！','1','1528167866');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('309','backup','127.0.0.1','备份成功！','1','1528167955');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('310','backup','127.0.0.1','备份成功！','1','1528168285');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('311','backup','127.0.0.1','备份成功！','1','1528168672');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('312','backup','127.0.0.1','备份成功！','1','1528168786');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('313','backup','127.0.0.1','备份成功！','1','1528168905');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('314','restore','127.0.0.1','还原备份成功！','1','1528169479');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('315','restore','127.0.0.1','还原备份成功！','1','1528169632');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('316','backup','127.0.0.1','备份成功！','1','1528170172');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('317','backup','127.0.0.1','备份成功！','1','1528170228');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('318','restore','127.0.0.1','还原备份成功！','1','1528171928');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('319','download','127.0.0.1','下载备份成功','1','1528171943');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('320','download','127.0.0.1','下载备份成功','1','1528171943');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('321','backup','127.0.0.1','备份成功！','1','1528171955');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('322','add','127.0.0.1','增加配置字段成功','1','1528173898');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('323','edit','127.0.0.1','密码不能为空','1','1528178526');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('324','upload','127.0.0.1','上传内容格式与系统设置不符！','1','1528178568');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('325','edit','127.0.0.1','行为：修改操作员；错误：密码不能为空','1','1528178771');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('326','upload','127.0.0.1','行为：上传；错误：上传内容格式与系统设置不符！','1','1528178777');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('327','edit','127.0.0.1','修改操作员成功','1','1528178841');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('328','add','127.0.0.1','行为：新增操作员；错误：用户姓名不能为空','1','1528178978');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('329','edit','127.0.0.1','修改角色成功','1','1528179441');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('330','edit','127.0.0.1','行为：修改角色；错误：角色名称不能为空','1','1528179450');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('331','add','127.0.0.1','行为：新增角色；错误：角色名称不能为空','1','1528179459');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('332','edit','127.0.0.1','修改配置字段成功','1','1528192377');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('333','edit','127.0.0.1','行为：修改配置字段；错误：键不能为空','1','1528192475');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('334','delete','127.0.0.1','删除日志成功','1','1528194304');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('335','delete','127.0.0.1','删除日志成功','1','1528199037');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('336','backup','127.0.0.1','备份成功！','1','1528199045');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('337','restore','127.0.0.1','还原备份成功！','1','1528199065');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('338','login','127.0.0.1','登录成功','1','1528342702');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('339','login','127.0.0.1','登录成功','3','1528342764');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('340','login','127.0.0.1','登录成功','1','1528342950');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('341','login','127.0.0.1','登录成功','3','1528342968');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('342','login','127.0.0.1','登录成功','3','1528343052');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('343','login','127.0.0.1','登录成功','3','1528343299');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('344','login','127.0.0.1','登录成功','1','1528343519');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('345','login','127.0.0.1','登录成功','3','1528343536');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('346','login','127.0.0.1','登录成功','1','1528343566');
-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  `role_type` smallint(6) NOT NULL,
  `describe` text,
  `_role_pri` text,
  `_create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role`(`id`,`role_name`,`role_type`,`describe`,`_role_pri`,`_create_time`)  VALUES ('1','超管','1','最高管理员','','1527956507');
INSERT INTO `tb_role`(`id`,`role_name`,`role_type`,`describe`,`_role_pri`,`_create_time`)  VALUES ('2','普管','2','普通管理员','1,11,2,21,211,212,213,22,221,222,223,3,31,311,313,32,33,34,341','1527956524');
-- ----------------------------
-- Table structure for tb_role_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_admin`;
CREATE TABLE `tb_role_admin` (
  `role_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`admin_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_role_admin
-- ----------------------------
INSERT INTO `tb_role_admin`(`role_id`,`admin_id`)  VALUES ('1','1');
INSERT INTO `tb_role_admin`(`role_id`,`admin_id`)  VALUES ('1','4');
INSERT INTO `tb_role_admin`(`role_id`,`admin_id`)  VALUES ('2','2');
INSERT INTO `tb_role_admin`(`role_id`,`admin_id`)  VALUES ('2','3');
