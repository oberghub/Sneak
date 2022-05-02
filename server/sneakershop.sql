-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: sneakershop
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `fav_item`
--

DROP TABLE IF EXISTS `fav_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fav_item` (
  `fav_item_id` int NOT NULL AUTO_INCREMENT,
  `fav_item_like` tinyint(1) DEFAULT NULL,
  `user_id` int NOT NULL,
  `item_id` int NOT NULL,
  PRIMARY KEY (`fav_item_id`,`user_id`,`item_id`),
  KEY `FK_Item_Fav_item` (`item_id`),
  KEY `fav_item_FK` (`user_id`),
  CONSTRAINT `fav_item_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FK_Item_Fav_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fav_item`
--

LOCK TABLES `fav_item` WRITE;
/*!40000 ALTER TABLE `fav_item` DISABLE KEYS */;
INSERT INTO `fav_item` VALUES (1,1,3,2),(2,1,3,15),(3,1,1,20),(4,1,9,21),(5,1,7,12),(6,1,25,8),(7,1,27,1),(8,1,27,9),(9,1,25,1),(11,1,25,19),(12,1,25,5);
/*!40000 ALTER TABLE `fav_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `item_id` int NOT NULL,
  `item_price` float(8,2) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `item_desc` text,
  `item_remain` int DEFAULT NULL,
  `item_img` varchar(255) DEFAULT NULL,
  `item_type` enum('men','women','kid','accessories') DEFAULT NULL,
  `item_brand` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,3500.00,'Nike Air Force 1','อยู่เหนือทุกการเล่น รองเท้าผลิตจากวัสดุรีไซเคิลอย่างน้อย 20% ตามน้ำหนัก เป็นคู่ออริจินัลที่เคยขีดเขียนประวัติศาสตร์สนีกเกอร์และในวันนี้ได้รับการปรับโฉมด้วยหนังสังเคราะห์',21,'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/b7d9211c-26e7-431a-ac24-b0540fb3c00f/%E0%B8%A3%E0%B8%AD%E0%B8%87%E0%B9%80%E0%B8%97%E0%B9%89%E0%B8%B2%E0%B8%9C%E0%B8%B9%E0%B9%89-air-force-1-07-WrLlWX.png','men','Nike'),(2,7000.00,'Adidas ULTRABOOST 22','PRIMEKNIT ช่วยป้องกันการเสียดสีขณะสวมใส่ ประกอบเข้ากับพื้นชั้นกลาง BOOST เพื่อการส่งคืนพลังที่ไม่สิ้นสุด พร้อมเทคโนโลยี Linear Energy Push เพื่อการตอบสนองที่มากขึ้นกว่าที่เคย พื้นชั้นล่างจากยาง Continental™ ยึดเกาะได้ดีทั้งบนพื้นเปียกและพื้นแห้ง',8,'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/3a3d0fb47beb4b86b6a3ad7800a3ae02_9366/Ultraboost_22_GX3061_01_standard.jpg','men','Adidas'),(3,4500.00,'Onitsuka MEXICO 66','The MEXICO 66™ shoe takes inspiration from several classic training shoes including the LIMBER™ shoe, which was one of the first shoes to boast the Onitsuka Tiger Stripes and were later delegated to the national Japanese team at the 1968 MEXICO Games. This look, taken directly from the ‘60s, but designed for the present, gives the MEXICO 66™ shoe its classic shape, slim styling and iconic design. Ideal for urban living, working and playing, it’s stitched with the legendary Onitsuka Tiger Stripes.\nThis enamel recycled leather version of MEXICO 66 shoe also features eco-friendly shoe laces and lining made from recyled pet mesh and organic cotton.',8,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/c/5/c50258892d6f9abbc3ade62864ad6ef2c01917c81ff2457c394d6db9d0dcab15.jpeg','men','Onitsuka'),(4,9900.00,'Onitsuka LIMBER UP NM','รองเท้าเทรนนิ่ง LIMBER-UP™ รุ่นออริจินัลที่เปิดตัวในปี 1961 คือรุ่นก่อนหน้าของรุ่น MEXICO 66™ ซึ่งเป็นรุ่นที่โดดเด่นที่สุดของเรา รองเท้ารุ่นนี้เป็นหนึ่งในรุ่นแรกๆที่มีลายคาด Onitsuka Tiger Stripes และก่อให้เกิดรุ่น MEXICO 66™ อันเป็นเอกลักษณ์ของเรา โดยเป็นการการผสมผสานคุณสมบัติและดีไซน์รองเท้ารุ่นเก่าที่พัฒนาขึ้นในปี 1966 สำหรับเวอร์ชั่น NIPPON MADE ใหม่นี้ พื้นรองเท้ายางชั้นนอกโดดเด่นด้วยลายก้างปลาซึ่งได้รับแรงบันดาลใจจากรุ่นเก่าๆ – พื้นรองเท้าด้านนอกเป็นยางฟองน้ำ แผ่นรองพื้นรองเท้าใช้เทคโนโลยี GEL™ เพื่อคุณสมบัติด้านการรองรับแรงกระแทกและความรู้สึกสบายที่เหนือกว่า - ผลิตในประเทศญี่ปุ่น',6,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/c/8/c8ada164ce0e58153becd72c6bf854399199b20e6fbf4414ee868ebd8bea8cfd.jpeg','men','Onitsuka'),(5,9500.00,'Onitsuka HMR PEAK G-TX','Based on an old-school Onitsuka Tiger favourite, the HIMARAYAN PEAK, our new-season HMR PEAK G-TX contains high-spec performance in every inch of its build. Crafted in hard-wearing Gore-Tex for durability in all weather, this directional boot features 3M rubber straps and tongue sleeves for a greater ability to hold up to changing conditions. The Solyte™ midsole boasts half the weight of standard EVA used in marathon and racing shoes, as well as delivering 20% more shock absorption as you hit the ground running. The heel is fitted with fuzeGEL™ for elevated cushioning and the WET GRIP Rubber™ outsole has been expertly developed to bring you reliable traction on even wet surfaces.\nColorsBLACK/PUTTY\n',9,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/1/f/1f488ca62a75d8b00ebb4e79b52e966e145b09021de07fdad295ebb7b6227f21.jpeg','men','Onitsuka'),(6,46500.00,'BALENCIAGA WOMEN\'S X-PANDER TRAINERS IN GREY','X-Pander Trainers in grey, black and white mesh and nylon',1,'https://balenciaga.dam.kering.com/m/2aa3ecc582db239f/Large-653870W2RA31212_F.jpg?v=4','women','BALENCIAGA'),(7,5499.00,'PUMA STREET RIDER HARIBO FL','ในปี 1980 เป็นช่วงที่อิทธิพลของกีฬาวิ่งกระจายไปยังท้องถนน ได้มีการเปิดตัว Fast Rider รองเท้าที่สวมใส่สบายและมีดีไซน์เรียบง่าย ตัวรองเท้าส่วนบนทำจากวัตถุดิบน้ำหนักเบา เช่น ไนลอน, หนังกลับและหนังแท้ พื้นรองเท้าส่วนล่างใช้เทคโนโลยี Federbein ที่ช่วยดูดซับแรงกระแทก ในปี 2020 นี้ Fast Rider ถูกนำมาเปิดตัวใหม่และมีการปรับปรุงให้มีรูปร่างปราดเปรียว โดยใช้พื้นแบบ Federbein และโฟม Rider',7,'https://www.pumaonlinethailand.com/media/catalog/product/cache/2/thumbnail/400x400/9df78eab33525d08d6e5fb8d27136e95/3/8/382879-01_3_800x800_1.jpg','women','PUMA'),(8,3300.00,'Chaco Z1','เลือกรองเท้ารุ่น Classic นุ่มสบาย ขอแนะนําชุด Z/Cloud ที่พร้อมสําหรับการเดินทางของเราซึ่งมีระบบสายปรับเองแบบเดียวกับประสิทธิภาพ ChacoGrip™ พื้นรองเท้าทําจากยางและชั้นบนสุดของ PU ที่นุ่มเป็นพิเศษสําหรับเบาะรองพื้นทันที ทุกคู่มาพร้อมมาตรฐานกับ podiatrist ของเราได้รับการรับรองรองเท้าปู luvseat™ เพื่อความสะดวกสบายตลอดทั้งวัน สำหรับวันและการสนับสนุนของ ก้าวเข้ามาและรู้สึกถึงความแตกต่าง',5,'https://i0.wp.com/layoverstoreth.com/wp-content/uploads/2021/07/CHAM2-J105375-061615-S16-000.jpg?fit=826%2C685&ssl=1','men','Chaco'),(9,4250.00,'Keen Uneek','Keen Uneek Sandals รองเท้าแตะรัดส้นสไตล์ Hybrid Life จากแบรนด์ “Keen” กับกระบวนการผลิตด้วยหุ่นยนต์ ที่มีศักยภาพความแม่นยำสูง ( Uneek Robot ) ที่ทุกท่านชื่นชอบ แน่นอนว่าแต่งตัวง่ายมากเหมาะกับแฟชั่นได้หลากหลายสไตล์ ซึ่งปัจจุบันยังเป็นรองเท้าแตะยอดนิยม ที่โด่งดังไปทั่วในวงการแฟชั่นของญี่ปุ่น และในประเทศไทยบ้านเราเป็นอย่างมาก ขอบอกว่าของมันต้องมีสำหรับสาย Outdoor ตัวจริง อย่าช้าหากคุณรักในการแต่งสไตล์!',7,'https://media.shopat24.com/pdmain/280087_01_keen.jpg','men','Keen'),(10,2500.00,'Onitsuka MEXICO 66 KIDS','The MEXICO 66™ PS shoe is a KIDS version of the MEXICO 66 shoe. Retaining upper details from the MEXICO 66 shoe, updated tongue structure with hook and loop detail opens wide and allows the shoe to come on and off easily for toddlers. The OrthoLite sockliner with graphic indications gives additional comfort for kids\' feet and original lightweight material for outer sole enhances flexibility.',4,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/0/c/0c94000c64afd35eeabb47ad218277e474e3076b194c6da4941db440ee4318ab.jpeg','kid','Onitsuka'),(11,6500.00,'Onitsuka GIGATIA SOCK','In the spirit of unexpected pairings, the GIGATIA™ KNIT model takes a knit upper wrapping your feet softly and pairs it with our signature rugged sole. This style juxtaposes a sculptural sole and an easy-to-wear upper offering a comfortable fit and can be adjusted with the shoelaces. This combination creates a new silhouette, complete with the chic look and Onitsuka Tiger’s unique design elements inspired by the tiger pattern graphic on the knit upper.\n\n- Knit upper\n- Lightweight sole for superior comfort\n- fuzeGEL™  material in heel for superior cushioning\n- OrthoLite™ X-40 inner sole for bounce-like fit and softer ground impact \n- Made in Vietnam\n- Product number: 1183B849',6,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/a/a/aaf3ee21f890d8bbc6673a026bd7ab784aaed98acb8d5ae9d9450428a53b6693.jpeg','men','Onitsuka'),(12,6500.00,'Onitsuka MEXICO 66 SD PF','การผสมผสานคุณสมบัติของรองเท้าเทรนนิ่ง LIMBER-UP™ รุ่นออริจินัลที่เปิดตัวในปี 1961 เข้ากับดีไซน์ของรองเท้า LIMBER ที่เปิดตัวในปี 1966 โดยเป็นหนึ่งในรุ่นแรกๆที่มีลายคาด Onitsuka Tiger และเป็นจุดกำเนิดของรุ่น MEXICO 66™ อันเป็นสัญลักษณ์ของเรา รองเท้า DENTIGRE™ MX คือการนำส่วนบนของรุ่น MEXICO 66™ ในตำนานมาผสมผสานเข้ากับรองเท้า DENTIGRE™ จากคอลเลคชั่น AW20 ดีไซน์บริเวณนิ้วเท้ามาจากรุ่น MEXICO 66™ เสริมด้วยพื้นรองเท้า DENTIGRE™ เพื่อเน้นย้ำถึงสไตล์อันเป็นเอกลักษณ์ - ส่วนบนของรองเท้าทำจากหนัง - ส้นรองเท้า AMPLIFOAM™ เพื่อการรองรับแรงกระแทกที่เหนือกว่า - พื้นรองเท้าด้านใน OrthoLite™ X40 เพื่อความกระชับอย่างไร้ที่ติและการรับกระแทกอย่างนุ่มนวล - ผลิตในเวียดนาม\nColorsROYAL AZEL/ROYAL AZEL\n',7,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/9/d/9d485b49e10233b186edd759429fc9c306d79df9dd4881e3e898c502b119ae49.jpeg','women','Onitsuka'),(13,6500.00,'Onitsuka ULTIMATE 81 MP','รองเท้า “ULTIMATE” เดิมทีได้รับการออกแบบให้เป็นรองเท้ากีฬาเปี่ยมประสิทธิภาพซึ่งผสมผสานเทคโนโลยีขั้นสูง เป็นรองเท้าที่เปิดตัวในปี 1981 ในครั้งนี้ เราเปิดตัวรุ่น ULTIMATE 81 MP สำหรับผู้บุกเบิกยุคใหม่เพื่อเป็นการฉลองครบรอบ 40 ปีของรุ่นนี้ รองเท้า ULTIMATE 81 MP ใหม่ยังคงมีดีไซน์โดดเด่นเหมือนรุ่นออริจินัล ทั้งนี้เราได้ปรับปรุงให้เข้ากับไลฟ์สไตล์สมัยใหม่ ส่วนบนของรองเท้าเป็นวัสดุแบบผสม โดดเด่นด้วยตาข่ายด้านหน้า ส่วนตรงกลางทำจากผ้า CORDURA® ซึ่งมีน้ำหนักเบาและทนทาน ส่วนเสริมแรงทำจากหนังคุณภาพสูง การใช้สีแบบโมโนโครมช่วยเพิ่มสไตล์และความซับซ้อนให้กับรองเท้าแบบโฉบเฉี่ยวรุ่นนี้ - ส่วนบนของรองเท้าทำจากวัสดุผสม - พื้นรองเท้าชั้นกลาง 2 ชั้น - พื้นรองเท้าชั้นกลาง FLYTEFOAM™ Propel เพื่อการรองรับแรงกระแทกและความยืดหยุ่นที่เหนือกว่า - พื้นรองเท้าชั้นกลาง FLYTEFOAM™ เพื่อการรองรับน้ำหนักแต่ยังคงรู้สึกเบา - พื้นรองเท้าด้านใน OrthoLite™ เพื่อการรองรับแรงกระแทกที่เหนือกว่า - วัสดุส่วนบน: หนังธรรมชาติ/ใยสังเคราะห์ - วัสดุพื้นรองเท้าชั้นนอก: ยาง - ผลิตในเวียดนาม - หมายเลขสินค้า: 1183B788',5,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/b/6/b6ac3da0132e1c9be0003621d1c1d3869f26352b17d9c961b1953f0b05dd9ee9.jpeg','men','Onitsuka'),(14,2500.00,'Onitsuka ADMIX RUNNER TS','ADMIX RUNNER™ TS คือ รองเท้า ADMIX RUNNER สำหรับเด็ก รายละเอียดด้านบนของรองเท้ายังคงเหมือนของรุ่นสำหรับผู้ใหญ่ แต่ปรับเปลี่ยนลิ้นรองเท้าและเพิ่มสายคาดแบบเปิดปิดได้กว้าง ทำให้เด็กวัยหัดเดินสวมใส่และถอดได้ง่าย พื้นรองเท้าด้านนอกเป็นวัสดุพิเศษที่มีน้ำหนักเบา ทำให้เด็กสามารถเคลื่อนไหวได้อย่างคล่องตัวยิ่งขึ้น นอกจากนี้ แผ่นรองพื้นรองเท้า OrthoLite ยังทำให้เท้าของเด็กรู้สึกสบายด้วย',0,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/3/9/396c48f09eb3a97dee6c39b12839a10f7e77aef71b81b7fff72b4c2ac14fe88b.jpeg','kid','Onitsuka'),(15,4500.00,'Onitsuka REBILAC SANDAL','All the style of our signature REBILAC™ RUNNER model, now available in hybrid-sandal. The REBILAC™ RUNNER style is our modern interpretation of running shoes from our archives. Updated with sleek design elements, versatile styling and technologies; the open mesh gives a keeps you cool while protecting your toes. Hook-and-loop straps and elastic heel bands make this shoe a good fit with easy on-and-off.\n\n- Mesh upper\n- Onitsuka Tiger logo printed on hook-and-loop straps\n- Onitsuka Tiger logo printed on elastic heel band\n- fuzeGEL™ technology in heel for superior cushioning\n- OrthoLite™ inner sole for superior cushioning\n- Made in Indonesia\n- Product number: 1183A560',4,'https://media.ot-sea-prod.com/catalog/product/cache/388c51a5e4b57808b579f3ffa818e79f/8/7/874ca81bf06f88f50d3eaa35676742d61cfc9a02933eece1a62ae80969fca3a7.jpeg','men','Onitsuka'),(16,5900.00,'ON RUNNING Cloudmonster','สัมผัสความเร็วดั่งปีศาจไปกับรองเท้าวิ่งผู้ชาย ON RUNNING Cloudmonster ออกแบบมาเพื่อขับเคลื่อนฝีเท้าไปข้างหน้าอย่างทรงพลัง',4,'https://d1a2ggqmhsoom.cloudfront.net/zBxZ8WjIQsg7d72go9uPrDng4j0=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/on-running-1857-536311-1.jpg','men','ON'),(17,5000.00,'NIKE Jordan .5 \'Why Not?\'','รองเท้าบาสเกตบอลผู้ชาย NIKE Jordan .5 \'Why Not?\' ได้รับแรงบันดาลใจจากคามเร็วของนักบาสชื่อดังอย่าง \'Russell Westbrook\'',1,'https://d1a2ggqmhsoom.cloudfront.net/pbCxtmVtzDnmhaIqqiZPmxmErA0=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/nike-4366-375311-1.jpg','men','Nike'),(18,8990.00,'NEW BALANCE Made In USA 990v5','รองเท้าลำลองผู้ชาย NEW BALANCE Made In USA 990v5 จากคอลเลคชั่นสุดพรีเมียมที่ผลิตขึ้นในประเทศสหรัฐอเมริกา ตัดเย็บด้วยวัสดุคุณภาพโดยใช้หนังกลับและผ้าตาข่ายที่ระบายอากาศได้ดี',0,'https://d1a2ggqmhsoom.cloudfront.net/G7QoIrGTjqzB6yko5cSDEZs-7F4=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/newbalance-thailand-5902-845211-1.jpg','men','NEW BALANCE'),(19,5490.00,'NEW BALANCE Fresh Foam 1080v11 2E','รองเท้าวิ่ง NEW BALANCE Fresh Foam 1080v11 ตอบสนองทุกก้าวอย่างเต็มประสิทธิภาพ รองรับแรงกระแทกอย่างนุ่มเท้าและยืดหยุ่น สามารถเปลี่ยนทิศทางได้ลื่นไหลในทุกเส้นทาง',8,'https://d1a2ggqmhsoom.cloudfront.net/4OoQdfAKzpo0IdmGbjP9xBRnGFc=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/newbalance-thailand-9841-35119-1.jpg','men','NEW BALANCE'),(20,8500.00,'ADIDAS Predator Edge.1 L FG','รองเท้าฟุตบอลผู้ชาย ADIDAS Predator Edge.1 L FG มาพร้อมสไตล์ Low-cut ที่ให้ความคล่องตัวผสานนวัตกรรม Zone Skin',6,'https://d1a2ggqmhsoom.cloudfront.net/ej3PkcVdSH3WTx8xQnJhWwy217A=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/adidas-6586-782901-1.jpg','men','ADIDAS'),(21,2890.00,'SKECHERS GOwalk 6','รองเท้าลำลอง SKECHERS GOwalk 6 รูปทรงเพรียวบาง มาพร้อมกับสัมผัสแห่งความสบายในการเดิน รองเท้าสไตล์สลิปออนที่เลือกใช้อัปเปอร์เป็นผ้าถัก พร้อมหุ้มด้วยวัสดุสังเคราะห์',7,'https://d1a2ggqmhsoom.cloudfront.net/TRLxd_wC2b7H-YStQvUbSPjAQEE=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/skechers-9114-445211-1.jpg','women','SKECHERS'),(22,3290.00,'REEBOK Zig Kinetica 3','รองเท้าวิ่งผู้หญิง REEBOK Zig Kinetica 3 ด้วยเทคโนโลยีรองรับแรงกระแทกที่มีประสิทธิภาพและโครงสร้างที่มีน้ำหนักเบาให้คุณก้าวไปข้างหน้าได้อย่างมั่นใจ รวมทั้งนวัตกรรมที่พื้นรองเท้าชั้นนอกช่วยส่งแรงคืนกลับได้อย่างทรงพลังในทุกย่างก้าว',7,'https://d1a2ggqmhsoom.cloudfront.net/PiGx5bfsXyhf80PBKtozw4s6ZE4=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/reebok-3403-341311-1.jpg','women','REEBOK'),(23,5490.00,'NEW BALANCE Fresh Foam 1080v11','รองเท้าวิ่งผู้หญิง NEW BALANCE Fresh Foam 1080v11 ออกแบบมาเพื่อมอบความสบายอย่างเหนือระดับสำหรับการวิ่งระยะไกล ด้วยเทคโนโลยีโฟม Fresh Foam ที่พื้นรองเท้าช่วยดูดซับแรงกระแทกและตอบสนองได้อย่างทรงพลัง',4,'https://d1a2ggqmhsoom.cloudfront.net/csCJxFaUAyxI0x6RfxKWeYulSX8=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/newbalance-thailand-9386-639211-1.jpg','women','NEW BALANCE'),(24,2990.00,'REEBOK Classic Leather','รองเท้าลำลองผู้ใหญ่ REEBOK Classic Leather มาพร้อมกับอัปเปอร์หนังที่มีดีไซน์เรียบง่ายแต่แฝงไปด้วยดีเทลแบบดั้งเดิม ช่วยให้คุณแมตช์เข้ากับการแต่งตัวได้อย่างมีสไตล์ ผสานความสบายด้วยพื้นรองเท้าชั้นกลางที่ช่วยรองรับแรงกระแทก',8,'https://d1a2ggqmhsoom.cloudfront.net/E6rrwW99KFL4nXTR1pCNr3Pjadg=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/reebok-9940-731311-1.jpg','women','REEBOK'),(25,2990.00,'FILA Disruptor II EXP','รองเท้า FILA Disruptor II EXP กลับมาอีกครั้งด้วยโทนสีใหม่และพิมพ์โลโก้ F FLAG ที่ซ้อนทับด้านข้าง ผสมผสานวัสดุและลวดลายเข้าด้วยกันเพื่อเพิ่มรายละเอียดสุดเท่ ',3,'https://d1a2ggqmhsoom.cloudfront.net/O3lG9XokWWulhvoxIEVTfiZNmW4=/fit-in/346x500/filters:quality(90):fill(ffffff)/http://static-catalog.supersports.co.th/p/fila-7500-380211-1.jpg','women','FILA');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_size`
--

DROP TABLE IF EXISTS `item_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_size` (
  `size_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `size_remain` int DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`size_id`),
  KEY `item_size_FK` (`item_id`),
  CONSTRAINT `item_size_FK` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_size`
--

LOCK TABLES `item_size` WRITE;
/*!40000 ALTER TABLE `item_size` DISABLE KEYS */;
INSERT INTO `item_size` VALUES (1,1,3,'6.5'),(2,1,4,'7'),(3,1,2,'7.5'),(4,1,1,'8'),(5,1,1,'8.5'),(6,1,3,'9'),(7,1,2,'9.5'),(8,1,1,'10'),(9,1,2,'10.5'),(10,1,0,'11'),(11,1,1,'11.5'),(12,1,1,'12'),(13,2,1,'7.5'),(14,2,2,'8'),(15,2,1,'9'),(16,2,1,'9.5'),(17,2,3,'10'),(18,2,0,'6'),(19,3,3,'7'),(20,3,1,'8'),(21,3,1,'9'),(22,3,2,'10'),(23,3,1,'11'),(24,4,1,'6'),(25,4,3,'7'),(26,4,0,'8'),(27,4,0,'9'),(28,4,2,'10'),(29,5,1,'6.5'),(30,5,1,'8.5'),(31,5,2,'10.5'),(32,5,0,'7'),(33,5,0,'9'),(34,5,5,'5'),(35,6,1,'8'),(36,6,0,'8.5'),(37,6,0,'9'),(38,6,0,'10'),(40,7,1,'6.5'),(41,7,1,'7'),(42,7,2,'7.5'),(43,7,2,'8'),(44,7,1,'9'),(45,8,0,'5'),(46,8,1,'6'),(47,8,2,'5.5'),(48,8,1,'8'),(49,8,1,'7'),(50,9,3,'5'),(51,9,2,'6'),(52,9,1,'7'),(53,9,1,'8'),(54,9,0,'9'),(55,10,2,'4'),(56,10,2,'5'),(57,11,2,'9'),(58,11,0,'10'),(59,11,2,'10.5'),(60,11,1,'7'),(61,11,1,'6'),(64,14,0,'4'),(65,14,0,'5'),(66,15,1,'7'),(67,15,2,'8'),(68,15,1,'9'),(69,12,1,'6.5'),(70,12,2,'7'),(71,12,1,'8'),(72,12,3,'9'),(73,13,1,'7.5'),(74,13,2,'8'),(75,13,1,'9'),(76,13,0,'10'),(77,13,0,'10.5'),(78,13,1,'11'),(79,16,1,'7.5'),(80,16,0,'8'),(81,16,1,'8.5'),(82,16,2,'9.5'),(83,17,1,'6'),(84,17,0,'8'),(85,17,0,'9'),(86,18,0,'6'),(87,18,0,'7'),(88,18,0,'8'),(89,18,0,'9'),(90,18,0,'10'),(91,19,1,'8.5'),(92,19,1,'9'),(93,19,2,'6'),(94,19,3,'5.5'),(95,19,1,'7'),(96,20,1,'10'),(97,20,0,'9'),(98,20,2,'6'),(99,20,0,'11'),(100,20,3,'6.5'),(101,21,1,'5'),(102,21,4,'6'),(103,21,0,'7'),(104,21,2,'8'),(105,22,2,'5.5'),(106,22,3,'6.5'),(107,22,1,'7'),(108,22,1,'7.5'),(109,23,1,'6'),(110,23,1,'7'),(111,23,1,'5'),(112,23,1,'5.5'),(113,24,5,'6.5'),(114,24,2,'7'),(115,24,1,'7.5'),(116,24,0,'8'),(117,25,0,'5'),(118,25,0,'6'),(119,25,2,'7'),(120,25,1,'8');
/*!40000 ALTER TABLE `item_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `order_status` enum('complete','incomplete','pending') DEFAULT NULL,
  `order_address` varchar(255) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_total` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_Cust_Order` (`user_id`),
  CONSTRAINT `order_FK_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,'complete','อยู่ไทยนี่แหละ','2022-04-08',7000),(2,4,'incomplete','สุดซอย','2022-04-13',6500),(3,13,'incomplete','ใต้ทางด่วน','2022-04-13',5499),(4,14,'complete','ไซต์ก่อสร้าง','2022-04-13',5000),(5,5,'complete','บ้านอยู่บนกองทอง','2022-04-13',13000),(6,6,'complete','ราชบุรี','2022-04-08',5490),(7,7,'complete','พิจิตร','2022-04-09',8990),(8,8,'complete','เพชรบูรณ์','2022-04-10',5490),(9,9,'complete','กาญจนบุรี','2022-04-11',5000),(10,10,'complete','กระบี่','2022-04-12',2990),(11,25,'complete','123/4 ซอยหอม ถนนห้ามห้วง เขตหวงห้าม เมืองวากานดา 69696','2022-04-28',7000),(23,25,'complete','123/4 ซอยหอม ถนนห้ามห้วง เขตหวงห้าม เมืองวากานดา 69696','2022-05-02',14298),(32,25,'incomplete','123/4 ซอยหอม ถนนห้ามห้วง เขตหวงห้าม เมืองวากานดา 69696','2022-05-02',21750),(33,25,'complete','123/4 ซอยหอม ถนนห้ามห้วง เขตหวงห้าม เมืองวากานดา 69696','2022-05-02',10000),(35,25,'incomplete','123/4 ซอยหอม ถนนห้ามห้วง เขตหวงห้าม เมืองวากานดา 69696','2022-05-02',7500),(36,25,'pending','123/4 ซอยหอม ถนนห้ามห้วง เขตหวงห้าม เมืองวากานดา 69696','2022-05-02',3290);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `item_no` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `item_id` int NOT NULL,
  `item_quantity` int DEFAULT NULL,
  `item_amount` int DEFAULT NULL,
  `item_price` float(8,2) DEFAULT NULL,
  `item_size` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`item_no`,`order_id`),
  KEY `FK_Item_Order_item` (`item_id`),
  KEY `FK_Order_Order_Item_idx` (`order_id`),
  CONSTRAINT `FK_Item_Order_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  CONSTRAINT `FK_Order_Order_Item` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,2,1,7000,7000.00,'6.5'),(2,2,11,1,6500,6500.00,'10'),(3,3,7,1,5499,5499.00,'10.5'),(4,4,14,2,5000,2500.00,'7'),(5,5,11,1,6500,6500.00,'7'),(6,5,12,1,6500,6500.00,'8'),(7,6,18,1,5490,5490.00,'5'),(8,7,13,1,8990,8990.00,'12'),(9,8,14,1,5490,5490.00,'11'),(10,9,12,1,5000,5000.00,'9.5'),(11,10,11,1,2990,2990.00,'9'),(12,11,1,1,3500,3500.00,'8'),(13,11,2,1,3500,3500.00,'10.5'),(25,23,8,1,3300,3300.00,'7'),(26,23,7,2,10998,5499.00,'7.5'),(39,32,3,2,9000,4500.00,'7'),(40,32,9,3,12750,4250.00,'5'),(41,33,14,2,5000,2500.00,'4'),(42,33,14,2,5000,2500.00,'5'),(45,35,10,2,5000,2500.00,'4'),(46,35,10,1,2500,2500.00,'5'),(47,36,22,1,3290,3290.00,'7.5');
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `pay_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `pay_image` text,
  `pay_date` varchar(255) DEFAULT NULL,
  `pay_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-08','02.14'),(2,2,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-13','00.53'),(3,4,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-13','05.24'),(4,5,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-13','03.33'),(5,6,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-08','02.14'),(6,7,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-09','03.50'),(7,8,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-10','12.15'),(8,9,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-11','13.40'),(9,10,'https://www.kasikornbank.com/SiteCollectionDocuments/personal/digital-banking/kplus/functions/verified-slip/img/img-06.png','2022-04-12','15.55'),(10,3,'https://images-ext-2.discordapp.net/external/mM3RGj5kiaw-RRJXAn5JrSl4ghjO44pqCccFonvvhI8/%3F_nc_cat%3D103%26ccb%3D1-5%26_nc_sid%3Dae9488%26_nc_ohc%3D1wxSkCqmlJkAX-MhZLT%26tn%3DWcwTTfOD8BqN81e6%26_nc_ht%3Dscontent.fbkk22-3.fna%26oh%3D03_AVLLHbMyRXnWFCHqubfHQZdXmOS2C91g_PM-C039twzkkg%26oe%3D62938BB1/https/scontent.fbkk22-3.fna.fbcdn.net/v/t1.15752-9/275887883_516095816550304_8156555540180172838_n.jpg?width=546&height=671','2022-04-29','13.34'),(11,12,'https://images-ext-1.discordapp.net/external/DS13fSSUohZCNcEJcHDsD1WpQkvHGB06T2WjMjlF28w/%3F_nc_cat%3D105%26ccb%3D1-5%26_nc_sid%3Dae9488%26_nc_ohc%3Dhsg7HTwsmYMAX8ya6CB%26_nc_ht%3Dscontent.fbkk22-2.fna%26oh%3D03_AVLw1ZiVz6XW_pQYkbARadPx3qGBLMcXzy4XqWHfYu_40Q%26oe%3D62919192/https/scontent.fbkk22-2.fna.fbcdn.net/v/t1.15752-9/278912626_709551823725321_2070053246784373022_n.jpg?width=546&height=671','2022-04-30','12.21'),(12,11,'https://images-ext-1.discordapp.net/external/DS13fSSUohZCNcEJcHDsD1WpQkvHGB06T2WjMjlF28w/%3F_nc_cat%3D105%26ccb%3D1-5%26_nc_sid%3Dae9488%26_nc_ohc%3Dhsg7HTwsmYMAX8ya6CB%26_nc_ht%3Dscontent.fbkk22-2.fna%26oh%3D03_AVLw1ZiVz6XW_pQYkbARadPx3qGBLMcXzy4XqWHfYu_40Q%26oe%3D62919192/https/scontent.fbkk22-2.fna.fbcdn.net/v/t1.15752-9/278912626_709551823725321_2070053246784373022_n.jpg?width=546&height=671','2022-05-01','09.21'),(21,23,'https://images-ext-2.discordapp.net/external/mM3RGj5kiaw-RRJXAn5JrSl4ghjO44pqCccFonvvhI8/%3F_nc_cat%3D103%26ccb%3D1-5%26_nc_sid%3Dae9488%26_nc_ohc%3D1wxSkCqmlJkAX-MhZLT%26tn%3DWcwTTfOD8BqN81e6%26_nc_ht%3Dscontent.fbkk22-3.fna%26oh%3D03_AVLLHbMyRXnWFCHqubfHQZdXmOS2C91g_PM-C039twzkkg%26oe%3D62938BB1/https/scontent.fbkk22-3.fna.fbcdn.net/v/t1.15752-9/275887883_516095816550304_8156555540180172838_n.jpg?width=546&height=671','2022-05-19','10:49'),(29,32,'https://images-ext-2.discordapp.net/external/mM3RGj5kiaw-RRJXAn5JrSl4ghjO44pqCccFonvvhI8/%3F_nc_cat%3D103%26ccb%3D1-5%26_nc_sid%3Dae9488%26_nc_ohc%3D1wxSkCqmlJkAX-MhZLT%26tn%3DWcwTTfOD8BqN81e6%26_nc_ht%3Dscontent.fbkk22-3.fna%26oh%3D03_AVLLHbMyRXnWFCHqubfHQZdXmOS2C91g_PM-C039twzkkg%26oe%3D62938BB1/https/scontent.fbkk22-3.fna.fbcdn.net/v/t1.15752-9/275887883_516095816550304_8156555540180172838_n.jpg?width=546&height=671','2022-05-21','11:03'),(30,33,'https://images-ext-2.discordapp.net/external/mM3RGj5kiaw-RRJXAn5JrSl4ghjO44pqCccFonvvhI8/%3F_nc_cat%3D103%26ccb%3D1-5%26_nc_sid%3Dae9488%26_nc_ohc%3D1wxSkCqmlJkAX-MhZLT%26tn%3DWcwTTfOD8BqN81e6%26_nc_ht%3Dscontent.fbkk22-3.fna%26oh%3D03_AVLLHbMyRXnWFCHqubfHQZdXmOS2C91g_PM-C039twzkkg%26oe%3D62938BB1/https/scontent.fbkk22-3.fna.fbcdn.net/v/t1.15752-9/275887883_516095816550304_8156555540180172838_n.jpg?width=546&height=671','2022-05-02','03:09'),(32,35,'https://images-ext-2.discordapp.net/external/mM3RGj5kiaw-RRJXAn5JrSl4ghjO44pqCccFonvvhI8/%3F_nc_cat%3D103%26ccb%3D1-5%26_nc_sid%3Dae9488%26_nc_ohc%3D1wxSkCqmlJkAX-MhZLT%26tn%3DWcwTTfOD8BqN81e6%26_nc_ht%3Dscontent.fbkk22-3.fna%26oh%3D03_AVLLHbMyRXnWFCHqubfHQZdXmOS2C91g_PM-C039twzkkg%26oe%3D62938BB1/https/scontent.fbkk22-3.fna.fbcdn.net/v/t1.15752-9/275887883_516095816550304_8156555540180172838_n.jpg?width=546&height=671','2022-05-30','12:40'),(33,36,'https://images-ext-2.discordapp.net/external/mM3RGj5kiaw-RRJXAn5JrSl4ghjO44pqCccFonvvhI8/%3F_nc_cat%3D103%26ccb%3D1-5%26_nc_sid%3Dae9488%26_nc_ohc%3D1wxSkCqmlJkAX-MhZLT%26tn%3DWcwTTfOD8BqN81e6%26_nc_ht%3Dscontent.fbkk22-3.fna%26oh%3D03_AVLLHbMyRXnWFCHqubfHQZdXmOS2C91g_PM-C039twzkkg%26oe%3D62938BB1/https/scontent.fbkk22-3.fna.fbcdn.net/v/t1.15752-9/275887883_516095816550304_8156555540180172838_n.jpg?width=546&height=671','2022-05-23','12:52');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redeem`
--

DROP TABLE IF EXISTS `redeem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redeem` (
  `red_id` int NOT NULL,
  `red_name` varchar(255) DEFAULT NULL,
  `red_img` text,
  `red_remain` int DEFAULT NULL,
  `red_point` int DEFAULT NULL,
  PRIMARY KEY (`red_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redeem`
--

LOCK TABLES `redeem` WRITE;
/*!40000 ALTER TABLE `redeem` DISABLE KEYS */;
INSERT INTO `redeem` VALUES (1,'ถุงผ้า Sneakershop','https://media.discordapp.net/attachments/877785654329753660/969812250087010354/toongpha.png',10,75),(2,'แก้วนํ้า Sneakershop Limited','https://media.discordapp.net/attachments/877785654329753660/969812249852137553/keawnam.png?width=671&height=671',5,85),(3,'ถุงเท้า Sneakershop B&W','https://media.discordapp.net/attachments/877785654329753660/969812249646624839/toongtaw.png',12,90),(4,'เสื้อ Sneakershop Limited','https://media.discordapp.net/attachments/877785654329753660/969812249428496394/suea.png',1,150),(5,'กางเกงชั้นใน Sneakershop','https://media.discordapp.net/attachments/877785654329753660/969812249193611274/kaengnai.png?width=671&height=671',3,100);
/*!40000 ALTER TABLE `redeem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requirement`
--

DROP TABLE IF EXISTS `requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requirement` (
  `req_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `req_title` varchar(255) DEFAULT NULL,
  `req_date` date DEFAULT NULL,
  `req_detail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`req_id`),
  KEY `FK_Emp_Req` (`user_id`),
  CONSTRAINT `requirement_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requirement`
--

LOCK TABLES `requirement` WRITE;
/*!40000 ALTER TABLE `requirement` DISABLE KEYS */;
INSERT INTO `requirement` VALUES (1,2,'เว็ปกากจัง','2022-04-08','เว็ปเน่าอะ ซื้ออะไรไม่ได้เลย'),(2,11,'เว็ปช้ามาก','2022-04-09','เข้าเว็ปช้า'),(3,12,'ซื้อของไม่ได้','2022-04-14','ซื้ออะไรไม่ได้เลย'),(4,12,'รอของนาน','2022-04-14','รีบใช้โว้ย'),(5,12,'ไม่มีตัดบัตรหรอ','2022-04-15','อยากให้มีตัดบัตรจัง'),(6,7,'ภาพไม่ขึ้น','2022-04-08','ไม่เห็นภาพ ทำไงอ่ะ'),(7,9,'ชื่ออ่านยาก','2022-04-09','ขอชื่อรองเท้าแบบแปลไทยได้ป่ะ'),(8,10,'แพงจัง','2022-04-09','ขอต่อราคาได้ไหม'),(9,6,'เมื่อไหร่จะมีลดราคา','2022-04-10','รอลดราคาอยู่นะ สัก 10% ได้ไหม'),(10,8,'เว็บไม่โหลด','2022-04-10','เว็บไม่ขึ้นอะไรเลย ซื้ออะไรไม่ได้เลย'),(11,25,'scan qr','2022-04-27','เมื่อไหร่จะทำระบบนี้ครับ'),(12,25,'qr scan','2022-04-27','เมื่อไหร่จะทำครับ'),(13,25,'โคตรดีโคตรแจ่มอะ','2022-04-27','คราวหลังเดะมาซื้อ มีงบแบบจุกๆ'),(14,25,'อยากให้เอารองเท้าแรร์มาขายครับ','2022-04-27','เดะผมจัดคนแรกเลย'),(15,25,'เฟี้ยวจัด','2022-04-27','โคตรเท่'),(16,25,'สุดจัด','2022-04-27','ของจริง'),(17,27,'แจ๋ว','2022-04-27','โคตรเจ๋ง'),(18,25,'อยากให้เอารองเท้ามาขายเยอะๆ','2022-04-29','อยากให้เอารองเท้ามาขายเยอะๆอยากให้เอารองเท้ามาขายเยอะๆอยากให้เอารองเท้ามาขายเยอะๆอยากให้เอารองเท้ามาขายเยอะๆอยากให้เอารองเท้ามาขายเยอะๆ'),(19,25,'อย่างแจ๋วอะ','2022-05-01','ผมแลกเกงในไปแล้วครับอย่างเท่ มีโลโก้ตรงเป้าด้วย5555555555');
/*!40000 ALTER TABLE `requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `token_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token` text NOT NULL,
  PRIMARY KEY (`token_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES (1,22,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InVzZXIwMjAzIiwiaWF0IjoxNjUwNzg2NTE2LCJleHAiOjE2NTA4MDQ1MTZ9.UUJoDgpabkYjtIHKCHQhu9BNj1g184WARcmw55WbxHw'),(2,23,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InVzZXI1NTU1IiwiaWF0IjoxNjUwNzg2NjAwLCJleHAiOjE2NTA4MDQ2MDB9.gMxv83ejj_lQ33WsQLm2GV085WkCRC8sxf6iAxKvvCs'),(3,24,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InVzZXJfdGVzdCIsImlhdCI6MTY1MDc5MTE4OCwiZXhwIjoxNjUwODA5MTg4fQ.Y4O9G0cZjtVCIvMr-cpXNJ0TlfK9c7bqSe9Lcez85fU'),(4,25,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InVzZXJfdDEiLCJpYXQiOjE2NTA3OTY3NTR9.q5jhcws0SWRW-cqerEV0zzFGgoU0rF8Yr8KE-31gOtk'),(5,26,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFzZGZnaCIsImlhdCI6MTY1MDc5Nzk4NH0.WGcYIHF5VCtzaJiEsY_PPWMqkGA3E5b6vox-Yq3_sf0'),(6,27,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InVzZXJfdDIiLCJpYXQiOjE2NTEwNjc1Mjh9.mtUVm5c3NvXByoLvu_JCBO8G9shCm3XoTkYXtBqDpmc'),(7,28,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImFkbWluX3QxIiwiaWF0IjoxNjUxMTMzNTgzfQ.sztOIZcL9nrfst4DHK9B1NKAOw6HuVdcnEJ1nzd79aM');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_fname` varchar(255) DEFAULT NULL,
  `user_lname` varchar(255) DEFAULT NULL,
  `user_point` int DEFAULT NULL,
  `user_address` varchar(255) DEFAULT NULL,
  `user_tel` char(10) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_username` varchar(255) DEFAULT NULL,
  `user_role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`),
  UNIQUE KEY `user_username` (`user_username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'สมควร','สมวยถลอก',0,'อยู่ในใจเธอ','0999999923','admin','admin1@gmail.com','admin','admin'),(2,'สมชี','ท่านอนกองกับพื้น',123123,'อยู่กับผัว','0999992323','somshe','somshe@hotmail.com','somshe','normal'),(3,'สมมวย','เป็นคนดี',0,'155/66 LA','0864878787','samul','samul@ok.com','samul','admin'),(4,'รธา','วงไข่น้อย',3123,'776 Thailand','0878776786','rata44','rata@gmail.com','rata23','normal'),(5,'ยิ่งสัก','ยิ่งรวย',0,'MasterChef','0967866666','yek123','yk@gmail.com','kydurex','admin'),(6,'ดารินทร์','แสงกระจ่าง',12323,'สงขลา','0869423517','sangja','admin6@gmail.com','sangja','normal'),(7,'เมนิลา','วิไลรัตน์',0,'อ่างทอง','0963487521','556677','admin7@gmail.com','admin7','admin'),(8,'ชลธี','อรุณฉาย',232,'เชียงใหม่','0976588823','654321','admin8@gmail.com','changmai','normal'),(9,'บัลลังค์','ปานประกอบ',23,'ชัยภูมิ','0877569982','875612','admin9@gmail.com','kuy123','normal'),(10,'ภูมิ','ไม้ทอง',0,'ชลบุรี','0988753221','af6845','admin10@gmail.com','admin10','admin'),(11,'ชนายุส','เกียรติบวรสกุล',0,'อยู่บ้าน','0932423411','admin11','emp11@gmail.com','admin11','admin'),(12,'นนท์','วงศ์วริศธารา',21,'อยู่โรงเรียน','0871243125','admin12','emp12@gmail.com','asas12','normal'),(13,'ชยพล','วีรภัทรเมธี',1223,'อยู่โรงแรม','0651312312','admin13','emp13@gmail.com','isas2','normal'),(14,'ดรัณภพ','ศรีสุข',0,'อยู่ทะเล','0992134455','admin14','emp14@gmail.com','admin14','admin'),(15,'ชัชชน','พุ่มสนธิ',232,'อยู่บนเขา','0985235211','admin15','emp15@gmail.com','too','normal'),(16,NULL,NULL,0,NULL,NULL,'1234566',NULL,'user111','normal'),(22,NULL,NULL,0,NULL,NULL,'$2b$10$ebA3odKwGMzK4WfCKsaMeek1F2gKCWahgIo5AtfcOwOHmIq7xlVfu',NULL,'user0203','normal'),(23,NULL,NULL,0,NULL,NULL,'$2b$10$PQSZZfNCncVkG43ctuVlFOcp9lSGqrOLf83reLCWQ9Yuql7061VYG',NULL,'user5555','normal'),(24,NULL,NULL,0,NULL,NULL,'$2b$10$zGBYIS4QyaD5s9JFNxyzEu9U2KpB1UEVw5DwxXCVmielKK8rSCyYq',NULL,'user_test','normal'),(25,'Peter','Saawu',1232,'123/4 ซอยหอม ถนนห้ามห้วง เขตหวงห้าม เมืองวากานดา 69696','0944939210','$2b$10$llLxo9LlWiBa5CS78wmi4OougrnjmwZJ1sAqh0g.ijryFWIvgOJsG','ptsadw@gmail.com','user_t1','normal'),(26,NULL,NULL,0,NULL,NULL,'$2b$10$Igk5Zx5ZxRn1.mdTPiHMReC3MYHqiYOOFk1IopjAojJKWgvAyk/ge',NULL,'asdfgh','normal'),(27,'Micheal','Scofield',0,'ซอยตัน เขคหวงห้าม','0923124493','$2b$10$A7avkcjO2.FH7I5sF9PIoeIKSmT/gwswQODQgQrFsQiAyAmihkMg2','micsco@mail.ex','user_t2','normal'),(28,'ธรรมะแท้','ไม่มีคำปลอบใจ',0,'อยู่ในใจเธออะ','0695939322','$2b$10$LUElyC7YDFQz4zilxHH6puRcOm.jZl1ETI6bnUaaNIMcB71aBVyTG','validatearainaknawa@isus.com','admin_t1','admin');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_redeem`
--

DROP TABLE IF EXISTS `user_redeem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_redeem` (
  `user_redeem_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `red_id` int NOT NULL,
  PRIMARY KEY (`user_redeem_id`,`user_id`,`red_id`),
  KEY `user_redeem_FK_1` (`red_id`),
  KEY `cust_redeem_FK` (`user_id`),
  CONSTRAINT `user_redeem_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_redeem_FK_1` FOREIGN KEY (`red_id`) REFERENCES `redeem` (`red_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_redeem`
--

LOCK TABLES `user_redeem` WRITE;
/*!40000 ALTER TABLE `user_redeem` DISABLE KEYS */;
INSERT INTO `user_redeem` VALUES (2,7,2),(3,25,2),(4,25,3),(9,25,4),(10,25,4),(1,3,5),(5,25,5),(6,25,5),(7,25,5),(8,25,5);
/*!40000 ALTER TABLE `user_redeem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-02 12:53:32
