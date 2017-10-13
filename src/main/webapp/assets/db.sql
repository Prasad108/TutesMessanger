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
  KEY `FKnxfgigw3bfa77sdopkoiybuy6` (`instituteid`),
  CONSTRAINT `FKnxfgigw3bfa77sdopkoiybuy6` FOREIGN KEY (`instituteid`) REFERENCES `institute` (`id`),
  CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`instituteid`) REFERENCES `institute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `branch` */

insert  into `branch`(`id`,`instituteid`,`Name`) values (15,50,'Pune');

/*Table structure for table `classes` */

DROP TABLE IF EXISTS `classes`;

CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branchid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8txt3facl8ithk4d24werxdj0` (`branchid`),
  CONSTRAINT `FK8txt3facl8ithk4d24werxdj0` FOREIGN KEY (`branchid`) REFERENCES `branch` (`id`),
  CONSTRAINT `branch constraint` FOREIGN KEY (`branchid`) REFERENCES `branch` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `classes` */

insert  into `classes`(`id`,`branchid`,`name`) values (18,15,'10th '),(19,15,'11th');

/*Table structure for table `division` */

DROP TABLE IF EXISTS `division`;

CREATE TABLE `division` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classid` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK25iyw80l6c7ieoxnxa0c07f4g` (`classid`),
  CONSTRAINT `FK25iyw80l6c7ieoxnxa0c07f4g` FOREIGN KEY (`classid`) REFERENCES `classes` (`id`),
  CONSTRAINT `class constraint` FOREIGN KEY (`classid`) REFERENCES `classes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `division` */

insert  into `division`(`id`,`classid`,`name`) values (19,18,'A'),(20,18,'B'),(21,18,'C'),(22,19,'PCM'),(23,19,'PCB');

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
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `UKpjpnqsflkw13n8c1rldhqtqeo` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

/*Data for the table `institute` */

insert  into `institute`(`id`,`name`,`Address`,`contactno`,`email`,`Subscription_till`,`Subscrition_enable`,`enable`) values (50,'Vidya','Pune','7894561230','vidya@vidya.com','2017-08-01',1,NULL),(61,'Chaitanhya Acedami','pune','7385620399','ratan@gmail.com','2018-01-01',1,NULL);

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
  UNIQUE KEY `UK3svxcq6q51yfdg253l6x3dget` (`username`),
  KEY `FKrn8y9fe820jtkri7daw25wa5e` (`role`),
  CONSTRAINT `FKrn8y9fe820jtkri7daw25wa5e` FOREIGN KEY (`role`) REFERENCES `role` (`id`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `login` */

insert  into `login`(`id`,`username`,`password`,`role`,`enable_Master`,`enable_Institute`) values (16,'Admin','Admin',4,1,1),(30,'vidya@vidya.com','7894561230',3,1,1),(34,'ratan@gmail.com','7385620399',3,1,1),(38,'teacher','teacher',2,1,1),(39,'user','user',58,1,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`authorise_student`,`authorise_teacher`,`fill_attendance`,`fill_schedule`,`mail_parent`,`mail_student`,`mail_teacher`,`msg_parent`,`msg_student`,`msg_teacher`,`set_exam`,`update_results`,`alter_institute_structure`) values (13,0,1,1,1,1,1,1,1,1,1,1,1,1),(15,1,1,1,1,1,1,1,1,1,1,1,1,1);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`name`) values (1,'ROLE_STUDENT'),(2,'ROLE_TEACHER'),(3,'ROLE_INSTITUTE_ADMIN'),(4,'ROLE_APP_ADMIN'),(52,'cleaner'),(54,'Security'),(55,'Manager'),(57,'tester'),(58,'ROLE_ADMIN');

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `division` int(11) DEFAULT NULL,
  `string` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `division` (`division`),
  UNIQUE KEY `UKdwsnwm45935druiyn7l2rb9qx` (`division`),
  CONSTRAINT `FKsn3hd79992f4c761tx84ms4v7` FOREIGN KEY (`division`) REFERENCES `division` (`id`),
  CONSTRAINT `division foreign kry` FOREIGN KEY (`division`) REFERENCES `division` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `schedule` */

insert  into `schedule`(`id`,`division`,`string`) values (1,22,'<iframe src=\'https://calendar.google.com/calendar/embed?mode=WEEK&amp;height=600&amp;wkst=1&amp;bgcolor=%23FFFFFF&amp;src=ci5fi0t0u5i8927il2ula0kbgs%40group.calendar.google.com&amp;color=%2329527A&amp;ctz=Asia%2FCalcutta\' style=\"border:solid 1px #777\" width=\"800\" height=\"600\" frameborder=\"0\" scrolling=\"no\"></iframe>');

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
  KEY `FKddkv9iq8sx7tndj2dnn9k88ux` (`instid`),
  KEY `FKkst5i99hukf1o65ca5tyf8jcl` (`loginid`),
  KEY `FKiuk6flu7v3kxbkl6mx1x741fb` (`parentid`),
  CONSTRAINT `FKddkv9iq8sx7tndj2dnn9k88ux` FOREIGN KEY (`instid`) REFERENCES `institute` (`id`),
  CONSTRAINT `FKiuk6flu7v3kxbkl6mx1x741fb` FOREIGN KEY (`parentid`) REFERENCES `parent` (`id`),
  CONSTRAINT `FKkst5i99hukf1o65ca5tyf8jcl` FOREIGN KEY (`loginid`) REFERENCES `login` (`id`),
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
  KEY `FK5oud04u4jqqk94fw43yq24aia` (`instid`),
  KEY `FK5nx0877rbto8ekmbaqej7c1e6` (`loginid`),
  CONSTRAINT `FK5nx0877rbto8ekmbaqej7c1e6` FOREIGN KEY (`loginid`) REFERENCES `login` (`id`),
  CONSTRAINT `FK5oud04u4jqqk94fw43yq24aia` FOREIGN KEY (`instid`) REFERENCES `institute` (`id`),
  CONSTRAINT `FKAA31CBE24AD2CFF8` FOREIGN KEY (`permissions`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKpfiaka1s2wcphdf19527xcrjx` FOREIGN KEY (`permissions`) REFERENCES `permissions` (`id`),
  CONSTRAINT `instid` FOREIGN KEY (`instid`) REFERENCES `institute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loginid` FOREIGN KEY (`loginid`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`fname`,`lname`,`instid`,`email`,`contactno`,`loginid`,`permissions`) values (25,'Arpit','Sharma',50,'vidya@vidya.com','7894561230',30,13),(29,'Ratan ','Jadhav',61,'ratan@gmail.com','7385620399',34,15);

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
