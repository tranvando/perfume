CREATE DATABASE  IF NOT EXISTS `perfume` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `perfume`;
-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: perfume
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (2,'ROLE_USER','do1','1234','Trần Văn A',NULL,NULL,'abc1@gmail.com',NULL,1);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int NOT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorities` (
  `authoritiesId` bigint NOT NULL AUTO_INCREMENT,
  `authorityType` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`authoritiesId`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (1,'ROLE_ADMIN','admin'),(18,'ROLE_USER','uuuuuu'),(19,'ROLE_USER','Touhidur000');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_account` int NOT NULL,
  `receiver_name` varchar(100) NOT NULL,
  `receiver_address` varchar(150) NOT NULL,
  `receiver_email` varchar(100) NOT NULL,
  `receiver_phone` varchar(20) NOT NULL,
  `note` text NOT NULL,
  `status` int NOT NULL,
  `create_date` date NOT NULL,
  `modify_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (21,1,'Trần Văn Độ','Bắc Ninh','abcde','0123456','giao nhanh',2,'2021-12-08','2021-12-08'),(22,1,'Trần Văn Độ','Bắc Ninh','abcde','0123456','giao nhanh',1,'2021-12-08','2021-12-08'),(23,1,'Trần Văn Độ','Bắc Ninh','abcde','0123456','giao nhanh',1,'2021-12-08','2021-12-08'),(24,1,'Trần Văn Độ','Bắc Ninh','abcde','0123456','giao nhanh',1,'2021-12-08','2021-12-08'),(25,1,'Trần Văn Độ','Bắc Ninh','abcde','0123456','giao nhanh',1,'2021-12-08','2021-12-08'),(26,1,'Trần Văn Độ','Bắc Ninh','abcde','0123456','giao nhanh',1,'2021-12-09','2021-12-09'),(27,1,'Trần Văn Độ','Bắc Ninh','abcde','0123456','giao nhanh',1,'2021-12-09','2021-12-09'),(28,1,'Trần Văn Độ','Bắc Ninh','abcde','0123456','giao nhanh',1,'2021-12-09','2021-12-09'),(29,1,'Trần Văn Độ','Bắc Ninh','abcde','0123456','giao nhanh',1,'2021-12-09','2021-12-09'),(30,1,'Trần Văn Độ','Bắc Ninh','abcde','0123456','giao nhanh',1,'2021-12-09','2021-12-09'),(31,1,'Trần Văn Độ','Bắc Ninh','abcde','0123456','giao nhanh',1,'2021-12-09','2021-12-09'),(32,1,'Trần Văn Độ','Bắc Ninh','abcde','0123456','giao nhanh',1,'2021-12-09','2021-12-09'),(33,1,'Trần Văn Độ','Bắc Ninh','abcde','0123456','giao nhanh',1,'2021-12-09','2021-12-09'),(34,1,'Trần Văn Độ','Bắc Ninh','abcde','0123456','giao nhanh',1,'2021-12-09','2021-12-09'),(35,1,'Trần Văn Độ','Bắc Ninh','abcde','0123456','giao nhanh',1,'2021-12-09','2021-12-09'),(36,1,'Trần Văn Độ','Bắc Ninh','abcde','0123456','giao nhanh',1,'2021-12-09','2021-12-09'),(37,1,'Trần Văn Độ','Bắc Ninh','abcde','0123456','giao nhanh',1,'2021-12-09','2021-12-09');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill_detail`
--

DROP TABLE IF EXISTS `bill_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill_detail` (
  `id_product` int NOT NULL,
  `id_bill` int NOT NULL,
  `amount` int NOT NULL,
  `currently_price` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_product`,`id_bill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill_detail`
--

LOCK TABLES `bill_detail` WRITE;
/*!40000 ALTER TABLE `bill_detail` DISABLE KEYS */;
INSERT INTO `bill_detail` VALUES (1,28,2,2000),(1,37,4,10000),(2,28,2,2000),(2,37,2,20000),(4,37,4,1000),(37,37,1,100);
/*!40000 ALTER TABLE `bill_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billingaddress`
--

DROP TABLE IF EXISTS `billingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billingaddress` (
  `billingAddressId` bigint NOT NULL AUTO_INCREMENT,
  `apartmentNumber` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `strretName` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`billingAddressId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billingaddress`
--

LOCK TABLES `billingaddress` WRITE;
/*!40000 ALTER TABLE `billingaddress` DISABLE KEYS */;
INSERT INTO `billingaddress` VALUES (1,'A2','A3','A5','A4','Xz','A6'),(2,'S1','S2','S4','S3','S','S5'),(3,'A2','A3','A5','A4','xxxxxxxxxxxxxx','A6'),(4,'','','','','',''),(5,'k222','k3','k5','k4','k11111111111111111','k6'),(6,'u2','u3','u4','u4','u1yyyyyyyyyyyyyyy','u5'),(7,'','','','','',''),(8,'','','','','',''),(9,'m','m','m','m','m','m'),(10,'d','d','d','d','d','dd'),(11,'d','d','d','d','d','dd'),(12,'f','f','f','f','c','f'),(13,'a','a','A5','a','Aa','A5'),(14,'a','a','a','a','a','a'),(15,'a','a','a','a','a','a'),(16,'a','a','a','a','a','a'),(17,'A2','a','a','a','a','a'),(18,'A2','a','a','a','a','a'),(19,'A2','a','a','a','a','a'),(20,'a','a','a','a','a','a'),(21,'a','a','a','a','a','a'),(22,'a','a','a','a','a','a'),(23,'a','a','a','a','a','a'),(24,'a','a','a','a','a','a'),(25,'a','a','a','a','a','a'),(26,'R-9','Dhaka','Bangladesh','Dhaka','12','1230'),(27,'g','Dhaka','Bangladesh','Dhaka','12g','1230'),(28,'a','Dhaka','Bangladesh','Dhaka','12','1230');
/*!40000 ALTER TABLE `billingaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartId` bigint NOT NULL AUTO_INCREMENT,
  `grandTotal` double NOT NULL,
  `customerId` bigint DEFAULT NULL,
  PRIMARY KEY (`cartId`),
  KEY `FK1FEF404CE26869` (`customerId`),
  CONSTRAINT `FK1FEF404CE26869` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`),
  CONSTRAINT `FK4frngji4r1ftbjor2abkba6aj` FOREIGN KEY (`customerId`) REFERENCES `customer` (`customerId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,70000,1),(2,120000,2),(3,0,3),(4,20000,5),(5,0,6),(6,180,8),(7,200,9),(8,0,10),(9,0,11),(10,0,12),(11,0,13),(12,0,14),(13,0,15),(14,0,16),(15,0,17),(16,0,18),(17,0,19),(18,0,20);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'chanel mỹ',0),(2,'gucci',0),(3,'boss',1),(4,'test',1),(5,'do test',0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_product` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,1,'db.jpg','main'),(2,1,'a.png','extra'),(3,37,'spring_boot.txt','main'),(4,37,'tess.txt','extra'),(5,37,'trutuong_giaodien.txt','extra'),(6,2,'abc.jpg','main'),(7,4,'bccc.jpg','main');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_category` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `gender` int NOT NULL,
  `origin` varchar(255) NOT NULL,
  `capacity` varchar(255) NOT NULL,
  `amount` int NOT NULL,
  `short_description` text NOT NULL,
  `detail` text NOT NULL,
  `create_date` date NOT NULL,
  `discount` int NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_fk0` (`id_category`),
  CONSTRAINT `product_fk0` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'Nước hoa abc',10000,1,'mỹ','200ml',100,'dfafd','dfsdfadfasdfaf','2010-01-11',0,1),(2,3,'Nước hoa nam',20000,0,'pháp','100ml',30,'abcadf','dfdfdfdfdf','2010-01-11',0,1),(4,1,'testUpload',1000,1,'Pháp','200ML',10,'đẹp','rất đẹp','2021-11-30',0,1),(5,3,'testUpload',1000,3,'Pháp','200ML',10,'đẹp','rất đẹp','2021-11-30',0,1),(14,1,'Test upload ảnh',100,1,'Pháp','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-01',0,1),(15,1,'Test upload ảnh 2',100,1,'Pháp','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-01',0,1),(16,1,'Test upload ảnh 3',100,1,'','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-02',0,1),(17,1,'Test upload ảnh 3',100,1,'abc','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-02',0,1),(18,1,'Test upload ảnh 5',100,1,'k','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-02',0,1),(19,1,'Test upload ảnh 5',100,1,'k','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-03',0,1),(20,1,'Test upload ảnh 5',100,1,'k','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-03',0,1),(21,1,'Test upload ảnh 5',100,1,'k','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-03',0,1),(22,1,'Test upload ảnh 5',100,1,'k','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-03',0,1),(23,1,'Test upload ảnh 5',100,1,'k','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-03',0,1),(24,1,'Test upload ảnh 5',100,1,'','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-03',0,1),(25,1,'Test upload ảnh 5',100,1,'j','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-03',0,1),(26,1,'Test upload ảnh 5',100,1,'j','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-03',0,1),(27,1,'Test upload ảnh 5',100,1,'j','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-03',0,1),(28,1,'Test upload ảnh 5',100,1,'j','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-03',0,1),(29,1,'Test upload ảnh 5',100,1,'j','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-03',0,1),(30,1,'Test upload ảnh 5',100,1,'j','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-03',0,1),(31,1,'Test upload ảnh 5',100,1,'j','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-03',0,1),(32,1,'Test upload ảnh 5',100,1,'j','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-03',0,1),(33,1,'Test upload ảnh 5',100,1,'j','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-03',0,1),(37,1,'test cart',100,1,'j','200ml',100,'sdsdsd','ssssssssssssssssssssssssss','2021-12-04',0,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-17 13:59:21
