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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `branch` */

insert  into `branch`(`id`,`instituteid`,`Name`) values (15,50,'Pune'),(16,50,'Mumbai'),(17,61,'Nagpur');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `classes` */

insert  into `classes`(`id`,`branchid`,`name`) values (18,15,'10th '),(19,15,'11th'),(20,17,'12th');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `division` */

insert  into `division`(`id`,`classid`,`name`) values (19,18,'A'),(20,18,'B'),(21,18,'C'),(22,19,'PCM'),(23,19,'PCB'),(24,20,'PCMB');

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

/*Data for the table `exam` */

insert  into `exam`(`id`,`discription`,`out_of`,`passing_marks`,`regular`,`exam_type_id`,`exam_mode_id`,`insitute_id`) values (38,'Unit Test 2017',100,40,1,1,3,50),(119,'Final 2018',200,50,0,2,2,50),(120,'Final 2017',200,80,0,3,2,50);

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
  `exam_id` int(11) DEFAULT NULL,
  `date-time` date DEFAULT NULL,
  `duration_in_minutes` int(11) DEFAULT NULL,
  `subject_div_id` int(11) DEFAULT NULL,
  `out_of_marks` int(11) DEFAULT NULL,
  `passing_marks` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `composite_unique_key` (`student_id`,`exam_id`),
  UNIQUE KEY `UKjtcq62ds98kwh3bbd8gg8jnxi` (`student_id`,`exam_id`),
  UNIQUE KEY `UK3qrcyk8csw9oujgr0vb3vcg7a` (`student_id`,`exam_id`),
  KEY `FKiwdhevlshbvf82oc98yblqccu` (`exam_id`),
  KEY `FK4i0i0cq4pj64f82hcn7se3nts` (`subject_div_id`),
  CONSTRAINT `FK4i0i0cq4pj64f82hcn7se3nts` FOREIGN KEY (`subject_div_id`) REFERENCES `subject_div_composit` (`id`),
  CONSTRAINT `FK56xga9as5cccvpw6rqjtbg2qc` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `FKiwdhevlshbvf82oc98yblqccu` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  CONSTRAINT `exam foreign key exam_subject_student_composit_table` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  CONSTRAINT `student foreign key exam_subject_student_composit_table` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  CONSTRAINT `subject_div_id foreign key` FOREIGN KEY (`subject_div_id`) REFERENCES `subject_div_composit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `exam_subject_student_composit_table` */

insert  into `exam_subject_student_composit_table`(`id`,`student_id`,`exam_id`,`date-time`,`duration_in_minutes`,`subject_div_id`,`out_of_marks`,`passing_marks`) values (1,NULL,38,'2018-01-10',30,6,50,20);

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
  KEY `FK3uaviomsxbnhtv592qo1vsl59` (`role_id`),
  CONSTRAINT `FK3uaviomsxbnhtv592qo1vsl59` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
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
  KEY `FK6x12uwgitmtjgm503wyiofkxf` (`exam_subject_student_id`),
  CONSTRAINT `FK6x12uwgitmtjgm503wyiofkxf` FOREIGN KEY (`exam_subject_student_id`) REFERENCES `exam_subject_student_composit_table` (`id`),
  CONSTRAINT `exam_subject_student foreign key` FOREIGN KEY (`exam_subject_student_id`) REFERENCES `exam_subject_student_composit_table` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `result` */

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`id`,`name`) values (1,'ROLE_STUDENT'),(2,'ROLE_TEACHER'),(3,'ROLE_INSTITUTE_ADMIN'),(4,'ROLE_APP_ADMIN'),(5,'ROLE_PARENT'),(6,'ROLE_TEMPLATE'),(57,'tester 123');

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

/*Data for the table `student` */

insert  into `student`(`id`,`loginid`,`fName`,`father`,`lName`,`parentid`,`contactno`,`email`,`instid`,`divid`) values (20,103,'sdfas','dfsdf','asdf',29,'9856321470','sadf@sadfas.co',50,23),(21,104,'Prasad','Ashok','dukale',30,'9385620399','pdukale9@gmail.com',50,23),(23,111,'chintu ','Pintu','Zintu',32,'9658743210','abcd@gmail.com',50,23),(24,112,'Dipak ','Vishnu','Sutar',33,'9657841230','dipak@gmail.com',50,20),(25,113,'Nayan','Bajirao','Patil',34,'7845456932','nayan@gmail.com',50,23),(26,114,'Arpit','Mahadev','sharma',35,'9658742310','arpit@gmail.com',50,23),(27,115,'abcva','sdfasf','fasdfasdf',36,'9587461230','sdfasdf@dfas.com',50,23),(28,116,'vsxvsd','sdgfsadf','gfsda',37,'9857461233','ssdf@asdfas.com',50,23),(29,117,'sdfdsfsd','SFsdfsd','fsdsd',38,'9658741230','sdfsdsd@sdfsd.com',50,23),(30,118,'fsdaf','sfasd','fasdf',39,'8974561230','fasdf@asdfasd.co',50,23),(31,119,'sfsdf','sdfasd','sdf',40,'9658741230','sfsadfasd@asdf.co',50,23),(32,120,'sdfasdf','sdfasd','fsdafasdf',41,'9658741230','sdfasdf@sdfsd.co',50,23),(33,121,'Rahul','Prabhakar','Sadaphal',42,'9658741230','rahul@gmail.com',50,NULL),(34,122,'Govind','Gopal','Agrawal',43,'8974563210','govind@gmail.com',50,NULL),(35,123,'Satish','Atish','Gujrathi',44,'9857461310','satish@gmail.com',50,NULL),(36,124,'kiran','Piraji','Sawale',45,'8974561230','kiran@gmail.com',50,NULL);

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `discription` varchar(500) DEFAULT NULL,
  `institute_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK31tn17ut80e8s1jkyxdyfhp9x` (`institute_id`),
  CONSTRAINT `FK31tn17ut80e8s1jkyxdyfhp9x` FOREIGN KEY (`institute_id`) REFERENCES `institute` (`id`),
  CONSTRAINT `institute_id_foreign_key` FOREIGN KEY (`institute_id`) REFERENCES `institute` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `subject` */

insert  into `subject`(`id`,`name`,`discription`,`institute_id`) values (1,'English','10th English sub',50),(2,'Marathi','10th Marathi',50),(3,'Biology','11th Biology',50),(4,'Chemistry','11th Chemistry',50),(5,'Maths','11th Maths',50),(6,'Maths','12th Maths',50);

/*Table structure for table `subject_div_composit` */

DROP TABLE IF EXISTS `subject_div_composit`;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `subject_div_composit` */

insert  into `subject_div_composit`(`id`,`Div_id`,`subject_id`) values (6,19,1),(7,19,2),(4,19,3),(5,19,4),(1,22,1),(2,22,2),(3,23,1),(8,23,3),(9,23,4);

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

/* Procedure structure for procedure `TreeViewBranch` */

/*!50003 DROP PROCEDURE IF EXISTS  `TreeViewBranch` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `TreeViewBranch`(IN Branch_Id INT,out JSON2 LONGTEXT)
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
				
				CALL TreeViewClass(ClassId,@strVar);
				
				
				
				
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
			
	
		
		
    END */$$
DELIMITER ;

/* Procedure structure for procedure `TreeViewClass` */

/*!50003 DROP PROCEDURE IF EXISTS  `TreeViewClass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `TreeViewClass`(IN Class_Id INT,OUT JSON3 LONGTEXT)
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
				
				CALL TreeViewDivSubject(DivId,@strVar);
				
				
				
				
				IF LENGTH(@strVar) > 0 THEN
										
					SET JSON3=CONCAT(JSON3,',\"children\":', @strVar );
									
				END IF  ;
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
			
	
		
		
    END */$$
DELIMITER ;

/* Procedure structure for procedure `TreeViewDivSubject` */

/*!50003 DROP PROCEDURE IF EXISTS  `TreeViewDivSubject` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `TreeViewDivSubject`(IN Divisions_Id INT,OUT JSON4 LONGTEXT )
BEGIN
    
	DECLARE DivSubId INT;
	DECLARE SubId INT;
	DECLARE SubName VARCHAR(100);
	
	DECLARE done INT;	
	DECLARE SubCount INT; 
	DECLARE strVar VARCHAR(1000);	
    
	DECLARE SubDivCursor CURSOR FOR SELECT sd.`id`, s.`id`,s.`name` FROM `subject_div_composit` sd, `division` d,`subject` s WHERE d.`id`=sd.`Div_id` AND sd.`subject_id`=s.`id` AND `Div_id`=Divisions_Id;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;
	
	
	SET done = 0;
	SET JSON4="[";
		
      
	OPEN SubDivCursor;
	
	SET SubCount=0;
        
		loop4: LOOP
        
        
			FETCH SubDivCursor INTO DivSubId,SubId,SubName;
        
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
			
	
		
		
    END */$$
DELIMITER ;

/* Procedure structure for procedure `TreeViewInstitute` */

/*!50003 DROP PROCEDURE IF EXISTS  `TreeViewInstitute` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `TreeViewInstitute`(IN Insts_Id INT,out JSON LONGTEXT)
BEGIN
    
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
				
				CALL TreeViewBranch(BranchId,@strVar);
					
				
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
		
		
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
