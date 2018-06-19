/*
MySQL Database Backup Tools
Data:2018-06-16 09:47:41
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
INSERT INTO `tb_admin`(`id`,`admin_name`,`_password`,`img`,`account`,`sex`,`state`,`_last_time`,`_create_time`)  VALUES ('1','yxx','pbkdf2:sha256:50000$07kmCwvb$cb8a9b2b93740799368a042bdf46db721b4411198ad2f423f3fdef1bb9ed96e6','/static/uploads/image/2018/6/3/1528018920.jpg','666666','1','1','1529139890','1528082236');
INSERT INTO `tb_admin`(`id`,`admin_name`,`_password`,`img`,`account`,`sex`,`state`,`_last_time`,`_create_time`)  VALUES ('2','网站管理员','pbkdf2:sha256:50000$Kgl9mZvu$3ad1f7c8127ca8b4e6617bcdc8946ca01027462554672ba889ced0849d83641d','/static/uploads/image/2018/6/16/1529137161.jpg','123456','1','1','1528963632','1528633584');
-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `ip` varchar(64) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_parent` int(11) NOT NULL,
  `state` smallint(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `_create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment`(`id`,`post_id`,`ip`,`comment_content`,`comment_parent`,`state`,`user_id`,`_create_time`)  VALUES ('1','2','211.144.7.45','评论测试','0','1','0','1529137006');
INSERT INTO `tb_comment`(`id`,`post_id`,`ip`,`comment_content`,`comment_parent`,`state`,`user_id`,`_create_time`)  VALUES ('2','1','211.144.7.45','评论测试','0','1','0','1529137074');
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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
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
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('17','test','','web','测试','测试','99','0','content','','1528173898');
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('18','menu_master','主菜单界面','web','界面主菜单导航','界面主菜单导航','99','1','text','','1529029557');
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('19','select_template','v1','web','前台显示模版选择','前台显示模版选择','99','1','text','','1529029655');
INSERT INTO `tb_config_field`(`id`,`k`,`v`,`type`,`desc`,`prompt`,`sorts`,`state`,`texttype`,`textvalue`,`_create_time`)  VALUES ('20','page_size','10','web','列表显示页数','列表显示页数','99','1','text','','1529049622');
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
) ENGINE=MyISAM AUTO_INCREMENT=561 DEFAULT CHARSET=utf8;
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
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('66','add','127.0.0.1','行为：新增文章；错误：Class \'builtins.list\' is not mapped','1','1528720141');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('67','add','127.0.0.1','增加文章成功','1','1528720272');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('68','upload','127.0.0.1','上传成功','1','1528720448');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('69','add','127.0.0.1','增加文章成功','1','1528720451');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('70','backup','127.0.0.1','备份成功！','1','1528722272');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('71','add','127.0.0.1','行为：新增文章；错误：\'builtin_function_or_method\' object is not subscriptable','1','1528773806');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('72','upload','127.0.0.1','上传成功','1','1528775504');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('73','add','127.0.0.1','行为：新增文章；错误：\'postmetas\'','1','1528775509');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('74','add','127.0.0.1','行为：新增文章；错误：\'postmetas\'','1','1528775582');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('75','add','127.0.0.1','行为：新增文章；错误：\'postmetas\'','1','1528775591');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('76','add','127.0.0.1','行为：新增文章；错误：\'postmetas\'','1','1528775632');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('77','add','127.0.0.1','行为：新增文章；错误：\'postmetas\'','1','1528775711');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('78','add','127.0.0.1','行为：新增文章；错误：\'postmetas\'','1','1528775725');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('79','add','127.0.0.1','行为：新增文章；错误：\'postmetas\'','1','1528775752');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('80','add','127.0.0.1','行为：新增文章；错误：\'postmetas\'','1','1528775852');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('81','add','127.0.0.1','行为：新增文章；错误：\'postmetas\'','1','1528775892');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('82','add','127.0.0.1','行为：新增文章；错误：\'postmetas\'','1','1528775938');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('83','add','127.0.0.1','行为：新增文章；错误：\'postmetas\'','1','1528775979');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('84','add','127.0.0.1','行为：新增文章；错误：\'postmetas\'','1','1528776009');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('85','add','127.0.0.1','增加文章成功','1','1528776068');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('86','add','127.0.0.1','行为：新增文章；错误：文章标题不能为空','1','1528776102');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('87','add','127.0.0.1','行为：新增文章；错误：\'postmetas\'','1','1528776168');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('88','add','127.0.0.1','行为：新增文章；错误：\'postmetas\'','1','1528776355');
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
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('106','add','127.0.0.1','行为：添加标签；错误：Could not find a FROM clause to join from.  Tried joining to <class \'apps.admin.model.terms.Terms\'>, but got: Can\'t find any foreign key relationships between \'tb_term_taxonomy\' and \'tb_terms\'.','1','1528781642');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('107','add','127.0.0.1','添加标签成功','1','1528781799');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('108','add','127.0.0.1','添加标签成功','1','1528781913');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('109','add','127.0.0.1','添加标签成功','1','1528782103');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('110','add','127.0.0.1','添加标签成功','1','1528782647');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('111','upload','127.0.0.1','上传成功','1','1528785097');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('112','edit','127.0.0.1','修改操作员成功','1','1528786017');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('113','edit','127.0.0.1','修改操作员成功','1','1528786035');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('114','edit','127.0.0.1','行为：修改文章；错误：[WinError 3] 系统找不到指定的路径。: \'D:/static/global/face/default.png\'','1','1528790487');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('115','edit','127.0.0.1','行为：修改文章；错误：\'property\' object has no attribute \'translate\'','1','1528790871');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('116','edit','127.0.0.1','行为：修改文章；错误：\'property\' object has no attribute \'translate\'','1','1528791022');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('117','edit','127.0.0.1','行为：修改文章；错误：\'property\' object has no attribute \'translate\'','1','1528791044');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('118','add','127.0.0.1','修改文章成功','1','1528791084');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('119','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'resources\'','1','1528791106');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('120','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'resources\'','1','1528791120');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('121','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'resources\'','1','1528791168');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('122','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'resources\'','1','1528791210');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('123','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'resources\'','1','1528791225');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('124','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'resources\'','1','1528791315');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('125','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'resources\'','1','1528791352');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('126','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'resources\'','1','1528791369');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('127','add','127.0.0.1','修改文章成功','1','1528791617');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('128','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'resources\'','1','1528791619');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('129','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'resources\'','1','1528791629');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('130','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'resources\'','1','1528791717');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('131','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'resources\'','1','1528791727');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('132','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'resources\'','1','1528791803');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('133','add','127.0.0.1','修改文章成功','1','1528791928');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('134','add','127.0.0.1','修改文章成功','1','1528791931');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('135','add','127.0.0.1','修改文章成功','1','1528791933');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('136','add','127.0.0.1','修改文章成功','1','1528791935');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('137','add','127.0.0.1','修改文章成功','1','1528791945');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('138','add','127.0.0.1','添加标签成功','1','1528792258');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('139','add','127.0.0.1','增加文章成功','1','1528792271');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('140','upload','127.0.0.1','上传成功','1','1528792404');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('141','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'old_name\'','1','1528792406');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('142','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'old_name\'','1','1528792505');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('143','upload','127.0.0.1','上传成功','1','1528792514');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('144','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'old_name\'','1','1528792516');
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
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('159','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'terms\'','1','1528795486');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('160','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'terms\'','1','1528795491');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('161','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'terms\'','1','1528795497');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('162','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'terms\'','1','1528795508');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('163','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'terms\'','1','1528795530');
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
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('182','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'terms\'','1','1528796219');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('183','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'terms\'','1','1528796232');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('184','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'terms\'','1','1528796259');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('185','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'terms\'','1','1528796271');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('186','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'terms\'','1','1528796277');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('187','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'terms\'','1','1528796312');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('188','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'terms\'','1','1528796327');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('189','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'terms\'','1','1528796331');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('190','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'terms\'','1','1528796334');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('191','add','127.0.0.1','修改文章成功','1','1528796380');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('192','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'terms\'','1','1528796382');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('193','add','127.0.0.1','修改文章成功','1','1528796417');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('194','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'terms\'','1','1528796455');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('195','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object has no attribute \'terms\'','1','1528796470');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('196','add','127.0.0.1','修改文章成功','1','1528796661');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('197','add','127.0.0.1','修改文章成功','1','1528796665');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('198','add','127.0.0.1','修改文章成功','1','1528796669');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('199','add','127.0.0.1','修改文章成功','1','1528797651');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('200','edit','127.0.0.1','行为：修改文章；错误：object of type \'NoneType\' has no len()','1','1528797660');
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
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('238','edit','127.0.0.1','行为：修改文章；错误：object of type \'NoneType\' has no len()','1','1528801401');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('239','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object is not iterable','1','1528801598');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('240','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object is not iterable','1','1528801606');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('241','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object is not iterable','1','1528801653');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('242','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object is not iterable','1','1528801664');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('243','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object is not iterable','1','1528801707');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('244','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object is not iterable','1','1528801733');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('245','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object is not iterable','1','1528801742');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('246','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object is not iterable','1','1528801758');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('247','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object is not iterable','1','1528801769');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('248','edit','127.0.0.1','行为：修改文章；错误：\'NoneType\' object is not iterable','1','1528801813');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('249','add','127.0.0.1','修改文章成功','1','1528801849');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('250','add','127.0.0.1','修改文章成功','1','1528801855');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('251','add','127.0.0.1','修改文章成功','1','1528801860');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('252','add','127.0.0.1','增加文章成功','1','1528801866');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('253','add','127.0.0.1','修改文章成功','1','1528801871');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('254','add','127.0.0.1','修改文章成功','1','1528801879');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('255','edit','127.0.0.1','行为：修改文章；错误：name \'PostStatusForm\' is not defined','1','1528801933');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('256','upload','127.0.0.1','上传成功','1','1528803259');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('257','add','127.0.0.1','修改文章成功','1','1528803261');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('258','add','127.0.0.1','修改文章成功','1','1528803272');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('259','upload','127.0.0.1','上传成功','1','1528803738');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('260','edit','127.0.0.1','行为：修改文章；错误：Required argument \'path\' (pos 1) not found','1','1528803749');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('261','edit','127.0.0.1','行为：修改文章；错误：Required argument \'path\' (pos 1) not found','1','1528803755');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('262','edit','127.0.0.1','行为：修改文章；错误：Required argument \'path\' (pos 1) not found','1','1528803777');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('263','edit','127.0.0.1','行为：修改文章；错误：Required argument \'path\' (pos 1) not found','1','1528803791');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('264','edit','127.0.0.1','行为：修改文章；错误：Required argument \'path\' (pos 1) not found','1','1528803838');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('265','upload','127.0.0.1','上传成功','1','1528803859');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('266','edit','127.0.0.1','行为：修改文章；错误：Required argument \'path\' (pos 1) not found','1','1528803872');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('267','edit','127.0.0.1','行为：修改文章；错误：Required argument \'path\' (pos 1) not found','1','1528803903');
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
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('306','edit','127.0.0.1','行为：修改文章；错误：name \'PostTitleForm\' is not defined','1','1528804968');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('307','add','127.0.0.1','修改文章成功','1','1528805267');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('308','edit','127.0.0.1','行为：修改文章；错误：\'Posts\' object is not callable','1','1528805271');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('309','add','127.0.0.1','修改文章成功','1','1528805352');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('310','edit','127.0.0.1','行为：修改文章；错误：\'ImmutableMultiDict\' object has no attribute \'post_title\'','1','1528805498');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('311','add','127.0.0.1','修改文章成功','1','1528805563');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('312','edit','127.0.0.1','行为：修改文章；错误：\'dict\' object has no attribute \'post_title\'','1','1528805593');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('313','add','127.0.0.1','修改文章成功','1','1528805657');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('314','add','127.0.0.1','修改文章成功','1','1528805659');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('315','edit','127.0.0.1','行为：修改文章；错误：文章标题不能为空','1','1528805664');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('316','edit','127.0.0.1','行为：修改文章；错误：name \'PostStatusForm\' is not defined','1','1528805712');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('317','edit','127.0.0.1','行为：修改文章；错误：name \'PostStatusForm\' is not defined','1','1528805726');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('318','edit','127.0.0.1','行为：修改文章；错误：name \'PostStatusForm\' is not defined','1','1528805749');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('319','edit','127.0.0.1','行为：修改文章；错误：name \'PostStatusForm\' is not defined','1','1528805782');
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
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('368','edit','127.0.0.1','行为：修改操作员；错误：name \'PostStatusForm\' is not defined','1','1528806700');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('369','edit','127.0.0.1','行为：修改操作员；错误：name \'PostStatusForm\' is not defined','1','1528806747');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('370','edit','127.0.0.1','行为：修改操作员；错误：name \'PostStatusForm\' is not defined','1','1528806831');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('371','edit','127.0.0.1','行为：修改操作员；错误：name \'PostStatusForm\' is not defined','1','1528806832');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('372','edit','127.0.0.1','行为：修改操作员；错误：name \'PostStatusForm\' is not defined','1','1528806835');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('373','edit','127.0.0.1','行为：修改操作员；错误：name \'PostStatusForm\' is not defined','1','1528806847');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('374','add','127.0.0.1','修改文章成功','1','1528806987');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('375','add','127.0.0.1','修改文章成功','1','1528806987');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('376','add','127.0.0.1','修改文章成功','1','1528806988');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('377','add','127.0.0.1','修改文章成功','1','1528807036');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('378','add','127.0.0.1','修改文章成功','1','1528807043');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('379','add','127.0.0.1','修改文章成功','1','1528807056');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('380','add','127.0.0.1','增加文章成功','1','1528807101');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('381','delete','127.0.0.1','行为：删除文章；错误：unsupported operand type(s) for -=: \'method\' and \'int\'','1','1528808176');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('382','delete','127.0.0.1','行为：删除文章；错误：unsupported operand type(s) for -=: \'method\' and \'int\'','1','1528808289');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('383','delete','127.0.0.1','行为：删除文章；错误：\'NoneType\' object has no attribute \'count\'','1','1528808351');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('384','delete','127.0.0.1','行为：删除文章；错误：\'NoneType\' object has no attribute \'count\'','1','1528808387');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('385','delete','127.0.0.1','删除文章成功','1','1528808407');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('386','delete','127.0.0.1','行为：删除文章；错误：\'NoneType\' object has no attribute \'count\'','1','1528808452');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('387','delete','127.0.0.1','删除文章成功','1','1528808485');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('388','delete','127.0.0.1','删除文章成功','1','1528808503');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('389','delete','127.0.0.1','删除文章成功','1','1528808566');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('390','delete','127.0.0.1','行为：删除文章；错误：Class \'builtins.list\' is not mapped','1','1528808724');
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
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('421','backup','127.0.0.1','备份成功！','1','1528857999');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('422','restore','127.0.0.1','还原备份成功！','1','1528858710');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('423','add','127.0.0.1','增加文章成功','1','1528858747');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('424','add','127.0.0.1','修改文章成功','1','1528859288');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('425','add','127.0.0.1','修改文章成功','1','1528859295');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('426','add','127.0.0.1','修改文章成功','1','1528859366');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('427','add','127.0.0.1','添加菜单成功','1','1528873448');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('428','add','127.0.0.1','添加菜单成功','1','1528873768');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('429','edit','127.0.0.1','行为：修改标签；错误：别名长度必须为1-256位','1','1528877273');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('430','add','127.0.0.1','行为：新增标签；错误：别名长度必须为1-256位','1','1528877277');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('431','add','127.0.0.1','添加菜单成功','1','1528877501');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('432','add','127.0.0.1','添加菜单成功','1','1528877539');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('433','add','127.0.0.1','添加菜单成功','1','1528877548');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('434','add','127.0.0.1','添加菜单成功','1','1528877648');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('435','add','127.0.0.1','行为：添加菜单；错误：Object of type \'TermTaxonomy\' is not JSON serializable','1','1528877648');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('436','add','127.0.0.1','添加菜单成功','1','1528877894');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('437','add','127.0.0.1','修改文章成功','1','1528879787');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('438','add','127.0.0.1','修改文章成功','1','1528885230');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('439','join','127.0.0.1','行为：菜单关联；错误：\'InstrumentedList\' object has no attribute \'all\'','1','1528890474');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('440','join','127.0.0.1','行为：菜单关联；错误：\'InstrumentedList\' object has no attribute \'all\'','1','1528890493');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('441','join','127.0.0.1','行为：菜单关联；错误：\'InstrumentedList\' object has no attribute \'all\'','1','1528891264');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('442','join','127.0.0.1','行为：菜单关联；错误：\'InstrumentedList\' object has no attribute \'all\'','1','1528891309');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('443','join','127.0.0.1','行为：菜单关联；错误：\'InstrumentedList\' object has no attribute \'all\'','1','1528891321');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('444','join','127.0.0.1','行为：菜单关联；错误：\'InstrumentedList\' object has no attribute \'all\'','1','1528891328');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('445','join','127.0.0.1','行为：菜单关联；错误：\'InstrumentedList\' object has no attribute \'all\'','1','1528891342');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('446','join','127.0.0.1','行为：菜单关联；错误：\'InstrumentedList\' object has no attribute \'all\'','1','1528891367');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('447','join','127.0.0.1','行为：菜单关联；错误：\'InstrumentedList\' object has no attribute \'all\'','1','1528891380');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('448','join','127.0.0.1','行为：菜单关联；错误：\'InstrumentedList\' object has no attribute \'all\'','1','1528891390');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('449','join','127.0.0.1','行为：菜单关联；错误：\'InstrumentedList\' object has no attribute \'all\'','1','1528891393');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('450','join','127.0.0.1','行为：菜单关联；错误：\'InstrumentedList\' object has no attribute \'all\'','1','1528891410');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('451','join','127.0.0.1','行为：菜单关联；错误：\'InstrumentedList\' object has no attribute \'all\'','1','1528891424');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('452','join','127.0.0.1','行为：菜单关联；错误：\'InstrumentedList\' object has no attribute \'all\'','1','1528891454');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('453','join','127.0.0.1','行为：菜单关联；错误：list index out of range','1','1528891505');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('454','join','127.0.0.1','行为：菜单关联；错误：list index out of range','1','1528891517');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('455','join','127.0.0.1','行为：菜单关联；错误：list index out of range','1','1528891534');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('456','join','127.0.0.1','行为：菜单关联；错误：list index out of range','1','1528891558');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('457','join','127.0.0.1','行为：菜单关联；错误：list index out of range','1','1528891585');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('458','join','127.0.0.1','行为：菜单关联；错误：list index out of range','1','1528891608');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('459','join','127.0.0.1','行为：菜单关联；错误：\'NoneType\' object is not subscriptable','1','1528891621');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('460','join','127.0.0.1','行为：菜单关联；错误：list index out of range','1','1528891854');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('461','join','127.0.0.1','行为：菜单关联；错误：\'Request\' object has no attribute \'menu_value\'','1','1528891870');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('462','join','127.0.0.1','行为：菜单关联；错误：\'Request\' object has no attribute \'menu_value\'','1','1528891880');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('463','join','127.0.0.1','行为：菜单关联；错误：\'Request\' object has no attribute \'menu_value\'','1','1528891892');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('464','join','127.0.0.1','行为：菜单关联；错误：\'Request\' object has no attribute \'menu_value\'','1','1528891900');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('465','join','127.0.0.1','行为：菜单关联；错误：list index out of range','1','1528891935');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('466','join','127.0.0.1','行为：菜单关联；错误：\'NoneType\' object is not subscriptable','1','1528891946');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('467','join','127.0.0.1','行为：菜单关联；错误：\'str\' object has no attribute \'read\'','1','1528893115');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('468','join','127.0.0.1','行为：菜单关联；错误：\'str\' object has no attribute \'read\'','1','1528893136');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('469','join','127.0.0.1','行为：菜单关联；错误：\'str\' object has no attribute \'read\'','1','1528893178');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('470','join','127.0.0.1','行为：菜单关联；错误：\'str\' object has no attribute \'read\'','1','1528893202');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('471','join','127.0.0.1','行为：菜单关联；错误：\'TermTaxonomy\' object has no attribute \'term_taxonomy\'','1','1528893427');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('472','join','127.0.0.1','行为：菜单关联；错误：\'TermTaxonomy\' object has no attribute \'term_taxonomy\'','1','1528893476');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('473','join','127.0.0.1','行为：菜单关联；错误：\'TermTaxonomy\' object has no attribute \'term_taxonomy\'','1','1528893489');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('474','join','127.0.0.1','行为：菜单关联；错误：\'TermTaxonomy\' object has no attribute \'term_taxonomy\'','1','1528893491');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('475','join','127.0.0.1','行为：菜单关联；错误：\'PostMeta\' object is not iterable','1','1528893505');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('476','join','127.0.0.1','行为：菜单关联；错误：\'PostMeta\' object is not iterable','1','1528893540');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('477','join','127.0.0.1','行为：菜单关联；错误：\'PostMeta\' object is not iterable','1','1528893563');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('478','join','127.0.0.1','行为：菜单关联；错误：\'PostMeta\' object is not iterable','1','1528893582');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('479','join','127.0.0.1','行为：菜单关联；错误：\'PostMeta\' object is not iterable','1','1528893594');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('480','join','127.0.0.1','行为：菜单关联；错误：\'str\' object has no attribute \'read\'','1','1528893616');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('481','join','127.0.0.1','行为：菜单关联；错误：\'str\' object has no attribute \'read\'','1','1528893631');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('482','join','127.0.0.1','行为：菜单关联；错误：\'str\' object has no attribute \'read\'','1','1528893646');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('483','join','127.0.0.1','行为：菜单关联；错误：\'str\' object has no attribute \'id\'','1','1528893690');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('484','join','127.0.0.1','行为：菜单关联；错误：\'dict\' object has no attribute \'value\'','1','1528893812');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('485','join','127.0.0.1','行为：菜单关联；错误：\'>\' not supported between instances of \'list\' and \'int\'','1','1528896135');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('486','join','127.0.0.1','行为：菜单关联；错误：\'list\' object has no attribute \'meta_key\'','1','1528943673');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('487','join','127.0.0.1','行为：菜单关联；错误：\'list\' object has no attribute \'all\'','1','1528943683');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('488','join','127.0.0.1','行为：菜单关联；错误：\'TermTaxonomy\' object has no attribute \'postmeta_menu_category\'','1','1528947609');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('489','add','127.0.0.1','添加菜单成功','1','1528956416');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('490','join','127.0.0.1','行为：取消菜单关联；错误：join() takes exactly one argument (3 given)','1','1528957769');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('491','join','127.0.0.1','行为：取消菜单关联；错误：join() takes exactly one argument (3 given)','1','1528957801');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('492','join','127.0.0.1','行为：取消菜单关联；错误：join() takes exactly one argument (3 given)','1','1528957850');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('493','join','127.0.0.1','行为：取消菜单关联；错误：join() takes exactly one argument (3 given)','1','1528957853');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('494','join','127.0.0.1','行为：取消菜单关联；错误：join() takes exactly one argument (3 given)','1','1528957857');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('495','join','127.0.0.1','行为：取消菜单关联；错误：join() takes exactly one argument (3 given)','1','1528957863');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('496','join','127.0.0.1','行为：取消菜单关联；错误：join() takes exactly one argument (3 given)','1','1528957913');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('497','join','127.0.0.1','行为：取消菜单关联；错误：join() takes exactly one argument (3 given)','1','1528958034');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('498','join','127.0.0.1','行为：取消菜单关联；错误：\'list\' object has no attribute \'terms\'','1','1528959384');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('499','add','127.0.0.1','修改文章成功','1','1528962605');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('500','edit','127.0.0.1','修改角色成功','2','1528962737');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('501','edit','127.0.0.1','修改角色成功','2','1528962753');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('502','add','127.0.0.1','修改文章成功','2','1528962758');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('503','add','127.0.0.1','添加菜单成功','2','1528963430');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('504','login','127.0.0.1','登录成功','1','1528963609');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('505','login','127.0.0.1','登录成功','2','1528963632');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('506','login','127.0.0.1','登录成功','1','1528963866');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('507','add','127.0.0.1','增加配置字段成功','2','1529029557');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('508','edit','127.0.0.1','修改配置字段成功','2','1529029584');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('509','add','127.0.0.1','增加配置字段成功','2','1529029655');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('510','edit','127.0.0.1','修改配置字段成功','2','1529030740');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('511','edit','127.0.0.1','修改配置字段成功','2','1529030881');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('512','add','127.0.0.1','增加配置字段成功','2','1529049622');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('513','add','127.0.0.1','修改文章成功','2','1529051648');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('514','edit','127.0.0.1','修改配置字段成功','2','1529051969');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('515','add','127.0.0.1','修改文章成功','2','1529054718');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('516','add','127.0.0.1','修改文章成功','2','1529054742');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('517','add','127.0.0.1','修改文章成功','2','1529054756');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('518','add','127.0.0.1','修改文章成功','2','1529054818');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('519','add','127.0.0.1','修改文章成功','2','1529054826');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('520','add','127.0.0.1','修改文章成功','2','1529056100');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('521','add','127.0.0.1','添加菜单成功','2','1529057442');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('522','edit','127.0.0.1','修改配置字段成功','2','1529057463');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('523','add','127.0.0.1','新增分类成功','2','1529057542');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('524','add','127.0.0.1','新增分类成功','2','1529057633');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('525','add','127.0.0.1','新增分类成功','2','1529057660');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('526','add','127.0.0.1','行为：新增分类；错误：别名长度必须为1-256位','2','1529057676');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('527','add','127.0.0.1','新增分类成功','2','1529057689');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('528','add','127.0.0.1','新增分类成功','2','1529057765');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('529','add','127.0.0.1','新增分类成功','2','1529057822');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('530','add','127.0.0.1','新增分类成功','2','1529057844');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('531','add','127.0.0.1','新增分类成功','2','1529057860');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('532','add','127.0.0.1','新增分类成功','2','1529057896');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('533','edit','127.0.0.1','修改配置字段成功','2','1529058098');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('534','add','127.0.0.1','增加文章成功','2','1529059564');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('535','add','127.0.0.1','添加标签成功','2','1529059687');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('536','add','127.0.0.1','修改文章成功','2','1529059695');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('537','backup','127.0.0.1','备份成功！','2','1529059897');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('538','edit','127.0.0.1','修改角色成功','2','1529063831');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('539','add','211.144.7.45','增加文章成功','2','1529091003');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('540','add','211.144.7.45','添加标签成功','2','1529091097');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('541','add','211.144.7.45','修改文章成功','2','1529091101');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('542','add','211.144.7.45','添加标签成功','2','1529091116');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('543','edit','211.144.7.45','修改标签成功','2','1529137122');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('544','upload','211.144.7.45','上传成功','2','1529137162');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('545','edit','211.144.7.45','行为：修改操作员；错误：密码不能为空','2','1529137164');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('546','edit','211.144.7.45','修改操作员成功','2','1529137170');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('547','edit','211.144.7.45','修改操作员成功','2','1529137223');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('548','edit','211.144.7.45','修改操作员成功','2','1529137238');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('549','login','211.144.7.45','登录成功','1','1529137398');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('550','login','211.144.7.45','登录成功','1','1529139890');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('551','add','211.144.7.45','添加标签成功','1','1529140024');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('552','add','211.144.7.45','增加文章成功','1','1529140031');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('553','add','211.144.7.45','增加文章成功','1','1529140933');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('554','backup','211.144.7.45','备份成功！','1','1529141088');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('555','add','211.144.7.45','修改文章成功','1','1529141315');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('556','add','211.144.7.45','修改文章成功','1','1529141337');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('557','add','211.144.7.45','修改文章成功','1','1529141337');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('558','download','211.144.7.45','下载备份成功','1','1529142453');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('559','download','211.144.7.45','下载备份成功','1','1529142455');
INSERT INTO `tb_log`(`id`,`log_type`,`ip`,`log_detail`,`admin_id`,`_create_time`)  VALUES ('560','backup','211.144.7.45','备份成功！','1','1529142461');
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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_postmeta
-- ----------------------------
INSERT INTO `tb_postmeta`(`id`,`meta_key`,`meta_value`)  VALUES ('1','termtaxonomy_menu_category_id','2');
INSERT INTO `tb_postmeta`(`id`,`meta_key`,`meta_value`)  VALUES ('2','termtaxonomy_menu_category_id','4');
INSERT INTO `tb_postmeta`(`id`,`meta_key`,`meta_value`)  VALUES ('12','feature_img_resources_posts_id','3');
INSERT INTO `tb_postmeta`(`id`,`meta_key`,`meta_value`)  VALUES ('13','termtaxonomy_category_posts_id','3');
INSERT INTO `tb_postmeta`(`id`,`meta_key`,`meta_value`)  VALUES ('6','feature_img_resources_posts_id','1');
INSERT INTO `tb_postmeta`(`id`,`meta_key`,`meta_value`)  VALUES ('7','termtaxonomy_category_posts_id','1');
INSERT INTO `tb_postmeta`(`id`,`meta_key`,`meta_value`)  VALUES ('8','termtaxonomy_label_posts_id','1');
INSERT INTO `tb_postmeta`(`id`,`meta_key`,`meta_value`)  VALUES ('9','feature_img_resources_posts_id','2');
INSERT INTO `tb_postmeta`(`id`,`meta_key`,`meta_value`)  VALUES ('10','termtaxonomy_category_posts_id','2');
INSERT INTO `tb_postmeta`(`id`,`meta_key`,`meta_value`)  VALUES ('11','termtaxonomy_label_posts_id','2');
INSERT INTO `tb_postmeta`(`id`,`meta_key`,`meta_value`)  VALUES ('14','termtaxonomy_label_posts_id','3');
INSERT INTO `tb_postmeta`(`id`,`meta_key`,`meta_value`)  VALUES ('15','feature_img_resources_posts_id','4');
INSERT INTO `tb_postmeta`(`id`,`meta_key`,`meta_value`)  VALUES ('16','termtaxonomy_category_posts_id','4');
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_posts
-- ----------------------------
INSERT INTO `tb_posts`(`id`,`post_author`,`_create_time`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`post_name`,`_update_time`,`menu_order`,`post_type`,`comment_count`)  VALUES ('1','2','1529059564','<p>
	<span style=\"color:\'rgba(0, 0, 0, 0.870588235294118)\';font-family:\'Microsoft Yahei, Helvetica Neue, Arial, Helvetica, sans-serif\';\"><span style=\"font-size:15.96px;background-color:#FFFFFF;\"></span></span>
</p>
<h4 style=\"white-space:normal;\">
	<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;background-color:#FFFFFF;\"><span style=\"font-family:KaiTi_GB2312;\"></span>简介：</span>
</h4>
<p>
	<br />
</p>
<p>
	<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\">PFCMS是一个免费开源的cms内容管理框架，是为了敏捷WEB应用开发和简化企业应用开发而诞生的。PFCMS从诞生以来一直秉承简洁实用的设计原则，在保持出色的性能和至简的代码的同时，也注重易用性。遵循</span><code style=\"box-sizing:inherit;-webkit-tap-highlight-color:transparent;text-size-adjust:none;-webkit-font-smoothing:antialiased;font-family:Consolas, &quot;Liberation Mono&quot;, Menlo, Courier, monospace;font-size:15.96px;display:inline-block;border-radius:4px;padding:2px 6px;background:#F9FAFA;word-break:break-all;white-space:pre;line-height:1.3;border:1px solid #DED9D9;margin:0px 5px;color:rgba(0, 0, 0, 0.87);\">Apache2</code><span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\">开源许可协议发布，意味着你可以免费使用<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\">PFCMS</span>，甚至允许把你基于<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\">PFCMS</span>开发的应用开源或商业产品发布/销售。</span>
</p>
<p>
	<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\"><br />
</span>
</p>
<h4>
	<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\">技术结构：</span>
</h4>
<p>
	<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\">PFCMS采用的是python3.6版本。</span></span>
</p>
<p>
	<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\">web开发框架采用的是flask。</span></span>
</p>
<p>
	<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\">数据表的设计部分借鉴的wordpress开源项目。</span></span>
</p>
<p>
	<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\">orm采用的</span>sqlalchemy关系模型系统。</span>
</p>
<p>
	<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\">前端主要采用的bootstrap框架，以及jQuery.pjax页面无刷新。</span>
</p>
<p>
	<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\">权限设计是rbac模式，本人从中进行了简化</span>
</p>
<p>
	<br />
</p>
<h4>
	<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\">面向人群：</span>
</h4>
<p>
	<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\">python web二次开发。</span>
</p>
<p>
	<span style=\"white-space:normal;\"></span><span style=\"white-space:normal;color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;background-color:#FFFFFF;\">学习python 以及flask框架的学习者</span>
</p>
<p>
	<br />
</p>
<h4>
	<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\">心得：</span>
</h4>
<p>
	<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\">作者本人长期从事的是PHP开发，php有很多优秀的开源项目。后面接触了python,于是抱着学习的目地。完成了PFCMS的开发。代码中有不合理的地方，可以及时反馈。</span>
</p>
<p>
	<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\"><span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\"><br />
</span></span>
</p>
<p>
	<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\"><a href=\"https://github.com/youyingxiang/yxx_admin.git\" target=\"_blank\"><span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\">github地址。</span>https://github.com/youyingxiang/yxx_admin.git</a><br />
</span>
</p>
<p>
	<br />
</p>
<p>
	<span style=\"color:rgba(0, 0, 0, 0.87);font-family:&quot;Microsoft Yahei&quot;, &quot;Helvetica Neue&quot;, Arial, Helvetica, sans-serif;font-size:15.96px;white-space:normal;background-color:#FFFFFF;\"><br />
</span>
</p>','PFCMS正式发布','2018年06-15 PFCMS正式发布','1','1','','1529059695','0','1','0');
INSERT INTO `tb_posts`(`id`,`post_author`,`_create_time`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`post_name`,`_update_time`,`menu_order`,`post_type`,`comment_count`)  VALUES ('2','2','1529091003','<h1 style=\"white-space:normal;margin-left:0px;color:#333333;font-family:&quot;&quot;;\">
	在开发机上的准备工作
</h1>
<p style=\"white-space:normal;\">
	<br />
</p>
<ol style=\"white-space:normal;font-size:16px;color:#333333;font-family:&quot;&quot;;\">
	<li style=\"font-size:inherit;\">
		确认项目没有bug。
	</li>
	<li style=\"font-size:inherit;\">
		<span style=\"font-family:&quot;font-size:16px;background-color:#FFFFFF;\">用</span>pip freeze &gt; requirements.txt<span style=\"font-family:&quot;font-size:16px;background-color:#FFFFFF;\">将当前环境的包导出到</span>requirements.txt<span style=\"font-family:&quot;font-size:16px;background-color:#FFFFFF;\">文件中，方便在部署的时候安装</span>
	</li>
	<li style=\"font-size:inherit;\">
		<span style=\"font-family:&quot;font-size:16px;background-color:#FFFFFF;\">将项目上传到服务器上的</span>/srv<span style=\"font-family:&quot;font-size:16px;background-color:#FFFFFF;\">目录下。这里以</span>git<span style=\"font-family:&quot;font-size:16px;background-color:#FFFFFF;\">的形势
		<ul style=\"font-family:&quot;background-color:#FFFFFF;\">
			<li style=\"font-size:inherit;\">
				git init
			</li>
			<li style=\"font-size:inherit;\">
				git remote add origin xxx.git
			</li>
			<li style=\"font-size:inherit;\">
				git add .
			</li>
			<li style=\"font-size:inherit;\">
				git commit -m \'first commit\'
			</li>
			<li style=\"font-size:inherit;\">
				git pull origin master --allow-unrelated-histories
			</li>
			<li style=\"font-size:inherit;\">
				git push origin master
			</li>
		</ul>
</span>
	</li>
</ol>
<h3 id=\"在服务器上的准备工作：\" style=\"white-space:normal;font-size:1.5em;color:#333333;font-family:&quot;&quot;;\">
	在服务器上的准备工作
</h3>
<p style=\"white-space:normal;\">
	<br />
</p>
<p style=\"white-space:normal;\">
	<span style=\"background-color:#FFFFFF;\"><span style=\"font-size:16px;\"></span></span>
</p>
<ol style=\"white-space:normal;font-size:16px;color:#333333;\">
	<li style=\"font-family:&quot;font-size:inherit;\">
		<span style=\"font-family:&quot;font-size:16px;background-color:#FFFFFF;\">安装好项目安装
		<ul style=\"font-family:&quot;background-color:#FFFFFF;\">
			<li style=\"font-size:inherit;\">
				sudo apt install python3
			</li>
			<li style=\"font-size:inherit;\">
				sudo apt install python3-pip
			</li>
			<li style=\"font-size:inherit;\">
				pip3 install --upgrade pip
			</li>
		</ul>
</span>
	</li>
	<li style=\"font-family:&quot;font-size:inherit;\">
		<span style=\"font-family:&quot;font-size:16px;background-color:#FFFFFF;\">virtualenv以及virutalenvwrapper。并创建虚拟环境用到的</span>Python
		<ul style=\"font-family:&quot;background-color:#FFFFFF;\">
			<li style=\"font-size:inherit;\">
				pip3 install virtualenv
			</li>
			<li style=\"font-size:inherit;\">
				pip3 install virtualenvwrapper
			</li>
			<li style=\"font-size:inherit;\">
				sudo apt install vim
			</li>
			<li style=\"font-size:inherit;\">
				vim ~/.bashrc 进入文件中，填入以下两行代码：
<pre>export WORKON_HOME=$HOME/.virtualenvs
  source /usr/local/bin/virtualenvwrapper.sh</pre>
			</li>
			<li style=\"font-size:inherit;\">
				source ~/.bashrc
			</li>
		</ul>
	</li>
	<li style=\"font-family:&quot;font-size:inherit;\">
		<span style=\"font-family:&quot;font-size:16px;background-color:#FFFFFF;\">创建虚拟环境
<pre>mkvirtualenv --python=/usr/bin/python3 zlbbs-env</pre>
</span>
	</li>
	<li style=\"font-family:&quot;font-size:inherit;\">
		<span style=\"font-family:&quot;font-size:16px;background-color:#FFFFFF;\">安装</span>git
<pre>sudo apt install git</pre>
	</li>
	<li style=\"font-family:&quot;font-size:inherit;\">
		<span style=\"font-family:&quot;font-size:16px;\">进入虚拟环境中，然后进入到项目所在目录，执行命令：pip install -r requirement.txt，安装好相应的包</span>
	</li>
	<li style=\"font-family:&quot;font-size:inherit;\">
		<span style=\"font-family:&quot;font-size:16px;\">在mysql数据库中，创建相应的数据库进行数据迁移</span>
	</li>
</ol>
<p style=\"white-space:normal;\">
	<span style=\"font-size:16px;\"><br />
</span>
</p>
<h3 id=\"安装uwsgi\" style=\"white-space:normal;font-size:1.5em;color:#333333;font-family:&quot;&quot;;\">
	安装uwsgi
</h3>
<ol style=\"white-space:normal;font-size:16px;color:#333333;font-family:&quot;&quot;;\">
	<li style=\"font-size:inherit;\">
		uwsgi是一个应用服务器，非静态文件的网络请求就必须通过他完成，他也可以充当静态文件服务器，但不是他的强项。uwsgi是使用python编写的，因此通过pip install uwsgi就可以了。(uwsgi必须安装在系统级别的Python环境中，不要安装到虚拟环境中)。
	</li>
	<li style=\"font-size:inherit;\">
		使用命令uwsgi --http :8000 --wsgi-file /srv/p1/app.py -callable app -H /root/.virtualenvs/p1-env。用uwsgi启动项目，如果能够在浏览器中访问到这个页面，说明uwsgi可以加载项目了。
	</li>
</ol>
<h3 id=\"编写uwsgi配置文件：\" style=\"white-space:normal;font-size:1.5em;color:#333333;font-family:&quot;&quot;;\">
	编写uwsgi配置文件：
</h3>
<p style=\"white-space:normal;\">
	<br />
</p>
<ol style=\"white-space:normal;font-size:16px;color:#333333;font-family:&quot;&quot;;\">
	<li style=\"font-size:inherit;\">
		在项目的路径下面，创建一个文件叫做uwsgi.ini的文件，然后填写以下代码：
<pre class=\"prettyprint lang-js\" style=\"padding:0.5em;border-width:0px 0px 0px 3px;border-top-style:initial;border-right-style:initial;border-bottom-style:initial;border-left-style:solid;border-top-color:initial;border-right-color:initial;border-bottom-color:initial;border-left-color:#CCCCCC;border-image:initial;font-size:17.6px;font-family:Consolas, Monaco, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace;margin-top:1em;margin-bottom:1em;\">[uwsgi]

# 必须全部为绝对路径
# 项目的路径
chdir           = /srv/p1
# 模块
module          = app
# Python虚拟环境的路径
home            = /root/.virtualenvs/p1-env

# 进程相关的设置
# 主进程
master          = true
# 最大数量的工作进程
processes       = 10
# socket文件路径，绝对路径
socket          = /srv/p1/uwsgi.sock
# wsgi文件
wsgi-file       = /srv/p1/app.py
# wsgi文件的app变量
callable        = app
# 设置socket的权限
chmod-socket    = 666
# 退出的时候是否清理环境
vacuum          = true</pre>
	</li>
</ol>
<p style=\"white-space:normal;\">
	<span style=\"font-size:16px;\"></span>
</p>
<p style=\"white-space:normal;font-size:1.5em;color:#333333;font-family:&quot;&quot;;\">
	&nbsp; &nbsp; &nbsp;<span style=\"font-family:&quot;font-size:16px;background-color:#FFFFFF;\">然后使用命令</span>uwsgi --ini uwsgi.ini<span style=\"font-family:&quot;font-size:16px;background-color:#FFFFFF;\">，看下是否还能启动这个项目。</span>
</p>
<h3 id=\"安装nginx：\" style=\"white-space:normal;font-size:1.5em;color:#333333;font-family:&quot;&quot;;\">
	安装nginx：
</h3>
<ol style=\"white-space:normal;font-size:16px;color:#333333;font-family:&quot;&quot;;\">
	<li style=\"font-size:inherit;\">
		nginx是一个web服务器。用来加载静态文件和接收http请求的。通过命令sudo apt install nginx即可安装。
	</li>
	<li style=\"font-size:inherit;\">
		nginx常用命令：
	</li>
	<ul style=\"font-size:inherit;\">
		<li style=\"font-size:inherit;\">
			启动nginx：service nginx start
		</li>
		<li style=\"font-size:inherit;\">
			关闭nginx：service nginx stop
		</li>
		<li style=\"font-size:inherit;\">
			重启nginx：service nginx restart
		</li>
	</ul>
</ol>
<p style=\"white-space:normal;\">
	<br />
</p>
<h3 id=\"编写nginx配置文件：\" style=\"white-space:normal;font-size:1.5em;color:#333333;font-family:&quot;&quot;;\">
	编写nginx配置文件：
</h3>
<p style=\"white-space:normal;\">
	<br />
</p>
<ol style=\"white-space:normal;font-size:16px;color:#333333;font-family:&quot;&quot;;\">
	<li style=\"font-size:inherit;\">
		<span style=\"font-family:&quot;font-size:16px;background-color:#FFFFFF;\">在</span>/etc/nginx/conf.d<span style=\"font-family:&quot;font-size:16px;background-color:#FFFFFF;\">目录下，新建一个文件，叫做p1</span>.conf<span style=\"font-family:&quot;font-size:16px;background-color:#FFFFFF;\">，然后将以下代码粘贴进去：
<pre class=\"prettyprint lang-bsh\" style=\"padding:0.5em;border-width:0px 0px 0px 3px;border-top-style:initial;border-right-style:initial;border-bottom-style:initial;border-left-style:solid;border-top-color:initial;border-right-color:initial;border-bottom-color:initial;border-left-color:#CCCCCC;border-image:initial;font-size:17.6px;font-family:Consolas, Monaco, &quot;Bitstream Vera Sans Mono&quot;, &quot;Courier New&quot;, Courier, monospace;margin-top:1em;margin-bottom:1em;\"># 配置服务器
server {
    # 监听的端口号
    listen      80;
    # 域名
    server_name www.xxx.com; 
    charset     utf-8;

    # 最大的文件上传尺寸
    client_max_body_size 75M;  

    # 静态文件访问的url
    location /static {
        # 静态文件地址
        alias /srv/p1/static; 
    }

    location / {
        uwsgi_pass  unix:///srv/p1/uwsgi.sock;
        # uwsgi_params文件地址
        include     /etc/nginx/uwsgi_params; 
    }
}</pre>
</span>
	</li>
</ol>
<p style=\"white-space:normal;\">
	<br />
</p>
<p style=\"white-space:normal;\">
	<br />
</p>
<span style=\"white-space:normal;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"white-space:normal;color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">写完配置文件后，为了测试配置文件是否设置成功，运行命令：</span><span style=\"white-space:normal;\">service nginx configtest</span><span style=\"white-space:normal;color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">，如果不报错，说明成功。 每次修改完了配置文件，都要记得运行</span><span style=\"white-space:normal;\">service nginx restart</span><span style=\"white-space:normal;color:#333333;font-family:&quot;font-size:16px;background-color:#FFFFFF;\">。</span><br style=\"white-space:normal;\" />
<p style=\"white-space:normal;\">
	<br />
</p>
<p style=\"white-space:normal;\">
	<span style=\"font-size:16px;\"><br />
</span>
</p>
<p style=\"white-space:normal;\">
	<br />
</p>
<p style=\"white-space:normal;\">
	<br />
</p>','PFCMS部署','PFCMS部署','1','1','','1529091101','0','1','0');
INSERT INTO `tb_posts`(`id`,`post_author`,`_create_time`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`post_name`,`_update_time`,`menu_order`,`post_type`,`comment_count`)  VALUES ('3','1','1529140031','<pre class=\"prettyprint lang-js\">project  应用部署目录
├─apps                     应用目录（可设置）
│  ├─admin				   后台模块文件目录
│  │  └─cotroller		   控制器文件目录       
│  │	 ├─form 		   表单验证文件目录
│  │	 ├─model		   数据库模型文件目录
│  │	 ├─__init__.py     python文件(可以方便引入库)
│  │	 ├─common.py       存放后台常用到的函数
│  │	 ├─config.py       后台参数配置文件
│  │	 ├─decorator.py    装饰器
│  │	 └─hooks.py        钩子文件 	
│  ├─common                前后台共用模块   
│  │   └─..				   目录结构同上
│  │ 
│  ├─home				   前台模块文件目录
│  │   └─..				   目录结构同上
│  └─__init__.py
├─log                      系统日志文件  
│
├─migrations               数据迁移文件
│
├─static                   静态资源文件
│
├─templates                模版文件
│
├─think					   存放写的一些拓展库
│   ├─library              工具包
│	│	├─bulid			   当前项目的目录结构就是这个包自动构建的，
│	│	│				   可以自动构建蓝图，代码部分自动生成,在我开发使用中尚未发现问题
│   │   ├─captche		   这是我参考PHP的验证类，构建的一个图形验证库
│   ├─baksql.py            数据库备份还原的类库
│   ├─functions.py         我把python的一些常用到函数按php函数的名称封装的库
│   └─restful.py           restful风格接口类库
│
├─venv                     编辑器自带的(无需关心)
├─app.py                   整个项目的主文件
├─config.py                配置文件
├─exts.py                  防止循环引用的一个文件
├─manage.py                项目管理文件，可执行脚本命令 数据迁移等
└─requirement.txt          pip拓展库  </pre>','PFCMS项目结构','flask 是一个轻量级的框架，整个项目的架构。我写了一个自动生存的工具，可以帮助开发者快速完成项目架构','1','1','','1529140031','1','1','0');
INSERT INTO `tb_posts`(`id`,`post_author`,`_create_time`,`post_content`,`post_title`,`post_excerpt`,`post_status`,`comment_status`,`post_name`,`_update_time`,`menu_order`,`post_type`,`comment_count`)  VALUES ('4','1','1529140933','<p>
	tb_admin:存储后台管理员
</p>
<p>
	tb_comment：存储用户评论
</p>
<p>
	tb_config_field：键值对的形式存储设置参数表
</p>
<p>
	tb_link:链接表
</p>
<p>
	tb_log：日志表
</p>
<p>
	tb_postmeta：插件表（其他表关联这个表在去和一些通用表进行多对多关联）
</p>
<p>
	tb_posts：文章表
</p>
<p>
	tb_resources：资源表
</p>
<p>
	tb_resources_relationships：资源对象关联表
</p>
<p>
	tb_role：角色表
</p>
<p>
	tb_role_admin：角色管理员关联表
</p>
<p>
	tb_term_relationships：与term 相关的对象关联表
</p>
<p>
	tb_term_taxonomy：存放菜单 分类 标签的元数据
</p>
<p>
	tb_terms：<span style=\"white-space:normal;\">存放菜单 分类 标签的拓展数据</span>
</p>
<p>
	<br />
</p>
<p>
</p>','PFCMS数据库结构','PFCMS数据库结构','1','1','','1529140933','1','1','0');
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_resources
-- ----------------------------
INSERT INTO `tb_resources`(`id`,`old_name`,`new_name`,`size`)  VALUES ('1','','','0');
INSERT INTO `tb_resources`(`id`,`old_name`,`new_name`,`size`)  VALUES ('2','','','0');
INSERT INTO `tb_resources`(`id`,`old_name`,`new_name`,`size`)  VALUES ('3','','','0');
INSERT INTO `tb_resources`(`id`,`old_name`,`new_name`,`size`)  VALUES ('4','','','0');
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
INSERT INTO `tb_resources_relationships`(`resources_id`,`object_id`)  VALUES ('1','6');
INSERT INTO `tb_resources_relationships`(`resources_id`,`object_id`)  VALUES ('2','9');
INSERT INTO `tb_resources_relationships`(`resources_id`,`object_id`)  VALUES ('3','12');
INSERT INTO `tb_resources_relationships`(`resources_id`,`object_id`)  VALUES ('4','15');
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
INSERT INTO `tb_role`(`id`,`role_name`,`role_type`,`describe`,`_role_pri`,`_create_time`)  VALUES ('2','普通管理员','2','管理网站','1,11,5,51,511,52,511,53,531,532,533,2,21,211,212,213,22,221,222,223,3,31,311,312,313,32,33,34,341,342,35,4,41,411,42,421,422,423','1528633466');
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
INSERT INTO `tb_term_relationships`(`term_taxonomy_id`,`object_id`)  VALUES ('1','1');
INSERT INTO `tb_term_relationships`(`term_taxonomy_id`,`object_id`)  VALUES ('1','2');
INSERT INTO `tb_term_relationships`(`term_taxonomy_id`,`object_id`)  VALUES ('2','7');
INSERT INTO `tb_term_relationships`(`term_taxonomy_id`,`object_id`)  VALUES ('3','7');
INSERT INTO `tb_term_relationships`(`term_taxonomy_id`,`object_id`)  VALUES ('5','10');
INSERT INTO `tb_term_relationships`(`term_taxonomy_id`,`object_id`)  VALUES ('6','13');
INSERT INTO `tb_term_relationships`(`term_taxonomy_id`,`object_id`)  VALUES ('7','16');
INSERT INTO `tb_term_relationships`(`term_taxonomy_id`,`object_id`)  VALUES ('11','8');
INSERT INTO `tb_term_relationships`(`term_taxonomy_id`,`object_id`)  VALUES ('12','11');
INSERT INTO `tb_term_relationships`(`term_taxonomy_id`,`object_id`)  VALUES ('14','14');
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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_term_taxonomy
-- ----------------------------
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('1','1','3','','0','0');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('2','2','1','','0','1');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('3','3','1','','2','1');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('4','4','1','','0','0');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('5','5','1','','4','1');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('6','6','1','','4','1');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('7','7','1','','4','1');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('8','8','1','','0','0');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('9','9','1','','0','0');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('10','10','1','','0','0');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('11','11','2','','0','1');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('12','12','2','','0','1');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('13','13','2','','0','0');
INSERT INTO `tb_term_taxonomy`(`id`,`term_id`,`taxonomy`,`img`,`parent`,`count`)  VALUES ('14','14','2','','0','1');
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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of tb_terms
-- ----------------------------
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('1','主菜单界面','主菜单界面','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('2','PF简介','PF简介','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('3','序言','序言','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('4','基础','基础','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('5','安装pfcms','安装pfcms','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('6','目录结构','目录结构','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('7','数据库结构','数据库结构','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('8','后台开发介绍','后台开发介绍','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('9','前台开发介绍','前台开发介绍','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('10','工具包介绍','工具包介绍','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('11','pfcms','pfcms','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('12','项目部署','项目部署','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('13','redis','redis','99');
INSERT INTO `tb_terms`(`id`,`name`,`slug`,`term_order`)  VALUES ('14','结构','结构','99');
