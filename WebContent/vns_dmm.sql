/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.5.24-log : Database - vns_dmm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`vns_dmm` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `vns_dmm`;

/*Table structure for table `adminlogin` */

DROP TABLE IF EXISTS `adminlogin`;

CREATE TABLE `adminlogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_earn` varchar(500) NOT NULL DEFAULT '0',
  `name` varchar(500) NOT NULL DEFAULT '0',
  `email` varchar(150) NOT NULL DEFAULT '0',
  `password` varchar(250) NOT NULL DEFAULT '0',
  `logintime` varchar(250) NOT NULL DEFAULT '0',
  `online_status` varchar(100) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `adminlogin` */

insert  into `adminlogin`(`id`,`total_earn`,`name`,`email`,`password`,`logintime`,`online_status`) values 
(3,'0','admin1','admin1@gmail.com','12345','0','1'),
(4,'0','admin2','admin2@gmail.com','12345','0','1'),
(5,'0','admin3','admin3@gmail.com','12345','0','0');

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `message` varchar(100) DEFAULT NULL,
  `statusActive` varchar(100) DEFAULT '0',
  `datee` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `chat` */

/*Table structure for table `chat_initiate_request` */

DROP TABLE IF EXISTS `chat_initiate_request`;

CREATE TABLE `chat_initiate_request` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT 'empty',
  `email` varchar(100) DEFAULT 'empty',
  `mobile` varchar(100) DEFAULT 'empty',
  `message` varchar(100) DEFAULT 'empty',
  `latest_admin_replying_id` varchar(100) DEFAULT 'empty',
  `latest_admin_replying_name` varchar(100) DEFAULT 'empty',
  `chat_status` varchar(100) DEFAULT 'empty',
  `chatid` varchar(100) DEFAULT 'empty',
  `last_reply_by` varchar(100) DEFAULT 'empty',
  `last_reply_time` varchar(100) DEFAULT 'empty',
  `chat_request_status` varchar(100) DEFAULT 'empty',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

/*Data for the table `chat_initiate_request` */

/*Table structure for table `contact` */

DROP TABLE IF EXISTS `contact`;

CREATE TABLE `contact` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `branding` varchar(100) DEFAULT 'no',
  `content` varchar(100) DEFAULT 'no',
  `design` varchar(100) DEFAULT 'no',
  `ecommerce` varchar(100) DEFAULT 'no',
  `webbdev` varchar(100) DEFAULT 'no',
  `apps` varchar(100) DEFAULT 'no',
  `vr` varchar(100) DEFAULT 'no',
  `performance` varchar(100) DEFAULT 'no',
  `print` varchar(100) DEFAULT 'no',
  `name` varchar(100) DEFAULT 'empty',
  `email` varchar(100) DEFAULT 'empty',
  `phn` varchar(100) DEFAULT 'empty',
  `company_name` varchar(100) DEFAULT 'empty',
  `budget` varchar(100) DEFAULT 'empty',
  `message` varchar(100) DEFAULT 'empty',
  `noneselected` varchar(100) DEFAULT 'empty',
  `submission_date` varchar(100) DEFAULT 'empty',
  `confirmation_status` varchar(100) DEFAULT 'false',
  `trashed_status` varchar(100) DEFAULT 'false',
  `latest_confirmation_email_sent_time` varchar(100) DEFAULT 'false',
  `confirmation_url` varchar(100) DEFAULT 'empty',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `contact` */

/*Table structure for table `edit_homepage_images` */

DROP TABLE IF EXISTS `edit_homepage_images`;

CREATE TABLE `edit_homepage_images` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) DEFAULT 'empty',
  `last_updated` varchar(100) DEFAULT 'empty',
  `links` varchar(100) DEFAULT 'empty',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `edit_homepage_images` */

insert  into `edit_homepage_images`(`id`,`filename`,`last_updated`,`links`) values 
(1,'images/creative-6.png','empty','https://www.instagram.com/p/CARoyiQhsXi/?igshid=wejzq4yrt5de'),
(2,'images/creative-2.png','empty','https://www.instagram.com/p/CAE5CDGB2gX/?igshid=1cnue50wrt12u'),
(3,'images/creative-1.png','empty','https://www.instagram.com/p/CARoyiQhsXi/?igshid=wejzq4yrt5de');

/*Table structure for table `free_audit` */

DROP TABLE IF EXISTS `free_audit`;

CREATE TABLE `free_audit` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT 'empty',
  `email` varchar(100) DEFAULT 'empty',
  `phone` varchar(100) DEFAULT 'empty',
  `msg` varchar(100) DEFAULT 'empty',
  `source_page` varchar(100) DEFAULT 'empty',
  `submission_date` varchar(100) DEFAULT 'empty',
  `confirmation_status` varchar(100) DEFAULT 'false',
  `trashed_status` varchar(100) DEFAULT 'false',
  `latest_confirmation_email_sent_time` varchar(100) DEFAULT 'empty',
  `confirmation_url` varchar(100) DEFAULT 'empty',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `free_audit` */

/*Table structure for table `quick_enquiry` */

DROP TABLE IF EXISTS `quick_enquiry`;

CREATE TABLE `quick_enquiry` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT 'empty',
  `email` varchar(100) DEFAULT 'empty',
  `phone` varchar(100) DEFAULT 'empty',
  `company` varchar(100) DEFAULT 'empty',
  `message` varchar(100) DEFAULT 'empty',
  `confirmation_status` varchar(100) DEFAULT 'false',
  `trashed_status` varchar(100) DEFAULT 'false',
  `submission_date` varchar(100) DEFAULT 'empty',
  `latest_confirmation_email_sent_time` varchar(100) DEFAULT 'empty',
  `confirmation_url` varchar(100) DEFAULT 'empty',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `quick_enquiry` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
