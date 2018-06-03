-- MySQL dump 10.13  Distrib 5.7.14, for Win32 (AMD64)
--
-- Host: localhost    Database: py_admin
-- ------------------------------------------------------
-- Server version	5.7.14-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('cf66c13e272b');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_admin`
--

DROP TABLE IF EXISTS `tb_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_admin`
--

LOCK TABLES `tb_admin` WRITE;
/*!40000 ALTER TABLE `tb_admin` DISABLE KEYS */;
INSERT INTO `tb_admin` VALUES (1,'yxx','pbkdf2:sha256:50000$2cYoOeQj$4e5b601033cd93cf7775fc634fedd24febc86ae0962acb1a7b5317fadd331928','/static/uploads/image/2018/6/3/1528018920.jpg','666666',1,1,1528044475,1527956548),(3,'test','pbkdf2:sha256:50000$II0medr6$fefc252fb793b17a7d6f7dfb9b2361867bf7de76f48044e269ec28b30667d6a1','/static/uploads/image/2018/6/3/1528021622.jpg','123456',1,1,1528045563,1528011755);
/*!40000 ALTER TABLE `tb_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_config_field`
--

DROP TABLE IF EXISTS `tb_config_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_config_field`
--

LOCK TABLES `tb_config_field` WRITE;
/*!40000 ALTER TABLE `tb_config_field` DISABLE KEYS */;
INSERT INTO `tb_config_field` VALUES (1,'11111111','image_size','上传图片大小','1024：1KB，1048576：1MB，5242880：5MB。建议不要超过1MB，避免图片上传失败',1,'text','',1527989310,'up',1),(2,'1111111','file_size','上传文件大小','1024：1KB，1048576：1MB，5242880：5MB。建议不要超过5MB，避免文件上传失败',2,'text','',1527989343,'up',1),(3,'jpg,gif,jpeg,png,bmp','image_format','上传图片格式','上传图片格式',3,'text','',1527989374,'up',1),(4,'doc,docx,xls,xlsx,ppt,pptx,txt,rar,zip,mp4,pdf','file_format','上传文件格式','上传文件格式',4,'text','',1527989398,'up',1),(5,'uploads','upload_path','文件上传目录','文件上传目录',5,'text','',1527989462,'up',1),(6,'','image_url','图片上传域名地址','图片上传域名地址，图片路径保存数据库是否带域名，不建议填写，除非很清楚怎么使用',6,'text','',1527989503,'up',1),(7,'yxx_admin1','title','网站标题','网站标题【title】',7,'text','',1527989551,'web',1),(8,'/static/uploads/image/2018/6/3/1528029860.jpg','logo','网站LOGO(68*34)','网站LOGO，一般用于导航或底部的LOGO图片',99,'image','',1527989600,'web',1),(9,'01212312','copyright','网站备案号','网站备案号',99,'text','',1527989642,'web',1),(11,'swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb,mp4','media_format','上传视音频格式','上传视音频格式',99,'text','',1528031937,'up',1),(12,'swf,flv','flash_format','上传Flash格式','上传Flash格式',99,'text','',1528031967,'up',1),(13,'11111111','media_size','上传音频大小','1024：1KB，1048576：1MB，5242880：5MB。建议不要超过5MB，避免音频上传失败',99,'text','',1528032165,'up',1),(14,'11111111','flash_size','上传flash大小','1024：1KB，1048576：1MB，5242880：5MB。建议不要超过5MB，避免上传失败',99,'text','',1528032209,'up',1),(15,'<img src=\"/static/uploads/image/2018/6/3/1528033481.jpg\" alt=\"\" />\n<hr />\n<p>\n	<a class=\"ke-insertfile\" href=\"/static/uploads/file/2018/6/3/1528033497.docx\" target=\"_blank\">/static/uploads/file/2018/6/3/1528033497.docx</a>\n</p>\n<p>\n	<embed src=\"/static/uploads/media/2018/6/3/1528033516.mp4\" type=\"video/x-ms-asf-plugin\" width=\"550\" height=\"400\" autostart=\"false\" loop=\"true\" />\n</p>','test','测试','测试',99,'content','',1528032241,'web',1);
/*!40000 ALTER TABLE `tb_config_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_log`
--

DROP TABLE IF EXISTS `tb_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_type` varchar(32) NOT NULL,
  `ip` varchar(64) NOT NULL,
  `log_detail` varchar(128) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `_create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=200 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_log`
--

LOCK TABLES `tb_log` WRITE;
/*!40000 ALTER TABLE `tb_log` DISABLE KEYS */;
INSERT INTO `tb_log` VALUES (1,'add','127.0.0.1','增加操作员失败',1,1527956477),(2,'add','127.0.0.1','增加角色成功',1,1527956507),(3,'add','127.0.0.1','增加角色成功',1,1527956524),(4,'add','127.0.0.1','增加操作员失败',1,1527956544),(5,'add','127.0.0.1','增加操作员成功',1,1527956548),(6,'add','127.0.0.1','增加配置字段成功',1,1527989311),(7,'add','127.0.0.1','增加配置字段成功',1,1527989343),(8,'add','127.0.0.1','增加配置字段成功',1,1527989374),(9,'add','127.0.0.1','增加配置字段成功',1,1527989398),(10,'edit','127.0.0.1','修改配置字段成功',1,1527989400),(11,'edit','127.0.0.1','修改配置字段成功',1,1527989403),(12,'edit','127.0.0.1','修改配置字段成功',1,1527989405),(13,'edit','127.0.0.1','修改配置字段成功',1,1527989409),(14,'edit','127.0.0.1','修改配置字段成功',1,1527989412),(15,'edit','127.0.0.1','修改配置字段成功',1,1527989414),(16,'add','127.0.0.1','增加配置字段成功',1,1527989462),(17,'edit','127.0.0.1','修改配置字段成功',1,1527989468),(18,'add','127.0.0.1','增加配置字段成功',1,1527989503),(19,'add','127.0.0.1','增加配置字段成功',1,1527989551),(20,'edit','127.0.0.1','修改配置字段成功',1,1527989557),(21,'edit','127.0.0.1','修改配置字段成功',1,1527989561),(22,'add','127.0.0.1','增加配置字段成功',1,1527989600),(23,'add','127.0.0.1','增加配置字段成功',1,1527989642),(24,'edit','127.0.0.1','修改操作员失败',1,1527993132),(25,'edit','127.0.0.1','修改配置字段成功',1,1527995065),(26,'edit','127.0.0.1','修改配置字段成功',1,1527995078),(27,'edit','127.0.0.1','修改配置字段成功',1,1527997382),(28,'edit','127.0.0.1','修改配置字段成功',1,1527997830),(29,'edit','127.0.0.1','修改配置字段成功',1,1527997867),(30,'edit','127.0.0.1','修改配置字段成功',1,1527997910),(31,'edit','127.0.0.1','修改配置字段成功',1,1527998208),(32,'edit','127.0.0.1','修改配置字段成功',1,1527999418),(33,'edit','127.0.0.1','修改配置字段成功',1,1527999515),(34,'edit','127.0.0.1','修改配置字段成功',1,1528000190),(35,'edit','127.0.0.1','修改配置字段成功',1,1528000284),(36,'edit','127.0.0.1','修改配置字段成功',1,1528000296),(37,'edit','127.0.0.1','修改配置字段成功',1,1528000547),(38,'add','127.0.0.1','删除日志成功',1,1528006328),(39,'add','127.0.0.1','删除日志成功',1,1528006333),(40,'login','127.0.0.1','登录成功',1,1528009653),(41,'login','127.0.0.1','登录成功',1,1528009911),(42,'login','127.0.0.1','登录成功',1,1528010078),(43,'login','127.0.0.1','登录成功',1,1528010221),(44,'login','127.0.0.1','登录成功',1,1528010477),(45,'login','127.0.0.1','登录成功',1,1528011493),(46,'add','127.0.0.1','增加操作员成功',1,1528011547),(47,'delete','127.0.0.1','删除操作员成功',1,1528011558),(48,'login','127.0.0.1','登录成功',1,1528011716),(49,'add','127.0.0.1','增加操作员成功',1,1528011755),(50,'edit','127.0.0.1','修改角色成功',1,1528011769),(51,'login','127.0.0.1','登录成功',1,1528011803),(52,'login','127.0.0.1','登录成功',1,1528011844),(53,'login','127.0.0.1','登录成功',1,1528011900),(54,'login','127.0.0.1','登录成功',1,1528016059),(55,'login','127.0.0.1','登录成功',1,1528016255),(56,'login','127.0.0.1','登录成功',1,1528016379),(57,'login','127.0.0.1','登录成功',1,1528016448),(58,'login','127.0.0.1','登录成功',1,1528016510),(59,'login','127.0.0.1','登录成功',1,1528017023),(60,'login','127.0.0.1','登录成功',1,1528017719),(61,'login','127.0.0.1','登录成功',1,1528017825),(62,'login','127.0.0.1','登录成功',1,1528018097),(63,'login','127.0.0.1','登录成功',1,1528018127),(64,'add','127.0.0.1','删除日志成功',1,1528018138),(65,'add','127.0.0.1','删除日志成功',1,1528018138),(66,'login','127.0.0.1','登录成功',1,1528018209),(67,'login','127.0.0.1','登录成功',1,1528018265),(68,'edit','127.0.0.1','修改角色失败',1,1528018365),(69,'edit','127.0.0.1','修改角色成功',1,1528018368),(70,'edit','127.0.0.1','修改角色成功',1,1528018376),(71,'login','127.0.0.1','登录成功',1,1528018806),(72,'login','127.0.0.1','登录成功',3,1528019219),(73,'login','127.0.0.1','登录成功',1,1528019243),(74,'login','127.0.0.1','登录成功',1,1528020706),(75,'login','127.0.0.1','登录成功',1,1528020757),(76,'login','127.0.0.1','登录成功',1,1528021100),(77,'edit','127.0.0.1','修改角色成功',1,1528021578),(78,'login','127.0.0.1','登录成功',3,1528021599),(79,'edit','127.0.0.1','修改操作员失败',3,1528021625),(80,'login','127.0.0.1','登录成功',1,1528022115),(81,'edit','127.0.0.1','修改角色成功',1,1528022123),(82,'login','127.0.0.1','登录成功',3,1528022198),(83,'login','127.0.0.1','登录成功',3,1528022358),(84,'login','127.0.0.1','登录成功',1,1528022533),(85,'login','127.0.0.1','登录成功',1,1528022609),(86,'login','127.0.0.1','登录成功',1,1528022884),(87,'login','127.0.0.1','登录成功',1,1528022971),(88,'login','127.0.0.1','登录成功',1,1528023338),(89,'login','127.0.0.1','登录成功',3,1528023365),(90,'login','127.0.0.1','登录成功',1,1528026023),(91,'login','127.0.0.1','登录成功',1,1528026145),(92,'login','127.0.0.1','登录成功',1,1528026302),(93,'login','127.0.0.1','登录成功',1,1528026644),(94,'login','127.0.0.1','登录成功',1,1528026967),(95,'login','127.0.0.1','登录成功',1,1528027218),(96,'delete','127.0.0.1','修改配置字段失败',1,1528027240),(97,'delete','127.0.0.1','修改配置字段失败',1,1528027250),(98,'delete','127.0.0.1','修改配置字段失败',1,1528027275),(99,'delete','127.0.0.1','修改配置字段失败',1,1528027289),(100,'login','127.0.0.1','登录成功',1,1528027357),(101,'delete','127.0.0.1','修改配置字段失败',1,1528027364),(102,'delete','127.0.0.1','修改配置字段失败',1,1528027373),(103,'login','127.0.0.1','登录成功',1,1528027462),(104,'delete','127.0.0.1','修改配置字段失败',1,1528027467),(105,'delete','127.0.0.1','修改配置字段失败',1,1528027473),(106,'delete','127.0.0.1','修改配置字段失败',1,1528027476),(107,'delete','127.0.0.1','修改配置字段失败',1,1528027480),(108,'delete','127.0.0.1','修改配置字段失败',1,1528027483),(109,'login','127.0.0.1','登录成功',1,1528027656),(110,'delete','127.0.0.1','修改配置字段失败',1,1528027663),(111,'login','127.0.0.1','登录成功',1,1528027781),(112,'delete','127.0.0.1','修改配置字段失败',1,1528027797),(113,'delete','127.0.0.1','修改配置字段失败',1,1528027950),(114,'delete','127.0.0.1','修改配置字段失败',1,1528028021),(115,'delete','127.0.0.1','修改配置字段成功',1,1528028051),(116,'delete','127.0.0.1','修改配置字段成功',1,1528028106),(117,'delete','127.0.0.1','修改配置字段成功',1,1528028219),(118,'delete','127.0.0.1','修改配置字段失败',1,1528028248),(119,'delete','127.0.0.1','修改配置字段失败',1,1528028281),(120,'delete','127.0.0.1','修改配置字段失败',1,1528028369),(121,'delete','127.0.0.1','修改配置字段失败',1,1528028381),(122,'delete','127.0.0.1','修改配置字段成功',1,1528028394),(123,'delete','127.0.0.1','修改配置字段失败',1,1528028705),(124,'delete','127.0.0.1','修改配置字段失败',1,1528028730),(125,'delete','127.0.0.1','修改配置字段失败',1,1528028778),(126,'delete','127.0.0.1','修改配置字段失败',1,1528028810),(127,'delete','127.0.0.1','修改配置字段失败',1,1528028847),(128,'delete','127.0.0.1','修改配置字段失败',1,1528028911),(129,'delete','127.0.0.1','修改配置字段成功',1,1528028978),(130,'delete','127.0.0.1','修改配置字段成功',1,1528029076),(131,'delete','127.0.0.1','修改配置字段成功',1,1528029091),(132,'delete','127.0.0.1','修改配置字段成功',1,1528029169),(133,'delete','127.0.0.1','修改配置字段成功',1,1528029190),(134,'delete','127.0.0.1','修改配置字段成功',1,1528029192),(135,'delete','127.0.0.1','修改配置字段成功',1,1528029196),(136,'delete','127.0.0.1','修改配置字段成功',1,1528029200),(137,'delete','127.0.0.1','修改配置字段成功',1,1528029227),(138,'delete','127.0.0.1','修改配置字段成功',1,1528029233),(139,'delete','127.0.0.1','修改配置字段成功',1,1528029237),(140,'delete','127.0.0.1','修改配置字段成功',1,1528029360),(141,'delete','127.0.0.1','修改配置字段成功',1,1528029865),(142,'add','127.0.0.1','增加配置字段成功',1,1528029996),(143,'edit','127.0.0.1','修改配置字段成功',1,1528030037),(144,'edit','127.0.0.1','修改配置字段成功',1,1528030069),(145,'edit','127.0.0.1','修改配置字段成功',1,1528030110),(146,'edit','127.0.0.1','修改配置字段成功',1,1528030123),(147,'edit','127.0.0.1','修改配置字段成功',1,1528030184),(148,'edit','127.0.0.1','修改配置字段成功',1,1528030378),(149,'delete','127.0.0.1','删除配置字段成功',1,1528031904),(150,'add','127.0.0.1','增加配置字段成功',1,1528031937),(151,'add','127.0.0.1','增加配置字段成功',1,1528031967),(152,'add','127.0.0.1','增加配置字段成功',1,1528032165),(153,'add','127.0.0.1','增加配置字段成功',1,1528032209),(154,'add','127.0.0.1','增加配置字段成功',1,1528032241),(155,'delete','127.0.0.1','修改配置字段成功',1,1528032327),(156,'delete','127.0.0.1','修改配置字段成功',1,1528033531),(157,'login','127.0.0.1','登录成功',1,1528034375),(158,'edit','127.0.0.1','修改角色成功',1,1528034393),(159,'login','127.0.0.1','登录成功',3,1528034410),(160,'login','127.0.0.1','登录成功',3,1528034926),(161,'login','127.0.0.1','登录成功',3,1528034991),(162,'login','127.0.0.1','登录成功',3,1528035684),(163,'edit','127.0.0.1','修改角色成功',3,1528035699),(164,'edit','127.0.0.1','修改角色成功',3,1528035713),(165,'login','127.0.0.1','登录成功',3,1528038526),(166,'login','127.0.0.1','登录成功',3,1528038580),(167,'login','127.0.0.1','登录成功',1,1528038658),(168,'login','127.0.0.1','登录成功',1,1528038845),(169,'login','127.0.0.1','登录成功',3,1528038863),(170,'login','127.0.0.1','登录成功',3,1528039213),(171,'edit','127.0.0.1','修改角色成功',3,1528039228),(172,'edit','127.0.0.1','修改角色成功',3,1528039244),(173,'edit','127.0.0.1','修改角色成功',3,1528039270),(174,'edit','127.0.0.1','修改角色成功',3,1528039303),(175,'login','127.0.0.1','登录成功',1,1528040833),(176,'login','127.0.0.1','登录成功',1,1528040878),(177,'delete','127.0.0.1','修改配置字段成功',1,1528040908),(178,'login','127.0.0.1','登录成功',3,1528041003),(179,'edit','127.0.0.1','修改角色成功',3,1528041018),(180,'edit','127.0.0.1','修改角色成功',3,1528041033),(181,'login','127.0.0.1','登录成功',3,1528041221),(182,'login','127.0.0.1','登录成功',3,1528041265),(183,'delete','127.0.0.1','修改配置字段成功',3,1528041286),(184,'delete','127.0.0.1','修改配置字段成功',3,1528041300),(185,'login','127.0.0.1','登录成功',3,1528041405),(186,'edit','127.0.0.1','修改角色成功',3,1528041419),(187,'edit','127.0.0.1','修改配置字段成功',3,1528041424),(188,'delete','127.0.0.1','修改配置字段成功',3,1528041430),(189,'delete','127.0.0.1','修改配置字段成功',3,1528041433),(190,'login','127.0.0.1','登录成功',3,1528042456),(191,'login','127.0.0.1','登录成功',3,1528042653),(192,'delete','127.0.0.1','修改配置字段成功',3,1528042826),(193,'login','127.0.0.1','登录成功',1,1528044105),(194,'login','127.0.0.1','登录成功',1,1528044475),(195,'login','127.0.0.1','登录成功',3,1528044539),(196,'login','127.0.0.1','登录成功',3,1528044787),(197,'login','127.0.0.1','登录成功',3,1528044836),(198,'login','127.0.0.1','登录成功',3,1528045453),(199,'login','127.0.0.1','登录成功',3,1528045563);
/*!40000 ALTER TABLE `tb_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role`
--

DROP TABLE IF EXISTS `tb_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  `role_type` smallint(6) NOT NULL,
  `describe` text,
  `_role_pri` text,
  `_create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role`
--

LOCK TABLES `tb_role` WRITE;
/*!40000 ALTER TABLE `tb_role` DISABLE KEYS */;
INSERT INTO `tb_role` VALUES (1,'超管',1,'最高管理员','',1527956507),(2,'普管',2,'普通管理员','1,11,2,21,211,212,213,22,221,222,223,3,31,311,312,313,32,33,34,341',1527956524);
/*!40000 ALTER TABLE `tb_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_role_admin`
--

DROP TABLE IF EXISTS `tb_role_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_role_admin` (
  `role_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`admin_id`),
  KEY `admin_id` (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_role_admin`
--

LOCK TABLES `tb_role_admin` WRITE;
/*!40000 ALTER TABLE `tb_role_admin` DISABLE KEYS */;
INSERT INTO `tb_role_admin` VALUES (1,1),(2,2),(2,3);
/*!40000 ALTER TABLE `tb_role_admin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-04  1:55:46
