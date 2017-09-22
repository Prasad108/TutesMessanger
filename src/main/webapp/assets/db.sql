/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.7.18-log : Database - tutesmessanger
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tutesmessanger` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tutesmessanger`;

/*Table structure for table `branch` */

DROP TABLE IF EXISTS `branch`;

CREATE TABLE `branch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instituteid` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instituteid` (`instituteid`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`instituteid`) REFERENCES `institute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `branch` */

insert  into `branch`(`id`,`instituteid`,`Name`) values (1,1,'newBranch'),(2,1,'newBranch2'),(3,1,'newBranch3'),(4,1,'newBranch4'),(5,43,'newBranch'),(6,43,'newBranch2'),(7,43,'newBranch3'),(8,43,'b4'),(9,44,'pune'),(10,44,'Nashik'),(11,44,'Banglur'),(12,44,'Kolhapur'),(13,44,'Mumbai'),(14,50,'Pune');

/*Table structure for table `classes` */

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branchid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `branch constraint` (`branchid`),
  CONSTRAINT `branch constraint` FOREIGN KEY (`branchid`) REFERENCES `branch` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `classes` */

insert  into `classes`(`id`,`branchid`,`name`) values (1,9,'class1'),(2,9,'class2'),(3,10,'10th class'),(4,10,'10th class'),(5,10,'10th class'),(6,10,'12th class'),(7,10,'11th class'),(9,9,'1st std'),(10,9,' 2nd standard'),(11,9,'3rd standard'),(12,11,'new Banglur class'),(13,13,'11th class'),(14,14,'11th class'),(15,14,'12th class'),(16,14,'10th class'),(17,14,'9 th Class');

/*Table structure for table `division` */

DROP TABLE IF EXISTS `division`;

CREATE TABLE `division` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class constraint` (`classid`),
  CONSTRAINT `class constraint` FOREIGN KEY (`classid`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `division` */

insert  into `division`(`id`,`classid`,`name`) values (1,1,'div 123'),(2,11,'abcd'),(3,12,'new banglur class div'),(4,13,'Div A'),(5,12,'New Banglur division'),(6,14,'Division A'),(7,14,'Division B'),(8,15,'Division A (biology)'),(9,15,'Division B(Maths +Marathi + giography)'),(10,15,'Division C (Electronics )'),(11,14,'Division C'),(12,14,'Division D'),(13,14,'Division D'),(14,16,'Division B'),(15,16,'Division D'),(16,16,'Division A'),(17,16,'Division C'),(18,17,'Division A');

/*Table structure for table `institute` */

DROP TABLE IF EXISTS `institute`;

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
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

/*Data for the table `institute` */

insert  into `institute`(`id`,`name`,`Address`,`contactno`,`email`,`Subscription_till`,`Subscrition_enable`,`enable`) values (1,'Sinhgad',NULL,NULL,NULL,NULL,1,NULL),(26,'sdf','gasd','gf','f@d',NULL,NULL,NULL),(43,'a','a','7777777777','a@a.aa',NULL,1,NULL),(44,'b','b','8888888888','b@b.bb',NULL,1,NULL),(47,'v','v','9874561230','dasd@sdfas.in',NULL,1,NULL),(48,'abcd','ifg','8974563210','sdfas@sdaf.com',NULL,1,NULL),(49,'IAM','pune','8605617199','nilnik@gmail.com',NULL,1,NULL),(50,'Vidya','Pune','7894561230','vidya@vidya.com','2017-08-01',1,NULL),(56,'ddadfas','pune','sdfasd','asdfasdf','2017-08-26',1,NULL),(57,'fsdg','gdfgdfsg','dfgdfsg','dfgdfsg','2017-08-01',0,NULL),(58,'dsf','dfg','sd','dfg','2017-08-30',1,NULL),(59,'cvbh','gfh','fgh','sdf','2017-08-08',0,NULL),(60,'Time','abcd','8547961230','asdf@df.co','2017-08-31',1,NULL);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `role` int(11) DEFAULT NULL,
  `enable_Master` tinyint(1) NOT NULL DEFAULT '0',
  `enable_Institute` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `login_ibfk_1` (`role`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `login` */

insert  into `login`(`id`,`username`,`password`,`role`,`enable_Master`,`enable_Institute`) values (15,'Prasad','Dukale',2,0,0),(16,'Admin','Admin',4,1,1),(25,'a@a.aa','7777777777',3,0,0),(26,'b@b.bb','8888888888',3,0,0),(27,'dasd@sdfas.in','9874561230',3,0,0),(28,'sdfas@sdaf.com','8974563210',3,0,0),(29,'nilnik@gmail.com','8605617199',3,0,0),(30,'vidya@vidya.com','7894561230',3,1,1),(31,'jkbhjk','jlhl',3,0,0),(32,'abcd','efg',3,1,0),(33,'asdf@df.co','8547961230',3,1,0);

/*Table structure for table `parent` */

DROP TABLE IF EXISTS `parent`;

CREATE TABLE `parent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `contactno` varchar(12) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `parent` */

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`authorise_student`,`authorise_teacher`,`fill_attendance`,`fill_schedule`,`mail_parent`,`mail_student`,`mail_teacher`,`msg_parent`,`msg_student`,`msg_teacher`,`set_exam`,`update_results`,`alter_institute_structure`) values (1,1,1,1,1,1,1,1,1,1,1,1,1,0),(8,1,1,1,1,1,1,1,1,1,1,1,1,0),(9,1,1,1,1,1,1,1,1,1,1,1,1,0),(10,1,1,1,1,1,1,1,1,1,1,1,1,0),(11,1,1,1,1,1,1,1,1,1,1,1,1,1),(12,1,1,1,1,1,1,1,1,1,1,1,1,1),(13,1,1,1,1,1,1,1,1,1,1,1,1,1),(14,1,1,1,1,1,1,1,1,1,1,1,1,1);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`name`) values (1,'student'),(2,'teacher'),(3,'institute admin'),(4,'app master');

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `division` int(11) DEFAULT NULL,
  `string` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `division` (`division`),
  CONSTRAINT `division foreign kry` FOREIGN KEY (`division`) REFERENCES `division` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `schedule` */

insert  into `schedule`(`id`,`division`,`string`) values (1,8,'<iframe src=\'https://calendar.google.com/calendar/embed?mode=WEEK&amp;height=600&amp;wkst=2&amp;bgcolor=%23FFFFFF&amp;src=ci5fi0t0u5i8927il2ula0kbgs%40group.calendar.google.com&amp;color=%2329527A&amp;ctz=Asia%2FCalcutta\' style=\'border-width:0\' width=\'800\' height=\'600\' frameborder=\'0\' scrolling=\'no\'></iframe>'),(3,6,NULL);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `loginid` int(11) DEFAULT NULL,
  `fName` varchar(255) DEFAULT NULL,
  `lName` varchar(255) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `contactno` varchar(20) DEFAULT NULL,
  `email` varbinary(20) DEFAULT NULL,
  `father` varchar(50) NOT NULL,
  `instid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent` (`parentid`),
  KEY `loginid` (`loginid`),
  KEY `instid` (`instid`),
  CONSTRAINT `parent` FOREIGN KEY (`parentid`) REFERENCES `parent` (`id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`loginid`) REFERENCES `login` (`id`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`instid`) REFERENCES `institute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`loginid`,`fName`,`lName`,`parentid`,`contactno`,`email`,`father`,`instid`) values (1,NULL,'Prasad','dukale',NULL,NULL,NULL,'',NULL);

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

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
  KEY `instid` (`instid`),
  KEY `loginid` (`loginid`),
  CONSTRAINT `FKAA31CBE24AD2CFF8` FOREIGN KEY (`permissions`) REFERENCES `permissions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `instid` FOREIGN KEY (`instid`) REFERENCES `institute` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `loginid` FOREIGN KEY (`loginid`) REFERENCES `login` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`fname`,`lname`,`instid`,`email`,`contactno`,`loginid`,`permissions`) values (5,'Prasad','Dukale',1,'pdukale9@gmail.com','9657939975',15,NULL),(20,'a','a',43,'a@a.aa','7777777777',25,8),(21,'b','b',44,'b@b.bb','8888888888',26,9),(22,'dfg','sdgfsd',47,'dasd@sdfas.in','9874561230',27,10),(23,'fasf','asdfasdf',48,'sdfas@sdaf.com','8974563210',28,11),(24,'Anil','Nalawade',49,'nilnik@gmail.com','8605617199',29,12),(25,'Arpit','Sharma',50,'vidya@vidya.com','7894561230',30,13),(27,'demo','adfa',50,'sdfas','sdfasd',32,13),(28,'sdafsd','sdfasdf',60,'asdf@df.co','8547961230',33,14);

/* Trigger structure for table `institute` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `subscriptiondate_enable` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `subscriptiondate_enable` BEFORE INSERT ON `institute` FOR EACH ROW BEGIN
    
    IF  new.Subscription_till > DATE(NOW()) Then
  
    SET new.Subscrition_enable=true;
   
    END IF;
    END */$$


DELIMITER ;

/* Trigger structure for table `institute` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `Change_Login_Permissions` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `Change_Login_Permissions` AFTER UPDATE ON `institute` FOR EACH ROW BEGIN
    
     
     
    Update `tutesmessanger`.`login`, `tutesmessanger`.`teacher` SET `login`.`enable_Master`=new.`Subscrition_enable` where 
   `teacher`.`instid`=new.id and `tutesmessanger`.`teacher`.`loginid`=`tutesmessanger`.`login`.`id`;
    END */$$


DELIMITER ;

/* Trigger structure for table `teacher` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `InsertTeacherSubscriptionPermission` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `InsertTeacherSubscriptionPermission` AFTER INSERT ON `teacher` FOR EACH ROW BEGIN
   UPDATE `tutesmessanger`.`login`, `tutesmessanger`.`teacher` , `tutesmessanger`.`institute` SET `login`.`enable_Master`=`institute`.`Subscrition_enable`
  WHERE teacher.instid=institute.`id` AND `teacher`.`loginid`=`login`.`id` AND teacher.id=new.id;
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
