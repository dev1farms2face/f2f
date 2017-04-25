-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: farms2face
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Customers');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (4,1,7),(5,1,8),(6,1,9),(10,1,22),(11,1,23),(12,1,24),(1,1,34),(2,1,35),(3,1,36),(7,1,46),(8,1,47),(9,1,48);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add base',7,'add_base'),(20,'Can change base',7,'change_base'),(21,'Can delete base',7,'delete_base'),(22,'Can add custom pack',8,'add_custompack'),(23,'Can change custom pack',8,'change_custompack'),(24,'Can delete custom pack',8,'delete_custompack'),(25,'Can add pre packs',9,'add_prepacks'),(26,'Can change pre packs',9,'change_prepacks'),(27,'Can delete pre packs',9,'delete_prepacks'),(28,'Can add recipe',10,'add_recipe'),(29,'Can change recipe',10,'change_recipe'),(30,'Can delete recipe',10,'delete_recipe'),(31,'Can add skin concern',11,'add_skinconcern'),(32,'Can change skin concern',11,'change_skinconcern'),(33,'Can delete skin concern',11,'delete_skinconcern'),(34,'Can add face pack',12,'add_facepack'),(35,'Can change face pack',12,'change_facepack'),(36,'Can delete face pack',12,'delete_facepack'),(37,'Can add skin type',13,'add_skintype'),(38,'Can change skin type',13,'change_skintype'),(39,'Can delete skin type',13,'delete_skintype'),(40,'Can add mixing agent',14,'add_mixingagent'),(41,'Can change mixing agent',14,'change_mixingagent'),(42,'Can delete mixing agent',14,'delete_mixingagent'),(43,'Can add ingredient',15,'add_ingredient'),(44,'Can change ingredient',15,'change_ingredient'),(45,'Can delete ingredient',15,'delete_ingredient'),(46,'Can add purchases',16,'add_purchases'),(47,'Can change purchases',16,'change_purchases'),(48,'Can delete purchases',16,'delete_purchases'),(49,'Can add pre pack',9,'add_prepack'),(50,'Can change pre pack',9,'change_prepack'),(51,'Can delete pre pack',9,'delete_prepack'),(52,'Can add option',17,'add_option'),(53,'Can change option',17,'change_option'),(54,'Can delete option',17,'delete_option'),(55,'Can add question',18,'add_question'),(56,'Can change question',18,'change_question'),(57,'Can delete question',18,'delete_question'),(58,'Can add questionnaire',19,'add_questionnaire'),(59,'Can change questionnaire',19,'change_questionnaire'),(60,'Can delete questionnaire',19,'delete_questionnaire'),(76,'Can add questionnaire entry',25,'add_questionnaireentry'),(77,'Can change questionnaire entry',25,'change_questionnaireentry'),(78,'Can delete questionnaire entry',25,'delete_questionnaireentry'),(79,'Can add questionnaire user data',26,'add_questionnaireuserdata'),(80,'Can change questionnaire user data',26,'change_questionnaireuserdata'),(81,'Can delete questionnaire user data',26,'delete_questionnaireuserdata'),(82,'Can add item',27,'add_item'),(83,'Can change item',27,'change_item'),(84,'Can delete item',27,'delete_item'),(85,'Can add recipe',28,'add_recipe'),(86,'Can change recipe',28,'change_recipe'),(87,'Can delete recipe',28,'delete_recipe'),(88,'Can add ingredient',29,'add_ingredient'),(89,'Can change ingredient',29,'change_ingredient'),(90,'Can delete ingredient',29,'delete_ingredient'),(91,'Can add base',30,'add_base'),(92,'Can change base',30,'change_base'),(93,'Can delete base',30,'delete_base'),(94,'Can add mixing agent',31,'add_mixingagent'),(95,'Can change mixing agent',31,'change_mixingagent'),(96,'Can delete mixing agent',31,'delete_mixingagent'),(97,'Can add payment',32,'add_payment'),(98,'Can change payment',32,'change_payment'),(99,'Can delete payment',32,'delete_payment'),(100,'Can add purchase history',33,'add_purchasehistory'),(101,'Can change purchase history',33,'change_purchasehistory'),(102,'Can delete purchase history',33,'delete_purchasehistory'),(103,'Can add face pack',34,'add_facepack'),(104,'Can change face pack',34,'change_facepack'),(105,'Can delete face pack',34,'delete_facepack'),(106,'Can add pre pack',35,'add_prepack'),(107,'Can change pre pack',35,'change_prepack'),(108,'Can delete pre pack',35,'delete_prepack'),(109,'Can add custom face pack',36,'add_customfacepack'),(110,'Can change custom face pack',36,'change_customfacepack'),(111,'Can delete custom face pack',36,'delete_customfacepack'),(112,'Can add item',37,'add_item'),(113,'Can change item',37,'change_item'),(114,'Can delete item',37,'delete_item'),(115,'Can add recipe',38,'add_recipe'),(116,'Can change recipe',38,'change_recipe'),(117,'Can delete recipe',38,'delete_recipe'),(124,'Can add ingredient',41,'add_ingredient'),(125,'Can change ingredient',41,'change_ingredient'),(126,'Can delete ingredient',41,'delete_ingredient'),(127,'Can add base',42,'add_base'),(128,'Can change base',42,'change_base'),(129,'Can delete base',42,'delete_base'),(133,'Can add mixing agent',44,'add_mixingagent'),(134,'Can change mixing agent',44,'change_mixingagent'),(135,'Can delete mixing agent',44,'delete_mixingagent'),(136,'Can add payment',45,'add_payment'),(137,'Can change payment',45,'change_payment'),(138,'Can delete payment',45,'delete_payment'),(139,'Can add purchase history',46,'add_purchasehistory'),(140,'Can change purchase history',46,'change_purchasehistory'),(141,'Can delete purchase history',46,'delete_purchasehistory'),(145,'Can add question',48,'add_question'),(146,'Can change question',48,'change_question'),(147,'Can delete question',48,'delete_question'),(148,'Can add option',49,'add_option'),(149,'Can change option',49,'change_option'),(150,'Can delete option',49,'delete_option'),(151,'Can add skin concern',50,'add_skinconcern'),(152,'Can change skin concern',50,'change_skinconcern'),(153,'Can delete skin concern',50,'delete_skinconcern'),(154,'Can add skin type',51,'add_skintype'),(155,'Can change skin type',51,'change_skintype'),(156,'Can delete skin type',51,'delete_skintype'),(157,'Can add questionnaire',52,'add_questionnaire'),(158,'Can change questionnaire',52,'change_questionnaire'),(159,'Can delete questionnaire',52,'delete_questionnaire'),(163,'Can add cart',54,'add_cart'),(164,'Can change cart',54,'change_cart'),(165,'Can delete cart',54,'delete_cart'),(166,'Can add face pack',55,'add_facepack'),(167,'Can change face pack',55,'change_facepack'),(168,'Can delete face pack',55,'delete_facepack'),(169,'Can add pre pack',56,'add_prepack'),(170,'Can change pre pack',56,'change_prepack'),(171,'Can delete pre pack',56,'delete_prepack'),(172,'Can add custom face pack',57,'add_customfacepack'),(173,'Can change custom face pack',57,'change_customfacepack'),(174,'Can delete custom face pack',57,'delete_customfacepack'),(175,'Can add questionnaire entry',58,'add_questionnaireentry'),(176,'Can change questionnaire entry',58,'change_questionnaireentry'),(177,'Can delete questionnaire entry',58,'delete_questionnaireentry'),(178,'Can add questionnaire user data',59,'add_questionnaireuserdata'),(179,'Can change questionnaire user data',59,'change_questionnaireuserdata'),(180,'Can delete questionnaire user data',59,'delete_questionnaireuserdata'),(181,'Can add shipping',60,'add_shipping'),(182,'Can change shipping',60,'change_shipping'),(183,'Can delete shipping',60,'delete_shipping'),(196,'Can add nonce',61,'add_nonce'),(197,'Can change nonce',61,'change_nonce'),(198,'Can delete nonce',61,'delete_nonce'),(199,'Can add code',62,'add_code'),(200,'Can change code',62,'change_code'),(201,'Can delete code',62,'delete_code'),(202,'Can add user social auth',63,'add_usersocialauth'),(203,'Can change user social auth',63,'change_usersocialauth'),(204,'Can delete user social auth',63,'delete_usersocialauth'),(205,'Can add association',65,'add_association'),(206,'Can change association',65,'change_association'),(207,'Can delete association',65,'delete_association'),(208,'Can add skin type ingredient',66,'add_skintypeingredient'),(209,'Can change skin type ingredient',66,'change_skintypeingredient'),(210,'Can delete skin type ingredient',66,'delete_skintypeingredient'),(211,'Can add profile',67,'add_profile'),(212,'Can change profile',67,'change_profile'),(213,'Can delete profile',67,'delete_profile'),(214,'Can add payment type',68,'add_paymenttype'),(215,'Can change payment type',68,'change_paymenttype'),(216,'Can delete payment type',68,'delete_paymenttype'),(217,'Can add credit card',69,'add_creditcard'),(218,'Can change credit card',69,'change_creditcard'),(219,'Can delete credit card',69,'delete_creditcard'),(220,'Can add pay pal',70,'add_paypal'),(221,'Can change pay pal',70,'change_paypal'),(222,'Can delete pay pal',70,'delete_paypal'),(223,'Can add shipping adrress',71,'add_shippingadrress'),(224,'Can change shipping adrress',71,'change_shippingadrress'),(225,'Can delete shipping adrress',71,'delete_shippingadrress'),(226,'Can add shipping address',71,'add_shippingaddress'),(227,'Can change shipping address',71,'change_shippingaddress'),(228,'Can delete shipping address',71,'delete_shippingaddress');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$30000$wJ7FQ8l0d9ET$ItsF1OOWjomvMm9qACDGIZMHZppATuUo95N9Bjk+p9w=','2017-04-19 06:22:57.723125',1,'root@localhost.com','root','','root@localhost.com',1,1,'2017-02-24 06:41:42.000000'),(2,'pbkdf2_sha256$30000$N7DFcunQbt7J$/nxGD/D49FTXxGi0rCNMXGeceVOXs6eeWedGD/0h/54=','2017-04-25 20:40:05.504887',1,'rajiv.raja@gmail.com','Rajiv','Raja','rajiv.raja@gmail.com',1,1,'2017-02-24 07:36:20.000000'),(3,'pbkdf2_sha256$30000$EU9d5NIZhY9a$wyyjpaVhzQfk0RuTZPWcgSA1+9Gm1RTPP1bMtX0uz2Q=','2017-04-09 01:28:19.172629',0,'sudhabhat26@gmail.com','Sudha','Bhat','sudhabhat26@gmail.com',0,1,'2017-02-24 07:36:43.000000'),(4,'pbkdf2_sha256$30000$YAOWKrNYVWdU$My6Xb2iVYxllVPJi/VY1IKnO2WRVh6eHhxt8WAygZs8=',NULL,0,'rupabhat@gmail.com','Rupa','Bhat','rupabhat@gmail.com',0,1,'2017-02-24 07:37:10.000000'),(6,'pbkdf2_sha256$30000$ky8H8tnyOOCa$st5Ww5jjtrCBhHpwJCuu90rcx4mdu5BNqZGI7PwGBhM=','2017-04-05 21:45:08.730318',0,'mridulakulkarni@gmail.com','Mridula','Kulkarni','mridulakulkarni@gmail.com',0,1,'2017-02-26 02:48:58.000000'),(192,'','2017-04-07 04:40:50.482957',0,'anon_mm69rleu22ep7r95pfsl876m0y0ctrlj','','','',0,1,'2017-04-07 04:40:50.475561'),(193,'','2017-04-07 16:31:04.149108',0,'anon_uiqzh5ymel508vzd582iea9le6kbfaj4','','','',0,1,'2017-04-07 16:31:04.090500'),(194,'','2017-04-07 16:36:36.271670',0,'anon_z0seymxydlstmos7suprh8zd4yoy9fe2','','','',0,1,'2017-04-07 16:36:36.261370'),(201,'','2017-04-08 05:09:50.972610',0,'anon_2hyu7lqblnf4336iux8s9f9n53xt2ils','','','',0,1,'2017-04-08 05:09:50.965967'),(204,'','2017-04-18 06:00:57.690598',0,'anon_lr8g6t7tva4ral5hqf4hcpw5pvui2drw','','','',0,1,'2017-04-18 06:00:57.661107'),(205,'','2017-04-18 06:02:35.514262',0,'anon_j4e5ybx1kulatvgox9d7xlzs1em7oeac','','','',0,1,'2017-04-18 06:02:35.498210'),(206,'','2017-04-18 06:04:24.562276',0,'anon_9yt93n7m8plduagskwyjbujya8htxva6','','','',0,1,'2017-04-18 06:04:24.555869'),(207,'','2017-04-18 06:07:54.416318',0,'anon_iirlw2tl9ymc1uh6416dzo822sxxqxss','','','',0,1,'2017-04-18 06:07:54.407705'),(213,'pbkdf2_sha256$30000$b93NA8LMyDLH$CG479jYKw1vH7j74R5/sBVCI/SpXiCLQ7WGTO+3AMhI=','2017-04-18 08:52:27.952405',0,'new@new.com','New User','Me','new@new.com',0,1,'2017-04-18 08:31:27.322966'),(221,'','2017-04-19 03:15:40.516862',0,'anon_2qbscemj2ln3mza4nahxzahl2l6q155i','','','',0,1,'2017-04-19 03:15:40.504600'),(224,'','2017-04-19 04:11:30.141408',0,'anon_6juehor5jivk7kkkmzul0jjpxvmsxnro','','','',0,1,'2017-04-19 04:11:30.128612');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (2,2,1),(3,3,1),(1,4,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cart`
--

DROP TABLE IF EXISTS `cart_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `createdte` datetime(6) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_cart_item_id_c66662e3_fk_home_item_id` (`item_id`),
  KEY `cart_cart_user_id_9b4220b9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `cart_cart_item_id_c66662e3_fk_home_item_id` FOREIGN KEY (`item_id`) REFERENCES `home_item` (`id`),
  CONSTRAINT `cart_cart_user_id_9b4220b9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cart`
--

LOCK TABLES `cart_cart` WRITE;
/*!40000 ALTER TABLE `cart_cart` DISABLE KEYS */;
INSERT INTO `cart_cart` VALUES (211,1,'2017-04-05 21:45:33.998506',219,6,'buy'),(212,1,'2017-04-05 21:45:37.776066',220,6,'buy'),(337,4,'2017-04-18 06:35:47.905679',346,1,'subscribe'),(338,4,'2017-04-18 06:35:50.296095',347,1,'subscribe'),(339,1,'2017-04-18 06:35:51.406401',348,1,'buy'),(347,4,'2017-04-19 06:31:42.210813',356,1,'subscribe'),(350,4,'2017-04-25 19:52:08.587023',359,2,'subscribe'),(351,4,'2017-04-25 20:26:04.280750',360,2,'subscribe'),(352,1,'2017-04-25 20:26:10.647938',361,2,'buy');
/*!40000 ALTER TABLE `cart_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-02-24 06:56:15.721716','1','Oily',1,'[{\"added\": {}}]',13,1),(2,'2017-02-24 06:56:24.242117','2','Dry',1,'[{\"added\": {}}]',13,1),(3,'2017-02-24 06:56:29.044538','3','Normal',1,'[{\"added\": {}}]',13,1),(4,'2017-02-24 06:57:13.831395','1','French green clay (not for sensitive skin)_Oily',1,'[{\"added\": {}}]',7,1),(5,'2017-02-24 06:57:21.636577','2','Bentonite clay_Oily',1,'[{\"added\": {}}]',7,1),(6,'2017-02-24 06:57:28.646691','3','Fuller\'s earth_Oily',1,'[{\"added\": {}}]',7,1),(7,'2017-02-24 06:57:36.859890','4','Rassoul Clay_Normal',1,'[{\"added\": {}}]',7,1),(8,'2017-02-24 06:57:44.624658','5','White Kaolin clay_Dry',1,'[{\"added\": {}}]',7,1),(9,'2017-02-24 06:58:10.599719','1','Rose water_Oily',1,'[{\"added\": {}}]',14,1),(10,'2017-02-24 06:58:17.431159','2','Aloe vera gel_Normal',1,'[{\"added\": {}}]',14,1),(11,'2017-02-24 06:58:28.967643','3','Cucumber gel_Normal',1,'[{\"added\": {}}]',14,1),(12,'2017-02-24 06:58:42.149664','4','Honey_Dry',1,'[{\"added\": {}}]',14,1),(13,'2017-02-24 06:58:47.315442','5','Honey_Normal',1,'[{\"added\": {}}]',14,1),(14,'2017-02-24 06:59:51.096103','1','Clog Pore',1,'[{\"added\": {}}]',11,1),(15,'2017-02-24 06:59:56.802101','2','Mild Acne',1,'[{\"added\": {}}]',11,1),(16,'2017-02-24 07:00:05.709580','3','Consistent Acne',1,'[{\"added\": {}}]',11,1),(17,'2017-02-24 07:00:10.175337','4','Severe Acne',1,'[{\"added\": {}}]',11,1),(18,'2017-02-24 07:00:14.570156','5','Anti-Aging Wrinkles plus Age Prevention',1,'[{\"added\": {}}]',11,1),(19,'2017-02-24 07:00:18.885948','6','Redness',1,'[{\"added\": {}}]',11,1),(20,'2017-02-24 07:00:23.336914','7','Sun Damage',1,'[{\"added\": {}}]',11,1),(21,'2017-02-24 07:00:28.248252','8','Dehydrated',1,'[{\"added\": {}}]',11,1),(22,'2017-02-24 07:00:33.350273','9','Large Pores',1,'[{\"added\": {}}]',11,1),(23,'2017-02-24 07:00:38.648026','10','Tired and Dull',1,'[{\"added\": {}}]',11,1),(24,'2017-02-24 07:00:43.318918','11','Sensitive and Irritated by Harsh Products',1,'[{\"added\": {}}]',11,1),(25,'2017-02-24 07:00:47.492257','12','Brown spots / blemishes',1,'[{\"added\": {}}]',11,1),(26,'2017-02-24 07:18:30.629445','1','Oily Clog Pore',1,'[{\"added\": {}}]',10,1),(27,'2017-02-24 07:18:45.620080','2','Oily Mild Acne',1,'[{\"added\": {}}]',10,1),(28,'2017-02-24 07:18:59.430470','3','Oily Consistent Acne',1,'[{\"added\": {}}]',10,1),(29,'2017-02-24 07:19:14.823108','4','Oily Severe Acne',1,'[{\"added\": {}}]',10,1),(30,'2017-02-24 07:19:38.221061','5','Oily Anti-Aging Wrinkles plus Age Prevention',1,'[{\"added\": {}}]',10,1),(31,'2017-02-24 07:20:44.794653','34','Sandalwood',3,'',15,1),(32,'2017-02-24 07:20:55.036411','9','Blueberry',3,'',15,1),(33,'2017-02-24 07:22:57.281791','6','Oily__Redness__Matcha',1,'[{\"added\": {}}]',10,1),(34,'2017-02-24 07:23:15.608773','7','Oily__Sun Damage__Cucumber',1,'[{\"added\": {}}]',10,1),(35,'2017-02-24 07:23:31.489694','8','Oily__Dehydrated__Coconut Water',1,'[{\"added\": {}}]',10,1),(36,'2017-02-24 07:23:45.071710','9','Oily__Large Pores__Egg White',1,'[{\"added\": {}}]',10,1),(37,'2017-02-24 07:23:56.457744','10','Oily__Tired and Dull__Oats',1,'[{\"added\": {}}]',10,1),(38,'2017-02-24 07:24:09.516241','11','Oily__Sensitive and Irritated by Harsh Products__Mint',1,'[{\"added\": {}}]',10,1),(39,'2017-02-24 07:24:22.789335','12','Oily__Brown spots / blemishes__Sandalwood Powder',1,'[{\"added\": {}}]',10,1),(40,'2017-02-24 07:25:05.823946','13','Dry__Clog Pore__Oats',1,'[{\"added\": {}}]',10,1),(41,'2017-02-24 07:25:17.273190','14','Dry__Mild Acne__Besan',1,'[{\"added\": {}}]',10,1),(42,'2017-02-24 07:25:32.778651','15','Dry__Consistent Acne__Strawberry',1,'[{\"added\": {}}]',10,1),(43,'2017-02-24 07:25:49.682895','16','Dry__Severe Acne__Sandalwood Powder',1,'[{\"added\": {}}]',10,1),(44,'2017-02-24 07:26:01.275118','17','Dry__Anti-Aging Wrinkles plus Age Prevention__Avocado',1,'[{\"added\": {}}]',10,1),(45,'2017-02-24 07:26:12.184114','18','Dry__Redness__Chamomile',1,'[{\"added\": {}}]',10,1),(46,'2017-02-24 07:26:22.855446','19','Dry__Sun Damage__Banana',1,'[{\"added\": {}}]',10,1),(47,'2017-02-24 07:26:33.787176','20','Dry__Dehydrated__Goat Milk Powder',1,'[{\"added\": {}}]',10,1),(48,'2017-02-24 07:26:47.066319','21','Dry__Large Pores__Coffee',1,'[{\"added\": {}}]',10,1),(49,'2017-02-24 07:26:57.127631','22','Dry__Tired and Dull__Papaya',1,'[{\"added\": {}}]',10,1),(50,'2017-02-24 07:27:11.903847','23','Dry__Sensitive and Irritated by Harsh Products__Nutmeg',1,'[{\"added\": {}}]',10,1),(51,'2017-02-24 07:27:24.417160','24','Dry__Brown spots / blemishes__Besan',1,'[{\"added\": {}}]',10,1),(52,'2017-02-24 07:27:35.448419','25','Normal__Clog Pore__Cacao',1,'[{\"added\": {}}]',10,1),(53,'2017-02-24 07:27:47.575957','26','Normal__Mild Acne__Blueberries',1,'[{\"added\": {}}]',10,1),(54,'2017-02-24 07:27:58.784278','27','Normal__Consistent Acne__Flax Seeds',1,'[{\"added\": {}}]',10,1),(55,'2017-02-24 07:28:10.360892','28','Normal__Severe Acne__Mangosteen',1,'[{\"added\": {}}]',10,1),(56,'2017-02-24 07:28:23.282374','29','Normal__Anti-Aging Wrinkles plus Age Prevention__Coffee',1,'[{\"added\": {}}]',10,1),(57,'2017-02-24 07:28:36.105166','30','Normal__Redness__Cucumber',1,'[{\"added\": {}}]',10,1),(58,'2017-02-24 07:28:46.113859','31','Normal__Sun Damage__Aloe Powder',1,'[{\"added\": {}}]',10,1),(59,'2017-02-24 07:29:04.959437','32','Normal__Dehydrated__Coconut Water',1,'[{\"added\": {}}]',10,1),(60,'2017-02-24 07:29:20.904775','33','Normal__Large Pores__Egg White',1,'[{\"added\": {}}]',10,1),(61,'2017-02-24 07:29:32.851144','34','Normal__Tired and Dull__Pomegranate',1,'[{\"added\": {}}]',10,1),(62,'2017-02-24 07:29:44.556166','35','Normal__Sensitive and Irritated by Harsh Products__Mint',1,'[{\"added\": {}}]',10,1),(63,'2017-02-24 07:29:56.156055','36','Normal__Brown spots / blemishes__Nutmeg',1,'[{\"added\": {}}]',10,1),(64,'2017-02-24 07:30:33.157654','12','Brown spots or blemishes',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',11,1),(65,'2017-02-24 07:34:43.537434','1','Customers',1,'[{\"added\": {}}]',4,1),(66,'2017-02-24 07:34:51.177270','1','Customers',2,'[]',4,1),(67,'2017-02-24 07:36:20.164921','2','RajivRaja',1,'[{\"added\": {}}]',3,1),(68,'2017-02-24 07:36:43.626845','3','Sudha',1,'[{\"added\": {}}]',3,1),(69,'2017-02-24 07:37:10.769395','4','Rupa',1,'[{\"added\": {}}]',3,1),(70,'2017-02-24 07:39:04.916245','4','RupaBhat',2,'[{\"changed\": {\"fields\": [\"username\", \"first_name\", \"last_name\", \"email\"]}}]',3,1),(71,'2017-02-24 07:39:30.537121','2','RajivRaja',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"email\"]}}]',3,1),(72,'2017-02-24 07:40:08.278705','3','SudhaBhat',2,'[{\"changed\": {\"fields\": [\"username\", \"first_name\", \"last_name\", \"email\"]}}]',3,1),(73,'2017-02-26 02:48:35.014074','5','',3,'',3,1),(74,'2017-02-26 02:49:18.708237','2','rajiv.raja@gmail.com',2,'[{\"changed\": {\"fields\": [\"username\"]}}]',3,1),(75,'2017-02-26 02:49:28.246503','4','rupabhat@gmail.com',2,'[{\"changed\": {\"fields\": [\"username\"]}}]',3,1),(76,'2017-02-26 02:49:39.418180','3','sudhabhat26@gmail.com',2,'[{\"changed\": {\"fields\": [\"username\"]}}]',3,1),(77,'2017-02-26 03:00:02.551991','6','mridula@gmail.com',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',3,1),(78,'2017-03-22 06:10:01.804288','1','<18',1,'[{\"added\": {}}]',17,1),(79,'2017-03-22 06:10:09.248039','2','18-29',1,'[{\"added\": {}}]',17,1),(80,'2017-03-22 06:10:15.067053','3','30-39',1,'[{\"added\": {}}]',17,1),(81,'2017-03-22 06:10:18.668367','4','40-49',1,'[{\"added\": {}}]',17,1),(82,'2017-03-22 06:10:29.219202','5','50-59',1,'[{\"added\": {}}]',17,1),(83,'2017-03-22 06:10:32.446444','6','60+',1,'[{\"added\": {}}]',17,1),(84,'2017-03-22 06:10:45.898721','7','Male',1,'[{\"added\": {}}]',17,1),(85,'2017-03-22 06:10:50.224197','8','Female',1,'[{\"added\": {}}]',17,1),(86,'2017-03-22 06:11:02.501110','9','Dry',1,'[{\"added\": {}}]',17,1),(87,'2017-03-22 06:11:06.091334','10','Humid',1,'[{\"added\": {}}]',17,1),(88,'2017-03-22 06:11:21.714642','11','Neither Dry nor Humid',1,'[{\"added\": {}}]',17,1),(89,'2017-03-22 06:11:27.328250','12','Tropical',1,'[{\"added\": {}}]',17,1),(90,'2017-03-22 06:11:35.246082','13','Never',1,'[{\"added\": {}}]',17,1),(91,'2017-03-22 06:11:38.271090','14','Rarely',1,'[{\"added\": {}}]',17,1),(92,'2017-03-22 06:11:41.846195','15','Sometimes',1,'[{\"added\": {}}]',17,1),(93,'2017-03-22 06:11:44.603011','16','Always',1,'[{\"added\": {}}]',17,1),(94,'2017-03-22 06:14:02.532335','17','Minimal',1,'[{\"added\": {}}]',17,1),(95,'2017-03-22 06:14:20.970839','18','Basic',1,'[{\"added\": {}}]',17,1),(96,'2017-03-22 06:14:43.827154','19','Moderate',1,'[{\"added\": {}}]',17,1),(97,'2017-03-22 06:15:19.584952','20','Advanced',1,'[{\"added\": {}}]',17,1),(98,'2017-03-22 06:15:34.090280','21','Not Applicabble',1,'[{\"added\": {}}]',17,1),(99,'2017-03-22 06:16:27.032335','21','Not Applicabble',3,'',17,1),(100,'2017-03-22 06:19:30.193750','22','Not Applicabble',1,'[{\"added\": {}}]',17,1),(101,'2017-03-22 06:24:43.839201','1','What\'s your age?',1,'[{\"added\": {}}]',18,1),(102,'2017-03-22 06:24:52.987660','2','What\'s your gender?',1,'[{\"added\": {}}]',18,1),(103,'2017-03-22 06:25:00.542070','3','What is your current environment?',1,'[{\"added\": {}}]',18,1),(104,'2017-03-22 06:25:08.446768','4','How often do you apply sunscreen?',1,'[{\"added\": {}}]',18,1),(105,'2017-03-22 06:25:24.853787','5','What best describes your morning skin routine?',1,'[{\"added\": {}}]',18,1),(106,'2017-03-22 06:25:33.375197','6','What best describes your evening skin routine?',1,'[{\"added\": {}}]',18,1),(107,'2017-03-22 06:25:40.639748','7','What is your Skin Type?',1,'[{\"added\": {}}]',18,1),(108,'2017-03-22 06:25:52.032002','8','Pick Your Top 3 Skin Concerns',1,'[{\"added\": {}}]',18,1),(109,'2017-03-22 06:54:02.401678','4','What\'s your age?',1,'[{\"added\": {}}]',19,1),(110,'2017-03-22 06:54:13.653922','5','What\'s your age?',1,'[{\"added\": {}}]',19,1),(111,'2017-03-22 06:54:22.531410','6','What\'s your age?',1,'[{\"added\": {}}]',19,1),(112,'2017-03-22 06:57:42.074401','6','What\'s your age? 30-39 None',2,'[]',19,1),(113,'2017-03-22 06:57:48.893853','7','What\'s your age? 40-49 None',1,'[{\"added\": {}}]',19,1),(114,'2017-03-22 06:57:53.325188','8','What\'s your age? 50-59 None',1,'[{\"added\": {}}]',19,1),(115,'2017-03-22 07:11:01.754791','9','What\'s your age? 60+ None',1,'[{\"added\": {}}]',19,1),(116,'2017-03-22 07:11:18.766210','10','What\'s your gender? Male None',1,'[{\"added\": {}}]',19,1),(117,'2017-03-22 07:11:23.533021','11','What\'s your gender? Female None',1,'[{\"added\": {}}]',19,1),(118,'2017-03-22 07:11:39.856164','12','What is your current environment? Dry None',1,'[{\"added\": {}}]',19,1),(119,'2017-03-22 07:11:44.956818','13','What is your current environment? Humid None',1,'[{\"added\": {}}]',19,1),(120,'2017-03-22 07:11:51.177961','14','What is your current environment? Neither Dry nor Humid None',1,'[{\"added\": {}}]',19,1),(121,'2017-03-22 07:11:56.824373','15','What is your current environment? Tropical None',1,'[{\"added\": {}}]',19,1),(122,'2017-03-22 07:12:07.258681','16','How often do you apply sunscreen? Never None',1,'[{\"added\": {}}]',19,1),(123,'2017-03-22 07:12:12.151568','17','How often do you apply sunscreen? Rarely None',1,'[{\"added\": {}}]',19,1),(124,'2017-03-22 07:12:16.675699','18','How often do you apply sunscreen? Sometimes None',1,'[{\"added\": {}}]',19,1),(125,'2017-03-22 07:12:22.062396','19','How often do you apply sunscreen? Always None',1,'[{\"added\": {}}]',19,1),(126,'2017-03-22 07:16:58.638852','20','What best describes your morning skin routine? Minimal',1,'[{\"added\": {}}]',19,1),(127,'2017-03-22 07:17:35.096068','21','What best describes your morning skin routine? Basic',1,'[{\"added\": {}}]',19,1),(128,'2017-03-22 07:17:42.638874','22','What best describes your morning skin routine? Moderate',1,'[{\"added\": {}}]',19,1),(129,'2017-03-22 07:17:47.283594','23','What best describes your morning skin routine? Advanced',1,'[{\"added\": {}}]',19,1),(130,'2017-03-22 07:17:53.232213','24','What best describes your morning skin routine? Not Applicabble',1,'[{\"added\": {}}]',19,1),(131,'2017-03-22 07:18:05.023901','25','What best describes your evening skin routine? Minimal',1,'[{\"added\": {}}]',19,1),(132,'2017-03-22 07:18:12.847021','26','What best describes your evening skin routine? Basic',1,'[{\"added\": {}}]',19,1),(133,'2017-03-22 07:18:17.160832','27','What best describes your evening skin routine? Moderate',1,'[{\"added\": {}}]',19,1),(134,'2017-03-22 07:18:21.612942','28','What best describes your evening skin routine? Advanced',1,'[{\"added\": {}}]',19,1),(135,'2017-03-22 07:18:26.012420','29','What best describes your evening skin routine? Not Applicabble',1,'[{\"added\": {}}]',19,1),(136,'2017-03-22 07:18:40.592505','22','Not Applicable',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',17,1),(137,'2017-03-22 07:20:45.821884','2','Dry',2,'[{\"changed\": {\"fields\": [\"helper\"]}}]',13,1),(138,'2017-03-22 07:20:59.471497','3','Normal',2,'[{\"changed\": {\"fields\": [\"helper\"]}}]',13,1),(139,'2017-03-22 07:21:22.167300','4','Oily T-zone and Dry otherwise',1,'[{\"added\": {}}]',13,1),(140,'2017-03-22 07:21:36.487403','5','Oily T-zone and Normal otherwise',1,'[{\"added\": {}}]',13,1),(141,'2017-03-22 07:22:43.335988','30','What is your Skin Type? None',1,'[{\"added\": {}}]',19,1),(142,'2017-03-22 07:22:57.270877','31','What is your Skin Type? None',1,'[{\"added\": {}}]',19,1),(143,'2017-03-22 07:23:01.938822','32','What is your Skin Type? None',1,'[{\"added\": {}}]',19,1),(144,'2017-03-22 07:23:07.660747','33','What is your Skin Type? None',1,'[{\"added\": {}}]',19,1),(145,'2017-03-22 07:23:15.495536','34','What is your Skin Type? None',1,'[{\"added\": {}}]',19,1),(146,'2017-03-22 07:23:21.639797','35','What is your Skin Type? None',1,'[{\"added\": {}}]',19,1),(147,'2017-03-22 07:24:25.961871','35','What is your Skin Type? Oily T-zone and Normal otherwise',3,'',19,1),(148,'2017-03-22 07:24:25.968919','34','What is your Skin Type? Oily T-zone and Dry otherwise',3,'',19,1),(149,'2017-03-22 07:24:31.046572','33','What is your Skin Type? Oily T-zone and Dry otherwise',2,'[]',19,1),(150,'2017-03-22 07:24:37.626787','36','What is your Skin Type? Oily T-zone and Normal otherwise',1,'[{\"added\": {}}]',19,1),(151,'2017-03-22 07:24:58.911633','37','Pick Your Top 3 Skin Concerns Clog Pore',1,'[{\"added\": {}}]',19,1),(152,'2017-03-22 07:25:03.795149','38','Pick Your Top 3 Skin Concerns Mild Acne',1,'[{\"added\": {}}]',19,1),(153,'2017-03-22 07:30:15.296421','38','Pick Your Top 3 Skin Concerns Mild Acne',2,'[]',19,1),(154,'2017-03-22 07:30:22.861505','39','Pick Your Top 3 Skin Concerns Consistent Acne',1,'[{\"added\": {}}]',19,1),(155,'2017-03-22 07:30:28.928011','40','Pick Your Top 3 Skin Concerns Severe Acne',1,'[{\"added\": {}}]',19,1),(156,'2017-03-22 07:30:34.303072','41','Pick Your Top 3 Skin Concerns Anti-Aging Wrinkles plus Age Prevention',1,'[{\"added\": {}}]',19,1),(157,'2017-03-22 07:30:38.365756','42','Pick Your Top 3 Skin Concerns Redness',1,'[{\"added\": {}}]',19,1),(158,'2017-03-22 07:30:43.414224','43','Pick Your Top 3 Skin Concerns Sun Damage',1,'[{\"added\": {}}]',19,1),(159,'2017-03-22 07:30:48.605792','44','Pick Your Top 3 Skin Concerns Sun Damage',1,'[{\"added\": {}}]',19,1),(160,'2017-03-22 07:30:53.636934','45','Pick Your Top 3 Skin Concerns Dehydrated',1,'[{\"added\": {}}]',19,1),(161,'2017-03-22 07:30:58.563081','46','Pick Your Top 3 Skin Concerns Large Pores',1,'[{\"added\": {}}]',19,1),(162,'2017-03-22 07:31:02.754287','47','Pick Your Top 3 Skin Concerns Tired and Dull',1,'[{\"added\": {}}]',19,1),(163,'2017-03-22 07:31:16.970495','44','Pick Your Top 3 Skin Concerns Sun Damage',3,'',19,1),(164,'2017-03-22 07:31:28.835962','47','Pick Your Top 3 Skin Concerns Tired and Dull',2,'[]',19,1),(165,'2017-03-22 07:31:34.437743','48','Pick Your Top 3 Skin Concerns Sensitive and Irritated by Harsh Products',1,'[{\"added\": {}}]',19,1),(166,'2017-03-22 07:31:39.460842','49','Pick Your Top 3 Skin Concerns Brown spots or blemishes',1,'[{\"added\": {}}]',19,1),(167,'2017-03-22 07:33:52.106649','49','Pick Your Top 3 Skin Concerns Brown spots or blemishes',3,'',19,1),(168,'2017-03-22 07:33:52.113392','48','Pick Your Top 3 Skin Concerns Sensitive and Irritated by Harsh Products',3,'',19,1),(169,'2017-03-22 07:33:52.115079','47','Pick Your Top 3 Skin Concerns Tired and Dull',3,'',19,1),(170,'2017-03-22 07:33:52.116346','46','Pick Your Top 3 Skin Concerns Large Pores',3,'',19,1),(171,'2017-03-22 07:33:52.117811','45','Pick Your Top 3 Skin Concerns Dehydrated',3,'',19,1),(172,'2017-03-22 07:33:52.119930','43','Pick Your Top 3 Skin Concerns Sun Damage',3,'',19,1),(173,'2017-03-22 07:33:52.121153','42','Pick Your Top 3 Skin Concerns Redness',3,'',19,1),(174,'2017-03-22 07:33:52.122205','41','Pick Your Top 3 Skin Concerns Anti-Aging Wrinkles plus Age Prevention',3,'',19,1),(175,'2017-03-22 07:33:52.123240','40','Pick Your Top 3 Skin Concerns Severe Acne',3,'',19,1),(176,'2017-03-22 07:33:52.124316','39','Pick Your Top 3 Skin Concerns Consistent Acne',3,'',19,1),(177,'2017-03-22 07:33:52.125380','38','Pick Your Top 3 Skin Concerns Mild Acne',3,'',19,1),(178,'2017-03-22 07:33:52.126469','37','Pick Your Top 3 Skin Concerns Clog Pore',3,'',19,1),(179,'2017-03-22 07:33:52.127554','36','What is your Skin Type? Oily T-zone and Normal otherwise',3,'',19,1),(180,'2017-03-22 07:33:52.128589','33','What is your Skin Type? Oily T-zone and Dry otherwise',3,'',19,1),(181,'2017-03-22 07:33:52.130426','32','What is your Skin Type? Normal',3,'',19,1),(182,'2017-03-22 07:33:52.131409','31','What is your Skin Type? Dry',3,'',19,1),(183,'2017-03-22 07:33:52.132401','30','What is your Skin Type? Oily',3,'',19,1),(184,'2017-03-22 07:46:19.414214','5','What\'s your age?',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(185,'2017-03-22 07:46:24.358007','5','What\'s your age?',2,'[]',19,1),(186,'2017-03-22 07:46:25.712589','5','What\'s your age?',2,'[]',19,1),(187,'2017-03-22 07:47:02.186043','6','What\'s your age? 30-39',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(188,'2017-03-22 07:47:11.756321','7','What\'s your age? 30-39',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(189,'2017-03-22 07:47:18.603892','8','What\'s your age? 40-49',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(190,'2017-03-22 07:47:25.248293','9','What\'s your age? 50-59',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(191,'2017-03-22 07:47:35.268639','7','What\'s your age? 40-49',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(192,'2017-03-22 07:47:40.629179','8','What\'s your age? 50-59',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(193,'2017-03-22 07:47:45.965843','9','What\'s your age? 60+',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(194,'2017-03-22 07:47:54.121513','10','What\'s your gender? Male',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(195,'2017-03-22 07:48:00.272363','11','What\'s your gender? Female',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(196,'2017-03-22 07:48:11.405281','12','What is your current environment? Dry',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(197,'2017-03-22 07:48:17.799995','13','What is your current environment? Humid',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(198,'2017-03-22 07:48:27.215707','14','What is your current environment? Neither Dry nor Humid',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(199,'2017-03-22 07:48:34.118532','15','What is your current environment? Tropical',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(200,'2017-03-22 07:48:42.415165','16','How often do you apply sunscreen? Never',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(201,'2017-03-22 07:48:48.236544','17','How often do you apply sunscreen? Rarely',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(202,'2017-03-22 07:48:53.610468','18','How often do you apply sunscreen? Sometimes',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(203,'2017-03-22 07:48:59.989408','19','How often do you apply sunscreen? Always',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(204,'2017-03-22 07:49:08.457056','20','What best describes your morning skin routine? Minimal',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(205,'2017-03-22 07:49:12.494459','21','What best describes your morning skin routine? Basic',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(206,'2017-03-22 07:49:17.418373','22','What best describes your morning skin routine? Moderate',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(207,'2017-03-22 07:49:23.291739','23','What best describes your morning skin routine? Advanced',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(208,'2017-03-22 07:49:28.307563','24','What best describes your morning skin routine? Not Applicable',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(209,'2017-03-22 07:49:33.283003','25','What best describes your evening skin routine? Minimal',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(210,'2017-03-22 07:49:40.034696','26','What best describes your evening skin routine? Basic',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(211,'2017-03-22 07:49:45.689678','27','What best describes your evening skin routine? Moderate',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(212,'2017-03-22 07:49:51.064790','28','What best describes your evening skin routine? Advanced',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(213,'2017-03-22 07:49:55.456994','29','What best describes your evening skin routine? Not Applicable',2,'[{\"changed\": {\"fields\": [\"option\"]}}]',19,1),(214,'2017-03-23 07:51:05.708840','5','Anti-Aging',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',11,1),(215,'2017-03-23 07:51:18.944699','11','Sensitive Skin',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',11,1),(216,'2017-03-23 07:57:14.488788','1','<<18',2,'[{\"changed\": {\"fields\": [\"name\", \"helper\"]}}]',17,1),(217,'2017-03-23 07:58:00.655579','1','<<18',2,'[{\"changed\": {\"fields\": [\"helper\"]}}]',17,1),(218,'2017-03-23 07:58:17.639302','1','< 18',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',17,1),(219,'2017-03-23 07:58:34.780703','6','60 +',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',17,1),(220,'2017-03-23 07:58:50.387580','2','18 - 29',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',17,1),(221,'2017-03-23 07:58:56.511706','3','30 - 39',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',17,1),(222,'2017-03-23 07:59:02.781940','4','40 - 49',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',17,1),(223,'2017-03-23 07:59:07.875499','5','50 - 59',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',17,1),(224,'2017-03-23 07:59:31.741397','2','18-29',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',17,1),(225,'2017-03-23 07:59:37.343149','3','30-39',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',17,1),(226,'2017-03-23 07:59:45.317602','4','40-49',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',17,1),(227,'2017-03-23 07:59:50.602238','5','50-59',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',17,1),(228,'2017-03-23 08:01:22.398136','1','What\'s your age?',2,'[{\"changed\": {\"fields\": [\"why\"]}}]',18,1),(229,'2017-03-23 08:10:29.087598','1','What\'s your age?',2,'[{\"changed\": {\"fields\": [\"why\"]}}]',18,1),(230,'2017-03-23 19:05:25.021890','45','NewMe',1,'[{\"added\": {}}]',NULL,1),(231,'2017-03-23 19:05:46.594534','45','NewMe',3,'',17,1),(232,'2017-03-23 20:42:27.693827','32','What is your Skin Type? Oily',1,'[{\"added\": {}}]',19,1),(233,'2017-03-23 20:42:32.938818','33','What is your Skin Type? Dry',1,'[{\"added\": {}}]',19,1),(234,'2017-03-23 20:42:38.622705','34','What is your Skin Type? Normal',1,'[{\"added\": {}}]',19,1),(235,'2017-03-23 20:42:43.680269','35','What is your Skin Type? Oily T-zone and Dry otherwise',1,'[{\"added\": {}}]',19,1),(236,'2017-03-23 20:42:49.048629','36','What is your Skin Type? Oily T-zone and Normal otherwise',1,'[{\"added\": {}}]',19,1),(237,'2017-03-23 20:57:10.735993','27','Oily T-zone and Normal otherwise',3,'',13,1),(238,'2017-03-23 20:57:10.742744','26','Oily T-zone and Dry otherwise',3,'',13,1),(239,'2017-03-23 20:57:59.462137','33','Oily T-zone (forehead, nose & chin)',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',11,1),(240,'2017-03-23 23:29:02.842438','3','Avocado',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',15,1),(241,'2017-03-23 23:31:23.014402','3','Avocado',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',15,1),(242,'2017-03-23 23:31:37.731398','3','Avocado',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',15,1),(243,'2017-03-23 23:34:18.341067','5','Honey_Normal',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',14,1),(244,'2017-03-23 23:34:26.543109','4','Honey_Dry',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',14,1),(245,'2017-03-23 23:34:40.911752','41','Yogurt',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',15,1),(246,'2017-03-23 23:36:21.929771','3','Avocado',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',15,1),(247,'2017-03-23 23:38:06.259915','3','Cucumber gel_Normal',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',14,1),(248,'2017-03-23 23:38:22.194857','2','Aloe vera gel_Normal',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',14,1),(249,'2017-03-23 23:38:29.946600','3','Cucumber gel_Normal',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',14,1),(250,'2017-03-23 23:38:38.629278','2','Aloe vera gel_Normal',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',14,1),(251,'2017-03-23 23:38:46.024901','1','Rose water_Oily',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',14,1),(252,'2017-03-23 23:40:31.708474','5','White Kaolin clay_Dry',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',7,1),(253,'2017-03-23 23:40:38.046642','4','Rassoul Clay_Normal',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',7,1),(254,'2017-03-23 23:40:42.613905','3','Fuller\'s earth_Oily',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',7,1),(255,'2017-03-23 23:40:47.575098','2','Bentonite clay_Oily',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',7,1),(256,'2017-03-23 23:40:52.757653','1','French green clay (not for sensitive skin)_Oily',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',7,1),(257,'2017-03-24 04:17:07.066330','5','White Kaolin clay_Dry',2,'[{\"changed\": {\"fields\": [\"helper\"]}}]',7,1),(258,'2017-03-24 04:17:10.497332','4','Rassoul Clay_Normal',2,'[{\"changed\": {\"fields\": [\"helper\"]}}]',7,1),(259,'2017-03-24 04:17:14.489257','3','Fuller\'s earth_Oily',2,'[{\"changed\": {\"fields\": [\"helper\"]}}]',7,1),(260,'2017-03-24 04:17:17.456947','2','Bentonite clay_Oily',2,'[{\"changed\": {\"fields\": [\"helper\"]}}]',7,1),(261,'2017-03-24 04:17:20.745074','1','French green clay (not for sensitive skin)_Oily',2,'[{\"changed\": {\"fields\": [\"helper\"]}}]',7,1),(262,'2017-03-24 04:17:30.699592','3','Cucumber gel_Normal',2,'[{\"changed\": {\"fields\": [\"helper\"]}}]',14,1),(263,'2017-03-24 04:17:34.284515','2','Aloe vera gel_Normal',2,'[{\"changed\": {\"fields\": [\"helper\"]}}]',14,1),(264,'2017-03-24 04:17:37.172627','1','Rose water_Oily',2,'[{\"changed\": {\"fields\": [\"helper\"]}}]',14,1),(265,'2017-03-24 05:30:23.075403','5','White Kaolin clay_Dry',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',7,1),(266,'2017-03-24 05:30:35.830506','3','Fuller\'s earth_Oily',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',7,1),(267,'2017-03-24 06:25:11.764230','1','French green clay (not for sensitive skin)_Oily',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',7,1),(268,'2017-03-25 01:45:00.910957','6','6',1,'[{\"added\": {}}]',55,1),(269,'2017-03-25 23:36:46.087682','39','anon_mbqvp365l1p5ba79t4tzwsngasn3h5rc',3,'',3,1),(270,'2017-03-26 20:02:19.429326','1','1 1 business day',1,'[{\"added\": {}}]',60,1),(271,'2017-03-26 20:03:06.395546','2','2 2 business days',1,'[{\"added\": {}}]',60,1),(272,'2017-03-26 20:04:02.466538','3','3 3-5 business days',1,'[{\"added\": {}}]',60,1),(273,'2017-03-26 20:04:39.282283','4','4 7-10 business days',1,'[{\"added\": {}}]',60,1),(274,'2017-03-27 03:03:49.448896','1','root',2,'[{\"changed\": {\"fields\": [\"first_name\", \"email\"]}}]',3,1),(275,'2017-03-28 05:31:18.204952','2','rajiv.raja1@gmail.com',2,'[{\"changed\": {\"fields\": [\"username\", \"email\"]}}]',3,1),(276,'2017-03-28 05:41:48.617055','2','rajiv.raja@gmail.com',2,'[{\"changed\": {\"fields\": [\"username\", \"email\"]}}]',3,1),(277,'2017-03-28 05:53:48.632444','2','rajiv.raja@gmail1.com',2,'[{\"changed\": {\"fields\": [\"username\", \"email\"]}}]',3,1),(278,'2017-03-28 05:54:40.197471','2','rajiv.raja1@gmail.com',2,'[{\"changed\": {\"fields\": [\"username\"]}}]',3,1),(279,'2017-03-28 07:13:43.207139','2','rajiv.raja@gmail.com',2,'[{\"changed\": {\"fields\": [\"username\", \"email\"]}}]',3,1),(280,'2017-03-28 16:53:43.059008','1','Oily_Aloe Powder',1,'[{\"added\": {}}]',66,1),(281,'2017-03-28 16:53:59.163096','1','Oily_Baking Soda',2,'[{\"changed\": {\"fields\": [\"ingredient\"]}}]',66,1),(282,'2017-03-28 16:54:17.597459','2','Oily_Bergamot Peel Essential Oil',1,'[{\"added\": {}}]',66,1),(283,'2017-03-28 16:54:26.069814','3','Oily_Besan',1,'[{\"added\": {}}]',66,1),(284,'2017-03-28 16:54:47.320619','4','Oily_Blueberries',1,'[{\"added\": {}}]',66,1),(285,'2017-03-28 16:55:00.082548','5','Oily_Carrots',1,'[{\"added\": {}}]',66,1),(286,'2017-03-28 16:55:19.257384','6','Oily_Chamomile',1,'[{\"added\": {}}]',66,1),(287,'2017-03-28 16:55:26.158753','7','Oily_Coconut Water',1,'[{\"added\": {}}]',66,1),(288,'2017-03-28 16:55:32.175506','8','Oily_Coffee',1,'[{\"added\": {}}]',66,1),(289,'2017-03-28 16:55:39.660234','9','Oily_Cucumber',1,'[{\"added\": {}}]',66,1),(290,'2017-03-28 16:55:46.041566','10','Oily_Egg White',1,'[{\"added\": {}}]',66,1),(291,'2017-03-28 16:55:53.728469','11','Oily_Fenugreek',1,'[{\"added\": {}}]',66,1),(292,'2017-03-28 16:56:01.127425','12','Oily_Flax Seeds',1,'[{\"added\": {}}]',66,1),(293,'2017-03-28 16:56:07.223063','13','Oily_Lavender Oil',1,'[{\"added\": {}}]',66,1),(294,'2017-03-28 16:56:12.799160','14','Oily_Lemon Juice',1,'[{\"added\": {}}]',66,1),(295,'2017-03-28 16:56:18.651882','15','Oily_Mangosteen',1,'[{\"added\": {}}]',66,1),(296,'2017-03-28 16:56:24.164757','16','Oily_Matcha',1,'[{\"added\": {}}]',66,1),(297,'2017-03-28 16:56:29.350273','17','Oily_Mint',1,'[{\"added\": {}}]',66,1),(298,'2017-03-28 16:56:34.204751','18','Oily_Neem',1,'[{\"added\": {}}]',66,1),(299,'2017-03-28 16:56:43.709450','19','Oily_Nutmeg',1,'[{\"added\": {}}]',66,1),(300,'2017-03-28 16:56:52.348502','20','Oily_Oats',1,'[{\"added\": {}}]',66,1),(301,'2017-03-28 16:56:59.500375','21','Oily_Orange Peel',1,'[{\"added\": {}}]',66,1),(302,'2017-03-28 16:57:36.757187','22','Oily_Sandalwood Powder',1,'[{\"added\": {}}]',66,1),(303,'2017-03-28 16:57:42.325644','23','Oily_Strawberry',1,'[{\"added\": {}}]',66,1),(304,'2017-03-28 16:57:48.334546','24','Oily_Trifala',1,'[{\"added\": {}}]',66,1),(305,'2017-03-28 16:57:54.066014','25','Oily_Turmeric',1,'[{\"added\": {}}]',66,1),(306,'2017-03-28 16:58:03.332678','26','Oily_White Willow Tree Bark',1,'[{\"added\": {}}]',66,1),(307,'2017-03-28 17:07:15.228920','42','Orange Juice',1,'[{\"added\": {}}]',41,1),(308,'2017-03-28 17:07:33.623574','27','Oily_Orange Juice',1,'[{\"added\": {}}]',66,1),(309,'2017-03-28 17:08:28.648032','28','Dry_Almonds',1,'[{\"added\": {}}]',66,1),(310,'2017-03-28 17:08:33.265590','29','Dry_Aloe Powder',1,'[{\"added\": {}}]',66,1),(311,'2017-03-28 17:08:39.783178','30','Dry_Avocado',1,'[{\"added\": {}}]',66,1),(312,'2017-03-28 17:08:45.282766','31','Dry_Banana',1,'[{\"added\": {}}]',66,1),(313,'2017-03-28 17:09:01.578845','32','Dry_Besan',1,'[{\"added\": {}}]',66,1),(314,'2017-03-28 17:09:06.898698','33','Dry_Blueberries',1,'[{\"added\": {}}]',66,1),(315,'2017-03-28 17:09:12.866315','34','Dry_Chamomile',1,'[{\"added\": {}}]',66,1),(316,'2017-03-28 17:09:20.268267','35','Dry_Coconut Water',1,'[{\"added\": {}}]',66,1),(317,'2017-03-28 17:09:28.833815','36','Dry_Coffee',1,'[{\"added\": {}}]',66,1),(318,'2017-03-28 17:09:36.611026','37','Dry_Cucumber',1,'[{\"added\": {}}]',66,1),(319,'2017-03-28 17:09:42.254283','38','Dry_Egg White',1,'[{\"added\": {}}]',66,1),(320,'2017-03-28 17:09:50.795441','39','Dry_Egg Yolk',1,'[{\"added\": {}}]',66,1),(321,'2017-03-28 17:09:56.300731','40','Dry_Fenugreek',1,'[{\"added\": {}}]',66,1),(322,'2017-03-28 17:10:07.622022','41','Dry_Goat Milk Powder',1,'[{\"added\": {}}]',66,1),(323,'2017-03-28 17:10:14.096645','42','Dry_Matcha',1,'[{\"added\": {}}]',66,1),(324,'2017-03-28 17:10:19.672469','43','Dry_Mint',1,'[{\"added\": {}}]',66,1),(325,'2017-03-28 17:10:25.519173','44','Dry_Nutmeg',1,'[{\"added\": {}}]',66,1),(326,'2017-03-28 17:10:31.859252','45','Dry_Oats',1,'[{\"added\": {}}]',66,1),(327,'2017-03-28 17:10:37.575528','46','Dry_Orange Peel',1,'[{\"added\": {}}]',66,1),(328,'2017-03-28 17:10:43.772023','47','Dry_Papaya',1,'[{\"added\": {}}]',66,1),(329,'2017-03-28 17:10:51.179657','48','Dry_Pomegranate',1,'[{\"added\": {}}]',66,1),(330,'2017-03-28 17:10:57.302842','49','Dry_Sandalwood Powder',1,'[{\"added\": {}}]',66,1),(331,'2017-03-28 17:11:04.088518','50','Dry_Silk Peptide',1,'[{\"added\": {}}]',66,1),(332,'2017-03-28 17:11:10.478497','51','Dry_Strawberry',1,'[{\"added\": {}}]',66,1),(333,'2017-03-28 17:11:17.045465','52','Dry_Trifala',1,'[{\"added\": {}}]',66,1),(334,'2017-03-28 17:11:25.682354','53','Dry_White Willow Tree Bark',1,'[{\"added\": {}}]',66,1),(335,'2017-03-28 17:11:58.281276','54','Normal_Aloe Powder',1,'[{\"added\": {}}]',66,1),(336,'2017-03-28 17:12:03.355458','55','Normal_Avocado',1,'[{\"added\": {}}]',66,1),(337,'2017-03-28 17:12:10.127279','56','Normal_Banana',1,'[{\"added\": {}}]',66,1),(338,'2017-03-28 17:12:15.764320','57','Normal_Besan',1,'[{\"added\": {}}]',66,1),(339,'2017-03-28 17:12:21.775114','58','Normal_Blueberries',1,'[{\"added\": {}}]',66,1),(340,'2017-03-28 17:12:26.080043','59','Normal_Cacao',1,'[{\"added\": {}}]',66,1),(341,'2017-03-28 17:12:44.494543','60','Normal_Carrots',1,'[{\"added\": {}}]',66,1),(342,'2017-03-28 17:12:50.919761','61','Normal_Chamomile',1,'[{\"added\": {}}]',66,1),(343,'2017-03-28 17:12:57.429961','62','Normal_Coconut Milk',1,'[{\"added\": {}}]',66,1),(344,'2017-03-28 17:13:04.001508','63','Normal_Coconut Water',1,'[{\"added\": {}}]',66,1),(345,'2017-03-28 17:13:10.777328','64','Normal_Coffee',1,'[{\"added\": {}}]',66,1),(346,'2017-03-28 17:13:15.782177','65','Normal_Cucumber',1,'[{\"added\": {}}]',66,1),(347,'2017-03-28 17:13:20.526137','66','Normal_Egg White',1,'[{\"added\": {}}]',66,1),(348,'2017-03-28 17:13:25.718953','67','Normal_Fenugreek',1,'[{\"added\": {}}]',66,1),(349,'2017-03-28 17:13:31.439370','68','Normal_Flax Seeds',1,'[{\"added\": {}}]',66,1),(350,'2017-03-28 17:13:37.646440','69','Normal_Goat Milk Powder',1,'[{\"added\": {}}]',66,1),(351,'2017-03-28 17:13:42.531988','70','Normal_Lavender Oil',1,'[{\"added\": {}}]',66,1),(352,'2017-03-28 17:13:50.021572','71','Normal_Mangosteen',1,'[{\"added\": {}}]',66,1),(353,'2017-03-28 17:13:54.884952','72','Normal_Matcha',1,'[{\"added\": {}}]',66,1),(354,'2017-03-28 17:13:59.586194','73','Normal_Mint',1,'[{\"added\": {}}]',66,1),(355,'2017-03-28 17:14:04.668936','74','Normal_Nutmeg',1,'[{\"added\": {}}]',66,1),(356,'2017-03-28 17:14:10.351601','75','Normal_Oats',1,'[{\"added\": {}}]',66,1),(357,'2017-03-28 17:14:15.567535','76','Normal_Orange Peel',1,'[{\"added\": {}}]',66,1),(358,'2017-03-28 17:14:22.041341','77','Normal_Papaya',1,'[{\"added\": {}}]',66,1),(359,'2017-03-28 17:14:27.879333','78','Normal_Pomegranate',1,'[{\"added\": {}}]',66,1),(360,'2017-03-28 17:14:33.777779','79','Normal_Sandalwood Powder',1,'[{\"added\": {}}]',66,1),(361,'2017-03-28 17:14:41.185438','80','Normal_Silk Peptide',1,'[{\"added\": {}}]',66,1),(362,'2017-03-28 17:14:47.064344','81','Normal_Turmeric',1,'[{\"added\": {}}]',66,1),(363,'2017-03-28 17:14:55.665022','82','Normal_White Willow Tree Bark',1,'[{\"added\": {}}]',66,1),(364,'2017-03-28 17:16:28.033502','11','Carrot',3,'',41,1),(365,'2017-04-03 21:11:28.824716','43','Essential Oils',1,'[{\"added\": {}}]',41,1),(366,'2017-04-03 21:26:09.472043','4','Rassoul Clay_Normal',2,'[]',42,1),(367,'2017-04-03 21:26:40.570418','6','Rassoul Clay_Normal',1,'[{\"added\": {}}]',42,1),(368,'2017-04-03 21:27:17.062446','6','White Kaolin clay_Normal',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',42,1),(369,'2017-04-03 21:27:57.769284','5','Goat Milk_Dry',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',42,1),(370,'2017-04-03 21:29:21.429056','3','Rose Water and Glycerine_Normal',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',44,1),(371,'2017-04-03 21:29:50.041838','6','Rose Water and Glycerine_Dry',1,'[{\"added\": {}}]',44,1),(372,'2017-04-03 21:51:20.989336','6','White Kaolin Clay_Normal',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',42,1),(373,'2017-04-03 22:07:22.541101','41','rajiv.raja@gmail.com',3,'',63,1),(374,'2017-04-05 03:02:39.573002','3','sudhabhat26@gmail.com',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',3,1),(375,'2017-04-05 04:56:30.431596','6','mridulakulkarni@gmail.com',2,'[{\"changed\": {\"fields\": [\"username\", \"email\"]}}]',3,1),(376,'2017-04-05 07:41:02.690365','1','rajiv.raja@gmail.com',2,'[{\"changed\": {\"fields\": [\"birth_date\", \"gender\"]}}]',67,1),(377,'2017-04-05 07:43:21.638441','1','rajiv.raja@gmail.com',2,'[{\"changed\": {\"fields\": [\"birth_date\"]}}]',67,1),(378,'2017-04-05 07:44:05.844677','1','rajiv.raja@gmail.com',2,'[{\"changed\": {\"fields\": [\"phone_number\", \"gender\", \"street1\", \"city\", \"state\", \"country\", \"zipcode\"]}}]',67,1),(379,'2017-04-05 07:57:59.721649','1','rajiv.raja@gmail.com',2,'[{\"changed\": {\"fields\": [\"gender\"]}}]',67,1),(380,'2017-04-05 18:11:01.888865','1','rajiv.raja@gmail.com Visa 4444',1,'[{\"added\": {}}]',69,1),(381,'2017-04-05 21:24:34.418970','35','Sandal Wood Powder',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',41,1),(382,'2017-04-05 22:52:12.258436','190','anon_6mmf8mpfhl4silb94vdtoaoqr1i4k1f2',3,'',3,1),(383,'2017-04-05 22:52:12.260036','191','anon_hvhw1rl9py6r5fh44jt3d0wct5clldko',3,'',3,1),(384,'2017-04-05 22:52:12.261437','188','anon_wvwet3q2o3csa49wwf7sx6w3dc5r6cgo',3,'',3,1),(385,'2017-04-05 22:52:12.262845','189','anon_x3r1ziz5d1aypv1imv0z6jt2zdjr3j0k',3,'',3,1),(386,'2017-04-06 17:10:02.619399','1','root@f2f.com',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',3,2),(387,'2017-04-06 17:10:50.933062','1','root@localhost.com',2,'[{\"changed\": {\"fields\": [\"username\", \"email\"]}}]',3,2),(388,'2017-04-06 17:10:59.255930','2','rajiv.raja@gmail.com',2,'[{\"changed\": {\"fields\": [\"is_superuser\"]}}]',3,2),(389,'2017-04-07 02:27:28.105861','7','7 rajiv.raja@gmail.com',3,'',45,1),(390,'2017-04-07 02:27:28.115052','6','6 rajiv.raja@gmail.com',3,'',45,1),(391,'2017-04-07 02:27:28.116603','5','5 rajiv.raja@gmail.com',3,'',45,1),(392,'2017-04-07 02:27:28.117981','4','4 rajiv.raja@gmail.com',3,'',45,1),(393,'2017-04-07 02:27:28.119413','3','3 rajiv.raja@gmail.com',3,'',45,1),(394,'2017-04-07 02:27:28.120775','2','2 rajiv.raja@gmail.com',3,'',45,1),(395,'2017-04-07 02:27:28.122586','1','1 rajiv.raja@gmail.com',3,'',45,1),(396,'2017-04-07 02:27:50.304995','1','rajiv.raja@gmail.com Visa True',3,'',68,1),(397,'2017-04-07 07:13:07.904868','14','rajiv.raja@gmail.com  True',3,'',68,2),(398,'2017-04-07 07:24:11.165703','15','rajiv.raja@gmail.com  True',3,'',68,2),(399,'2017-04-18 08:23:16.391269','210','',3,'',3,2),(400,'2017-04-18 08:23:58.444679','211','new@new.com',3,'',3,2),(401,'2017-04-18 08:28:59.240975','212','new@new.com',3,'',3,2),(402,'2017-04-19 02:38:11.040414','37','Straw berry',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',41,2),(403,'2017-04-19 02:38:21.827377','33','Pome granate',2,'[{\"changed\": {\"fields\": [\"name\"]}}]',41,2),(404,'2017-04-25 20:13:38.064810','41','Dry_Goat Milk Powder',3,'',66,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(54,'cart','cart'),(5,'contenttypes','contenttype'),(49,'facepackwizard','option'),(48,'facepackwizard','question'),(52,'facepackwizard','questionnaire'),(58,'facepackwizard','questionnaireentry'),(59,'facepackwizard','questionnaireuserdata'),(50,'facepackwizard','skinconcern'),(51,'facepackwizard','skintype'),(42,'home','base'),(57,'home','customfacepack'),(55,'home','facepack'),(41,'home','ingredient'),(37,'home','item'),(44,'home','mixingagent'),(56,'home','prepack'),(38,'home','recipe'),(66,'home','skintypeingredient'),(69,'payments','creditcard'),(45,'payments','payment'),(68,'payments','paymenttype'),(70,'payments','paypal'),(46,'payments','purchasehistory'),(60,'payments','shipping'),(6,'sessions','session'),(65,'social_auth','association'),(62,'social_auth','code'),(61,'social_auth','nonce'),(63,'social_auth','usersocialauth'),(67,'userregistration','profile'),(71,'userregistration','shippingaddress');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=245 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (181,'contenttypes','0001_initial','2017-03-27 08:16:15.943949'),(182,'auth','0001_initial','2017-03-27 08:16:15.952337'),(183,'admin','0001_initial','2017-03-27 08:16:15.954932'),(184,'admin','0002_logentry_remove_auto_add','2017-03-27 08:16:15.957842'),(185,'contenttypes','0002_remove_content_type_name','2017-03-27 08:16:15.960776'),(186,'auth','0002_alter_permission_name_max_length','2017-03-27 08:16:15.963718'),(187,'auth','0003_alter_user_email_max_length','2017-03-27 08:16:15.966536'),(188,'auth','0004_alter_user_username_opts','2017-03-27 08:16:15.969010'),(189,'auth','0005_alter_user_last_login_null','2017-03-27 08:16:15.971355'),(190,'auth','0006_require_contenttypes_0002','2017-03-27 08:16:15.973785'),(191,'auth','0007_alter_validators_add_error_messages','2017-03-27 08:16:15.976661'),(192,'auth','0008_alter_user_username_max_length','2017-03-27 08:16:15.979828'),(193,'facepackwizard','0001_initial','2017-03-27 08:16:15.982579'),(194,'home','0001_initial','2017-03-27 08:16:15.985283'),(195,'home','0002_item_price','2017-03-27 08:16:15.987922'),(196,'cart','0001_initial','2017-03-27 08:16:15.990533'),(197,'facepackwizard','0002_auto_20170324_1812','2017-03-27 08:16:15.993217'),(198,'facepackwizard','0003_auto_20170324_1817','2017-03-27 08:16:15.995785'),(199,'facepackwizard','0004_auto_20170324_1818','2017-03-27 08:16:15.998454'),(200,'home','0003_auto_20170324_1808','2017-03-27 08:16:16.003605'),(201,'home','0004_auto_20170324_1810','2017-03-27 08:16:16.006627'),(202,'home','0005_customfacepack_prepack','2017-03-27 08:16:16.010018'),(203,'home','0006_auto_20170324_1813','2017-03-27 08:16:16.013534'),(204,'home','0007_auto_20170324_1818','2017-03-27 08:16:16.016497'),(205,'home','0008_item_real_type','2017-03-27 08:16:16.019467'),(206,'home','0009_remove_item_real_type','2017-03-27 08:16:16.021952'),(207,'home','0010_item_real_type','2017-03-27 08:16:16.024276'),(208,'home','0011_remove_item_real_type','2017-03-27 08:16:16.026473'),(209,'home','0012_customfacepack_user','2017-03-27 08:16:16.028676'),(210,'payments','0001_initial','2017-03-27 08:16:16.030896'),(211,'payments','0002_remove_payment_createdte2','2017-03-27 08:16:16.033014'),(212,'payments','0003_auto_20170326_1258','2017-03-27 08:16:16.035120'),(213,'sessions','0001_initial','2017-03-27 08:16:16.037932'),(214,'default','0001_initial','2017-03-27 08:32:12.237696'),(215,'default','0002_add_related_name','2017-03-27 08:32:12.304421'),(216,'default','0003_alter_email_max_length','2017-03-27 08:32:12.328308'),(217,'default','0004_auto_20160423_0400','2017-03-27 08:32:12.367364'),(218,'social_auth','0005_auto_20160727_2333','2017-03-27 08:32:12.389226'),(219,'social_auth','0001_initial','2017-03-27 08:32:12.393547'),(220,'social_auth','0003_alter_email_max_length','2017-03-27 08:32:12.396027'),(221,'social_auth','0004_auto_20160423_0400','2017-03-27 08:32:12.398379'),(222,'social_auth','0002_add_related_name','2017-03-27 08:32:12.400754'),(223,'home','0013_skintypeingredient','2017-03-28 16:29:45.711158'),(224,'payments','0004_payment_total','2017-04-03 23:34:49.580771'),(225,'userregistration','0001_initial','2017-04-05 01:41:16.596285'),(226,'userregistration','0002_auto_20170404_1844','2017-04-05 01:44:04.936656'),(227,'userregistration','0003_profile_subscription','2017-04-05 07:05:10.342618'),(228,'userregistration','0004_auto_20170405_0040','2017-04-05 07:40:58.468490'),(229,'userregistration','0005_auto_20170405_0916','2017-04-05 16:16:53.929126'),(230,'payments','0005_auto_20170405_1102','2017-04-05 18:02:36.883306'),(231,'payments','0006_auto_20170405_1109','2017-04-05 18:10:02.418721'),(232,'payments','0007_purchasehistory_user','2017-04-05 18:36:49.947549'),(233,'payments','0008_creditcard_owner_name','2017-04-05 18:38:49.988225'),(234,'payments','0009_auto_20170405_1141','2017-04-05 18:41:07.011712'),(235,'userregistration','0006_auto_20170406_0850','2017-04-06 15:50:57.499332'),(236,'userregistration','0007_auto_20170406_0855','2017-04-06 15:55:59.696776'),(237,'userregistration','0008_auto_20170406_1221','2017-04-06 19:21:37.376115'),(238,'payments','0010_auto_20170406_1926','2017-04-07 02:30:57.348448'),(239,'cart','0002_cart_type','2017-04-08 00:06:34.603506'),(240,'payments','0011_auto_20170408_0036','2017-04-08 07:36:30.028916'),(241,'payments','0012_purchasehistory_is_active','2017-04-08 15:58:13.203246'),(242,'payments','0013_purchasehistory_ship_date','2017-04-08 18:55:39.172326'),(243,'home','0014_ingredient_description','2017-04-18 09:17:36.798982'),(244,'home','0015_auto_20170425_1323','2017-04-25 20:23:41.667251');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facepackwizard_option`
--

DROP TABLE IF EXISTS `facepackwizard_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facepackwizard_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `helper` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facepackwizard_option`
--

LOCK TABLES `facepackwizard_option` WRITE;
/*!40000 ALTER TABLE `facepackwizard_option` DISABLE KEYS */;
INSERT INTO `facepackwizard_option` VALUES (1,'< 18',''),(2,'18-29',''),(3,'30-39',''),(4,'40-49',''),(5,'50-59',''),(6,'60 +',''),(7,'Male',''),(8,'Female',''),(9,'Dry',''),(10,'Humid',''),(11,'Neither Dry nor Humid',''),(12,'Tropical',''),(13,'Never',''),(14,'Rarely',''),(15,'Sometimes',''),(16,'Always',''),(17,'Minimal','Cleanse'),(18,'Basic','Cleanse + Moisturize'),(19,'Moderate','Cleanse + Exfoliate + Tone + Moisturize'),(20,'Advanced','Cleanse + Tone + Moisturize + Face Mask once or twice a week'),(22,'Not Applicable',''),(23,'Oily',''),(24,'Dry','Less or No Oil'),(25,'Normal','Neither Oily nor Dry'),(30,'Clog Pore',''),(31,'Mild Acne',''),(32,'Consistent Acne',''),(33,'Oily T-zone (forehead, nose & chin)',''),(34,'Anti-Aging',''),(35,'Redness',''),(36,'Sun Damage',''),(37,'Dehydrated',''),(38,'Large Pores',''),(39,'Tired and Dull',''),(40,'Sensitive Skin',''),(41,'Brown spots or blemishes','');
/*!40000 ALTER TABLE `facepackwizard_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facepackwizard_question`
--

DROP TABLE IF EXISTS `facepackwizard_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facepackwizard_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `why` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facepackwizard_question`
--

LOCK TABLES `facepackwizard_question` WRITE;
/*!40000 ALTER TABLE `facepackwizard_question` DISABLE KEYS */;
INSERT INTO `facepackwizard_question` VALUES (1,'What\'s your age?','Ehent iur aliberio. Necabo. Corro berum dolore num iunt eicid ut alibus arunt es quatium quam qui reruptas aut res et que eos sit acium quatiorestia venis et quam, venihic te est hiciendis sedit'),(2,'What\'s your gender?','Ehent iur aliberio. Necabo. Corro berum dolore num iunt eicid ut alibus arunt es quatium quam qui reruptas aut res et que eos sit acium quatiorestia venis et quam, venihic te est hiciendis sedit'),(3,'What is your current environment?','Ehent iur aliberio. Necabo. Corro berum dolore num iunt eicid ut alibus arunt es quatium quam qui reruptas aut res et que eos sit acium quatiorestia venis et quam, venihic te est hiciendis sedit'),(4,'How often do you apply sunscreen?','Ehent iur aliberio. Necabo. Corro berum dolore num iunt eicid ut alibus arunt es quatium quam qui reruptas aut res et que eos sit acium quatiorestia venis et quam, venihic te est hiciendis sedit'),(5,'What best describes your morning skin routine?','Ehent iur aliberio. Necabo. Corro berum dolore num iunt eicid ut alibus arunt es quatium quam qui reruptas aut res et que eos sit acium quatiorestia venis et quam, venihic te est hiciendis sedit'),(6,'What best describes your evening skin routine?','Ehent iur aliberio. Necabo. Corro berum dolore num iunt eicid ut alibus arunt es quatium quam qui reruptas aut res et que eos sit acium quatiorestia venis et quam, venihic te est hiciendis sedit'),(7,'What is your Skin Type?','Ehent iur aliberio. Necabo. Corro berum dolore num iunt eicid ut alibus arunt es quatium quam qui reruptas aut res et que eos sit acium quatiorestia venis et quam, venihic te est hiciendis sedit'),(8,'Pick Your Top 3 Skin Concerns','Ehent iur aliberio. Necabo. Corro berum dolore num iunt eicid ut alibus arunt es quatium quam qui reruptas aut res et que eos sit acium quatiorestia venis et quam, venihic te est hiciendis sedit');
/*!40000 ALTER TABLE `facepackwizard_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facepackwizard_questionnaire`
--

DROP TABLE IF EXISTS `facepackwizard_questionnaire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facepackwizard_questionnaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `facepackwizard_qu_option_id_2d213f38_fk_facepackwizard_option_id` (`option_id`),
  KEY `facepackwizar_question_id_d3625d75_fk_facepackwizard_question_id` (`question_id`),
  CONSTRAINT `facepackwizar_question_id_d3625d75_fk_facepackwizard_question_id` FOREIGN KEY (`question_id`) REFERENCES `facepackwizard_question` (`id`),
  CONSTRAINT `facepackwizard_qu_option_id_2d213f38_fk_facepackwizard_option_id` FOREIGN KEY (`option_id`) REFERENCES `facepackwizard_option` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facepackwizard_questionnaire`
--

LOCK TABLES `facepackwizard_questionnaire` WRITE;
/*!40000 ALTER TABLE `facepackwizard_questionnaire` DISABLE KEYS */;
INSERT INTO `facepackwizard_questionnaire` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,2),(8,8,2),(9,9,3),(10,10,3),(11,11,3),(12,12,3),(13,13,4),(14,14,4),(15,15,4),(16,16,4),(17,17,5),(18,18,5),(19,19,5),(20,20,5),(21,22,5),(22,17,6),(23,18,6),(24,19,6),(25,20,6),(26,22,6),(32,23,7),(33,24,7),(34,25,7),(37,30,8),(38,31,8),(39,32,8),(40,33,8),(41,34,8),(42,35,8),(43,36,8),(44,37,8),(45,38,8),(46,39,8),(47,40,8),(48,41,8);
/*!40000 ALTER TABLE `facepackwizard_questionnaire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facepackwizard_questionnaireentry`
--

DROP TABLE IF EXISTS `facepackwizard_questionnaireentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facepackwizard_questionnaireentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `wizard_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `facepackwizard_qu_option_id_b1ea392d_fk_facepackwizard_option_id` (`option_id`),
  KEY `facepackwizar_question_id_aa539d35_fk_facepackwizard_question_id` (`question_id`),
  KEY `fa_wizard_id_e619abf0_fk_facepackwizard_questionnaireuserdata_id` (`wizard_id`),
  CONSTRAINT `fa_wizard_id_e619abf0_fk_facepackwizard_questionnaireuserdata_id` FOREIGN KEY (`wizard_id`) REFERENCES `facepackwizard_questionnaireuserdata` (`id`),
  CONSTRAINT `facepackwizar_question_id_aa539d35_fk_facepackwizard_question_id` FOREIGN KEY (`question_id`) REFERENCES `facepackwizard_question` (`id`),
  CONSTRAINT `facepackwizard_qu_option_id_b1ea392d_fk_facepackwizard_option_id` FOREIGN KEY (`option_id`) REFERENCES `facepackwizard_option` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1121 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facepackwizard_questionnaireentry`
--

LOCK TABLES `facepackwizard_questionnaireentry` WRITE;
/*!40000 ALTER TABLE `facepackwizard_questionnaireentry` DISABLE KEYS */;
INSERT INTO `facepackwizard_questionnaireentry` VALUES (211,3,1,22),(212,7,2,22),(213,10,3,22),(214,13,4,22),(215,17,5,22),(216,17,6,22),(217,25,7,22),(218,31,8,22),(219,33,8,22),(220,37,8,22),(221,3,1,23),(222,7,2,23),(223,10,3,23),(224,13,4,23),(225,17,5,23),(226,17,6,23),(227,24,7,23),(228,31,8,23),(229,37,8,23),(230,39,8,23),(231,4,1,24),(232,8,2,24),(233,11,3,24),(234,15,4,24),(235,20,5,24),(236,20,6,24),(237,25,7,24),(238,33,8,24),(239,34,8,24),(240,40,8,24),(241,4,1,25),(242,8,2,25),(243,11,3,25),(244,15,4,25),(245,19,5,25),(246,19,6,25),(247,24,7,25),(248,32,8,25),(249,33,8,25),(250,38,8,25),(251,4,1,26),(252,8,2,26),(253,11,3,26),(254,15,4,26),(255,19,5,26),(256,19,6,26),(257,24,7,26),(258,33,8,26),(259,38,8,26),(260,39,8,26),(261,4,1,27),(262,8,2,27),(263,11,3,27),(264,15,4,27),(265,19,5,27),(266,19,6,27),(267,24,7,27),(268,33,8,27),(269,34,8,27),(270,40,8,27),(271,3,1,28),(272,7,2,28),(273,10,3,28),(274,14,4,28),(275,19,5,28),(276,19,6,28),(277,24,7,28),(278,32,8,28),(279,33,8,28),(280,38,8,28),(281,3,1,29),(282,7,2,29),(283,10,3,29),(284,14,4,29),(285,19,5,29),(286,19,6,29),(287,24,7,29),(288,32,8,29),(289,33,8,29),(290,38,8,29),(291,3,1,30),(292,7,2,30),(293,10,3,30),(294,14,4,30),(295,19,5,30),(296,19,6,30),(297,24,7,30),(298,32,8,30),(299,33,8,30),(300,38,8,30),(301,3,1,31),(302,7,2,31),(303,10,3,31),(304,14,4,31),(305,19,5,31),(306,19,6,31),(307,24,7,31),(308,32,8,31),(309,33,8,31),(310,39,8,31),(311,4,1,32),(312,8,2,32),(313,11,3,32),(314,15,4,32),(315,19,5,32),(316,19,6,32),(317,24,7,32),(318,33,8,32),(319,34,8,32),(320,40,8,32),(321,3,1,33),(322,7,2,33),(323,10,3,33),(324,14,4,33),(325,18,5,33),(326,18,6,33),(327,23,7,33),(328,30,8,33),(329,31,8,33),(330,37,8,33),(331,3,1,34),(332,7,2,34),(333,10,3,34),(334,14,4,34),(335,19,5,34),(336,19,6,34),(337,24,7,34),(338,32,8,34),(339,33,8,34),(340,38,8,34),(341,4,1,35),(342,8,2,35),(343,11,3,35),(344,15,4,35),(345,19,5,35),(346,19,6,35),(347,24,7,35),(348,33,8,35),(349,39,8,35),(350,40,8,35),(351,3,1,36),(352,7,2,36),(353,10,3,36),(354,14,4,36),(355,18,5,36),(356,18,6,36),(357,23,7,36),(358,32,8,36),(359,33,8,36),(360,34,8,36),(361,3,1,37),(362,7,2,37),(363,10,3,37),(364,14,4,37),(365,19,5,37),(366,19,6,37),(367,24,7,37),(368,32,8,37),(369,33,8,37),(370,38,8,37),(371,3,1,38),(372,7,2,38),(373,10,3,38),(374,14,4,38),(375,18,5,38),(376,18,6,38),(377,23,7,38),(378,32,8,38),(379,38,8,38),(380,39,8,38),(381,3,1,39),(382,7,2,39),(383,10,3,39),(384,14,4,39),(385,19,5,39),(386,19,6,39),(387,24,7,39),(388,32,8,39),(389,33,8,39),(390,38,8,39),(391,3,1,40),(392,7,2,40),(393,10,3,40),(394,14,4,40),(395,19,5,40),(396,19,6,40),(397,24,7,40),(398,32,8,40),(399,33,8,40),(400,39,8,40),(401,4,1,41),(402,8,2,41),(403,11,3,41),(404,15,4,41),(405,19,5,41),(406,19,6,41),(407,24,7,41),(408,33,8,41),(409,34,8,41),(410,40,8,41),(411,2,1,42),(412,7,2,42),(413,10,3,42),(414,14,4,42),(415,18,5,42),(416,18,6,42),(417,23,7,42),(418,32,8,42),(419,33,8,42),(420,39,8,42),(421,3,1,43),(422,7,2,43),(423,10,3,43),(424,14,4,43),(425,18,5,43),(426,18,6,43),(427,23,7,43),(428,32,8,43),(429,33,8,43),(430,39,8,43),(431,4,1,44),(432,8,2,44),(433,11,3,44),(434,15,4,44),(435,20,5,44),(436,20,6,44),(437,25,7,44),(438,34,8,44),(439,38,8,44),(440,39,8,44),(441,4,1,45),(442,8,2,45),(443,11,3,45),(444,15,4,45),(445,20,5,45),(446,20,6,45),(447,25,7,45),(448,33,8,45),(449,34,8,45),(450,40,8,45),(451,3,1,46),(452,7,2,46),(453,10,3,46),(454,14,4,46),(455,18,5,46),(456,18,6,46),(457,23,7,46),(458,32,8,46),(459,33,8,46),(460,40,8,46),(461,3,1,47),(462,7,2,47),(463,10,3,47),(464,14,4,47),(465,19,5,47),(466,19,6,47),(467,24,7,47),(468,32,8,47),(469,33,8,47),(470,40,8,47),(471,3,1,48),(472,7,2,48),(473,10,3,48),(474,14,4,48),(475,19,5,48),(476,19,6,48),(477,24,7,48),(478,33,8,48),(479,39,8,48),(480,41,8,48),(481,4,1,49),(482,8,2,49),(483,11,3,49),(484,15,4,49),(485,20,5,49),(486,20,6,49),(487,25,7,49),(488,33,8,49),(489,34,8,49),(490,39,8,49),(491,3,1,50),(492,7,2,50),(493,10,3,50),(494,14,4,50),(495,19,5,50),(496,19,6,50),(497,24,7,50),(498,32,8,50),(499,33,8,50),(500,39,8,50),(501,4,1,51),(502,8,2,51),(503,11,3,51),(504,15,4,51),(505,19,5,51),(506,19,6,51),(507,24,7,51),(508,33,8,51),(509,39,8,51),(510,40,8,51),(511,4,1,52),(512,8,2,52),(513,11,3,52),(514,15,4,52),(515,20,5,52),(516,20,6,52),(517,25,7,52),(518,32,8,52),(519,34,8,52),(520,38,8,52),(521,4,1,53),(522,8,2,53),(523,11,3,53),(524,15,4,53),(525,19,5,53),(526,19,6,53),(527,24,7,53),(528,33,8,53),(529,38,8,53),(530,39,8,53),(531,4,1,54),(532,8,2,54),(533,11,3,54),(534,15,4,54),(535,19,5,54),(536,19,6,54),(537,24,7,54),(538,33,8,54),(539,39,8,54),(540,40,8,54),(541,4,1,55),(542,8,2,55),(543,11,3,55),(544,15,4,55),(545,19,5,55),(546,19,6,55),(547,24,7,55),(548,33,8,55),(549,39,8,55),(550,40,8,55),(551,4,1,56),(552,8,2,56),(553,11,3,56),(554,15,4,56),(555,20,5,56),(556,20,6,56),(557,23,7,56),(558,30,8,56),(559,31,8,56),(560,37,8,56),(561,4,1,57),(562,8,2,57),(563,11,3,57),(564,15,4,57),(565,20,5,57),(566,20,6,57),(567,25,7,57),(568,33,8,57),(569,34,8,57),(570,39,8,57),(571,3,1,58),(572,7,2,58),(573,10,3,58),(574,14,4,58),(575,18,5,58),(576,19,6,58),(577,24,7,58),(578,33,8,58),(579,38,8,58),(580,39,8,58),(581,3,1,59),(582,7,2,59),(583,10,3,59),(584,14,4,59),(585,18,5,59),(586,19,6,59),(587,24,7,59),(588,33,8,59),(589,38,8,59),(590,39,8,59),(591,3,1,60),(592,7,2,60),(593,10,3,60),(594,14,4,60),(595,18,5,60),(596,18,6,60),(597,23,7,60),(598,32,8,60),(599,33,8,60),(600,39,8,60),(601,3,1,61),(602,7,2,61),(603,10,3,61),(604,14,4,61),(605,19,5,61),(606,19,6,61),(607,24,7,61),(608,33,8,61),(609,38,8,61),(610,39,8,61),(611,4,1,62),(612,8,2,62),(613,11,3,62),(614,15,4,62),(615,19,5,62),(616,19,6,62),(617,24,7,62),(618,33,8,62),(619,39,8,62),(620,40,8,62),(621,3,1,63),(622,7,2,63),(623,10,3,63),(624,14,4,63),(625,19,5,63),(626,19,6,63),(627,24,7,63),(628,33,8,63),(629,39,8,63),(630,40,8,63),(631,3,1,64),(632,7,2,64),(633,10,3,64),(634,14,4,64),(635,18,5,64),(636,18,6,64),(637,23,7,64),(638,32,8,64),(639,38,8,64),(640,39,8,64),(641,4,1,65),(642,8,2,65),(643,11,3,65),(644,15,4,65),(645,19,5,65),(646,19,6,65),(647,24,7,65),(648,33,8,65),(649,39,8,65),(650,40,8,65),(651,3,1,66),(652,7,2,66),(653,10,3,66),(654,14,4,66),(655,19,5,66),(656,19,6,66),(657,25,7,66),(658,34,8,66),(659,35,8,66),(660,40,8,66),(661,3,1,67),(662,7,2,67),(663,10,3,67),(664,14,4,67),(665,19,5,67),(666,19,6,67),(667,25,7,67),(668,34,8,67),(669,35,8,67),(670,40,8,67),(671,4,1,68),(672,8,2,68),(673,11,3,68),(674,15,4,68),(675,19,5,68),(676,19,6,68),(677,25,7,68),(678,33,8,68),(679,39,8,68),(680,40,8,68),(681,3,1,69),(682,7,2,69),(683,10,3,69),(684,14,4,69),(685,18,5,69),(686,18,6,69),(687,25,7,69),(688,34,8,69),(689,35,8,69),(690,40,8,69),(691,3,1,70),(692,7,2,70),(693,10,3,70),(694,14,4,70),(695,19,5,70),(696,19,6,70),(697,24,7,70),(698,33,8,70),(699,39,8,70),(700,40,8,70),(701,4,1,71),(702,8,2,71),(703,11,3,71),(704,15,4,71),(705,19,5,71),(706,19,6,71),(707,23,7,71),(708,30,8,71),(709,31,8,71),(710,40,8,71),(711,3,1,72),(712,7,2,72),(713,10,3,72),(714,14,4,72),(715,19,5,72),(716,19,6,72),(717,24,7,72),(718,33,8,72),(719,39,8,72),(720,40,8,72),(721,3,1,73),(722,7,2,73),(723,10,3,73),(724,14,4,73),(725,19,5,73),(726,19,6,73),(727,24,7,73),(728,32,8,73),(729,39,8,73),(730,40,8,73),(731,4,1,74),(732,8,2,74),(733,11,3,74),(734,15,4,74),(735,19,5,74),(736,19,6,74),(737,24,7,74),(738,33,8,74),(739,39,8,74),(740,40,8,74),(741,3,1,75),(742,8,2,75),(743,10,3,75),(744,15,4,75),(745,19,5,75),(746,18,6,75),(747,25,7,75),(748,33,8,75),(749,39,8,75),(750,40,8,75),(751,3,1,76),(752,7,2,76),(753,10,3,76),(754,14,4,76),(755,19,5,76),(756,19,6,76),(757,24,7,76),(758,32,8,76),(759,33,8,76),(760,39,8,76),(761,3,1,77),(762,8,2,77),(763,10,3,77),(764,16,4,77),(765,20,5,77),(766,20,6,77),(767,24,7,77),(768,30,8,77),(769,34,8,77),(770,40,8,77),(771,3,1,78),(772,8,2,78),(773,10,3,78),(774,14,4,78),(775,19,5,78),(776,20,6,78),(777,25,7,78),(778,31,8,78),(779,37,8,78),(780,40,8,78),(781,3,1,79),(782,8,2,79),(783,10,3,79),(784,15,4,79),(785,19,5,79),(786,20,6,79),(787,25,7,79),(788,31,8,79),(789,35,8,79),(790,40,8,79),(791,3,1,80),(792,7,2,80),(793,11,3,80),(794,14,4,80),(795,19,5,80),(796,18,6,80),(797,23,7,80),(798,33,8,80),(799,35,8,80),(800,40,8,80),(801,3,1,81),(802,8,2,81),(803,10,3,81),(804,14,4,81),(805,19,5,81),(806,20,6,81),(807,24,7,81),(808,35,8,81),(809,36,8,81),(810,40,8,81),(811,3,1,82),(812,7,2,82),(813,10,3,82),(814,14,4,82),(815,19,5,82),(816,19,6,82),(817,24,7,82),(818,30,8,82),(819,31,8,82),(820,37,8,82),(821,3,1,83),(822,7,2,83),(823,10,3,83),(824,14,4,83),(825,18,5,83),(826,18,6,83),(827,23,7,83),(828,32,8,83),(829,33,8,83),(830,39,8,83),(831,3,1,84),(832,7,2,84),(833,10,3,84),(834,15,4,84),(835,19,5,84),(836,19,6,84),(837,24,7,84),(838,33,8,84),(839,40,8,84),(840,41,8,84),(841,3,1,85),(842,7,2,85),(843,10,3,85),(844,14,4,85),(845,19,5,85),(846,19,6,85),(847,24,7,85),(848,32,8,85),(849,38,8,85),(850,40,8,85),(851,4,1,86),(852,7,2,86),(853,10,3,86),(854,14,4,86),(855,18,5,86),(856,17,6,86),(857,23,7,86),(858,34,8,86),(859,35,8,86),(860,40,8,86),(861,3,1,87),(862,7,2,87),(863,9,3,87),(864,15,4,87),(865,17,5,87),(866,17,6,87),(867,23,7,87),(868,34,8,87),(869,39,8,87),(870,40,8,87),(871,3,1,88),(872,7,2,88),(873,9,3,88),(874,15,4,88),(875,22,5,88),(876,20,6,88),(877,25,7,88),(878,30,8,88),(879,34,8,88),(880,38,8,88),(881,3,1,89),(882,7,2,89),(883,10,3,89),(884,13,4,89),(885,19,5,89),(886,18,6,89),(887,23,7,89),(888,32,8,89),(889,37,8,89),(890,38,8,89),(891,4,1,90),(892,8,2,90),(893,11,3,90),(894,15,4,90),(895,19,5,90),(896,19,6,90),(897,24,7,90),(898,33,8,90),(899,38,8,90),(900,39,8,90),(901,3,1,91),(902,7,2,91),(903,10,3,91),(904,14,4,91),(905,18,5,91),(906,18,6,91),(907,23,7,91),(908,32,8,91),(909,39,8,91),(910,40,8,91),(911,3,1,92),(912,7,2,92),(913,10,3,92),(914,14,4,92),(915,18,5,92),(916,19,6,92),(917,24,7,92),(918,32,8,92),(919,38,8,92),(920,39,8,92),(921,4,1,93),(922,8,2,93),(923,11,3,93),(924,15,4,93),(925,19,5,93),(926,19,6,93),(927,24,7,93),(928,33,8,93),(929,39,8,93),(930,40,8,93),(931,4,1,94),(932,8,2,94),(933,11,3,94),(934,15,4,94),(935,19,5,94),(936,19,6,94),(937,24,7,94),(938,33,8,94),(939,39,8,94),(940,40,8,94),(941,2,1,95),(942,7,2,95),(943,10,3,95),(944,14,4,95),(945,18,5,95),(946,18,6,95),(947,23,7,95),(948,31,8,95),(949,35,8,95),(950,36,8,95),(951,3,1,96),(952,7,2,96),(953,10,3,96),(954,14,4,96),(955,18,5,96),(956,18,6,96),(957,23,7,96),(958,32,8,96),(959,38,8,96),(960,40,8,96),(961,3,1,97),(962,7,2,97),(963,9,3,97),(964,14,4,97),(965,18,5,97),(966,18,6,97),(967,24,7,97),(968,31,8,97),(969,38,8,97),(970,40,8,97),(971,3,1,98),(972,7,2,98),(973,10,3,98),(974,14,4,98),(975,19,5,98),(976,19,6,98),(977,24,7,98),(978,33,8,98),(979,39,8,98),(980,40,8,98),(981,3,1,99),(982,8,2,99),(983,10,3,99),(984,15,4,99),(985,19,5,99),(986,19,6,99),(987,24,7,99),(988,34,8,99),(989,39,8,99),(990,40,8,99),(991,3,1,100),(992,7,2,100),(993,10,3,100),(994,14,4,100),(995,18,5,100),(996,18,6,100),(997,23,7,100),(998,30,8,100),(999,31,8,100),(1000,37,8,100),(1001,3,1,101),(1002,7,2,101),(1003,10,3,101),(1004,14,4,101),(1005,18,5,101),(1006,18,6,101),(1007,23,7,101),(1008,32,8,101),(1009,39,8,101),(1010,40,8,101),(1011,4,1,102),(1012,8,2,102),(1013,11,3,102),(1014,15,4,102),(1015,20,5,102),(1016,20,6,102),(1017,25,7,102),(1018,34,8,102),(1019,39,8,102),(1020,40,8,102),(1021,3,1,103),(1022,7,2,103),(1023,10,3,103),(1024,14,4,103),(1025,19,5,103),(1026,19,6,103),(1027,24,7,103),(1028,33,8,103),(1029,37,8,103),(1030,38,8,103),(1031,3,1,104),(1032,7,2,104),(1033,10,3,104),(1034,14,4,104),(1035,19,5,104),(1036,19,6,104),(1037,24,7,104),(1038,33,8,104),(1039,39,8,104),(1040,40,8,104),(1041,3,1,105),(1042,7,2,105),(1043,10,3,105),(1044,14,4,105),(1045,19,5,105),(1046,19,6,105),(1047,24,7,105),(1048,33,8,105),(1049,39,8,105),(1050,40,8,105),(1051,3,1,106),(1052,7,2,106),(1053,10,3,106),(1054,14,4,106),(1055,18,5,106),(1056,18,6,106),(1057,23,7,106),(1058,33,8,106),(1059,39,8,106),(1060,40,8,106),(1061,3,1,107),(1062,7,2,107),(1063,10,3,107),(1064,14,4,107),(1065,18,5,107),(1066,19,6,107),(1067,24,7,107),(1068,32,8,107),(1069,38,8,107),(1070,39,8,107),(1071,3,1,108),(1072,7,2,108),(1073,10,3,108),(1074,14,4,108),(1075,19,5,108),(1076,19,6,108),(1077,24,7,108),(1078,32,8,108),(1079,38,8,108),(1080,39,8,108),(1081,2,1,109),(1082,7,2,109),(1083,10,3,109),(1084,14,4,109),(1085,18,5,109),(1086,18,6,109),(1087,23,7,109),(1088,31,8,109),(1089,35,8,109),(1090,36,8,109),(1091,4,1,110),(1092,8,2,110),(1093,11,3,110),(1094,15,4,110),(1095,19,5,110),(1096,19,6,110),(1097,24,7,110),(1098,32,8,110),(1099,33,8,110),(1100,39,8,110),(1101,2,1,111),(1102,7,2,111),(1103,10,3,111),(1104,14,4,111),(1105,18,5,111),(1106,18,6,111),(1107,23,7,111),(1108,31,8,111),(1109,35,8,111),(1110,39,8,111),(1111,3,1,112),(1112,7,2,112),(1113,10,3,112),(1114,14,4,112),(1115,18,5,112),(1116,18,6,112),(1117,23,7,112),(1118,32,8,112),(1119,33,8,112),(1120,39,8,112);
/*!40000 ALTER TABLE `facepackwizard_questionnaireentry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facepackwizard_questionnaireuserdata`
--

DROP TABLE IF EXISTS `facepackwizard_questionnaireuserdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facepackwizard_questionnaireuserdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdte` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `facepackwizard_questionnaireuse_user_id_9c612c78_fk_auth_user_id` (`user_id`),
  CONSTRAINT `facepackwizard_questionnaireuse_user_id_9c612c78_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facepackwizard_questionnaireuserdata`
--

LOCK TABLES `facepackwizard_questionnaireuserdata` WRITE;
/*!40000 ALTER TABLE `facepackwizard_questionnaireuserdata` DISABLE KEYS */;
INSERT INTO `facepackwizard_questionnaireuserdata` VALUES (22,'2017-03-27 03:07:22.221344',2),(23,'2017-03-27 03:08:04.415462',2),(24,'2017-03-27 10:46:44.282338',2),(25,'2017-03-27 18:27:02.288941',NULL),(26,'2017-03-27 18:52:23.508208',NULL),(27,'2017-03-27 18:53:48.684633',NULL),(28,'2017-03-28 03:51:21.780021',NULL),(29,'2017-03-28 04:44:56.226889',NULL),(30,'2017-03-28 04:53:26.769509',NULL),(31,'2017-03-28 04:55:46.649578',NULL),(32,'2017-03-28 05:35:33.039542',NULL),(33,'2017-03-28 05:39:16.053483',NULL),(34,'2017-03-28 05:54:54.483432',NULL),(35,'2017-03-28 06:00:54.267612',NULL),(36,'2017-03-28 06:03:02.994196',NULL),(37,'2017-03-28 06:06:01.804523',NULL),(38,'2017-03-28 06:07:57.933148',NULL),(39,'2017-03-28 06:09:07.492552',NULL),(40,'2017-03-28 06:38:36.892278',NULL),(41,'2017-03-28 06:40:23.919357',NULL),(42,'2017-03-28 06:46:29.713604',NULL),(43,'2017-03-28 06:48:18.952272',NULL),(44,'2017-03-28 06:49:25.112560',NULL),(45,'2017-03-28 06:50:31.668343',NULL),(46,'2017-03-28 06:52:11.265205',NULL),(47,'2017-03-28 06:55:18.190278',NULL),(48,'2017-03-28 07:00:26.026318',NULL),(49,'2017-03-28 07:02:17.210086',NULL),(50,'2017-03-28 07:11:17.131388',NULL),(51,'2017-03-28 07:14:09.752134',2),(52,'2017-03-28 07:14:56.845383',2),(53,'2017-03-28 17:50:35.766361',NULL),(54,'2017-03-28 17:51:09.281467',NULL),(55,'2017-03-28 17:51:26.445961',NULL),(56,'2017-03-28 17:52:12.192255',NULL),(57,'2017-03-28 17:52:43.718747',NULL),(58,'2017-03-28 17:53:15.114172',NULL),(59,'2017-03-28 17:53:15.225951',NULL),(60,'2017-03-28 18:00:19.775949',NULL),(61,'2017-03-28 18:00:40.140250',NULL),(62,'2017-03-28 18:00:50.752061',NULL),(63,'2017-04-03 20:11:19.451585',2),(64,'2017-04-03 21:17:49.958839',1),(65,'2017-04-03 21:53:54.232230',1),(66,'2017-04-03 21:54:27.720982',1),(67,'2017-04-03 21:55:56.317739',1),(68,'2017-04-03 21:56:38.065764',1),(69,'2017-04-03 21:56:56.432094',1),(70,'2017-04-03 21:58:02.476861',1),(71,'2017-04-03 21:58:19.023668',1),(72,'2017-04-03 22:01:09.854798',1),(73,'2017-04-04 18:07:51.042245',2),(74,'2017-04-05 04:11:25.812479',NULL),(75,'2017-04-05 08:15:21.087669',3),(76,'2017-04-05 08:16:40.885433',3),(77,'2017-04-05 08:18:33.570240',3),(78,'2017-04-05 17:41:57.221662',6),(79,'2017-04-05 17:42:40.639547',6),(80,'2017-04-05 20:22:59.081247',2),(81,'2017-04-05 21:45:28.005887',6),(82,'2017-04-05 22:26:11.501948',2),(83,'2017-04-05 22:51:16.816520',NULL),(84,'2017-04-06 06:17:43.541355',2),(85,'2017-04-06 06:54:17.464266',2),(86,'2017-04-07 07:24:41.720872',2),(87,'2017-04-07 08:48:30.515680',2),(88,'2017-04-07 08:51:26.308284',2),(89,'2017-04-07 16:35:54.321621',193),(90,'2017-04-07 16:47:00.734560',2),(91,'2017-04-07 16:53:56.531469',2),(92,'2017-04-07 17:04:40.392594',2),(93,'2017-04-07 19:46:39.830445',2),(94,'2017-04-07 20:03:38.747762',2),(95,'2017-04-07 20:14:54.728447',2),(96,'2017-04-07 23:24:42.087524',2),(97,'2017-04-08 21:49:17.269753',2),(98,'2017-04-09 01:24:43.654708',2),(99,'2017-04-09 01:29:40.300451',3),(100,'2017-04-10 00:10:21.424740',2),(101,'2017-04-10 07:28:52.015152',2),(102,'2017-04-10 07:30:47.695571',2),(103,'2017-04-10 08:33:16.173255',2),(104,'2017-04-10 16:43:12.791612',2),(105,'2017-04-14 06:38:02.975094',2),(106,'2017-04-18 06:25:38.168875',1),(107,'2017-04-18 08:49:27.311125',2),(108,'2017-04-18 09:07:29.383005',2),(109,'2017-04-18 17:54:53.664870',2),(110,'2017-04-19 04:25:01.841899',2),(111,'2017-04-19 06:31:36.989960',1),(112,'2017-04-25 20:14:20.219814',2);
/*!40000 ALTER TABLE `facepackwizard_questionnaireuserdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facepackwizard_skinconcern`
--

DROP TABLE IF EXISTS `facepackwizard_skinconcern`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facepackwizard_skinconcern` (
  `option_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`option_ptr_id`),
  CONSTRAINT `facepackwizar_option_ptr_id_f17147c2_fk_facepackwizard_option_id` FOREIGN KEY (`option_ptr_id`) REFERENCES `facepackwizard_option` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facepackwizard_skinconcern`
--

LOCK TABLES `facepackwizard_skinconcern` WRITE;
/*!40000 ALTER TABLE `facepackwizard_skinconcern` DISABLE KEYS */;
INSERT INTO `facepackwizard_skinconcern` VALUES (30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41);
/*!40000 ALTER TABLE `facepackwizard_skinconcern` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facepackwizard_skintype`
--

DROP TABLE IF EXISTS `facepackwizard_skintype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facepackwizard_skintype` (
  `option_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`option_ptr_id`),
  CONSTRAINT `facepackwizar_option_ptr_id_d9cbbe6c_fk_facepackwizard_option_id` FOREIGN KEY (`option_ptr_id`) REFERENCES `facepackwizard_option` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facepackwizard_skintype`
--

LOCK TABLES `facepackwizard_skintype` WRITE;
/*!40000 ALTER TABLE `facepackwizard_skintype` DISABLE KEYS */;
INSERT INTO `facepackwizard_skintype` VALUES (23),(24),(25);
/*!40000 ALTER TABLE `facepackwizard_skintype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_base`
--

DROP TABLE IF EXISTS `home_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `skin_type_id` int(11),
  `helper` varchar(1000),
  `image` varchar(100) NOT NULL,
  `description` varchar(2000),
  PRIMARY KEY (`id`),
  KEY `f_skin_type_id_46513bb4_fk_facepackwizard_skintype_option_ptr_id` (`skin_type_id`),
  CONSTRAINT `f_skin_type_id_46513bb4_fk_facepackwizard_skintype_option_ptr_id` FOREIGN KEY (`skin_type_id`) REFERENCES `facepackwizard_skintype` (`option_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_base`
--

LOCK TABLES `home_base` WRITE;
/*!40000 ALTER TABLE `home_base` DISABLE KEYS */;
INSERT INTO `home_base` VALUES (1,'French green clay (not for sensitive skin)',23,'Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen','images/base/turmeric_kaKttNs.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(2,'Bentonite clay',23,'Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen','images/base/turmeric_9W9hilP.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(3,'Fuller\'s earth',23,'Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen','images/base/turmeric_G37zlov.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(4,'Rassoul Clay',25,'Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen','images/base/turmeric_4kJkPlv.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(5,'Goat Milk',24,'Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen','images/base/turmeric_suCKy87.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(6,'White Kaolin Clay',25,'Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen','images/base/avacado_JE2ZOFN_uFLy6JW.png','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.');
/*!40000 ALTER TABLE `home_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_customfacepack`
--

DROP TABLE IF EXISTS `home_customfacepack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_customfacepack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facepack_id` int(11) NOT NULL,
  `optional_ingredient_id` int(11),
  `recipe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_customfac_facepack_id_8dd71573_fk_home_facepack_item_ptr_id` (`facepack_id`),
  KEY `home_custo_optional_ingredient_id_256af5c6_fk_home_ingredient_id` (`optional_ingredient_id`),
  KEY `home_customfacepack_recipe_id_be82e4a4_fk_home_recipe_id` (`recipe_id`),
  KEY `home_customfacepack_user_id_15ab891a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `home_custo_optional_ingredient_id_256af5c6_fk_home_ingredient_id` FOREIGN KEY (`optional_ingredient_id`) REFERENCES `home_ingredient` (`id`),
  CONSTRAINT `home_customfac_facepack_id_8dd71573_fk_home_facepack_item_ptr_id` FOREIGN KEY (`facepack_id`) REFERENCES `home_facepack` (`item_ptr_id`),
  CONSTRAINT `home_customfacepack_recipe_id_be82e4a4_fk_home_recipe_id` FOREIGN KEY (`recipe_id`) REFERENCES `home_recipe` (`id`),
  CONSTRAINT `home_customfacepack_user_id_15ab891a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1058 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_customfacepack`
--

LOCK TABLES `home_customfacepack` WRITE;
/*!40000 ALTER TABLE `home_customfacepack` DISABLE KEYS */;
INSERT INTO `home_customfacepack` VALUES (545,191,NULL,16,2),(546,191,NULL,22,2),(547,191,NULL,23,2),(548,192,33,16,2),(549,192,33,22,2),(550,192,33,23,2),(554,194,NULL,3,1),(555,194,NULL,9,1),(556,194,NULL,10,1),(557,195,12,3,1),(558,195,12,9,1),(559,195,12,10,1),(560,196,6,3,1),(561,196,6,9,1),(562,196,6,10,1),(563,197,NULL,29,1),(564,197,NULL,30,1),(565,197,NULL,35,1),(566,198,NULL,28,1),(567,198,NULL,34,1),(568,198,NULL,35,1),(572,200,NULL,1,1),(573,200,NULL,2,1),(574,200,NULL,11,1),(575,201,8,1,1),(576,201,8,2,1),(577,201,8,11,1),(578,202,4,1,1),(579,202,4,2,1),(580,202,4,11,1),(581,203,NULL,16,1),(582,203,NULL,22,1),(583,203,NULL,23,1),(584,204,37,16,1),(585,204,37,22,1),(586,204,37,23,1),(587,205,3,16,1),(588,205,3,22,1),(589,205,3,23,1),(590,206,NULL,15,3),(591,206,NULL,16,3),(592,206,NULL,22,3),(593,207,NULL,13,3),(594,207,NULL,17,3),(595,207,NULL,23,3),(596,208,19,13,3),(597,208,19,17,3),(598,208,19,23,3),(599,209,22,13,3),(600,209,22,17,3),(601,209,22,23,3),(614,214,NULL,4,2),(615,214,NULL,6,2),(616,214,NULL,11,2),(617,215,NULL,4,2),(618,215,NULL,6,2),(619,215,NULL,11,2),(620,216,40,4,2),(621,216,40,6,2),(622,216,40,11,2),(623,217,21,4,2),(624,217,21,6,2),(625,217,21,11,2),(626,218,NULL,4,2),(627,218,NULL,6,2),(628,218,NULL,11,2),(629,219,NULL,18,6),(630,219,NULL,19,6),(631,219,NULL,23,6),(632,220,8,18,6),(633,220,8,19,6),(634,220,8,23,6),(635,221,NULL,13,2),(636,221,NULL,14,2),(637,221,NULL,20,2),(638,222,26,13,2),(639,222,26,14,2),(640,222,26,20,2),(644,224,NULL,16,2),(645,224,NULL,23,2),(646,224,NULL,24,2),(647,225,5,16,2),(648,225,5,23,2),(649,225,5,24,2),(650,226,16,16,2),(651,226,16,23,2),(652,226,16,24,2),(653,227,NULL,15,2),(654,227,NULL,21,2),(655,227,NULL,23,2),(656,228,30,15,2),(657,228,30,21,2),(658,228,30,23,2),(659,229,NULL,15,2),(660,229,NULL,21,2),(661,229,NULL,23,2),(662,230,30,15,2),(663,230,30,21,2),(664,230,30,23,2),(665,231,19,15,2),(666,231,19,21,2),(667,231,19,23,2),(668,232,NULL,5,2),(669,232,NULL,6,2),(670,232,NULL,11,2),(671,233,30,5,2),(672,233,30,6,2),(673,233,30,11,2),(674,234,NULL,5,2),(675,234,NULL,10,2),(676,234,NULL,11,2),(677,235,4,5,2),(678,235,4,10,2),(679,235,4,11,2),(680,236,NULL,25,2),(681,236,NULL,29,2),(682,236,NULL,33,2),(683,237,32,25,2),(684,237,32,29,2),(685,237,32,33,2),(686,238,22,25,2),(687,238,22,29,2),(688,238,22,33,2),(689,239,NULL,16,2),(690,239,NULL,21,2),(691,239,NULL,22,2),(692,240,20,16,2),(693,240,20,21,2),(694,240,20,22,2),(695,241,5,16,2),(696,241,5,21,2),(697,241,5,22,2),(704,244,33,15,2),(705,244,33,21,2),(706,244,33,22,2),(707,245,2,15,2),(708,245,2,21,2),(709,245,2,22,2),(710,246,NULL,16,2),(711,246,NULL,22,2),(712,246,NULL,23,2),(713,247,NULL,16,2),(714,247,NULL,22,2),(715,247,NULL,23,2),(716,248,22,16,2),(717,248,22,22,2),(718,248,22,23,2),(719,249,37,16,2),(720,249,37,22,2),(721,249,37,23,2),(725,251,24,2,2),(726,251,24,6,2),(727,251,24,7,2),(728,252,29,2,2),(729,252,29,6,2),(730,252,29,7,2),(731,253,NULL,2,2),(732,253,NULL,6,2),(733,253,NULL,7,2),(806,278,NULL,3,2),(807,278,NULL,9,2),(808,278,NULL,11,2),(833,287,NULL,3,2),(834,287,NULL,9,2),(835,287,NULL,11,2),(851,293,NULL,3,2),(852,293,NULL,9,2),(853,293,NULL,11,2),(854,294,40,3,2),(855,294,40,9,2),(856,294,40,11,2),(857,295,24,3,2),(858,295,24,9,2),(859,295,24,11,2),(875,301,NULL,3,2),(876,301,NULL,9,2),(877,301,NULL,11,2),(878,302,24,3,2),(879,302,24,9,2),(880,302,24,11,2),(881,303,40,3,2),(882,303,40,9,2),(883,303,40,11,2),(884,304,NULL,3,2),(885,304,NULL,9,2),(886,304,NULL,11,2),(887,305,24,3,2),(888,305,24,9,2),(889,305,24,11,2),(890,306,NULL,3,2),(891,306,NULL,9,2),(892,306,NULL,11,2),(893,307,NULL,14,2),(894,307,NULL,21,2),(895,307,NULL,23,2),(896,308,NULL,16,2),(897,308,NULL,22,2),(898,308,NULL,23,2),(899,309,17,16,2),(900,309,17,22,2),(901,309,17,23,2),(902,310,3,16,2),(903,310,3,22,2),(904,310,3,23,2),(905,311,NULL,17,3),(906,311,NULL,22,3),(907,311,NULL,23,3),(908,312,15,17,3),(909,312,15,22,3),(910,312,15,23,3),(911,313,NULL,17,2),(912,313,NULL,22,2),(913,313,NULL,23,2),(914,314,15,17,2),(915,314,15,22,2),(916,314,15,23,2),(917,315,NULL,1,2),(918,315,NULL,2,2),(919,315,NULL,8,2),(920,316,38,1,2),(921,316,38,2,2),(922,316,38,8,2),(923,317,35,1,2),(924,317,35,2,2),(925,317,35,8,2),(926,318,NULL,1,2),(927,318,NULL,2,2),(928,318,NULL,8,2),(929,319,38,1,2),(930,319,38,2,2),(931,319,38,8,2),(932,320,35,1,2),(933,320,35,2,2),(934,320,35,8,2),(935,321,NULL,3,2),(936,321,NULL,10,2),(937,321,NULL,11,2),(938,322,40,3,2),(939,322,40,10,2),(940,322,40,11,2),(941,323,15,3,2),(942,323,15,10,2),(943,323,15,11,2),(944,324,NULL,29,2),(945,324,NULL,34,2),(946,324,NULL,35,2),(947,325,10,29,2),(948,325,10,34,2),(949,325,10,35,2),(950,326,32,29,2),(951,326,32,34,2),(952,326,32,35,2),(953,327,NULL,16,2),(954,327,NULL,20,2),(955,327,NULL,21,2),(956,328,32,16,2),(957,328,32,20,2),(958,328,32,21,2),(959,329,33,16,2),(960,329,33,20,2),(961,329,33,21,2),(962,330,NULL,16,2),(963,330,NULL,20,2),(964,330,NULL,21,2),(965,331,NULL,16,2),(966,331,NULL,22,2),(967,331,NULL,23,2),(968,332,NULL,16,2),(969,332,NULL,22,2),(970,332,NULL,23,2),(971,333,19,16,2),(972,333,19,22,2),(973,333,19,23,2),(974,334,22,16,2),(975,334,22,22,2),(976,334,22,23,2),(977,335,NULL,16,2),(978,335,NULL,22,2),(979,335,NULL,23,2),(980,336,NULL,16,2),(981,336,NULL,22,2),(982,336,NULL,23,2),(983,337,NULL,16,2),(984,337,NULL,22,2),(985,337,NULL,23,2),(986,338,19,16,2),(987,338,19,22,2),(988,338,19,23,2),(989,339,22,16,2),(990,339,22,22,2),(991,339,22,23,2),(992,340,NULL,16,1),(993,340,NULL,22,1),(994,340,NULL,23,1),(995,341,22,16,1),(996,341,22,22,1),(997,341,22,23,1),(998,342,19,16,1),(999,342,19,22,1),(1000,342,19,23,1),(1001,343,NULL,4,1),(1002,343,NULL,10,1),(1003,343,NULL,11,1),(1004,344,31,4,1),(1005,344,31,10,1),(1006,344,31,11,1),(1007,345,26,4,1),(1008,345,26,10,1),(1009,345,26,11,1),(1010,346,NULL,4,1),(1011,346,NULL,10,1),(1012,346,NULL,11,1),(1013,347,31,4,1),(1014,347,31,10,1),(1015,347,31,11,1),(1016,348,26,4,1),(1017,348,26,10,1),(1018,348,26,11,1),(1019,349,NULL,15,2),(1020,349,NULL,21,2),(1021,349,NULL,22,2),(1022,350,NULL,15,213),(1023,350,NULL,21,213),(1024,350,NULL,22,213),(1028,352,38,15,2),(1029,352,38,21,2),(1030,352,38,22,2),(1031,353,NULL,15,2),(1032,353,NULL,16,2),(1033,353,NULL,22,2),(1034,354,NULL,15,2),(1035,354,NULL,16,2),(1036,354,NULL,22,2),(1037,355,3,15,2),(1038,355,3,16,2),(1039,355,3,22,2),(1040,356,NULL,2,1),(1041,356,NULL,6,1),(1042,356,NULL,10,1),(1043,357,NULL,4,2),(1044,357,NULL,10,2),(1045,357,NULL,11,2),(1046,358,NULL,4,2),(1047,358,NULL,10,2),(1048,358,NULL,11,2),(1049,359,NULL,4,2),(1050,359,NULL,10,2),(1051,359,NULL,11,2),(1052,360,NULL,3,2),(1053,360,NULL,4,2),(1054,360,NULL,10,2),(1055,361,7,3,2),(1056,361,7,4,2),(1057,361,7,10,2);
/*!40000 ALTER TABLE `home_customfacepack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_facepack`
--

DROP TABLE IF EXISTS `home_facepack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_facepack` (
  `item_ptr_id` int(11) NOT NULL,
  `base_id` int(11) NOT NULL,
  `mixing_agent_id` int(11) NOT NULL,
  PRIMARY KEY (`item_ptr_id`),
  KEY `home_facepack_base_id_d44f4387_fk_home_base_id` (`base_id`),
  KEY `home_facepack_mixing_agent_id_b743bc1b_fk_home_mixingagent_id` (`mixing_agent_id`),
  CONSTRAINT `home_facepack_base_id_d44f4387_fk_home_base_id` FOREIGN KEY (`base_id`) REFERENCES `home_base` (`id`),
  CONSTRAINT `home_facepack_item_ptr_id_b939e1a6_fk_home_item_id` FOREIGN KEY (`item_ptr_id`) REFERENCES `home_item` (`id`),
  CONSTRAINT `home_facepack_mixing_agent_id_b743bc1b_fk_home_mixingagent_id` FOREIGN KEY (`mixing_agent_id`) REFERENCES `home_mixingagent` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_facepack`
--

LOCK TABLES `home_facepack` WRITE;
/*!40000 ALTER TABLE `home_facepack` DISABLE KEYS */;
INSERT INTO `home_facepack` VALUES (136,5,4),(137,5,4),(138,5,4),(139,5,4),(140,5,4),(141,5,4),(142,5,4),(143,5,4),(144,5,4),(145,5,4),(146,5,4),(147,5,4),(148,5,4),(149,5,4),(150,5,4),(151,5,4),(152,5,4),(153,5,4),(154,1,1),(155,1,1),(156,5,4),(157,5,4),(158,5,4),(159,1,1),(160,5,4),(161,3,1),(162,5,4),(163,5,4),(164,5,4),(165,5,4),(166,2,1),(167,2,1),(168,2,1),(169,3,1),(170,3,1),(171,3,1),(172,4,5),(173,4,5),(174,4,5),(175,1,1),(176,1,1),(177,1,1),(178,1,1),(179,1,1),(180,1,1),(181,5,4),(182,5,4),(183,5,4),(184,5,4),(185,4,5),(186,5,4),(191,5,4),(192,5,4),(194,3,1),(195,3,1),(196,3,1),(197,6,2),(198,4,5),(200,6,1),(201,6,1),(202,6,1),(203,5,6),(204,5,6),(205,5,6),(206,5,6),(207,5,6),(208,5,6),(209,5,6),(214,6,1),(215,6,1),(216,6,1),(217,6,1),(218,6,1),(219,5,6),(220,5,6),(221,5,4),(222,5,4),(223,2,1),(224,5,6),(225,5,6),(226,5,6),(227,5,6),(228,5,6),(229,5,6),(230,5,6),(231,5,6),(232,6,1),(233,6,1),(234,6,1),(235,6,1),(236,4,5),(237,4,5),(238,4,5),(239,5,6),(240,5,6),(241,5,6),(244,5,6),(245,5,6),(246,5,4),(247,5,4),(248,5,4),(249,5,4),(251,2,1),(252,2,1),(253,2,1),(278,6,1),(287,6,1),(293,6,1),(294,6,1),(295,6,1),(301,6,1),(302,6,1),(303,6,1),(304,6,1),(305,6,1),(306,6,1),(307,5,6),(308,5,6),(309,5,6),(310,5,6),(311,5,6),(312,5,6),(313,5,6),(314,5,6),(315,2,1),(316,2,1),(317,2,1),(318,2,1),(319,2,1),(320,2,1),(321,6,1),(322,6,1),(323,6,1),(324,4,5),(325,4,5),(326,4,5),(327,5,4),(328,5,4),(329,5,4),(330,5,4),(331,5,4),(332,5,4),(333,5,4),(334,5,4),(335,5,4),(336,5,4),(337,5,4),(338,5,4),(339,5,4),(340,5,4),(341,5,4),(342,5,4),(343,6,1),(344,6,1),(345,6,1),(346,6,1),(347,6,1),(348,6,1),(349,5,4),(350,5,4),(352,5,6),(353,5,4),(354,5,4),(355,5,4),(356,3,1),(357,6,1),(358,6,1),(359,6,1),(360,3,1),(361,3,1);
/*!40000 ALTER TABLE `home_facepack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_ingredient`
--

DROP TABLE IF EXISTS `home_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_ingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `helper` varchar(1000) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `description` varchar(2000),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_ingredient`
--

LOCK TABLES `home_ingredient` WRITE;
/*!40000 ALTER TABLE `home_ingredient` DISABLE KEYS */;
INSERT INTO `home_ingredient` VALUES (1,'Almonds',NULL,'images/ingredients/apples_eIqOvIp.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(2,'Aloe Powder','Natural moisturizer, brightens skins and increases collagen production','images/ingredients/F2F_Ingredients-Aloe-vera.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(3,'Avocado','Deeply moisturising, rich in nutrients and boosts collagen','images/ingredients/F2F_Ingredients-Avacado.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(4,'Baking Soda',NULL,'images/ingredients/apples_eIqOvIp.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(5,'Banana','Rich in vitamins, reduces fine lines revealing smoother skin','images/ingredients/F2F_Ingredients-banana.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(6,'Bergamot Peel Essential Oil',NULL,'images/ingredients/apples_eIqOvIp.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(7,'Besan','Tones, brightens and clarifies','images/ingredients/F2F_Ingredients-Besan.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(8,'Blueberries','High in vitamin C, protects from free radicals','images/ingredients/F2F_Ingredients-blueberries.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(10,'Cacao','Fights free radicals revealing fresher, healthier skin','images/ingredients/F2F_Ingredients-cacao.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(12,'Carrots','Packed with antioxidants, adds glow','images/ingredients/F2F_Ingredients-Carrot.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(13,'Chamomile','A powerhouse herb that purifies and soothes your skin','images/ingredients/apples_eIqOvIp.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(14,'Coconut Milk',NULL,'images/ingredients/apples_eIqOvIp.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(15,'Coconut Water','Hydrating, nourishing and adds glow','images/ingredients/apples_eIqOvIp.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(16,'Coffee','Reduces cellulite providing smooth, bright and youthful glow','images/ingredients/F2F_Ingredients-Coffee.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(17,'Cucumber','Hydrates, calms and moisturizes the skin','images/ingredients/F2F_Ingredients-Cucumber.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(18,'Egg White','Effective astringent that tightens skin and reduces pore size','images/ingredients/F2F_Ingredients-eggs_tqX0ute.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(19,'Egg Yolk','','images/ingredients/F2F_Ingredients-eggs.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(20,'Fenugreek','Helps draw out toxins, repairs damaged cells and combats acne effectively','images/ingredients/F2F_Ingredients-fenugreek.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(21,'Flax Seeds','Keeps skin hydrated and smooth, tightens large pores, anti aging and fights acne','images/ingredients/F2F_Ingredients-flax-seeds.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(22,'Goat Milk Powder','Hydrates, brightens and firms','images/ingredients/F2F_Ingredients-goat-milk.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(23,'Lavender Oil','Nourishing and clarifiing. Antibacterial, antimicrobial, healing to skin','images/ingredients/apples_eIqOvIp.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(24,'Lemon Juice','','images/ingredients/F2F_Ingredients_Lemon-2.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(25,'Mangosteen','Anti-bacterial properties clears acne and soothes irritated skin','images/ingredients/F2F_Ingredients-mango-steen-powder.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(26,'Matcha','A powerful detoxifier, calming and soothing','images/ingredients/F2F_Ingredients-Matcha-Tea.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(27,'Mint','Nourishing, soothing with anti bacterial benefits','images/ingredients/F2F_Ingredients-mint.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(28,'Neem','','images/ingredients/F2F_Ingredients-Neem-Powder.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(29,'Nutmeg','Lightens blemishes/scars with anti-inflammatory properties','images/ingredients/F2F_Ingredients-nutmeg.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(30,'Oats','Gently exfoliates, hydrates and softens skin','images/ingredients/F2F_Ingredients-oats.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(31,'Orange Peel','Adds firmness and moisture to skin, clears clogged pores','images/ingredients/F2F_Ingredients-Orange-peel_1.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(32,'Papaya','Great for tired skin with powerful fruit enzymes','images/ingredients/F2F_Ingredients-Papaya.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(33,'Pome granate','Packed with antioxidants and vitamins to make way for radiant skin','images/ingredients/apples_eIqOvIp.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(35,'Sandal Wood Powder','Ancient ayurvedic secret that helps fight acne, blemishes & spots by absorbing excell oil from skin','images/ingredients/F2F_Ingredients-sandalwood-powder.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(36,'Silk Peptide','Silk proteins derived from raw silk help balance skin\'s moisture, giving it a silky glow','images/ingredients/F2F_Ingredients-silk-peptide.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(37,'Straw berry','Sloughs off dead cells making way for a brighter, fresh looking skin','images/ingredients/F2F_Ingredients-strawberry.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(38,'Trifala','Three fruits Amalaki, Haritaki and Bibhitaki with amplified effect when mixed. Balancing, detoxifying and nourishing','images/ingredients/F2F_Ingredients-Triphala.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(39,'Turmeric','Clarifies, anti aging properties','images/ingredients/F2F_Ingredients-turmeric.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(40,'White Willow Tree Bark','Natural exfoliant that helps combat acne and reduces inflammation','images/ingredients/F2F_Ingredients-willow-bark.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(41,'Yogurt','','images/ingredients/apples_eIqOvIp.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(42,'Orange Juice','Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen','images/ingredients/F2F_Ingredients-Orange.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(43,'Essential Oils','This face mask is infused with a blend of essential oils and organic, dried flowers','images/ingredients/F2F_Ingredients-essential-oils.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(44,'Glycerine','Gentle moisturizer','images/ingredients/F2F_Ingredients-Glycerine_2qxpr22.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.');
/*!40000 ALTER TABLE `home_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_item`
--

DROP TABLE IF EXISTS `home_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `helper` varchar(1000) NOT NULL,
  `createdte` datetime(6) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_item`
--

LOCK TABLES `home_item` WRITE;
/*!40000 ALTER TABLE `home_item` DISABLE KEYS */;
INSERT INTO `home_item` VALUES (136,'CFP_015016021000','','2017-03-27 18:27:04.032975',22.99),(137,'CFP_015016021040','','2017-03-27 18:27:06.657596',22.99),(138,'CFP_015016021007','','2017-03-27 18:27:07.496383',23.99),(139,'CFP_016021022000','','2017-03-27 18:52:27.066678',19.99),(140,'CFP_016021022039','','2017-03-27 18:52:29.539129',19.99),(141,'CFP_016021022001','','2017-03-27 18:52:30.238399',27.99),(142,'CFP_016017023000','','2017-03-27 18:53:50.002101',21.99),(143,'CFP_015016021000','','2017-03-28 03:51:23.935391',16.99),(144,'CFP_015016021008','','2017-03-28 03:51:28.439908',22.99),(145,'CFP_015016021000','','2017-03-28 04:45:00.283714',14.99),(146,'CFP_015016021014','','2017-03-28 04:45:03.328184',18.99),(147,'CFP_015016021011','','2017-03-28 04:45:04.261432',13.99),(148,'CFP_015016021000','','2017-03-28 04:53:34.137722',25.99),(149,'CFP_015016021040','','2017-03-28 04:53:37.106732',23.99),(150,'CFP_015016022000','','2017-03-28 04:55:48.731136',28.99),(151,'CFP_015016022003','','2017-03-28 04:55:50.554542',19.99),(152,'CFP_015016022008','','2017-03-28 04:55:51.311517',15.99),(153,'CFP_016017023000','','2017-03-28 05:35:35.460304',26.99),(154,'CFP_001002008000','','2017-03-28 05:39:18.217137',17.99),(155,'CFP_001002008022','','2017-03-28 05:39:21.566639',27.99),(156,'CFP_015016021000','','2017-03-28 05:54:57.786770',27.99),(157,'CFP_016022023000','','2017-03-28 06:00:59.794820',13.99),(158,'CFP_016022023040','','2017-03-28 06:01:02.282464',19.99),(159,'CFP_003004005000','','2017-03-28 06:03:08.429195',29.99),(160,'CFP_015016021000','','2017-03-28 06:06:03.397107',19.99),(161,'CFP_003009010000','','2017-03-28 06:07:59.873887',16.99),(162,'CFP_015016021000','','2017-03-28 06:09:09.635690',20.99),(163,'CFP_015016022000','','2017-03-28 06:38:39.670222',23.99),(164,'CFP_016017023000','','2017-03-28 06:40:26.549356',13.99),(165,'CFP_016017023013','','2017-03-28 06:40:28.498070',17.99),(166,'CFP_003004010000','','2017-03-28 06:46:31.475058',16.99),(167,'CFP_003004010039','','2017-03-28 06:46:33.960381',15.99),(168,'CFP_003004010027','','2017-03-28 06:46:49.087069',15.99),(169,'CFP_003004010000','','2017-03-28 06:48:21.046285',24.99),(170,'CFP_003004010031','','2017-03-28 06:48:22.607702',26.99),(171,'CFP_003004010017','','2017-03-28 06:48:24.500026',27.99),(172,'CFP_029033034000','','2017-03-28 06:49:27.012951',29.99),(173,'CFP_029033034037','','2017-03-28 06:49:33.347655',20.99),(174,'CFP_028029035000','','2017-03-28 06:50:35.216708',27.99),(175,'CFP_003004011000','','2017-03-28 06:52:16.608860',13.99),(176,'CFP_003004011008','','2017-03-28 06:52:19.524945',16.99),(177,'CFP_003004011015','','2017-03-28 06:52:20.282499',27.99),(178,'CFP_003004011000','','2017-03-28 06:53:46.455706',23.99),(179,'CFP_003004011008','','2017-03-28 06:53:49.178485',27.99),(180,'CFP_003004011015','','2017-03-28 06:53:49.741673',24.99),(181,'CFP_015016023000','','2017-03-28 06:55:20.386128',16.99),(182,'CFP_015016023023','','2017-03-28 06:55:22.179316',18.99),(183,'CFP_016022024000','','2017-03-28 07:00:27.960384',25.99),(184,'CFP_016022024010','','2017-03-28 07:00:29.931441',22.99),(185,'CFP_028029034000','','2017-03-28 07:02:19.707137',26.99),(186,'CFP_015016022000','','2017-03-28 07:11:19.661505',17.99),(191,'CFP_016022023000005004','','2017-04-03 20:11:21.612095',23.99),(192,'CFP_016022023033005004','','2017-04-03 20:11:57.399355',13.99),(194,'CFP_003009010000003001','','2017-04-03 21:18:04.007618',27.99),(195,'CFP_003009010012003001','','2017-04-03 21:21:31.996431',14.99),(196,'CFP_003009010006003001','','2017-04-03 21:21:42.304812',25.99),(197,'CFP_029030035000006002','','2017-04-03 21:56:24.884579',28.99),(198,'CFP_028034035000004005','','2017-04-03 21:56:46.049606',13.99),(200,'CFP_001002011000006001','','2017-04-03 21:58:25.707355',20.99),(201,'CFP_001002011008006001','','2017-04-03 21:58:47.885643',15.99),(202,'CFP_001002011004006001','','2017-04-03 21:58:48.715041',24.99),(203,'CFP_016022023000005006','','2017-04-03 22:01:13.650028',16.99),(204,'CFP_016022023037005006','','2017-04-03 22:01:15.281448',24.99),(205,'CFP_016022023003005006','','2017-04-03 22:01:16.207742',17.99),(206,'CFP_015016022000005006','','2017-04-05 08:16:43.250495',28.99),(207,'CFP_013017023000005006','','2017-04-05 08:18:35.194530',21.99),(208,'CFP_013017023019005006','','2017-04-05 08:18:36.723077',22.99),(209,'CFP_013017023022005006','','2017-04-05 08:18:37.846177',18.99),(214,'CFP_004006011000006001','','2017-04-05 20:23:00.981889',27.99),(215,'CFP_004006011000006001','','2017-04-05 20:30:28.072447',24.99),(216,'CFP_004006011040006001','','2017-04-05 20:30:29.813705',28.99),(217,'CFP_004006011021006001','','2017-04-05 20:30:30.458826',25.99),(218,'CFP_004006011000006001','','2017-04-05 20:31:03.306395',27.99),(219,'CFP_018019023000005006','','2017-04-05 21:45:33.981090',17.99),(220,'CFP_018019023008005006','','2017-04-05 21:45:37.760227',27.99),(221,'CFP_013014020000005004','','2017-04-05 22:26:13.125292',25.99),(222,'CFP_013014020026005004','','2017-04-05 22:26:14.494114',28.99),(223,'CFP_003004010000002001','','2017-04-05 22:51:20.000963',26.99),(224,'CFP_016023024000005006','','2017-04-06 06:17:45.511442',27.99),(225,'CFP_016023024005005006','','2017-04-06 06:17:47.236533',26.99),(226,'CFP_016023024016005006','','2017-04-06 06:17:47.916468',17.99),(227,'CFP_015021023000005006','','2017-04-06 06:54:19.150458',14.99),(228,'CFP_015021023030005006','','2017-04-06 06:54:20.654501',21.99),(229,'CFP_015021023000005006','','2017-04-06 06:54:45.337199',20.99),(230,'CFP_015021023030005006','','2017-04-06 06:54:47.098799',19.99),(231,'CFP_015021023019005006','','2017-04-06 06:54:47.690904',20.99),(232,'CFP_005006011000006001','','2017-04-07 07:24:46.582916',29.99),(233,'CFP_005006011030006001','','2017-04-07 07:24:48.370666',24.99),(234,'CFP_005010011000006001','','2017-04-07 08:48:32.010161',14.99),(235,'CFP_005010011004006001','','2017-04-07 08:48:35.072950',21.99),(236,'CFP_025029033000004005','','2017-04-07 08:51:33.752973',19.99),(237,'CFP_025029033032004005','','2017-04-07 08:51:51.274085',15.99),(238,'CFP_025029033022004005','','2017-04-07 08:51:52.106991',22.99),(239,'CFP_016021022000005006','','2017-04-07 16:49:30.543348',19.99),(240,'CFP_016021022020005006','','2017-04-07 16:49:33.266834',13.99),(241,'CFP_016021022005005006','','2017-04-07 16:49:33.854056',27.99),(244,'CFP_015021022033005006','','2017-04-07 17:04:46.528044',24.99),(245,'CFP_015021022002005006','','2017-04-07 17:04:47.130992',14.99),(246,'CFP_016022023000005004','','2017-04-07 19:46:57.385271',20.99),(247,'CFP_016022023000005004','','2017-04-07 20:04:45.474941',26.99),(248,'CFP_016022023022005004','','2017-04-07 20:04:48.269284',27.99),(249,'CFP_016022023037005004','','2017-04-07 20:04:48.944920',20.99),(251,'CFP_002006007024002001','','2017-04-07 20:15:27.211894',22.99),(252,'CFP_002006007029002001','','2017-04-07 20:15:27.877685',22.99),(253,'CFP_002006007000002001','','2017-04-07 23:13:50.027055',17.99),(278,'CFP_003009011000006001','','2017-04-08 06:46:39.930850',26.99),(287,'CFP_003009011000006001','','2017-04-08 06:48:53.989717',23.99),(293,'CFP_003009011000006001','','2017-04-08 07:09:38.829168',19.99),(294,'CFP_003009011040006001','','2017-04-08 07:10:17.115184',24.99),(295,'CFP_003009011024006001','','2017-04-08 07:10:18.444022',17.99),(301,'CFP_003009011000006001','','2017-04-08 07:40:06.372877',14.99),(302,'CFP_003009011024006001','','2017-04-08 07:40:08.391230',28.99),(303,'CFP_003009011040006001','','2017-04-08 07:40:10.223129',16.99),(304,'CFP_003009011000006001','','2017-04-08 15:12:22.327146',18.99),(305,'CFP_003009011024006001','','2017-04-08 15:12:27.570041',23.99),(306,'CFP_003009011000006001','','2017-04-08 16:17:26.615781',27.99),(307,'CFP_014021023000005006','','2017-04-08 21:49:30.393015',15.99),(308,'CFP_016022023000005006','','2017-04-09 01:25:41.553765',26.99),(309,'CFP_016022023017005006','','2017-04-09 01:25:50.255511',25.99),(310,'CFP_016022023003005006','','2017-04-09 01:25:52.039107',19.99),(311,'CFP_017022023000005006','','2017-04-09 01:29:49.066159',23.99),(312,'CFP_017022023015005006','','2017-04-09 01:29:53.175012',19.99),(313,'CFP_017022023000005006','','2017-04-09 01:37:27.016058',27.99),(314,'CFP_017022023015005006','','2017-04-09 01:37:29.760236',20.99),(315,'CFP_001002008000002001','','2017-04-10 00:10:23.171627',22.99),(316,'CFP_001002008038002001','','2017-04-10 00:10:25.585523',16.99),(317,'CFP_001002008035002001','','2017-04-10 00:10:27.308761',27.99),(318,'CFP_001002008000002001','','2017-04-10 05:28:29.474828',15.99),(319,'CFP_001002008038002001','','2017-04-10 05:28:31.159169',27.99),(320,'CFP_001002008035002001','','2017-04-10 05:28:32.545702',17.99),(321,'CFP_003010011000006001','','2017-04-10 07:28:54.495523',21.99),(322,'CFP_003010011040006001','','2017-04-10 07:28:57.477098',13.99),(323,'CFP_003010011015006001','','2017-04-10 07:28:58.657683',15.99),(324,'CFP_029034035000004005','','2017-04-10 07:30:49.844410',20.99),(325,'CFP_029034035010004005','','2017-04-10 07:30:51.833174',29.99),(326,'CFP_029034035032004005','','2017-04-10 07:30:54.116575',17.99),(327,'CFP_016020021000005004','','2017-04-10 08:33:20.197633',19.99),(328,'CFP_016020021032005004','','2017-04-10 08:33:23.889343',22.99),(329,'CFP_016020021033005004','','2017-04-10 08:33:25.339625',15.99),(330,'CFP_016020021000005004','','2017-04-10 08:35:16.516504',24.99),(331,'CFP_016022023000005004','','2017-04-10 16:43:15.301137',20.99),(332,'CFP_016022023000005004','','2017-04-14 06:38:36.621180',13.99),(333,'CFP_016022023019005004','','2017-04-14 06:38:39.565306',26.99),(334,'CFP_016022023022005004','','2017-04-14 06:38:40.674465',16.99),(335,'CFP_016022023000005004','','2017-04-14 06:40:17.736355',23.99),(336,'CFP_016022023000005004','','2017-04-14 06:46:08.825011',14.99),(337,'CFP_016022023000005004','','2017-04-17 02:42:54.004901',15.99),(338,'CFP_016022023019005004','','2017-04-17 02:42:56.565227',19.99),(339,'CFP_016022023022005004','','2017-04-17 02:42:57.729693',25.99),(340,'CFP_016022023000005004','','2017-04-17 02:47:14.026396',13.99),(341,'CFP_016022023022005004','','2017-04-17 02:47:19.112561',27.99),(342,'CFP_016022023019005004','','2017-04-17 02:47:20.039877',28.99),(343,'CFP_004010011000006001','','2017-04-18 06:25:40.206551',20.99),(344,'CFP_004010011031006001','','2017-04-18 06:25:42.522309',17.99),(345,'CFP_004010011026006001','','2017-04-18 06:25:43.298090',18.99),(346,'CFP_004010011000006001','','2017-04-18 06:35:47.889338',23.99),(347,'CFP_004010011031006001','','2017-04-18 06:35:50.280184',15.99),(348,'CFP_004010011026006001','','2017-04-18 06:35:51.389061',24.99),(349,'CFP_015021022000005004','','2017-04-18 08:49:30.553689',13.99),(350,'CFP_015021022000005004','','2017-04-18 08:51:48.471731',26.99),(352,'CFP_015021022038005006','','2017-04-18 09:07:45.821167',27.99),(353,'CFP_015016022000005004','','2017-04-19 04:25:04.468789',22.99),(354,'CFP_015016022000005004','','2017-04-19 04:25:28.940307',27.99),(355,'CFP_015016022003005004','','2017-04-19 04:25:35.258965',28.99),(356,'CFP_002006010000003001','','2017-04-19 06:31:42.192216',13.99),(357,'CFP_004010011000006001','','2017-04-23 01:38:11.896334',29.99),(358,'CFP_004010011000006001','','2017-04-25 19:28:22.477925',13.99),(359,'CFP_004010011000006001','','2017-04-25 19:52:08.570910',20.99),(360,'CFP_003004010000003001','','2017-04-25 20:26:04.258918',28.99),(361,'CFP_003004010007003001','','2017-04-25 20:26:10.627232',26.99);
/*!40000 ALTER TABLE `home_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_mixingagent`
--

DROP TABLE IF EXISTS `home_mixingagent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_mixingagent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `skin_type_id` int(11),
  `helper` varchar(1000),
  `image` varchar(100) NOT NULL,
  `description` varchar(2000),
  PRIMARY KEY (`id`),
  KEY `f_skin_type_id_69320806_fk_facepackwizard_skintype_option_ptr_id` (`skin_type_id`),
  CONSTRAINT `f_skin_type_id_69320806_fk_facepackwizard_skintype_option_ptr_id` FOREIGN KEY (`skin_type_id`) REFERENCES `facepackwizard_skintype` (`option_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_mixingagent`
--

LOCK TABLES `home_mixingagent` WRITE;
/*!40000 ALTER TABLE `home_mixingagent` DISABLE KEYS */;
INSERT INTO `home_mixingagent` VALUES (1,'Rose water',23,'Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen','images/mixing_agents/honey_UpPb9ng.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(2,'Aloe vera gel',25,'Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen','images/mixing_agents/honey_pem83R4.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(3,'Rose Water and Glycerine',25,'Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen Deeply moisturising, rich in nutrients and boosts collagen','images/mixing_agents/honey_ITD39RV.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(4,'Honey',24,'Natural Humectant, makes skin soft supple and hydrated','images/mixing_agents/honey_cfB6sTS.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(5,'Honey',25,'Natural Humectant, makes skin soft supple and hydrated','images/mixing_agents/honey.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.'),(6,'Rose Water and Glycerine',24,'Deeply moisturising, rich in nutrients and boosts collagen','images/mixing_agents/avacado_JE2ZOFN_uFLy6JW.png','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.');
/*!40000 ALTER TABLE `home_mixingagent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_prepack`
--

DROP TABLE IF EXISTS `home_prepack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_prepack` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `facepack_id` int(11) NOT NULL,
  `ingredient_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_prepack_facepack_id_e5afc497_fk_home_facepack_item_ptr_id` (`facepack_id`),
  KEY `home_prepack_ingredient_id_f47124a7_fk_home_ingredient_id` (`ingredient_id`),
  CONSTRAINT `home_prepack_facepack_id_e5afc497_fk_home_facepack_item_ptr_id` FOREIGN KEY (`facepack_id`) REFERENCES `home_facepack` (`item_ptr_id`),
  CONSTRAINT `home_prepack_ingredient_id_f47124a7_fk_home_ingredient_id` FOREIGN KEY (`ingredient_id`) REFERENCES `home_ingredient` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_prepack`
--

LOCK TABLES `home_prepack` WRITE;
/*!40000 ALTER TABLE `home_prepack` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_prepack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_recipe`
--

DROP TABLE IF EXISTS `home_recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_recipe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mandatory_ingredient_id` int(11) NOT NULL,
  `skin_concern_id` int(11) NOT NULL,
  `skin_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `D4f283763afac08bf883b67606cf515f` (`mandatory_ingredient_id`),
  KEY `a171dab0dba8828cd73064dbe8f1039e` (`skin_concern_id`),
  KEY `f_skin_type_id_55b9f863_fk_facepackwizard_skintype_option_ptr_id` (`skin_type_id`),
  CONSTRAINT `D4f283763afac08bf883b67606cf515f` FOREIGN KEY (`mandatory_ingredient_id`) REFERENCES `home_ingredient` (`id`),
  CONSTRAINT `a171dab0dba8828cd73064dbe8f1039e` FOREIGN KEY (`skin_concern_id`) REFERENCES `facepackwizard_skinconcern` (`option_ptr_id`),
  CONSTRAINT `f_skin_type_id_55b9f863_fk_facepackwizard_skintype_option_ptr_id` FOREIGN KEY (`skin_type_id`) REFERENCES `facepackwizard_skintype` (`option_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_recipe`
--

LOCK TABLES `home_recipe` WRITE;
/*!40000 ALTER TABLE `home_recipe` DISABLE KEYS */;
INSERT INTO `home_recipe` VALUES (1,31,30,23),(2,40,31,23),(3,20,32,23),(4,38,33,23),(5,12,34,23),(6,26,35,23),(7,17,36,23),(8,15,37,23),(9,18,38,23),(10,30,39,23),(11,27,40,23),(12,35,41,23),(13,30,30,24),(14,7,31,24),(15,37,32,24),(16,35,33,24),(17,3,34,24),(18,13,35,24),(19,5,36,24),(20,22,37,24),(21,16,38,24),(22,32,39,24),(23,29,40,24),(24,7,41,24),(25,10,30,25),(26,8,31,25),(27,21,32,25),(28,25,33,25),(29,16,34,25),(30,17,35,25),(31,2,36,25),(32,15,37,25),(33,18,38,25),(34,33,39,25),(35,27,40,25),(36,29,41,25);
/*!40000 ALTER TABLE `home_recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_skintypeingredient`
--

DROP TABLE IF EXISTS `home_skintypeingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_skintypeingredient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ingredient_id` int(11) NOT NULL,
  `skin_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_skintypeingred_ingredient_id_acc8a3de_fk_home_ingredient_id` (`ingredient_id`),
  KEY `h_skin_type_id_720caea1_fk_facepackwizard_skintype_option_ptr_id` (`skin_type_id`),
  CONSTRAINT `h_skin_type_id_720caea1_fk_facepackwizard_skintype_option_ptr_id` FOREIGN KEY (`skin_type_id`) REFERENCES `facepackwizard_skintype` (`option_ptr_id`),
  CONSTRAINT `home_skintypeingred_ingredient_id_acc8a3de_fk_home_ingredient_id` FOREIGN KEY (`ingredient_id`) REFERENCES `home_ingredient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_skintypeingredient`
--

LOCK TABLES `home_skintypeingredient` WRITE;
/*!40000 ALTER TABLE `home_skintypeingredient` DISABLE KEYS */;
INSERT INTO `home_skintypeingredient` VALUES (1,4,23),(2,6,23),(3,7,23),(4,8,23),(5,12,23),(6,13,23),(7,15,23),(8,16,23),(9,17,23),(10,18,23),(11,20,23),(12,21,23),(13,23,23),(14,24,23),(15,25,23),(16,26,23),(17,27,23),(18,28,23),(19,29,23),(20,30,23),(21,31,23),(22,35,23),(23,37,23),(24,38,23),(25,39,23),(26,40,23),(27,42,23),(28,1,24),(29,2,24),(30,3,24),(31,5,24),(32,7,24),(33,8,24),(34,13,24),(35,15,24),(36,16,24),(37,17,24),(38,18,24),(39,19,24),(40,20,24),(42,26,24),(43,27,24),(44,29,24),(45,30,24),(46,31,24),(47,32,24),(48,33,24),(49,35,24),(50,36,24),(51,37,24),(52,38,24),(53,40,24),(54,2,25),(55,3,25),(56,5,25),(57,7,25),(58,8,25),(59,10,25),(60,12,25),(61,13,25),(62,14,25),(63,15,25),(64,16,25),(65,17,25),(66,18,25),(67,20,25),(68,21,25),(69,22,25),(70,23,25),(71,25,25),(72,26,25),(73,27,25),(74,29,25),(75,30,25),(76,31,25),(77,32,25),(78,33,25),(79,35,25),(80,36,25),(81,39,25),(82,40,25);
/*!40000 ALTER TABLE `home_skintypeingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_creditcard`
--

DROP TABLE IF EXISTS `payments_creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments_creditcard` (
  `paymenttype_ptr_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `number` varchar(16) NOT NULL,
  `cvv` int(11) NOT NULL,
  `expiry` date NOT NULL,
  `owner_name` varchar(100) NOT NULL,
  PRIMARY KEY (`paymenttype_ptr_id`),
  CONSTRAINT `payments__paymenttype_ptr_id_54eb0b8d_fk_payments_paymenttype_id` FOREIGN KEY (`paymenttype_ptr_id`) REFERENCES `payments_paymenttype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_creditcard`
--

LOCK TABLES `payments_creditcard` WRITE;
/*!40000 ALTER TABLE `payments_creditcard` DISABLE KEYS */;
INSERT INTO `payments_creditcard` VALUES (22,'visa','12345678',111,'2017-04-01','Sudha Bhat'),(25,'visa','123',11,'2017-04-01','Rajiv Raja'),(26,'visa','1234',1234,'2017-04-01','Rajiv Raja');
/*!40000 ALTER TABLE `payments_creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_payment`
--

DROP TABLE IF EXISTS `payments_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createdte` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `total` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_payment_user_id_f9db060a_fk_auth_user_id` (`user_id`),
  KEY `payments_payment_type_id_c0969163_uniq` (`type_id`),
  CONSTRAINT `payments_payment_type_id_c0969163_fk_payments_paymenttype_id` FOREIGN KEY (`type_id`) REFERENCES `payments_paymenttype` (`id`),
  CONSTRAINT `payments_payment_user_id_f9db060a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_payment`
--

LOCK TABLES `payments_payment` WRITE;
/*!40000 ALTER TABLE `payments_payment` DISABLE KEYS */;
INSERT INTO `payments_payment` VALUES (25,'2017-04-09 01:31:38.119954',3,22,281.87),(38,'2017-04-18 08:53:23.820250',213,25,39.98),(39,'2017-04-25 19:09:34.310768',2,26,132.95),(40,'2017-04-25 19:51:54.703111',2,26,68.95);
/*!40000 ALTER TABLE `payments_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_paymenttype`
--

DROP TABLE IF EXISTS `payments_paymenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments_paymenttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `street` varchar(100) NOT NULL,
  `zipcode` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payments_paymenttype_user_id_56a087f5_fk_auth_user_id` (`user_id`),
  CONSTRAINT `payments_paymenttype_user_id_56a087f5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_paymenttype`
--

LOCK TABLES `payments_paymenttype` WRITE;
/*!40000 ALTER TABLE `payments_paymenttype` DISABLE KEYS */;
INSERT INTO `payments_paymenttype` VALUES (22,1,3,'SAN FRANCISCO','','CA','1390 Market St 9th & Market','94102'),(25,1,213,'San Francisco','','CA','897 Carolina st','94107'),(26,1,2,'San Francisco','','CA','731 Ellsworth St','94110');
/*!40000 ALTER TABLE `payments_paymenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_paypal`
--

DROP TABLE IF EXISTS `payments_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments_paypal` (
  `paymenttype_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`paymenttype_ptr_id`),
  CONSTRAINT `payments__paymenttype_ptr_id_10c47590_fk_payments_paymenttype_id` FOREIGN KEY (`paymenttype_ptr_id`) REFERENCES `payments_paymenttype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_paypal`
--

LOCK TABLES `payments_paypal` WRITE;
/*!40000 ALTER TABLE `payments_paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_purchasehistory`
--

DROP TABLE IF EXISTS `payments_purchasehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments_purchasehistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shipping_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `ship_date` date,
  PRIMARY KEY (`id`),
  KEY `payments_purchasehistory_item_id_1ac80778_fk_home_item_id` (`item_id`),
  KEY `payments_purchasehist_payment_id_a8ecb1e9_fk_payments_payment_id` (`payment_id`),
  KEY `payments_purchasehistory_user_id_6f7e3e35_fk_auth_user_id` (`user_id`),
  CONSTRAINT `payments_purchasehist_payment_id_a8ecb1e9_fk_payments_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `payments_payment` (`id`),
  CONSTRAINT `payments_purchasehistory_item_id_1ac80778_fk_home_item_id` FOREIGN KEY (`item_id`) REFERENCES `home_item` (`id`),
  CONSTRAINT `payments_purchasehistory_user_id_6f7e3e35_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_purchasehistory`
--

LOCK TABLES `payments_purchasehistory` WRITE;
/*!40000 ALTER TABLE `payments_purchasehistory` DISABLE KEYS */;
INSERT INTO `payments_purchasehistory` VALUES (62,1,206,25,3,1,'buy',1,'2017-04-09'),(63,1,207,25,3,1,'buy',1,'2017-04-09'),(64,1,208,25,3,1,'buy',1,'2017-04-09'),(65,1,209,25,3,1,'buy',1,'2017-04-09'),(66,4,311,25,3,1,'subscribe',1,'2017-04-09'),(67,4,312,25,3,1,'subscribe',1,'2017-04-09'),(101,1,350,38,213,1,'buy',1,'2017-04-19'),(102,4,357,39,2,1,'subscribe',1,'2017-04-26'),(103,4,358,40,2,1,'subscribe',1,'2017-04-26');
/*!40000 ALTER TABLE `payments_purchasehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_shipping`
--

DROP TABLE IF EXISTS `payments_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments_shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(1000) NOT NULL,
  `cost` decimal(6,2) NOT NULL,
  `helper` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_shipping`
--

LOCK TABLES `payments_shipping` WRITE;
/*!40000 ALTER TABLE `payments_shipping` DISABLE KEYS */;
INSERT INTO `payments_shipping` VALUES (1,'1 business day',12.99,'One day shipping is not available for PO boxes. Orders placed before 12 PM (ET) On Mon-Fri will ship same day'),(2,'2 business days',9.99,'Two business day shipping will be standard air mail. Orders received before 12 PM (ET) will ship the same day'),(3,'3-5 business days',7.99,'Priority mail USPS will be used. Orders placed before 12PM (ET) will be shipped the same day'),(4,'7-10 business days',4.99,'Standard USPS mail');
/*!40000 ALTER TABLE `payments_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_c1336794` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` (`user_id`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (49,'facebook','10102534254770084','{\"access_token\": \"EAABn4Jjpp78BANYEl2Qo2BTbDl5B0zJ9cyU4KZCZAza5XIFqKeCO28hUmcZAx7NmUdZAJ5ll4XCAaZCsygKKKX7oeJPUhfozUyzeMTnaFvZAK4fmejG3oUXavK6zPZBv7vJ627kjbor3ELP9M8VAdJfU1tKPFhOmd0ZD\", \"expires\": null, \"token_type\": null, \"id\": \"10102534254770084\"}',2),(50,'facebook','10155307675260039','{\"access_token\": \"EAABn4Jjpp78BAHzZCgxeEm046sMHaQDTiSfHGklJ2erHBk74hdJOvM1BhWLO8fZAomvYno2sQMR03xBY7wmDJZCtuayyOStGL3i6vSfrPXhkzSBdPQCIQGftOS1wIm2aaeDaMCK69uSnk2dG3uXegXfuEfQB7oZD\", \"expires\": null, \"token_type\": null, \"id\": \"10155307675260039\"}',6);
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userregistration_profile`
--

DROP TABLE IF EXISTS `userregistration_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userregistration_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `picture` varchar(100) NOT NULL,
  `location` varchar(30) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `questionnaire_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `subscription` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `D42afe1a0503102569281e3f24b0ab91` (`questionnaire_id`),
  CONSTRAINT `D42afe1a0503102569281e3f24b0ab91` FOREIGN KEY (`questionnaire_id`) REFERENCES `facepackwizard_questionnaireuserdata` (`id`),
  CONSTRAINT `userregistration_profile_user_id_d0b768c1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userregistration_profile`
--

LOCK TABLES `userregistration_profile` WRITE;
/*!40000 ALTER TABLE `userregistration_profile` DISABLE KEYS */;
INSERT INTO `userregistration_profile` VALUES (1,'images/profile/rajiv.rajagmail.com_social_00bwAw4_r50CCVd_zEfpL6X_zkOAlvX.jpg','','1984-05-13','Male',NULL,2,'Yes'),(2,'images/profile/mridulakulkarnigmail.com_social.jpg','',NULL,'Female',NULL,6,''),(3,'images/profile/yoda.jpg','',NULL,'Male',NULL,1,''),(4,'images/profile/yoda_usvNUUg_o3BbE0N.jpg','','1980-03-26','Female',NULL,3,''),(6,'','',NULL,NULL,NULL,192,''),(7,'','',NULL,'Male',NULL,193,''),(8,'images/profile/yoda_gnkmBMr_EmD7sf2_hDaJsDf.jpg','',NULL,NULL,NULL,213,'');
/*!40000 ALTER TABLE `userregistration_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userregistration_shippingaddress`
--

DROP TABLE IF EXISTS `userregistration_shippingaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userregistration_shippingaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street1` varchar(100) NOT NULL,
  `street2` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zipcode` varchar(50) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userregistrat_profile_id_7c94c91e_fk_userregistration_profile_id` (`profile_id`),
  CONSTRAINT `userregistrat_profile_id_7c94c91e_fk_userregistration_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `userregistration_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userregistration_shippingaddress`
--

LOCK TABLES `userregistration_shippingaddress` WRITE;
/*!40000 ALTER TABLE `userregistration_shippingaddress` DISABLE KEYS */;
INSERT INTO `userregistration_shippingaddress` VALUES (8,'123 Tree House','','San Francisco','CA','','11111','4085551234',1,3,'Root','Beet'),(11,'1390 Market St','Apt #1808','Select One','CA','','94102','6603499626',0,6,'Mridula','Kulkarni'),(12,'897 Carolina st','','San Francisco','CA','','94107','4084804264',1,6,'Rajiv','Raja'),(18,'731 Ellsworth St','','San Francisco','CA','','94110','4084804264',1,1,'Rajiv','Raja'),(20,'897 Carolina st','','San Francisco','CA','','94107','4084804264',0,1,'Rajiv','Raja'),(21,'1390 Market St','9th & Market','SAN FRANCISCO','CA','','94102','4084804264',1,4,'Sudha','Bhat'),(22,'897 Carolina st','','San Francisco','CA','','94107','4084804264',1,8,'Rajiv','Raja');
/*!40000 ALTER TABLE `userregistration_shippingaddress` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-25 13:45:34
