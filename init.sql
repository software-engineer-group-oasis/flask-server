-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: house_rental
-- ------------------------------------------------------
-- Server version	8.4.4

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
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenities` (
  `amenity_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `amenity_name` varchar(50) NOT NULL,
  PRIMARY KEY (`amenity_id`),
  UNIQUE KEY `amenity_id` (`amenity_id`),
  UNIQUE KEY `amenity_name` (`amenity_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES (4,'air_conditioner'),(9,'bed'),(7,'kitchen'),(1,'refrigerator'),(3,'shower_head'),(6,'sofa'),(10,'toilet'),(5,'tv'),(2,'washing_machine'),(8,'wifi');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `location_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  PRIMARY KEY (`location_id`),
  UNIQUE KEY `location_id` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'华强城圣波拉(五期)','安阳','河南'),(2,'富利大楼  (芙蓉 五一广场)','长沙','湖南'),(3,'贵乌中路227号楼(云岩)贵乌路','贵阳','贵州'),(4,'恒大帝景(商住楼)  (云岩 三桥)','贵阳','贵州'),(5,'北大资源梦想城6组团  (观山湖 高新区)\n	房屋配套','贵阳','贵州'),(6,'花果园半山小镇X区  (南明 花果园)\n	房屋配套','贵阳','贵州'),(7,'将军庙小区 (鼓楼 湖南路)','南京','江苏'),(8,'西华东村社区 (秦淮 瑞金路)','南京','江苏'),(9,'明发财富中心 (浦口 江浦街道)','南京','江苏'),(10,'金盛花园(江宁) (江宁 岔路口)','南京','江苏'),(11,'明秀望江苑 (栖霞 摄山星城)','南京','江苏'),(12,'学府壹号 3室2厅2卫 豪华装修 120平 电梯房','三明','福建'),(13,'和仁新村  (三元 列西)','三明','福建'),(14,'宏宇花园  (三元 列东)','三明','福建'),(15,'丁香新村  (三元 列东)','三明','福建'),(16,'金朗园  (津南 咸水沽)','天津','天津'),(17,'雅居乐御宾府雅玥  (津南 海河教育园区) ','天津','天津'),(18,'博联大厦  (和平 和平周边)','天津','天津'),(19,'招商津湾天玺  (和平 小白楼)','天津','天津'),(20,'龙城花园N区  (昌平 回龙观)','北京','北京');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `properties` (
  `property_id` varchar(36) NOT NULL,
  `owner_id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `type` varchar(50) DEFAULT NULL,
  `floor` varchar(50) DEFAULT NULL,
  `direction` varchar(50) DEFAULT NULL,
  `decorate` varchar(50) DEFAULT NULL,
  `house_type` varchar(50) DEFAULT NULL,
  `beds` int DEFAULT NULL,
  `baths` int DEFAULT NULL,
  `area` decimal(10,2) DEFAULT NULL,
  `monthly_rate` decimal(10,2) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT '0',
  `location_id` int DEFAULT NULL,
  `seller_contact_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`property_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES ('1','1','出租华强层豪华装修，拎包入住，130平三室两卫屋内整洁如新，','强城高端社区院内环境优雅适合居住，房子原来业主自主．室内干净整洁，三室两厅两位拎包入住，家电家具齐全，想租给爱整洁的租客，','普通住宅','中层','南北','精装','3室2厅2卫生间',2,1,130.00,2500.00,0,1,1,'2024-01-01 00:00:00','2024-01-01 00:00:00'),('10','10','！单室急租 无中介 近地铁 可短租可月付 拎包入住 南北通透','非常感谢您的光临！让您在繁忙的城市生活中找到家的温暖。\\n【地理位置】位于江宁区宏运大道1903号，靠近岔路口商圈，交通便利。\\n【户型面积】1室1厅1卫，南向中层步梯房，面积约30平。\\n【家具家电】配备齐全，拎包入住。冰箱、洗衣机、热水器、电视、空调、智能门锁、油烟机、燃气灶等一应俱全。\\n【周边配套】周边有岗山超市、顾家百货、新城荟等购物中心，江宁医院(天地新城分院)近在咫尺，生活便利，医疗资源丰富。','普通住宅','中层(共6层)','朝南','精装修','1室1厅1卫',1,1,30.00,1400.00,0,10,10,'2025-05-16 13:31:34','2025-05-16 13:31:37'),('11','11','仙林湖北万达茂精装两室出租民用水电配套齐全近菜市场生命科技园','房间宽敞明亮，环保精装修，独立空间，配套齐全。\\n1. 配置齐全：空调、床、衣柜、床头柜、桌椅、晾衣架、台灯；\\n2. 厨房配备：冰箱、微波炉、燃气灶、油烟机；\\n3. 其他家电：洗衣机、热水器、100M光纤宽带；\\n4. 社区安全：实名登记、电子门禁、24小时轮班安保；\\n5. 免费服务：居住证、补贴材料、维修保障；\\n欢迎电话联系看房，拎包入住。','普通住宅','高层(共27层)','朝南','精装修','2室1厅1卫',2,1,70.00,1200.00,0,11,11,'2025-05-16 13:31:39','2025-05-16 13:31:40'),('12','12','学府壹号 3室2厅2卫 豪华装修 120平 电梯房','看房方便，朝南户型，设备齐全，生活便利，交通便捷','普通住宅','低层','南北','豪华装修','3室2厅2卫',3,2,120.00,3600.00,0,12,12,'2025-05-16 13:47:39','2025-05-16 13:47:41'),('13','13','满园春新出四房两卫 指纹锁 阳光房 露台 三楼','此套房源急租，地理位置好，户型方正，采光好，装修清楚，周边设施完善，购物买菜方便，家具家电齐全，可拎包入住。手上还有更多房源，欢迎来电咨询资深置业顾问小陈竭诚为您服务','普通住宅','中层(共8层)','朝东','精装修','4室2厅2卫',4,2,120.00,2600.00,0,13,13,'2025-05-16 13:48:49','2025-05-16 13:48:52'),('14','14','宏宇花园 3室1厅1卫','半年起租','普通住宅','中层(共16层)','朝南','精装','3室1厅1卫',3,1,108.00,2000.00,0,14,14,'2025-05-16 13:50:30','2025-05-16 13:50:33'),('15','15','4路丁香新村 精装2房租1500元 二中大润发爱琴海附近','房子干净整洁，好沟通。小区物业好，安全地处中心地段，交通，生活都方便。','普通住宅','中层(共8层)','朝南','精装','2室2厅1卫',2,1,78.00,1500.00,0,15,15,'2025-05-16 13:51:56','2025-05-16 13:51:58'),('16','16','可短租可月付6号线咸水沽西天津海运职业学院海教园吾悦广场精装','床衣柜沙发电视冰箱洗衣机空调热水器宽带暖气可做饭阳台独立卫生间','普通住宅','低层(共6层)','朝南','精装修','1室0厅1卫',1,1,40.00,1200.00,0,16,16,'2025-05-16 14:09:12','2025-05-16 14:09:14'),('17','17','雅玥两室加书房 精装修可短租 可月付 拎包入住 近地铁学校','本小区处于繁华地段，通风采光效果好，精装修，彰显你的尊贵，房屋使用空间面积大 交通便利，周边配套设施齐全，此户型宽敞明亮 小区率化率高，拎包入住即可，购物便捷，环境优雅，空气清新','普通住宅','中层(共15层) ','朝南','精装修','2室2厅1卫',2,1,98.00,2600.00,0,17,17,'2025-05-16 14:10:34','2025-05-16 14:10:36'),('18','18','自己的房 近大学城 豪华漂亮小屋 家电齐全 拎包入住','不是中介、不收取中介费、真实照片、真实价格 见实拍图:带清爽装修，照片上可见，现场实拍，随时看房。 有阳台、采光好、南北通透、精装修。','普通住宅','低层(共18层)','朝南','精装修','1室1厅1卫',1,1,50.00,2500.00,0,18,18,'2025-05-16 14:11:38','2025-05-16 14:11:40'),('19','19','招商津湾天玺 纯精装修一室出租 家具家电齐全 拎包入住随时看','家电齐全：全新家具，品牌家电，冰箱，空调，洗衣机等应有尽有，洗澡做饭都很方便 拎包就能入住 周边设施：周边各大商超、美食环绕其中，生活设施便利，吃喝玩乐，应有尽有','普通住宅','中层(共8层)','朝南','精装修','1室1厅1卫',1,1,116.18,6800.00,0,19,19,'2025-05-16 14:12:46','2025-05-16 14:12:48'),('2','2','高奢暗黑风 一房衣帽间 近IFS 交通便利 拎包入住','您好.有幸相识，。真诚相待。竭诚为您服务！一、房源\n优势（看房免费）\n1、地段好，交通方便，自佳、上班理想之选。2、自住\n装修、干净整洁，相片真实有效。\n3、房型正气、采光好、全明房。\n4、诚意出租，看房方便。\n5、找对拥有专业经验的居间方，让你免除租房纠纷之苦。．\n二、自我介绍\n我用我的专业和耐心对待每一位想拥有家的朋友，无论怎样我始终抱有一颗感恩的心以诚为信、以至为本，本人本着\'专业、热情和细致\'的服务原则，相信在目前的市场情况下，能给您更为合理的租房建议与置业规划本人24开\n机任何出租本人都能为您提供服务，期待与您合作，谢谢！\n附本人有任何价位任何楼盘房屋出租，欢迎您来电',' 普通住宅','高层(共22层)',' 朝南','精装修',' 1室1厅1卫',1,1,40.00,1350.00,0,2,2,'2025-05-15 19:35:27','2025-05-15 19:35:32'),('3','3','业主急租 贵医旁边 贵开路 精装2室 全家电 拎包入住 可谈','业主急租 贵医旁边 贵开路 精装2室 全家电 拎包入住 可谈  \n	业主急租 贵医旁边 贵开路 精装2室 全家电 拎包入住 可谈  \n	业主急租 贵医旁边 贵开路 精装2室 全家电 拎包入住 可谈','普通住宅','中层(共8层)','朝东','精装修','**2**室**2**厅**1**卫',2,1,72.00,1400.00,0,3,3,'2025-05-16 11:07:00','2025-05-16 11:07:03'),('4','4','恒大帝景(商住楼) 2室1厅1卫','1、户型：2室1厅1厨1卫，，半年起租  \n	2、装修：精装（自用-环保级材料）， 空调冰箱洗衣机热水器家电全齐 车位200一个月  \n	3、位置：观山湖区恒大帝景35栋22楼  \n	4、交通：多路公交车站，  \n	5、配套：楼下，电影院，购物中心  \n	6、环境：房子采光好，小区环境优美，24小时治安管理，周围交通方便，购物方便  \n	7、充电:电车，电瓶车都可以充电  \n	8、看房：看房方便，随时可以看房',NULL,'高层(共24层)','朝南','精装修','**2**室**1**厅**1**卫',2,1,81.00,1450.00,0,4,4,'2025-05-16 11:09:27','2025-05-16 11:09:29'),('5','5','北大资源梦想城6组团 1室1厅1卫','不是时时在线，可直接电联。  \n	全程自装，非串串房，毕竟生命更重要。家具家电齐全，小区成熟，购物方便，离地铁近。年轻人多。  \n	接受短租，包物业宽带，水电自理',NULL,'高层(共11层)','朝南','精装修','**1**室**1**厅**1**卫',1,1,45.00,1400.00,0,5,5,'2025-05-16 11:11:14','2025-05-16 11:11:17'),('6','6','花果园半山小镇X区 3室1厅1卫','花果园BRT旁精装3居室，交通方便，购物方便，押一付一，速度快！',NULL,'低层(共44层)','朝南','精装修','**3**室**1**厅**1**卫',3,1,89.00,1800.00,0,6,6,'2025-05-16 11:13:13','2025-05-16 11:13:16'),('7','7','马台街 三牌楼 东南大学 中大医院 湖南路 玄武门 模范马路','低容积率，高绿化率，有停车位，精装修，2室1厅1卫，面积52平米，南向，采光好。家电齐全，包括冰箱、电视、洗衣机、热水器、空调、宽带、油烟机、燃气灶等，可做饭。小区周边设施齐全，有乐购仕生活广场、马台街99号生活广场等购物中心，汇盟源超市、百世邻里超市等超市，还有挹江门社区卫生服务中心、东南大学附属中大医院等医院。交通便利，靠近多个公交站，如将军庙站，距离玄武门地铁站约1.6公里。押一付一，适合长期居住。','普通住宅','中层(共6层)','朝南','精装修','2室1厅1卫',2,1,52.70,2700.00,0,7,7,'2025-05-16 13:26:00','2025-05-16 13:26:02'),('8','8','整租瑞金路西华东村3室1厅','双人床、衣柜、餐桌、冰箱、洗衣机、空调、热水器、燃气；本房为整租房源，户型为3室1厅1卫，建筑面积为91.45平米，朝向为南北。小区位于秦淮区瑞金路，交通便利，生活设施齐全，适合家庭或多人居住。','普通住宅','共5层','南北','精装修','3室1厅1卫',3,1,91.45,5200.00,0,8,8,'2025-05-16 13:26:04','2025-05-16 13:26:10'),('9','9','明发财富中心 电梯房 阳光充足 拎包入住','你好！欢迎您进入我的！信达租房周李然将竭诚为您服务！本房为真实房源，家电齐全，拎包入住，南向采光好，配套完善。房子位于浦口区江浦街道的明发财富中心，电梯高层住宅，小区环境良好，交通便利，周边生活设施齐全，适合上班族或情侣居住。','普通住宅','中层(共33层)','朝南','精装修','1室1厅1卫',1,1,41.00,1500.00,0,9,9,'2025-05-16 13:26:12','2025-05-16 13:26:14'),('xxx','xxx','13号线命科学园，西二旗，随时看房，押一付一，无中介 无杂费','房屋介绍\n【没有中介】物业自持房源，没有中介，拒绝乱收费。\n【押一付一】房租可灵活支付，月付，季度付，半年付，年付可优惠。\n【家电齐全】全新家具，品牌家电，空调，洗衣机等，洗澡做饭都很方便。\n【品质装修】简单装修，白墙、实木地板、海尔热水器\n【入住保洁】入住前深度保洁，房间干干净净，没有异味，。\n【免费维修】房间入住后有任何维修问题，有专业的维修师傅免费维修，随叫随到\n【交通便利】房源临近地铁公交，出行方便。【周边设施】健身房、咖啡厅、发型工作室，美食环绕其中，配套设施完善强城高端社区院内环境优雅适合居住，房子原来业主自主．室内干净整洁，三室两厅两位拎包入住，家电家具齐全，想租给爱整洁的租客，','普通住宅','中层','朝南','精装修','1室1厅1卫生间',1,1,31.00,2800.00,0,20,20,'2025-05-18 00:00:00','2024-05-18 00:00:00');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_amenities`
--

DROP TABLE IF EXISTS `property_amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_amenities` (
  `property_id` varchar(36) NOT NULL,
  `amenity_id` int NOT NULL,
  PRIMARY KEY (`property_id`,`amenity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_amenities`
--

LOCK TABLES `property_amenities` WRITE;
/*!40000 ALTER TABLE `property_amenities` DISABLE KEYS */;
INSERT INTO `property_amenities` VALUES ('1',1),('1',3),('1',4),('1',5),('1',6),('1',7),('1',8),('1',9),('1',10),('10',1),('10',3),('10',4),('10',5),('10',6),('10',7),('10',8),('10',9),('10',10),('11',1),('11',2),('11',3),('11',4),('11',5),('11',6),('11',7),('11',8),('11',9),('11',10),('12',1),('12',2),('12',3),('12',4),('12',5),('12',6),('12',7),('12',8),('12',9),('12',10),('13',1),('13',2),('13',3),('13',4),('13',5),('13',6),('13',7),('13',8),('13',9),('13',10),('14',1),('14',2),('14',3),('14',4),('14',6),('14',8),('14',9),('15',1),('15',2),('15',3),('15',4),('15',5),('15',6),('15',8),('15',9),('15',10),('16',1),('16',2),('16',3),('16',4),('16',5),('16',6),('16',7),('16',8),('16',10),('17',2),('17',3),('17',5),('17',6),('17',7),('17',8),('17',9),('17',10),('18',1),('18',2),('18',5),('18',6),('18',7),('18',8),('18',9),('18',10),('19',1),('19',2),('19',3),('19',4),('19',5),('19',6),('19',8),('19',9),('19',10),('2',1),('2',2),('2',3),('2',4),('2',5),('2',6),('2',7),('2',8),('2',9),('2',10),('4',1),('4',2),('4',3),('4',4),('4',5),('4',6),('4',7),('4',8),('4',9),('4',10),('5',1),('5',2),('5',3),('5',4),('5',5),('5',6),('5',7),('5',8),('5',9),('5',10),('6',1),('6',2),('6',3),('6',5),('6',6),('6',7),('6',9),('6',10),('7',1),('7',2),('7',3),('7',4),('7',5),('7',6),('7',7),('7',8),('7',9),('7',10),('8',1),('8',2),('8',3),('8',4),('8',7),('8',8),('8',9),('8',10),('9',1),('9',3),('9',4),('9',5),('9',6),('9',7),('9',8),('9',9),('9',10),('xxx',1),('xxx',3),('xxx',4),('xxx',5),('xxx',6),('xxx',7),('xxx',8),('xxx',9),('xxx',10);
/*!40000 ALTER TABLE `property_amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_images`
--

DROP TABLE IF EXISTS `property_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_images` (
  `image_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `property_id` varchar(36) DEFAULT NULL,
  `image_url` text NOT NULL,
  `sort_order` int DEFAULT '0',
  PRIMARY KEY (`image_id`),
  UNIQUE KEY `image_id` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_images`
--

LOCK TABLES `property_images` WRITE;
/*!40000 ALTER TABLE `property_images` DISABLE KEYS */;
INSERT INTO `property_images` VALUES (1,'1','https://pic1.ajkimg.com/display/anjuke/5aca9d3ad3a0ee4e7308ff4c29bc1083/600x450c.jpg?t=1&srotate=1',0),(2,'1','https://pic1.ajkimg.com/display/anjuke/67aa88-%E9%94%A6%E5%B1%85%E6%88%BF%E4%BA%A7/75fc7e46ca9ffc4298bdee270ca1632a-800x650.jpg?frame=1',1),(3,'2','https://pic1.ajkimg.com/display/anjuke/fde71e5a6828f52933d54f77e4f1f75b/600x450c.jpg?t=1&srotate=1',0),(4,'2','https://pic1.ajkimg.com/display/anjuke/a70f8f4826f70ac65024a78619579842/600x450c.jpg?t=1&srotate=1',1),(5,'2','https://pic1.ajkimg.com/display/anjuke/08805f93f24be74b199a8ba957a69ea4/600x450c.jpg?t=1&srotate=1',2),(6,'2','https://pic1.ajkimg.com/display/anjuke/4c088620465c171ee8ca64467db5c0f3/600x450c.jpg?t=1&srotate=1',3),(7,'3','https://pic1.ajkimg.com/display/anjuke/721c197b129daa81075c1c35fc881cc3/600x600.jpg?t=1',0),(8,'3','https://pic1.ajkimg.com/display/anjuke/721c197b129daa81075c1c35fc881cc3/600x450c.jpg?t=1&srotate=1',1),(9,'3','https://pic1.ajkimg.com/display/anjuke/db196f5a098a7c1535e9eee498bdceff/600x450c.jpg?t=1&srotate=1',2),(10,'3','https://pic1.ajkimg.com/display/anjuke/b47d6c2f718aa925de72a5bb37d262fc/600x450c.jpg?t=1&srotate=1',3),(11,'3','https://pic1.ajkimg.com/display/anjuke/e2fb5302351234f77d84c42a7a1fbf7c/600x450c.jpg?t=1&srotate=1',4),(12,'3','https://pic1.ajkimg.com/display/anjuke/62a1c00f0e713927d06e06957a83cc1c/600x450c.jpg?t=1&srotate=1',5),(13,'3','https://pic1.ajkimg.com/display/anjuke/b7773da3068d23ddf2d2032809759c8e/600x450c.jpg?t=1&srotate=1',6),(14,'3','https://pic1.ajkimg.com/display/anjuke/8823b4dd9f12751fa8e742e513b0b80e/600x450c.jpg?t=1&srotate=1',7),(15,'4','https://pic1.ajkimg.com/display/anjuke/61d675e56d02deb94517e98e980a4585/600x450c.jpg?t=1&srotate=1',0),(16,'4','https://pic1.ajkimg.com/display/anjuke/a3a742583c17f07b2eab7d608b0ea97d/600x450c.jpg?t=1&srotate=1',1),(17,'4','https://pic1.ajkimg.com/display/anjuke/6b64583afd72a5d503fd7cae375f7f8a/600x450c.jpg?t=1&srotate=1',2),(18,'4','https://pic1.ajkimg.com/display/anjuke/2da87fdc9222c5b406562cf86eca8697/600x450c.jpg?t=1&srotate=1',3),(19,'4','https://pic1.ajkimg.com/display/anjuke/75508e48e1bcb0e87b42daa0c498f073/600x450c.jpg?t=1&srotate=1',4),(20,'4','https://pic1.ajkimg.com/display/anjuke/bc40febc9d3eeda4fd40085e56a42251/600x450c.jpg?t=1&srotate=1',5),(21,'4','https://pic1.ajkimg.com/display/anjuke/a6ce6b88ce804dc1b341ae628fd53f1e/600x450c.jpg?t=1&srotate=1',6),(22,'5','https://pic1.ajkimg.com/display/anjuke/58e98e8c578f90c0b9bc31f3648bd71b/600x450c.jpg?t=1&srotate=1',0),(23,'5','https://pic1.ajkimg.com/display/anjuke/1c79dffd3843fd9b267b361c2809f34b/600x450c.jpg?t=1&srotate=1',1),(24,'5','https://pic1.ajkimg.com/display/anjuke/266b25ec99f24e1b2a01b7ebecf4965b/600x450c.jpg?t=1&srotate=1',2),(25,'5','https://pic1.ajkimg.com/display/anjuke/44e09d365b5bf5790f2734a935d68d9a/600x450c.jpg?t=1&srotate=1',3),(26,'5','https://pic1.ajkimg.com/display/anjuke/34168682d8cf933a19ecd97c590abd60/600x450c.jpg?t=1&srotate=1',4),(27,'5','https://pic1.ajkimg.com/display/anjuke/34396f6f7228ebbb8828ddfd229c4d79/600x450c.jpg?t=1&srotate=1',5),(28,'5','https://pic1.ajkimg.com/display/anjuke/0a95754b37f2d4bcf8de76a7d6cddd9e/600x450c.jpg?t=1&srotate=1',6),(29,'6','https://pic1.ajkimg.com/display/anjuke/697207eadb6c77c400b2546071432d7d/600x450c.jpg?t=1&srotate=1',0),(30,'6','https://pic1.ajkimg.com/display/anjuke/a85744a4ef4066de0673124641391b15/600x450c.jpg?t=1&srotate=1',1),(31,'6','https://pic1.ajkimg.com/display/anjuke/033ecf6efa04ea76d3e67c360aac64c9/600x450c.jpg?t=1&srotate=1',2),(32,'6','https://pic1.ajkimg.com/display/anjuke/01a81a64668c9bf22c266ad9e084c175/600x450c.jpg?t=1&srotate=1',3),(33,'6','https://pic1.ajkimg.com/display/anjuke/5df28c4b8c207b9b028699ec1d2d10d8/600x450c.jpg?t=1&srotate=1',4),(34,'6','https://pic1.ajkimg.com/display/anjuke/697207eadb6c77c400b2546071432d7d/600x450c.jpg?t=1&srotate=1',5),(35,'6','https://pic1.ajkimg.com/display/anjuke/a85744a4ef4066de0673124641391b15/600x450c.jpg?t=1&srotate=1',6),(36,'7','https://pic1.ajkimg.com/display/anjuke/8e45eac04098f92e3d651d0b43dfda16/600x450c.jpg?t=1&srotate=1',0),(37,'7','https://pic1.ajkimg.com/display/anjuke/291a6837d57915f5b6d305aea271bffc/600x450c.jpg?t=1&srotate=1',1),(38,'7','https://pic1.ajkimg.com/display/anjuke/1f174ca466b45893e0fbcdc22a0ea708/600x450c.jpg?t=1&srotate=1',2),(39,'7','https://pic1.ajkimg.com/display/anjuke/859ac1733c352618075190a7f35efa73/600x450c.jpg?t=1&srotate=1',3),(40,'7','https://pic1.ajkimg.com/display/anjuke/ee3f0d4882a79201da299cb040cca9e9/600x450c.jpg?t=1&srotate=1',4),(41,'7','https://pic1.ajkimg.com/display/anjuke/24cba3fa40a37416d159e4bbd5fde426/600x450c.jpg?t=1&srotate=1',5),(42,'7','https://pic1.ajkimg.com/display/anjuke/b029d287402d7e7b58ff6d5b7e58dc4f/600x450c.jpg?t=1&srotate=1',6),(43,'8','https://pic1.ajkimg.com/display/anjuke/73e8e039e6794c5e2e9e501f813608d9/600x450c.jpg?t=1&srotate=1',0),(44,'8','https://pic1.ajkimg.com/display/anjuke/89caae2f6a648e9b76a09547dded75b0/600x450c.jpg?t=1&srotate=1',1),(45,'8','https://pic1.ajkimg.com/display/anjuke/2c5cf051cd05ce64f331e60b693f4ab3/600x450c.jpg?t=1&srotate=1',2),(46,'8','https://pic1.ajkimg.com/display/anjuke/0afa7a68a62801dbee9480f3a141dcec/600x450c.jpg?t=1&srotate=1',3),(47,'8','https://pic1.ajkimg.com/display/anjuke/184afd706396b52ece18dd044bf0fcf7/600x450c.jpg?t=1&srotate=1',4),(48,'8','https://pic1.ajkimg.com/display/anjuke/796b66112f950ad18deb05fd3329d17e/600x450c.jpg?t=1&srotate=1',5),(49,'8','https://pic1.ajkimg.com/display/anjuke/1ee0ff45f30c8800d24e1e2c1ebeaf74/600x450c.jpg?t=1&srotate=1',6),(50,'8','https://pic1.ajkimg.com/display/anjuke/c1bf7b46c6d5feef86a58b73d27a479a/600x450c.jpg?t=1&srotate=1',7),(51,'8','https://pic1.ajkimg.com/display/anjuke/4179b110ef1f31fc8a502401b2b8c60f/600x450c.jpg?t=1&srotate=1',8),(52,'8','https://pic1.ajkimg.com/display/anjuke/6a95d4fe794d0ebc3785ea6a2b25d442/600x450c.jpg?t=1&srotate=1',9),(53,'8','https://pic1.ajkimg.com/display/anjuke/50a92d334507fed6a13f621a7160fdce/600x450c.jpg?t=1&srotate=1',10),(54,'9','https://pic1.ajkimg.com/display/anjuke/eb22ea3a0bcc2d10d5a1c84d3febb219/600x450c.jpg?t=1&srotate=1',0),(55,'9','https://pic1.ajkimg.com/display/anjuke/aa0a5fe944288f40f58ea66e037e2c2d/600x450c.jpg?t=1&srotate=1',1),(56,'9','https://pic1.ajkimg.com/display/anjuke/7a3cdd13678ee1babb8cac964f92d8fa/600x450c.jpg?t=1&srotate=1',2),(57,'9','https://pic1.ajkimg.com/display/anjuke/d549d16a0a92f227896d74ad24154374/600x450c.jpg?t=1&srotate=1',3),(58,'9','https://pic1.ajkimg.com/display/anjuke/ed2319e2badf23fa3240f95ede3bd490/600x450c.jpg?t=1&srotate=1',4),(59,'9','https://pic1.ajkimg.com/display/anjuke/763cd6967e189971d609d978bca25dee/600x450c.jpg?t=1&srotate=1',5),(60,'9','https://pic1.ajkimg.com/display/anjuke/8adeabc8dc4527b73be09bb0dc2dece7/600x450c.jpg?t=1&srotate=1',6),(61,'10','https://pic1.ajkimg.com/display/anjuke/2908a1cc807d770e9d8e1e9427655920/600x450c.jpg?t=1&srotate=1',0),(62,'10','https://pic1.ajkimg.com/display/anjuke/d6f246c9e466e11e41b7cbe99b325672/600x450c.jpg?t=1&srotate=1',1),(63,'10','https://pic1.ajkimg.com/display/anjuke/7f6a34446b21ff184a12afdaa9c64f8a/600x450c.jpg?t=1&srotate=1',2),(64,'10','https://pic1.ajkimg.com/display/anjuke/994dd11ecde6e7dd07d1202b866ee7a1/600x450c.jpg?t=1&srotate=1',3),(65,'10','https://pic1.ajkimg.com/display/anjuke/d7c1804bf8742b8cd34a8de20229c74d/600x450c.jpg?t=1&srotate=1',4),(66,'10','https://pic1.ajkimg.com/display/anjuke/77827f287b68259c3cb0dd46413d7295/600x450c.jpg?t=1&srotate=1',5),(67,'10','https://pic1.ajkimg.com/display/anjuke/8505978be3a1778ab38690d6af9ac50f/600x450c.jpg?t=1&srotate=1',6),(68,'11','https://pic1.ajkimg.com/display/anjuke/67fca7393182b54b7c46e362a2964c90/600x450c.jpg?t=1&srotate=1',0),(69,'11','https://pic1.ajkimg.com/display/anjuke/e260a142051fddfa25b787fc11a64df5/600x450c.jpg?t=1&srotate=1',1),(70,'11','https://pic1.ajkimg.com/display/anjuke/0d88405fb344ba0c18cc9f0f72d0bb55/600x450c.jpg?t=1&srotate=1',2),(71,'11','https://pic1.ajkimg.com/display/anjuke/192bc0a717fbb27468f5c08916fd43a4/600x450c.jpg?t=1&srotate=1',3),(72,'11','https://pic1.ajkimg.com/display/anjuke/da21a0d9364a023c7c4d163834f8ab75/600x450c.jpg?t=1&srotate=1',4),(73,'11','https://pic1.ajkimg.com/display/anjuke/7108291ba5b8c9486e65bc9dc3aa9d31/600x450c.jpg?t=1&srotate=1',5),(74,'11','https://pic1.ajkimg.com/display/anjuke/c63c02489188fdaf3d8d5740b5670239/600x450c.jpg?t=1&srotate=1',6),(75,'11','https://pic1.ajkimg.com/display/anjuke/c837b178dd07cf34218522de23dea6b3/600x450c.jpg?t=1&srotate=1',7),(76,'11','https://pic1.ajkimg.com/display/anjuke/00e02f803dfb65ebc4c99876964e3bd8/600x450c.jpg?t=1&srotate=1',8),(77,'11','https://pic1.ajkimg.com/display/anjuke/0bc8f4a5fffcc580d2a02123bf949f74/600x450c.jpg?t=1&srotate=1',9),(78,'12','https://pic1.ajkimg.com/display/anjuke/b7228742157cef957d2a7bf9024fb1ef/600x450c.jpg?t=1&srotate=1',0),(79,'12','https://pic1.ajkimg.com/display/anjuke/7e30c734556b09a87b7e86e328901fcf/600x450c.jpg?t=1&srotate=1',1),(80,'13','https://pic1.ajkimg.com/display/anjuke/23f2246effbf1ca4efe2f6a2a6562f07/600x450c.jpg?t=1&srotate=1',0),(81,'13','https://pic1.ajkimg.com/display/anjuke/50e91f97e644b7d2bec20635787c2fdd/600x450c.jpg?t=1&srotate=1',1),(82,'14','https://pic1.ajkimg.com/display/anjuke/ca155531fbf4db4007acb164b4066a55/600x450c.jpg?t=1&srotate=1',0),(83,'15','https://pic1.ajkimg.com/display/anjuke/16f1037295dbef8455cc795667241c78/600x450c.jpg?t=1&srotate=1',0),(84,'15','https://pic1.ajkimg.com/display/anjuke/759c70dc30f9417817139e8365d976ec/600x450c.jpg?t=1&srotate=1',1),(85,'16','https://pic1.ajkimg.com/display/anjuke/d5bcfa32d71a483057b704fd6488ed7b/600x450c.jpg?t=1&srotate=1',0),(86,'16','https://pic1.ajkimg.com/display/anjuke/64e45b5e8523d78aa0c9b35777ff14c4/600x450c.jpg?t=1&srotate=1 ',1),(87,'17','https://pic1.ajkimg.com/display/anjuke/b53067c0db844f86b8bace8c04cb5a83/600x450c.jpg?t=1&srotate=1',0),(88,'17','https://pic1.ajkimg.com/display/anjuke/472826006cc980dd73e55e0137adc098/600x450c.jpg?t=1&srotate=1 ',1),(89,'18','https://pic1.ajkimg.com/display/anjuke/220c6b12682ce8bd010e8422c5e1072b/600x450c.jpg?t=1&srotate=1',0),(90,'19','https://pic1.ajkimg.com/display/anjuke/48949c9c27d6818cad9517cb1e9a7a15/600x450c.jpg?t=1&srotate=1 ',0),(91,'19','https://pic1.ajkimg.com/display/anjuke/8bfa323fef344d7921b056a4c2ae9aad/600x450c.jpg?t=1&srotate=1',1),(92,'xxx','https://pic1.ajkimg.com/display/anjuke/18111c2e6cc2f73c6a6867c424213405/600x450c.jpg?t=1&srotate=1',0),(93,'xxx','https://pic1.ajkimg.com/display/anjuke/dc3d85dfd6cf8359ae9bf2cc043605c8/600x450c.jpg?t=1&srotate=1',1),(94,'xxx','https://pic1.ajkimg.com/display/anjuke/f9ffd3c408ebafd747daf7a0cffefa51/600x450c.jpg?t=1&srotate=1',2);
/*!40000 ALTER TABLE `property_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renters`
--

DROP TABLE IF EXISTS `renters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `renters` (
  `renter_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password_hash` varchar(100) NOT NULL,
  PRIMARY KEY (`renter_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renters`
--

LOCK TABLES `renters` WRITE;
/*!40000 ALTER TABLE `renters` DISABLE KEYS */;
INSERT INTO `renters` VALUES (1,'zph',NULL,'zph@mail.com',NULL,'pbkdf2:sha256:1000000$2a2lP6r0$cb44a92c057894f3fa866f5d3403feb08ad08b1898be261860f865092f576737');
/*!40000 ALTER TABLE `renters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_contacts`
--

DROP TABLE IF EXISTS `seller_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seller_contacts` (
  `contact_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  UNIQUE KEY `contact_id` (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_contacts`
--

LOCK TABLES `seller_contacts` WRITE;
/*!40000 ALTER TABLE `seller_contacts` DISABLE KEYS */;
INSERT INTO `seller_contacts` VALUES (1,'李美琴','limeiqin@gmail.com','617-555-5555',NULL,NULL),(2,'刘梦祺','liumengqi@gmail.com','617-555-5555',NULL,NULL),(3,'蹇国静','jianguojing@gmail.com','617-555-5555',NULL,'pbkdf2:sha256:1000000$vyyIkehI$528ae6b2e5f30fe6a6b145865d59809a113c085060ae9d81b55e77b385779e09'),(4,'谢房东','xiefangdong@gmail.com','617-555-5555',NULL,'pbkdf2:sha256:1000000$IFoxMg8y$99154bc1abaf8cbd5bb07a00bb7ad6f156fd6fd6e0346a94ecef77658993717e'),(5,'1398*******','1398@gmail.com','617-555-5555',NULL,'pbkdf2:sha256:1000000$FXtO5VAi$c31c17570bf50f21cc8213d20955cddd53cf54bc574e31fb5b9c135657e5a044'),(6,'XvSojX','xvsojx@gmail.com','617-555-5555',NULL,'pbkdf2:sha256:1000000$qXmkzUBh$30101bc6f2efcfa641daae94ef6f1e242ec0a3768d3af00e372f0029ebe784b0'),(7,'王子明','wangziming@gmail.com','617-555-5555',NULL,'pbkdf2:sha256:1000000$xF6DVMs5$f7e3ad5d242cb3080ef55237e920e74c81c80fe647e72b895c4976142b6981f3'),(8,'胡媛','huyuan@gmail.com','617-555-5555',NULL,'pbkdf2:sha256:1000000$xF6DVMs5$f7e3ad5d242cb3080ef55237e920e74c81c80fe647e72b895c4976142b6981f3'),(9,'戚威','qiqi@gmail.com','617-555-5555',NULL,'pbkdf2:sha256:1000000$gmue46qU$c4fc2d2611f8e04303832c2d9b448246336a2f7490b7e048de6c1dc6c1d08b84'),(10,'王薛','wangxue@gamil.com','617-555-5555',NULL,'pbkdf2:sha256:1000000$cbFDsaNU$45a62f95e804c2a893f80f4382b52d506181d364049747947041b03a4af685cc'),(11,'张海翔','zhanghaixiang@gmail.com','617-555-5555',NULL,'pbkdf2:sha256:1000000$na8YVSPi$966ce3cb2d93625b5c41f1ea6b05f97faa54ae8cfe52947ad60bc6d7b6d8e781'),(12,'李永平','liyongping@gmail.com','13887211234',NULL,'pbkdf2:sha256:1000000$FXtO5VAi$c31c17570bf50f21cc8213d20955cddd53cf54bc574e31fb5b9c135657e5a044'),(13,'陈珍重','chenzhengzhong@gmail.com','15909185678',NULL,'pbkdf2:sha256:1000000$qXmkzUBh$30101bc6f2efcfa641daae94ef6f1e242ec0a3768d3af00e372f0029ebe784b0'),(14,'曾文','zengwen@gmail.com','18910283456',NULL,'pbkdf2:sha256:1000000$xF6DVMs5$f7e3ad5d242cb3080ef55237e920e74c81c80fe647e72b895c4976142b6981f3'),(15,'涂李梅','tulimei@gmail.com','18073627890',NULL,'pbkdf2:sha256:1000000$xF6DVMs5$f7e3ad5d242cb3080ef55237e920e74c81c80fe647e72b895c4976142b6981f3'),(16,'汪雪','wangxue1@gamil.com','13887211254',NULL,'pbkdf2:sha256:1000000$cbFDsaNU$45a62f95e804c2a893f80f4382b52d506181d364049747947041b03a4af685cc'),(17,'刘凯丽','liukaili@gamil.com','13909145678',NULL,'pbkdf2:sha256:1000000$na8YVSPi$966ce3cb2d93625b5c41f1ea6b05f97faa54ae8cfe52947ad60bc6d7b6d8e781'),(18,'钟昆妤','zhongkunshu@gamil.com','13610283456',NULL,'pbkdf2:sha256:1000000$FXtO5VAi$c31c17570bf50f21cc8213d20955cddd53cf54bc574e31fb5b9c135657e5a044'),(19,'任璧莹','renbiying@gmail.com','13773622890',NULL,'pbkdf2:sha256:1000000$qXmkzUBh$30101bc6f2efcfa641daae94ef6f1e242ec0a3768d3af00e372f0029ebe784b0'),(20,'陈子萧','chenzixiao@gmail.com','617-555-5555',NULL,NULL);
/*!40000 ALTER TABLE `seller_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(120) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-18 13:20:13
