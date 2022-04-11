-- MariaDB dump 10.19  Distrib 10.4.20-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: sneakershop
-- ------------------------------------------------------
-- Server version	10.4.20-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `cust_id` int(10) NOT NULL,
  `cust_fname` varchar(255) DEFAULT NULL,
  `cus_lname` varchar(255) DEFAULT NULL,
  `cust_point` int(10) DEFAULT NULL,
  `cust_address` varchar(255) DEFAULT NULL,
  `cust_tel` char(10) DEFAULT NULL,
  `cust_password` varchar(255) DEFAULT NULL,
  `cust_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `cust_email` (`cust_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'ทนงทวย','คงควรคอย',9999,'อยู่ไทยนี่แหละ','0993434234','123456','tanongtuy@gmail.com'),(2,'ลีน่าจัง','คุณพี่อยู่มั้ยคะ',20,'เป็นคนทุกที่ค่ะ','0832423234','leenahee','leena@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `emp_id` int(10) NOT NULL,
  `emp_fname` varchar(255) DEFAULT NULL,
  `emp_lname` varchar(255) DEFAULT NULL,
  `emp_sex` enum('male','female','other') DEFAULT NULL,
  `emp_address` varchar(255) DEFAULT NULL,
  `emp_dob` date DEFAULT NULL,
  `emp_tel` char(10) DEFAULT NULL,
  `emp_password` varchar(255) DEFAULT NULL,
  `emp_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `emp_email` (`emp_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'สมควร','สมวยถลอก','male','อยู่ในใจเธอ','2002-04-08','0999999923','admin','admin1@gmail.com'),(2,'สมชี','ท่านอนกองกับพื้น','female','อยู่กับผัว','1995-02-05','0999992323','somshe','somshe@hotmail.com');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `item_id` int(10) NOT NULL,
  `item_price` float(8,2) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_desc` varchar(255) DEFAULT NULL,
  `item_remain` int(10) DEFAULT NULL,
  `item_img` varchar(255) DEFAULT NULL,
  `item_type` enum('men','women','kid','accessories') DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,3500.00,'Nike Air Force 1','อยู่เหนือทุกการเล่น รองเท้าผลิตจากวัสดุรีไซเคิลอย่างน้อย 20% ตามน้ำหนัก เป็นคู่ออริจินัลที่เคยขีดเขียนประวัติศาสตร์สนีกเกอร์และในวันนี้ได้รับการปรับโฉมด้วยหนังสังเคราะห์',99,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/b01c67f2-2481-45d7-b383-a1476d768f6e/รองเท้าผู้-air-force-1-07-next-nature-cg65FM.png','women'),(2,7000.00,'Adidas ULTRABOOST 22','PRIMEKNIT ช่วยป้องกันการเสียดสีขณะสวมใส่ ประกอบเข้ากับพื้นชั้นกลาง BOOST เพื่อการส่งคืนพลังที่ไม่สิ้นสุด พร้อมเทคโนโลยี Linear Energy Push เพื่อการตอบสนองที่มากขึ้นกว่าที่เคย พื้นชั้นล่างจากยาง Continental™ ยึดเกาะได้ดีทั้งบนพื้นเปียกและพื้นแห้ง',99,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3a3d0fb47beb4b86b6a3ad7800a3ae02_9366/Ultraboost_22_GX3061_01_standard.jpg','men');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` int(10) NOT NULL,
  `emp_id_manage` int(10) NOT NULL,
  `emp_id_verify` int(10) NOT NULL,
  `cust_id` int(10) NOT NULL,
  `order_status` enum('complete','incomplete','pending') DEFAULT NULL,
  `order_address` varchar(255) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_total` int(10) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_Manage_Emp_Order` (`emp_id_manage`),
  KEY `FK_Verify_Emp_Order` (`emp_id_verify`),
  KEY `FK_Cust_Order` (`cust_id`),
  CONSTRAINT `FK_Cust_Order` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `FK_Manage_Emp_Order` FOREIGN KEY (`emp_id_manage`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `FK_Verify_Emp_Order` FOREIGN KEY (`emp_id_verify`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,2,1,'complete','อยู่ไทยนี่แหละ','2022-04-08',7000);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `item_no` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `item_quantity` int(10) DEFAULT NULL,
  `item_amount` int(10) DEFAULT NULL,
  `item_price` float(8,2) DEFAULT NULL,
  PRIMARY KEY (`item_no`,`order_id`),
  KEY `FK_Order_Order_item` (`order_id`),
  KEY `FK_Item_Order_item` (`item_id`),
  CONSTRAINT `FK_Item_Order_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  CONSTRAINT `FK_Order_Order_item` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,2,1,7000,7000.00);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment` (
  `pay_id` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `pay_image` varchar(255) DEFAULT NULL,
  `pay_date` varchar(255) DEFAULT NULL,
  `pay_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `FK_Order_Pay` (`order_id`),
  CONSTRAINT `FK_Order_Pay` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-08','02.14');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirement`
--

DROP TABLE IF EXISTS `requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requirement` (
  `req_id` int(10) NOT NULL AUTO_INCREMENT,
  `emp_id` int(10) NOT NULL,
  `cust_id` int(10) NOT NULL,
  `req_title` varchar(255) DEFAULT NULL,
  `req_date` date DEFAULT NULL,
  `req_detail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`req_id`),
  KEY `FK_Emp_Req` (`emp_id`),
  KEY `FK_Cust_Req` (`cust_id`),
  CONSTRAINT `FK_Cust_Req` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `FK_Emp_Req` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirement`
--

LOCK TABLES `requirement` WRITE;
/*!40000 ALTER TABLE `requirement` DISABLE KEYS */;
INSERT INTO `requirement` VALUES (1,2,2,'เว็ปกากจัง','2022-04-08','เว็ปเน่าอะ ซื้ออะไรไม่ได้เลย');
/*!40000 ALTER TABLE `requirement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-08  3:17:15
