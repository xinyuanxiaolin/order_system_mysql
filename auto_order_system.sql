-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: auto_order_system
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table ` notice`
--

DROP TABLE IF EXISTS ` notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE ` notice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '内容',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布时间',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '发布人',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '封面',
  `type` int DEFAULT NULL COMMENT '1-简单的公告，2富文本',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table ` notice`
--

LOCK TABLES ` notice` WRITE;
/*!40000 ALTER TABLE ` notice` DISABLE KEYS */;
INSERT INTO ` notice` VALUES (11,'就是admin','adminadminadminadminadminadmin','2022-09-03 16:10:44','admin00',NULL,1);
/*!40000 ALTER TABLE ` notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dish_id` int DEFAULT NULL COMMENT '菜品id',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `num` int DEFAULT NULL COMMENT '数量',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `dish_user_id` (`dish_id`,`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (5,1,1,2,'2022-08-11 16:26:18'),(6,1,4,1,'2022-08-11 16:30:00');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '分类名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `is_delete` int DEFAULT '0' COMMENT '是否删除（ 0 ：未删除 1：删除 ）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='菜品及套餐分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'家常','2022-09-13 06:44:30',0),(2,'轻奢','2022-09-13 06:45:15',0),(3,'特色','2022-09-13 06:45:29',0),(4,'饮品','2022-09-13 06:45:39',0),(5,'主食','2022-09-13 06:45:52',0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '菜品名称',
  `category_id` int DEFAULT NULL COMMENT '菜品分类id',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品价格',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '商品码',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '图片',
  `description` varchar(400) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '描述信息',
  `status` int DEFAULT '1' COMMENT '0 停售 1 起售',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '自动生成',
  `is_deleted` int DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_category_id` (`category_id`) USING BTREE,
  CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='菜品管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'炒菜花',1,5.00,NULL,'http://localhost:9090/file/b1e8bdbe3882483c912023856164fafd.png','一道经典美味',1,'2022-09-13 07:48:52',0),(2,'番茄炒蛋',1,8.90,NULL,'http://localhost:9090/file/1251e90bdf2a4cfbb807bcba5e9f8498.png','家常味道,选用优质西红柿和鸡蛋,色泽黄亮,酸甜可口!',1,'2022-09-13 08:18:50',0),(3,'苦瓜炒蛋',1,5.88,NULL,'http://localhost:9090/file/63ae4e53d7284e54a4b32cbda4ae915d.png','苦瓜,鸡蛋,大米',1,'2022-09-13 08:21:43',0),(4,'卤豆干',1,1.50,NULL,'http://localhost:9090/file/8d3ae09e096240248e1015b3a9cb488c.png','原料:豆干',1,'2022-09-13 08:22:48',0),(5,'芹菜炒牛肉',1,16.00,NULL,'http://localhost:9090/file/5ebc607b05d24bcb844cb83861f1d302.jpeg','原料:猪肉,大米,芹菜茎',1,'2022-09-13 08:24:48',0),(6,'糖醋排骨',1,13.90,NULL,'http://localhost:9090/file/b268104280814ad2a671aa207da868e3.jpeg','以前陪我看月亮的时候叫人家小甜甜,现在新人胜旧人,叫人家牛夫人',1,'2022-09-13 08:33:34',0),(7,'佛跳墙',2,158.00,NULL,'http://localhost:9090/file/f5166c7ddafe4dcd9d22f1b3461e07ae.png','鲍鱼,海参,鱼唇等汇聚到一起,加入鲍汁,文火煨制而成,成菜后,软嫩柔润,让你感受宫廷御宴',1,'2022-09-13 08:42:26',0),(8,'龙虾',2,200.00,NULL,'http://localhost:9090/file/67c1151a84804a18aba5867ad66b457b.png','活灵活现的大龙虾',1,'2022-09-13 08:45:25',0),(9,'蟹黄粉丝',2,300.00,NULL,'http://localhost:9090/file/a56b8bcf79e24a7c8c82a7e68a4746fd.png','非常好吃',1,'2022-09-13 08:46:06',0),(10,'福鼎肉片',3,20.00,NULL,'http://localhost:9090/file/a5734a71fbf74739a1366b9816aaaf29.png','好吃',1,'2022-09-13 08:48:27',0),(11,'洪濑鸡爪',3,30.00,NULL,'http://localhost:9090/file/74da829e4263436f8a8622527d64a805.png','好吃',1,'2022-09-13 08:48:56',0),(12,'手工鱼丸',3,15.00,NULL,'http://localhost:9090/file/81c5841179f84c81a1cc80e743afdc4b.jpg','好吃',1,'2022-09-13 08:49:14',0),(13,'芒果汁',4,13.00,NULL,'http://localhost:9090/file/e7faeb55dd2d405c8cc8b4e1a335cb39.jpg','好喝',1,'2022-09-13 08:51:53',0),(14,'桃汁',4,12.00,NULL,'http://localhost:9090/file/bca4e8e814694766ad8fbeb17a03ccb3.jpg','好喝',1,'2022-09-13 08:52:20',0),(15,'西瓜汁',4,13.00,NULL,'http://localhost:9090/file/2349571069234bc0a5ced819a86ddc95.jpg','好喝',1,'2022-09-13 08:52:37',0),(16,'葱油拌面',5,5.00,NULL,'http://localhost:9090/file/3c62a13cadc7449eb2bc7324370e6dbb.png','好吃',1,'2022-09-13 08:59:50',0),(17,'蛋炒饭',5,6.00,NULL,'http://localhost:9090/file/0f886f89214e44a68ada8781f6c27136.png','好吃',1,'2022-09-13 09:00:16',0),(18,'米饭',5,1.00,NULL,'http://localhost:9090/file/0d49db3b6f1c49f38409c23eaa75b582.jpg','干饭人',1,'2022-09-13 09:00:51',0),(19,'水饺',5,5.00,NULL,'http://localhost:9090/file/2ca4fae9d109441791b81479b536af93.png','好吃',1,'2022-09-13 09:01:11',0);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` int DEFAULT NULL COMMENT '订单id',
  `dish_id` int DEFAULT NULL COMMENT '菜品id',
  `number` int DEFAULT '1' COMMENT '数量',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='订单明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (9,9,3,2,NULL),(10,10,4,2,NULL),(11,11,1,2,NULL),(12,12,0,0,NULL),(13,13,2,7,NULL),(14,14,1,1,NULL),(15,15,17,2,NULL),(16,16,17,1,NULL),(17,18,17,1,NULL),(18,19,17,1,NULL),(19,20,17,1,NULL),(20,21,17,1,NULL),(21,22,22,1,NULL),(22,23,23,1,NULL),(23,24,22,1,NULL),(24,25,17,1,NULL),(25,26,17,1,NULL),(26,26,22,1,NULL),(27,27,17,1,NULL),(28,28,17,4,NULL),(29,29,1,1,NULL),(30,30,5,1,NULL),(31,31,4,1,NULL),(32,32,4,1,NULL),(33,33,3,1,NULL),(34,34,6,1,NULL),(35,35,5,1,NULL),(36,36,5,1,NULL),(37,37,5,1,NULL),(38,37,10,1,NULL),(39,38,3,1,NULL),(40,39,3,1,NULL),(41,40,4,1,NULL),(42,41,11,1,NULL),(43,42,3,1,NULL),(44,43,17,1,NULL),(45,43,4,1,NULL);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `status` int DEFAULT '1' COMMENT '订单状态 1待付款，2已支付，3已退款',
  `user_id` int DEFAULT NULL COMMENT '下单用户',
  `payment_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '付款时间',
  `order_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '下单时间',
  `amount` decimal(10,2) DEFAULT NULL COMMENT '总金额',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `number` int DEFAULT NULL COMMENT '菜品数量',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `no` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '订单编号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收货地址',
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `consignee` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '收货人',
  `alipay_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '支付宝交易号',
  `return_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '退款时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (9,2,1,NULL,'2022-08-15 18:11:20',1200.00,'加辣',1,'user','202208151660558280281','福建莆田','13328269951','先生',NULL,NULL),(10,2,1,NULL,'2022-08-15 18:28:39',500.00,'加辣',1,'user','202208151660559319773','福建莆田','13328269951','先生',NULL,NULL),(11,2,1,'2022-08-15 18:37:46','2022-08-15 18:36:27',500.00,'加辣',1,'user','202208151660559787030','福建莆田','13328269951','先生','2022081522001441651000244348',NULL),(12,3,1,'2022-09-02 16:09:16','2022-09-02 15:52:02',100.00,'加辣',1,'user','202209021662105122866','福建莆田','13328269951','admin00','2022090222001441651000246513','2022-09-02 16:16:15'),(13,1,2,NULL,'2022-09-06 22:43:27',1000.00,'韦拉韦拉',1,'user','202209061662475408373','福建莆田','123423423422','user',NULL,NULL),(27,1,31,NULL,'2022-09-12 14:07:20',100.00,NULL,1,'user','202209121662962840268','北京','1231456','user',NULL,NULL),(29,1,3,NULL,'2022-09-13 16:53:08',5.00,NULL,1,'大哥很强','202209131663059188949','福建省漳州市南靖县','123423423422','大哥很强',NULL,NULL),(36,2,35,'2022-09-14 09:08:57','2022-09-14 09:08:27',16.00,NULL,1,'yoake','202209141663117707984','福建省漳州市','15880514277','yoake','2022091422001441650545011527',NULL),(41,2,35,'2022-09-14 13:17:10','2022-09-14 13:16:49',30.00,NULL,1,'yoake','202209141663132609260','福建省漳州市','15880514277','yoake','2022091422001441651000247820',NULL),(42,1,35,NULL,'2022-09-17 12:46:28',5.88,NULL,1,'yoake','202209171663389988593','福建省漳州市','15880514277','yoake',NULL,NULL),(43,1,35,NULL,'2022-09-17 15:15:13',7.50,NULL,2,'yoake','202209171663398913818','福建省漳州市南靖县','15880514277','yoake',NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict` (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES ('user','el-icon-user','icon');
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_file`
--

DROP TABLE IF EXISTS `sys_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_file` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件类型（kb）',
  `size` bigint DEFAULT NULL COMMENT '文件大小',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '下载链接',
  `is_delete` int DEFAULT '0' COMMENT '是否删除',
  `enable` int DEFAULT '1' COMMENT '是否禁用链接',
  `md5` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '文件md5',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_file`
--

LOCK TABLES `sys_file` WRITE;
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
INSERT INTO `sys_file` VALUES (1,'炒菜花.png','png',495,'http://localhost:9090/file/b1e8bdbe3882483c912023856164fafd.png',0,1,'9ef01b60fbbee5e6745bf55e2ce43a69'),(2,'番茄炒蛋.png','png',1609,'http://localhost:9090/file/1251e90bdf2a4cfbb807bcba5e9f8498.png',0,1,'3060a517568d48d4c8e5d7962d001c94'),(3,'苦瓜炒蛋.png','png',1423,'http://localhost:9090/file/63ae4e53d7284e54a4b32cbda4ae915d.png',0,1,'9c4f7974288b3a435c71cf4441845a19'),(4,'卤豆干.png','png',767,'http://localhost:9090/file/8d3ae09e096240248e1015b3a9cb488c.png',0,1,'09448657547632b0575cb4319cc85634'),(5,'芹菜炒牛肉.jpeg','jpeg',36,'http://localhost:9090/file/5ebc607b05d24bcb844cb83861f1d302.jpeg',0,1,'221767c8ffb0b1e1e575e8dc509130e4'),(6,'糖醋排骨.jpeg','jpeg',58,'http://localhost:9090/file/b268104280814ad2a671aa207da868e3.jpeg',0,1,'bf338ce6b2afa263cfcd0489528b8130'),(7,'佛跳墙.png','png',76,'http://localhost:9090/file/f5166c7ddafe4dcd9d22f1b3461e07ae.png',0,1,'073ee869edbe8ede0a1f89530d9f8b2d'),(8,'龙虾.png','png',1125,'http://localhost:9090/file/67c1151a84804a18aba5867ad66b457b.png',0,1,'d9a87e88708ff1cd3d769ec4eb5df930'),(9,'蟹黄粉丝.png','png',235,'http://localhost:9090/file/a56b8bcf79e24a7c8c82a7e68a4746fd.png',0,1,'c4296a7d161ff81687c7baee742619b1'),(10,'福鼎肉片.png','png',618,'http://localhost:9090/file/a5734a71fbf74739a1366b9816aaaf29.png',0,1,'59393ad279e123c8531ed910de328e76'),(11,'洪濑鸡爪.png','png',954,'http://localhost:9090/file/74da829e4263436f8a8622527d64a805.png',0,1,'de0583d31abcaa55848ffbfcb33379d6'),(12,'手工鱼丸.jpg','jpg',77,'http://localhost:9090/file/81c5841179f84c81a1cc80e743afdc4b.jpg',0,1,'7e00bee82185da1c847ff347809d5bdf'),(13,'芒果汁.jpg','jpg',17,'http://localhost:9090/file/e7faeb55dd2d405c8cc8b4e1a335cb39.jpg',0,1,'dbc23867cf5be9114a9a1afb546149ac'),(14,'桃汁.jpg','jpg',43,'http://localhost:9090/file/bca4e8e814694766ad8fbeb17a03ccb3.jpg',0,1,'9ec2cbe699e40119b3fbb0d6753d3e62'),(15,'西瓜汁.jpg','jpg',51,'http://localhost:9090/file/2349571069234bc0a5ced819a86ddc95.jpg',0,1,'7a2e4ea8278df7706f7251b2d4fe80da'),(16,'葱油拌面.png','png',1575,'http://localhost:9090/file/3c62a13cadc7449eb2bc7324370e6dbb.png',0,1,'7424b93ef1300f1dbb6f16ddc30ed8a0'),(17,'蛋炒饭.png','png',1059,'http://localhost:9090/file/0f886f89214e44a68ada8781f6c27136.png',0,1,'100fecd02d8201a807ac855851f70fcb'),(18,'米饭.jpg','jpg',54,'http://localhost:9090/file/0d49db3b6f1c49f38409c23eaa75b582.jpg',0,1,'a574d3a0139130f12e622ea872fe867a'),(19,'水饺.png','png',343,'http://localhost:9090/file/2ca4fae9d109441791b81479b536af93.png',0,1,'03fb5762badceeb08271be1513b4746a'),(20,'奈亚子背景.jpg','jpg',350,'http://localhost:9090/file/d3b1b342105844fb9114fb5deb325185.jpg',0,1,'5cbaa2ee638ddc471d947dad72d43cd2'),(21,'奈亚子背景.jpg','jpg',350,'http://localhost:9090/file/d3b1b342105844fb9114fb5deb325185.jpg',0,1,'5cbaa2ee638ddc471d947dad72d43cd2'),(22,'奈亚子背景.jpg','jpg',350,'http://localhost:9090/file/d3b1b342105844fb9114fb5deb325185.jpg',0,1,'5cbaa2ee638ddc471d947dad72d43cd2'),(23,'奈亚子背景.jpg','jpg',350,'http://localhost:9090/file/d3b1b342105844fb9114fb5deb325185.jpg',0,1,'5cbaa2ee638ddc471d947dad72d43cd2'),(24,'奈亚子背景.jpg','jpg',350,'http://localhost:9090/file/d3b1b342105844fb9114fb5deb325185.jpg',0,1,'5cbaa2ee638ddc471d947dad72d43cd2'),(25,'奈亚子背景.jpg','jpg',350,'http://localhost:9090/file/d3b1b342105844fb9114fb5deb325185.jpg',0,1,'5cbaa2ee638ddc471d947dad72d43cd2'),(26,'奈亚子背景.jpg','jpg',350,'http://localhost:9090/file/d3b1b342105844fb9114fb5deb325185.jpg',0,1,'5cbaa2ee638ddc471d947dad72d43cd2'),(27,'素材2.jpg','jpg',19,'http://localhost:9090/file/7faad10f0e6146c6a5a2ecb439ae8857.jpg',0,1,'2b0511736b62999e36db6ce72600b2f7'),(28,'素材2.jpg','jpg',19,'http://localhost:9090/file/7faad10f0e6146c6a5a2ecb439ae8857.jpg',0,1,'2b0511736b62999e36db6ce72600b2f7'),(29,'2020106145650.png','png',2889,'http://localhost:9090/file/9c24595eed7f41628c540326c52147d1.png',0,1,'d4a23366913020897271a38fc28ab5ca'),(30,'32ff0ce191b08b82.png','png',28,'http://localhost:9090/file/158b1573435b480abfb07a878633b2a2.png',0,1,'238fa608a80dbb30873f5d1d0e2d1754'),(31,'nayazi.png','png',168,'http://localhost:9090/file/09ce6c501161464eb15b6fce374bbbe5.png',0,1,'d5ec177f4889fcce06b99d6c7257e09e'),(32,'32ff0ce191b08b82.png','png',28,'http://localhost:9090/file/158b1573435b480abfb07a878633b2a2.png',0,1,'238fa608a80dbb30873f5d1d0e2d1754'),(33,'nayazi.png','png',168,'http://localhost:9090/file/09ce6c501161464eb15b6fce374bbbe5.png',0,1,'d5ec177f4889fcce06b99d6c7257e09e'),(34,'32ff0ce191b08b82.png','png',28,'http://localhost:9090/file/158b1573435b480abfb07a878633b2a2.png',0,1,'238fa608a80dbb30873f5d1d0e2d1754'),(35,'32ff0ce191b08b82.png','png',28,'http://localhost:9090/file/158b1573435b480abfb07a878633b2a2.png',0,1,'238fa608a80dbb30873f5d1d0e2d1754'),(36,'2020106145650.png','png',2889,'http://localhost:9090/file/9c24595eed7f41628c540326c52147d1.png',0,1,'d4a23366913020897271a38fc28ab5ca'),(37,'nayazi.png','png',168,'http://localhost:9090/file/09ce6c501161464eb15b6fce374bbbe5.png',0,1,'d5ec177f4889fcce06b99d6c7257e09e'),(38,'2020112619441917813.png','png',302,'http://localhost:9090/file/c8242e86f7d64a18bf8e063aa6bf8f13.png',0,1,'03fe49c8ea12790e864c7d052fb7a5a6'),(39,'32ff0ce191b08b82.png','png',28,'http://localhost:9090/file/158b1573435b480abfb07a878633b2a2.png',0,1,'238fa608a80dbb30873f5d1d0e2d1754'),(40,'素材2.jpg','jpg',19,'http://localhost:9090/file/7faad10f0e6146c6a5a2ecb439ae8857.jpg',0,1,'2b0511736b62999e36db6ce72600b2f7'),(41,'32ff0ce191b08b82.png','png',28,'http://localhost:9090/file/158b1573435b480abfb07a878633b2a2.png',0,1,'238fa608a80dbb30873f5d1d0e2d1754');
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '自动生成',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `admin` tinyint NOT NULL DEFAULT '0' COMMENT '0为用户,1为管理员',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '自动生成',
  `is_delete` int NOT NULL DEFAULT '0',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'user' COMMENT '昵称:(默认user)',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '地址',
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '头像链接',
  `sex` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '男' COMMENT '性别',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_username_uindex` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3 COMMENT='用户登陆系统';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin00','fcea920f7412b5da7be0cf42b8c93759','123423423422',0,'2022-08-08 09:06:56',0,'admin','福建省',NULL,'男'),(2,'admin01','e10adc3949ba59abbe56e057f20f883e','123423423422',1,'2022-08-08 09:07:20',0,'user','福建莆田',NULL,'男'),(3,'admin02','e10adc3949ba59abbe56e057f20f883e','123423423422',1,'2022-08-08 09:07:24',0,'大哥很强','福建省漳州市南靖县',NULL,'女'),(4,'admin03','e10adc3949ba59abbe56e057f20f883e','123423423422',0,'2022-08-08 09:07:27',0,'user',NULL,NULL,'男'),(5,'admin04','e10adc3949ba59abbe56e057f20f883e','123423423422',0,'2022-08-08 09:07:30',1,'user',NULL,NULL,'男'),(6,'admin05','1232132121','12323131',1,'2022-08-12 07:58:07',0,'user','泰国',NULL,'男'),(7,'admin06','213121','121231',0,'2022-08-12 08:03:48',0,'user','1321',NULL,'男'),(8,'admin07','3123123','12132',0,'2022-08-12 08:03:48',1,'user',NULL,NULL,'男'),(9,'sdaD','14e1b600b1fd579f47433b88e8d85291',NULL,0,'2022-08-12 14:24:10',0,'user',NULL,NULL,'男'),(10,'asdasd','14e1b600b1fd579f47433b88e8d85291',NULL,0,'2022-08-12 14:25:22',0,'user',NULL,NULL,'男'),(11,'xxx','9f6e6800cfae7749eb6c486619254b9c',NULL,0,'2022-08-12 14:48:37',1,'xxx',NULL,NULL,'男'),(12,'xiaolin','14e1b600b1fd579f47433b88e8d85291','15880514277',0,'2022-08-12 14:49:48',0,'xiaolin','福建省',NULL,'男'),(17,'aaa','9f6e6800cfae7749eb6c486619254b9c',NULL,0,'2022-08-12 14:53:08',0,'aaa',NULL,NULL,'男'),(18,'sos','14e1b600b1fd579f47433b88e8d85291','12155',1,'2022-08-12 14:56:27',0,'sos','12315',NULL,'男'),(19,'sosd','14e1b600b1fd579f47433b88e8d85291','12155',0,'2022-08-12 14:56:39',0,'sosd','12315',NULL,'男'),(22,'aaaa','2d02e669731cbade6a64b58d602cf2a4','158ss8',0,'2022-08-12 15:13:54',0,'aaaa',NULL,NULL,'男'),(24,'asder','14e1b600b1fd579f47433b88e8d85291','dddd',0,'2022-08-12 16:23:47',1,'asder','ddd',NULL,'男'),(25,'admin08','e10adc3949ba59abbe56e057f20f883e',NULL,0,'2022-08-13 01:59:30',0,'admin09',NULL,NULL,'男'),(26,'admin09','e10adc3949ba59abbe56e057f20f883e',NULL,0,'2022-08-13 01:59:42',0,'admin09',NULL,NULL,'男'),(28,'admin12','14e1b600b1fd579f47433b88e8d85291',NULL,0,'2022-08-13 02:42:07',0,'admin12',NULL,NULL,'男'),(29,'abc','e10adc3949ba59abbe56e057f20f883e','123456',0,'2022-08-13 03:03:10',0,'abc',NULL,NULL,'男'),(30,'abcd','14e1b600b1fd579f47433b88e8d85291','ssss',0,'2022-08-14 10:09:43',1,'abcd','sss',NULL,'男'),(31,'linxin','e10adc3949ba59abbe56e057f20f883e','1231456',0,'2022-09-02 07:55:29',0,'user','北京',NULL,'男'),(32,'3','14e1b600b1fd579f47433b88e8d85291','123423423422',0,'2022-09-08 02:11:41',1,'3','福建省漳州市南靖县',NULL,'男'),(33,'yyyy','e10adc3949ba59abbe56e057f20f883e','154448221',1,'2022-09-12 06:59:15',0,'yyyy','试试水',NULL,'男'),(34,'大多数','d41d8cd98f00b204e9800998ecf8427e','',0,'2022-09-12 07:01:22',1,'大多数','大大','http://localhost:9090/file/62a6eb3b961b452baba8d2a611e1404e.jpg','男'),(35,'yoake','e10adc3949ba59abbe56e057f20f883e','15880514277',1,'2022-09-12 08:35:43',0,'yoake','福建省漳州市南靖县','http://localhost:9090/file/158b1573435b480abfb07a878633b2a2.png','男');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-17 15:53:48
