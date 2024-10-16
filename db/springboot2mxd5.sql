-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: springboot2mxd5
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Current Database: `springboot2mxd5`
--

/*!40000 DROP DATABASE IF EXISTS `springboot2mxd5`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `springboot2mxd5` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `springboot2mxd5`;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','upload/picture1.jpg'),(2,'picture2','upload/picture2.jpg'),(3,'picture3','upload/picture3.jpg');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danweizuzhi`
--

DROP TABLE IF EXISTS `danweizuzhi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `danweizuzhi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `yonghuzu` varchar(200) DEFAULT NULL COMMENT '用户组',
  `danweimingcheng` varchar(200) DEFAULT NULL COMMENT '单位名称',
  `danweileixing` varchar(200) DEFAULT NULL COMMENT '单位类型',
  `danweiweizhi` varchar(200) DEFAULT NULL COMMENT '单位位置',
  `danweitupian` longtext COMMENT '单位图片',
  `suoshuguanxi` varchar(200) DEFAULT NULL COMMENT '所属关系',
  `macdizhi` varchar(200) DEFAULT NULL COMMENT 'mac地址',
  `dengjiriqi` date DEFAULT NULL COMMENT '登记日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1672307103221 DEFAULT CHARSET=utf8 COMMENT='单位组织';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danweizuzhi`
--

LOCK TABLES `danweizuzhi` WRITE;
/*!40000 ALTER TABLE `danweizuzhi` DISABLE KEYS */;
INSERT INTO `danweizuzhi` VALUES (51,'2022-12-29 09:38:15','用户账号1','用户姓名1','用户组1','单位名称1','小型','单位位置1','upload/danweizuzhi_danweitupian1.jpg,upload/danweizuzhi_danweitupian2.jpg,upload/danweizuzhi_danweitupian3.jpg','所属关系1','mac地址1','2022-12-29'),(52,'2022-12-29 09:38:15','用户账号2','用户姓名2','用户组2','单位名称2','小型','单位位置2','upload/danweizuzhi_danweitupian2.jpg,upload/danweizuzhi_danweitupian3.jpg,upload/danweizuzhi_danweitupian4.jpg','所属关系2','mac地址2','2022-12-29'),(53,'2022-12-29 09:38:15','用户账号3','用户姓名3','用户组3','单位名称3','小型','单位位置3','upload/danweizuzhi_danweitupian3.jpg,upload/danweizuzhi_danweitupian4.jpg,upload/danweizuzhi_danweitupian5.jpg','所属关系3','mac地址3','2022-12-29'),(54,'2022-12-29 09:38:15','用户账号4','用户姓名4','用户组4','单位名称4','小型','单位位置4','upload/danweizuzhi_danweitupian4.jpg,upload/danweizuzhi_danweitupian5.jpg,upload/danweizuzhi_danweitupian6.jpg','所属关系4','mac地址4','2022-12-29'),(55,'2022-12-29 09:38:15','用户账号5','用户姓名5','用户组5','单位名称5','小型','单位位置5','upload/danweizuzhi_danweitupian5.jpg,upload/danweizuzhi_danweitupian6.jpg,upload/danweizuzhi_danweitupian7.jpg','所属关系5','mac地址5','2022-12-29'),(56,'2022-12-29 09:38:15','用户账号6','用户姓名6','用户组6','单位名称6','小型','单位位置6','upload/danweizuzhi_danweitupian6.jpg,upload/danweizuzhi_danweitupian7.jpg,upload/danweizuzhi_danweitupian8.jpg','所属关系6','mac地址6','2022-12-29'),(57,'2022-12-29 09:38:15','用户账号7','用户姓名7','用户组7','单位名称7','小型','单位位置7','upload/danweizuzhi_danweitupian7.jpg,upload/danweizuzhi_danweitupian8.jpg,upload/danweizuzhi_danweitupian9.jpg','所属关系7','mac地址7','2022-12-29'),(58,'2022-12-29 09:38:15','用户账号8','用户姓名8','用户组8','单位名称8','小型','单位位置8','upload/danweizuzhi_danweitupian8.jpg,upload/danweizuzhi_danweitupian9.jpg,upload/danweizuzhi_danweitupian10.jpg','所属关系8','mac地址8','2022-12-29'),(1672307103220,'2022-12-29 09:45:02','3','3','个人','单位111','小型','xxx','upload/1672307092108.jpg','合作','12.12.1111','2022-12-29');
/*!40000 ALTER TABLE `danweizuzhi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jieruguanli`
--

DROP TABLE IF EXISTS `jieruguanli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jieruguanli` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jieruzhanghao` varchar(200) NOT NULL COMMENT '接入账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `jieruxingming` varchar(200) DEFAULT NULL COMMENT '接入姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `dianhua` varchar(200) DEFAULT NULL COMMENT '电话',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `guanlifanwei` varchar(200) DEFAULT NULL COMMENT '管理范围',
  `touxiang` longtext COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jieruzhanghao` (`jieruzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1672306937719 DEFAULT CHARSET=utf8 COMMENT='接入管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jieruguanli`
--

LOCK TABLES `jieruguanli` WRITE;
/*!40000 ALTER TABLE `jieruguanli` DISABLE KEYS */;
INSERT INTO `jieruguanli` VALUES (21,'2022-12-29 09:38:15','接入账号1','123456','接入姓名1','男','13823888881','773890001@qq.com','管理范围1','upload/jieruguanli_touxiang1.jpg'),(22,'2022-12-29 09:38:15','接入账号2','123456','接入姓名2','男','13823888882','773890002@qq.com','管理范围2','upload/jieruguanli_touxiang2.jpg'),(23,'2022-12-29 09:38:15','接入账号3','123456','接入姓名3','男','13823888883','773890003@qq.com','管理范围3','upload/jieruguanli_touxiang3.jpg'),(24,'2022-12-29 09:38:15','接入账号4','123456','接入姓名4','男','13823888884','773890004@qq.com','管理范围4','upload/jieruguanli_touxiang4.jpg'),(25,'2022-12-29 09:38:15','接入账号5','123456','接入姓名5','男','13823888885','773890005@qq.com','管理范围5','upload/jieruguanli_touxiang5.jpg'),(26,'2022-12-29 09:38:15','接入账号6','123456','接入姓名6','男','13823888886','773890006@qq.com','管理范围6','upload/jieruguanli_touxiang6.jpg'),(27,'2022-12-29 09:38:15','接入账号7','123456','接入姓名7','男','13823888887','773890007@qq.com','管理范围7','upload/jieruguanli_touxiang7.jpg'),(28,'2022-12-29 09:38:15','接入账号8','123456','接入姓名8','男','13823888888','773890008@qq.com','管理范围8','upload/jieruguanli_touxiang8.jpg'),(1672306937718,'2022-12-29 09:42:17','2','2','2','男','13012312311','222@qq.com','北京','upload/1672306936887.jpeg');
/*!40000 ALTER TABLE `jieruguanli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,1,'admin','users','管理员','gm2d1zfpjklovb0380nm74cu6o82p8sa','2022-12-29 09:39:18','2022-12-29 10:41:00'),(2,1672306900696,'1','yunyingshangguan','运营商管','xf99mcdnxf12bt2x0m50f31rmnhjcez2','2022-12-29 09:41:56','2022-12-29 10:41:57'),(3,1672306937718,'2','jieruguanli','接入管理','mdy1gystahp86ny159e4xolln3feibkq','2022-12-29 09:42:32','2022-12-29 10:43:54'),(4,1672307000319,'3','yonghu','用户','zbht44k3jeji8qbrxfnvd722h1kxdlpg','2022-12-29 09:45:12','2022-12-29 10:45:12');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','管理员','2022-12-29 09:38:15');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) NOT NULL COMMENT '用户账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `yonghuxingming` varchar(200) DEFAULT NULL COMMENT '用户姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `dianhua` varchar(200) DEFAULT NULL COMMENT '电话',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `zhuzhi` varchar(200) DEFAULT NULL COMMENT '住址',
  `ipdizhi` varchar(200) DEFAULT NULL COMMENT 'ip地址',
  `yonghuzu` varchar(200) DEFAULT NULL COMMENT '用户组',
  `yonghuleixing` varchar(200) DEFAULT NULL COMMENT '用户类型',
  `touxiang` longtext COMMENT '头像',
  `sfsh` varchar(200) DEFAULT '待审核' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1672307000320 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (31,'2022-12-29 09:38:15','用户账号1','123456','用户姓名1','男','13823888881','773890001@qq.com','住址1','ip地址1','用户组1','普通用户','upload/yonghu_touxiang1.jpg','是',''),(32,'2022-12-29 09:38:15','用户账号2','123456','用户姓名2','男','13823888882','773890002@qq.com','住址2','ip地址2','用户组2','普通用户','upload/yonghu_touxiang2.jpg','是',''),(33,'2022-12-29 09:38:15','用户账号3','123456','用户姓名3','男','13823888883','773890003@qq.com','住址3','ip地址3','用户组3','普通用户','upload/yonghu_touxiang3.jpg','是',''),(34,'2022-12-29 09:38:15','用户账号4','123456','用户姓名4','男','13823888884','773890004@qq.com','住址4','ip地址4','用户组4','普通用户','upload/yonghu_touxiang4.jpg','是',''),(35,'2022-12-29 09:38:15','用户账号5','123456','用户姓名5','男','13823888885','773890005@qq.com','住址5','ip地址5','用户组5','普通用户','upload/yonghu_touxiang5.jpg','是',''),(36,'2022-12-29 09:38:15','用户账号6','123456','用户姓名6','男','13823888886','773890006@qq.com','住址6','ip地址6','用户组6','普通用户','upload/yonghu_touxiang6.jpg','是',''),(37,'2022-12-29 09:38:15','用户账号7','123456','用户姓名7','男','13823888887','773890007@qq.com','住址7','ip地址7','用户组7','普通用户','upload/yonghu_touxiang7.jpg','是',''),(38,'2022-12-29 09:38:15','用户账号8','123456','用户姓名8','男','13823888888','773890008@qq.com','住址8','ip地址8','用户组8','普通用户','upload/yonghu_touxiang8.jpg','是',''),(1672307000319,'2022-12-29 09:43:20','3','3','3','男','13012312311','222@qq.com','xxx','12.121.121','个人','认证用户','upload/1672306998702.jpeg','是','1');
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghuzu`
--

DROP TABLE IF EXISTS `yonghuzu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghuzu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzu` varchar(200) DEFAULT NULL COMMENT '用户组',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzu` (`yonghuzu`)
) ENGINE=InnoDB AUTO_INCREMENT=1672306963194 DEFAULT CHARSET=utf8 COMMENT='用户组';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghuzu`
--

LOCK TABLES `yonghuzu` WRITE;
/*!40000 ALTER TABLE `yonghuzu` DISABLE KEYS */;
INSERT INTO `yonghuzu` VALUES (41,'2022-12-29 09:38:15','用户组1'),(42,'2022-12-29 09:38:15','用户组2'),(43,'2022-12-29 09:38:15','用户组3'),(44,'2022-12-29 09:38:15','用户组4'),(45,'2022-12-29 09:38:15','用户组5'),(46,'2022-12-29 09:38:15','用户组6'),(47,'2022-12-29 09:38:15','用户组7'),(48,'2022-12-29 09:38:15','一组'),(1672306963193,'2022-12-29 09:42:42','个人');
/*!40000 ALTER TABLE `yonghuzu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yunyingshangguan`
--

DROP TABLE IF EXISTS `yunyingshangguan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yunyingshangguan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yunyingzhanghao` varchar(200) NOT NULL COMMENT '运营账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `yunyingxingming` varchar(200) DEFAULT NULL COMMENT '运营姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `dianhua` varchar(200) DEFAULT NULL COMMENT '电话',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `touxiang` longtext COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yunyingzhanghao` (`yunyingzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=1672306900697 DEFAULT CHARSET=utf8 COMMENT='运营商管';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yunyingshangguan`
--

LOCK TABLES `yunyingshangguan` WRITE;
/*!40000 ALTER TABLE `yunyingshangguan` DISABLE KEYS */;
INSERT INTO `yunyingshangguan` VALUES (11,'2022-12-29 09:38:15','运营账号1','123456','运营姓名1','男','13823888881','773890001@qq.com','upload/yunyingshangguan_touxiang1.jpg'),(12,'2022-12-29 09:38:15','运营账号2','123456','运营姓名2','男','13823888882','773890002@qq.com','upload/yunyingshangguan_touxiang2.jpg'),(13,'2022-12-29 09:38:15','运营账号3','123456','运营姓名3','男','13823888883','773890003@qq.com','upload/yunyingshangguan_touxiang3.jpg'),(14,'2022-12-29 09:38:15','运营账号4','123456','运营姓名4','男','13823888884','773890004@qq.com','upload/yunyingshangguan_touxiang4.jpg'),(15,'2022-12-29 09:38:15','运营账号5','123456','运营姓名5','男','13823888885','773890005@qq.com','upload/yunyingshangguan_touxiang5.jpg'),(16,'2022-12-29 09:38:15','运营账号6','123456','运营姓名6','男','13823888886','773890006@qq.com','upload/yunyingshangguan_touxiang6.jpg'),(17,'2022-12-29 09:38:15','运营账号7','123456','运营姓名7','男','13823888887','773890007@qq.com','upload/yunyingshangguan_touxiang7.jpg'),(18,'2022-12-29 09:38:15','运营账号8','123456','运营姓名8','男','13823888888','773890008@qq.com','upload/yunyingshangguan_touxiang8.jpg'),(1672306900696,'2022-12-29 09:41:40','1','1','1','男','13012312311','222@qq.com','upload/1672306899829.jpeg');
/*!40000 ALTER TABLE `yunyingshangguan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-04 17:37:46
