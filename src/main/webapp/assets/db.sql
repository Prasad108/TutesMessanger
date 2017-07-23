/*
SQLyog Community v10.51 
MySQL - 5.5.11 : Database - tutesmessanger
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tutesmessanger` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tutesmessanger`;

/*Table structure for table `institute` */

DROP TABLE IF EXISTS `institute`;

CREATE TABLE `institute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `institute` */

LOCK TABLES `institute` WRITE;

insert  into `institute`(`id`,`name`) values (2,'Atos'),(5,'Firefox'),(4,'Google'),(3,'RedRose'),(14,'remove institue'),(1,'Sinhgad');

UNLOCK TABLES;

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `role` (`role`),
  CONSTRAINT `login_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `login` */

LOCK TABLES `login` WRITE;

insert  into `login`(`id`,`username`,`password`,`role`) values (2,'Anil','Nalawade',NULL),(15,'Prasad','Dukale',2),(16,'Admin','Admin',4),(17,'Template','Template',5),(19,'h','h',2);

UNLOCK TABLES;

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

LOCK TABLES `parent` WRITE;

UNLOCK TABLES;

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_student` tinyint(1) NOT NULL DEFAULT '0',
  `msg_student` tinyint(1) NOT NULL DEFAULT '0',
  `mail_parent` tinyint(1) NOT NULL DEFAULT '0',
  `fill_schedule` tinyint(1) NOT NULL DEFAULT '0',
  `set_exam` tinyint(1) NOT NULL DEFAULT '0',
  `update_results` tinyint(1) NOT NULL DEFAULT '0',
  `authorise_student` tinyint(1) NOT NULL DEFAULT '0',
  `authorise_teacher` tinyint(1) NOT NULL DEFAULT '0',
  `msg_teacher` tinyint(1) NOT NULL DEFAULT '0',
  `fill_attendance` tinyint(1) NOT NULL DEFAULT '0',
  `msg_parent` tinyint(1) NOT NULL DEFAULT '0',
  `mail_teacher` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `permissions` */

LOCK TABLES `permissions` WRITE;

insert  into `permissions`(`id`,`mail_student`,`msg_student`,`mail_parent`,`fill_schedule`,`set_exam`,`update_results`,`authorise_student`,`authorise_teacher`,`msg_teacher`,`fill_attendance`,`msg_parent`,`mail_teacher`) values (1,1,1,1,1,1,1,1,1,1,1,1,1);

UNLOCK TABLES;

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

LOCK TABLES `role` WRITE;

insert  into `role`(`id`,`name`) values (1,'student'),(2,'teacher'),(3,'institute admin'),(4,'app master'),(5,'template');

UNLOCK TABLES;

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

LOCK TABLES `student` WRITE;

insert  into `student`(`id`,`loginid`,`fName`,`lName`,`parentid`,`contactno`,`email`,`father`,`instid`) values (1,NULL,'Prasad','dukale',NULL,NULL,NULL,'',NULL);

UNLOCK TABLES;

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
  KEY `loginid` (`loginid`),
  KEY `instid` (`instid`),
  KEY `permisions` (`permissions`),
  CONSTRAINT `permisions` FOREIGN KEY (`permissions`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `instid` FOREIGN KEY (`instid`) REFERENCES `institute` (`id`) ON DELETE CASCADE,
  CONSTRAINT `loginid` FOREIGN KEY (`loginid`) REFERENCES `login` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

LOCK TABLES `teacher` WRITE;

insert  into `teacher`(`id`,`fname`,`lname`,`instid`,`email`,`contactno`,`loginid`,`permissions`) values (5,'Prasad','Dukale',1,'pdukale9@gmail.com','9657939975',15,NULL),(9,'nm','nb',14,'h','h',19,NULL);

UNLOCK TABLES;

/* Trigger structure for table `teacher` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `delete_login` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `delete_login` AFTER DELETE ON `teacher` FOR EACH ROW BEGIN
		DELETE FROM login WHERE login.id = old.loginid;
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
