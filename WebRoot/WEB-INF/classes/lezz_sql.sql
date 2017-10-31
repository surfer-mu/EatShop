/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.27 : Database - eat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`eat` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `eat`;

/*Table structure for table `eat` */

DROP TABLE IF EXISTS `eat`;

CREATE TABLE `eat` (
  `id` varchar(50) NOT NULL,
  `eatname` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `pnum` int(11) DEFAULT NULL,
  `imgpath` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `eat` */

insert  into `eat`(`id`,`eatname`,`price`,`pnum`,`imgpath`,`category`) values ('0','',0,0,'eatimg/1.jpg','cake'),('02d78869-efc6-427a-97f6-a83c8c1f7288','dfg',0,0,'eatimg/19.jpg',''),('0aed9185-4ca0-46db-82e4-f60fce7fd688','1111',1111,111,'eatimg/10.jpg','11111'),('0ca9ad84-c0ad-4702-99c7-4c5463565a10','sd',0,0,'eatimg/21.jpg',''),('107b3355-5c35-4a51-9ddd-5ef932af5f75','22',0,0,'eatimg/115.jpg',''),('17d9a0e9-2b89-4d33-a0d1-d58bb25148d1','e',0,0,'eatimg/2.jpg',''),('1d16ef6b-0375-4cb2-8807-dfb40fdad06a','df',0,0,'eatimg/30.jpg',''),('1ffe3950-ec49-45c7-820c-facde5fdb647','df',0,0,'eatimg/8.jpg',''),('20f4a096-7176-4722-a502-93ab7b00133e','dv',0,0,'eatimg/7.jpg',''),('30398111-3912-4d89-b27b-b359b2a4a943','的',0,0,'eatimg/15.jpg',''),('35077bf4-003e-4973-a334-739d07cfbbf6','1',0,0,'eatimg/114.jpg',''),('4081c0a0-6eed-4827-ad06-75f74a4bb629','1',0,0,'eatimg/117.jpg',''),('4d7a9739-7a17-43bd-97ce-3614c3032c06','1',0,0,'eatimg/13.jpg',''),('566c4217-d9ba-4cc7-9a41-8ac40ea12437','1',0,0,'eatimg/112.jpg',''),('60f8db6c-98a7-446d-bb6f-abce58152e0d','1',0,0,'eatimg/12.jpg',''),('6a04115b-74d5-4913-8eab-b6369ca3b571','sdf',0,0,'eatimg/9.jpg',''),('70f874e7-e60f-4075-9989-95fab66830ba','df',0,0,'eatimg/6.jpg',''),('770d942d-dd81-42cd-87b7-3263100a3809','s',0,0,'eatimg/5.jpg',''),('78e9aa16-0a9a-4fbb-ae37-8c4735addc43','s',0,0,'eatimg/20.jpg',''),('799191b0-7977-4af5-bbb5-43cfabc6356a','我',0,0,'eatimg/118.jpg',''),('811aefd0-9253-484b-be2d-6f0b73186287','df',0,0,'eatimg/29.jpg',''),('83e8d042-30db-4898-af01-078c9b3fffe4','1',0,0,'eatimg/119.jpg',''),('84126782-1cc3-4a6c-a6fe-a659bffeabbb','sd',0,0,'eatimg/3.jpg',''),('847eab07-e0cc-439f-baae-42fe8c64f523','sd',0,0,'eatimg/25.jpg',''),('89d094df-db5c-4a21-b646-23806a2232d4','sd',0,0,'eatimg/28.jpg',''),('8d6099fc-d42b-4cce-8766-0c0c1206e703','sd',0,0,'eatimg/23.jpg',''),('9ad6703c-a871-4ebb-825f-e146aa5e1040','阿瑟',0,0,'eatimg/17.jpg',''),('a4cd987d-ab85-4bd2-83e5-ad3505c0b42a','1',0,0,'eatimg/22.jpg',''),('aa7e0931-cb98-4eda-bafb-10d822836454','1',0,0,'eatimg/13.jpg',''),('aadfde6a-aadf-4f2d-814c-d703dd7d6c0f','22',0,0,'eatimg/111.jpg',''),('abffb60c-6963-495c-96f9-88da0ae3eb86','sdf',0,0,'eatimg/24.jpg',''),('adb6cf26-1c3f-435d-83b0-3a8f0130bbaf','1',0,0,'eatimg/14.jpg',''),('b2cfd00d-9d0f-44d3-99a5-69066551fdcc','1',0,0,'eatimg/113.jpg',''),('b8041d31-1471-4940-8574-50ac49d560e6','sd',0,0,'eatimg/27.jpg',''),('b96c080f-dc67-48ff-8c08-26688e49e99d','速度',0,0,'eatimg/16.jpg',''),('c02adc05-22db-47fe-be6f-4585589f1828','11',2,2,'eatimg/11.jpg','2'),('cf6ab440-0644-48fb-87f3-e5b90bce46c8','sd',0,0,'eatimg/4.jpg',''),('e49afeb8-6e94-41c9-85e6-85bc2f1c8256','sd',0,0,'eatimg/26.jpg',''),('f2975c61-2952-4aed-83bf-9c6bea4a7ba6','1',0,0,'eatimg/116.jpg',''),('f656c3e4-1175-46ed-8fc4-da1e85533518','df',0,0,'eatimg/18.jpg','');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `eatname` varchar(50) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `allPrice` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

insert  into `goods`(`eatname`,`number`,`allPrice`) values ('面包',5,225);

/*Table structure for table `loginaddress` */

DROP TABLE IF EXISTS `loginaddress`;

CREATE TABLE `loginaddress` (
  `id` varchar(50) DEFAULT NULL,
  `time` varchar(50) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `loginaddress` */

insert  into `loginaddress`(`id`,`time`,`ip`) values ('0585da78-eadc-4ab4-9c93-506b84047416','2017-7-25 13:21:43','127.0.0.1'),('0585da78-eadc-4ab4-9c93-506b84047416','2017-7-26 10:57:41','127.0.0.1'),('0585da78-eadc-4ab4-9c93-506b84047416','2017-7-26 11:17:49','127.0.0.1');

/*Table structure for table `ordercart` */

DROP TABLE IF EXISTS `ordercart`;

CREATE TABLE `ordercart` (
  `orderId` varchar(50) DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL,
  `relname` varchar(20) DEFAULT NULL,
  `tell` varchar(11) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `orderTime` timestamp NULL DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ordercart` */

insert  into `ordercart`(`orderId`,`userid`,`relname`,`tell`,`address`,`total`,`orderTime`,`username`) values ('14964100344870','1','slq','15703765673','西安',671,NULL,'slq'),('14964135114890','1','slq','12345678978','西安',414,NULL,'slq'),('14964145703900','1','slq','12345678978','西安',1412.9,NULL,'slq'),('14964621183250','6','q','12343343222','vgdsf',39.5,NULL,'qwer');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `relname` varchar(20) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `tell` varchar(11) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `time` varchar(30) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `category` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`relname`,`password`,`sex`,`tell`,`address`,`email`,`time`,`ip`,`category`) values ('0585da78-eadc-4ab4-9c93-506b84047416','mmmm','非递归','9DE37A0627C25684FDD519CA84073E34','男','112','山西','',NULL,NULL,'highadmin'),('2','hjj','hjj','slq','男','12342345789','北京',NULL,NULL,NULL,NULL),('4','aaa','aaa','aaaaaa','女','12343256742','汉城',NULL,NULL,NULL,NULL),('6','qwer','q','qqqqqq','女','12343343222','vgdsf',NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
