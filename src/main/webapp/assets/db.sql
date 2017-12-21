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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `branch` */

insert  into `branch`(`id`,`instituteid`,`Name`) values (15,50,'Pune'),(16,50,'Mumbai');

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

/*Table structure for table `exam` */

DROP TABLE IF EXISTS `exam`;

CREATE TABLE `exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discription` varchar(500) DEFAULT NULL,
  `out_of` int(11) DEFAULT NULL,
  `passing_marks` int(11) DEFAULT NULL,
  `regular` tinyint(4) DEFAULT NULL,
  `exam_type_id` int(11) DEFAULT NULL,
  `exam_mode_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_mode foreign key` (`exam_mode_id`),
  KEY `exam_type foreign key` (`exam_type_id`),
  CONSTRAINT `exam_mode foreign key` FOREIGN KEY (`exam_mode_id`) REFERENCES `exam_mode` (`id`),
  CONSTRAINT `exam_type foreign key` FOREIGN KEY (`exam_type_id`) REFERENCES `exam_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `exam` */

insert  into `exam`(`id`,`discription`,`out_of`,`passing_marks`,`regular`,`exam_type_id`,`exam_mode_id`) values (1,NULL,80,27,1,2,2);

/*Table structure for table `exam_mode` */

DROP TABLE IF EXISTS `exam_mode`;

CREATE TABLE `exam_mode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Mode_name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `exam_mode` */

insert  into `exam_mode`(`id`,`Mode_name`) values (1,'MCQ'),(2,'Theory'),(3,'Practical'),(4,'Oral');

/*Table structure for table `exam_subject_student_composit_table` */

DROP TABLE IF EXISTS `exam_subject_student_composit_table`;

CREATE TABLE `exam_subject_student_composit_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `date-time` date DEFAULT NULL,
  `duration_in_minutes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `composite_unique_key` (`student_id`,`subject_id`,`exam_id`),
  KEY `subject foreign key exam_subject_student_composit_table` (`subject_id`),
  KEY `exam foreign key exam_subject_student_composit_table` (`exam_id`),
  CONSTRAINT `exam foreign key exam_subject_student_composit_table` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  CONSTRAINT `student foreign key exam_subject_student_composit_table` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `subject foreign key exam_subject_student_composit_table` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `exam_subject_student_composit_table` */

insert  into `exam_subject_student_composit_table`(`id`,`student_id`,`subject_id`,`exam_id`,`date-time`,`duration_in_minutes`) values (1,NULL,2,1,'2017-12-21',1),(2,26,2,1,NULL,1);

/*Table structure for table `exam_type` */

DROP TABLE IF EXISTS `exam_type`;

CREATE TABLE `exam_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Type_name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `exam_type` */

insert  into `exam_type`(`id`,`Type_name`) values (1,'Unit Test'),(2,'semister end'),(3,'Annual');

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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

/*Data for the table `institute` */

insert  into `institute`(`id`,`name`,`Address`,`contactno`,`email`,`Subscription_till`,`Subscrition_enable`,`enable`) values (50,'Vidya','Pune','7894561230','vidya@vidya.com','2017-08-01',1,NULL),(61,'Chaitanhya Acedami','pune','7385620399','ratan@gmail.com','2018-01-01',1,NULL),(62,'Chate','pune','7879456321','asdf@sdf.com','2017-10-31',1,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

/*Data for the table `login` */

insert  into `login`(`id`,`username`,`password`,`role`,`enable_Master`,`enable_Institute`) values (16,'Admin','Admin',4,1,1),(30,'vidya@vidya.com','7894561230',3,1,1),(34,'ratan@gmail.com','7385620399',3,1,1),(38,'teacher','teacher',2,1,1),(48,'pdukalesdf@sfsd.cd','7539514682',2,1,1),(90,'asdfasdf@asdf.co','9875641230',2,1,1),(103,'sadf@sadfas.co','9856321470',1,1,1),(104,'pdukale9@gmail.com','9385620399',1,1,1),(106,'asdfas@asdfas.com','9857456129',2,1,1),(107,'asdfsdf@asdfa.com','9632587404',2,1,1),(108,'abhi@gmail.com','9874563215',2,1,1),(109,'reupesh@gmail.com','9658746321',2,1,0),(110,'anup@gmail.com','8520147963',2,1,0),(111,'abcd@gmail.com','9658743210',1,1,1),(112,'dipak@gmail.com','9657841230',1,1,1),(113,'nayan@gmail.com','7845456932',1,1,1),(114,'arpit@gmail.com','9658742310',1,1,1),(115,'sdfasdf@dfas.com','9587461230',1,1,1),(116,'ssdf@asdfas.com','9857461233',1,1,1),(117,'sdfsdsd@sdfsd.com','9658741230',1,1,1),(118,'fasdf@asdfasd.co','8974561230',1,1,1),(119,'sfsadfasd@asdf.co','9658741230',1,1,1),(120,'sdfasdf@sdfsd.co','9658741230',1,1,1),(121,'rahul@gmail.com','9658741230',1,1,0),(122,'govind@gmail.com','8974563210',1,1,0),(123,'satish@gmail.com','9857461310',1,1,0),(124,'kiran@gmail.com','8974561230',1,1,0);

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `text` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Role foreign key` (`role_id`),
  CONSTRAINT `Role foreign key` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message` */

/*Table structure for table `parent` */

DROP TABLE IF EXISTS `parent`;

CREATE TABLE `parent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `contactno` varchar(12) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `parent` */

insert  into `parent`(`id`,`fname`,`lname`,`contactno`,`email`) values (29,'dfsdf','asdf','9856321470','sadf@sadfas.co'),(30,'Ashok','dukale','9385620399','pdukale9@gmail.com'),(32,'Pintu','Zintu','9658743210','abcd@gmail.com'),(33,'Vishnu','Sutar','9657841230','dipak@gmail.com'),(34,'Bajirao','Patil','7845456938','nayan@gmail.com'),(35,'Mahadev','sharma','9658742310','arpit@gmail.com'),(36,'sdfasf','fasdfasdf','9587461230','sdfasdf@dfas.com'),(37,'sdgfsadf','gfsda','9857461233','ssdf@asdfas.com'),(38,'SFsdfsd','fsdsd','9658741230','sdfsdsd@sdfsd.com'),(39,'sfasd','fasdf','8974561230','fasdf@asdfasd.co'),(40,'sdfasd','sdf','9658741230','sfsadfasd@asdf.co'),(41,'sdfasd','fsdafasdf','9658741230','sdfasdf@sdfsd.co'),(42,'Prabhakar','Sadaphal','9658741230','rahul@gmail.com'),(43,'Gopal','Agrawal','8974563210','govind@gmail.com'),(44,'Atish','Gujrathi','9857461310','satish@gmail.com'),(45,'Piraji','Sawale','8974561230','kiran@gmail.com');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`authorise_student`,`authorise_teacher`,`fill_attendance`,`fill_schedule`,`mail_parent`,`mail_student`,`mail_teacher`,`msg_parent`,`msg_student`,`msg_teacher`,`set_exam`,`update_results`,`alter_institute_structure`) values (13,1,1,1,1,1,1,1,1,1,1,1,1,1),(15,1,1,1,1,1,1,1,1,1,1,1,1,1),(16,1,1,1,1,1,1,1,1,1,1,1,1,1),(17,1,1,1,1,1,1,1,1,1,1,1,1,1),(18,1,0,0,0,0,0,0,0,0,0,0,0,0),(19,0,0,0,0,0,0,1,0,0,1,1,1,1),(20,1,0,0,0,0,1,1,0,0,1,0,0,1),(21,1,0,1,1,1,1,1,1,1,1,1,1,1);

/*Table structure for table `persistent_logins` */

DROP TABLE IF EXISTS `persistent_logins`;

CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `persistent_logins` */

/*Table structure for table `result` */

DROP TABLE IF EXISTS `result`;

CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `obtained_marks` int(11) DEFAULT NULL,
  `remarks` varchar(300) DEFAULT NULL,
  `exam_subject_student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_subject_student foreign key` (`exam_subject_student_id`),
  CONSTRAINT `exam_subject_student foreign key` FOREIGN KEY (`exam_subject_student_id`) REFERENCES `exam_subject_student_composit_table` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `result` */

insert  into `result`(`id`,`obtained_marks`,`remarks`,`exam_subject_student_id`) values (1,60,'pass',2),(2,NULL,NULL,NULL);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`name`) values (1,'ROLE_STUDENT'),(2,'ROLE_TEACHER'),(3,'ROLE_INSTITUTE_ADMIN'),(4,'ROLE_APP_ADMIN'),(5,'ROLE_PARENT'),(52,'cleaner'),(54,'Security'),(55,'Manager'),(57,'tester');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `schedule` */

insert  into `schedule`(`id`,`division`,`string`) values (1,22,'<iframe src=\'https://calendar.google.com/calendar/embed?showPrint=0&amp;showCalendars=0&amp;showTz=0&amp;height=600&amp;wkst=2&amp;bgcolor=%236666cc&amp;src=ci5fi0t0u5i8927il2ula0kbgs%40group.calendar.google.com&amp;color=%2329527A&amp;ctz=Asia%2FCalcutta\' style=\"border:solid 1px #777\" width=\"800\" height=\"600\" frameborder=\"0\" scrolling=\"no\"></iframe>'),(2,19,'<iframe src=\'https://calendar.google.com/calendar/embed?mode=WEEK&amp;height=600&amp;wkst=2&amp;bgcolor=%23FFFFFF&amp;src=ci5fi0t0u5i8927il2ula0kbgs%40group.calendar.google.com&amp;color=%2329527A&amp;ctz=Asia%2FCalcutta\' style=\"border:solid 1px #777\" width=\"800\" height=\"600\" frameborder=\"0\" scrolling=\"no\"></iframe>'),(3,20,'<iframe src=\'https://calendar.google.com/calendar/embed?showPrint=0&amp;showCalendars=0&amp;showTz=0&amp;mode=AGENDA&amp;height=600&amp;wkst=2&amp;bgcolor=%23ff99ff&amp;src=ci5fi0t0u5i8927il2ula0kbgs%40group.calendar.google.com&amp;color=%2329527A&amp;ctz=Asia%2FCalcutta\' style=\"border:solid 1px #777\" width=\"800\" height=\"600\" frameborder=\"0\" scrolling=\"no\"></iframe>');

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

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
  KEY `div_id_difk` (`divid`),
  CONSTRAINT `FKddkv9iq8sx7tndj2dnn9k88ux` FOREIGN KEY (`instid`) REFERENCES `institute` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKiuk6flu7v3kxbkl6mx1x741fb` FOREIGN KEY (`parentid`) REFERENCES `parent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FKkst5i99hukf1o65ca5tyf8jcl` FOREIGN KEY (`loginid`) REFERENCES `login` (`id`) ON DELETE CASCADE,
  CONSTRAINT `div_id_difk` FOREIGN KEY (`divid`) REFERENCES `division` (`id`),
  CONSTRAINT `parent` FOREIGN KEY (`parentid`) REFERENCES `parent` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`loginid`) REFERENCES `login` (`id`) ON DELETE CASCADE,
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`instid`) REFERENCES `institute` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`loginid`,`fName`,`father`,`lName`,`parentid`,`contactno`,`email`,`instid`,`divid`) values (20,103,'sdfas','dfsdf','asdf',29,'9856321470','sadf@sadfas.co',50,22),(21,104,'Prasad','Ashok','dukale',30,'9385620399','pdukale9@gmail.com',50,23),(23,111,'chintu ','Pintu','Zintu',32,'9658743210','abcd@gmail.com',50,23),(24,112,'Dipak ','Vishnu','Sutar',33,'9657841230','dipak@gmail.com',50,20),(25,113,'Nayan','Bajirao','Patil',34,'7845456932','nayan@gmail.com',50,23),(26,114,'Arpit','Mahadev','sharma',35,'9658742310','arpit@gmail.com',50,23),(27,115,'abcva','sdfasf','fasdfasdf',36,'9587461230','sdfasdf@dfas.com',50,22),(28,116,'vsxvsd','sdgfsadf','gfsda',37,'9857461233','ssdf@asdfas.com',50,22),(29,117,'sdfdsfsd','SFsdfsd','fsdsd',38,'9658741230','sdfsdsd@sdfsd.com',50,22),(30,118,'fsdaf','sfasd','fasdf',39,'8974561230','fasdf@asdfasd.co',50,22),(31,119,'sfsdf','sdfasd','sdf',40,'9658741230','sfsadfasd@asdf.co',50,22),(32,120,'sdfasdf','sdfasd','fsdafasdf',41,'9658741230','sdfasdf@sdfsd.co',50,22),(33,121,'Rahul','Prabhakar','Sadaphal',42,'9658741230','rahul@gmail.com',50,NULL),(34,122,'Govind','Gopal','Agrawal',43,'8974563210','govind@gmail.com',50,NULL),(35,123,'Satish','Atish','Gujrathi',44,'9857461310','satish@gmail.com',50,NULL),(36,124,'kiran','Piraji','Sawale',45,'8974561230','kiran@gmail.com',50,NULL);

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `discription` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `subject` */

insert  into `subject`(`id`,`name`,`discription`) values (1,'English','10th English sub'),(2,'Marathi','10th Marathi');

/*Table structure for table `subject_div_composit` */

DROP TABLE IF EXISTS `subject_div_composit`;

CREATE TABLE `subject_div_composit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Div_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gsc` (`Div_id`,`subject_id`),
  KEY `sub foreign key` (`subject_id`),
  CONSTRAINT `div foreign key` FOREIGN KEY (`Div_id`) REFERENCES `division` (`id`),
  CONSTRAINT `sub foreign key` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `subject_div_composit` */

insert  into `subject_div_composit`(`id`,`Div_id`,`subject_id`) values (1,19,1),(2,19,2),(8,20,1),(9,20,2);

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
  CONSTRAINT `FK5nx0877rbto8ekmbaqej7c1e6` FOREIGN KEY (`loginid`) REFERENCES `login` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK5oud04u4jqqk94fw43yq24aia` FOREIGN KEY (`instid`) REFERENCES `institute` (`id`),
  CONSTRAINT `FKAA31CBE24AD2CFF8` FOREIGN KEY (`permissions`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKpfiaka1s2wcphdf19527xcrjx` FOREIGN KEY (`permissions`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `instid` FOREIGN KEY (`instid`) REFERENCES `institute` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `loginid` FOREIGN KEY (`loginid`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`fname`,`lname`,`instid`,`email`,`contactno`,`loginid`,`permissions`) values (25,'Arpit','Sharma',50,'vidya@vidya.com','7894561230',30,13),(29,'Ratan ','Jadhav',61,'ratan@gmail.com','7385620399',34,15),(55,'sdafasdfsdfas','sdfasdf',50,'asdfasdf@asdf.co','9875641230',90,18),(56,'fasdf','asfasf',50,'asdfas@asdfas.com','9857456129',106,19),(57,'fsdf','asf',50,'asdfsdf@asdfa.com','9632587404',107,20),(58,'Abhishek ','Mishra',50,'abhi@gmail.com','9874563215',108,21),(59,'Rupesh ','Murgunde',50,'reupesh@gmail.com','9658746321',109,NULL),(60,'Anup','Borase',50,'anup@gmail.com','8520147963',110,NULL);

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

/* Trigger structure for table `login` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `deleteParentOnDeleteOfStudent` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `deleteParentOnDeleteOfStudent` BEFORE DELETE ON `login` FOR EACH ROW BEGIN
       
            DELETE parent.* FROM `parent` , student , login ,role WHERE parent.`id`=student.`parentid` AND student.`loginid`=login.`id`AND login.`id`= old.id AND login.`role`=role.`id` AND role.`name`='ROLE_STUDENT';
       
     
    END */$$


DELIMITER ;

/* Trigger structure for table `student` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `InsertStudentSubscriptionPermission` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `InsertStudentSubscriptionPermission` AFTER INSERT ON `student` FOR EACH ROW BEGIN
   UPDATE `tutesmessanger`.`login`, `tutesmessanger`.`student` , `tutesmessanger`.`institute` SET `login`.`enable_Master`=`institute`.`Subscrition_enable`
  WHERE student.`instid`=institute.`id` AND `student`.`loginid`=`login`.`id` AND student.id=new.id;
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
