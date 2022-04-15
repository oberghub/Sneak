-- MariaDB dump 10.19  Distrib 10.4.20-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: sneakershopwebpro
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
INSERT INTO `customer` VALUES (1,'ทนงทวย','คงควรคอย',9999,'อยู่ไทยนี่แหละ','0993434234','123456','tanongtuy@gmail.com'),(2,'ลีน่าจัง','คุณพี่อยู่มั้ยคะ',20,'เป็นคนทุกที่ค่ะ','0832423234','leenahee','leena@gmail.com'),(3,'ฉัตริน','รักหมา',0,'ร้านเหล้า','0923123122','savechattarin','save12@gmail.com'),(4,'ชลธิมา','คมสกุล',221,'สุดซอย','0878787878','jeboop','jeb@yahoo.com'),(5,'ปาณิตา','เกษมทรัพย์',232,'ข้างทาง','0872131223','patita','patita@gmail.com'),(6,'วรรณภา','จันทรสมบัติ',250,'ราชบุรี','0993434234','tumraia','wannapa@gmail.com'),(7,'เศรษฐี','คมคาย',100,'พิจิตร','0832423234','komkai','kodrich@gmail.com'),(8,'ภาดา','ทัศนเรือง',300,'เพชรบูรณ์','0889123475','hello','pada@gmail.com'),(9,'ภูวเดช','ธรรมภักดิ์',499,'กาญจนบุรี','0942357981','tummapak','puwadech@gmail.com'),(10,'สุวิชาดา ','วิไลรัตน์',999,'กระบี่','0915731682','chadala','chada@gmail.com'),(11,'เอ','เย่น',0,'เขตหวงห้าม','0842134556','Ab123','ajents@gmail.com'),(12,'เอก','โทตรี',50,'ถนนห้ามหวง','0945421411','yedkae5555','aektotree@hotmail.com'),(13,'เย็ดเข้ขอโทษ','เพราะว่าพี่แม่งโคตรเท่',0,'ใต้ทางด่วน','0999993293','isas31245','kekie@gmail.com'),(14,'ปูนพร้อมก่อ','สุดหล่อพร้อมยัง',0,'ไซต์ก่อสร้าง','0873412889','mgkdlfm3452','saokrp@gmail.com'),(15,'ผมอะ','อื้ม',10,'บ้านอยู่บนกองทอง','0641922485','asmioon341os','doskmbm@gmail.com');
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
INSERT INTO `employee` VALUES (1,'สมควร','สมวยถลอก','male','อยู่ในใจเธอ','2002-04-08','0999999923','admin','admin1@gmail.com'),(2,'สมชี','ท่านอนกองกับพื้น','female','อยู่กับผัว','1995-02-05','0999992323','somshe','somshe@hotmail.com'),(3,'สมมวย','เป็นคนดี','other','155/66 LA','2002-04-12','0864878787','samul','samul@ok.com'),(4,'รธา','วงไข่น้อย','male','776 Thailand','2001-08-12','0878776786','rata44','rata@gmail.com'),(5,'ยิ่งสัก','ยิ่งรวย','female','MasterChef','1998-04-15','0967866666','yek123','yk@gmail.com'),(6,'ดารินทร์','แสงกระจ่าง','female','สงขลา','2001-01-05','0869423517','sangja','admin6@gmail.com'),(7,'เมนิลา','วิไลรัตน์','female','อ่างทอง','1994-05-02','0963487521','556677','admin7@gmail.com'),(8,'ชลธี','อรุณฉาย','male','เชียงใหม่','1998-07-03','0976588823','654321','admin8@gmail.com'),(9,'บัลลังค์','ปานประกอบ','male','ชัยภูมิ','1992-03-10','0877569982','875612','admin9@gmail.com'),(10,'ภูมิ','ไม้ทอง','male','ชลบุรี','2000-03-11','0988753221','af6845','admin10@gmail.com'),(11,'ชนายุส','เกียรติบวรสกุล','male','อยู่บ้าน','2000-01-01','0932423411','admin11','emp11@gmail.com'),(12,'นนท์','วงศ์วริศธารา','male','อยู่โรงเรียน','2000-02-03','0871243125','admin12','emp12@gmail.com'),(13,'ชยพล','วีรภัทรเมธี','male','อยู่โรงแรม','1999-05-15','0651312312','admin13','emp13@gmail.com'),(14,'ดรัณภพ','ศรีสุข','male','อยู่ทะเล','2001-12-21','0992134455','admin14','emp14@gmail.com'),(15,'ชัชชน','พุ่มสนธิ','male','อยู่บนเขา','1959-03-08','0985235211','admin15','emp15@gmail.com');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fav_item`
--

DROP TABLE IF EXISTS `fav_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fav_item` (
  `fav_item_id` int(10) NOT NULL,
  `fav_item_like` tinyint(1) DEFAULT NULL,
  `cust_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  PRIMARY KEY (`fav_item_id`,`cust_id`,`item_id`),
  KEY `FK_Cust_Fav_item` (`cust_id`),
  KEY `FK_Item_Fav_item` (`item_id`),
  CONSTRAINT `FK_Cust_Fav_item` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`),
  CONSTRAINT `FK_Item_Fav_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fav_item`
--

LOCK TABLES `fav_item` WRITE;
/*!40000 ALTER TABLE `fav_item` DISABLE KEYS */;
INSERT INTO `fav_item` VALUES (1,1,3,2),(2,1,3,15),(3,1,1,20),(4,1,9,21),(5,1,7,12);
/*!40000 ALTER TABLE `fav_item` ENABLE KEYS */;
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
  `item_desc` text DEFAULT NULL,
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
INSERT INTO `item` VALUES (1,3500.00,'Nike Air Force 1','อยู่เหนือทุกการเล่น รองเท้าผลิตจากวัสดุรีไซเคิลอย่างน้อย 20% ตามน้ำหนัก เป็นคู่ออริจินัลที่เคยขีดเขียนประวัติศาสตร์สนีกเกอร์และในวันนี้ได้รับการปรับโฉมด้วยหนังสังเคราะห์',99,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,b_rgb:f5f5f5/b01c67f2-2481-45d7-b383-a1476d768f6e/รองเท้าผู้-air-force-1-07-next-nature-cg65FM.png','women'),(2,7000.00,'Adidas ULTRABOOST 22','PRIMEKNIT ช่วยป้องกันการเสียดสีขณะสวมใส่ ประกอบเข้ากับพื้นชั้นกลาง BOOST เพื่อการส่งคืนพลังที่ไม่สิ้นสุด พร้อมเทคโนโลยี Linear Energy Push เพื่อการตอบสนองที่มากขึ้นกว่าที่เคย พื้นชั้นล่างจากยาง Continental™ ยึดเกาะได้ดีทั้งบนพื้นเปียกและพื้นแห้ง',99,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3a3d0fb47beb4b86b6a3ad7800a3ae02_9366/Ultraboost_22_GX3061_01_standard.jpg','men'),(3,4500.00,'Onitsuka MEXICO 66','The MEXICO 66™ shoe takes inspiration from several classic training shoes including the LIMBER™ shoe, which was one of the first shoes to boast the Onitsuka Tiger Stripes and were later delegated to the national Japanese team at the 1968 MEXICO Games. This look, taken directly from the ‘60s, but designed for the present, gives the MEXICO 66™ shoe its classic shape, slim styling and iconic design. Ideal for urban living, working and playing, it’s stitched with the legendary Onitsuka Tiger Stripes.\nThis enamel recycled leather version of MEXICO 66 shoe also features eco-friendly shoe laces and lining made from recyled pet mesh and organic cotton.',99,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/c/5/c50258892d6f9abbc3ade62864ad6ef2c01917c81ff2457c394d6db9d0dcab15.jpeg','men'),(4,9900.00,'Onitsuka LIMBER UP NM','รองเท้าเทรนนิ่ง LIMBER-UP™ รุ่นออริจินัลที่เปิดตัวในปี 1961 คือรุ่นก่อนหน้าของรุ่น MEXICO 66™ ซึ่งเป็นรุ่นที่โดดเด่นที่สุดของเรา รองเท้ารุ่นนี้เป็นหนึ่งในรุ่นแรกๆที่มีลายคาด Onitsuka Tiger Stripes และก่อให้เกิดรุ่น MEXICO 66™ อันเป็นเอกลักษณ์ของเรา โดยเป็นการการผสมผสานคุณสมบัติและดีไซน์รองเท้ารุ่นเก่าที่พัฒนาขึ้นในปี 1966 สำหรับเวอร์ชั่น NIPPON MADE ใหม่นี้ พื้นรองเท้ายางชั้นนอกโดดเด่นด้วยลายก้างปลาซึ่งได้รับแรงบันดาลใจจากรุ่นเก่าๆ – พื้นรองเท้าด้านนอกเป็นยางฟองน้ำ แผ่นรองพื้นรองเท้าใช้เทคโนโลยี GEL™ เพื่อคุณสมบัติด้านการรองรับแรงกระแทกและความรู้สึกสบายที่เหนือกว่า - ผลิตในประเทศญี่ปุ่น',50,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/c/8/c8ada164ce0e58153becd72c6bf854399199b20e6fbf4414ee868ebd8bea8cfd.jpeg','men'),(5,9500.00,'Onitsuka HMR PEAK G-TX','Based on an old-school Onitsuka Tiger favourite, the HIMARAYAN PEAK, our new-season HMR PEAK G-TX contains high-spec performance in every inch of its build. Crafted in hard-wearing Gore-Tex for durability in all weather, this directional boot features 3M rubber straps and tongue sleeves for a greater ability to hold up to changing conditions. The Solyte™ midsole boasts half the weight of standard EVA used in marathon and racing shoes, as well as delivering 20% more shock absorption as you hit the ground running. The heel is fitted with fuzeGEL™ for elevated cushioning and the WET GRIP Rubber™ outsole has been expertly developed to bring you reliable traction on even wet surfaces.\nColorsBLACK/PUTTY\n',50,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/1/f/1f488ca62a75d8b00ebb4e79b52e966e145b09021de07fdad295ebb7b6227f21.jpeg','men'),(6,46500.00,'BALENCIAGA WOMEN\'S X-PANDER TRAINERS IN GREY','X-Pander Trainers in grey, black and white mesh and nylon',10,'https://balenciaga.dam.kering.com/m/2aa3ecc582db239f/Large-653870W2RA31212_F.jpg?v=4','women'),(7,5499.00,'PUMA STREET RIDER HARIBO FL','ในปี 1980 เป็นช่วงที่อิทธิพลของกีฬาวิ่งกระจายไปยังท้องถนน ได้มีการเปิดตัว Fast Rider รองเท้าที่สวมใส่สบายและมีดีไซน์เรียบง่าย ตัวรองเท้าส่วนบนทำจากวัตถุดิบน้ำหนักเบา เช่น ไนลอน, หนังกลับและหนังแท้ พื้นรองเท้าส่วนล่างใช้เทคโนโลยี Federbein ที่ช่วยดูดซับแรงกระแทก ในปี 2020 นี้ Fast Rider ถูกนำมาเปิดตัวใหม่และมีการปรับปรุงให้มีรูปร่างปราดเปรียว โดยใช้พื้นแบบ Federbein และโฟม Rider',50,'https://www.pumaonlinethailand.com/media/catalog/product/cache/2/thumbnail/400x400/9df78eab33525d08d6e5fb8d27136e95/3/8/382879-01_3_800x800_1.jpg','women'),(8,279.00,'KITO BE7','ดีไซน์ที่ทันสมัยเหมาะกับไลฟ์สไตล์วัยรุ่น\n☑️พื้นบนออกแบบมาเพื่อซัพพอร์ตเท้า รองรับแรงกระแทกและน้ำหนักของผู้สวมใส่\n☑️พื้นล่างออกแบบมาเพื่อยึดเกาะทุกพื้นผิวได้เป็นอย่างดี\n☑️ทำความสะอาดง่าย แห้งเร็ว น้ำหนักเบาและไม่อุ้มน้ำ\n☑️สามารถสวมใส่ได้ทุกโอกาส',30,'https://www.kito.co.th/wp-content/uploads/2021/10/Kito-BE7-BW-1.jpg','men'),(9,308.00,'ADDA GS-72S02M1','ADDA รองเท้าแบรนด์ไทยที่ได้รับการยอมรับในเรื่องคุณภาพและงานดีไซน์จากลูกค้าชาวไทยและต่างชาติ รองเท้า ADDA รูปลักษณ์สวยงามทันสมัยสวมใส่สบายเท้า น้ำหนักเบา แข็งแรงทนทาน มีหลายแบบ หลายไตล์ ตอบสนองความต้องการของลูกค้าทุกเพศทุกวัยได้อย่างครบครัน ADDA ใส่ใจสิ่งแวดล้อมในทุกขั้นตอนของการผลิตเพื่อพัฒนาสู่การเป็นโรงงานสีเขียวอย่างยั่งยืน เราจะมีการพัฒนาการใช้ทรัพยากรอย่างมีประสิทธิภาพ ลดมลพิษจากการผลิตโดยใช้เทคโนโลยีสะอาด เรานำเทคโนโลยีเข้ามาจัดการเพื่อผลิตสินค้าคุณภาพและเป็นมิตรต่อสิ่งแวดล้อม ขณะเดียวกัน ADDA ยังได้รับตราสัญลักษณ์ Thaialnd Trusted Quality, ระบบบริหารงานคุณภาพ ISO 9001, OHSAS 18001, Code of Conduct ซึ่งเป็นเครื่องหมายการันตีว่ารองเท้า ADDA ได้รับการเลือกสรรให้เป็นสินค้าชั้นเยี่ยมจากประเทศไทย คุณสมบัติ - รองเท้าคุณภาพระดับสากล - รุ่นที่เป็นการนำหลายวัตถุดิบมาผสมผสานกันทำให้มีคุณสมบัติบางเบาและทนทาน - คู่นี้ออกแบบมาให้เหมาะกับทุกวัย สามารถใส่ได้ทุกวัน - สามารถใส่ลุยทุกที่เนื่องจากมีคุณสมบัติกันลื่น - ดูแลและทำความสะอาดง่าย ข้อแนะนำในการใช้ผลิตภัณฑ์ - ไม่ควรเก็บรองเท้าไว้ในที่มีความร้อนหรือแสงแดดจัด -ควรเก็บรองเท้าไว้ในที่อากาศถ่ายเทได้สะดวก -ไม่ควรเก็บในที่เปียกชื้น -ควรทำความสะอาดด้วยผ้าชุบน้ำผงซักฟอกที่เจือจาง -ควรนำมาสวมใส่อย่างสม่ำเสมอ',30,'https://cf.shopee.co.th/file/60569525f099f32873d7139cd47da186','men'),(10,2500.00,'Onitsuka MEXICO 66 KIDS','The MEXICO 66™ PS shoe is a KIDS version of the MEXICO 66 shoe. Retaining upper details from the MEXICO 66 shoe, updated tongue structure with hook and loop detail opens wide and allows the shoe to come on and off easily for toddlers. The OrthoLite sockliner with graphic indications gives additional comfort for kids\' feet and original lightweight material for outer sole enhances flexibility.',50,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/0/c/0c94000c64afd35eeabb47ad218277e474e3076b194c6da4941db440ee4318ab.jpeg','kid'),(11,6500.00,'Onitsuka GIGATIA SOCK','In the spirit of unexpected pairings, the GIGATIA™ KNIT model takes a knit upper wrapping your feet softly and pairs it with our signature rugged sole. This style juxtaposes a sculptural sole and an easy-to-wear upper offering a comfortable fit and can be adjusted with the shoelaces. This combination creates a new silhouette, complete with the chic look and Onitsuka Tiger’s unique design elements inspired by the tiger pattern graphic on the knit upper.\n\n- Knit upper\n- Lightweight sole for superior comfort\n- fuzeGEL™  material in heel for superior cushioning\n- OrthoLite™ X-40 inner sole for bounce-like fit and softer ground impact \n- Made in Vietnam\n- Product number: 1183B849',50,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/a/a/aaf3ee21f890d8bbc6673a026bd7ab784aaed98acb8d5ae9d9450428a53b6693.jpeg','men'),(12,6500.00,'Onitsuka MEXICO 66 SD PF','การผสมผสานคุณสมบัติของรองเท้าเทรนนิ่ง LIMBER-UP™ รุ่นออริจินัลที่เปิดตัวในปี 1961 เข้ากับดีไซน์ของรองเท้า LIMBER ที่เปิดตัวในปี 1966 โดยเป็นหนึ่งในรุ่นแรกๆที่มีลายคาด Onitsuka Tiger และเป็นจุดกำเนิดของรุ่น MEXICO 66™ อันเป็นสัญลักษณ์ของเรา รองเท้า DENTIGRE™ MX คือการนำส่วนบนของรุ่น MEXICO 66™ ในตำนานมาผสมผสานเข้ากับรองเท้า DENTIGRE™ จากคอลเลคชั่น AW20 ดีไซน์บริเวณนิ้วเท้ามาจากรุ่น MEXICO 66™ เสริมด้วยพื้นรองเท้า DENTIGRE™ เพื่อเน้นย้ำถึงสไตล์อันเป็นเอกลักษณ์ - ส่วนบนของรองเท้าทำจากหนัง - ส้นรองเท้า AMPLIFOAM™ เพื่อการรองรับแรงกระแทกที่เหนือกว่า - พื้นรองเท้าด้านใน OrthoLite™ X40 เพื่อความกระชับอย่างไร้ที่ติและการรับกระแทกอย่างนุ่มนวล - ผลิตในเวียดนาม\nColorsROYAL AZEL/ROYAL AZEL\n',50,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/9/d/9d485b49e10233b186edd759429fc9c306d79df9dd4881e3e898c502b119ae49.jpeg','women'),(13,6500.00,'Onitsuka ULTIMATE 81 MP','รองเท้า “ULTIMATE” เดิมทีได้รับการออกแบบให้เป็นรองเท้ากีฬาเปี่ยมประสิทธิภาพซึ่งผสมผสานเทคโนโลยีขั้นสูง เป็นรองเท้าที่เปิดตัวในปี 1981 ในครั้งนี้ เราเปิดตัวรุ่น ULTIMATE 81 MP สำหรับผู้บุกเบิกยุคใหม่เพื่อเป็นการฉลองครบรอบ 40 ปีของรุ่นนี้ รองเท้า ULTIMATE 81 MP ใหม่ยังคงมีดีไซน์โดดเด่นเหมือนรุ่นออริจินัล ทั้งนี้เราได้ปรับปรุงให้เข้ากับไลฟ์สไตล์สมัยใหม่ ส่วนบนของรองเท้าเป็นวัสดุแบบผสม โดดเด่นด้วยตาข่ายด้านหน้า ส่วนตรงกลางทำจากผ้า CORDURA® ซึ่งมีน้ำหนักเบาและทนทาน ส่วนเสริมแรงทำจากหนังคุณภาพสูง การใช้สีแบบโมโนโครมช่วยเพิ่มสไตล์และความซับซ้อนให้กับรองเท้าแบบโฉบเฉี่ยวรุ่นนี้ - ส่วนบนของรองเท้าทำจากวัสดุผสม - พื้นรองเท้าชั้นกลาง 2 ชั้น - พื้นรองเท้าชั้นกลาง FLYTEFOAM™ Propel เพื่อการรองรับแรงกระแทกและความยืดหยุ่นที่เหนือกว่า - พื้นรองเท้าชั้นกลาง FLYTEFOAM™ เพื่อการรองรับน้ำหนักแต่ยังคงรู้สึกเบา - พื้นรองเท้าด้านใน OrthoLite™ เพื่อการรองรับแรงกระแทกที่เหนือกว่า - วัสดุส่วนบน: หนังธรรมชาติ/ใยสังเคราะห์ - วัสดุพื้นรองเท้าชั้นนอก: ยาง - ผลิตในเวียดนาม - หมายเลขสินค้า: 1183B788',50,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/b/6/b6ac3da0132e1c9be0003621d1c1d3869f26352b17d9c961b1953f0b05dd9ee9.jpeg','men'),(14,2500.00,'Onitsuka ADMIX RUNNER TS','ADMIX RUNNER™ TS คือ รองเท้า ADMIX RUNNER สำหรับเด็ก รายละเอียดด้านบนของรองเท้ายังคงเหมือนของรุ่นสำหรับผู้ใหญ่ แต่ปรับเปลี่ยนลิ้นรองเท้าและเพิ่มสายคาดแบบเปิดปิดได้กว้าง ทำให้เด็กวัยหัดเดินสวมใส่และถอดได้ง่าย พื้นรองเท้าด้านนอกเป็นวัสดุพิเศษที่มีน้ำหนักเบา ทำให้เด็กสามารถเคลื่อนไหวได้อย่างคล่องตัวยิ่งขึ้น นอกจากนี้ แผ่นรองพื้นรองเท้า OrthoLite ยังทำให้เท้าของเด็กรู้สึกสบายด้วย',50,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/3/9/396c48f09eb3a97dee6c39b12839a10f7e77aef71b81b7fff72b4c2ac14fe88b.jpeg','kid'),(15,4500.00,'Onitsuka REBILAC SANDAL','All the style of our signature REBILAC™ RUNNER model, now available in hybrid-sandal. The REBILAC™ RUNNER style is our modern interpretation of running shoes from our archives. Updated with sleek design elements, versatile styling and technologies; the open mesh gives a keeps you cool while protecting your toes. Hook-and-loop straps and elastic heel bands make this shoe a good fit with easy on-and-off.\n\n- Mesh upper\n- Onitsuka Tiger logo printed on hook-and-loop straps\n- Onitsuka Tiger logo printed on elastic heel band\n- fuzeGEL™ technology in heel for superior cushioning\n- OrthoLite™ inner sole for superior cushioning\n- Made in Indonesia\n- Product number: 1183A560',50,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/8/7/874ca81bf06f88f50d3eaa35676742d61cfc9a02933eece1a62ae80969fca3a7.jpeg','men'),(16,5900.00,'ON RUNNING Cloudmonster','สัมผัสความเร็วดั่งปีศาจไปกับรองเท้าวิ่งผู้ชาย ON RUNNING Cloudmonster ออกแบบมาเพื่อขับเคลื่อนฝีเท้าไปข้างหน้าอย่างทรงพลัง',70,'https://d1a2ggqmhsoom.cloudfront.net/zBxZ8WjIQsg7d72go9uPrDng4j0=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/on-running-1857-536311-1.jpg','men'),(17,5000.00,'NIKE Jordan .5 \'Why Not?\'','รองเท้าบาสเกตบอลผู้ชาย NIKE Jordan .5 \'Why Not?\' ได้รับแรงบันดาลใจจากคามเร็วของนักบาสชื่อดังอย่าง \'Russell Westbrook\'',89,'https://d1a2ggqmhsoom.cloudfront.net/pbCxtmVtzDnmhaIqqiZPmxmErA0=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/nike-4366-375311-1.jpg','men'),(18,8990.00,'NEW BALANCE Made In USA 990v5','รองเท้าลำลองผู้ชาย NEW BALANCE Made In USA 990v5 จากคอลเลคชั่นสุดพรีเมียมที่ผลิตขึ้นในประเทศสหรัฐอเมริกา ตัดเย็บด้วยวัสดุคุณภาพโดยใช้หนังกลับและผ้าตาข่ายที่ระบายอากาศได้ดี',60,'https://d1a2ggqmhsoom.cloudfront.net/G7QoIrGTjqzB6yko5cSDEZs-7F4=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/newbalance-thailand-5902-845211-1.jpg','men'),(19,5490.00,'NEW BALANCE Fresh Foam 1080v11 2E','รองเท้าวิ่ง NEW BALANCE Fresh Foam 1080v11 ตอบสนองทุกก้าวอย่างเต็มประสิทธิภาพ รองรับแรงกระแทกอย่างนุ่มเท้าและยืดหยุ่น สามารถเปลี่ยนทิศทางได้ลื่นไหลในทุกเส้นทาง',99,'https://d1a2ggqmhsoom.cloudfront.net/4OoQdfAKzpo0IdmGbjP9xBRnGFc=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/newbalance-thailand-9841-35119-1.jpg','men'),(20,8500.00,'ADIDAS Predator Edge.1 L FG','รองเท้าฟุตบอลผู้ชาย ADIDAS Predator Edge.1 L FG มาพร้อมสไตล์ Low-cut ที่ให้ความคล่องตัวผสานนวัตกรรม Zone Skin',79,'https://d1a2ggqmhsoom.cloudfront.net/ej3PkcVdSH3WTx8xQnJhWwy217A=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/adidas-6586-782901-1.jpg','men'),(21,2890.00,'SKECHERS GOwalk 6','รองเท้าลำลอง SKECHERS GOwalk 6 รูปทรงเพรียวบาง มาพร้อมกับสัมผัสแห่งความสบายในการเดิน รองเท้าสไตล์สลิปออนที่เลือกใช้อัปเปอร์เป็นผ้าถัก พร้อมหุ้มด้วยวัสดุสังเคราะห์',60,'https://d1a2ggqmhsoom.cloudfront.net/TRLxd_wC2b7H-YStQvUbSPjAQEE=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/skechers-9114-445211-1.jpg','women'),(22,3290.00,'REEBOK Zig Kinetica 3','รองเท้าวิ่งผู้หญิง REEBOK Zig Kinetica 3 ด้วยเทคโนโลยีรองรับแรงกระแทกที่มีประสิทธิภาพและโครงสร้างที่มีน้ำหนักเบาให้คุณก้าวไปข้างหน้าได้อย่างมั่นใจ รวมทั้งนวัตกรรมที่พื้นรองเท้าชั้นนอกช่วยส่งแรงคืนกลับได้อย่างทรงพลังในทุกย่างก้าว',49,'https://d1a2ggqmhsoom.cloudfront.net/PiGx5bfsXyhf80PBKtozw4s6ZE4=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/reebok-3403-341311-1.jpg','women'),(23,5490.00,'NEW BALANCE Fresh Foam 1080v11','รองเท้าวิ่งผู้หญิง NEW BALANCE Fresh Foam 1080v11 ออกแบบมาเพื่อมอบความสบายอย่างเหนือระดับสำหรับการวิ่งระยะไกล ด้วยเทคโนโลยีโฟม Fresh Foam ที่พื้นรองเท้าช่วยดูดซับแรงกระแทกและตอบสนองได้อย่างทรงพลัง',55,'https://d1a2ggqmhsoom.cloudfront.net/csCJxFaUAyxI0x6RfxKWeYulSX8=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/newbalance-thailand-9386-639211-1.jpg','women'),(24,2990.00,'REEBOK Classic Leather','รองเท้าลำลองผู้ใหญ่ REEBOK Classic Leather มาพร้อมกับอัปเปอร์หนังที่มีดีไซน์เรียบง่ายแต่แฝงไปด้วยดีเทลแบบดั้งเดิม ช่วยให้คุณแมตช์เข้ากับการแต่งตัวได้อย่างมีสไตล์ ผสานความสบายด้วยพื้นรองเท้าชั้นกลางที่ช่วยรองรับแรงกระแทก',90,'https://d1a2ggqmhsoom.cloudfront.net/E6rrwW99KFL4nXTR1pCNr3Pjadg=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/reebok-9940-731311-1.jpg','women'),(25,2990.00,'FILA Disruptor II EXP','รองเท้า FILA Disruptor II EXP กลับมาอีกครั้งด้วยโทนสีใหม่และพิมพ์โลโก้ F FLAG ที่ซ้อนทับด้านข้าง ผสมผสานวัสดุและลวดลายเข้าด้วยกันเพื่อเพิ่มรายละเอียดสุดเท่ ',99,'https://d1a2ggqmhsoom.cloudfront.net/O3lG9XokWWulhvoxIEVTfiZNmW4=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/fila-7500-380211-1.jpg','women');
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
INSERT INTO `order` VALUES (1,1,2,1,'complete','อยู่ไทยนี่แหละ','2022-04-08',7000),(2,4,2,4,'pending','สุดซอย','2022-04-13',6500),(3,4,2,13,'incomplete','ใต้ทางด่วน','2022-04-13',5499),(4,4,2,14,'complete','ไซต์ก่อสร้าง','2022-04-13',5000),(5,1,2,15,'pending','บ้านอยู่บนกองทอง','2022-04-13',13000),(6,6,7,6,'complete','ราชบุรี','2022-04-08',5490),(7,7,8,7,'complete','พิจิตร','2022-04-09',8990),(8,8,9,8,'complete','เพชรบูรณ์','2022-04-10',5490),(9,9,10,9,'complete','กาญจนบุรี','2022-04-11',5000),(10,10,6,10,'complete','กระบี่','2022-04-12',2990);
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
INSERT INTO `order_item` VALUES (1,1,2,1,7000,7000.00),(2,2,11,1,6500,6500.00),(3,3,7,1,5499,5499.00),(4,4,14,2,5000,2500.00),(5,5,11,1,6500,6500.00),(6,5,12,1,6500,6500.00),(7,6,18,1,5490,5490.00),(8,7,13,1,8990,8990.00),(9,8,14,1,5490,5490.00),(10,9,12,1,5000,5000.00),(11,10,11,1,2990,2990.00);
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
INSERT INTO `payment` VALUES (1,1,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-08','02.14'),(2,2,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-13','00.53'),(3,4,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-13','05.24'),(4,5,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-13','03.33'),(5,6,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-08','02.14'),(6,7,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-09','03.50'),(7,8,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-10','12.15'),(8,9,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-11','13.40'),(9,10,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-12','15.55');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirement`
--

LOCK TABLES `requirement` WRITE;
/*!40000 ALTER TABLE `requirement` DISABLE KEYS */;
INSERT INTO `requirement` VALUES (1,2,2,'เว็ปกากจัง','2022-04-08','เว็ปเน่าอะ ซื้ออะไรไม่ได้เลย'),(2,11,3,'เว็ปช้ามาก','2022-04-09','เข้าเว็ปช้า'),(3,12,4,'ซื้อของไม่ได้','2022-04-14','ซื้ออะไรไม่ได้เลย'),(4,12,5,'รอของนาน','2022-04-14','รีบใช้โว้ย'),(5,12,11,'ไม่มีตัดบัตรหรอ','2022-04-15','อยากให้มีตัดบัตรจัง'),(6,7,7,'ภาพไม่ขึ้น','2022-04-08','ไม่เห็นภาพ ทำไงอ่ะ'),(7,9,10,'ชื่ออ่านยาก','2022-04-09','ขอชื่อรองเท้าแบบแปลไทยได้ป่ะ'),(8,10,8,'แพงจัง','2022-04-09','ขอต่อราคาได้ไหม'),(9,6,9,'เมื่อไหร่จะมีลดราคา','2022-04-10','รอลดราคาอยู่นะ สัก 10% ได้ไหม'),(10,8,6,'เว็บไม่โหลด','2022-04-10','เว็บไม่ขึ้นอะไรเลย ซื้ออะไรไม่ได้เลย');
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

-- Dump completed on 2022-04-14  2:35:38