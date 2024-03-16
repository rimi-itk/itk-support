-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for Linux (x86_64)
--
-- Host: leantime-db    Database: db
-- ------------------------------------------------------
-- Server version	10.11.7-MariaDB-1:10.11.7+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `zp_approvals`
--

DROP TABLE IF EXISTS `zp_approvals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_approvals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(100) DEFAULT NULL,
  `entityId` int(11) DEFAULT NULL,
  `requestorId` int(11) DEFAULT NULL,
  `approverId` int(11) DEFAULT NULL,
  `approvalStatus` int(11) DEFAULT NULL,
  `requestedOn` datetime DEFAULT NULL,
  `lastStatusChange` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_approvals`
--

LOCK TABLES `zp_approvals` WRITE;
/*!40000 ALTER TABLE `zp_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_approvals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_audit`
--

DROP TABLE IF EXISTS `zp_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `entity` varchar(45) DEFAULT NULL,
  `entityId` int(11) DEFAULT NULL,
  `values` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projectId` (`projectId`),
  KEY `projectAction` (`projectId`,`action`),
  KEY `projectEntityEntityId` (`projectId`,`entity`,`entityId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_audit`
--

LOCK TABLES `zp_audit` WRITE;
/*!40000 ALTER TABLE `zp_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_calendar`
--

DROP TABLE IF EXISTS `zp_calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `dateFrom` datetime DEFAULT NULL,
  `dateTo` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `kind` varchar(255) DEFAULT NULL,
  `allDay` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_calendar`
--

LOCK TABLES `zp_calendar` WRITE;
/*!40000 ALTER TABLE `zp_calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_canvas`
--

DROP TABLE IF EXISTS `zp_canvas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_canvas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` int(10) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ProjectIdType` (`projectId`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_canvas`
--

LOCK TABLES `zp_canvas` WRITE;
/*!40000 ALTER TABLE `zp_canvas` DISABLE KEYS */;
INSERT INTO `zp_canvas` (`id`, `title`, `author`, `created`, `projectId`, `type`, `description`) VALUES (1,'Lean Canvas',1,'2015-11-13 13:03:46',3,'leancanvas',NULL);
/*!40000 ALTER TABLE `zp_canvas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_canvas_items`
--

DROP TABLE IF EXISTS `zp_canvas_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_canvas_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` mediumtext DEFAULT NULL,
  `assumptions` text DEFAULT NULL,
  `data` mediumtext DEFAULT NULL,
  `conclusion` text DEFAULT NULL,
  `box` varchar(255) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `canvasId` int(11) DEFAULT NULL,
  `sortindex` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `relates` varchar(255) DEFAULT NULL,
  `milestoneId` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `featured` int(11) DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `kpi` int(11) DEFAULT NULL,
  `data1` mediumtext DEFAULT NULL,
  `data2` mediumtext DEFAULT NULL,
  `data3` mediumtext DEFAULT NULL,
  `data4` mediumtext DEFAULT NULL,
  `data5` mediumtext DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  `setting` text DEFAULT NULL,
  `metricType` varchar(45) DEFAULT NULL,
  `startValue` double(10,2) DEFAULT NULL,
  `currentValue` double(10,2) DEFAULT NULL,
  `endValue` double(10,2) DEFAULT NULL,
  `impact` int(11) DEFAULT NULL,
  `effort` int(11) DEFAULT NULL,
  `probability` int(11) DEFAULT NULL,
  `action` text DEFAULT NULL,
  `assignedTo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CanvasLookUp` (`canvasId`,`box`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_canvas_items`
--

LOCK TABLES `zp_canvas_items` WRITE;
/*!40000 ALTER TABLE `zp_canvas_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_canvas_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_clients`
--

DROP TABLE IF EXISTS `zp_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `street` varchar(200) DEFAULT NULL,
  `zip` int(10) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `internet` varchar(200) DEFAULT NULL,
  `published` int(1) DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_clients`
--

LOCK TABLES `zp_clients` WRITE;
/*!40000 ALTER TABLE `zp_clients` DISABLE KEYS */;
INSERT INTO `zp_clients` (`id`, `name`, `street`, `zip`, `city`, `state`, `country`, `phone`, `internet`, `published`, `age`, `email`) VALUES (1,'ITK development','',0,'','','','','',NULL,NULL,'');
/*!40000 ALTER TABLE `zp_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_comment`
--

DROP TABLE IF EXISTS `zp_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(200) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `commentParent` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `moduleId` int(11) DEFAULT NULL,
  `text` text DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_comment`
--

LOCK TABLES `zp_comment` WRITE;
/*!40000 ALTER TABLE `zp_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_entity_relationship`
--

DROP TABLE IF EXISTS `zp_entity_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_entity_relationship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enitityA` int(11) DEFAULT NULL,
  `entityAType` varchar(45) DEFAULT NULL,
  `entityB` int(11) DEFAULT NULL,
  `entityBType` varchar(45) DEFAULT NULL,
  `relationship` varchar(45) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `meta` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entityA` (`enitityA`,`entityAType`,`relationship`),
  KEY `entityB` (`entityB`,`entityBType`,`relationship`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_entity_relationship`
--

LOCK TABLES `zp_entity_relationship` WRITE;
/*!40000 ALTER TABLE `zp_entity_relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_entity_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_file`
--

DROP TABLE IF EXISTS `zp_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` enum('project','ticket','client','user','lead','export','private') DEFAULT NULL,
  `moduleId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `encName` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_file`
--

LOCK TABLES `zp_file` WRITE;
/*!40000 ALTER TABLE `zp_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_gcallinks`
--

DROP TABLE IF EXISTS `zp_gcallinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_gcallinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(255) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `colorClass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_gcallinks`
--

LOCK TABLES `zp_gcallinks` WRITE;
/*!40000 ALTER TABLE `zp_gcallinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_gcallinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_integration`
--

DROP TABLE IF EXISTS `zp_integration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_integration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerId` varchar(45) DEFAULT NULL,
  `method` varchar(45) DEFAULT NULL,
  `entity` varchar(45) DEFAULT NULL,
  `fields` text DEFAULT NULL,
  `schedule` varchar(45) DEFAULT NULL,
  `notes` varchar(45) DEFAULT NULL,
  `auth` text DEFAULT NULL,
  `meta` varchar(45) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  `lastSync` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_integration`
--

LOCK TABLES `zp_integration` WRITE;
/*!40000 ALTER TABLE `zp_integration` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_integration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_note`
--

DROP TABLE IF EXISTS `zp_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_note` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_note`
--

LOCK TABLES `zp_note` WRITE;
/*!40000 ALTER TABLE `zp_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_notifications`
--

DROP TABLE IF EXISTS `zp_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `read` int(11) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `module` varchar(45) DEFAULT NULL,
  `moduleId` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `authorId` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `userId,datetime` (`userId`,`datetime` DESC),
  KEY `userId,read` (`userId`,`read` DESC)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_notifications`
--

LOCK TABLES `zp_notifications` WRITE;
/*!40000 ALTER TABLE `zp_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_plugins`
--

DROP TABLE IF EXISTS `zp_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `version` varchar(45) DEFAULT NULL,
  `installdate` datetime DEFAULT NULL,
  `foldername` varchar(45) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `authors` varchar(255) DEFAULT NULL,
  `license` text DEFAULT NULL,
  `format` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_plugins`
--

LOCK TABLES `zp_plugins` WRITE;
/*!40000 ALTER TABLE `zp_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_projects`
--

DROP TABLE IF EXISTS `zp_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `clientId` int(100) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `state` int(2) DEFAULT NULL,
  `hourBudget` varchar(255) NOT NULL,
  `dollarBudget` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `menuType` mediumtext DEFAULT NULL,
  `psettings` mediumtext DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `avatar` mediumtext DEFAULT NULL,
  `cover` mediumtext DEFAULT NULL,
  `sortIndex` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_projects`
--

LOCK TABLES `zp_projects` WRITE;
/*!40000 ALTER TABLE `zp_projects` DISABLE KEYS */;
INSERT INTO `zp_projects` (`id`, `name`, `clientId`, `details`, `state`, `hourBudget`, `dollarBudget`, `active`, `menuType`, `psettings`, `parent`, `type`, `start`, `end`, `created`, `modified`, `avatar`, `cover`, `sortIndex`) VALUES (3,'Support',1,'<h3>What are you trying to accomplish?</h3>\r\n<p>&nbsp;</p>\r\n<h3>What does the world, your business or your customers journey look like when you\'re done?</h3>\r\n<p>&nbsp;</p>\r\n<h3>Why is this important?</h3>',0,'0',0,NULL,'default','restricted',0,'project',NULL,NULL,NULL,'2024-03-16 04:05:08',NULL,NULL,NULL);
/*!40000 ALTER TABLE `zp_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_punch_clock`
--

DROP TABLE IF EXISTS `zp_punch_clock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_punch_clock` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `minutes` int(11) DEFAULT NULL,
  `hours` int(11) DEFAULT NULL,
  `punchIn` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_punch_clock`
--

LOCK TABLES `zp_punch_clock` WRITE;
/*!40000 ALTER TABLE `zp_punch_clock` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_punch_clock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_queue`
--

DROP TABLE IF EXISTS `zp_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_queue` (
  `msghash` varchar(50) NOT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text NOT NULL,
  `thedate` datetime NOT NULL,
  `projectId` int(11) NOT NULL,
  PRIMARY KEY (`msghash`),
  KEY `projectId` (`projectId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_queue`
--

LOCK TABLES `zp_queue` WRITE;
/*!40000 ALTER TABLE `zp_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_reactions`
--

DROP TABLE IF EXISTS `zp_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_reactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `moduleId` int(11) DEFAULT NULL,
  `module` varchar(45) DEFAULT NULL,
  `reaction` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entity` (`moduleId`,`module`,`reaction`),
  KEY `user` (`userId`,`moduleId`,`module`,`reaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_reactions`
--

LOCK TABLES `zp_reactions` WRITE;
/*!40000 ALTER TABLE `zp_reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_read`
--

DROP TABLE IF EXISTS `zp_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_read` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` enum('ticket','message') DEFAULT NULL,
  `moduleId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_read`
--

LOCK TABLES `zp_read` WRITE;
/*!40000 ALTER TABLE `zp_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_relationuserproject`
--

DROP TABLE IF EXISTS `zp_relationuserproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_relationuserproject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `wage` int(11) DEFAULT NULL,
  `projectRole` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zp_relationuserproject_projectId_index` (`projectId`),
  KEY `zp_relationuserproject_userId_index` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_relationuserproject`
--

LOCK TABLES `zp_relationuserproject` WRITE;
/*!40000 ALTER TABLE `zp_relationuserproject` DISABLE KEYS */;
INSERT INTO `zp_relationuserproject` (`id`, `userId`, `projectId`, `wage`, `projectRole`) VALUES (6,1,3,NULL,NULL);
INSERT INTO `zp_relationuserproject` (`id`, `userId`, `projectId`, `wage`, `projectRole`) VALUES (7,19,3,NULL,NULL);
INSERT INTO `zp_relationuserproject` (`id`, `userId`, `projectId`, `wage`, `projectRole`) VALUES (8,18,3,NULL,NULL);
INSERT INTO `zp_relationuserproject` (`id`, `userId`, `projectId`, `wage`, `projectRole`) VALUES (9,20,3,NULL,NULL);
INSERT INTO `zp_relationuserproject` (`id`, `userId`, `projectId`, `wage`, `projectRole`) VALUES (10,2,3,NULL,'');
/*!40000 ALTER TABLE `zp_relationuserproject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_settings`
--

DROP TABLE IF EXISTS `zp_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_settings` (
  `key` varchar(175) NOT NULL,
  `value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_settings`
--

LOCK TABLES `zp_settings` WRITE;
/*!40000 ALTER TABLE `zp_settings` DISABLE KEYS */;
INSERT INTO `zp_settings` (`key`, `value`) VALUES ('companysettings.completedOnboarding','1');
INSERT INTO `zp_settings` (`key`, `value`) VALUES ('companysettings.telemetry.active','true');
INSERT INTO `zp_settings` (`key`, `value`) VALUES ('companysettings.telemetry.anonymousId','7e430ed5-f075-447c-a4c7-2ed842abbfc7');
INSERT INTO `zp_settings` (`key`, `value`) VALUES ('companysettings.telemetry.lastUpdate','2024-03-16');
INSERT INTO `zp_settings` (`key`, `value`) VALUES ('db-version','3.0.2');
INSERT INTO `zp_settings` (`key`, `value`) VALUES ('usersettings.1.lastMessageDate','2024-03-16 15:20:58');
INSERT INTO `zp_settings` (`key`, `value`) VALUES ('usersettings.1.lastProject','3');
INSERT INTO `zp_settings` (`key`, `value`) VALUES ('usersettings.1.recentProjects','a:1:{i:0;i:3;}');
INSERT INTO `zp_settings` (`key`, `value`) VALUES ('usersettings.2.lastProject','3');
INSERT INTO `zp_settings` (`key`, `value`) VALUES ('usersettings.2.recentProjects','a:1:{i:0;i:3;}');
/*!40000 ALTER TABLE `zp_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_sprints`
--

DROP TABLE IF EXISTS `zp_sprints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_sprints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `startDate` datetime DEFAULT NULL,
  `endDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_sprints`
--

LOCK TABLES `zp_sprints` WRITE;
/*!40000 ALTER TABLE `zp_sprints` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_sprints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_stats`
--

DROP TABLE IF EXISTS `zp_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_stats` (
  `sprintId` int(11) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `sum_todos` int(11) DEFAULT NULL,
  `sum_open_todos` int(11) DEFAULT NULL,
  `sum_progres_todos` int(11) DEFAULT NULL,
  `sum_closed_todos` int(11) DEFAULT NULL,
  `sum_planned_hours` float DEFAULT NULL,
  `sum_estremaining_hours` float DEFAULT NULL,
  `sum_logged_hours` float DEFAULT NULL,
  `sum_points` int(11) DEFAULT NULL,
  `sum_points_done` int(11) DEFAULT NULL,
  `sum_points_progress` int(11) DEFAULT NULL,
  `sum_points_open` int(11) DEFAULT NULL,
  `sum_todos_xs` int(11) DEFAULT NULL,
  `sum_todos_s` int(11) DEFAULT NULL,
  `sum_todos_m` int(11) DEFAULT NULL,
  `sum_todos_l` int(11) DEFAULT NULL,
  `sum_todos_xl` int(11) DEFAULT NULL,
  `sum_todos_xxl` int(11) DEFAULT NULL,
  `sum_todos_none` int(11) DEFAULT NULL,
  `tickets` text DEFAULT NULL,
  `daily_avg_hours_booked_todo` float DEFAULT NULL,
  `daily_avg_hours_booked_point` float DEFAULT NULL,
  `daily_avg_hours_planned_todo` float DEFAULT NULL,
  `daily_avg_hours_planned_point` float DEFAULT NULL,
  `daily_avg_hours_remaining_point` float DEFAULT NULL,
  `daily_avg_hours_remaining_todo` float DEFAULT NULL,
  `sum_teammembers` int(11) DEFAULT NULL,
  KEY `projectId` (`projectId`,`sprintId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_stats`
--

LOCK TABLES `zp_stats` WRITE;
/*!40000 ALTER TABLE `zp_stats` DISABLE KEYS */;
INSERT INTO `zp_stats` (`sprintId`, `projectId`, `date`, `sum_todos`, `sum_open_todos`, `sum_progres_todos`, `sum_closed_todos`, `sum_planned_hours`, `sum_estremaining_hours`, `sum_logged_hours`, `sum_points`, `sum_points_done`, `sum_points_progress`, `sum_points_open`, `sum_todos_xs`, `sum_todos_s`, `sum_todos_m`, `sum_todos_l`, `sum_todos_xl`, `sum_todos_xxl`, `sum_todos_none`, `tickets`, `daily_avg_hours_booked_todo`, `daily_avg_hours_booked_point`, `daily_avg_hours_planned_todo`, `daily_avg_hours_planned_point`, `daily_avg_hours_remaining_point`, `daily_avg_hours_remaining_todo`, `sum_teammembers`) VALUES (-1,3,'2024-03-15 00:00:00',1,1,0,0,0,0,NULL,0,0,0,0,0,0,0,0,0,0,1,'9',NULL,NULL,0,NULL,NULL,0,1);
/*!40000 ALTER TABLE `zp_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_tickethistory`
--

DROP TABLE IF EXISTS `zp_tickethistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_tickethistory` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `ticketId` int(11) DEFAULT NULL,
  `changeType` varchar(255) DEFAULT NULL,
  `changeValue` varchar(150) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_tickethistory`
--

LOCK TABLES `zp_tickethistory` WRITE;
/*!40000 ALTER TABLE `zp_tickethistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_tickethistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_tickets`
--

DROP TABLE IF EXISTS `zp_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) DEFAULT NULL,
  `headline` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `acceptanceCriteria` text DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `dateToFinish` datetime DEFAULT NULL,
  `priority` varchar(60) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `os` varchar(30) DEFAULT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `resolution` varchar(30) DEFAULT NULL,
  `component` varchar(100) DEFAULT NULL,
  `version` varchar(20) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `dependingTicketId` int(100) DEFAULT NULL,
  `editFrom` datetime DEFAULT NULL,
  `editTo` datetime DEFAULT NULL,
  `editorId` varchar(75) DEFAULT NULL,
  `planHours` float DEFAULT NULL,
  `hourRemaining` float DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `production` int(1) DEFAULT 0,
  `staging` int(1) DEFAULT 0,
  `storypoints` float DEFAULT NULL,
  `sprint` int(100) DEFAULT NULL,
  `sortindex` bigint(20) DEFAULT NULL,
  `kanbanSortIndex` bigint(20) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `milestoneid` int(11) DEFAULT NULL,
  `leancanvasitemid` int(11) DEFAULT NULL,
  `retrospectiveid` int(11) DEFAULT NULL,
  `ideaid` int(11) DEFAULT NULL,
  `zp_ticketscol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ProjectUserId` (`projectId`,`userId`),
  KEY `StatusSprint` (`status`,`sprint`),
  KEY `Sorting` (`sortindex`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_tickets`
--

LOCK TABLES `zp_tickets` WRITE;
/*!40000 ALTER TABLE `zp_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_timesheets`
--

DROP TABLE IF EXISTS `zp_timesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_timesheets` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `ticketId` int(11) DEFAULT NULL,
  `workDate` datetime DEFAULT NULL,
  `hours` float DEFAULT NULL,
  `description` text DEFAULT NULL,
  `kind` varchar(175) DEFAULT NULL,
  `invoicedEmpl` int(2) DEFAULT NULL,
  `invoicedComp` int(2) DEFAULT NULL,
  `invoicedEmplDate` datetime DEFAULT NULL,
  `invoicedCompDate` datetime DEFAULT NULL,
  `rate` varchar(255) DEFAULT NULL,
  `paid` int(2) DEFAULT NULL,
  `paidDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique` (`userId`,`ticketId`,`workDate`,`kind`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_timesheets`
--

LOCK TABLES `zp_timesheets` WRITE;
/*!40000 ALTER TABLE `zp_timesheets` DISABLE KEYS */;
/*!40000 ALTER TABLE `zp_timesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zp_user`
--

DROP TABLE IF EXISTS `zp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zp_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(175) NOT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `profileId` varchar(100) NOT NULL DEFAULT '',
  `lastlogin` datetime DEFAULT NULL,
  `status` varchar(1) NOT NULL DEFAULT 'A',
  `expires` datetime DEFAULT NULL,
  `role` varchar(200) NOT NULL,
  `session` varchar(100) DEFAULT NULL,
  `sessiontime` varchar(50) DEFAULT NULL,
  `wage` int(11) DEFAULT NULL,
  `hours` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `clientId` int(11) DEFAULT NULL,
  `notifications` int(2) DEFAULT NULL,
  `pwReset` varchar(100) DEFAULT NULL,
  `pwResetExpiration` datetime DEFAULT NULL,
  `pwResetCount` int(5) DEFAULT NULL,
  `forcePwReset` tinyint(4) DEFAULT NULL,
  `lastpwd_change` datetime DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `twoFAEnabled` tinyint(1) DEFAULT 0,
  `twoFASecret` varchar(200) DEFAULT NULL,
  `createdOn` datetime DEFAULT NULL,
  `source` varchar(200) DEFAULT NULL,
  `jobTitle` varchar(200) DEFAULT NULL,
  `jobLevel` varchar(50) DEFAULT NULL,
  `department` varchar(200) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zp_user`
--

LOCK TABLES `zp_user` WRITE;
/*!40000 ALTER TABLE `zp_user` DISABLE KEYS */;
INSERT INTO `zp_user` (`id`, `username`, `password`, `firstname`, `lastname`, `phone`, `profileId`, `lastlogin`, `status`, `expires`, `role`, `session`, `sessiontime`, `wage`, `hours`, `description`, `clientId`, `notifications`, `pwReset`, `pwResetExpiration`, `pwResetCount`, `forcePwReset`, `lastpwd_change`, `settings`, `twoFAEnabled`, `twoFASecret`, `createdOn`, `source`, `jobTitle`, `jobLevel`, `department`, `modified`) VALUES (1,'admin@example.com','$2y$10$1/bygAzY8n873wSfRPA47.2J4wUzP3h1n2DQwUVe6lqKt1KvTwCka','Admin','Jensen','','','2024-03-16 21:56:49','a',NULL,'50','dad35c2ee1a6c80f07cb229923996abbfd3409ae-d8a6a963c127d27ad57ab4ee07a5d09efbc186cf','1710626209',0,0,NULL,0,1,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','a:1:{s:6:\"modals\";a:7:{s:17:\"homeDashboardTour\";i:1;s:12:\"showProjects\";s:1:\"1\";s:12:\"mytimesheets\";s:1:\"1\";s:6:\"kanban\";s:1:\"1\";s:20:\"projectDashboardTour\";i:1;s:9:\"dashboard\";s:1:\"1\";s:16:\"projectDashboard\";s:1:\"1\";}}',0,NULL,'2024-03-16 11:03:55',NULL,NULL,NULL,NULL,'2024-03-16 13:36:07');
INSERT INTO `zp_user` (`id`, `username`, `password`, `firstname`, `lastname`, `phone`, `profileId`, `lastlogin`, `status`, `expires`, `role`, `session`, `sessiontime`, `wage`, `hours`, `description`, `clientId`, `notifications`, `pwReset`, `pwResetExpiration`, `pwResetCount`, `forcePwReset`, `lastpwd_change`, `settings`, `twoFAEnabled`, `twoFASecret`, `createdOn`, `source`, `jobTitle`, `jobLevel`, `department`, `modified`) VALUES (2,'PWHdzymA1ww23qUjxxvFvNKYLbQn5ul5','$2y$10$R5JM.0ZcEkBKGBUi4ocG0uH1TP773AYOI.V.AMFf/toYRlbjKhO7m','itk-support','','','','2024-03-16 22:20:34','a',NULL,'20','f5c99df4e5d6d895191b4e2ffe7e1810f0988a3a-8005fcad7f769a8dbfdb6056bb430ff19a26213d','1710627634',NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'2024-03-16 04:04:39','api','','','','2024-03-16 04:04:39');
/*!40000 ALTER TABLE `zp_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-16 23:05:32
