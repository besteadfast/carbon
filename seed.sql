-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `ownerId` int DEFAULT NULL,
  `countryCode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `administrativeArea` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dependentLocality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postalCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortingCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addressLine1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addressLine2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organizationTaxId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vsijkcgdmboietyororumurckqluguggjyja` (`ownerId`),
  CONSTRAINT `fk_loehngiwkbylguuwbrvzvcxeiprxchjqhlwc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vsijkcgdmboietyororumurckqluguggjyja` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_kibuftjktkxpkalskejaarahvlxpkvwmbujk` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_bhykkgeawllamdgfpbbohnlyclexekbauldv` (`dateRead`),
  KEY `fk_rohtfaczbafjwubjzsftwmqaflkgvttecxee` (`pluginId`),
  CONSTRAINT `fk_rohtfaczbafjwubjzsftwmqaflkgvttecxee` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rwieivtjssrvotodfqpikdhbnpimoazghrue` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mtprkllfufznkrinjmnkgspdiucjztdztvdx` (`sessionId`,`volumeId`),
  KEY `idx_dszuzhzxrkixquegwadmgffrgthsqzdidree` (`volumeId`),
  CONSTRAINT `fk_qtjpfvvkwikffnajkrnplixuvxtrsioclmfx` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rldnmgyqpxsgfgsxzveeqfidzzgumdgdmipz` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text COLLATE utf8_unicode_ci,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `alt` text COLLATE utf8_unicode_ci,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xdlkcgzagngazdrmpivhymykiuourgyjfhdc` (`filename`,`folderId`),
  KEY `idx_dctvdgawuxrtvbizirkohguapipqdavwizkr` (`folderId`),
  KEY `idx_ehxupwzvbxkdepyrauovbxcnboadanjcxuvz` (`volumeId`),
  KEY `fk_tzsoziysswhqagbsnkkbrclebxorcjoruhbj` (`uploaderId`),
  CONSTRAINT `fk_clzeyeydxxjicwzeexasthbfasoiyeufprwh` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dmgeatmmnyrkerccuqcirjnpnzkiaivbairs` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ovlxtbgkmhmkwjsywbhrcrhfahmzlcamyqis` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tzsoziysswhqagbsnkkbrclebxorcjoruhbj` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cxgcybzqxolvzdkpertmjlizbklbvobdclvu` (`groupId`),
  KEY `fk_qvuzxycwqwdsodozkqogiilwhiyskwzdqyfd` (`parentId`),
  CONSTRAINT `fk_mjrmkncvwmivtiekvnoumcxfdlnrbzlgikwy` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qvuzxycwqwdsodozkqogiilwhiyskwzdqyfd` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wkavjokrixfdmdpykfnurbbddkctydabpyvz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ccbiwfekxkuajktgiltxhmbhvrwyeubaeaty` (`name`),
  KEY `idx_rclzbijhiygonpyzoxdubfdaacluhuharvuy` (`handle`),
  KEY `idx_epxnidhybipqrqxjswkzqcxbmmdiurmqwbch` (`structureId`),
  KEY `idx_lanalozfkcamyogrjzpqdcnroitwgrrmhkkv` (`fieldLayoutId`),
  KEY `idx_vnkumqlsbldlyhaqcqdjraapscqtetmnzewd` (`dateDeleted`),
  CONSTRAINT `fk_sjqsqzoseutovaovkbsqtjeyxtasoxpxfmpq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_unryjnzhulqhstchpzxzrdcjxsldqdxplhcd` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kvpowfhntjxkhzhrkgilvjztekaggarjxktl` (`groupId`,`siteId`),
  KEY `idx_onsibfagnnqfxzqfolsflbafdjgdeixxkdlq` (`siteId`),
  CONSTRAINT `fk_jeaxrdfndshvdhefaokmgovyemyansasdqfh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mzleauxzjisbrazotewnjgetczgsbkpzhery` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_ynintgulydthgymclmkhiapoitbitkrqhsde` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_fibyejhfygyonwmwshtqqsylgfdpmvouhfzj` (`siteId`),
  KEY `fk_bcibwmcqyzamjlmswdvavbhcbxlwnjoranpp` (`userId`),
  CONSTRAINT `fk_bcibwmcqyzamjlmswdvavbhcbxlwnjoranpp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_fibyejhfygyonwmwshtqqsylgfdpmvouhfzj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jwvlkfhnampphxwvzglnhcpluswwuctbeour` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_huxqogbvhxwnjeetvwgohcglvjvnpdmuazyy` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_jdfqdpaawrwehytscijbptfqsdwvwvlgtfxt` (`siteId`),
  KEY `fk_fjefsdwgwwogjaqkgkxgturaqhuryhtvkzhl` (`fieldId`),
  KEY `fk_pcjfwtsjogoqmshgrngrngoqbhuzrjsvawqr` (`userId`),
  CONSTRAINT `fk_fjefsdwgwwogjaqkgkxgturaqhuryhtvkzhl` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jdfqdpaawrwehytscijbptfqsdwvwvlgtfxt` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kdkwxwgrzzhpenorqakifhmevgdocytgaohg` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pcjfwtsjogoqmshgrngrngoqbhuzrjsvawqr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mnsjdjkldorksgzuvtyxrvjxxndvzzlbhiil` (`elementId`,`siteId`),
  KEY `idx_ekunkirzzefreluorzjffmpuwrzfdohazuyz` (`siteId`),
  KEY `idx_zvxtjcyefaxriedtyhqeccvrsorozbfdlpbe` (`title`),
  CONSTRAINT `fk_amwbqpwxuzznormvbnpuozctyddtghmoqlhx` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wxcywssdfhehxwnlcrigqeeqpsludjfgfuof` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_qfxbbarnbiogfhwxzxjnvkmqkxochjnmyzqw` (`userId`),
  CONSTRAINT `fk_qfxbbarnbiogfhwxzxjnvkmqkxochjnmyzqw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nnrpzlasripynmsdgqrssjuauaibisabciqf` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_bahrhkiypgmekunmgajntkhilbktegchdnph` (`creatorId`,`provisional`),
  KEY `idx_bkoqopbikharpvtkjkjuihfixizoogdvezfj` (`saved`),
  KEY `fk_bbfcbuaobyufjazjmawqbsrazrrcldrevwhh` (`canonicalId`),
  CONSTRAINT `fk_bbfcbuaobyufjazjmawqbsrazrrcldrevwhh` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kyulgasbmmwvswojlrjvgnnyixuxzyabnylh` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fartebtijxspxzblibipvipummhyssnaxuqp` (`dateDeleted`),
  KEY `idx_zyqswauenliwemfeniqdazszdrowtzvtfbem` (`fieldLayoutId`),
  KEY `idx_dvmdeipppsxscqnzwmmxfgfsnrnblkhdpkdo` (`type`),
  KEY `idx_dzdzvvmglcowgbwwouuchqvrsubcflfgwpji` (`enabled`),
  KEY `idx_bqumrkxvjinmsecyysadaixssvvqbudkkgji` (`canonicalId`),
  KEY `idx_rxqimixwjnxxlzdbhlysskrynssjaxhmqayu` (`archived`,`dateCreated`),
  KEY `idx_ketjbofshdumtulsdlrlqbpvqdytzxvyxxvl` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_hfqkcnmrzmkwfhbkdindknfscaojbivysdwr` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_uleunflqjzrqfdgvpqhdtngafhcbioawpiyz` (`draftId`),
  KEY `fk_bqvrnwulxsdckcupyjnytktdzlwkymdefmfq` (`revisionId`),
  CONSTRAINT `fk_bqvrnwulxsdckcupyjnytktdzlwkymdefmfq` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_opufbcrfmceptunghueuppvkagzevskvjdkq` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_uleunflqjzrqfdgvpqhdtngafhcbioawpiyz` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uoakqqonmzhqvvqdjiixfetrqwxamsypmful` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_udtgjtvobmnfpxbrwnaiihzhzeavdpxemccw` (`elementId`,`siteId`),
  KEY `idx_ktbwwonympeyddcyukaqbrlkhudsghawigsc` (`siteId`),
  KEY `idx_cnsepndaylmycgjthibqxfpflrciftfrbfpk` (`slug`,`siteId`),
  KEY `idx_rcgpgayivvayyqaoitpdgxzuuwtbxjwuqupt` (`enabled`),
  KEY `idx_fqrdnxfyqcxeyertczwqsseenzfdlnlahrjt` (`uri`,`siteId`),
  CONSTRAINT `fk_mjwrvsubzyfgifsviqpziejvfswepkjxskwv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mkaunudhtixtikpsafmxybjwjhhnbtdmovbo` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pmehkshlobtwcsvqjidlqluqfokovtnnyxap` (`postDate`),
  KEY `idx_gmfwoexhfnysdcuyabjgwwypwkxlwayxqrbc` (`expiryDate`),
  KEY `idx_knhyngxkgimieupuqjocgreqzvwdodqdueih` (`authorId`),
  KEY `idx_rpiowtuorzymzjzvfejxnlzxgjesljsyyzbk` (`sectionId`),
  KEY `idx_zwvmbiqhtbnqnvcyaxvkzdubmwapmzhuhcsw` (`typeId`),
  KEY `fk_kmsbjivefmtnparwkmdakbfxntgymhlsvovb` (`parentId`),
  CONSTRAINT `fk_gkixzdmsmuaazoovficjrbsdhgwgwhlirlzb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kmsbjivefmtnparwkmdakbfxntgymhlsvovb` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pqrtysqlqeeqkhotfydhpkofevrghscreeia` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_puhanzahfajjegzhomkzhalclvqmwszchibq` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zdzetoubebizumbxrlelcrwgzzrjpqojvvtl` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_prjpixewhfhzohjiiomapkrhagvyskryxucm` (`name`,`sectionId`),
  KEY `idx_gwuozakhiwaqbzgcyppcqekngpvstafilugh` (`handle`,`sectionId`),
  KEY `idx_qnbqjcynkjvzclbawphvztjhwwkmvkporosv` (`sectionId`),
  KEY `idx_bleesrlxswskhwqwldfrpycgalywuweqpika` (`fieldLayoutId`),
  KEY `idx_coolfacpdgjwwzfxaackjkelcogcvnhlnlnp` (`dateDeleted`),
  CONSTRAINT `fk_rvmokujleqderxevxkevibipfwmbfkwjvfhx` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_stibupeabhvlgiearcpljygzrlahvnbbtvap` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nozscpzhhkbbhedcxktekncoqejgryvcrfep` (`name`),
  KEY `idx_vumqghlfnmpfbgfadlivuihuenfqacjdyogx` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_heifvtmxwfufnqwunolwnrnlaxgarvechxtb` (`layoutId`,`fieldId`),
  KEY `idx_iowkorabjkexydyonedecsiempfxzcvibpyh` (`sortOrder`),
  KEY `idx_kqcstxzoblwyxholipqziwwbzfrichykabkq` (`tabId`),
  KEY `idx_pvdrzizfdgsbsasoiiafpqeuehbuxlahcoht` (`fieldId`),
  CONSTRAINT `fk_aaccwmneiialcwxzoaxoqphfvtuauotacusc` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nhbgbifisnmndtmkxuzkakllmsqagvklxqix` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wqruqrqazgvhicfzcphcazeaffizehcodyox` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bscwteiinfpkdykksfcdhuxwwbnspkrtotst` (`dateDeleted`),
  KEY `idx_xayrlxvvcbgblaequgvdnwssxzmubcxrxace` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bwzkzgmnfzttlzecchxoqlvievzluvyrsupi` (`sortOrder`),
  KEY `idx_yjodvijpqudgouptugrkjufpumpdmgtfjzwf` (`layoutId`),
  CONSTRAINT `fk_worptosaodqmnffcsybzxkkqsiedfkrjdpvt` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_phkvjszacczopsukhdwbjxwploiadazmjwid` (`handle`,`context`),
  KEY `idx_khfbkavyshrvquneyzklqshzaqkxlddcqdwm` (`groupId`),
  KEY `idx_frbqnqhovunbkvclybkawpbcqswsjtmulgrq` (`context`),
  CONSTRAINT `fk_urwroipkzrzrhcomscbbaevayippmvlvzrgm` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kqhjlwfcwbcbcbdhgxuoctupmuogomwudpvv` (`name`),
  KEY `idx_atnodobhzzwtknfjwqnmzvotkjlcllnlkper` (`handle`),
  KEY `idx_kasbexrbgawubaeoudfttikvkafnjfgiloug` (`fieldLayoutId`),
  KEY `idx_fmcpvduciujpthetdjifutgtdgltihkdkodk` (`sortOrder`),
  CONSTRAINT `fk_kozmdmdzihqcdhptidisyahgfwrrzimifmvf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wpanrmtdevtavngixprrvxospepkdjccpggu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uskwqtqnlngdfaitosrfvohtamvlzjsgljus` (`accessToken`),
  UNIQUE KEY `idx_jvhcatkafnyfxfnmfbcakdbiwncgdartlixa` (`name`),
  KEY `fk_kxaldrawgxiupqooxqssfautzhzwsmrzykwl` (`schemaId`),
  CONSTRAINT `fk_kxaldrawgxiupqooxqssfautzhzwsmrzykwl` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transformString` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ivkglajgpgoouhokklzoqjazkzyusbydwgwi` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `fill` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qrfevkrerghdjkqnqmuramhuxkyvnilidfnu` (`name`),
  KEY `idx_kllzqqiibcyzbdvmwzpqjaolarfwsxkedoqg` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lenz_linkfield`
--

DROP TABLE IF EXISTS `lenz_linkfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lenz_linkfield` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `type` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedUrl` text COLLATE utf8_unicode_ci,
  `linkedId` int DEFAULT NULL,
  `linkedSiteId` int DEFAULT NULL,
  `linkedTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kmjcbxaobodjediqygcxxcthyjurdutrccpn` (`elementId`,`siteId`,`fieldId`),
  KEY `idx_lecficwobkslphsofmfckpmxryqilbkujdbj` (`fieldId`),
  KEY `idx_jbcokckblzgjtunzgbhmxttwircuaosslivq` (`siteId`),
  KEY `fk_cfhhblbbynjkzcwakmtqzseicdvgwaxhggyw` (`linkedId`),
  KEY `fk_rpzzrijdbemilfpjqaxfureoqbwqhjnwqyto` (`linkedSiteId`),
  CONSTRAINT `fk_cfhhblbbynjkzcwakmtqzseicdvgwaxhggyw` FOREIGN KEY (`linkedId`) REFERENCES `elements` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_gduqdnvbnsdjcnfwelzhzaecksbrubrbxqec` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mpqrizkfgwvtlwnzsimyxvuzaslzifuwpxnj` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rpzzrijdbemilfpjqaxfureoqbwqhjnwqyto` FOREIGN KEY (`linkedSiteId`) REFERENCES `sites` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jwefhbgnqqtjvtzetugdaiuihrnxydzzcfwp` (`primaryOwnerId`),
  KEY `idx_oazenzcqiulmdbumiwcmmtxieobnyovhdnxp` (`fieldId`),
  KEY `idx_gtbrqbjhizzxfoiesvkanqusvmcfqvnsfwco` (`typeId`),
  CONSTRAINT `fk_arpogxlalnkghxbrfhtxevvjabctyudbjlfl` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fioexvompmneecpbmpnkcxfzdaskbonmnfpn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hwrrjiuqcnnvixbuwcddwofzovxjuunvmfpx` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wwpzkltquioqhjmpudkcxjhrpbwpyxnsijde` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_rddsziztdajxdmtnzcfzfljpjdpsjnwsxerv` (`ownerId`),
  CONSTRAINT `fk_evdyilfzssgrzlxmjmvklagqdtpabezxyblu` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rddsziztdajxdmtnzcfzfljpjdpsjnwsxerv` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bauldtgacziyetpemlgzmjdttflybjdtvtki` (`name`,`fieldId`),
  KEY `idx_ufkrcoevunltgvulovccpoqsokfobxagigdn` (`handle`,`fieldId`),
  KEY `idx_lxbtrmdpdhhwjqjwicisuzdhyxhtflhrqmov` (`fieldId`),
  KEY `idx_dcetznptvafprmubhlypyhoqtlppcypmdgui` (`fieldLayoutId`),
  CONSTRAINT `fk_doiczhwxcequjwfbqmhyizrncspscqinggdk` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_roxcbxmnydgrbyxnihpfadqiqybnxwyufwoe` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zokannxurdesgymefhhqmahsekpaswssvies` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblocks`
--

DROP TABLE IF EXISTS `neoblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neoblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jvpitbokhbawdyhtgnxbcjaapiumcoklmiuc` (`primaryOwnerId`),
  KEY `idx_fwpsqyvovixxtszvsxqiqhkevxonilzfuvxh` (`fieldId`),
  KEY `idx_cxgscgbbuqtuwudlvdzsqppmtchqpbkdioft` (`typeId`),
  CONSTRAINT `fk_dlevjqqnwcoauthwdrzygnmdinckmqdbjqpb` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lshrcczrbkdsqkrbjfsnwygsyebhzadmltln` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rrapllgwaxsakilwsokplfeytfiucpmwlejo` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zyaabklyfblwtyzlcybgiwqnmguaqcsspprh` FOREIGN KEY (`typeId`) REFERENCES `neoblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblocks_owners`
--

DROP TABLE IF EXISTS `neoblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neoblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_gmgpzsiffqxserraddaxfwuxdthzbcdddgom` (`ownerId`),
  CONSTRAINT `fk_gmgpzsiffqxserraddaxfwuxdthzbcdddgom` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jzewjhamzwunxfbhsjgfualratdgyfbealmf` FOREIGN KEY (`blockId`) REFERENCES `neoblocks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblockstructures`
--

DROP TABLE IF EXISTS `neoblockstructures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neoblockstructures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `ownerId` int NOT NULL,
  `siteId` int DEFAULT NULL,
  `fieldId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ykvjuchbvwkosiuapjvelwshxxvflsbyawys` (`structureId`),
  KEY `idx_xkcjljyjihogwxeerpbzehuhinmntinwfzqv` (`ownerId`),
  KEY `idx_lwlatnoiraeogezthnbairwzwgmpnlibardv` (`siteId`),
  KEY `idx_ldbcvmbxelalkdezwzcxbshctxwclrgoxyoh` (`fieldId`),
  CONSTRAINT `fk_noqrlcerkgigxkmaejwphikhtkzygadfagpo` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rruotnrvshawkmfnwjaknyiqzfgltqpslxnj` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vkzrwlsovykrrnlpkuzabhximovbsvemjjot` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zegntaudwtvanowqafvwmfxmjwbxvufyvvda` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblocktypegroups`
--

DROP TABLE IF EXISTS `neoblocktypegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neoblocktypegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `alwaysShowDropdown` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oavmwrtmlwushizvofazznodpxcpqafkhjnx` (`name`,`fieldId`),
  KEY `idx_yknpdsbcmahcnltpljnayvwwypbmjgbpqvfs` (`fieldId`),
  CONSTRAINT `fk_xtnbsnjwzeinkayohjezghjfzetupcuyfmxe` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblocktypes`
--

DROP TABLE IF EXISTS `neoblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neoblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iconId` int DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `minBlocks` smallint unsigned DEFAULT '0',
  `maxBlocks` smallint unsigned DEFAULT NULL,
  `minSiblingBlocks` smallint unsigned DEFAULT '0',
  `maxSiblingBlocks` smallint unsigned DEFAULT '0',
  `minChildBlocks` smallint unsigned DEFAULT '0',
  `maxChildBlocks` smallint unsigned DEFAULT NULL,
  `groupChildBlockTypes` tinyint(1) NOT NULL DEFAULT '1',
  `childBlocks` text COLLATE utf8_unicode_ci,
  `topLevel` tinyint(1) NOT NULL DEFAULT '1',
  `ignorePermissions` tinyint(1) NOT NULL DEFAULT '1',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `conditions` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tpyemziwoerfzsmhpfticqbhfjwwfekcfozi` (`handle`,`fieldId`),
  KEY `idx_twurozdzvlfuiwukpkyhvoqbjfirvpcujjjc` (`name`,`fieldId`),
  KEY `idx_emkngojcafksdzmlfwawstfjltjhpmsmrbev` (`fieldId`),
  KEY `idx_crnhrmkslqifftqkdxtbdcfnzxmzjnbbupvw` (`fieldLayoutId`),
  KEY `idx_foznksbsdfzfggrybcdvrqyuzbjjvhwmdguk` (`groupId`),
  KEY `fk_mpxwngxxmxkzmjdluzzpnzjmanbjogafjtsv` (`iconId`),
  CONSTRAINT `fk_guenrrhgypggcqaxtvftlbhsmkowvcaqyyls` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jkgrfzogsonjpinitxercicsnmrinxueisxj` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mpxwngxxmxkzmjdluzzpnzjmanbjogafjtsv` FOREIGN KEY (`iconId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zhnlwcgjlduimneqmoiisgdcejrnwvorqrsr` FOREIGN KEY (`groupId`) REFERENCES `neoblocktypegroups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rpfzgguisxjetzrmzwgwtsvfpucuajhplakn` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_mvmehasfrbkzborhfagffumgddcexymknudj` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_piphrpcamoqdzckrisashocexofhhqniomxy` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_taxwusmirdtgfmiiwzhoehwbdcrdofcxydne` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_uhvfhxrpdrtyvjecmeafwkynywdlssgezdcf` (`sourceId`),
  KEY `idx_ktsdybhgpxcixrqxdgqsykfgcoporwvcfzwn` (`targetId`),
  KEY `idx_zbjnwadqzfuwwfrgoogrjheqqzugizdczsfx` (`sourceSiteId`),
  CONSTRAINT `fk_eqepswupssuxgigonyvcojdvkdrsycpdzwwp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ewzslxpmusoopdsifkdljesyfqhddyqwhvzq` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_irhgjwuuetrwbeejsecekrvchsupjpqdpmzw` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rofbpyialomgixbcbeeotgdlgfmnmhjthgzn` (`canonicalId`,`num`),
  KEY `fk_xzdfdfkmahhqddokhifxdlckucqaaxyrfibt` (`creatorId`),
  CONSTRAINT `fk_nqotnpvctfiqzjblbbpkzdkmtvexlqkztqko` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xzdfdfkmahhqddokhifxdlckucqaaxyrfibt` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_wcbztkwnldvxxenmwhececyoigesfvebufiu` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oozlmbwghxwnqyerbifusdtsqvtahvhovvhg` (`handle`),
  KEY `idx_lllhdjtdyiwbkvdeoevwcuhriasisvnsulll` (`name`),
  KEY `idx_rfpyxsoqyhxobmzleibhdqimcseqdcgcnldg` (`structureId`),
  KEY `idx_mwzfvfzldxnoomsmoixljpukdgvyslwuqfff` (`dateDeleted`),
  CONSTRAINT `fk_ptsebwsafypawcwshctrgxmywbkvooafqvlw` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_opwxwoqsxflqpocatgerhqhoyhwjpkiltoyn` (`sectionId`,`siteId`),
  KEY `idx_laxrydlaaqpyprrolastzvasoddnqqnrzvvi` (`siteId`),
  CONSTRAINT `fk_efhfpdskrajlizylwpksexyggulvvrdvvaer` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xyalhbtdvogwkoxrpfoemtmgfkhwqxehtowm` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seomatic_metabundles`
--

DROP TABLE IF EXISTS `seomatic_metabundles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seomatic_metabundles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `bundleVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceBundleType` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceId` int DEFAULT NULL,
  `sourceName` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceHandle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sourceType` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `typeId` int DEFAULT NULL,
  `sourceTemplate` varchar(500) COLLATE utf8_unicode_ci DEFAULT '',
  `sourceSiteId` int DEFAULT NULL,
  `sourceAltSiteSettings` text COLLATE utf8_unicode_ci,
  `sourceDateUpdated` datetime NOT NULL,
  `metaGlobalVars` text COLLATE utf8_unicode_ci,
  `metaSiteVars` text COLLATE utf8_unicode_ci,
  `metaSitemapVars` text COLLATE utf8_unicode_ci,
  `metaContainers` text COLLATE utf8_unicode_ci,
  `redirectsContainer` text COLLATE utf8_unicode_ci,
  `frontendTemplatesContainer` text COLLATE utf8_unicode_ci,
  `metaBundleSettings` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_hydsxsradflyvltvtyhbxlfqgapegmkiahmg` (`sourceBundleType`),
  KEY `idx_lphfumhaexeyplhvbzsnijzjreapsqqrlquo` (`sourceId`),
  KEY `idx_fexsxyocmnemgmhuslllyjvrkjumwxglrgem` (`sourceSiteId`),
  KEY `idx_fepdwzczicpprircuehaljwffvydabpuuyaq` (`sourceHandle`),
  CONSTRAINT `fk_zukzleizbordfdpeoxyevgwyyoahwggtcnuv` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wbelyimzemmefektpnsrwcttofpulybldsql` (`uid`),
  KEY `idx_txmtyhoqjmrfapfdwnegovpjrkogulinkggw` (`token`),
  KEY `idx_udzawywjvzdbtbezfvvatyudjxpqywnhltqy` (`dateUpdated`),
  KEY `idx_edaxjgwprvbpxoeidyhfkmnpqcudybtabkty` (`userId`),
  CONSTRAINT `fk_gnizndryslhrfcjifpwuiukirkpkxejalfjh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_rqozneekcrvsuolcdaraqnigcqzhbwbvfxrf` (`userId`,`message`),
  CONSTRAINT `fk_ivctucovjvbojfqsxtvxorumnklbkwmhzbil` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hxkklucxjbhyhpnwyxmvbhimfhbhkroovpbt` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fqibjsvjmdwsxjvjvwmlkxqiobttfvjqixlr` (`dateDeleted`),
  KEY `idx_nsqhwalapyirbeybmbxdmngqmcbfsjzziepv` (`handle`),
  KEY `idx_utkbsfrtjywnnlxxonssfejitzfsbzsxepeo` (`sortOrder`),
  KEY `fk_frroqauivhurwnzycvgcfbbdeaizosrcycwn` (`groupId`),
  CONSTRAINT `fk_frroqauivhurwnzycvgcfbbdeaizosrcycwn` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ezsxuwngjymfeqhgptzlippaiwtlofgygghu` (`structureId`,`elementId`),
  KEY `idx_swiogqjbhfeqaqudnnmljqranvfshxbqbzio` (`root`),
  KEY `idx_wzsxrwsfmdtwkyeyhlkyyduseiyvwnqdnvce` (`lft`),
  KEY `idx_bcctyieagmacuezoveajxntnufbmljxqthvo` (`rgt`),
  KEY `idx_zlxpeihifelpjjkoqbeaoxvdpjlnecvbzzya` (`level`),
  KEY `idx_vfdxusmfchpuaeqgkqsnwtyhxvswkqmcefwj` (`elementId`),
  CONSTRAINT `fk_ibbpppgotvwycqpxzpkaczmwzpadlqwguwey` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ppedgrlvgelsedgbqtvretubamgdqqeulfeg` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supertableblocks`
--

DROP TABLE IF EXISTS `supertableblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supertableblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_hukjaklxgycsbthbozwcubgzhlitnzzhwchl` (`primaryOwnerId`),
  KEY `idx_quafzaqigbiiivgnnbrbenfrtqbtvkrvxenu` (`fieldId`),
  KEY `idx_efuwptrjovoktiaenrrtdfbxxtfkgknylwte` (`typeId`),
  CONSTRAINT `fk_eksagmoxdzpepnjhvavnuqkvbzifxmyplfen` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hgwsbbabpvwovtyudqbmssyzullyfueufzvy` FOREIGN KEY (`typeId`) REFERENCES `supertableblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qkonpbydwguwjttjfgczrbaidqnolwhbzlnc` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ysqgqesahgikrbrfivxkutxypiyxybstdygm` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supertableblocks_owners`
--

DROP TABLE IF EXISTS `supertableblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supertableblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_kutdrzlxdtdxctyfudrjvfuiuefomrfhibyh` (`ownerId`),
  CONSTRAINT `fk_juzncoglwpccohfwdeludvomrxqtitdouhxh` FOREIGN KEY (`blockId`) REFERENCES `supertableblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kutdrzlxdtdxctyfudrjvfuiuefomrfhibyh` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supertableblocktypes`
--

DROP TABLE IF EXISTS `supertableblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supertableblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rrgtfcfhlsfnteksadgzmkvxqudqmvdlwqzy` (`fieldId`),
  KEY `idx_ewjczirucxnwksltnbsxwneezjhtydpifedz` (`fieldLayoutId`),
  CONSTRAINT `fk_ghlqqslnypcnirndyyenefaxfompotkahnxl` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sfdrxkbmfgkvcadifyevddspqtkoazammjqo` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jnsqjrnckboxfiyjwouvoqsiorilnqezzoqz` (`key`,`language`),
  KEY `idx_wxbchcnbojhuatftlrxwdyzmqjtzcubjdibc` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_wbdfqavmewzzqzbiwjiivewgvxkskzzvfkgz` (`name`),
  KEY `idx_flkqhlrsbsbasxxcippjwfkoyxtbzcvujmkm` (`handle`),
  KEY `idx_gybbyctbdjffeydfuzaxtvgbxbncbsdtgvna` (`dateDeleted`),
  KEY `fk_ljdvevwaeceswotavecszqkotgrvxpxyaerl` (`fieldLayoutId`),
  CONSTRAINT `fk_ljdvevwaeceswotavecszqkotgrvxpxyaerl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_zfiresmuybzqctgdqvxgicppxbwiihtzwrlw` (`groupId`),
  CONSTRAINT `fk_bqfvjjpljpredhpnhxurhuqxmcjybranqcvg` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tjwtbvvddvtvwymlsgaflladihxycgrofxir` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hwjkmskfzdorwbiuvmgzdcwvvdmnkrddimfs` (`token`),
  KEY `idx_eayvsnatcakcokzdjgumsglvohmnpifnsexo` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_peyudnkasrpsciytqqqectgjfkajvbwuocub` (`handle`),
  KEY `idx_ckpdxwkpktpnwhrhmyrhfsehidqvzbsmsizw` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_toghzylpbrbutqbayuctrmqlvskkdjgxtwcx` (`groupId`,`userId`),
  KEY `idx_rolfeymcvtgchmzvvoubwxagnbhqxvkobqzm` (`userId`),
  CONSTRAINT `fk_ftzubbxwultdjcnxnuxcatgnnijetjtrcudh` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xsxzjlqokposegwwngpqbvoylwbtsgxdeedr` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_igqtlpgxtcvduqoddufrzyysokwrfuoofukn` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lghkfineihnbqcilodcvyvadbkqiqltvnkun` (`permissionId`,`groupId`),
  KEY `idx_trsrjufpjwbhzfgwlofkgoiokcjqbqggirvg` (`groupId`),
  CONSTRAINT `fk_gvhbtwbjeifeyfyftefqyvrqdmiicexxywca` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ofgxbkjwwlhxtdnsxddclcrabnjqrfkspqip` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qdyekcyhzooyhfzrlmuzhzgguziaoicenczq` (`permissionId`,`userId`),
  KEY `idx_mherurytsdxeviqhakjazcefxzmkiagkkzzz` (`userId`),
  CONSTRAINT `fk_cdmjtzfkmygjyhfumaohrspczpshzxrhophw` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dqqmiuzyxxljkvpyjgjdfdzmakemgosjinbc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_irzdkgmygkfnbvplxrelraiviwtslwzmzlhu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_gkxduiitpdvhhkptfhpbggvazugjnhomijlj` (`active`),
  KEY `idx_gtasytnglxagmfvnblcyqwggmibrtcregzxd` (`locked`),
  KEY `idx_mxwpjvlnjkyhbjilblmbtllhnsdntwkzcnmw` (`pending`),
  KEY `idx_gjphknupfqnjkmxfgtujlljcylnbhobzpuvp` (`suspended`),
  KEY `idx_ldoeidmpexkqanwokdcksvizsgnzcdsucbfp` (`verificationCode`),
  KEY `idx_wulkfimaqvldonaunxvnwomzvfdwxntsltsu` (`email`),
  KEY `idx_dnqrqvzbuyvbstjpswtneyjgmpmrejiglruz` (`username`),
  KEY `fk_abygpsroeesmtkhwusycaencqakdfqvxuspw` (`photoId`),
  CONSTRAINT `fk_abygpsroeesmtkhwusycaencqakdfqvxuspw` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_dypypgptkxkpfqiiosuululbjrnnfpgqepof` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lidwwtylhuotvlpwhndtujqqxazxsldpdeur` (`name`,`parentId`,`volumeId`),
  KEY `idx_wfthpukfvyznlxraquljkxffjtbclsjazhzq` (`parentId`),
  KEY `idx_ulrkkgiokbzlyljjocgultzmbacmqjedsmxi` (`volumeId`),
  CONSTRAINT `fk_imktclkyfepxynjxrzeodeebnexgsdpvfpcn` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kyceemlzyekygvyendukyhxiysqphxilnktx` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fs` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transformFs` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transformSubpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_letoabbvqtycrkedibsfovlfdjfxttanviia` (`name`),
  KEY `idx_qcipmwmdglhhtpnrcubhoiygqjllbpnrmcfv` (`handle`),
  KEY `idx_lfjhphehpmitcyarytkvmgurulfygqqtvmeg` (`fieldLayoutId`),
  KEY `idx_phpqhishrbctvfyvaoiacxmkxhlqrzpjuqyl` (`dateDeleted`),
  CONSTRAINT `fk_lsjruvfngofwbciybgbqtixtpvfywwwdwcld` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vloicdsmnuchrezopocxjpugsubwfrrbmwlp` (`userId`),
  CONSTRAINT `fk_jzftgmrhxbpcaavzdfscnfwuiaujdgazpnrn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-13 13:29:33
-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2023-04-12 22:23:31','2023-04-12 22:23:31','7e97b8d5-1057-4673-8587-b48deab0adb9'),(2,2,1,'Home','2023-04-12 22:31:55','2023-04-12 22:31:55','c008a53b-03de-4a75-ade1-b6a8b4f9e602'),(3,3,1,'Home','2023-04-12 22:31:55','2023-04-12 22:31:55','37b0be2a-c2e4-486b-b219-1603d0665692'),(4,4,1,'Home','2023-04-12 22:31:55','2023-04-12 22:31:55','339105fd-af21-4c3d-993e-b6b60f8e4977');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-04-12 22:23:31','2023-04-12 22:23:31',NULL,NULL,'e4e5037f-3efa-4d08-9b8f-388fca0ce2d6'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2023-04-12 22:31:55','2023-04-12 22:31:55',NULL,NULL,'436ca604-69eb-43c2-8144-7cf1a23e54b0'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2023-04-12 22:31:55','2023-04-12 22:31:55',NULL,NULL,'1c0a10ef-1745-4f02-967a-e7a7bef49236'),(4,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2023-04-12 22:31:55','2023-04-12 22:31:55',NULL,NULL,'f3bfea00-890a-488c-8a08-5c675b05bb16');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2023-04-12 22:23:31','2023-04-12 22:23:31','feffd907-1b09-4c6d-879a-afe761cbe714'),(2,2,1,'home','__home__',1,'2023-04-12 22:31:55','2023-04-12 22:31:55','fc2c36ab-54d1-456a-b62c-47d7510803aa'),(3,3,1,'home','__home__',1,'2023-04-12 22:31:55','2023-04-12 22:31:55','6a532e55-9024-4d81-b5ef-855f9563467b'),(4,4,1,'home','__home__',1,'2023-04-12 22:31:55','2023-04-12 22:31:55','503f160d-9490-48f0-9bab-ffacefa54d4f');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (2,1,NULL,1,NULL,'2023-04-12 22:31:00',NULL,NULL,'2023-04-12 22:31:55','2023-04-12 22:31:55'),(3,1,NULL,1,NULL,'2023-04-12 22:31:00',NULL,NULL,'2023-04-12 22:31:55','2023-04-12 22:31:55'),(4,1,NULL,1,NULL,'2023-04-12 22:31:00',NULL,NULL,'2023-04-12 22:31:55','2023-04-12 22:31:55');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,1,'Home','home',0,'site',NULL,'{section.name|raw}',1,'2023-04-12 22:31:55','2023-04-12 22:31:55',NULL,'b735d688-a8ce-450c-92f3-0c09006ba218');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2023-04-12 22:23:31','2023-04-12 22:23:31',NULL,'5affaa6d-693b-48ad-b39f-8d47fa961fcc');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2023-04-12 22:31:55','2023-04-12 22:31:55',NULL,'03213db3-0e5c-4723-95e8-a6e404eb3821');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (1,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"377a2bb8-0730-45e8-acb1-af6995cf89d5\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-04-12 22:31:55','2023-04-12 22:31:55','51f37b99-e745-43b8-8865-d1fec2696632');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.4.7','4.4.0.4',0,'fkfxhcjxieox','3@hxhlxsfxgk','2023-04-12 22:23:31','2023-04-12 22:38:46','885517e8-0caf-4319-9caf-197202d739cb');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `lenz_linkfield`
--

LOCK TABLES `lenz_linkfield` WRITE;
/*!40000 ALTER TABLE `lenz_linkfield` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `lenz_linkfield` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','8e1d1473-fb77-4608-8a4f-25c93dd2d810'),(2,'craft','m210121_145800_asset_indexing_changes','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','8c388cae-f06b-4cdc-8f01-f816ceb727f7'),(3,'craft','m210624_222934_drop_deprecated_tables','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','aca3df94-2c68-41a0-aa6f-254bf0aed091'),(4,'craft','m210724_180756_rename_source_cols','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','133d396c-9bd4-4c9f-94a7-a8b2a55065a6'),(5,'craft','m210809_124211_remove_superfluous_uids','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','cbaf4d24-d096-4f74-bb7b-9cbdb3e2f60e'),(6,'craft','m210817_014201_universal_users','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','4ecb1b20-c96a-403c-8183-2ca5ae631b95'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','b200a34d-df97-419e-95bb-b20780a2f765'),(8,'craft','m211115_135500_image_transformers','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','8b33c73e-4039-42a4-894a-7da2b233cc95'),(9,'craft','m211201_131000_filesystems','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','6c1b0010-245a-40df-b7e4-4f276e7a2713'),(10,'craft','m220103_043103_tab_conditions','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','a6289204-0b7a-4061-80e7-c132a331a9ec'),(11,'craft','m220104_003433_asset_alt_text','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','a84e3ef2-ab91-4505-ac36-2c35563fdc8f'),(12,'craft','m220123_213619_update_permissions','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','bc2818d8-8c5b-4531-8d97-e85441b73577'),(13,'craft','m220126_003432_addresses','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','9aab55c5-8259-4533-826f-8bbfd03a025e'),(14,'craft','m220209_095604_add_indexes','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','d580cfb4-1fb7-4ec1-9977-0203805f2c0a'),(15,'craft','m220213_015220_matrixblocks_owners_table','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','c163c8df-5f84-4cbf-b7f6-a2bd4d0ff56c'),(16,'craft','m220214_000000_truncate_sessions','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','23fe53e0-4ac2-4a9d-9b17-ecd712ff8ccc'),(17,'craft','m220222_122159_full_names','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','b015050c-850b-41b4-b7fd-3c4ce59f21ec'),(18,'craft','m220223_180559_nullable_address_owner','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','be255913-89b9-440a-a595-dc2a720a6102'),(19,'craft','m220225_165000_transform_filesystems','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','3d95ca3e-28f4-42aa-b7cd-67e86fb2f8ba'),(20,'craft','m220309_152006_rename_field_layout_elements','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','9b0c9552-8422-4f3f-a406-f09190f43636'),(21,'craft','m220314_211928_field_layout_element_uids','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','57c7a060-d53a-4bf2-8958-d1013afbcddd'),(22,'craft','m220316_123800_transform_fs_subpath','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','1f7ee9aa-b027-4841-ae56-dcc918f3748b'),(23,'craft','m220317_174250_release_all_jobs','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','55503de9-f49f-416c-bcba-233a6f9b2713'),(24,'craft','m220330_150000_add_site_gql_schema_components','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','0dc889eb-2fd3-4daa-9aba-961ff3e15e6a'),(25,'craft','m220413_024536_site_enabled_string','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','cbf6923f-06dd-44c5-8ffa-2ff1457a3181'),(26,'craft','m221027_160703_add_image_transform_fill','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','7368c61a-4f25-4634-9899-24aacc598acd'),(27,'craft','m221028_130548_add_canonical_id_index','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','bc4b04c7-a364-4414-bbda-eab99b8c6a89'),(28,'craft','m221118_003031_drop_element_fks','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','8ff412f1-7bf0-4918-987c-4debdabd56de'),(29,'craft','m230131_120713_asset_indexing_session_new_options','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','3c96fb8c-4329-4478-9a16-80b92e320445'),(30,'craft','m230226_013114_drop_plugin_license_columns','2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-12 22:23:31','93632868-b31b-406f-835c-7ed8f1fa2fe8'),(31,'plugin:redactor','m180430_204710_remove_old_plugins','2023-04-12 22:33:17','2023-04-12 22:33:17','2023-04-12 22:33:17','76fe6b4e-d31b-46fe-a39a-4e57a21679f0'),(32,'plugin:redactor','Install','2023-04-12 22:33:17','2023-04-12 22:33:17','2023-04-12 22:33:17','05fa4773-6df1-4ceb-b296-9b8e4acf0d37'),(33,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2023-04-12 22:33:17','2023-04-12 22:33:17','2023-04-12 22:33:17','51414339-9283-46a3-8e68-693f9a3903ce'),(34,'plugin:seomatic','Install','2023-04-12 22:33:42','2023-04-12 22:33:42','2023-04-12 22:33:42','929cfb62-36de-46ec-bd2d-c6e8fa7c6655'),(35,'plugin:seomatic','m180314_002755_field_type','2023-04-12 22:33:42','2023-04-12 22:33:42','2023-04-12 22:33:42','d1cd8f6a-066b-48b0-bfec-7bf13ba5b272'),(36,'plugin:seomatic','m180314_002756_base_install','2023-04-12 22:33:42','2023-04-12 22:33:42','2023-04-12 22:33:42','ab208d4a-c5d6-4ad5-a523-dd24821e02c3'),(37,'plugin:seomatic','m180502_202319_remove_field_metabundles','2023-04-12 22:33:42','2023-04-12 22:33:42','2023-04-12 22:33:42','ba288adc-f5cd-47ca-bf5f-edf326ac541d'),(38,'plugin:seomatic','m180711_024947_commerce_products','2023-04-12 22:33:42','2023-04-12 22:33:42','2023-04-12 22:33:42','82074060-5508-450d-a24f-36b60feaa026'),(39,'plugin:seomatic','m190401_220828_longer_handles','2023-04-12 22:33:42','2023-04-12 22:33:42','2023-04-12 22:33:42','3f2ea0b4-aad3-4b76-baaf-98193400648e'),(40,'plugin:seomatic','m190518_030221_calendar_events','2023-04-12 22:33:42','2023-04-12 22:33:42','2023-04-12 22:33:42','d642ac90-54bb-4b58-9927-8dc8e43950ea'),(41,'plugin:seomatic','m200419_203444_add_type_id','2023-04-12 22:33:42','2023-04-12 22:33:42','2023-04-12 22:33:42','46e8b6f6-c1e9-4af1-b871-05d672d3da80'),(42,'plugin:seomatic','m210603_213100_add_gql_schema_components','2023-04-12 22:33:42','2023-04-12 22:33:42','2023-04-12 22:33:42','ed16dddf-d21a-475f-af44-804c995ddd4b'),(43,'plugin:seomatic','m210817_230853_announcement_v3_4','2023-04-12 22:33:42','2023-04-12 22:33:42','2023-04-12 22:33:42','440c08be-ef85-4254-ae0d-465caf68dd94'),(44,'plugin:neo','Install','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','44b41f88-54c1-4d46-9534-bf9482200e73'),(45,'plugin:neo','m220409_142203_neoblocks_owners_table','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','707f4a44-d867-47ed-ada5-9f7237a94051'),(46,'plugin:neo','m220411_111523_remove_ownersiteid_and_uid_neoblocks_columns','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','67454ce4-1482-49de-ab7b-382d7ddd88ba'),(47,'plugin:neo','m220412_135950_neoblockstructures_rename_ownersiteid_to_siteid','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','a9b31d68-aef5-4cb9-9801-46da9afcaa81'),(48,'plugin:neo','m220421_105948_resave_shared_field_layouts','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','223dde96-d22f-4106-b64a-35e613ece338'),(49,'plugin:neo','m220428_060316_add_group_dropdown_setting','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','73a75218-7bee-4bbc-896f-31b090790f75'),(50,'plugin:neo','m220511_054742_delete_converted_field_block_types_and_groups','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','033ff79f-9c56-40f3-b796-af776d038929'),(51,'plugin:neo','m220516_124013_add_blocktype_description','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','fa57ec12-3d8d-4f68-813a-ae47f619ca34'),(52,'plugin:neo','m220723_153601_add_conditions_column_to_block_types','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','765b06bc-e04a-4d71-8097-3b5c8f6e2952'),(53,'plugin:neo','m220731_130608_add_min_child_blocks_column_to_block_types','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','f4c2b794-e2f4-430b-b326-72102a45da31'),(54,'plugin:neo','m220805_072702_add_min_blocks_column_to_block_types','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','33ad5c3f-99e6-4910-86e3-4c0cb3eb319b'),(55,'plugin:neo','m220805_112335_add_min_sibling_blocks_column_to_block_types','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','c9bf5a88-ed30-4ba8-a33b-e742ae216c25'),(56,'plugin:neo','m220812_115137_add_enabled_column_to_block_types','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','7f7b891d-de2d-4c83-b735-1d537d0e9f31'),(57,'plugin:neo','m221006_052456_add_group_child_block_types_column_to_block_types','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','4e8d0dfe-d55e-4a1b-840a-262d2b1625f6'),(58,'plugin:neo','m221110_132322_add_ignore_permissions_to_block_types','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','ce752a62-1878-4898-a037-85ea58fb0290'),(59,'plugin:neo','m221231_110307_add_block_type_icon_property','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','fb8c60b4-7199-4ae6-b797-6e1ede8750a8'),(60,'plugin:neo','m230202_000653_convert_project_config_icon_data','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','f93de711-c5b8-4048-a210-696301d3f805'),(61,'plugin:typedlinkfield','Install','2023-04-12 22:38:40','2023-04-12 22:38:40','2023-04-12 22:38:40','a0c69ad5-75cf-436f-ad0b-5748342ec10d'),(62,'plugin:typedlinkfield','m190417_202153_migrateDataToTable','2023-04-12 22:38:40','2023-04-12 22:38:40','2023-04-12 22:38:40','72cbef01-3e94-43f2-8cb2-5e7588209b6a'),(63,'plugin:super-table','Install','2023-04-12 22:38:43','2023-04-12 22:38:43','2023-04-12 22:38:43','45659971-8cfc-4f5a-943a-26e9cad8cbaa'),(64,'plugin:super-table','m220308_000000_remove_superfluous_uids','2023-04-12 22:38:43','2023-04-12 22:38:43','2023-04-12 22:38:43','36969300-6037-4797-91df-15b74cf1bde2'),(65,'plugin:super-table','m220308_100000_owners_table','2023-04-12 22:38:43','2023-04-12 22:38:43','2023-04-12 22:38:43','fc32635f-82a4-4583-9a7d-dfa9a85edc04');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblocks`
--

LOCK TABLES `neoblocks` WRITE;
/*!40000 ALTER TABLE `neoblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `neoblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblocks_owners`
--

LOCK TABLES `neoblocks_owners` WRITE;
/*!40000 ALTER TABLE `neoblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `neoblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblockstructures`
--

LOCK TABLES `neoblockstructures` WRITE;
/*!40000 ALTER TABLE `neoblockstructures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `neoblockstructures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblocktypegroups`
--

LOCK TABLES `neoblocktypegroups` WRITE;
/*!40000 ALTER TABLE `neoblocktypegroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `neoblocktypegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblocktypes`
--

LOCK TABLES `neoblocktypes` WRITE;
/*!40000 ALTER TABLE `neoblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `neoblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'redactor','3.0.4','2.3.0','2023-04-12 22:33:17','2023-04-12 22:33:17','2023-04-12 22:33:17','96d2f798-62e7-4fb0-aa8a-fcfc00c724f0'),(2,'seomatic','4.0.23','3.0.11','2023-04-12 22:33:42','2023-04-12 22:33:42','2023-04-12 22:33:42','e93e7569-9f2e-446c-b213-da826c53e520'),(3,'neo','3.7.6','3.6.2','2023-04-12 22:38:17','2023-04-12 22:38:17','2023-04-12 22:38:17','b440c86a-53b9-4dea-93de-b42eec8a7810'),(4,'typedlinkfield','2.1.5','2.0.0','2023-04-12 22:38:40','2023-04-12 22:38:40','2023-04-12 22:38:40','6024f6d0-8702-44c0-86b7-267fb2f97f85'),(5,'super-table','3.0.8.1','3.0.0','2023-04-12 22:38:43','2023-04-12 22:38:43','2023-04-12 22:38:43','cdef07e8-3286-46f1-b68c-b21ed7101699'),(6,'vite','4.0.5','1.0.0','2023-04-12 22:38:46','2023-04-12 22:38:46','2023-04-12 22:38:46','ee8c926a-7d22-40fa-a835-8f23849cc8e9');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1681339126'),('email.fromEmail','\"dev@steadfast.design\"'),('email.fromName','\"Website by Steadfast\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elementCondition','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.autocapitalize','true'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.autocomplete','false'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.autocorrect','true'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.class','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.disabled','false'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.elementCondition','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.id','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.instructions','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.label','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.max','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.min','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.name','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.orientation','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.placeholder','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.readonly','false'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.requirable','false'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.size','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.step','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.tip','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.title','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.uid','\"377a2bb8-0730-45e8-acb1-af6995cf89d5\"'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.userCondition','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.warning','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.elements.0.width','100'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.name','\"Content\"'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.uid','\"51f37b99-e745-43b8-8865-d1fec2696632\"'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.fieldLayouts.03213db3-0e5c-4723-95e8-a6e404eb3821.tabs.0.userCondition','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.handle','\"home\"'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.hasTitleField','false'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.name','\"Home\"'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.section','\"24a695c1-dfdb-490b-b2f4-418f10fa70a4\"'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.sortOrder','1'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.titleFormat','\"{section.name|raw}\"'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.titleTranslationKeyFormat','null'),('entryTypes.b735d688-a8ce-450c-92f3-0c09006ba218.titleTranslationMethod','\"site\"'),('fieldGroups.5affaa6d-693b-48ad-b39f-8d47fa961fcc.name','\"Common\"'),('meta.__names__.24a695c1-dfdb-490b-b2f4-418f10fa70a4','\"Home\"'),('meta.__names__.29ddc6b2-605e-432e-8a0a-61bd5db71d93','\"Website by Steadfast\"'),('meta.__names__.5affaa6d-693b-48ad-b39f-8d47fa961fcc','\"Common\"'),('meta.__names__.71aef9fa-1e77-4cfa-bbd1-a48006412d66','\"Website by Steadfast\"'),('meta.__names__.b735d688-a8ce-450c-92f3-0c09006ba218','\"Home\"'),('plugins.neo.edition','\"standard\"'),('plugins.neo.enabled','true'),('plugins.neo.licenseKey','\"E7GYN0H96SCCCI0U06X8LK53\"'),('plugins.neo.schemaVersion','\"3.6.2\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('plugins.seomatic.edition','\"standard\"'),('plugins.seomatic.enabled','true'),('plugins.seomatic.licenseKey','\"M5VO46R5Q7Y013JNSWGPN5XE\"'),('plugins.seomatic.schemaVersion','\"3.0.11\"'),('plugins.super-table.edition','\"standard\"'),('plugins.super-table.enabled','true'),('plugins.super-table.schemaVersion','\"3.0.0\"'),('plugins.typedlinkfield.edition','\"standard\"'),('plugins.typedlinkfield.enabled','true'),('plugins.typedlinkfield.schemaVersion','\"2.0.0\"'),('plugins.vite.edition','\"standard\"'),('plugins.vite.enabled','true'),('plugins.vite.schemaVersion','\"1.0.0\"'),('sections.24a695c1-dfdb-490b-b2f4-418f10fa70a4.defaultPlacement','\"end\"'),('sections.24a695c1-dfdb-490b-b2f4-418f10fa70a4.enableVersioning','true'),('sections.24a695c1-dfdb-490b-b2f4-418f10fa70a4.handle','\"home\"'),('sections.24a695c1-dfdb-490b-b2f4-418f10fa70a4.name','\"Home\"'),('sections.24a695c1-dfdb-490b-b2f4-418f10fa70a4.propagationMethod','\"all\"'),('sections.24a695c1-dfdb-490b-b2f4-418f10fa70a4.siteSettings.71aef9fa-1e77-4cfa-bbd1-a48006412d66.enabledByDefault','true'),('sections.24a695c1-dfdb-490b-b2f4-418f10fa70a4.siteSettings.71aef9fa-1e77-4cfa-bbd1-a48006412d66.hasUrls','true'),('sections.24a695c1-dfdb-490b-b2f4-418f10fa70a4.siteSettings.71aef9fa-1e77-4cfa-bbd1-a48006412d66.template','\"_entries/home.twig\"'),('sections.24a695c1-dfdb-490b-b2f4-418f10fa70a4.siteSettings.71aef9fa-1e77-4cfa-bbd1-a48006412d66.uriFormat','\"__home__\"'),('sections.24a695c1-dfdb-490b-b2f4-418f10fa70a4.type','\"single\"'),('siteGroups.29ddc6b2-605e-432e-8a0a-61bd5db71d93.name','\"Website by Steadfast\"'),('sites.71aef9fa-1e77-4cfa-bbd1-a48006412d66.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.71aef9fa-1e77-4cfa-bbd1-a48006412d66.handle','\"default\"'),('sites.71aef9fa-1e77-4cfa-bbd1-a48006412d66.hasUrls','true'),('sites.71aef9fa-1e77-4cfa-bbd1-a48006412d66.language','\"en-US\"'),('sites.71aef9fa-1e77-4cfa-bbd1-a48006412d66.name','\"Website by Steadfast\"'),('sites.71aef9fa-1e77-4cfa-bbd1-a48006412d66.primary','true'),('sites.71aef9fa-1e77-4cfa-bbd1-a48006412d66.siteGroup','\"29ddc6b2-605e-432e-8a0a-61bd5db71d93\"'),('sites.71aef9fa-1e77-4cfa-bbd1-a48006412d66.sortOrder','1'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Website by Steadfast\"'),('system.schemaVersion','\"4.4.0.4\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' dev steadfast design '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' steadfast '),(2,'slug',0,1,' home '),(2,'title',0,1,' home ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Home','home','single',1,'all','end',NULL,'2023-04-12 22:31:55','2023-04-12 22:31:55',NULL,'24a695c1-dfdb-490b-b2f4-418f10fa70a4');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','_entries/home.twig',1,'2023-04-12 22:31:55','2023-04-12 22:31:55','54653ee9-0c12-4fb8-bb69-e9a6bc631cd9');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `seomatic_metabundles`
--

LOCK TABLES `seomatic_metabundles` WRITE;
/*!40000 ALTER TABLE `seomatic_metabundles` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `seomatic_metabundles` VALUES (1,'2023-04-12 22:33:42','2023-04-12 22:33:42','50e1413a-7ea9-4135-9628-086cb2b12be8','1.0.62','__GLOBAL_BUNDLE__',1,'__GLOBAL_BUNDLE__','__GLOBAL_BUNDLE__','__GLOBAL_BUNDLE__',NULL,'',1,'[]','2023-04-12 22:33:42','{\"language\":null,\"mainEntityOfPage\":\"WebSite\",\"seoTitle\":\"\",\"siteNamePosition\":\"before\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{{ seomatic.helper.safeCanonicalUrl() }}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{{ seomatic.meta.seoTitle }}\",\"ogSiteNamePosition\":\"none\",\"ogDescription\":\"{{ seomatic.meta.seoDescription }}\",\"ogImage\":\"{{ seomatic.meta.seoImage }}\",\"ogImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"ogImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"ogImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"twitterCard\":\"summary\",\"twitterCreator\":\"{{ seomatic.site.twitterHandle }}\",\"twitterTitle\":\"{{ seomatic.meta.seoTitle }}\",\"twitterSiteNamePosition\":\"none\",\"twitterDescription\":\"{{ seomatic.meta.seoDescription }}\",\"twitterImage\":\"{{ seomatic.meta.seoImage }}\",\"twitterImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"twitterImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"twitterImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"Website by Steadfast\",\"identity\":{\"siteType\":\"Organization\",\"siteSubType\":\"LocalBusiness\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"\",\"genericAlternateName\":\"\",\"genericDescription\":\"\",\"genericUrl\":\"\",\"genericImage\":\"\",\"genericImageWidth\":\"\",\"genericImageHeight\":\"\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"\",\"genericAddressRegion\":\"\",\"genericPostalCode\":\"\",\"genericAddressCountry\":\"\",\"genericGeoLatitude\":\"\",\"genericGeoLongitude\":\"\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"\",\"organizationFoundingDate\":\"\",\"organizationFoundingLocation\":\"\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"creator\":{\"siteType\":\"Organization\",\"siteSubType\":\"LocalBusiness\",\"siteSpecificType\":\"\",\"computedType\":\"Organization\",\"genericName\":\"\",\"genericAlternateName\":\"\",\"genericDescription\":\"\",\"genericUrl\":\"\",\"genericImage\":\"\",\"genericImageWidth\":\"\",\"genericImageHeight\":\"\",\"genericImageIds\":[],\"genericTelephone\":\"\",\"genericEmail\":\"\",\"genericStreetAddress\":\"\",\"genericAddressLocality\":\"\",\"genericAddressRegion\":\"\",\"genericPostalCode\":\"\",\"genericAddressCountry\":\"\",\"genericGeoLatitude\":\"\",\"genericGeoLongitude\":\"\",\"personGender\":\"\",\"personBirthPlace\":\"\",\"organizationDuns\":\"\",\"organizationFounder\":\"\",\"organizationFoundingDate\":\"\",\"organizationFoundingLocation\":\"\",\"organizationContactPoints\":[],\"corporationTickerSymbol\":\"\",\"localBusinessPriceRange\":\"\",\"localBusinessOpeningHours\":[],\"restaurantServesCuisine\":\"\",\"restaurantMenuUrl\":\"\",\"restaurantReservationsUrl\":\"\"},\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":{\"twitter\":{\"siteName\":\"Twitter\",\"handle\":\"twitter\",\"url\":\"\"},\"facebook\":{\"siteName\":\"Facebook\",\"handle\":\"facebook\",\"url\":\"\"},\"wikipedia\":{\"siteName\":\"Wikipedia\",\"handle\":\"wikipedia\",\"url\":\"\"},\"linkedin\":{\"siteName\":\"LinkedIn\",\"handle\":\"linkedin\",\"url\":\"\"},\"googleplus\":{\"siteName\":\"Google+\",\"handle\":\"googleplus\",\"url\":\"\"},\"youtube\":{\"siteName\":\"YouTube\",\"handle\":\"youtube\",\"url\":\"\"},\"instagram\":{\"siteName\":\"Instagram\",\"handle\":\"instagram\",\"url\":\"\"},\"pinterest\":{\"siteName\":\"Pinterest\",\"handle\":\"pinterest\",\"url\":\"\"},\"github\":{\"siteName\":\"GitHub\",\"handle\":\"github\",\"url\":\"\"},\"vimeo\":{\"siteName\":\"Vimeo\",\"handle\":\"vimeo\",\"url\":\"\"}},\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":{\"generator\":{\"charset\":\"\",\"content\":\"SEOmatic\",\"httpEquiv\":\"\",\"name\":\"generator\",\"property\":null,\"include\":true,\"key\":\"generator\",\"environment\":null,\"dependencies\":{\"config\":[\"generatorEnabled\"]},\"tagAttrs\":[]},\"keywords\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.seoKeywords }}\",\"httpEquiv\":\"\",\"name\":\"keywords\",\"property\":null,\"include\":true,\"key\":\"keywords\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.seoDescription }}\",\"httpEquiv\":\"\",\"name\":\"description\",\"property\":null,\"include\":true,\"key\":\"description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"referrer\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.referrer }}\",\"httpEquiv\":\"\",\"name\":\"referrer\",\"property\":null,\"include\":true,\"key\":\"referrer\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"robots\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.robots }}\",\"httpEquiv\":\"\",\"name\":\"robots\",\"property\":null,\"include\":true,\"key\":\"robots\",\"environment\":{\"live\":{\"content\":\"{{ seomatic.meta.robots }}\"},\"staging\":{\"content\":\"none\"},\"local\":{\"content\":\"none\"}},\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":{\"fb:profile_id\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookProfileId }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:profile_id\",\"include\":true,\"key\":\"fb:profile_id\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"fb:app_id\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookAppId }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"fb:app_id\",\"include\":true,\"key\":\"fb:app_id\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:locale\":{\"charset\":\"\",\"content\":\"{{ craft.app.language |replace({\\\"-\\\": \\\"_\\\"}) }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale\",\"include\":true,\"key\":\"og:locale\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:locale:alternate\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:locale:alternate\",\"include\":true,\"key\":\"og:locale:alternate\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:site_name\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.siteName }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:site_name\",\"include\":true,\"key\":\"og:site_name\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:type\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogType }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:type\",\"include\":true,\"key\":\"og:type\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:url\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.canonicalUrl }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:url\",\"include\":true,\"key\":\"og:url\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:title\":{\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.ogSiteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogTitle }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:title\",\"include\":true,\"key\":\"og:title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogDescription }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:description\",\"include\":true,\"key\":\"og:description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:image\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImage }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image\",\"include\":true,\"key\":\"og:image\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"og:image:width\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageWidth }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:width\",\"include\":true,\"key\":\"og:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:image:height\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageHeight }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:height\",\"include\":true,\"key\":\"og:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:image:alt\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.ogImageDescription }}\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:image:alt\",\"include\":true,\"key\":\"og:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"og:image\"]},\"tagAttrs\":[]},\"og:see_also\":{\"charset\":\"\",\"content\":\"\",\"httpEquiv\":\"\",\"name\":\"\",\"property\":\"og:see_also\",\"include\":true,\"key\":\"og:see_also\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"facebook-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.facebookSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"facebook-domain-verification\",\"property\":null,\"include\":true,\"key\":\"facebook-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"facebookSiteVerification\"]},\"tagAttrs\":[]}},\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":{\"twitter:card\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterCard }}\",\"httpEquiv\":\"\",\"name\":\"twitter:card\",\"property\":null,\"include\":true,\"key\":\"twitter:card\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:site\":{\"charset\":\"\",\"content\":\"@{{ seomatic.site.twitterHandle }}\",\"httpEquiv\":\"\",\"name\":\"twitter:site\",\"property\":null,\"include\":true,\"key\":\"twitter:site\",\"environment\":null,\"dependencies\":{\"site\":[\"twitterHandle\"]},\"tagAttrs\":[]},\"twitter:creator\":{\"charset\":\"\",\"content\":\"@{{ seomatic.meta.twitterCreator }}\",\"httpEquiv\":\"\",\"name\":\"twitter:creator\",\"property\":null,\"include\":true,\"key\":\"twitter:creator\",\"environment\":null,\"dependencies\":{\"meta\":[\"twitterCreator\"]},\"tagAttrs\":[]},\"twitter:title\":{\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.twitterSiteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterTitle }}\",\"httpEquiv\":\"\",\"name\":\"twitter:title\",\"property\":null,\"include\":true,\"key\":\"twitter:title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:description\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterDescription }}\",\"httpEquiv\":\"\",\"name\":\"twitter:description\",\"property\":null,\"include\":true,\"key\":\"twitter:description\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:image\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImage }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image\",\"property\":null,\"include\":true,\"key\":\"twitter:image\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"twitter:image:width\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageWidth }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:width\",\"property\":null,\"include\":true,\"key\":\"twitter:image:width\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]},\"twitter:image:height\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageHeight }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:height\",\"property\":null,\"include\":true,\"key\":\"twitter:image:height\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]},\"twitter:image:alt\":{\"charset\":\"\",\"content\":\"{{ seomatic.meta.twitterImageDescription }}\",\"httpEquiv\":\"\",\"name\":\"twitter:image:alt\",\"property\":null,\"include\":true,\"key\":\"twitter:image:alt\",\"environment\":null,\"dependencies\":{\"tag\":[\"twitter:image\"]},\"tagAttrs\":[]}},\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":null,\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":{\"google-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.googleSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"google-site-verification\",\"property\":null,\"include\":true,\"key\":\"google-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"googleSiteVerification\"]},\"tagAttrs\":[]},\"bing-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.bingSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"msvalidate.01\",\"property\":null,\"include\":true,\"key\":\"bing-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"bingSiteVerification\"]},\"tagAttrs\":[]},\"pinterest-site-verification\":{\"charset\":\"\",\"content\":\"{{ seomatic.site.pinterestSiteVerification }}\",\"httpEquiv\":\"\",\"name\":\"p:domain_verify\",\"property\":null,\"include\":true,\"key\":\"pinterest-site-verification\",\"environment\":null,\"dependencies\":{\"site\":[\"pinterestSiteVerification\"]},\"tagAttrs\":[]}},\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":{\"canonical\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.meta.canonicalUrl }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"canonical\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"canonical\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"home\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"\\/\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"home\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"home\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]},\"author\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.helper.siteUrl(\\\"\\/humans.txt\\\") }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"author\",\"sizes\":\"\",\"type\":\"text\\/plain\",\"include\":true,\"key\":\"author\",\"environment\":null,\"dependencies\":{\"frontend_template\":[\"humans\"]},\"tagAttrs\":[]},\"publisher\":{\"crossorigin\":\"\",\"href\":\"{{ seomatic.site.googlePublisherLink }}\",\"hreflang\":\"\",\"media\":\"\",\"rel\":\"publisher\",\"sizes\":\"\",\"type\":\"\",\"include\":true,\"key\":\"publisher\",\"environment\":null,\"dependencies\":{\"site\":[\"googlePublisherLink\"]},\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":{\"gtag\":{\"name\":\"Google gtag.js\",\"description\":\"The global site tag (gtag.js) is a JavaScript tagging framework and API that allows you to send event data to AdWords, DoubleClick, and Google Analytics. Instead of having to manage multiple tags for different products, you can use gtag.js and more easily benefit from the latest tracking features and integrations as they become available. [Learn More](https:\\/\\/developers.google.com\\/gtagjs\\/)\",\"templatePath\":\"_frontend\\/scripts\\/gtagHead.twig\",\"templateString\":\"{% set gtagProperty = googleAnalyticsId.value ??? googleAdWordsId.value ??? dcFloodlightId.value ??? null %}\\n{% if gtagProperty %}\\nwindow.dataLayer = window.dataLayer || [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\nfunction gtag(){dataLayer.push(arguments)};\\ngtag(\'js\', new Date());\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if googleAnalyticsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'anonymize_ip\': #{ipAnonymization.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'link_attribution\': #{enhancedLinkAttribution.value ? \'true\' : \'false\'},\\\"\\n    ~ \\\"\'allow_display_features\': #{displayFeatures.value ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAnalyticsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if googleAdWordsId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ googleAdWordsId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% if dcFloodlightId.value %}\\n{%- set gtagConfig = \\\"{\\\"\\n    ~ \\\"\'send_page_view\': #{pageView ? \'true\' : \'false\'}\\\"\\n    ~ \\\"}\\\"\\n-%}\\ngtag(\'config\', \'{{ dcFloodlightId.value }}\', {{ gtagConfig }});\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/gtagBody.twig\",\"bodyTemplateString\":\"{% set gtagProperty = googleAnalyticsId.value ??? googleAdWordsId.value ??? dcFloodlightId.value ??? null %}\\n{% if gtagProperty %}\\n<script async src=\\\"{{ gtagScriptUrl.value }}?id={{ gtagProperty }}\\\"><\\/script>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleAnalyticsId\":{\"title\":\"Google Analytics Measurement\\/Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `G-XXXXXXXXXX` or `UA-XXXXXX-XX`, not the entire script code. [Learn More](https:\\/\\/support.google.com\\/analytics\\/answer\\/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"googleAdWordsId\":{\"title\":\"AdWords Conversion ID\",\"instructions\":\"Only enter the ID, e.g.: `AW-XXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.google.com\\/adwords-remarketing-tag\\/)\",\"type\":\"string\",\"value\":\"\"},\"dcFloodlightId\":{\"title\":\"DoubleClick Floodlight ID\",\"instructions\":\"Only enter the ID, e.g.: `DC-XXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/support.google.com\\/dcm\\/partner\\/answer\\/7568534)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send PageView\",\"instructions\":\"Controls whether the `gtag.js` script automatically sends a PageView to Google Analytics, AdWords, and DoubleClick Floodlight when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"In some cases, you might need to anonymize the IP addresses of hits sent to Google Analytics. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/gtagjs\\/ip-anonymization)\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Google Analytics Display Features\",\"instructions\":\"The display features plugin for gtag.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/gtagjs\\/display-features)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Google Analytics Enhanced Link Attribution\",\"instructions\":\"Enhanced link attribution improves click track reporting by automatically differentiating between multiple link clicks that have the same URL on a given page. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/gtagjs\\/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"gtagScriptUrl\":{\"title\":\"Google gtag.js Script URL\",\"instructions\":\"The URL to the Google gtag.js tracking script. Normally this should not be changed, unless you locally cache it. The JavaScript `dataLayer` will automatically be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.googletagmanager.com\\/gtag\\/js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"gtag\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"googleTagManager\":{\"name\":\"Google Tag Manager\",\"description\":\"Google Tag Manager is a tag management system that allows you to quickly and easily update tags and code snippets on your website. Once the Tag Manager snippet has been added to your website or mobile app, you can configure tags via a web-based user interface without having to alter and deploy additional code. [Learn More](https:\\/\\/support.google.com\\/tagmanager\\/answer\\/6102821?hl=en)\",\"templatePath\":\"_frontend\\/scripts\\/googleTagManagerHead.twig\",\"templateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n{{ dataLayerVariableName.value }} = [{% if dataLayer is defined and dataLayer %}{{ dataLayer |json_encode() |raw }}{% endif %}];\\n(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({\'gtm.start\':\\nnew Date().getTime(),event:\'gtm.js\'});var f=d.getElementsByTagName(s)[0],\\nj=d.createElement(s),dl=l!=\'dataLayer\'?\'&l=\'+l:\'\';j.async=true;j.src=\\n\'{{ googleTagManagerUrl.value }}?id=\'+i+dl;f.parentNode.insertBefore(j,f);\\n})(window,document,\'script\',\'{{ dataLayerVariableName.value }}\',\'{{ googleTagManagerId.value }}\');\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/googleTagManagerBody.twig\",\"bodyTemplateString\":\"{% if googleTagManagerId.value is defined and googleTagManagerId.value and not seomatic.helper.isPreview %}\\n<noscript><iframe src=\\\"{{ googleTagManagerNoScriptUrl.value }}?id={{ googleTagManagerId.value }}\\\"\\nheight=\\\"0\\\" width=\\\"0\\\" style=\\\"display:none;visibility:hidden\\\"><\\/iframe><\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"googleTagManagerId\":{\"title\":\"Google Tag Manager ID\",\"instructions\":\"Only enter the ID, e.g.: `GTM-XXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.google.com\\/tag-manager\\/quickstart)\",\"type\":\"string\",\"value\":\"\"},\"dataLayerVariableName\":{\"title\":\"DataLayer Variable Name\",\"instructions\":\"The name to use for the JavaScript DataLayer variable. The value of this variable will be set to the `dataLayer` Twig template variable.\",\"type\":\"string\",\"value\":\"dataLayer\"},\"googleTagManagerUrl\":{\"title\":\"Google Tag Manager Script URL\",\"instructions\":\"The URL to the Google Tag Manager script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.googletagmanager.com\\/gtm.js\"},\"googleTagManagerNoScriptUrl\":{\"title\":\"Google Tag Manager Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Google Tag Manager `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.googletagmanager.com\\/ns.html\"}},\"dataLayer\":[],\"include\":false,\"key\":\"googleTagManager\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"facebookPixel\":{\"name\":\"Facebook Pixel\",\"description\":\"The Facebook pixel is an analytics tool that helps you measure the effectiveness of your advertising. You can use the Facebook pixel to understand the actions people are taking on your website and reach audiences you care about. [Learn More](https:\\/\\/www.facebook.com\\/business\\/help\\/651294705016616)\",\"templatePath\":\"_frontend\\/scripts\\/facebookPixelHead.twig\",\"templateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?\\nn.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;\\nn.push=n;n.loaded=!0;n.version=\'2.0\';n.queue=[];t=b.createElement(e);t.async=!0;\\nt.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,\\ndocument,\'script\',\'{{ facebookPixelUrl.value }}\');\\nfbq(\'init\', \'{{ facebookPixelId.value }}\');\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nfbq(\'track\', \'PageView\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/facebookPixelBody.twig\",\"bodyTemplateString\":\"{% if facebookPixelId.value is defined and facebookPixelId.value %}\\n<noscript><img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none\\\"\\nsrc=\\\"{{ facebookPixelNoScriptUrl.value }}?id={{ facebookPixelId.value }}&ev=PageView&noscript=1\\\" \\/><\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"facebookPixelId\":{\"title\":\"Facebook Pixel ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.facebook.com\\/docs\\/facebook-pixel\\/api-reference)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Facebook Pixel PageView\",\"instructions\":\"Controls whether the Facebook Pixel script automatically sends a PageView to Facebook Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"facebookPixelUrl\":{\"title\":\"Facebook Pixel Script URL\",\"instructions\":\"The URL to the Facebook Pixel script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/connect.facebook.net\\/en_US\\/fbevents.js\"},\"facebookPixelNoScriptUrl\":{\"title\":\"Facebook Pixel Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Facebook Pixel `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.facebook.com\\/tr\"}},\"dataLayer\":[],\"include\":false,\"key\":\"facebookPixel\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"linkedInInsight\":{\"name\":\"LinkedIn Insight\",\"description\":\"The LinkedIn Insight Tag is a lightweight JavaScript tag that powers conversion tracking, retargeting, and web analytics for LinkedIn ad campaigns.\",\"templatePath\":\"_frontend\\/scripts\\/linkedInInsightHead.twig\",\"templateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n_linkedin_data_partner_id = \\\"{{ dataPartnerId.value }}\\\";\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/linkedInInsightBody.twig\",\"bodyTemplateString\":\"{% if dataPartnerId.value is defined and dataPartnerId.value %}\\n<script type=\\\"text\\/javascript\\\">\\n(function(){var s = document.getElementsByTagName(\\\"script\\\")[0];\\n    var b = document.createElement(\\\"script\\\");\\n    b.type = \\\"text\\/javascript\\\";b.async = true;\\n    b.src = \\\"{{ linkedInInsightUrl.value }}\\\";\\n    s.parentNode.insertBefore(b, s);})();\\n<\\/script>\\n<noscript>\\n<img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none;\\\" alt=\\\"\\\" src=\\\"{{ linkedInInsightNoScriptUrl.value }}?pid={{ dataPartnerId.value }}&fmt=gif\\\" \\/>\\n<\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"dataPartnerId\":{\"title\":\"LinkedIn Data Partner ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/www.linkedin.com\\/help\\/lms\\/answer\\/65513\\/adding-the-linkedin-insight-tag-to-your-website?lang=en)\",\"type\":\"string\",\"value\":\"\"},\"linkedInInsightUrl\":{\"title\":\"LinkedIn Insight Script URL\",\"instructions\":\"The URL to the LinkedIn Insight script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/snap.licdn.com\\/li.lms-analytics\\/insight.min.js\"},\"linkedInInsightNoScriptUrl\":{\"title\":\"LinkedIn Insight &lt;noscript&gt; URL\",\"instructions\":\"The URL to the LinkedIn Insight `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/dc.ads.linkedin.com\\/collect\\/\"}},\"dataLayer\":[],\"include\":false,\"key\":\"linkedInInsight\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"hubSpot\":{\"name\":\"HubSpot\",\"description\":\"If you\'re not hosting your entire website on HubSpot, or have pages on your website that are not hosted on HubSpot, you\'ll need to install the HubSpot tracking code on your non-HubSpot pages in order to capture those analytics.\",\"templatePath\":null,\"templateString\":null,\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/hubSpotBody.twig\",\"bodyTemplateString\":\"{% if hubSpotId.value is defined and hubSpotId.value %}\\n<script type=\\\"text\\/javascript\\\" id=\\\"hs-script-loader\\\" async defer src=\\\"{{ hubSpotUrl.value }}{{ hubSpotId.value }}.js\\\"><\\/script>\\n{% endif %}\\n\",\"bodyPosition\":3,\"vars\":{\"hubSpotId\":{\"title\":\"HubSpot ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/knowledge.hubspot.com\\/articles\\/kcs_article\\/reports\\/install-the-hubspot-tracking-code)\",\"type\":\"string\",\"value\":\"\"},\"hubSpotUrl\":{\"title\":\"HubSpot Script URL\",\"instructions\":\"The URL to the HubSpot script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"\\/\\/js.hs-scripts.com\\/\"}},\"dataLayer\":[],\"include\":false,\"key\":\"hubSpot\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"pinterestTag\":{\"name\":\"Pinterest Tag\",\"description\":\"The Pinterest tag allows you to track actions people take on your website after viewing your Promoted Pin. You can use this information to measure return on ad spend (RoAS) and create audiences to target on your Promoted Pins. [Learn More](https:\\/\\/help.pinterest.com\\/en\\/business\\/article\\/track-conversions-with-pinterest-tag)\",\"templatePath\":\"_frontend\\/scripts\\/pinterestTagHead.twig\",\"templateString\":\"{% if pinterestTagId.value is defined and pinterestTagId.value %}\\n!function(e){if(!window.pintrk){window.pintrk=function(){window.pintrk.queue.push(\\nArray.prototype.slice.call(arguments))};var\\nn=window.pintrk;n.queue=[],n.version=\\\"3.0\\\";var\\nt=document.createElement(\\\"script\\\");t.async=!0,t.src=e;var\\nr=document.getElementsByTagName(\\\"script\\\")[0];r.parentNode.insertBefore(t,r)}}(\\\"{{ pinterestTagUrl.value }}\\\");\\npintrk(\'load\', \'{{ pinterestTagId.value }}\');\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\npintrk(\'page\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":\"_frontend\\/scripts\\/pinterestTagBody.twig\",\"bodyTemplateString\":\"{% if pinterestTagId.value is defined and pinterestTagId.value %}\\n<noscript><img height=\\\"1\\\" width=\\\"1\\\" style=\\\"display:none;\\\" alt=\\\"\\\" src=\\\"{{ pinterestTagNoScriptUrl.value }}?tid={{ pinterestTagId.value }}&noscript=1\\\" \\/><\\/noscript>\\n{% endif %}\\n\",\"bodyPosition\":2,\"vars\":{\"pinterestTagId\":{\"title\":\"Pinterest Tag ID\",\"instructions\":\"Only enter the ID, e.g.: `XXXXXXXXXX`, not the entire script code. [Learn More](https:\\/\\/developers.pinterest.com\\/docs\\/ad-tools\\/conversion-tag\\/)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Pinterest Tag PageView\",\"instructions\":\"Controls whether the Pinterest Tag script automatically sends a PageView to when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"pinterestTagUrl\":{\"title\":\"Pinterest Tag Script URL\",\"instructions\":\"The URL to the Pinterest Tag script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/s.pinimg.com\\/ct\\/core.js\"},\"pinterestTagNoScriptUrl\":{\"title\":\"Pinterest Tag Script &lt;noscript&gt; URL\",\"instructions\":\"The URL to the Pinterest Tag `&lt;noscript&gt;`. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/ct.pinterest.com\\/v3\\/\"}},\"dataLayer\":[],\"include\":false,\"key\":\"pinterestTag\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"fathom\":{\"name\":\"Fathom\",\"description\":\"Fathom is a simple, light-weight, privacy-first alternative to Google Analytics. So, stop scrolling through pages of reports and collecting gobs of personal data about your visitors, both of which you probably don’t need. [Learn More](https:\\/\\/usefathom.com\\/)\",\"templatePath\":\"_frontend\\/scripts\\/fathomAnalytics.twig\",\"templateString\":\"{% if siteId.value is defined and siteId.value %}\\n(function() {\\nvar tag = document.createElement(\'script\');\\ntag.src = \\\"{{ scriptUrl.value }}\\\";\\ntag.defer = true;\\ntag.setAttribute(\\\"data-site\\\", \\\"{{ siteId.value | raw }}\\\");\\n{% if honorDnt.value %}\\ntag.setAttribute(\\\"data-honor-dnt\\\", \\\"true\\\");\\n{% endif %}\\n{% if disableAutoTracking.value %}\\ntag.setAttribute(\\\"data-auto\\\", \\\"false\\\");\\n{% endif %}\\n{% if ignoreCanonicals.value %}\\ntag.setAttribute(\\\"data-canonical\\\", \\\"false\\\");\\n{% endif %}\\n{% if excludedDomains.value | length %}\\ntag.setAttribute(\\\"data-excluded-domains\\\", \\\"{{ excludedDomains.value | raw }}\\\");\\n{% endif %}\\n{% if includedDomains.value | length %}\\ntag.setAttribute(\\\"data-included-domains\\\", \\\"{{ includedDomains.value | raw }}\\\");\\n{% endif %}\\nvar firstScriptTag = document.getElementsByTagName(\'script\')[0];\\nfirstScriptTag.parentNode.insertBefore(tag, firstScriptTag);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteId\":{\"title\":\"Site ID\",\"instructions\":\"Only enter the Site ID, not the entire script code. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking)\",\"type\":\"string\",\"value\":\"\"},\"honorDnt\":{\"title\":\"Honoring Do Not Track (DNT)\",\"instructions\":\"By default we track every visitor to your website, regardless of them having DNT turned on or not. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"disableAutoTracking\":{\"title\":\"Disable automatic tracking\",\"instructions\":\"By default, we track a page view every time a visitor to your website loads a page with our script on it. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"ignoreCanonicals\":{\"title\":\"Ignore canonicals\",\"instructions\":\"If there’s a canonical URL in place, then by default we use it instead of the current URL. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"bool\",\"value\":false},\"excludedDomains\":{\"title\":\"Excluded Domains\",\"instructions\":\"You exclude one or several domains, so our tracker will track things on every domain, except the ones excluded. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"string\",\"value\":\"\"},\"includedDomains\":{\"title\":\"Included Domains\",\"instructions\":\"If you want to go in the opposite direction and only track stats on a specific domain. [Learn More](https:\\/\\/usefathom.com\\/support\\/tracking-advanced)\",\"type\":\"string\",\"value\":\"\"},\"scriptUrl\":{\"title\":\"Fathom Script URL\",\"instructions\":\"The URL to the Fathom tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/cdn.usefathom.com\\/script.js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"fathom\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"matomo\":{\"name\":\"Matomo\",\"description\":\"Matomo is a Google Analytics alternative that protects your data and your customers\' privacy [Learn More](https:\\/\\/matomo.org\\/)\",\"templatePath\":\"_frontend\\/scripts\\/matomoAnalytics.twig\",\"templateString\":\"{% if siteId.value is defined and siteId.value and scriptUrl.value is defined and scriptUrl.value | length %}\\nvar _paq = window._paq = window._paq || [];\\n{% if sendPageView.value %}\\n_paq.push([\'trackPageView\']);\\n{% endif %}\\n{% if sendPageView.value %}\\n_paq.push([\'enableLinkTracking\']);\\n{% endif %}\\n(function() {\\nvar u=\\\"{{ scriptUrl.value }}\\\";\\n_paq.push([\'setTrackerUrl\', u+\'matomo.php\']);\\n_paq.push([\'setSiteId\', {{ siteId.value }}]);\\nvar d=document, g=d.createElement(\'script\'), s=d.getElementsByTagName(\'script\')[0];\\ng.type=\'text\\/javascript\'; g.async=true; g.src=u+\'matomo.js\'; s.parentNode.insertBefore(g,s);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteId\":{\"title\":\"Site ID\",\"instructions\":\"Only enter the Site ID, not the entire script code. [Learn More](https:\\/\\/developer.matomo.org\\/guides\\/tracking-javascript-guide)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Matomo PageView\",\"instructions\":\"Controls whether the Matomo script automatically sends a PageView when your pages are loaded. [Learn More](https:\\/\\/developer.matomo.org\\/api-reference\\/tracking-javascript)\",\"type\":\"bool\",\"value\":true},\"enableLinkTracking\":{\"title\":\"Enable Link Tracking\",\"instructions\":\"Install link tracking on all applicable link elements. [Learn More](https:\\/\\/developer.matomo.org\\/api-reference\\/tracking-javascript)\",\"type\":\"bool\",\"value\":true},\"scriptUrl\":{\"title\":\"Matomo Script URL\",\"instructions\":\"The URL to the Matomo tracking script. This will vary depending on whether you are using Matomo Cloud or Matomo On-Premise. [Learn More](https:\\/\\/developer.matomo.org\\/guides\\/tracking-javascript-guide)\",\"type\":\"string\",\"value\":\"\"}},\"dataLayer\":[],\"include\":false,\"key\":\"matomo\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"plausible\":{\"name\":\"Plausible\",\"description\":\"Plausible is a lightweight and open-source website analytics tool. No cookies and fully compliant with GDPR, CCPA and PECR. [Learn More](https:\\/\\/plausible.io\\/)\",\"templatePath\":\"_frontend\\/scripts\\/plausibleAnalytics.twig\",\"templateString\":\"{% if siteDomain.value is defined and siteDomain.value %}\\n(function() {\\nvar tag = document.createElement(\'script\');\\ntag.src = \\\"{{ scriptUrl.value }}\\\";\\ntag.defer = true;\\ntag.setAttribute(\\\"data-domain\\\", \\\"{{ siteDomain.value | raw }}\\\");\\nvar firstScriptTag = document.getElementsByTagName(\'script\')[0];\\nfirstScriptTag.parentNode.insertBefore(tag, firstScriptTag);\\n})();\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"siteDomain\":{\"title\":\"Site Domain\",\"instructions\":\"Only enter the site domain, not the entire script code. [Learn More](https:\\/\\/plausible.io\\/docs\\/plausible-script)\",\"type\":\"string\",\"value\":\"\"},\"scriptUrl\":{\"title\":\"Plausible Script URL\",\"instructions\":\"The URL to the Plausible tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/plausible.io\\/js\\/plausible.js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"plausible\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null},\"googleAnalytics\":{\"name\":\"Google Analytics (old)\",\"description\":\"Google Analytics gives you the digital analytics tools you need to analyze data from all touchpoints in one place, for a deeper understanding of the customer experience. You can then share the insights that matter with your whole organization. [Learn More](https:\\/\\/www.google.com\\/analytics\\/analytics\\/)\",\"templatePath\":\"_frontend\\/scripts\\/googleAnalytics.twig\",\"templateString\":\"{% if trackingId.value is defined and trackingId.value %}\\n(function(i,s,o,g,r,a,m){i[\'GoogleAnalyticsObject\']=r;i[r]=i[r]||function(){\\n(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\\nm=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\\n})(window,document,\'script\',\'{{ analyticsUrl.value }}\',\'ga\');\\nga(\'create\', \'{{ trackingId.value |raw }}\', \'auto\'{% if linker.value %}, {allowLinker: true}{% endif %});\\n{% if ipAnonymization.value %}\\nga(\'set\', \'anonymizeIp\', true);\\n{% endif %}\\n{% if displayFeatures.value %}\\nga(\'require\', \'displayfeatures\');\\n{% endif %}\\n{% if ecommerce.value %}\\nga(\'require\', \'ecommerce\');\\n{% endif %}\\n{% if enhancedEcommerce.value %}\\nga(\'require\', \'ec\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linkid\');\\n{% endif %}\\n{% if enhancedLinkAttribution.value %}\\nga(\'require\', \'linker\');\\n{% endif %}\\n{% set pageView = (sendPageView.value and not seomatic.helper.isPreview) %}\\n{% if pageView %}\\nga(\'send\', \'pageview\');\\n{% endif %}\\n{% endif %}\\n\",\"position\":1,\"bodyTemplatePath\":null,\"bodyTemplateString\":null,\"bodyPosition\":2,\"vars\":{\"trackingId\":{\"title\":\"Google Analytics Tracking ID\",\"instructions\":\"Only enter the ID, e.g.: `UA-XXXXXX-XX`, not the entire script code. [Learn More](https:\\/\\/support.google.com\\/analytics\\/answer\\/1032385?hl=e)\",\"type\":\"string\",\"value\":\"\"},\"sendPageView\":{\"title\":\"Automatically send Google Analytics PageView\",\"instructions\":\"Controls whether the Google Analytics script automatically sends a PageView to Google Analytics when your pages are loaded.\",\"type\":\"bool\",\"value\":true},\"ipAnonymization\":{\"title\":\"Google Analytics IP Anonymization\",\"instructions\":\"When a customer of Analytics requests IP address anonymization, Analytics anonymizes the address as soon as technically feasible at the earliest possible stage of the collection network.\",\"type\":\"bool\",\"value\":false},\"displayFeatures\":{\"title\":\"Display Features\",\"instructions\":\"The display features plugin for analytics.js can be used to enable Advertising Features in Google Analytics, such as Remarketing, Demographics and Interest Reporting, and more. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/display-features)\",\"type\":\"bool\",\"value\":false},\"ecommerce\":{\"title\":\"Ecommerce\",\"instructions\":\"Ecommerce tracking allows you to measure the number of transactions and revenue that your website generates. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedEcommerce\":{\"title\":\"Enhanced Ecommerce\",\"instructions\":\"The enhanced ecommerce plug-in for analytics.js enables the measurement of user interactions with products on ecommerce websites across the user\'s shopping experience, including: product impressions, product clicks, viewing product details, adding a product to a shopping cart, initiating the checkout process, transactions, and refunds. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/enhanced-ecommerce)\",\"type\":\"bool\",\"value\":false},\"enhancedLinkAttribution\":{\"title\":\"Enhanced Link Attribution\",\"instructions\":\"Enhanced Link Attribution improves the accuracy of your In-Page Analytics report by automatically differentiating between multiple links to the same URL on a single page by using link element IDs. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/enhanced-link-attribution)\",\"type\":\"bool\",\"value\":false},\"linker\":{\"title\":\"Linker\",\"instructions\":\"The linker plugin simplifies the process of implementing cross-domain tracking as described in the Cross-domain Tracking guide for analytics.js. [Learn More](https:\\/\\/developers.google.com\\/analytics\\/devguides\\/collection\\/analyticsjs\\/linker)\",\"type\":\"bool\",\"value\":false},\"analyticsUrl\":{\"title\":\"Google Analytics Script URL\",\"instructions\":\"The URL to the Google Analytics tracking script. Normally this should not be changed, unless you locally cache it.\",\"type\":\"string\",\"value\":\"https:\\/\\/www.google-analytics.com\\/analytics.js\"}},\"dataLayer\":[],\"include\":false,\"key\":\"googleAnalytics\",\"environment\":{\"staging\":{\"include\":false},\"local\":{\"include\":false}},\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null}},\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.meta.mainEntityOfPage }}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"issn\":null,\"workTranslation\":null,\"educationalLevel\":null,\"associatedMedia\":null,\"exampleOfWork\":null,\"releasedEvent\":null,\"version\":null,\"locationCreated\":null,\"acquireLicensePage\":null,\"thumbnailUrl\":null,\"provider\":null,\"expires\":null,\"contentLocation\":null,\"educationalUse\":null,\"copyrightHolder\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"accessibilityControl\":null,\"maintainer\":null,\"educationalAlignment\":null,\"spatial\":null,\"publisher\":null,\"keywords\":null,\"assesses\":null,\"reviews\":null,\"isBasedOn\":null,\"mentions\":null,\"publishingPrinciples\":null,\"contributor\":null,\"license\":null,\"citation\":null,\"accessibilitySummary\":null,\"award\":null,\"commentCount\":null,\"temporalCoverage\":null,\"dateCreated\":null,\"discussionUrl\":null,\"copyrightNotice\":null,\"learningResourceType\":null,\"awards\":null,\"accessModeSufficient\":null,\"review\":null,\"conditionsOfAccess\":null,\"interactivityType\":null,\"abstract\":null,\"fileFormat\":null,\"interpretedAsClaim\":null,\"text\":null,\"archivedAt\":null,\"alternativeHeadline\":null,\"creditText\":null,\"funding\":null,\"interactionStatistic\":null,\"workExample\":null,\"about\":null,\"encodings\":null,\"funder\":null,\"video\":null,\"isPartOf\":null,\"pattern\":null,\"editor\":null,\"dateModified\":null,\"translationOfWork\":null,\"creativeWorkStatus\":null,\"isBasedOnUrl\":null,\"isFamilyFriendly\":null,\"isAccessibleForFree\":null,\"author\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"contentReferenceTime\":null,\"correction\":null,\"sdDatePublished\":null,\"comment\":null,\"countryOfOrigin\":null,\"timeRequired\":null,\"typicalAgeRange\":null,\"genre\":null,\"producer\":null,\"schemaVersion\":null,\"audience\":null,\"encoding\":null,\"publisherImprint\":null,\"accessibilityAPI\":null,\"sdPublisher\":null,\"audio\":null,\"accessibilityFeature\":null,\"spatialCoverage\":null,\"accessMode\":null,\"editEIDR\":null,\"usageInfo\":null,\"position\":null,\"encodingFormat\":null,\"copyrightYear\":null,\"mainEntity\":null,\"creator\":{\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\"},\"teaches\":null,\"temporal\":null,\"size\":null,\"translator\":null,\"aggregateRating\":null,\"accountablePerson\":null,\"accessibilityHazard\":null,\"contentRating\":null,\"recordedAt\":null,\"publication\":null,\"sdLicense\":null,\"headline\":null,\"materialExtent\":null,\"inLanguage\":\"{{ seomatic.meta.language }}\",\"material\":null,\"datePublished\":null,\"offers\":null,\"hasPart\":null,\"sourceOrganization\":null,\"sponsor\":null,\"character\":null,\"potentialAction\":{\"type\":\"SearchAction\",\"target\":{\"type\":\"EntryPoint\",\"urlTemplate\":\"{{ seomatic.site.siteLinksSearchTarget }}\"},\"query-input\":\"{{ seomatic.helper.siteLinksQueryInput() }}\"},\"mainEntityOfPage\":\"{{ seomatic.meta.canonicalUrl }}\",\"subjectOf\":null,\"url\":\"{{ seomatic.meta.canonicalUrl }}\",\"alternateName\":null,\"sameAs\":null,\"description\":\"{{ seomatic.meta.seoDescription }}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.meta.seoImage }}\"},\"name\":\"{{ seomatic.meta.seoTitle }}\",\"additionalType\":null},\"identity\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.site.identity.computedType }}\",\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\",\"graph\":null,\"include\":true,\"key\":\"identity\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"serviceArea\":null,\"founder\":\"{{ seomatic.site.identity.organizationFounder }}\",\"isicV4\":null,\"hasPOS\":null,\"globalLocationNumber\":null,\"member\":null,\"knowsAbout\":null,\"makesOffer\":null,\"ownershipFundingInfo\":null,\"founders\":null,\"legalName\":null,\"actionableFeedbackPolicy\":null,\"areaServed\":null,\"parentOrganization\":null,\"slogan\":null,\"department\":null,\"keywords\":null,\"reviews\":null,\"memberOf\":null,\"publishingPrinciples\":null,\"employee\":null,\"award\":null,\"email\":\"{{ seomatic.site.identity.genericEmail }}\",\"contactPoints\":[],\"diversityStaffingReport\":null,\"foundingDate\":\"{{ seomatic.site.identity.organizationFoundingDate }}\",\"owns\":null,\"awards\":null,\"review\":null,\"dissolutionDate\":null,\"funding\":null,\"interactionStatistic\":null,\"events\":null,\"seeks\":null,\"employees\":null,\"unnamedSourcesPolicy\":null,\"subOrganization\":null,\"foundingLocation\":\"{{ seomatic.site.identity.organizationFoundingLocation }}\",\"funder\":null,\"iso6523Code\":null,\"diversityPolicy\":null,\"hasMerchantReturnPolicy\":null,\"event\":null,\"duns\":\"{{ seomatic.site.identity.organizationDuns }}\",\"alumni\":null,\"ethicsPolicy\":null,\"leiCode\":null,\"vatID\":null,\"knowsLanguage\":null,\"correctionsPolicy\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.helper.socialTransform(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\",\"width\":\"{{ seomatic.helper.socialTransformWidth(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\",\"height\":\"{{ seomatic.helper.socialTransformHeight(seomatic.site.identity.genericImageIds[0], \\\"schema-logo\\\") }}\"},\"hasCredential\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{{ seomatic.site.identity.genericStreetAddress }}\",\"addressLocality\":\"{{ seomatic.site.identity.genericAddressLocality }}\",\"addressRegion\":\"{{ seomatic.site.identity.genericAddressRegion }}\",\"postalCode\":\"{{ seomatic.site.identity.genericPostalCode }}\",\"addressCountry\":\"{{ seomatic.site.identity.genericAddressCountry }}\"},\"brand\":null,\"nonprofitStatus\":null,\"contactPoint\":null,\"hasOfferCatalog\":null,\"members\":null,\"aggregateRating\":null,\"faxNumber\":null,\"telephone\":\"{{ seomatic.site.identity.genericTelephone }}\",\"taxID\":null,\"naics\":null,\"location\":null,\"numberOfEmployees\":null,\"sponsor\":null,\"potentialAction\":null,\"mainEntityOfPage\":null,\"subjectOf\":null,\"url\":\"{{ seomatic.site.identity.genericUrl }}\",\"alternateName\":\"{{ seomatic.site.identity.genericAlternateName }}\",\"sameAs\":null,\"description\":\"{{ seomatic.site.identity.genericDescription }}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.site.identity.genericImage }}\",\"width\":\"{{ seomatic.site.identity.genericImageWidth }}\",\"height\":\"{{ seomatic.site.identity.genericImageHeight }}\"},\"name\":\"{{ seomatic.site.identity.genericName }}\",\"additionalType\":null},\"creator\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.site.creator.computedType }}\",\"id\":\"{{ parseEnv(seomatic.site.creator.genericUrl) }}#creator\",\"graph\":null,\"include\":true,\"key\":\"creator\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"serviceArea\":null,\"founder\":\"{{ seomatic.site.creator.organizationFounder }}\",\"isicV4\":null,\"hasPOS\":null,\"globalLocationNumber\":null,\"member\":null,\"knowsAbout\":null,\"makesOffer\":null,\"ownershipFundingInfo\":null,\"founders\":null,\"legalName\":null,\"actionableFeedbackPolicy\":null,\"areaServed\":null,\"parentOrganization\":null,\"slogan\":null,\"department\":null,\"keywords\":null,\"reviews\":null,\"memberOf\":null,\"publishingPrinciples\":null,\"employee\":null,\"award\":null,\"email\":\"{{ seomatic.site.creator.genericEmail }}\",\"contactPoints\":[],\"diversityStaffingReport\":null,\"foundingDate\":\"{{ seomatic.site.creator.organizationFoundingDate }}\",\"owns\":null,\"awards\":null,\"review\":null,\"dissolutionDate\":null,\"funding\":null,\"interactionStatistic\":null,\"events\":null,\"seeks\":null,\"employees\":null,\"unnamedSourcesPolicy\":null,\"subOrganization\":null,\"foundingLocation\":\"{{ seomatic.site.creator.organizationFoundingLocation }}\",\"funder\":null,\"iso6523Code\":null,\"diversityPolicy\":null,\"hasMerchantReturnPolicy\":null,\"event\":null,\"duns\":\"{{ seomatic.site.creator.organizationDuns }}\",\"alumni\":null,\"ethicsPolicy\":null,\"leiCode\":null,\"vatID\":null,\"knowsLanguage\":null,\"correctionsPolicy\":null,\"logo\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.helper.socialTransform(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\",\"width\":\"{{ seomatic.helper.socialTransformWidth(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\",\"height\":\"{{ seomatic.helper.socialTransformHeight(seomatic.site.creator.genericImageIds[0], \\\"schema-logo\\\") }}\"},\"hasCredential\":null,\"address\":{\"type\":\"PostalAddress\",\"streetAddress\":\"{{ seomatic.site.creator.genericStreetAddress }}\",\"addressLocality\":\"{{ seomatic.site.creator.genericAddressLocality }}\",\"addressRegion\":\"{{ seomatic.site.creator.genericAddressRegion }}\",\"postalCode\":\"{{ seomatic.site.creator.genericPostalCode }}\",\"addressCountry\":\"{{ seomatic.site.creator.genericAddressCountry }}\"},\"brand\":null,\"nonprofitStatus\":null,\"contactPoint\":null,\"hasOfferCatalog\":null,\"members\":null,\"aggregateRating\":null,\"faxNumber\":null,\"telephone\":\"{{ seomatic.site.creator.genericTelephone }}\",\"taxID\":null,\"naics\":null,\"location\":null,\"numberOfEmployees\":null,\"sponsor\":null,\"potentialAction\":null,\"mainEntityOfPage\":null,\"subjectOf\":null,\"url\":\"{{ seomatic.site.creator.genericUrl }}\",\"alternateName\":\"{{ seomatic.site.creator.genericAlternateName }}\",\"sameAs\":null,\"description\":\"{{ seomatic.site.creator.genericDescription }}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.site.creator.genericImage }}\",\"width\":\"{{ seomatic.site.creator.genericImageWidth }}\",\"height\":\"{{ seomatic.site.creator.genericImageHeight }}\"},\"name\":\"{{ seomatic.site.creator.genericName }}\",\"additionalType\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{{ seomatic.meta.seoTitle }}\",\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.siteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":{\"humans\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"\\/* TEAM *\\/\\n\\nCreator: {{ seomatic.site.creator.genericName ?? \\\"n\\/a\\\" }}\\nURL: {{ parseEnv(seomatic.site.creator.genericUrl ?? \\\"n\\/a\\\") }}\\nDescription: {{ seomatic.site.creator.genericDescription ?? \\\"n\\/a\\\" }}\\n\\n\\/* THANKS *\\/\\n\\nCraft CMS - https:\\/\\/craftcms.com\\nPixel & Tonic - https:\\/\\/pixelandtonic.com\\n\\n\\/* SITE *\\/\\n\\nStandards: HTML5, CSS3\\nComponents: Craft CMS 4, Yii2, PHP, JavaScript, SEOmatic\\n\",\"siteId\":null,\"include\":true,\"handle\":\"humans\",\"path\":\"humans.txt\",\"template\":\"_frontend\\/pages\\/humans.twig\",\"controller\":\"frontend-template\",\"action\":\"humans\"},\"robots\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# robots.txt for {{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }}\\n\\n{{ seomatic.helper.sitemapIndex() }}\\n{% switch seomatic.config.environment %}\\n\\n{% case \\\"live\\\" %}\\n\\n# live - don\'t allow web crawlers to index cpresources\\/ or vendor\\/\\n\\nUser-agent: *\\nDisallow: \\/cpresources\\/\\nDisallow: \\/vendor\\/\\nDisallow: \\/.env\\nDisallow: \\/cache\\/\\n\\n{% case \\\"staging\\\" %}\\n\\n# staging - disallow all\\n\\nUser-agent: *\\nDisallow: \\/\\n\\n{% case \\\"local\\\" %}\\n\\n# local - disallow all\\n\\nUser-agent: *\\nDisallow: \\/\\n\\n{% default %}\\n\\n# default - don\'t allow web crawlers to index cpresources\\/ or vendor\\/\\n\\nUser-agent: *\\nDisallow: \\/cpresources\\/\\nDisallow: \\/vendor\\/\\nDisallow: \\/.env\\nDisallow: \\/cache\\/\\n\\n{% endswitch %}\\n\",\"siteId\":null,\"include\":true,\"handle\":\"robots\",\"path\":\"robots.txt\",\"template\":\"_frontend\\/pages\\/robots.twig\",\"controller\":\"frontend-template\",\"action\":\"robots\"},\"ads\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# ads.txt file for {{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }}\\n# More info: https:\\/\\/support.google.com\\/admanager\\/answer\\/7441288?hl=en\\n{{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }},123,DIRECT\\n\",\"siteId\":null,\"include\":false,\"handle\":\"ads\",\"path\":\"ads.txt\",\"template\":\"_frontend\\/pages\\/ads.twig\",\"controller\":\"frontend-template\",\"action\":\"ads\"},\"security\":{\"templateVersion\":\"1.0.0\",\"templateString\":\"# security.txt file for {{ seomatic.helper.baseSiteUrl(\\\"\\/\\\") }} - more info: https:\\/\\/securitytxt.org\\/\\n\\n# (required) Contact email address for security issues\\nContact: mailto:user@example.com\\n\\n# (required) Expiration date for the security information herein\\nExpires: {{ date(\'+1 year\')|atom }}\\n\\n# (optional) OpenPGP key:\\nEncryption: {{ url(\'pgp-key.txt\') }}\\n\\n# (optional) Security policy page:\\nPolicy: {{ url(\'security-policy\') }}\\n\\n# (optional) Security acknowledgements page:\\nAcknowledgements: {{ url(\'hall-of-fame\') }}\\n\",\"siteId\":null,\"include\":false,\"handle\":\"security\",\"path\":\"security.txt\",\"template\":\"_frontend\\/pages\\/security.twig\",\"controller\":\"frontend-template\",\"action\":\"security\"}},\"name\":\"Frontend Templates\",\"description\":\"Templates that are rendered on the frontend\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":\"SeomaticEditableTemplate\",\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"fromCustom\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}'),(2,'2023-04-12 22:33:42','2023-04-12 22:33:42','24afb444-cd38-4354-8716-b8a754f4257c','1.0.30','section',1,'Home','home','single',NULL,'_entries/home.twig',1,'{\"1\":{\"id\":1,\"sectionId\":1,\"siteId\":1,\"enabledByDefault\":true,\"hasUrls\":true,\"uriFormat\":\"__home__\",\"template\":\"_entries\\/home.twig\",\"language\":\"en-us\"}}','2023-04-12 22:31:55','{\"language\":null,\"mainEntityOfPage\":\"WebPage\",\"seoTitle\":\"{{ entry.title }}\",\"siteNamePosition\":\"\",\"seoDescription\":\"\",\"seoKeywords\":\"\",\"seoImage\":\"\",\"seoImageWidth\":\"\",\"seoImageHeight\":\"\",\"seoImageDescription\":\"\",\"canonicalUrl\":\"{{ entry.url }}\",\"robots\":\"all\",\"ogType\":\"website\",\"ogTitle\":\"{{ seomatic.meta.seoTitle }}\",\"ogSiteNamePosition\":\"\",\"ogDescription\":\"{{ seomatic.meta.seoDescription }}\",\"ogImage\":\"{{ seomatic.meta.seoImage }}\",\"ogImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"ogImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"ogImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"twitterCard\":\"summary_large_image\",\"twitterCreator\":\"{{ seomatic.site.twitterHandle }}\",\"twitterTitle\":\"{{ seomatic.meta.seoTitle }}\",\"twitterSiteNamePosition\":\"\",\"twitterDescription\":\"{{ seomatic.meta.seoDescription }}\",\"twitterImage\":\"{{ seomatic.meta.seoImage }}\",\"twitterImageWidth\":\"{{ seomatic.meta.seoImageWidth }}\",\"twitterImageHeight\":\"{{ seomatic.meta.seoImageHeight }}\",\"twitterImageDescription\":\"{{ seomatic.meta.seoImageDescription }}\",\"inherited\":[],\"overrides\":[]}','{\"siteName\":\"Website by Steadfast\",\"identity\":null,\"creator\":null,\"twitterHandle\":\"\",\"facebookProfileId\":\"\",\"facebookAppId\":\"\",\"googleSiteVerification\":\"\",\"bingSiteVerification\":\"\",\"pinterestSiteVerification\":\"\",\"facebookSiteVerification\":\"\",\"sameAsLinks\":[],\"siteLinksSearchTarget\":\"\",\"siteLinksQueryInput\":\"\",\"referrer\":\"no-referrer-when-downgrade\",\"additionalSitemapUrls\":[],\"additionalSitemapUrlsDateUpdated\":null,\"additionalSitemaps\":[]}','{\"sitemapUrls\":true,\"sitemapAssets\":true,\"sitemapFiles\":true,\"sitemapAltLinks\":true,\"sitemapChangeFreq\":\"weekly\",\"sitemapPriority\":0.5,\"sitemapLimit\":null,\"structureDepth\":null,\"sitemapImageFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"caption\",\"field\":\"\"},{\"property\":\"geo_location\",\"field\":\"\"},{\"property\":\"license\",\"field\":\"\"}],\"sitemapVideoFieldMap\":[{\"property\":\"title\",\"field\":\"title\"},{\"property\":\"description\",\"field\":\"\"},{\"property\":\"thumbnailLoc\",\"field\":\"\"},{\"property\":\"duration\",\"field\":\"\"},{\"property\":\"category\",\"field\":\"\"}],\"inherited\":[],\"overrides\":[]}','{\"MetaTagContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"General Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContaineropengraph\":{\"data\":[],\"name\":\"Facebook\",\"description\":\"Facebook OpenGraph Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"opengraph\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainertwitter\":{\"data\":[],\"name\":\"Twitter\",\"description\":\"Twitter Card Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"twitter\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTagContainermiscellaneous\":{\"data\":[],\"name\":\"Miscellaneous\",\"description\":\"Miscellaneous Meta Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTagContainer\",\"handle\":\"miscellaneous\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaLinkContainergeneral\":{\"data\":[],\"name\":\"General\",\"description\":\"Link Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaLinkContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaScriptContainergeneral\":{\"data\":[],\"position\":1,\"name\":\"General\",\"description\":\"Script Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaScriptContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaJsonLdContainergeneral\":{\"data\":{\"mainEntityOfPage\":{\"context\":\"http:\\/\\/schema.org\",\"type\":\"{{ seomatic.meta.mainEntityOfPage }}\",\"id\":null,\"graph\":null,\"include\":true,\"key\":\"mainEntityOfPage\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[],\"nonce\":null,\"significantLink\":null,\"specialty\":null,\"reviewedBy\":null,\"lastReviewed\":null,\"relatedLink\":null,\"breadcrumb\":null,\"significantLinks\":null,\"mainContentOfPage\":null,\"speakable\":null,\"primaryImageOfPage\":null,\"workTranslation\":null,\"educationalLevel\":null,\"associatedMedia\":null,\"exampleOfWork\":null,\"releasedEvent\":null,\"version\":null,\"locationCreated\":null,\"acquireLicensePage\":null,\"thumbnailUrl\":null,\"provider\":null,\"expires\":null,\"contentLocation\":null,\"educationalUse\":null,\"copyrightHolder\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"accessibilityControl\":null,\"maintainer\":null,\"educationalAlignment\":null,\"spatial\":null,\"publisher\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#creator\"},\"keywords\":null,\"assesses\":null,\"reviews\":null,\"isBasedOn\":null,\"mentions\":null,\"publishingPrinciples\":null,\"contributor\":null,\"license\":null,\"citation\":null,\"accessibilitySummary\":null,\"award\":null,\"commentCount\":null,\"temporalCoverage\":null,\"dateCreated\":false,\"discussionUrl\":null,\"copyrightNotice\":null,\"learningResourceType\":null,\"awards\":null,\"accessModeSufficient\":null,\"review\":null,\"conditionsOfAccess\":null,\"interactivityType\":null,\"abstract\":null,\"fileFormat\":null,\"interpretedAsClaim\":null,\"text\":null,\"archivedAt\":null,\"alternativeHeadline\":null,\"creditText\":null,\"funding\":null,\"interactionStatistic\":null,\"workExample\":null,\"about\":null,\"encodings\":null,\"funder\":null,\"video\":null,\"isPartOf\":null,\"pattern\":null,\"editor\":null,\"dateModified\":\"{{ entry.dateUpdated |atom }}\",\"translationOfWork\":null,\"creativeWorkStatus\":null,\"isBasedOnUrl\":null,\"isFamilyFriendly\":null,\"isAccessibleForFree\":null,\"author\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#identity\"},\"contentReferenceTime\":null,\"correction\":null,\"sdDatePublished\":null,\"comment\":null,\"countryOfOrigin\":null,\"timeRequired\":null,\"typicalAgeRange\":null,\"genre\":null,\"producer\":null,\"schemaVersion\":null,\"audience\":null,\"encoding\":null,\"publisherImprint\":null,\"accessibilityAPI\":null,\"sdPublisher\":null,\"audio\":null,\"accessibilityFeature\":null,\"spatialCoverage\":null,\"accessMode\":null,\"editEIDR\":null,\"usageInfo\":null,\"position\":null,\"encodingFormat\":null,\"copyrightYear\":\"{{ entry.postDate | date(\\\"Y\\\") }}\",\"mainEntity\":null,\"creator\":{\"id\":\"{{ parseEnv(seomatic.site.identity.genericUrl) }}#creator\"},\"teaches\":null,\"temporal\":null,\"size\":null,\"translator\":null,\"aggregateRating\":null,\"accountablePerson\":null,\"accessibilityHazard\":null,\"contentRating\":null,\"recordedAt\":null,\"publication\":null,\"sdLicense\":null,\"headline\":\"{{ seomatic.meta.seoTitle }}\",\"materialExtent\":null,\"inLanguage\":\"{{ seomatic.meta.language }}\",\"material\":null,\"datePublished\":\"{{ entry.postDate |atom }}\",\"offers\":null,\"hasPart\":null,\"sourceOrganization\":null,\"sponsor\":null,\"character\":null,\"potentialAction\":{\"type\":\"SearchAction\",\"target\":\"{{ seomatic.site.siteLinksSearchTarget }}\",\"query-input\":\"{{ seomatic.helper.siteLinksQueryInput() }}\"},\"mainEntityOfPage\":\"{{ seomatic.meta.canonicalUrl }}\",\"subjectOf\":null,\"url\":\"{{ seomatic.meta.canonicalUrl }}\",\"alternateName\":null,\"sameAs\":null,\"description\":\"{{ seomatic.meta.seoDescription }}\",\"disambiguatingDescription\":null,\"identifier\":null,\"image\":{\"type\":\"ImageObject\",\"url\":\"{{ seomatic.meta.seoImage }}\"},\"name\":\"{{ seomatic.meta.seoTitle }}\",\"additionalType\":null}},\"name\":\"General\",\"description\":\"JsonLd Tags\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaJsonLdContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false},\"MetaTitleContainergeneral\":{\"data\":{\"title\":{\"title\":\"{{ seomatic.meta.seoTitle }}\",\"siteName\":\"{{ seomatic.site.siteName }}\",\"siteNamePosition\":\"{{ seomatic.meta.siteNamePosition }}\",\"separatorChar\":\"{{ seomatic.config.separatorChar }}\",\"include\":true,\"key\":\"title\",\"environment\":null,\"dependencies\":null,\"tagAttrs\":[]}},\"name\":\"General\",\"description\":\"Meta Title Tag\",\"class\":\"nystudio107\\\\seomatic\\\\models\\\\MetaTitleContainer\",\"handle\":\"general\",\"include\":true,\"dependencies\":[],\"clearCache\":false}}','[]','{\"data\":[],\"name\":null,\"description\":null,\"class\":\"nystudio107\\\\seomatic\\\\models\\\\FrontendTemplateContainer\",\"handle\":null,\"include\":true,\"dependencies\":null,\"clearCache\":false}','{\"siteType\":\"CreativeWork\",\"siteSubType\":\"WebSite\",\"siteSpecificType\":\"\",\"seoTitleSource\":\"fromCustom\",\"seoTitleField\":\"\",\"siteNamePositionSource\":\"fromCustom\",\"seoDescriptionSource\":\"fromCustom\",\"seoDescriptionField\":\"\",\"seoKeywordsSource\":\"fromCustom\",\"seoKeywordsField\":\"\",\"seoImageIds\":[],\"seoImageSource\":\"fromAsset\",\"seoImageField\":\"\",\"seoImageTransform\":true,\"seoImageTransformMode\":\"crop\",\"seoImageDescriptionSource\":\"fromCustom\",\"seoImageDescriptionField\":\"\",\"twitterCreatorSource\":\"sameAsSite\",\"twitterCreatorField\":\"\",\"twitterTitleSource\":\"sameAsSeo\",\"twitterTitleField\":\"\",\"twitterSiteNamePositionSource\":\"fromCustom\",\"twitterDescriptionSource\":\"sameAsSeo\",\"twitterDescriptionField\":\"\",\"twitterImageIds\":[],\"twitterImageSource\":\"sameAsSeo\",\"twitterImageField\":\"\",\"twitterImageTransform\":true,\"twitterImageTransformMode\":\"crop\",\"twitterImageDescriptionSource\":\"sameAsSeo\",\"twitterImageDescriptionField\":\"\",\"ogTitleSource\":\"sameAsSeo\",\"ogTitleField\":\"\",\"ogSiteNamePositionSource\":\"fromCustom\",\"ogDescriptionSource\":\"sameAsSeo\",\"ogDescriptionField\":\"\",\"ogImageIds\":[],\"ogImageSource\":\"sameAsSeo\",\"ogImageField\":\"\",\"ogImageTransform\":true,\"ogImageTransformMode\":\"crop\",\"ogImageDescriptionSource\":\"sameAsSeo\",\"ogImageDescriptionField\":\"\"}');
/*!40000 ALTER TABLE `seomatic_metabundles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Website by Steadfast','2023-04-12 22:23:31','2023-04-12 22:23:31',NULL,'29ddc6b2-605e-432e-8a0a-61bd5db71d93');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'true','Website by Steadfast','default','en-US',1,'$PRIMARY_SITE_URL',1,'2023-04-12 22:23:31','2023-04-12 22:23:31',NULL,'71aef9fa-1e77-4cfa-bbd1-a48006412d66');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `supertableblocks`
--

LOCK TABLES `supertableblocks` WRITE;
/*!40000 ALTER TABLE `supertableblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `supertableblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `supertableblocks_owners`
--

LOCK TABLES `supertableblocks_owners` WRITE;
/*!40000 ALTER TABLE `supertableblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `supertableblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `supertableblocktypes`
--

LOCK TABLES `supertableblocktypes` WRITE;
/*!40000 ALTER TABLE `supertableblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `supertableblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'steadfast',NULL,NULL,NULL,'dev@steadfast.design','$2y$13$i1fEVeKiboWR/Hx07N9JtuSZj46KNueAg0IgpwL2TId0sXN.oyibC','2023-04-13 13:28:39',NULL,NULL,NULL,'2023-04-13 13:28:31',NULL,1,NULL,NULL,NULL,0,'2023-04-12 22:23:31','2023-04-12 22:23:31','2023-04-13 13:28:39');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-04-12 22:23:33','2023-04-12 22:23:33','ca0aa84d-a88d-4c49-9706-64635235d2a1'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-04-12 22:23:33','2023-04-12 22:23:33','2391741a-4bef-4ebe-afcf-1c540576b648'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-04-12 22:23:33','2023-04-12 22:23:33','2dd66581-d565-415a-87b9-0891f00006b3'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-04-12 22:23:33','2023-04-12 22:23:33','10ad1163-c401-4b9e-8465-15468358ec1e');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-13 13:29:33
