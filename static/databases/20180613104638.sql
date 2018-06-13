/*
MySQL Database Backup Tools
Data:2018-06-13 10:46:38
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
INSERT INTO `tb_admin`(`id`,`admin_name`,`_password`,`img`,`account`,`sex`,`state`,`_last_time`,`_create_time`)  VALUES ('1','yxx','pbkdf2:sha256:50000$Omaln4yN$f57ad77e636835132a280f47473e52de116a355de6cadd2f28b736f175dcce5c','/static/uploads/image/2018/6/3/1528018920.jpg','666666','1','1','1528638128','1528082236');
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
) ENGINE=MyISAM AUTO_INCREMENT=421 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_log
-- ----------------------------
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('49','restore','127.0.0.1','还原备份成功！','1','1528687453');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('50','edit','127.0.0.1','修改分类成功','1','1528687538');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('51','edit','127.0.0.1','修改标签成功','1','1528687545');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('52','add','127.0.0.1','新增标签成功','1','1528706571');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('53','upload','127.0.0.1','上传成功','1','1528714942');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('54','upload','127.0.0.1','上传成功','1','1528717698');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('55','upload','127.0.0.1','上传成功','1','1528717840');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('56','upload','127.0.0.1','上传成功','1','1528717910');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('57','upload','127.0.0.1','上传成功','1','1528717985');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('58','upload','127.0.0.1','上传成功','1','1528718016');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('59','upload','127.0.0.1','上传成功','1','1528718071');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('60','upload','127.0.0.1','上传成功','1','1528718092');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('61','add','127.0.0.1','行为：新增文章；错误：文章标题不能为空','1','1528718112');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('62','upload','127.0.0.1','上传成功','1','1528718196');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('63','upload','127.0.0.1','上传成功','1','1528718217');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('64','upload','127.0.0.1','上传成功','1','1528718283');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('65','upload','127.0.0.1','上传成功','1','1528720133');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('66','add','127.0.0.1','行为：新增文章；错误：Class 'builtins.list' is not mapped','1','1528720141');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('67','add','127.0.0.1','增加文章成功','1','1528720272');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('68','upload','127.0.0.1','上传成功','1','1528720448');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('69','add','127.0.0.1','增加文章成功','1','1528720451');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('70','backup','127.0.0.1','备份成功！','1','1528722272');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('71','add','127.0.0.1','行为：新增文章；错误：'builtin_function_or_method' object is not subscriptable','1','1528773806');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('72','upload','127.0.0.1','上传成功','1','1528775504');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('73','add','127.0.0.1','行为：新增文章；错误：'postmetas'','1','1528775509');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('74','add','127.0.0.1','行为：新增文章；错误：'postmetas'','1','1528775582');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('75','add','127.0.0.1','行为：新增文章；错误：'postmetas'','1','1528775591');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('76','add','127.0.0.1','行为：新增文章；错误：'postmetas'','1','1528775632');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('77','add','127.0.0.1','行为：新增文章；错误：'postmetas'','1','1528775711');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('78','add','127.0.0.1','行为：新增文章；错误：'postmetas'','1','1528775725');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('79','add','127.0.0.1','行为：新增文章；错误：'postmetas'','1','1528775752');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('80','add','127.0.0.1','行为：新增文章；错误：'postmetas'','1','1528775852');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('81','add','127.0.0.1','行为：新增文章；错误：'postmetas'','1','1528775892');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('82','add','127.0.0.1','行为：新增文章；错误：'postmetas'','1','1528775938');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('83','add','127.0.0.1','行为：新增文章；错误：'postmetas'','1','1528775979');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('84','add','127.0.0.1','行为：新增文章；错误：'postmetas'','1','1528776009');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('85','add','127.0.0.1','增加文章成功','1','1528776068');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('86','add','127.0.0.1','行为：新增文章；错误：文章标题不能为空','1','1528776102');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('87','add','127.0.0.1','行为：新增文章；错误：'postmetas'','1','1528776168');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('88','add','127.0.0.1','行为：新增文章；错误：'postmetas'','1','1528776355');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('89','add','127.0.0.1','增加文章成功','1','1528777229');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('90','add','127.0.0.1','增加文章成功','1','1528777574');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('91','add','127.0.0.1','增加文章成功','1','1528777605');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('92','add','127.0.0.1','增加文章成功','1','1528777645');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('93','add','127.0.0.1','增加文章成功','1','1528777999');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('94','add','127.0.0.1','增加文章成功','1','1528778227');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('95','add','127.0.0.1','增加文章成功','1','1528778511');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('96','upload','127.0.0.1','上传成功','1','1528778554');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('97','upload','127.0.0.1','上传成功','1','1528778598');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('98','add','127.0.0.1','行为：新增文章；错误：文章标题不能为空','1','1528778609');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('99','upload','127.0.0.1','上传成功','1','1528778616');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('100','upload','127.0.0.1','上传成功','1','1528778683');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('101','add','127.0.0.1','增加文章成功','1','1528778685');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('102','add','127.0.0.1','增加文章成功','1','1528780013');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('103','add','127.0.0.1','增加文章成功','1','1528780076');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('104','add','127.0.0.1','添加标签成功','1','1528781440');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('105','add','127.0.0.1','添加标签成功','1','1528781465');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('106','add','127.0.0.1','行为：添加标签；错误：Could not find a FROM clause to join from.  Tried joining to <class 'apps.admin.model.terms.Terms'>, but got: Can't find any foreign key relationships between 'tb_term_taxonomy' and 'tb_terms'.','1','1528781642');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('107','add','127.0.0.1','添加标签成功','1','1528781799');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('108','add','127.0.0.1','添加标签成功','1','1528781913');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('109','add','127.0.0.1','添加标签成功','1','1528782103');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('110','add','127.0.0.1','添加标签成功','1','1528782647');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('111','upload','127.0.0.1','上传成功','1','1528785097');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('112','edit','127.0.0.1','修改操作员成功','1','1528786017');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('113','edit','127.0.0.1','修改操作员成功','1','1528786035');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('114','edit','127.0.0.1','行为：修改文章；错误：[WinError 3] 系统找不到指定的路径。: 'D:/static/global/face/default.png'','1','1528790487');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('115','edit','127.0.0.1','行为：修改文章；错误：'property' object has no attribute 'translate'','1','1528790871');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('116','edit','127.0.0.1','行为：修改文章；错误：'property' object has no attribute 'translate'','1','1528791022');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('117','edit','127.0.0.1','行为：修改文章；错误：'property' object has no attribute 'translate'','1','1528791044');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('118','add','127.0.0.1','修改文章成功','1','1528791084');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('119','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'resources'','1','1528791106');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('120','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'resources'','1','1528791120');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('121','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'resources'','1','1528791168');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('122','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'resources'','1','1528791210');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('123','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'resources'','1','1528791225');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('124','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'resources'','1','1528791315');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('125','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'resources'','1','1528791352');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('126','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'resources'','1','1528791369');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('127','add','127.0.0.1','修改文章成功','1','1528791617');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('128','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'resources'','1','1528791619');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('129','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'resources'','1','1528791629');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('130','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'resources'','1','1528791717');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('131','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'resources'','1','1528791727');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('132','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'resources'','1','1528791803');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('133','add','127.0.0.1','修改文章成功','1','1528791928');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('134','add','127.0.0.1','修改文章成功','1','1528791931');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('135','add','127.0.0.1','修改文章成功','1','1528791933');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('136','add','127.0.0.1','修改文章成功','1','1528791935');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('137','add','127.0.0.1','修改文章成功','1','1528791945');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('138','add','127.0.0.1','添加标签成功','1','1528792258');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('139','add','127.0.0.1','增加文章成功','1','1528792271');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('140','upload','127.0.0.1','上传成功','1','1528792404');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('141','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'old_name'','1','1528792406');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('142','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'old_name'','1','1528792505');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('143','upload','127.0.0.1','上传成功','1','1528792514');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('144','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'old_name'','1','1528792516');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('145','add','127.0.0.1','修改文章成功','1','1528792647');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('146','add','127.0.0.1','添加标签成功','1','1528792667');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('147','add','127.0.0.1','修改文章成功','1','1528792678');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('148','add','127.0.0.1','修改文章成功','1','1528794551');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('149','add','127.0.0.1','修改文章成功','1','1528794568');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('150','add','127.0.0.1','修改文章成功','1','1528794571');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('151','upload','127.0.0.1','上传成功','1','1528794612');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('152','add','127.0.0.1','增加文章成功','1','1528794615');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('153','add','127.0.0.1','修改文章成功','1','1528794763');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('154','upload','127.0.0.1','上传成功','1','1528794775');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('155','add','127.0.0.1','修改文章成功','1','1528794776');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('156','upload','127.0.0.1','上传成功','1','1528795447');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('157','add','127.0.0.1','修改文章成功','1','1528795450');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('158','add','127.0.0.1','修改文章成功','1','1528795471');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('159','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'terms'','1','1528795486');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('160','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'terms'','1','1528795491');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('161','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'terms'','1','1528795497');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('162','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'terms'','1','1528795508');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('163','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'terms'','1','1528795530');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('164','add','127.0.0.1','修改文章成功','1','1528795541');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('165','add','127.0.0.1','修改文章成功','1','1528795544');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('166','add','127.0.0.1','修改文章成功','1','1528795585');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('167','add','127.0.0.1','修改文章成功','1','1528795592');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('168','add','127.0.0.1','修改文章成功','1','1528795675');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('169','add','127.0.0.1','修改文章成功','1','1528795710');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('170','add','127.0.0.1','修改文章成功','1','1528795763');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('171','add','127.0.0.1','修改文章成功','1','1528795802');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('172','add','127.0.0.1','修改文章成功','1','1528795811');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('173','add','127.0.0.1','修改文章成功','1','1528795816');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('174','add','127.0.0.1','修改文章成功','1','1528795855');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('175','add','127.0.0.1','修改文章成功','1','1528795860');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('176','add','127.0.0.1','修改文章成功','1','1528795865');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('177','add','127.0.0.1','修改文章成功','1','1528796066');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('178','add','127.0.0.1','修改文章成功','1','1528796069');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('179','add','127.0.0.1','修改文章成功','1','1528796072');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('180','add','127.0.0.1','修改文章成功','1','1528796076');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('181','add','127.0.0.1','修改文章成功','1','1528796211');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('182','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'terms'','1','1528796219');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('183','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'terms'','1','1528796232');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('184','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'terms'','1','1528796259');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('185','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'terms'','1','1528796271');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('186','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'terms'','1','1528796277');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('187','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'terms'','1','1528796312');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('188','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'terms'','1','1528796327');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('189','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'terms'','1','1528796331');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('190','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'terms'','1','1528796334');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('191','add','127.0.0.1','修改文章成功','1','1528796380');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('192','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'terms'','1','1528796382');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('193','add','127.0.0.1','修改文章成功','1','1528796417');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('194','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'terms'','1','1528796455');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('195','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object has no attribute 'terms'','1','1528796470');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('196','add','127.0.0.1','修改文章成功','1','1528796661');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('197','add','127.0.0.1','修改文章成功','1','1528796665');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('198','add','127.0.0.1','修改文章成功','1','1528796669');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('199','add','127.0.0.1','修改文章成功','1','1528797651');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('200','edit','127.0.0.1','行为：修改文章；错误：object of type 'NoneType' has no len()','1','1528797660');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('201','add','127.0.0.1','修改文章成功','1','1528797808');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('202','add','127.0.0.1','修改文章成功','1','1528797813');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('203','add','127.0.0.1','修改文章成功','1','1528797816');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('204','add','127.0.0.1','修改文章成功','1','1528797819');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('205','add','127.0.0.1','修改文章成功','1','1528797826');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('206','add','127.0.0.1','修改文章成功','1','1528797832');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('207','add','127.0.0.1','修改文章成功','1','1528797836');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('208','add','127.0.0.1','修改文章成功','1','1528797842');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('209','add','127.0.0.1','修改文章成功','1','1528797903');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('210','add','127.0.0.1','修改文章成功','1','1528797907');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('211','add','127.0.0.1','修改文章成功','1','1528797911');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('212','add','127.0.0.1','修改文章成功','1','1528798048');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('213','add','127.0.0.1','修改文章成功','1','1528798078');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('214','add','127.0.0.1','修改文章成功','1','1528798081');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('215','add','127.0.0.1','修改文章成功','1','1528798084');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('216','add','127.0.0.1','修改文章成功','1','1528798179');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('217','add','127.0.0.1','修改文章成功','1','1528798185');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('218','add','127.0.0.1','修改文章成功','1','1528798191');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('219','upload','127.0.0.1','上传成功','1','1528798198');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('220','add','127.0.0.1','修改文章成功','1','1528798199');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('221','add','127.0.0.1','修改文章成功','1','1528798207');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('222','add','127.0.0.1','修改文章成功','1','1528799809');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('223','add','127.0.0.1','修改文章成功','1','1528799813');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('224','add','127.0.0.1','修改文章成功','1','1528799979');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('225','add','127.0.0.1','修改文章成功','1','1528799985');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('226','add','127.0.0.1','修改文章成功','1','1528799995');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('227','add','127.0.0.1','修改文章成功','1','1528800017');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('228','add','127.0.0.1','修改文章成功','1','1528800021');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('229','add','127.0.0.1','修改文章成功','1','1528800026');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('230','add','127.0.0.1','修改文章成功','1','1528800614');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('231','add','127.0.0.1','修改文章成功','1','1528800617');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('232','add','127.0.0.1','修改文章成功','1','1528800621');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('233','add','127.0.0.1','修改文章成功','1','1528800625');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('234','add','127.0.0.1','修改文章成功','1','1528800629');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('235','add','127.0.0.1','修改文章成功','1','1528800634');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('236','add','127.0.0.1','修改文章成功','1','1528800637');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('237','add','127.0.0.1','增加文章成功','1','1528801397');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('238','edit','127.0.0.1','行为：修改文章；错误：object of type 'NoneType' has no len()','1','1528801401');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('239','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object is not iterable','1','1528801598');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('240','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object is not iterable','1','1528801606');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('241','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object is not iterable','1','1528801653');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('242','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object is not iterable','1','1528801664');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('243','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object is not iterable','1','1528801707');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('244','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object is not iterable','1','1528801733');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('245','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object is not iterable','1','1528801742');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('246','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object is not iterable','1','1528801758');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('247','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object is not iterable','1','1528801769');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('248','edit','127.0.0.1','行为：修改文章；错误：'NoneType' object is not iterable','1','1528801813');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('249','add','127.0.0.1','修改文章成功','1','1528801849');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('250','add','127.0.0.1','修改文章成功','1','1528801855');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('251','add','127.0.0.1','修改文章成功','1','1528801860');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('252','add','127.0.0.1','增加文章成功','1','1528801866');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('253','add','127.0.0.1','修改文章成功','1','1528801871');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('254','add','127.0.0.1','修改文章成功','1','1528801879');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('255','edit','127.0.0.1','行为：修改文章；错误：name 'PostStatusForm' is not defined','1','1528801933');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('256','upload','127.0.0.1','上传成功','1','1528803259');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('257','add','127.0.0.1','修改文章成功','1','1528803261');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('258','add','127.0.0.1','修改文章成功','1','1528803272');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('259','upload','127.0.0.1','上传成功','1','1528803738');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('260','edit','127.0.0.1','行为：修改文章；错误：Required argument 'path' (pos 1) not found','1','1528803749');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('261','edit','127.0.0.1','行为：修改文章；错误：Required argument 'path' (pos 1) not found','1','1528803755');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('262','edit','127.0.0.1','行为：修改文章；错误：Required argument 'path' (pos 1) not found','1','1528803777');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('263','edit','127.0.0.1','行为：修改文章；错误：Required argument 'path' (pos 1) not found','1','1528803791');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('264','edit','127.0.0.1','行为：修改文章；错误：Required argument 'path' (pos 1) not found','1','1528803838');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('265','upload','127.0.0.1','上传成功','1','1528803859');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('266','edit','127.0.0.1','行为：修改文章；错误：Required argument 'path' (pos 1) not found','1','1528803872');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('267','edit','127.0.0.1','行为：修改文章；错误：Required argument 'path' (pos 1) not found','1','1528803903');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('268','add','127.0.0.1','修改文章成功','1','1528803924');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('269','upload','127.0.0.1','上传成功','1','1528803933');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('270','add','127.0.0.1','修改文章成功','1','1528803934');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('271','upload','127.0.0.1','上传成功','1','1528803981');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('272','upload','127.0.0.1','上传成功','1','1528803985');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('273','add','127.0.0.1','修改文章成功','1','1528803987');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('274','upload','127.0.0.1','上传成功','1','1528804133');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('275','add','127.0.0.1','修改文章成功','1','1528804134');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('276','upload','127.0.0.1','上传成功','1','1528804147');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('277','add','127.0.0.1','修改文章成功','1','1528804148');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('278','upload','127.0.0.1','上传成功','1','1528804173');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('279','add','127.0.0.1','修改文章成功','1','1528804178');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('280','upload','127.0.0.1','上传成功','1','1528804210');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('281','add','127.0.0.1','修改文章成功','1','1528804211');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('282','upload','127.0.0.1','上传成功','1','1528804261');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('283','add','127.0.0.1','修改文章成功','1','1528804262');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('284','upload','127.0.0.1','上传成功','1','1528804287');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('285','add','127.0.0.1','修改文章成功','1','1528804288');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('286','upload','127.0.0.1','上传成功','1','1528804380');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('287','add','127.0.0.1','修改文章成功','1','1528804381');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('288','add','127.0.0.1','修改文章成功','1','1528804413');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('289','upload','127.0.0.1','上传成功','1','1528804430');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('290','add','127.0.0.1','修改文章成功','1','1528804431');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('291','upload','127.0.0.1','上传成功','1','1528804590');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('292','add','127.0.0.1','修改文章成功','1','1528804591');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('293','upload','127.0.0.1','上传成功','1','1528804653');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('294','add','127.0.0.1','修改文章成功','1','1528804654');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('295','upload','127.0.0.1','上传成功','1','1528804665');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('296','add','127.0.0.1','修改文章成功','1','1528804666');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('297','add','127.0.0.1','增加文章成功','1','1528804815');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('298','add','127.0.0.1','修改文章成功','1','1528804820');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('299','add','127.0.0.1','修改文章成功','1','1528804824');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('300','add','127.0.0.1','修改文章成功','1','1528804828');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('301','add','127.0.0.1','添加标签成功','1','1528804838');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('302','add','127.0.0.1','修改文章成功','1','1528804842');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('303','upload','127.0.0.1','上传成功','1','1528804852');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('304','add','127.0.0.1','修改文章成功','1','1528804855');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('305','add','127.0.0.1','修改文章成功','1','1528804929');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('306','edit','127.0.0.1','行为：修改文章；错误：name 'PostTitleForm' is not defined','1','1528804968');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('307','add','127.0.0.1','修改文章成功','1','1528805267');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('308','edit','127.0.0.1','行为：修改文章；错误：'Posts' object is not callable','1','1528805271');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('309','add','127.0.0.1','修改文章成功','1','1528805352');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('310','edit','127.0.0.1','行为：修改文章；错误：'ImmutableMultiDict' object has no attribute 'post_title'','1','1528805498');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('311','add','127.0.0.1','修改文章成功','1','1528805563');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('312','edit','127.0.0.1','行为：修改文章；错误：'dict' object has no attribute 'post_title'','1','1528805593');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('313','add','127.0.0.1','修改文章成功','1','1528805657');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('314','add','127.0.0.1','修改文章成功','1','1528805659');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('315','edit','127.0.0.1','行为：修改文章；错误：文章标题不能为空','1','1528805664');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('316','edit','127.0.0.1','行为：修改文章；错误：name 'PostStatusForm' is not defined','1','1528805712');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('317','edit','127.0.0.1','行为：修改文章；错误：name 'PostStatusForm' is not defined','1','1528805726');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('318','edit','127.0.0.1','行为：修改文章；错误：name 'PostStatusForm' is not defined','1','1528805749');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('319','edit','127.0.0.1','行为：修改文章；错误：name 'PostStatusForm' is not defined','1','1528805782');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('320','add','127.0.0.1','修改文章成功','1','1528805837');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('321','add','127.0.0.1','修改文章成功','1','1528805837');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('322','add','127.0.0.1','修改文章成功','1','1528805838');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('323','add','127.0.0.1','修改文章成功','1','1528805839');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('324','add','127.0.0.1','修改文章成功','1','1528805843');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('325','add','127.0.0.1','修改文章成功','1','1528805845');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('326','add','127.0.0.1','修改文章成功','1','1528805846');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('327','add','127.0.0.1','修改文章成功','1','1528805849');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('328','add','127.0.0.1','修改文章成功','1','1528805852');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('329','add','127.0.0.1','修改文章成功','1','1528805853');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('330','add','127.0.0.1','修改文章成功','1','1528805854');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('331','add','127.0.0.1','修改文章成功','1','1528805854');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('332','add','127.0.0.1','修改文章成功','1','1528805855');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('333','add','127.0.0.1','修改文章成功','1','1528805856');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('334','add','127.0.0.1','修改文章成功','1','1528805856');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('335','add','127.0.0.1','修改文章成功','1','1528805856');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('336','add','127.0.0.1','修改文章成功','1','1528805856');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('337','add','127.0.0.1','修改文章成功','1','1528805861');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('338','add','127.0.0.1','修改文章成功','1','1528805862');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('339','add','127.0.0.1','修改文章成功','1','1528805866');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('340','edit','127.0.0.1','修改操作员成功','1','1528805965');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('341','edit','127.0.0.1','修改操作员成功','1','1528805966');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('342','add','127.0.0.1','修改文章成功','1','1528805972');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('343','add','127.0.0.1','修改文章成功','1','1528805983');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('344','add','127.0.0.1','修改文章成功','1','1528805987');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('345','add','127.0.0.1','修改文章成功','1','1528805992');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('346','add','127.0.0.1','修改文章成功','1','1528805998');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('347','add','127.0.0.1','修改文章成功','1','1528806039');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('348','add','127.0.0.1','修改文章成功','1','1528806130');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('349','add','127.0.0.1','修改文章成功','1','1528806133');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('350','add','127.0.0.1','修改文章成功','1','1528806154');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('351','add','127.0.0.1','修改文章成功','1','1528806155');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('352','add','127.0.0.1','修改文章成功','1','1528806157');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('353','add','127.0.0.1','修改文章成功','1','1528806158');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('354','add','127.0.0.1','修改文章成功','1','1528806159');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('355','add','127.0.0.1','修改文章成功','1','1528806161');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('356','edit','127.0.0.1','修改操作员成功','1','1528806171');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('357','edit','127.0.0.1','修改操作员成功','1','1528806171');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('358','add','127.0.0.1','修改文章成功','1','1528806295');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('359','add','127.0.0.1','修改文章成功','1','1528806296');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('360','add','127.0.0.1','修改文章成功','1','1528806296');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('361','add','127.0.0.1','修改文章成功','1','1528806471');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('362','add','127.0.0.1','修改文章成功','1','1528806476');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('363','add','127.0.0.1','修改文章成功','1','1528806512');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('364','add','127.0.0.1','修改文章成功','1','1528806516');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('365','add','127.0.0.1','修改文章成功','1','1528806532');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('366','add','127.0.0.1','修改文章成功','1','1528806537');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('367','add','127.0.0.1','修改文章成功','1','1528806603');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('368','edit','127.0.0.1','行为：修改操作员；错误：name 'PostStatusForm' is not defined','1','1528806700');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('369','edit','127.0.0.1','行为：修改操作员；错误：name 'PostStatusForm' is not defined','1','1528806747');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('370','edit','127.0.0.1','行为：修改操作员；错误：name 'PostStatusForm' is not defined','1','1528806831');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('371','edit','127.0.0.1','行为：修改操作员；错误：name 'PostStatusForm' is not defined','1','1528806832');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('372','edit','127.0.0.1','行为：修改操作员；错误：name 'PostStatusForm' is not defined','1','1528806835');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('373','edit','127.0.0.1','行为：修改操作员；错误：name 'PostStatusForm' is not defined','1','1528806847');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('374','add','127.0.0.1','修改文章成功','1','1528806987');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('375','add','127.0.0.1','修改文章成功','1','1528806987');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('376','add','127.0.0.1','修改文章成功','1','1528806988');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('377','add','127.0.0.1','修改文章成功','1','1528807036');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('378','add','127.0.0.1','修改文章成功','1','1528807043');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('379','add','127.0.0.1','修改文章成功','1','1528807056');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('380','add','127.0.0.1','增加文章成功','1','1528807101');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('381','delete','127.0.0.1','行为：删除文章；错误：unsupported operand type(s) for -=: 'method' and 'int'','1','1528808176');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('382','delete','127.0.0.1','行为：删除文章；错误：unsupported operand type(s) for -=: 'method' and 'int'','1','1528808289');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('383','delete','127.0.0.1','行为：删除文章；错误：'NoneType' object has no attribute 'count'','1','1528808351');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('384','delete','127.0.0.1','行为：删除文章；错误：'NoneType' object has no attribute 'count'','1','1528808387');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('385','delete','127.0.0.1','删除文章成功','1','1528808407');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('386','delete','127.0.0.1','行为：删除文章；错误：'NoneType' object has no attribute 'count'','1','1528808452');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('387','delete','127.0.0.1','删除文章成功','1','1528808485');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('388','delete','127.0.0.1','删除文章成功','1','1528808503');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('389','delete','127.0.0.1','删除文章成功','1','1528808566');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('390','delete','127.0.0.1','行为：删除文章；错误：Class 'builtins.list' is not mapped','1','1528808724');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('391','add','127.0.0.1','行为：新增文章；错误：文章标题不能为空','1','1528808879');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('392','add','127.0.0.1','增加文章成功','1','1528808883');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('393','upload','127.0.0.1','上传成功','1','1528808917');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('394','add','127.0.0.1','修改文章成功','1','1528808918');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('395','add','127.0.0.1','修改文章成功','1','1528808926');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('396','add','127.0.0.1','修改文章成功','1','1528808940');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('397','add','127.0.0.1','修改文章成功','1','1528808941');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('398','delete','127.0.0.1','删除文章成功','1','1528808948');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('399','add','127.0.0.1','增加文章成功','1','1528809250');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('400','add','127.0.0.1','修改文章成功','1','1528809266');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('401','delete','127.0.0.1','删除文章成功','1','1528809272');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('402','backup','127.0.0.1','备份成功！','1','1528809293');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('403','backup','127.0.0.1','备份成功！','1','1528809852');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('404','add','127.0.0.1','增加文章成功','1','1528857093');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('405','add','127.0.0.1','修改文章成功','1','1528857100');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('406','add','127.0.0.1','增加文章成功','1','1528857154');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('407','add','127.0.0.1','修改文章成功','1','1528857157');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('408','add','127.0.0.1','修改文章成功','1','1528857163');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('409','add','127.0.0.1','修改文章成功','1','1528857166');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('410','add','127.0.0.1','修改文章成功','1','1528857167');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('411','upload','127.0.0.1','上传成功','1','1528857188');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('412','add','127.0.0.1','修改文章成功','1','1528857189');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('413','upload','127.0.0.1','上传成功','1','1528857195');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('414','add','127.0.0.1','修改文章成功','1','1528857196');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('415','delete','127.0.0.1','删除文章成功','1','1528857239');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('416','add','127.0.0.1','增加文章成功','1','1528857374');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('417','add','127.0.0.1','修改文章成功','1','1528857379');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('418','add','127.0.0.1','修改文章成功','1','1528857388');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('419','upload','127.0.0.1','上传成功','1','1528857449');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('420','add','127.0.0.1','修改文章成功','1','1528857465');
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
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_postmeta
-- ----------------------------
INSERT INTO `tb_postmeta`(`id`,`meta_key`,`meta_value`)  VALUES ('21','termtaxonomy_label_posts_id','7');
INSERT INTO `tb_postmeta`(`id`,`meta_key`,`meta_value`)  VALUES ('20','termtaxonomy_category_posts_id','7');
INSERT INTO `tb_postmeta`(`id`,`meta_key`,`meta_value`)  VALUES ('19','feature_img_resources_posts_id','7');
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_posts
-- ----------------------------
INSERT INTO `tb_posts`(`id`,`post_author`,`_create_time`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`post_name`,`_update_time`,`menu_order`,`post_type`,`comment_count`)  VALUES ('7','1','1528857374','【Python】Python的单引号字符串和转义引号','【Python】Python的单引号字符串和转义引号','上述的两段代码，都出现同时用到了单引号''和双引号""，如果单纯的只使用单引号''或者双引号""，编译器都会报错。所以说就会引入转义字符的概念：使用 反斜杠\对字符串的引号进行转义：','1','1','','1528857465','0','1','0');
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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_resources
-- ----------------------------
INSERT INTO `tb_resources`(`id`,`old_name`,`new_name`,`size`)  VALUES ('5','微信图片_20180612165811.jpg','/static/uploads/image/2018/6/13/1528857194.jpg','266287');
INSERT INTO `tb_resources`(`id`,`old_name`,`new_name`,`size`)  VALUES ('6','1522133531(1).jpg','/static/uploads/image/2018/6/13/1528857187.jpg','598325');
INSERT INTO `tb_resources`(`id`,`old_name`,`new_name`,`size`)  VALUES ('7','微信图片_20180516101646.jpg','/static/uploads/image/2018/6/13/1528857448.jpg','221141');
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
INSERT INTO `tb_resources_relationships`(`resources_id`,`object_id`)  VALUES ('7','19');
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
INSERT INTO `tb_term_relationships`(`term_taxonomy_id`,`object_id`)  VALUES ('13','20');
INSERT INTO `tb_term_relationships`(`term_taxonomy_id`,`object_id`)  VALUES ('16','21');
INSERT INTO `tb_term_relationships`(`term_taxonomy_id`,`object_id`)  VALUES ('17','21');
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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_term_taxonomy
-- ----------------------------
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('1','1','2','','0','0');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('11','11','1','','0','0');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('13','13','1','','12','1');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('12','12','1','','11','0');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('14','14','2','','0','0');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('17','17','2','','0','1');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('16','16','2','','0','1');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('15','15','2','','0','0');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('18','18','2','','0','0');
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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_terms
-- ----------------------------
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('1','python','python','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('13','api开发','api','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('11','php','php','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('12','larver框架','larver','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('14','php','php','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('15','session','session','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('16','测试','测试','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('17','测试2','测试2','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('18','os库','os库','99');
