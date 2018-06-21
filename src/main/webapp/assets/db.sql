CREATE DATABASE  IF NOT EXISTS `tutesmessanger` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `tutesmessanger`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: tutesmessanger
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instituteid` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnxfgigw3bfa77sdopkoiybuy6` (`instituteid`),
  CONSTRAINT `FKnxfgigw3bfa77sdopkoiybuy6` FOREIGN KEY (`instituteid`) REFERENCES `institute` (`id`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`instituteid`) REFERENCES `institute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (15,50,'Pune'),(17,61,'Nagpur'),(19,50,'Bombay'),(33,50,'Goa');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branchid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8txt3facl8ithk4d24werxdj0` (`branchid`),
  CONSTRAINT `FK8txt3facl8ithk4d24werxdj0` FOREIGN KEY (`branchid`) REFERENCES `branch` (`id`),
  CONSTRAINT `branch constraint` FOREIGN KEY (`branchid`) REFERENCES `branch` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (18,15,'10th'),(19,15,'11th'),(20,17,'12th'),(24,19,'10th'),(25,15,'12th'),(28,33,'10th');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `division`
--

DROP TABLE IF EXISTS `division`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `division` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK25iyw80l6c7ieoxnxa0c07f4g` (`classid`),
  CONSTRAINT `FK25iyw80l6c7ieoxnxa0c07f4g` FOREIGN KEY (`classid`) REFERENCES `classes` (`id`),
  CONSTRAINT `class constraint` FOREIGN KEY (`classid`) REFERENCES `classes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `division`
--

LOCK TABLES `division` WRITE;
/*!40000 ALTER TABLE `division` DISABLE KEYS */;
INSERT INTO `division` VALUES (19,18,'A'),(20,18,'B'),(21,18,'C'),(22,19,'PCM'),(23,19,'PCB'),(24,20,'PCMB'),(29,24,'A'),(30,24,'B'),(31,19,'A'),(32,19,'B'),(35,28,'abcd');
/*!40000 ALTER TABLE `division` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discription` varchar(500) DEFAULT NULL,
  `out_of` int(11) DEFAULT NULL,
  `passing_marks` int(11) DEFAULT NULL,
  `regular` tinyint(4) DEFAULT NULL,
  `exam_type_id` int(11) DEFAULT NULL,
  `exam_mode_id` int(11) DEFAULT NULL,
  `insitute_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa4rudfrulu7igoabmfnq4nndl` (`exam_mode_id`),
  KEY `FKfahd9o24dqkyeyup3wrgyu8ql` (`exam_type_id`),
  KEY `FKo12ytwci1fdjd7dpc5j0t9r0v` (`insitute_id`),
  CONSTRAINT `FKa4rudfrulu7igoabmfnq4nndl` FOREIGN KEY (`exam_mode_id`) REFERENCES `exam_mode` (`id`),
  CONSTRAINT `FKfahd9o24dqkyeyup3wrgyu8ql` FOREIGN KEY (`exam_type_id`) REFERENCES `exam_type` (`id`),
  CONSTRAINT `FKo12ytwci1fdjd7dpc5j0t9r0v` FOREIGN KEY (`insitute_id`) REFERENCES `institute` (`id`),
  CONSTRAINT `exam_mode foreign key` FOREIGN KEY (`exam_mode_id`) REFERENCES `exam_mode` (`id`),
  CONSTRAINT `exam_type foreign key` FOREIGN KEY (`exam_type_id`) REFERENCES `exam_type` (`id`),
  CONSTRAINT `institute_foreign_key` FOREIGN KEY (`insitute_id`) REFERENCES `institute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (38,'Unit Test 2018',100,40,1,1,3,50),(119,'Final 2018',200,50,0,2,2,50),(120,'Final 2017',200,80,0,3,2,50);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_mode`
--

DROP TABLE IF EXISTS `exam_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_mode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Mode_name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_mode`
--

LOCK TABLES `exam_mode` WRITE;
/*!40000 ALTER TABLE `exam_mode` DISABLE KEYS */;
INSERT INTO `exam_mode` VALUES (1,'MCQ'),(2,'Theory'),(3,'Practical'),(4,'Oral');
/*!40000 ALTER TABLE `exam_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_subject_student_composit_table`
--

DROP TABLE IF EXISTS `exam_subject_student_composit_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_subject_student_composit_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `duration_in_minutes` int(11) DEFAULT NULL,
  `subject_div_id` int(11) DEFAULT NULL,
  `out_of_marks` int(11) DEFAULT NULL,
  `passing_marks` int(11) DEFAULT NULL,
  `date_time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Exam_Studen_SubDiv` (`student_id`,`exam_id`,`subject_div_id`),
  UNIQUE KEY `UK3qrcyk8csw9oujgr0vb3vcg7a` (`student_id`,`exam_id`),
  KEY `FKiwdhevlshbvf82oc98yblqccu` (`exam_id`),
  KEY `FK4i0i0cq4pj64f82hcn7se3nts` (`subject_div_id`),
  CONSTRAINT `FK4i0i0cq4pj64f82hcn7se3nts` FOREIGN KEY (`subject_div_id`) REFERENCES `subject_div_composit` (`id`),
  CONSTRAINT `FK56xga9as5cccvpw6rqjtbg2qc` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `FKiwdhevlshbvf82oc98yblqccu` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  CONSTRAINT `exam` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  CONSTRAINT `student foreign key` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `subject_div_id foreign key` FOREIGN KEY (`subject_div_id`) REFERENCES `subject_div_composit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_subject_student_composit_table`
--

LOCK TABLES `exam_subject_student_composit_table` WRITE;
/*!40000 ALTER TABLE `exam_subject_student_composit_table` DISABLE KEYS */;
INSERT INTO `exam_subject_student_composit_table` VALUES (125,NULL,38,20,6,20,20,'2018-05-30'),(126,26,38,20,6,20,20,'2018-05-30'),(127,NULL,38,60,1,50,20,'2018-05-30'),(128,23,38,20,6,20,20,'2018-05-30'),(129,24,38,20,6,20,20,'2018-05-30'),(130,25,38,20,6,20,20,'2018-05-30'),(131,27,38,20,6,20,20,'2018-05-30'),(132,28,38,20,6,20,20,'2018-05-30'),(133,29,38,20,6,20,20,'2018-05-30'),(134,30,38,20,6,20,20,'2018-05-30'),(135,31,38,20,6,20,20,'2018-05-30'),(136,32,38,20,6,20,20,'2018-05-30'),(137,33,38,20,6,20,20,'2018-05-30'),(138,34,38,20,6,20,20,'2018-05-30'),(139,36,38,20,6,20,20,'2018-05-30'),(140,21,38,20,6,20,20,'2018-05-30');
/*!40000 ALTER TABLE `exam_subject_student_composit_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_type`
--

DROP TABLE IF EXISTS `exam_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Type_name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_type`
--

LOCK TABLES `exam_type` WRITE;
/*!40000 ALTER TABLE `exam_type` DISABLE KEYS */;
INSERT INTO `exam_type` VALUES (1,'Unit Test'),(2,'semister end'),(3,'Annual');
/*!40000 ALTER TABLE `exam_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute`
--

DROP TABLE IF EXISTS `institute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `institute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `contactno` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `Subscription_till` date DEFAULT NULL,
  `Subscrition_enable` tinyint(1) DEFAULT '0',
  `enable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `UKpjpnqsflkw13n8c1rldhqtqeo` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute`
--

LOCK TABLES `institute` WRITE;
/*!40000 ALTER TABLE `institute` DISABLE KEYS */;
INSERT INTO `institute` VALUES (50,'Vidya','Pune','7894561230','vidya@vidya.com','2027-06-26',1,NULL),(61,'Chaitanhya Acedami','pune','7385620399','ratan@gmail.com','2008-02-10',0,NULL),(62,'Chate','pune','7879456321','asdf@sdf.com','2018-03-31',1,NULL),(63,'Sinhgad','vadgaon BK','8520741963','sinhgad@gmai.com','2018-02-21',0,NULL);
/*!40000 ALTER TABLE `institute` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `subscriptiondate_enable` BEFORE INSERT ON `institute` FOR EACH ROW BEGIN
    
    IF  new.Subscription_till > DATE(NOW()) Then
  
    SET new.Subscrition_enable=true;
   
    END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `subscriptureEnableUpdate` BEFORE UPDATE ON `institute` FOR EACH ROW BEGIN
    
    IF  new.Subscription_till >= DATE(NOW()) THEN
  
    SET new.Subscrition_enable=1;
   
    END IF;
    
    
    IF  new.Subscription_till < DATE(NOW()) THEN
  
    SET new.Subscrition_enable=0;
   
    END IF;
    
    
    
    
    
    
    
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Change_Login_Permissions` AFTER UPDATE ON `institute` FOR EACH ROW BEGIN
    
     
     
    Update `tutesmessanger`.`login`, `tutesmessanger`.`teacher` SET `login`.`enable_Master`=new.`Subscrition_enable` where 
   `teacher`.`instid`=new.id and `tutesmessanger`.`teacher`.`loginid`=`tutesmessanger`.`login`.`id`;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `enable_Master` tinyint(1) NOT NULL DEFAULT '0',
  `enable_Institute` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `UK3svxcq6q51yfdg253l6x3dget` (`username`),
  KEY `FKrn8y9fe820jtkri7daw25wa5e` (`role`),
  CONSTRAINT `FKrn8y9fe820jtkri7daw25wa5e` FOREIGN KEY (`role`) REFERENCES `role` (`id`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (16,'Admin','Admin',4,1,1),(30,'vidya@vidya.com','7894561230',3,1,1),(34,'ratan@gmail.com','7385620399',3,0,1),(38,'teacher','teacher',2,1,1),(48,'pdukalesdf@sfsd.cd','7539514682',2,1,1),(90,'asdfasdf@asdf.co','9875641230',2,1,1),(103,'sadf@sadfas.co','9856321470',1,1,1),(104,'pdukale9@gmail.com','9385620399',1,1,1),(106,'asdfas@asdfas.com','9857456129',2,1,1),(107,'asdfsdf@asdfa.com','9632587404',2,1,1),(108,'abhi@gmail.com','9874563215',2,1,1),(109,'reupesh@gmail.com','9658746321',2,1,0),(110,'anup@gmail.com','8520147963',2,1,0),(111,'abcd@gmail.com','9658743210',1,1,1),(112,'dipak@gmail.com','9657841230',1,1,1),(113,'nayan@gmail.com','7845456932',1,1,1),(114,'arpit@gmail.com','9658742310',1,1,1),(115,'sdfasdf@dfas.com','9587461230',1,1,1),(116,'ssdf@asdfas.com','9857461233',1,1,1),(117,'sdfsdsd@sdfsd.com','9658741230',1,1,1),(118,'fasdf@asdfasd.co','8974561230',1,1,1),(119,'sfsadfasd@asdf.co','9658741230',1,1,1),(120,'sdfasdf@sdfsd.co','9658741230',1,1,1),(121,'rahul@gmail.com','9658741230',1,1,1),(122,'govind@gmail.com','8974563210',1,1,1),(124,'kiran@gmail.com','8974561230',1,1,1),(125,'nikhil@gmail.com','9874562130',2,1,0),(126,'gopal123@gmail.com','9865741230',2,0,0),(127,'sinhgad@gmail.com','8523697410',3,0,1),(128,'abhishek@gmail.com','8563214790',2,1,0);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `deleteParentOnDeleteOfStudent` BEFORE DELETE ON `login` FOR EACH ROW BEGIN
       
            DELETE parent.* FROM `parent` , student , login ,role WHERE parent.`id`=student.`parentid` AND student.`loginid`=login.`id`AND login.`id`= old.id AND login.`role`=role.`id` AND role.`name`='ROLE_STUDENT';
       
     
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `text` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3uaviomsxbnhtv592qo1vsl59` (`role_id`),
  CONSTRAINT `FK3uaviomsxbnhtv592qo1vsl59` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `Role foreign key` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `contactno` varchar(12) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent`
--

LOCK TABLES `parent` WRITE;
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
INSERT INTO `parent` VALUES (29,'dfsdf','asdf','9856321470','sadf@sadfas.co'),(30,'Ashok','Dukale','9168516735','pdukale9@gmail.com'),(32,'Pintu','Zintu','9658743210','abcd@gmail.com'),(33,'Babasaheb','Nalawade','8605617199','dipak@gmail.com'),(34,'Bajirao','Patil','9657939975','nayan@gmail.com'),(35,'Mahadev','sharma','9658742310','arpit@gmail.com'),(36,'sdfasf','fasdfasdf','9587461230','sdfasdf@dfas.com'),(37,'sdgfsadf','gfsda','9857461233','ssdf@asdfas.com'),(38,'SFsdfsd','fsdsd','9658741230','sdfsdsd@sdfsd.com'),(39,'sfasd','fasdf','8974561230','fasdf@asdfasd.co'),(40,'sdfasd','sdf','9658741230','sfsadfasd@asdf.co'),(41,'sdfasd','fsdafasdf','9658741230','sdfasdf@sdfsd.co'),(42,'Prabhakar','Sadaphal','9658741230','rahul@gmail.com'),(43,'Gopal','Agrawal','8974563210','govind@gmail.com'),(45,'Piraji','Sawale','8974561230','kiran@gmail.com');
/*!40000 ALTER TABLE `parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorise_student` tinyint(1) NOT NULL DEFAULT '0',
  `authorise_teacher` tinyint(1) NOT NULL DEFAULT '0',
  `fill_attendance` tinyint(1) NOT NULL DEFAULT '0',
  `fill_schedule` tinyint(1) NOT NULL DEFAULT '0',
  `mail_parent` tinyint(1) NOT NULL DEFAULT '0',
  `mail_student` tinyint(1) NOT NULL DEFAULT '0',
  `mail_teacher` tinyint(1) NOT NULL DEFAULT '0',
  `msg_parent` tinyint(1) NOT NULL DEFAULT '0',
  `msg_student` tinyint(1) NOT NULL DEFAULT '0',
  `msg_teacher` tinyint(1) NOT NULL DEFAULT '0',
  `set_exam` tinyint(1) NOT NULL DEFAULT '0',
  `update_results` tinyint(1) NOT NULL DEFAULT '0',
  `alter_institute_structure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (13,1,1,1,1,1,1,1,1,1,1,1,1,1),(15,1,1,1,1,1,1,1,1,1,1,1,1,1),(16,1,1,1,1,1,1,1,1,1,1,1,1,1),(17,1,1,1,1,1,1,1,1,1,1,1,1,1),(18,1,0,0,0,0,0,0,0,0,0,0,0,0),(19,0,0,0,0,0,0,1,0,0,1,1,1,1),(20,1,0,0,0,0,1,1,0,0,1,0,0,1),(21,1,0,1,1,1,1,1,1,1,1,1,1,1),(22,1,1,1,1,1,1,1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistent_logins`
--

LOCK TABLES `persistent_logins` WRITE;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `obtained_marks` int(11) DEFAULT NULL,
  `remarks` varchar(300) DEFAULT NULL,
  `exam_subject_student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exam_subject_student_id` (`exam_subject_student_id`),
  KEY `FK6x12uwgitmtjgm503wyiofkxf` (`exam_subject_student_id`),
  CONSTRAINT `FK6x12uwgitmtjgm503wyiofkxf` FOREIGN KEY (`exam_subject_student_id`) REFERENCES `exam_subject_student_composit_table` (`id`),
  CONSTRAINT `exam_subject_student foreign key` FOREIGN KEY (`exam_subject_student_id`) REFERENCES `exam_subject_student_composit_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (1,18,'Pass with distinction',129),(2,2,'Fail',126),(3,4,'Fail',128),(4,20,'3',130),(5,NULL,'ss',131),(6,19,'Pass with Distinction',140);
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_STUDENT'),(2,'ROLE_TEACHER'),(3,'ROLE_INSTITUTE_ADMIN'),(4,'ROLE_APP_ADMIN'),(5,'ROLE_PARENT'),(6,'ROLE_TEMPLATE'),(57,'tester 123');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `division` int(11) DEFAULT NULL,
  `string` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `division` (`division`),
  UNIQUE KEY `UKdwsnwm45935druiyn7l2rb9qx` (`division`),
  CONSTRAINT `FKsn3hd79992f4c761tx84ms4v7` FOREIGN KEY (`division`) REFERENCES `division` (`id`),
  CONSTRAINT `division foreign kry` FOREIGN KEY (`division`) REFERENCES `division` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,22,'<iframe src=\'https://calendar.google.com/calendar/embed?height=600&amp;wkst=2&amp;bgcolor=%23FFFFFF&amp;src=ci5fi0t0u5i8927il2ula0kbgs%40group.calendar.google.com&amp;color=%2329527A&amp;ctz=Asia%2FCalcutta\' style=\'border-width:0\' width=\'800\' height=\'600\' frameborder=\'0\' scrolling=\'no\'></iframe>'),(2,19,'<iframe src=\'https://calendar.google.com/calendar/embed?showCalendars=0&amp;mode=WEEK&amp;height=600&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=ci5fi0t0u5i8927il2ula0kbgs%40group.calendar.google.com&amp;color=%2329527A&amp;ctz=Asia%2FCalcutta\' style=\'border-width:0\' width=\'800\' height=\'600\' frameborder=\'0\' scrolling=\'no\'></iframe>'),(3,20,'<iframe src=\'https://calendar.google.com/calendar/embed?showCalendars=0&amp;mode=WEEK&amp;height=600&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=ci5fi0t0u5i8927il2ula0kbgs%40group.calendar.google.com&amp;color=%2329527A&amp;ctz=Asia%2FCalcutta\' style=\'border-width:0\' width=\'800\' height=\'600\' frameborder=\'0\' scrolling=\'no\'></iframe>'),(4,23,'<iframe src=\'https://calendar.google.com/calendar/embed?mode=AGENDA&amp;height=600&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=ci5fi0t0u5i8927il2ula0kbgs%40group.calendar.google.com&amp;color=%2329527A&amp;ctz=Asia%2FCalcutta\' style=\'border-width:0\' width=\'800\' height=\'600\' frameborder=\'0\' scrolling=\'no\'></iframe>');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginid` int(11) DEFAULT NULL,
  `fName` varchar(255) DEFAULT NULL,
  `father` varchar(50) NOT NULL,
  `lName` varchar(255) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `contactno` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `instid` int(11) DEFAULT NULL,
  `divid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parentid`),
  KEY `student_ibfk_1` (`loginid`),
  KEY `student_ibfk_2` (`instid`),
  KEY `FK25ch4pvl5ikrkjkwqqttrjiws` (`divid`),
  CONSTRAINT `FK25ch4pvl5ikrkjkwqqttrjiws` FOREIGN KEY (`divid`) REFERENCES `division` (`id`),
  CONSTRAINT `FKddkv9iq8sx7tndj2dnn9k88ux` FOREIGN KEY (`instid`) REFERENCES `institute` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKiuk6flu7v3kxbkl6mx1x741fb` FOREIGN KEY (`parentid`) REFERENCES `parent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKkst5i99hukf1o65ca5tyf8jcl` FOREIGN KEY (`loginid`) REFERENCES `login` (`id`) ON DELETE CASCADE,
  CONSTRAINT `div_id_difk` FOREIGN KEY (`divid`) REFERENCES `division` (`id`),
  CONSTRAINT `parent` FOREIGN KEY (`parentid`) REFERENCES `parent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`loginid`) REFERENCES `login` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`instid`) REFERENCES `institute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (20,103,'sdfas','dfsdf','asdf',29,'9856321470','sadf@sadfas.co',50,NULL),(21,104,'Prasad','Ashok','Dukale',30,'9657939975','pdukale9@gmail.com',50,19),(23,111,'Rahul','Sawle','Sawle',32,'9658743210','abcd@gmail.com',50,19),(24,112,'Anil','Babasaheb','Nalawade',33,'8605617199','dipak@gmail.com',50,19),(25,113,'Nayan','Bajirao','Patil',34,'7845456932','nayan@gmail.com',50,19),(26,114,'Arpit','Mahadev','sharma',35,'9658742310','arpit@gmail.com',50,19),(27,115,'abcva','sdfasf','fasdfasdf',36,'9587461230','sdfasdf@dfas.com',50,19),(28,116,'vsxvsd','sdgfsadf','gfsda',37,'9857461233','ssdf@asdfas.com',50,19),(29,117,'sdfdsfsd','SFsdfsd','fsdsd',38,'9658741230','sdfsdsd@sdfsd.com',50,19),(30,118,'fsdaf','sfasd','fasdf',39,'8974561230','fasdf@asdfasd.co',50,19),(31,119,'sfsdf','sdfasd','sdf',40,'9658741230','sfsadfasd@asdf.co',50,19),(32,120,'sdfasdf','sdfasd','fsdafasdf',41,'9658741230','sdfasdf@sdfsd.co',50,19),(33,121,'Rahul','Prabhakar','Sadaphal',42,'9658741230','rahul@gmail.com',50,19),(34,122,'Govind','Gopal','Agrawal',43,'8974563210','govind@gmail.com',50,19),(36,124,'kiran','Piraji','Sawale',45,'8974561230','kiran@gmail.com',50,19);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `InsertStudentSubscriptionPermission` AFTER INSERT ON `student` FOR EACH ROW BEGIN
   UPDATE `tutesmessanger`.`login`, `tutesmessanger`.`student` , `tutesmessanger`.`institute` SET `login`.`enable_Master`=`institute`.`Subscrition_enable`
  WHERE student.`instid`=institute.`id` AND `student`.`loginid`=`login`.`id` AND student.id=new.id;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `discription` varchar(500) DEFAULT NULL,
  `institute_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK31tn17ut80e8s1jkyxdyfhp9x` (`institute_id`),
  CONSTRAINT `FK31tn17ut80e8s1jkyxdyfhp9x` FOREIGN KEY (`institute_id`) REFERENCES `institute` (`id`),
  CONSTRAINT `institute_id_foreign_key` FOREIGN KEY (`institute_id`) REFERENCES `institute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'English','10th English sub',50),(2,'Marathi','10th Marathi',50),(3,'Biology','11th Biology1',50),(4,'Chemistry','11th Chemistry',50),(5,'Maths','11th Maths',50),(6,'Maths','12th Maths',50),(7,'bjh','bjh',50),(8,'10th Maths','10th Maths',50),(9,'Biology','11th biology',50);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_div_composit`
--

DROP TABLE IF EXISTS `subject_div_composit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subject_div_composit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Div_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gsc` (`Div_id`,`subject_id`),
  UNIQUE KEY `UK99nkqs6we456shw0bj7socmk9` (`Div_id`,`subject_id`),
  KEY `FKcgw7bcc6v725hws71q5sssk98` (`subject_id`),
  CONSTRAINT `FKcgw7bcc6v725hws71q5sssk98` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `FKhm4bowjb4if0a6hqhhlrocwfi` FOREIGN KEY (`Div_id`) REFERENCES `division` (`id`),
  CONSTRAINT `div foreign key` FOREIGN KEY (`Div_id`) REFERENCES `division` (`id`),
  CONSTRAINT `sub foreign key` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_div_composit`
--

LOCK TABLES `subject_div_composit` WRITE;
/*!40000 ALTER TABLE `subject_div_composit` DISABLE KEYS */;
INSERT INTO `subject_div_composit` VALUES (6,19,1),(7,19,2),(4,19,3),(5,19,4),(10,19,5),(12,19,7),(1,22,1),(2,22,2),(3,23,1),(8,23,3),(9,23,4);
/*!40000 ALTER TABLE `subject_div_composit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `instid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contactno` varchar(11) NOT NULL,
  `loginid` int(11) DEFAULT NULL,
  `permissions` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAA31CBE24AD2CFF8` (`permissions`),
  KEY `FK5oud04u4jqqk94fw43yq24aia` (`instid`),
  KEY `FK5nx0877rbto8ekmbaqej7c1e6` (`loginid`),
  CONSTRAINT `FK5nx0877rbto8ekmbaqej7c1e6` FOREIGN KEY (`loginid`) REFERENCES `login` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK5oud04u4jqqk94fw43yq24aia` FOREIGN KEY (`instid`) REFERENCES `institute` (`id`),
  CONSTRAINT `FKAA31CBE24AD2CFF8` FOREIGN KEY (`permissions`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKpfiaka1s2wcphdf19527xcrjx` FOREIGN KEY (`permissions`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instid` FOREIGN KEY (`instid`) REFERENCES `institute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loginid` FOREIGN KEY (`loginid`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (25,'Arpit','Sharma',50,'vidya@vidya.com','7894561230',30,13),(29,'Ratan ','Jadhav',61,'ratan@gmail.com','7385620399',34,15),(55,'sdafasdfsdfas','sdfasdf',50,'asdfasdf@asdf.co','9875641230',90,18),(56,'fasdf','asfasf',50,'asdfas@asdfas.com','9857456129',106,19),(57,'fsdf','asf',50,'asdfsdf@asdfa.com','9632587404',107,20),(58,'Abhishek ','Mishra',50,'abhi@gmail.com','9874563215',108,21),(59,'Rupesh ','Murgunde',50,'reupesh@gmail.com','9658746321',109,NULL),(60,'Anup','Borase',50,'anup@gmail.com','8520147963',110,NULL),(61,'Nikhil','Adsul',50,'nikhil@gmail.com','9874562130',125,NULL),(62,'Gopal','Sarkar',61,'gopal123@gmail.com','9865741230',126,NULL),(63,'Sinhgad','Collage',63,'sinhgad@gmail.com','8523697410',127,22),(64,'Abhishek','Agraval',50,'abhishek@gmail.com','8563214790',128,NULL);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `InsertTeacherSubscriptionPermission` AFTER INSERT ON `teacher` FOR EACH ROW BEGIN
   UPDATE `tutesmessanger`.`login`, `tutesmessanger`.`teacher` , `tutesmessanger`.`institute` SET `login`.`enable_Master`=`institute`.`Subscrition_enable`
  WHERE teacher.instid=institute.`id` AND `teacher`.`loginid`=`login`.`id` AND teacher.id=new.id;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'tutesmessanger'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `DisableIsntituteMaster` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8 */ ;;
/*!50003 SET character_set_results = utf8 */ ;;
/*!50003 SET collation_connection  = utf8_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `DisableIsntituteMaster` ON SCHEDULE EVERY 1 SECOND STARTS '2018-01-14 06:29:28' ON COMPLETION PRESERVE ENABLE DO BEGIN
	    update `institute` set `Subscrition_enable`=0 where `Subscription_till` < CURRENT_TIMESTAMP;
	     UPDATE `institute` SET `Subscrition_enable`=1 WHERE `Subscription_till` >= CURRENT_TIMESTAMP;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'tutesmessanger'
--
/*!50003 DROP PROCEDURE IF EXISTS `TreeViewBranch` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TreeViewBranch`(IN Branch_Id INT,IN spMode int,IN param INT,out JSON2 LONGTEXT)
BEGIN
    
	DECLARE ClassId INT;
	DECLARE ClassBranchId INT;
	DECLARE ClassName VARCHAR(100);
	
	DECLARE done INT;
	
	DECLARE ClassCount INT;
	
	DECLARE strVar VARCHAR(1000);
  
	
    
	DECLARE ClassesCursor CURSOR FOR SELECT * FROM classes WHERE branchid = Branch_Id;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
	
	SET done = 0;
	SET JSON2="[";
		
      
	OPEN ClassesCursor;
	
	SET ClassCount=0;
        
		loop2: LOOP
        
        
			FETCH ClassesCursor INTO ClassId,ClassBranchId,ClassName;
        
				IF done = 1 THEN 				
					LEAVE loop2; 
				END IF;
				
				SET JSON2=CONCAT(JSON2,'{\"label\":\"',ClassName,'\", \"value\":',ClassId,',\"type\":\"Class\"');
				
				CALL TreeViewClass(ClassId,spMode,param,@strVar);
				
				
				
				
				IF LENGTH(@strVar) > 0 THEN
										
					SET JSON2=CONCAT(JSON2,',\"children\":', @strVar );
									
				END IF  ;
				SET JSON2=CONCAT(JSON2,'},'); 
				SET ClassCount=ClassCount+1;
		
		END LOOP loop2;
		
		IF ClassCount = 0 THEN
			SET JSON2=LEFT(JSON2,LENGTH(JSON2)-LENGTH('"children": ]'));
			SET JSON2=LEFT(JSON2,LENGTH(JSON2)-1);
		ELSE
		SET JSON2=LEFT(JSON2,LENGTH(JSON2)-1);
		SET JSON2=CONCAT(JSON2,']'); 
		
		END IF;		
				
	CLOSE ClassesCursor;
			
	
		
		
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TreeViewClass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TreeViewClass`(IN Class_Id INT,IN spMode int,IN param INT,out JSON3 LONGTEXT)
BEGIN
    
	DECLARE DivId INT;
	DECLARE DivClassId INT;
	DECLARE DivName VARCHAR(100);
	
	DECLARE done INT;	
	DECLARE DivCount INT; 	
	DECLARE strVar VARCHAR(1000);
    
	DECLARE DivCursor CURSOR FOR SELECT * FROM `division` WHERE `classid` = Class_Id;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
	
	SET done = 0;
	SET JSON3="[";
		
      
	OPEN DivCursor;
	
	SET DivCount=0;
        
		loop3: LOOP
        
        
			FETCH DivCursor INTO DivId,DivClassId,DivName;
        
				IF done = 1 THEN 				
					LEAVE loop3; 
				END IF;
				
				SET JSON3=CONCAT(JSON3,'{\"label\":\"',DivName,'\", \"value\":',DivId,',\"type\":\"Division\"');
				
                IF spMode <> 2 THEN
                
					CALL TreeViewDivSubject(DivId,spMode,param,@strVar);
                    
					IF (LENGTH(@strVar) > 0 AND spMode <> 2) THEN
											
						SET JSON3=CONCAT(JSON3,',\"children\":', @strVar );
										
					END IF  ;
                    
                END IF ;
				SET JSON3=CONCAT(JSON3,'},'); 
				SET DivCount=DivCount+1;
		
		END LOOP loop3;
		
		IF DivCount = 0 THEN
			SET JSON3=LEFT(JSON3,LENGTH(JSON3)-LENGTH('"children": ]'));
			SET JSON3=LEFT(JSON3,LENGTH(JSON3)-1);
		ELSE
		SET JSON3=LEFT(JSON3,LENGTH(JSON3)-1);
		SET JSON3=CONCAT(JSON3,']'); 
		
		END IF;		
				
	CLOSE DivCursor;
			
	
		
		
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TreeViewDivSubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TreeViewDivSubject`(IN Divisions_Id INT,IN spMode int,IN param INT,out JSON4 LONGTEXT )
BEGIN
    
	DECLARE DivSubId INT;
	DECLARE SubId INT;
	DECLARE SubName VARCHAR(100);
	
	DECLARE done INT;	
	DECLARE SubCount INT; 
	DECLARE strVar VARCHAR(1000);	
    
	DECLARE SubDivCursor CURSOR FOR SELECT sd.`id`, s.`id`,s.`name` FROM `subject_div_composit` sd, `division` d,`subject` s WHERE d.`id`=sd.`Div_id` AND sd.`subject_id`=s.`id` AND `Div_id`=Divisions_Id;
    
	DECLARE SubDivCursorForSubNotInExam CURSOR  FOR  select distinct(sd.id) as subdiv, s.id as subjectId,s.name subjectName from subject s ,division d, subject_div_composit sd left join  exam_subject_student_composit_table essct on  essct.subject_div_id=sd.id where  s.id=sd.subject_id and sd.Div_id=d.id and d.id=Divisions_Id and  sd.id not in (select distinct(essct.subject_div_id) from exam_subject_student_composit_table essct where essct.exam_id=param);

	
    DECLARE SubDivCursorForExamSub CURSOR  FOR select distinct(sd.id) as subdiv, s.id as subjectId,s.name subjectName from subject s ,division d, subject_div_composit sd left join  exam_subject_student_composit_table essct on  essct.subject_div_id=sd.id where  s.id=sd.subject_id and sd.Div_id=d.id and d.id=Divisions_Id and  sd.id  in (select distinct(essct.subject_div_id) from exam_subject_student_composit_table essct where essct.exam_id=param);

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
	
	
	SET done = 0;
	SET JSON4="[";
		
      
	OPEN SubDivCursor;
    
    OPEN SubDivCursorForSubNotInExam;
    
	OPEN SubDivCursorForExamSub;
    
	SET SubCount=0;
    
    
        
		loop4: LOOP
        
        if spMode =1 then
			FETCH SubDivCursor INTO DivSubId,SubId,SubName;
		end if;
        
         if spMode =3 then
			FETCH SubDivCursorForSubNotInExam INTO DivSubId,SubId,SubName;
		end if;
        
        if spMode =4 then
			FETCH SubDivCursorForExamSub INTO DivSubId,SubId,SubName;
		end if;
        
				IF done = 1 THEN 				
					LEAVE loop4; 
				END IF;
				
				SET JSON4=CONCAT(JSON4,'{\"label\":\"',SubName,'\", \"value\":',DivSubId,',\"type\":\"Subject\",\"SubjectId\":',SubId);
				
								
				
				SET JSON4=CONCAT(JSON4,'},'); 
				SET SubCount=SubCount+1;
		
		END LOOP loop4;
		
		IF SubCount = 0 THEN
			SET JSON4=LEFT(JSON4,LENGTH(JSON4)-LENGTH('"children": ]'));
			SET JSON4=LEFT(JSON4,LENGTH(JSON4)-1);
		ELSE
		SET JSON4=LEFT(JSON4,LENGTH(JSON4)-1);
		SET JSON4=CONCAT(JSON4,']'); 
		
		END IF;		
				
	CLOSE SubDivCursor;
			
	
		
		
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `TreeViewInstitute` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `TreeViewInstitute`(IN Insts_Id INT, IN spMode int, IN param INT, out JSON LONGTEXT)
BEGIN
    
    /*
    
1.   1st parameter in the stored procedure is the InstituteId
2.		2nd parameter is the mode. * refer modes section		
3.		3rd parameter is the additional info needed for mode. *refere modes section
4.		4th parameter is the output string


stored Procedure Menue
Mode		Discription
1.				Tree Structure till all subjects of institute
2.				Tree Structure till Divisions of Institute
3.				Tree stucture with subjects not in Exam (pass the param as exam Id)
4.				Tree Structure with Subjects of Exam (pass the param as exam Id)

*/
    
	declare BranchId INT;
	DECLARE BranchIstituteId INT;
	declare BranchName varchar(100);
	
	DECLARE strVar VARCHAR(1000);
	DECLARE intVar VARCHAR(100);
	DECLARE done INT;
	
	DECLARE BranchCount INT;
  
	
    
	declare InstituteCursor cursor for select * from `branch` WHERE `instituteid`=Insts_Id;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
	
	set done = 0;
	SET JSON="[";
	
	SELECT id,NAME into @intVar, @strVar FROM institute WHERE `id`=Insts_Id;
	
	SET JSON=CONCAT(JSON,'{\"label\":\"',@strVar,'\", \"value\":',@intVar,',\"type\":\"Institute\",\"children\": ['); 
	
      
	open InstituteCursor;
	
	set BranchCount=0;
        
		loop1: loop
        
        
			fetch InstituteCursor into BranchId,BranchIstituteId,BranchName;
        
				if done = 1 then 				
					leave loop1; 
				end if;
				
				SET JSON=CONCAT(JSON,'{\"label\":\"',BranchName,'\", \"value\":',BranchId,',\"type\":\"Branch\"');
				
				CALL TreeViewBranch(BranchId,spMode,param,@strVar);
					
				
				if LENGTH(@strVar) > 0 then
										
					SET JSON=CONCAT(JSON,',\"children\":', @strVar );
									
				end if  ;
				
				SET JSON=CONCAT(JSON,'},'); 
				SET BranchCount=BranchCount+1;
		
		end loop loop1;
		
		
		if BranchCount = 0 Then
			SET JSON=LEFT(JSON,LENGTH(JSON)-length(',"children": ]'));
			
		else
		SET JSON=LEFT(JSON,LENGTH(JSON)-1);
		SET JSON=CONCAT(JSON,']'); 
		
		END IF;
		
		
		
	close InstituteCursor;
	
	
	SET JSON=CONCAT(JSON,'}'); 
	
	SET JSON=CONCAT(JSON,']'); 
	
	select "finally",length(JSON), JSON from dual;
		
		
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-21 20:59:04
