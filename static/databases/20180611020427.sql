/*
MySQL Database Backup Tools
Data:2018-06-11 02:04:27
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
INSERT INTO `alembic_version`(`version_num`)  VALUES ('b742f875c673');
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin`(`id`,`admin_name`,`_password`,`img`,`account`,`sex`,`state`,`_last_time`,`_create_time`)  VALUES ('1','yxx','pbkdf2:sha256:50000$2cYoOeQj$4e5b601033cd93cf7775fc634fedd24febc86ae0962acb1a7b5317fadd331928','/static/uploads/image/2018/6/3/1528018920.jpg','666666','1','1','1528638128','1528082236');
INSERT INTO `tb_admin`(`id`,`admin_name`,`_password`,`img`,`account`,`sex`,`state`,`_last_time`,`_create_time`)  VALUES ('2','test','pbkdf2:sha256:50000$OG3oZpGI$2a665a6b1cd060e47c71a66089eb517c7b92526ce0e543aa75a323a0553cf1d1','','123456','1','1','1528638139','1528633584');
-- ----------------------------
-- Table structure for tb_config_field
-- ----------------------------
DROP TABLE IF EXISTS `tb_config_field`;
CREATE TABLE `tb_config_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `k` varchar(50) NOT NULL,
  `v` text,
  `type` varchar(50) NOT NULL,
  `desc` text,
  `prompt` varchar(250) NOT NULL,
  `sorts` int(11) NOT NULL,
  `state` smallint(6) NOT NULL,
  `texttype` varchar(100) NOT NULL,
  `textvalue` varchar(100) NOT NULL,
  `_create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_config_field
-- ----------------------------
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('1','image_size','11111111','up','上传图片大小','1024：1KB，1048576：1MB，5242880：5MB。建议不要超过1MB，避免图片上传失败','1','1','text','','1527989310');
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('2','file_size','1111111','up','上传文件大小','1024：1KB，1048576：1MB，5242880：5MB。建议不要超过5MB，避免文件上传失败','2','1','text','','1527989343');
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('3','image_format','jpg,gif,jpeg,png,bmp','up','上传图片格式','上传图片格式','3','1','text','','1527989374');
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('4','file_format','doc,docx,xls,xlsx,ppt,pptx,txt,rar,zip,mp4,pdf','up','上传文件格式','上传文件格式','4','1','text','','1527989398');
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('5','upload_path','uploads','up','文件上传目录','文件上传目录','5','1','text','','1527989462');
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('6','image_url','','up','图片上传域名地址','图片上传域名地址，图片路径保存数据库是否带域名，不建议填写，除非很清楚怎么使用','6','1','text','','1527989503');
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('7','title','yxx_admin1','web','网站标题','网站标题【title】','7','1','text','','1527989551');
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('8','logo','/static/uploads/image/2018/6/3/1528029860.jpg','web','网站LOGO(68*34)','网站LOGO，一般用于导航或底部的LOGO图片','99','1','image','','1527989600');
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('9','copyright','01212312','web','网站备案号','网站备案号','99','1','text','','1527989642');
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('11','media_format','swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb,mp4','up','上传视音频格式','上传视音频格式','99','1','text','','1528031937');
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('12','flash_format','swf,flv','up','上传Flash格式','上传Flash格式','99','1','text','','1528031967');
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('13','media_size','11111111','up','上传音频大小','1024：1KB，1048576：1MB，5242880：5MB。建议不要超过5MB，避免音频上传失败','99','1','text','','1528032165');
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('14','flash_size','11111111','up','上传flash大小','1024：1KB，1048576：1MB，5242880：5MB。建议不要超过5MB，避免上传失败','99','1','text','','1528032209');
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('17','test','','web','测试','测试','99','1','content','','1528173898');
-- ----------------------------
-- Table structure for tb_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_log`;
CREATE TABLE `tb_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(32) NOT NULL,
  `ip` varchar(64) NOT NULL,
  `log_detail` text NOT NULL,
  `admin_id` int(11) NOT NULL,
  `_create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_log
-- ----------------------------

-- ----------------------------
-- Table structure for tb_postmeta
-- ----------------------------
DROP TABLE IF EXISTS `tb_postmeta`;
CREATE TABLE `tb_postmeta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(256) NOT NULL,
  `meta_value` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_tb_postmeta_meta_key` (`meta_key`),
  KEY `ix_tb_postmeta_meta_value` (`meta_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_postmeta
-- ----------------------------
-- ----------------------------
-- Table structure for tb_posts
-- ----------------------------
DROP TABLE IF EXISTS `tb_posts`;
CREATE TABLE `tb_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_author` int(11) NOT NULL,
  `_create_time` int(11) NOT NULL,
  `post_content` text NOT NULL,
  `post_title` varchar(256) NOT NULL,
  `post_excerpt` varchar(500) NOT NULL,
  `post_status` smallint(6) NOT NULL,
  `comment_status` smallint(6) NOT NULL,
  `post_name` varchar(256) NOT NULL,
  `_update_time` int(11) NOT NULL,
  `menu_order` int(11) NOT NULL,
  `post_type` int(11) NOT NULL,
  `comment_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_tb_posts_post_author` (`post_author`),
  KEY `ix_tb_posts_post_name` (`post_name`),
  KEY `ix_tb_posts_post_title` (`post_title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_posts
-- ----------------------------
-- ----------------------------
-- Table structure for tb_resources
-- ----------------------------
DROP TABLE IF EXISTS `tb_resources`;
CREATE TABLE `tb_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_name` varchar(256) NOT NULL,
  `new_name` varchar(256) NOT NULL,
  `size` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_tb_resources_new_name` (`new_name`),
  KEY `ix_tb_resources_old_name` (`old_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_resources
-- ----------------------------
-- ----------------------------
-- Table structure for tb_resources_relationships
-- ----------------------------
DROP TABLE IF EXISTS `tb_resources_relationships`;
CREATE TABLE `tb_resources_relationships` (
  `resources_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  PRIMARY KEY (`resources_id`,`object_id`),
  KEY `object_id` (`object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_resources_relationships
-- ----------------------------
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
INSERT INTO `tb_role`(`id`,`role_name`,`role_type`,`describe`,`_role_pri`,`_create_time`)  VALUES ('1','超级管理员','1','最高管理员',' ','1528632337');
INSERT INTO `tb_role`(`id`,`role_name`,`role_type`,`describe`,`_role_pri`,`_create_time`)  VALUES ('2','普通管理员','2','管理网站','1,11,5,51,511,52,511,2,21,211,212,213,22,221,222,223,3,31,311,312,313,32,33,34,341,35,4,41,411,42,421,422,423','1528633466');
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
INSERT INTO `tb_role_admin`(`role_id`,`admin_id`)  VALUES ('2','2');
-- ----------------------------
-- Table structure for tb_term_relationships
-- ----------------------------
DROP TABLE IF EXISTS `tb_term_relationships`;
CREATE TABLE `tb_term_relationships` (
  `term_taxonomy_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  PRIMARY KEY (`term_taxonomy_id`,`object_id`),
  KEY `object_id` (`object_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_term_relationships
-- ----------------------------
-- ----------------------------
-- Table structure for tb_term_taxonomy
-- ----------------------------
DROP TABLE IF EXISTS `tb_term_taxonomy`;
CREATE TABLE `tb_term_taxonomy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `term_id` int(11) NOT NULL,
  `taxonomy` int(11) NOT NULL,
  `img` varchar(100) NOT NULL,
  `parent` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_term_taxonomy
-- ----------------------------
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('1','1','2','','0','0');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('11','11','1','','0','0');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('13','13','1','','12','0');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('12','12','1','','11','0');
-- ----------------------------
-- Table structure for tb_terms
-- ----------------------------
DROP TABLE IF EXISTS `tb_terms`;
CREATE TABLE `tb_terms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `slug` varchar(256) NOT NULL,
  `term_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_tb_terms_name` (`name`),
  KEY `ix_tb_terms_slug` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_terms
-- ----------------------------
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('1','python','python','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('13','api开发','api','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('11','php','php','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('12','larver框架','larver','99');
