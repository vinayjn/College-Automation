/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.12-log : Database - college_cse
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`college_cse` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `college_cse`;

/*Table structure for table `alumini` */

DROP TABLE IF EXISTS `alumini`;

CREATE TABLE `alumini` (
  `enrollment` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `yop` varchar(50) DEFAULT NULL,
  `current_org` varchar(50) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `contactno` varchar(50) DEFAULT NULL,
  `emailid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enrollment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `alumini` */

/*Table structure for table `assignment` */

DROP TABLE IF EXISTS `assignment`;

CREATE TABLE `assignment` (
  `semester` varchar(50) DEFAULT NULL,
  `date` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `filename` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`date`,`subject`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `assignment` */

/*Table structure for table `attendance` */

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `eno` varchar(20) NOT NULL,
  `yop` varchar(20) NOT NULL,
  `sem` varchar(20) NOT NULL,
  `month` varchar(20) NOT NULL,
  `attd` int(11) DEFAULT NULL,
  PRIMARY KEY (`eno`,`yop`,`sem`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `attendance` */

/*Table structure for table `attendance_lecture_count` */

DROP TABLE IF EXISTS `attendance_lecture_count`;

CREATE TABLE `attendance_lecture_count` (
  `yop` varchar(50) NOT NULL,
  `semester` varchar(50) NOT NULL,
  `month` varchar(50) NOT NULL,
  `lecture_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`yop`,`semester`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `attendance_lecture_count` */

/*Table structure for table `bkp_2010_student_details` */

DROP TABLE IF EXISTS `bkp_2010_student_details`;

CREATE TABLE `bkp_2010_student_details` (
  `enrollment` varchar(20) NOT NULL,
  `computer_code` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `mobile_number` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `parent_mobile` varchar(50) DEFAULT NULL,
  `father_name` varchar(50) DEFAULT NULL,
  `mother_name` varchar(50) DEFAULT NULL,
  `local_guardian` varchar(50) DEFAULT NULL,
  `local_guardian_number` varchar(50) DEFAULT NULL,
  `emailid` varchar(50) DEFAULT NULL,
  `dob` varchar(50) DEFAULT NULL,
  `blood_group` varchar(50) DEFAULT NULL,
  `10th` varchar(50) DEFAULT NULL,
  `12th` varchar(50) DEFAULT NULL,
  `diploma` varchar(50) DEFAULT NULL,
  `qualifying_exam` varchar(50) DEFAULT NULL,
  `qualifying_exam_marks` varchar(50) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `yop` varchar(5) NOT NULL,
  PRIMARY KEY (`enrollment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bkp_2010_student_details` */

insert  into `bkp_2010_student_details`(`enrollment`,`computer_code`,`name`,`gender`,`category`,`address`,`mobile_number`,`phone_number`,`parent_mobile`,`father_name`,`mother_name`,`local_guardian`,`local_guardian_number`,`emailid`,`dob`,`blood_group`,`10th`,`12th`,`diploma`,`qualifying_exam`,`qualifying_exam_marks`,`photo`,`yop`) values ('0808CS101061','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','xyz','2010'),('0808CS101063','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','xyz','2010'),('0808CS101064','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','xyz','2010'),('0808CS101065','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','a','xyz','2010');

/*Table structure for table `faculty_details` */

DROP TABLE IF EXISTS `faculty_details`;

CREATE TABLE `faculty_details` (
  `userid` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `emailid` varchar(50) DEFAULT NULL,
  `contactno` int(11) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `doj` varchar(20) DEFAULT NULL COMMENT 'joining date',
  `dol` varchar(20) DEFAULT NULL COMMENT 'leaving date',
  `dob` varchar(20) DEFAULT NULL COMMENT 'birth date',
  `bloodgroup` varchar(10) DEFAULT NULL,
  `voterid` varchar(20) DEFAULT NULL,
  `pancard` varchar(20) DEFAULT NULL,
  `qualification` varchar(50) DEFAULT NULL,
  `experience` varchar(100) DEFAULT NULL,
  `bankname` varchar(100) DEFAULT NULL,
  `bankacc` varchar(30) DEFAULT NULL,
  `ifsc` varchar(10) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  CONSTRAINT `FK_UID` FOREIGN KEY (`userid`) REFERENCES `user_login` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `faculty_details` */

/*Table structure for table `fee_records` */

DROP TABLE IF EXISTS `fee_records`;

CREATE TABLE `fee_records` (
  `enrollment` varchar(20) NOT NULL,
  `year` varchar(30) NOT NULL,
  `filename` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`enrollment`,`year`),
  UNIQUE KEY `filename_UNIQUE` (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fee_records` */

/*Table structure for table `gate` */

DROP TABLE IF EXISTS `gate`;

CREATE TABLE `gate` (
  `enrollment` varchar(50) DEFAULT NULL,
  `gate_marks` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `gate` */

/*Table structure for table `industrial_training` */

DROP TABLE IF EXISTS `industrial_training`;

CREATE TABLE `industrial_training` (
  `enrollment` varchar(50) DEFAULT NULL,
  `topic` varchar(50) DEFAULT NULL,
  `technology` varchar(50) DEFAULT NULL,
  `organisation` varchar(50) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `certificate` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `industrial_training` */

/*Table structure for table `leave_record` */

DROP TABLE IF EXISTS `leave_record`;

CREATE TABLE `leave_record` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `enrollment` varchar(20) DEFAULT NULL,
  `start_date` varchar(20) DEFAULT NULL,
  `end_date` varchar(20) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `reason` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `leave_record` */

/*Table structure for table `midsem_attendance` */

DROP TABLE IF EXISTS `midsem_attendance`;

CREATE TABLE `midsem_attendance` (
  `year` varchar(10) DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL,
  `month` varchar(10) DEFAULT NULL,
  `filename` varchar(50) NOT NULL,
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `midsem_attendance` */

/*Table structure for table `midsem_question_paper` */

DROP TABLE IF EXISTS `midsem_question_paper`;

CREATE TABLE `midsem_question_paper` (
  `year` varchar(10) DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL,
  `month` varchar(10) DEFAULT NULL,
  `filename` varchar(50) NOT NULL,
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `midsem_question_paper` */

/*Table structure for table `midsem_timetable` */

DROP TABLE IF EXISTS `midsem_timetable`;

CREATE TABLE `midsem_timetable` (
  `year` varchar(10) DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL,
  `month` varchar(10) DEFAULT NULL,
  `filename` varchar(50) NOT NULL,
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `midsem_timetable` */

/*Table structure for table `mst_result_analysis` */

DROP TABLE IF EXISTS `mst_result_analysis`;

CREATE TABLE `mst_result_analysis` (
  `enrollment` varchar(25) NOT NULL,
  `subject_one` varchar(50) DEFAULT NULL,
  `subject_two` varchar(50) DEFAULT NULL,
  `subject_three` varchar(50) DEFAULT NULL,
  `subject_four` varchar(50) DEFAULT NULL,
  `subject_five` varchar(50) DEFAULT NULL,
  `semester` varchar(20) NOT NULL,
  `yop` varchar(20) DEFAULT NULL,
  `max_one` varchar(10) DEFAULT 'NA',
  `max_two` varchar(10) DEFAULT 'NA',
  `max_three` varchar(10) DEFAULT 'NA',
  `max_four` varchar(10) DEFAULT 'NA',
  `max_five` varchar(10) DEFAULT 'NA',
  PRIMARY KEY (`enrollment`,`semester`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mst_result_analysis` */

insert  into `mst_result_analysis`(`enrollment`,`subject_one`,`subject_two`,`subject_three`,`subject_four`,`subject_five`,`semester`,`yop`,`max_one`,`max_two`,`max_three`,`max_four`,`max_five`) values ('0808CS101065',NULL,NULL,NULL,NULL,NULL,'8','2014','45','80','60','14','25');

/*Table structure for table `notices` */

DROP TABLE IF EXISTS `notices`;

CREATE TABLE `notices` (
  `notice_date` varchar(20) NOT NULL,
  `description` varchar(25) NOT NULL,
  PRIMARY KEY (`notice_date`,`description`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `notices` */

/*Table structure for table `placement` */

DROP TABLE IF EXISTS `placement`;

CREATE TABLE `placement` (
  `enrollment` varchar(50) NOT NULL,
  `company_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enrollment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `placement` */

/*Table structure for table `project` */

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `enrollment` varchar(50) NOT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `guide` varchar(50) DEFAULT NULL,
  `technology` varchar(50) DEFAULT NULL,
  `application_area` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enrollment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `project` */

/*Table structure for table `question_papers` */

DROP TABLE IF EXISTS `question_papers`;

CREATE TABLE `question_papers` (
  `subject` varchar(60) DEFAULT NULL,
  `month` varchar(60) DEFAULT NULL,
  `year` varchar(60) DEFAULT NULL,
  `filename` varchar(60) NOT NULL,
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `question_papers` */

/*Table structure for table `result_analysis` */

DROP TABLE IF EXISTS `result_analysis`;

CREATE TABLE `result_analysis` (
  `enrollment` varchar(20) NOT NULL,
  `cgpa` varchar(10) DEFAULT 'NA',
  `sgpa` varchar(10) DEFAULT 'NA',
  `atkt` varchar(10) DEFAULT 'NA',
  `subject_one` varchar(50) DEFAULT NULL,
  `subject_two` varchar(50) DEFAULT NULL,
  `subject_three` varchar(50) DEFAULT NULL,
  `subject_four` varchar(50) DEFAULT NULL,
  `subject_five` varchar(50) DEFAULT NULL,
  `semester` varchar(50) NOT NULL,
  `yop` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`enrollment`,`semester`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `result_analysis` */

insert  into `result_analysis`(`enrollment`,`cgpa`,`sgpa`,`atkt`,`subject_one`,`subject_two`,`subject_three`,`subject_four`,`subject_five`,`semester`,`yop`) values ('0808CS101059','7.88','6.50','cloud','A+','B+','C','D','F','8','2014'),('0808CS101060','8.88','9.01','','A+','A+','C','A+','A','8','2014'),('0808CS101062','6.03','8.50','NA','B+','A+','D','A+','C+','8','2014'),('0808CS101066','8.34','7.36','NA','A+','B','A+','A+','A+','8','2014');

/*Table structure for table `student_details` */

DROP TABLE IF EXISTS `student_details`;

CREATE TABLE `student_details` (
  `enrollment` varchar(20) NOT NULL,
  `computer_code` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `mobile_number` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `parent_mobile` varchar(50) DEFAULT NULL,
  `father_name` varchar(50) DEFAULT NULL,
  `mother_name` varchar(50) DEFAULT NULL,
  `local_guardian` varchar(50) DEFAULT NULL,
  `local_guardian_number` varchar(50) DEFAULT NULL,
  `emailid` varchar(50) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `blood_group` varchar(50) DEFAULT NULL,
  `10th` varchar(50) DEFAULT NULL,
  `12th` varchar(50) DEFAULT NULL,
  `diploma` varchar(50) DEFAULT NULL,
  `qualifying_exam` varchar(50) DEFAULT NULL,
  `qualifying_exam_marks` varchar(50) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `yop` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`enrollment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `student_details` */

insert  into `student_details`(`enrollment`,`computer_code`,`name`,`gender`,`category`,`address`,`mobile_number`,`phone_number`,`parent_mobile`,`father_name`,`mother_name`,`local_guardian`,`local_guardian_number`,`emailid`,`dob`,`blood_group`,`10th`,`12th`,`diploma`,`qualifying_exam`,`qualifying_exam_marks`,`photo`,`yop`) values ('0808cs101059','20820','a','a','obc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014'),('0808cs101060','20820','a','a','obc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014'),('0808cs101062','20820','a','a','obc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014'),('0808cs101066','20820','a','a','obc',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014');

/*Table structure for table `subjects` */

DROP TABLE IF EXISTS `subjects`;

CREATE TABLE `subjects` (
  `semester` varchar(50) NOT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `code` varchar(15) NOT NULL,
  `type` varchar(15) DEFAULT NULL,
  `yop` varchar(50) NOT NULL,
  PRIMARY KEY (`semester`,`code`,`yop`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `subjects` */

insert  into `subjects`(`semester`,`subject`,`code`,`type`,`yop`) values ('56','cloud','784','jbkbkl','2014'),('7','cloud','458','jbkbkl','2014'),('7','cloud','784','jbkbkl','2014'),('7','cloud','852','jbkbkl','2014'),('8','wireless','014','rikf','2014'),('8','web eng','123','theory','2014'),('8','soft','456','the','2014'),('8','network','789','thak','2014'),('8','cloud','852','jbkbkl','2014');

/*Table structure for table `timetable` */

DROP TABLE IF EXISTS `timetable`;

CREATE TABLE `timetable` (
  `yop` varchar(10) DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL,
  `section` varchar(10) DEFAULT NULL,
  `filename` varchar(20) NOT NULL,
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `timetable` */

/*Table structure for table `user_login` */

DROP TABLE IF EXISTS `user_login`;

CREATE TABLE `user_login` (
  `userid` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` varchar(20) NOT NULL,
  `dept` varchar(20) NOT NULL,
  PRIMARY KEY (`userid`,`role`,`dept`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_login` */

insert  into `user_login`(`userid`,`password`,`role`,`dept`) values ('root','init','admin','CSE');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
