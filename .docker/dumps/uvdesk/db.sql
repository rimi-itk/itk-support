-- MariaDB dump 10.19-11.3.2-MariaDB, for osx10.19 (x86_64)
--
-- Host: 0.0.0.0    Database: db
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
-- Table structure for table `agent_activity`
--

DROP TABLE IF EXISTS `agent_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `agent_name` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `thread_type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9AA510CE3414710B` (`agent_id`),
  KEY `IDX_9AA510CE700047D2` (`ticket_id`),
  CONSTRAINT `FK_9AA510CE3414710B` FOREIGN KEY (`agent_id`) REFERENCES `uv_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9AA510CE700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `uv_ticket` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_activity`
--

LOCK TABLES `agent_activity` WRITE;
/*!40000 ALTER TABLE `agent_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `promo_text` varchar(255) NOT NULL,
  `promo_tag` varchar(255) NOT NULL,
  `tag_color` varchar(255) DEFAULT NULL,
  `link_text` varchar(255) NOT NULL,
  `link_url` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4DB9D91CFE54D947` (`group_id`),
  CONSTRAINT `FK_4DB9D91CFE54D947` FOREIGN KEY (`group_id`) REFERENCES `uv_support_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration_versions` (
  `version` varchar(14) NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_versions`
--

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` VALUES
('20240308123921','2024-03-15 22:48:18'),
('20240308125534','2024-03-15 22:48:18'),
('20240308125633','2024-03-15 22:48:18'),
('20240308125754','2024-03-15 22:48:18'),
('20240315224819','2024-03-15 22:48:28');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recaptcha`
--

DROP TABLE IF EXISTS `recaptcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recaptcha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_key` varchar(255) DEFAULT NULL,
  `secret_key` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recaptcha`
--

LOCK TABLES `recaptcha` WRITE;
/*!40000 ALTER TABLE `recaptcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `recaptcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_admin_support_groups`
--

DROP TABLE IF EXISTS `uv_admin_support_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_admin_support_groups` (
  `adminUserInstanceId` int(11) NOT NULL,
  `supportGroupId` int(11) NOT NULL,
  PRIMARY KEY (`adminUserInstanceId`,`supportGroupId`),
  KEY `IDX_215FF93837B7A2F1` (`adminUserInstanceId`),
  KEY `IDX_215FF93853F5B65F` (`supportGroupId`),
  CONSTRAINT `FK_215FF93837B7A2F1` FOREIGN KEY (`adminUserInstanceId`) REFERENCES `uv_user_instance` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_215FF93853F5B65F` FOREIGN KEY (`supportGroupId`) REFERENCES `uv_support_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_admin_support_groups`
--

LOCK TABLES `uv_admin_support_groups` WRITE;
/*!40000 ALTER TABLE `uv_admin_support_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_admin_support_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_api_access_credentials`
--

DROP TABLE IF EXISTS `uv_api_access_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_api_access_credentials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `is_expired` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `IDX_31DBD20EA76ED395` (`user_id`),
  CONSTRAINT `FK_31DBD20EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_api_access_credentials`
--

LOCK TABLES `uv_api_access_credentials` WRITE;
/*!40000 ALTER TABLE `uv_api_access_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_api_access_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_article`
--

DROP TABLE IF EXISTS `uv_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` longtext NOT NULL,
  `meta_description` text DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `viewed` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `stared` int(11) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search_idx` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_article`
--

LOCK TABLES `uv_article` WRITE;
/*!40000 ALTER TABLE `uv_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_article_category`
--

DROP TABLE IF EXISTS `uv_article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_article_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_article_category`
--

LOCK TABLES `uv_article_category` WRITE;
/*!40000 ALTER TABLE `uv_article_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_article_feedback`
--

DROP TABLE IF EXISTS `uv_article_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_article_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_helpful` tinyint(1) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BCB7F9147294869C` (`article_id`),
  KEY `IDX_BCB7F914A76ED395` (`user_id`),
  CONSTRAINT `FK_BCB7F9147294869C` FOREIGN KEY (`article_id`) REFERENCES `uv_article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BCB7F914A76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_article_feedback`
--

LOCK TABLES `uv_article_feedback` WRITE;
/*!40000 ALTER TABLE `uv_article_feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_article_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_article_history`
--

DROP TABLE IF EXISTS `uv_article_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_article_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_article_history`
--

LOCK TABLES `uv_article_history` WRITE;
/*!40000 ALTER TABLE `uv_article_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_article_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_article_tags`
--

DROP TABLE IF EXISTS `uv_article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_article_tags`
--

LOCK TABLES `uv_article_tags` WRITE;
/*!40000 ALTER TABLE `uv_article_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_article_view_log`
--

DROP TABLE IF EXISTS `uv_article_view_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_article_view_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `viewed_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8F76FF11A76ED395` (`user_id`),
  KEY `IDX_8F76FF117294869C` (`article_id`),
  CONSTRAINT `FK_8F76FF117294869C` FOREIGN KEY (`article_id`) REFERENCES `uv_article` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8F76FF11A76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_article_view_log`
--

LOCK TABLES `uv_article_view_log` WRITE;
/*!40000 ALTER TABLE `uv_article_view_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_article_view_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_email_templates`
--

DROP TABLE IF EXISTS `uv_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_email_templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `message` longtext NOT NULL,
  `template_type` varchar(255) DEFAULT NULL,
  `is_predefined` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `IDX_784A0D85A76ED395` (`user_id`),
  CONSTRAINT `FK_784A0D85A76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user_instance` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_email_templates`
--

LOCK TABLES `uv_email_templates` WRITE;
/*!40000 ALTER TABLE `uv_email_templates` DISABLE KEYS */;
INSERT INTO `uv_email_templates` VALUES
(1,NULL,'User Forgot Password','Update your {%global.companyName%} helpdesk password','    <p></p>\n    <p></p>\n    <p></p>\n    <p></p>\n    <p style=\"text-align: center; \">{%global.companyLogo%}</p>\n    <p style=\"text-align: center; \">\n        <br />\n    </p>\n    <p>Hi&nbsp;{%user.userName%},\n        <br />\n    </p>\n    <p>\n        <br />\n    </p>\n    <p>You recently requested to reset your password for your {%global.companyName%} account. Click the link to reset it&nbsp;{%user.forgotPasswordLink%}</p>\n    <p>\n        <br />\n    </p>\n    <p>If you did not request a password reset, please ignore this mail or revert back to let us know.</p>\n    <div>\n        <br />\n    </div>\n    <p>Thanks and Regards</p>\n    <p>{%global.companyName%}</p>\n    <p></p>\n    <p></p>','user',1),
(2,NULL,'Agent Reply To The Customer\'s ticket','New Reply Added on ticket #{% ticket.id %}','    <p></p>\n    <p></p>\n    <p></p>\n    <p></p>\n    <p style=\"text-align: center\">{%global.companyLogo%}</p>\n    <p style=\"text-align: center\">\n        <br>\n    </p>\n    <p style=\"text-align: center\">\n        <span style=\"font-size: 18px\">\n            <b style=\"font-weight:bold\">New Response!!</b>\n        </span>\n    </p>\n    <span style=\"font-size: 18px\">\n        <b style=\"font-weight:bold\"> </b>\n    </span>\n    <p>\n        <br>\n    </p>\n    <p></p>\n    <p></p> Hello {%ticket.customerName%},\n    <p></p>\n    <p></p>\n    <p>\n        <span style=\"line-height: 1.42857\">\n            <br>\n        </span>\n    </p>\n    <p>\n        <span style=\"line-height: 1.42857\">A reply has been added by the </span>{%ticket.agentName%} on your ticket {%ticket.id%}. Kindly follow this link {%ticket.customerLink%}\n        to get the insight of the message.\n        <span style=\"line-height: 1.42857\"> </span>\n    </p>\n    <p>\n        <span style=\"line-height: 1.42857\">\n            <br>\n        </span>\n    </p>\n    <p>\n        <span style=\"line-height: 1.42857\">Here go the ticket message:</span>\n    </p>\n    <p>{%ticket.threadMessage%}{%ticket.attachments%}\n        <br>\n    </p>\n    <p></p>\n    <p></p>\n    <p>\n        <br>\n    </p>\n    <p></p>\n    <p>Thanks and Regards</p>\n    <p>{%global.companyName%}\n        <br>\n    </p>\n    <br>\n    <p></p>\n    <p></p>\n    <p></p>\n    <p></p>\n    <p></p>','ticket',1),
(3,NULL,'Ticket generated by customer','A new ticket #{%ticket.id%} has been generated by {%ticket.customerName%}','<p></p>\n<p></p>\n<p style=\"text-align: center; \">{%global.companyLogo%}</p>\n<p style=\"text-align: center; \">\n    <br />\n</p>\n<p style=\"text-align: center; \">\n    <b>\n        <span style=\"font-size: 18px;\">Ticket generated!!</span>\n    </b>\n</p>\n<br />Hello {%ticket.agentName%},\n<p></p>\n<p>\n    <br />\n</p>\n<p>A new ticket {%ticket.id%} has been generated by {%ticket.customerName%} from the id {%ticket.customerEmail%}. Hit on the link provided so that you can have the access to the ticket {%ticket.agentLink%}.</p>\n<p>\n    <br />\n</p>\n<p>Here goes the ticket message:</p>\n<p>{%ticket.threadMessage%}\n   {%ticket.attachments%}\n    <br />\n</p>\n<p>\n    <br />\n</p>\n<p>\n    <br />\n</p> Thanks and Regards\n<p></p>\n<p>{%global.companyName%}\n    <br />\n</p>\n<p></p>\n<p></p>','ticket',1),
(4,NULL,'Agent Account Created','Welcome to {%global.companyName%} Helpdesk Support System','    <p></p>\n    <p></p>\n    <p></p>\n    <p style=\"text-align: center; \">{%global.companyLogo%}</p>\n    <p style=\"text-align: center; \">\n        <span style=\"font-size: 18px;\">\n            <b>Thank you for joining!!</b>\n        </span>\n    </p>\n    <p style=\"text-align: center; \">\n        <i>\n            <br />\n        </i>\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">Hello&nbsp;{%user.userName%},</p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">\n        <br />\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">Your account has been successfully created.</p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\"\n        align=\"left\">\n        <br />\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">\n        <span style=\"line-height: 100%;\">Click on the link to set your password </span>{%user.accountValidationLink%}\n        <span style=\"line-height: 100%;\">&nbsp;and get started with the </span>{%global.companyName%}\n        <span style=\"line-height: 100%;\">&nbsp;services.</span>\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">\n        <span style=\"line-height: 100%;\">\n            <br />\n        </span>\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">Thanks and Regards\n        <br />\n    </p>\n    <p>{%global.companyName%}</p>\n    <p>\n        <br />\n    </p>\n    <p></p>','user',1),
(5,NULL,'Ticket Assign','Ticket #{% ticket.id %} assign to you','    <p></p>\n    <p style=\"text-align: center;\">{%global.companyLogo%}</p>\n    <p style=\"text-align: center;\">\n        <br />\n    </p>\n    <p style=\"text-align: center;\">\n        <b>\n            <span style=\"font-size: 18px;\">Ticket assigned- Get ready!!</span>\n        </b>\n    </p>\n    <p style=\"text-align: center; \">\n        <br />\n    </p> Hello&nbsp;{%ticket.agentName%},\n    <br />\n    <br />\n    <p></p>\n    <p>A ticket&nbsp;{%ticket.id%} has been assigned to you. You are requested to follow this link&nbsp;{%ticket.agentLink%} to get the\n        access of the ticket.</p>\n    <p>\n        <br />\n    </p>\n    <p>Here go the ticket message:</p>\n    <p>{%ticket.message%}\n        <br />\n    </p>\n    <p>\n        <br />\n    </p>\n    <p>Thanks and Regards</p>\n    <p>{%global.companyName%}\n        <br />\n    </p>\n    <p></p>\n    <p>\n        <br />\n    </p>\n    <p></p>\n    <p>\n        <br />\n    </p>\n    <p></p>\n    <p></p>\n    <p></p>\n    <p></p>','ticket',1),
(6,NULL,'Customer Reply To The Agent','Customer Reply Ticket #{% ticket.id %}','    <p></p>\n    <p></p>\n    <p style=\"text-align: center; \">{%global.companyLogo%}</p>\n    <p style=\"text-align: center; \">\n        <br />\n    </p>\n    <p style=\"text-align: center; \">\n        <b>\n            <span style=\"font-size: 18px;\">New Response!!</span>\n        </b>\n    </p>\n    <p style=\"text-align: center; \">\n        <b>\n            <span style=\"font-size: 18px;\">\n                <br />\n            </span>\n        </b>\n    </p> Hello {%ticket.agentName%},</p>\n    <p></p>\n    <p>\n        <br />\n    </p>\n    <p></p>\n    <p></p>\n    <p>\n        <span style=\"line-height: 1.42857143;\">New reply have been added to ticket #{%ticket.id%} you can login to ticket system through this link&nbsp;{%ticket.agentLink%}.</span>\n    </p>\n    <p>\n        <span style=\"line-height: 1.42857143;\">&nbsp;</span>\n    </p>\n    <p>\n        <span style=\"line-height: 1.42857143;\">Customer reply:\n            <br />\n        </span>{%ticket.threadMessage%}{%ticket.attachments%}</p>\n    <p>\n        <br />\n    </p>\n    <p>Thanks and Regards</p>\n    <p>{%global.companyName%}\n        <br />\n    </p>\n    <p>\n        <br />\n    </p>\n    <p></p>','ticket',1),
(7,NULL,'Ticket generated success mail to customer','New ticket #{% ticket.id %} Received','<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p style=\"text-align: center;\">{%global.companyLogo%}</p>\n<p style=\"text-align: center;\">\n    <br />\n</p>\n<p style=\"text-align: center;\">\n    <b>\n        <span style=\"font-size: 18px;\">Ticket generated!!</span>\n    </b>\n</p>\n<p style=\"text-align: center; \">\n    <br />\n</p>\n<br />\n<p></p>\n<p>Hello&nbsp;{%ticket.customerName%},</p>\n<p>\n    <br />\n</p>\n<p></p>\n<p>Thank you so much for taking the time to connect us!</p>\n<p>\n    <br />\n</p>\n<p>Your ticket #{%ticket.id%} has been received. You can check ticket through this link {%ticket.customerLink%} and you can also reply via this email.</p>\n<p>\n<p>\n    <br />\n</p>\n<p>Our support staff will get back to you shortly (it might take a bit longer on evenings and weekends). Feel free to ask for any support request we will be happy to help.</p>\n<p>\n<span style=\"line-height: 1.42857143;\">\n</p>\n<p>Here go the ticket message:</p>\n<p>{%ticket.threadMessage%}\n   {%ticket.attachments%}\n    <br />\n</p>\n<p>\n    <br />\n</p>\n<p>Thanks and Regards</p>\n<p>{%global.companyName%}\n    <br />\n</p>\n<br />\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>\n<p></p>','ticket',1),
(8,NULL,'Customer Account Created','Welcome to {%global.companyName%} Helpdesk','    <p></p>\n    <p></p>\n    <p></p>\n    <p style=\"text-align: center; \">{%global.companyLogo%}</p>\n    <p style=\"text-align: center; \">\n        <br />\n    </p>\n    <p style=\"text-align: center; \">\n        <span style=\"font-size: 18px;\">\n            <b>Thank you for joining!!</b>\n        </span>\n    </p>\n    <p style=\"text-align: center; \">\n        <i>\n            <br />\n        </i>\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">Hello&nbsp;{%user.userName%},</p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">\n        <br />\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">Your account has been successfully created. We welcome&nbsp;you to the community of&nbsp;{%global.companyName%}.</p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\"\n        align=\"left\">\n        <br />\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">It is our privilege to have you as our customer. We are pretty much sure that you will love the fact that how simple it is\n        to get started with the services. We are dedicated to making your working life simpler.</p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\"\n        align=\"left\">\n        <br />\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">\n        <span style=\"line-height: 100%;\">Click on the link to set your password </span>{%user.accountValidationLink%}\n        <span style=\"line-height: 100%;\">&nbsp;and get started with the </span>{%global.companyName%}\n        <span style=\"line-height: 100%;\">&nbsp;services.</span>\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">\n        <span style=\"line-height: 100%;\">\n            <br />\n        </span>\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">Hoping that you will enjoy this experience.</p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">\n        <br />\n    </p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%\" align=\"left\">Thanks and Regards\n        <br />\n    </p>\n    <p>{%global.companyName%}</p>\n    <p>\n        <br />\n    </p>\n    <p></p>','user',1),
(9,NULL,'Collaborator added to ticket','A new Collaborator have been added','    <p>&nbsp;</p>\n    <p>&nbsp;</p>\n    <p>&nbsp;</p>\n    <p style=\"text-align: center;\">{%global.companyLogo%}</p>\n    <p style=\"text-align: center;\">&nbsp;</p>\n    <p style=\"text-align: center;\"><span style=\"font-size: 18px;\"> <strong>Thank you for joining!!</strong> </span></p>\n    <p style=\"text-align: center;\"><em> <br /> </em></p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%;\" align=\"left\">Hello {%ticket.collaboratorName%},</p>\n    <p style=\"margin-bottom: 0cm; line-height: 100%;\" align=\"left\">&nbsp;</p>\n    <p>&nbsp;</p>\n    <p>Collaborator of the ticket #{%ticket.id%} has added a reply. You can check the ticket from here {%ticket.customerLink%}</p>\n    <p>&nbsp;</p>\n    <p>Here go the message:</p>\n    <p>{%ticket.threadMessage%}</p>\n    <p>&nbsp;</p>\n    <p>Thanks and Regards</p>\n    <p>{%global.companyName%}</p>\n    <p>&nbsp;</p>\n    <p>&nbsp;</p>\n    <p>&nbsp;</p>','ticket',1),
(10,NULL,'Collaborator Reply To The Agent','Collaborator Reply Ticket #{% ticket.id %}','    <p>&nbsp;</p>\n    <p>&nbsp;</p>\n    <p style=\"text-align: center;\">{%global.companyLogo%}</p>\n    <p style=\"text-align: center;\">&nbsp;</p>\n    <p style=\"text-align: center;\"><strong> <span style=\"font-size: 18px;\">New Response!!</span> </strong></p>\n    <p style=\"text-align: center;\"><strong> <span style=\"font-size: 18px;\"> <br /> </span> </strong></p>\n    <p>Hello {%ticket.agentName%},</p>\n    <p>&nbsp;</p>\n    <p>Collaborator of the ticket #{%ticket.id%} has added a reply. You can check the ticket from here&nbsp;{%ticket.agentLink%}.</p>\n    <p>&nbsp;</p>\n    <p>Here go the message:</p>\n    <p>{%ticket.threadMessage%}{%ticket.attachments%}</p>\n    <p>&nbsp;</p>\n    <p>Thanks and Regards</p>\n    <p>{%global.companyName%}</p>\n    <p>&nbsp;</p>','ticket',1),
(11,NULL,'Collaborator Reply To The Customer','Collaborator Reply Ticket #{% ticket.id %}','    <p>&nbsp;</p>\n    <p>&nbsp;</p>\n    <p style=\"text-align: center;\">{%global.companyLogo%}</p>\n    <p style=\"text-align: center;\">&nbsp;</p>\n    <p style=\"text-align: center;\"><strong> <span style=\"font-size: 18px;\">New Response!!</span> </strong></p>\n    <p style=\"text-align: center;\"><strong> <span style=\"font-size: 18px;\"> <br /> </span> </strong></p>\n    <p>Hello {%ticket.agentName%},</p>\n    <p>&nbsp;</p>\n    <p>Collaborator of the ticket #{%ticket.id%} has added a reply. You can check the ticket from here&nbsp;{%ticket.customerLink%}.</p>\n    <p>&nbsp;</p>\n    <p>Here go the message:</p>\n    <p>{%ticket.threadMessage%}{%ticket.attachments%}</p>\n    <p>&nbsp;</p>\n    <p>Thanks and Regards</p>\n    <p>{%global.companyName%}</p>\n    <p>&nbsp;</p>','ticket',1);
/*!40000 ALTER TABLE `uv_email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_lead_support_teams`
--

DROP TABLE IF EXISTS `uv_lead_support_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_lead_support_teams` (
  `leadUserInstanceId` int(11) NOT NULL,
  `supportTeamId` int(11) NOT NULL,
  PRIMARY KEY (`leadUserInstanceId`,`supportTeamId`),
  KEY `IDX_8B5F844DD397BD7C` (`leadUserInstanceId`),
  KEY `IDX_8B5F844DA77C7023` (`supportTeamId`),
  CONSTRAINT `FK_8B5F844DA77C7023` FOREIGN KEY (`supportTeamId`) REFERENCES `uv_support_team` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8B5F844DD397BD7C` FOREIGN KEY (`leadUserInstanceId`) REFERENCES `uv_user_instance` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_lead_support_teams`
--

LOCK TABLES `uv_lead_support_teams` WRITE;
/*!40000 ALTER TABLE `uv_lead_support_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_lead_support_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_prepared_response_support_groups`
--

DROP TABLE IF EXISTS `uv_prepared_response_support_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_prepared_response_support_groups` (
  `group_id` int(11) NOT NULL,
  `savedReply_id` int(11) NOT NULL,
  PRIMARY KEY (`savedReply_id`,`group_id`),
  KEY `IDX_A22590198D3102C3` (`savedReply_id`),
  KEY `IDX_A2259019FE54D947` (`group_id`),
  CONSTRAINT `FK_A22590198D3102C3` FOREIGN KEY (`savedReply_id`) REFERENCES `uv_prepared_responses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A2259019FE54D947` FOREIGN KEY (`group_id`) REFERENCES `uv_support_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_prepared_response_support_groups`
--

LOCK TABLES `uv_prepared_response_support_groups` WRITE;
/*!40000 ALTER TABLE `uv_prepared_response_support_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_prepared_response_support_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_prepared_response_support_teams`
--

DROP TABLE IF EXISTS `uv_prepared_response_support_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_prepared_response_support_teams` (
  `subgroup_id` int(11) NOT NULL,
  `savedReply_id` int(11) NOT NULL,
  PRIMARY KEY (`savedReply_id`,`subgroup_id`),
  KEY `IDX_B6897DEB8D3102C3` (`savedReply_id`),
  KEY `IDX_B6897DEBF5C464CE` (`subgroup_id`),
  CONSTRAINT `FK_B6897DEB8D3102C3` FOREIGN KEY (`savedReply_id`) REFERENCES `uv_prepared_responses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B6897DEBF5C464CE` FOREIGN KEY (`subgroup_id`) REFERENCES `uv_support_team` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_prepared_response_support_teams`
--

LOCK TABLES `uv_prepared_response_support_teams` WRITE;
/*!40000 ALTER TABLE `uv_prepared_response_support_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_prepared_response_support_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_prepared_responses`
--

DROP TABLE IF EXISTS `uv_prepared_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_prepared_responses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT 'public',
  `actions` longtext NOT NULL COMMENT '(DC2Type:array)',
  `status` tinyint(1) DEFAULT 1,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8AB5F066A76ED395` (`user_id`),
  CONSTRAINT `FK_8AB5F066A76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user_instance` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_prepared_responses`
--

LOCK TABLES `uv_prepared_responses` WRITE;
/*!40000 ALTER TABLE `uv_prepared_responses` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_prepared_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_related_articles`
--

DROP TABLE IF EXISTS `uv_related_articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_related_articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `related_article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_related_articles`
--

LOCK TABLES `uv_related_articles` WRITE;
/*!40000 ALTER TABLE `uv_related_articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_related_articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_saved_filters`
--

DROP TABLE IF EXISTS `uv_saved_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_saved_filters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `filtering` longtext DEFAULT NULL,
  `route` varchar(190) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E1BFBAF7A76ED395` (`user_id`),
  CONSTRAINT `FK_E1BFBAF7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user_instance` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_saved_filters`
--

LOCK TABLES `uv_saved_filters` WRITE;
/*!40000 ALTER TABLE `uv_saved_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_saved_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_saved_replies`
--

DROP TABLE IF EXISTS `uv_saved_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_saved_replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` longtext NOT NULL,
  `template_id` int(11) DEFAULT NULL,
  `is_predefind` tinyint(1) DEFAULT 1,
  `message_inline` longtext DEFAULT NULL,
  `template_for` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_39C8BA50A76ED395` (`user_id`),
  CONSTRAINT `FK_39C8BA50A76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user_instance` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_saved_replies`
--

LOCK TABLES `uv_saved_replies` WRITE;
/*!40000 ALTER TABLE `uv_saved_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_saved_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_saved_replies_groups`
--

DROP TABLE IF EXISTS `uv_saved_replies_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_saved_replies_groups` (
  `group_id` int(11) NOT NULL,
  `savedReply_id` int(11) NOT NULL,
  PRIMARY KEY (`savedReply_id`,`group_id`),
  KEY `IDX_C59C13668D3102C3` (`savedReply_id`),
  KEY `IDX_C59C1366FE54D947` (`group_id`),
  CONSTRAINT `FK_C59C13668D3102C3` FOREIGN KEY (`savedReply_id`) REFERENCES `uv_saved_replies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C59C1366FE54D947` FOREIGN KEY (`group_id`) REFERENCES `uv_support_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_saved_replies_groups`
--

LOCK TABLES `uv_saved_replies_groups` WRITE;
/*!40000 ALTER TABLE `uv_saved_replies_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_saved_replies_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_saved_replies_teams`
--

DROP TABLE IF EXISTS `uv_saved_replies_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_saved_replies_teams` (
  `subgroup_id` int(11) NOT NULL,
  `savedReply_id` int(11) NOT NULL,
  PRIMARY KEY (`savedReply_id`,`subgroup_id`),
  KEY `IDX_D240CE708D3102C3` (`savedReply_id`),
  KEY `IDX_D240CE70F5C464CE` (`subgroup_id`),
  CONSTRAINT `FK_D240CE708D3102C3` FOREIGN KEY (`savedReply_id`) REFERENCES `uv_saved_replies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_D240CE70F5C464CE` FOREIGN KEY (`subgroup_id`) REFERENCES `uv_support_team` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_saved_replies_teams`
--

LOCK TABLES `uv_saved_replies_teams` WRITE;
/*!40000 ALTER TABLE `uv_saved_replies_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_saved_replies_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_solution_category`
--

DROP TABLE IF EXISTS `uv_solution_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_solution_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 1,
  `sorting` varchar(255) DEFAULT 'ascending',
  `date_added` datetime NOT NULL,
  `status` int(11) DEFAULT 0,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_solution_category`
--

LOCK TABLES `uv_solution_category` WRITE;
/*!40000 ALTER TABLE `uv_solution_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_solution_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_solution_category_mapping`
--

DROP TABLE IF EXISTS `uv_solution_category_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_solution_category_mapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `solution_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_solution_category_mapping`
--

LOCK TABLES `uv_solution_category_mapping` WRITE;
/*!40000 ALTER TABLE `uv_solution_category_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_solution_category_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_solutions`
--

DROP TABLE IF EXISTS `uv_solutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_solutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `visibility` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 5,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `solution_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_solutions`
--

LOCK TABLES `uv_solutions` WRITE;
/*!40000 ALTER TABLE `uv_solutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_solutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_support_group`
--

DROP TABLE IF EXISTS `uv_support_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_support_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `user_view` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_support_group`
--

LOCK TABLES `uv_support_group` WRITE;
/*!40000 ALTER TABLE `uv_support_group` DISABLE KEYS */;
INSERT INTO `uv_support_group` VALUES
(1,'Default','Account Owner','2024-03-15 23:48:29',1,0);
/*!40000 ALTER TABLE `uv_support_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_support_groups_teams`
--

DROP TABLE IF EXISTS `uv_support_groups_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_support_groups_teams` (
  `supportGroup_id` int(11) NOT NULL,
  `supportTeam_id` int(11) NOT NULL,
  PRIMARY KEY (`supportGroup_id`,`supportTeam_id`),
  KEY `IDX_761A315DCE5F5290` (`supportGroup_id`),
  KEY `IDX_761A315D9718E641` (`supportTeam_id`),
  CONSTRAINT `FK_761A315D9718E641` FOREIGN KEY (`supportTeam_id`) REFERENCES `uv_support_team` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_761A315DCE5F5290` FOREIGN KEY (`supportGroup_id`) REFERENCES `uv_support_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_support_groups_teams`
--

LOCK TABLES `uv_support_groups_teams` WRITE;
/*!40000 ALTER TABLE `uv_support_groups_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_support_groups_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_support_label`
--

DROP TABLE IF EXISTS `uv_support_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_support_label` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `color_code` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EFD454DDA76ED395` (`user_id`),
  CONSTRAINT `FK_EFD454DDA76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_support_label`
--

LOCK TABLES `uv_support_label` WRITE;
/*!40000 ALTER TABLE `uv_support_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_support_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_support_privilege`
--

DROP TABLE IF EXISTS `uv_support_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_support_privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `privileges` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_support_privilege`
--

LOCK TABLES `uv_support_privilege` WRITE;
/*!40000 ALTER TABLE `uv_support_privilege` DISABLE KEYS */;
INSERT INTO `uv_support_privilege` VALUES
(1,'Default Privileges','Default Privileges','a:1:{i:0;s:19:\"ROLE_AGENT_ADD_NOTE\";}','2024-03-15 23:48:29');
/*!40000 ALTER TABLE `uv_support_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_support_role`
--

DROP TABLE IF EXISTS `uv_support_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_support_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2AF5A72177153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_support_role`
--

LOCK TABLES `uv_support_role` WRITE;
/*!40000 ALTER TABLE `uv_support_role` DISABLE KEYS */;
INSERT INTO `uv_support_role` VALUES
(1,'ROLE_SUPER_ADMIN','Account Owner'),
(2,'ROLE_ADMIN','Administrator'),
(3,'ROLE_AGENT','Agent'),
(4,'ROLE_CUSTOMER','Customer');
/*!40000 ALTER TABLE `uv_support_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_support_team`
--

DROP TABLE IF EXISTS `uv_support_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_support_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_support_team`
--

LOCK TABLES `uv_support_team` WRITE;
/*!40000 ALTER TABLE `uv_support_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_support_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_tag`
--

DROP TABLE IF EXISTS `uv_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_tag`
--

LOCK TABLES `uv_tag` WRITE;
/*!40000 ALTER TABLE `uv_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_thread`
--

DROP TABLE IF EXISTS `uv_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_thread` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `source` varchar(191) NOT NULL,
  `message_id` longtext DEFAULT NULL,
  `thread_type` varchar(191) NOT NULL,
  `created_by` varchar(191) NOT NULL,
  `cc` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `bcc` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `reply_to` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `delivery_status` varchar(255) DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `is_bookmarked` tinyint(1) NOT NULL DEFAULT 0,
  `message` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `agent_viewed_at` datetime DEFAULT NULL,
  `customer_viewed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_637D7E5D700047D2` (`ticket_id`),
  KEY `IDX_637D7E5DA76ED395` (`user_id`),
  CONSTRAINT `FK_637D7E5D700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `uv_ticket` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_637D7E5DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_thread`
--

LOCK TABLES `uv_thread` WRITE;
/*!40000 ALTER TABLE `uv_thread` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_ticket`
--

DROP TABLE IF EXISTS `uv_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` int(11) DEFAULT NULL,
  `priority_id` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `agent_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `source` varchar(191) NOT NULL,
  `mailbox_email` varchar(191) DEFAULT NULL,
  `subject` longtext DEFAULT NULL,
  `reference_ids` longtext DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL DEFAULT 1,
  `is_replied` tinyint(1) NOT NULL DEFAULT 0,
  `is_reply_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `is_starred` tinyint(1) NOT NULL DEFAULT 0,
  `is_trashed` tinyint(1) NOT NULL DEFAULT 0,
  `is_agent_viewed` tinyint(1) NOT NULL DEFAULT 0,
  `is_customer_viewed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `subGroup_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C5FD9F7D6BF700BD` (`status_id`),
  KEY `IDX_C5FD9F7D497B19F9` (`priority_id`),
  KEY `IDX_C5FD9F7DC54C8C93` (`type_id`),
  KEY `IDX_C5FD9F7D9395C3F3` (`customer_id`),
  KEY `IDX_C5FD9F7D3414710B` (`agent_id`),
  KEY `IDX_C5FD9F7DFE54D947` (`group_id`),
  KEY `IDX_C5FD9F7DCB20698` (`subGroup_id`),
  CONSTRAINT `FK_C5FD9F7D3414710B` FOREIGN KEY (`agent_id`) REFERENCES `uv_user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_C5FD9F7D497B19F9` FOREIGN KEY (`priority_id`) REFERENCES `uv_ticket_priority` (`id`),
  CONSTRAINT `FK_C5FD9F7D6BF700BD` FOREIGN KEY (`status_id`) REFERENCES `uv_ticket_status` (`id`),
  CONSTRAINT `FK_C5FD9F7D9395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `uv_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_C5FD9F7DC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `uv_ticket_type` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_C5FD9F7DCB20698` FOREIGN KEY (`subGroup_id`) REFERENCES `uv_support_team` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_C5FD9F7DFE54D947` FOREIGN KEY (`group_id`) REFERENCES `uv_support_group` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_ticket`
--

LOCK TABLES `uv_ticket` WRITE;
/*!40000 ALTER TABLE `uv_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_ticket_attachments`
--

DROP TABLE IF EXISTS `uv_ticket_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_ticket_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `path` longtext DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `content_id` varchar(255) DEFAULT NULL,
  `file_system` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FE918C8EE2904019` (`thread_id`),
  CONSTRAINT `FK_FE918C8EE2904019` FOREIGN KEY (`thread_id`) REFERENCES `uv_thread` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_ticket_attachments`
--

LOCK TABLES `uv_ticket_attachments` WRITE;
/*!40000 ALTER TABLE `uv_ticket_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_ticket_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_ticket_priority`
--

DROP TABLE IF EXISTS `uv_ticket_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_ticket_priority` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `color_code` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_FFA6CF8677153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_ticket_priority`
--

LOCK TABLES `uv_ticket_priority` WRITE;
/*!40000 ALTER TABLE `uv_ticket_priority` DISABLE KEYS */;
INSERT INTO `uv_ticket_priority` VALUES
(1,'low','Low','#2DD051'),
(2,'medium','Medium','#F5D02A'),
(3,'high','High','#FA8B3C'),
(4,'urgent','Urgent','#FF6565');
/*!40000 ALTER TABLE `uv_ticket_priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_ticket_rating`
--

DROP TABLE IF EXISTS `uv_ticket_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_ticket_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `stars` int(11) NOT NULL DEFAULT 0,
  `feedback` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B1025E04700047D2` (`ticket_id`),
  KEY `IDX_B1025E04A76ED395` (`user_id`),
  CONSTRAINT `FK_B1025E04700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `uv_ticket` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B1025E04A76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_ticket_rating`
--

LOCK TABLES `uv_ticket_rating` WRITE;
/*!40000 ALTER TABLE `uv_ticket_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_ticket_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_ticket_status`
--

DROP TABLE IF EXISTS `uv_ticket_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_ticket_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `color_code` varchar(191) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_128B1D3A77153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_ticket_status`
--

LOCK TABLES `uv_ticket_status` WRITE;
/*!40000 ALTER TABLE `uv_ticket_status` DISABLE KEYS */;
INSERT INTO `uv_ticket_status` VALUES
(1,'open','Open','#7E91F0',1),
(2,'pending','Pending','#FF6A6B',2),
(3,'answered','Answered','#FFDE00',3),
(4,'resolved','Resolved','#2CD651',4),
(5,'closed','Closed','#767676',5),
(6,'spam','Spam','#00A1F2',6);
/*!40000 ALTER TABLE `uv_ticket_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_ticket_type`
--

DROP TABLE IF EXISTS `uv_ticket_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_ticket_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_3E0B313677153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_ticket_type`
--

LOCK TABLES `uv_ticket_type` WRITE;
/*!40000 ALTER TABLE `uv_ticket_type` DISABLE KEYS */;
INSERT INTO `uv_ticket_type` VALUES
(1,'support','Support',1);
/*!40000 ALTER TABLE `uv_ticket_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_tickets_collaborators`
--

DROP TABLE IF EXISTS `uv_tickets_collaborators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_tickets_collaborators` (
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`ticket_id`,`user_id`),
  KEY `IDX_20764CBA700047D2` (`ticket_id`),
  KEY `IDX_20764CBAA76ED395` (`user_id`),
  CONSTRAINT `FK_20764CBA700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `uv_ticket` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_20764CBAA76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_tickets_collaborators`
--

LOCK TABLES `uv_tickets_collaborators` WRITE;
/*!40000 ALTER TABLE `uv_tickets_collaborators` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_tickets_collaborators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_tickets_labels`
--

DROP TABLE IF EXISTS `uv_tickets_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_tickets_labels` (
  `ticket_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  PRIMARY KEY (`ticket_id`,`label_id`),
  KEY `IDX_305F9C0E700047D2` (`ticket_id`),
  KEY `IDX_305F9C0E33B92F39` (`label_id`),
  CONSTRAINT `FK_305F9C0E33B92F39` FOREIGN KEY (`label_id`) REFERENCES `uv_support_label` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_305F9C0E700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `uv_ticket` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_tickets_labels`
--

LOCK TABLES `uv_tickets_labels` WRITE;
/*!40000 ALTER TABLE `uv_tickets_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_tickets_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_tickets_tags`
--

DROP TABLE IF EXISTS `uv_tickets_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_tickets_tags` (
  `ticket_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`ticket_id`,`tag_id`),
  KEY `IDX_CF4DF9E3700047D2` (`ticket_id`),
  KEY `IDX_CF4DF9E3BAD26311` (`tag_id`),
  CONSTRAINT `FK_CF4DF9E3700047D2` FOREIGN KEY (`ticket_id`) REFERENCES `uv_ticket` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_CF4DF9E3BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `uv_tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_tickets_tags`
--

LOCK TABLES `uv_tickets_tags` WRITE;
/*!40000 ALTER TABLE `uv_tickets_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_tickets_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_user`
--

DROP TABLE IF EXISTS `uv_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(191) DEFAULT NULL,
  `proxy_id` varchar(191) DEFAULT NULL,
  `password` varchar(191) DEFAULT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `verification_code` varchar(191) DEFAULT NULL,
  `timezone` varchar(191) DEFAULT NULL,
  `timeformat` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E8D39F61E7927C74` (`email`),
  UNIQUE KEY `UNIQ_E8D39F61DB26A4E` (`proxy_id`),
  UNIQUE KEY `UNIQ_E8D39F61E821C39F` (`verification_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_user`
--

LOCK TABLES `uv_user` WRITE;
/*!40000 ALTER TABLE `uv_user` DISABLE KEYS */;
INSERT INTO `uv_user` VALUES
(1,'admin@example.com',NULL,'$argon2id$v=19$m=65536,t=4,p=1$v/sphUnsHXj3sMnsuSvfUA$o/w+tReQfNERQ2DZUNbkWakxkcBOWBjkfJcgL6bhTq0','Admin','Jensen',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `uv_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_user_instance`
--

DROP TABLE IF EXISTS `uv_user_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_user_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `source` varchar(191) NOT NULL,
  `skype_id` varchar(191) DEFAULT NULL,
  `contact_number` varchar(191) DEFAULT NULL,
  `designation` varchar(191) DEFAULT NULL,
  `signature` longtext DEFAULT NULL,
  `profile_image_path` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_starred` tinyint(1) NOT NULL DEFAULT 0,
  `ticket_access_level` varchar(32) DEFAULT NULL,
  `supportRole_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B1744733A76ED395` (`user_id`),
  KEY `IDX_B174473368771C43` (`supportRole_id`),
  CONSTRAINT `FK_B174473368771C43` FOREIGN KEY (`supportRole_id`) REFERENCES `uv_support_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B1744733A76ED395` FOREIGN KEY (`user_id`) REFERENCES `uv_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_user_instance`
--

LOCK TABLES `uv_user_instance` WRITE;
/*!40000 ALTER TABLE `uv_user_instance` DISABLE KEYS */;
INSERT INTO `uv_user_instance` VALUES
(1,1,'website',NULL,NULL,NULL,NULL,NULL,'2024-03-15 23:48:52','2024-03-15 23:48:52',1,1,0,NULL,1);
/*!40000 ALTER TABLE `uv_user_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_user_support_groups`
--

DROP TABLE IF EXISTS `uv_user_support_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_user_support_groups` (
  `userInstanceId` int(11) NOT NULL,
  `supportGroupId` int(11) NOT NULL,
  PRIMARY KEY (`userInstanceId`,`supportGroupId`),
  KEY `IDX_B6CD76C28B414560` (`userInstanceId`),
  KEY `IDX_B6CD76C253F5B65F` (`supportGroupId`),
  CONSTRAINT `FK_B6CD76C253F5B65F` FOREIGN KEY (`supportGroupId`) REFERENCES `uv_support_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B6CD76C28B414560` FOREIGN KEY (`userInstanceId`) REFERENCES `uv_user_instance` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_user_support_groups`
--

LOCK TABLES `uv_user_support_groups` WRITE;
/*!40000 ALTER TABLE `uv_user_support_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_user_support_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_user_support_privileges`
--

DROP TABLE IF EXISTS `uv_user_support_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_user_support_privileges` (
  `userInstanceId` int(11) NOT NULL,
  `supportPrivilegeId` int(11) NOT NULL,
  PRIMARY KEY (`userInstanceId`,`supportPrivilegeId`),
  KEY `IDX_9550EDB28B414560` (`userInstanceId`),
  KEY `IDX_9550EDB289C60B89` (`supportPrivilegeId`),
  CONSTRAINT `FK_9550EDB289C60B89` FOREIGN KEY (`supportPrivilegeId`) REFERENCES `uv_support_privilege` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9550EDB28B414560` FOREIGN KEY (`userInstanceId`) REFERENCES `uv_user_instance` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_user_support_privileges`
--

LOCK TABLES `uv_user_support_privileges` WRITE;
/*!40000 ALTER TABLE `uv_user_support_privileges` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_user_support_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_user_support_teams`
--

DROP TABLE IF EXISTS `uv_user_support_teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_user_support_teams` (
  `userInstanceId` int(11) NOT NULL,
  `supportTeamId` int(11) NOT NULL,
  PRIMARY KEY (`userInstanceId`,`supportTeamId`),
  KEY `IDX_5F33E9F78B414560` (`userInstanceId`),
  KEY `IDX_5F33E9F7A77C7023` (`supportTeamId`),
  CONSTRAINT `FK_5F33E9F78B414560` FOREIGN KEY (`userInstanceId`) REFERENCES `uv_user_instance` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5F33E9F7A77C7023` FOREIGN KEY (`supportTeamId`) REFERENCES `uv_support_team` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_user_support_teams`
--

LOCK TABLES `uv_user_support_teams` WRITE;
/*!40000 ALTER TABLE `uv_user_support_teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `uv_user_support_teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_website`
--

DROP TABLE IF EXISTS `uv_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_website` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `theme_color` varchar(191) NOT NULL,
  `favicon` varchar(191) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `timezone` varchar(191) DEFAULT NULL,
  `timeformat` varchar(191) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2656FF0677153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_website`
--

LOCK TABLES `uv_website` WRITE;
/*!40000 ALTER TABLE `uv_website` DISABLE KEYS */;
INSERT INTO `uv_website` VALUES
(1,'Support Center','helpdesk',NULL,'#7E91F0',NULL,'2024-03-15 23:48:29','2024-03-15 23:48:29',NULL,NULL,NULL),
(2,'Helpdesk Knowledgebase','knowledgebase',NULL,'#7E91F0',NULL,'2024-03-15 23:48:29','2024-03-15 23:48:29',NULL,NULL,NULL);
/*!40000 ALTER TABLE `uv_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_website_knowledgebase`
--

DROP TABLE IF EXISTS `uv_website_knowledgebase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_website_knowledgebase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `website` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `brand_color` varchar(255) NOT NULL,
  `page_background_color` varchar(255) NOT NULL,
  `header_background_color` varchar(255) DEFAULT NULL,
  `link_color` varchar(255) DEFAULT NULL,
  `article_text_color` varchar(255) DEFAULT NULL,
  `ticket_create_option` varchar(255) NOT NULL,
  `site_description` varchar(1000) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `homepage_content` varchar(255) DEFAULT NULL,
  `white_list` longtext DEFAULT NULL,
  `black_list` longtext DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `broadcast_message` longtext DEFAULT NULL,
  `disable_customer_login` tinyint(1) NOT NULL,
  `script` longtext DEFAULT NULL,
  `custom_css` longtext DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `header_links` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `footer_links` longtext DEFAULT NULL COMMENT '(DC2Type:array)',
  `banner_background_color` varchar(255) DEFAULT NULL,
  `link_hover_color` varchar(255) DEFAULT NULL,
  `login_required_to_create` tinyint(1) DEFAULT NULL,
  `remove_customer_login_button` int(11) DEFAULT 0,
  `remove_branding_content` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `IDX_DFF10F0B476F5DE7` (`website`),
  CONSTRAINT `FK_DFF10F0B476F5DE7` FOREIGN KEY (`website`) REFERENCES `uv_website` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_website_knowledgebase`
--

LOCK TABLES `uv_website_knowledgebase` WRITE;
/*!40000 ALTER TABLE `uv_website_knowledgebase` DISABLE KEYS */;
INSERT INTO `uv_website_knowledgebase` VALUES
(1,2,'1','#7E91F0','#FFFFFF','#FFFFFF','#2750C4','#333333','1','Hi! how can i help you.',NULL,NULL,'masonry',NULL,NULL,'2024-03-15 23:48:29','2024-03-15 23:48:29',NULL,0,NULL,NULL,1,'N;','N;','#7C70F4','#2750C4',NULL,NULL,NULL);
/*!40000 ALTER TABLE `uv_website_knowledgebase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_workflow`
--

DROP TABLE IF EXISTS `uv_workflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_workflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `conditions` longtext NOT NULL COMMENT '(DC2Type:array)',
  `actions` longtext NOT NULL COMMENT '(DC2Type:array)',
  `sort_order` int(11) DEFAULT NULL,
  `is_predefind` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_added` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_workflow`
--

LOCK TABLES `uv_workflow` WRITE;
/*!40000 ALTER TABLE `uv_workflow` DISABLE KEYS */;
INSERT INTO `uv_workflow` VALUES
(1,'Customer Created','Send customer a welcome email after their account has been created.','a:0:{}','a:1:{i:2;a:2:{s:4:\"type\";s:29:\"uvdesk.customer.mail_customer\";s:5:\"value\";s:1:\"8\";}}',1,1,1,'2024-03-15 23:48:29','2024-03-15 23:48:29'),
(2,'Agent Created','Send agent a welcome email when their account is created.','a:0:{}','a:1:{i:0;a:2:{s:4:\"type\";s:23:\"uvdesk.agent.mail_agent\";s:5:\"value\";s:1:\"4\";}}',2,1,1,'2024-03-15 23:48:29','2024-03-15 23:48:29'),
(3,'User Forgot Password','Send an email to user with a link to reset their password.','a:0:{}','a:1:{i:1;a:2:{s:4:\"type\";s:21:\"uvdesk.user.mail_user\";s:5:\"value\";s:1:\"1\";}}',2,1,1,'2024-03-15 23:48:29','2024-03-15 23:48:29'),
(4,'Ticket Agent Update - Mail to Agent','Send an email to updated agent on ticket','a:0:{}','a:1:{i:1;a:2:{s:4:\"type\";s:24:\"uvdesk.ticket.mail_agent\";s:5:\"value\";a:2:{s:3:\"for\";a:1:{i:0;s:13:\"assignedAgent\";}s:5:\"value\";s:1:\"5\";}}}',3,1,1,'2024-03-15 23:48:29','2024-03-15 23:48:29'),
(5,'Ticket Created','Automate actions when ticket is created.','a:0:{}','a:3:{i:0;a:2:{s:4:\"type\";s:27:\"uvdesk.ticket.mail_customer\";s:5:\"value\";s:1:\"7\";}i:1;a:2:{s:4:\"type\";s:26:\"uvdesk.ticket.assign_agent\";s:5:\"value\";s:18:\"responsePerforming\";}i:2;a:2:{s:4:\"type\";s:24:\"uvdesk.ticket.mail_agent\";s:5:\"value\";a:2:{s:3:\"for\";a:2:{i:0;s:13:\"assignedAgent\";i:1;s:1:\"5\";}s:5:\"value\";s:1:\"3\";}}}',4,1,1,'2024-03-15 23:48:29','2024-03-15 23:48:29'),
(6,'Agent Replied on Ticket','Send customer an email when reply is added on ticket.','a:0:{}','a:1:{i:0;a:2:{s:4:\"type\";s:27:\"uvdesk.ticket.mail_customer\";s:5:\"value\";s:1:\"2\";}}',5,1,1,'2024-03-15 23:48:29','2024-03-15 23:48:29'),
(7,'Customer Replied on Ticket','Send agent an email when reply is added on ticket.','a:0:{}','a:1:{i:0;a:2:{s:4:\"type\";s:24:\"uvdesk.ticket.mail_agent\";s:5:\"value\";a:2:{s:3:\"for\";a:1:{i:0;s:13:\"assignedAgent\";}s:5:\"value\";s:1:\"6\";}}}',6,1,1,'2024-03-15 23:48:29','2024-03-15 23:48:29'),
(8,'Collaborator Replied on Ticket','Send agent & customer an email when reply is added on ticket.','a:0:{}','a:3:{i:0;a:2:{s:4:\"type\";s:26:\"uvdesk.ticket.assign_agent\";s:5:\"value\";s:18:\"responsePerforming\";}i:1;a:2:{s:4:\"type\";s:24:\"uvdesk.ticket.mail_agent\";s:5:\"value\";a:2:{s:3:\"for\";a:1:{i:0;s:13:\"assignedAgent\";}s:5:\"value\";s:2:\"10\";}}i:2;a:2:{s:4:\"type\";s:27:\"uvdesk.ticket.mail_customer\";s:5:\"value\";s:2:\"11\";}}',7,1,1,'2024-03-15 23:48:29','2024-03-15 23:48:29'),
(9,'Collaborator Added to ticket','Send collaborator a welcome email after their account has been Added.','a:0:{}','a:1:{i:0;a:2:{s:4:\"type\";s:36:\"uvdesk.ticket.mail_last_collaborator\";s:5:\"value\";s:1:\"9\";}}',8,1,1,'2024-03-15 23:48:29','2024-03-15 23:48:29');
/*!40000 ALTER TABLE `uv_workflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uv_workflow_events`
--

DROP TABLE IF EXISTS `uv_workflow_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uv_workflow_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) DEFAULT NULL,
  `event_id` int(11) NOT NULL,
  `event` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6AEB02A92C7C2CBA` (`workflow_id`),
  CONSTRAINT `FK_6AEB02A92C7C2CBA` FOREIGN KEY (`workflow_id`) REFERENCES `uv_workflow` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uv_workflow_events`
--

LOCK TABLES `uv_workflow_events` WRITE;
/*!40000 ALTER TABLE `uv_workflow_events` DISABLE KEYS */;
INSERT INTO `uv_workflow_events` VALUES
(1,1,1,'uvdesk.customer.created'),
(2,2,2,'uvdesk.agent.created'),
(3,3,3,'uvdesk.user.forgot_password'),
(4,4,4,'uvdesk.ticket.agent_updated'),
(5,5,5,'uvdesk.ticket.created'),
(6,6,6,'uvdesk.ticket.agent_reply'),
(7,7,7,'uvdesk.ticket.customer_reply'),
(8,8,8,'uvdesk.ticket.collaborator_reply'),
(9,9,9,'uvdesk.ticket.collaborator_updated');
/*!40000 ALTER TABLE `uv_workflow_events` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-15 23:57:06
