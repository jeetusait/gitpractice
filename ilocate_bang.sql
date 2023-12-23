-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: ilocate
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `OPERATORID`
--

DROP TABLE IF EXISTS `OPERATORID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OPERATORID` (
  `ID` varchar(10) DEFAULT NULL,
  `OPERATORNAME` varchar(50) DEFAULT NULL,
  KEY `OPER_ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accesslog`
--

DROP TABLE IF EXISTS `accesslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesslog` (
  `rownum` int(12) NOT NULL DEFAULT '0',
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `request` varchar(500) DEFAULT NULL,
  `response` varchar(2000) DEFAULT NULL,
  `responsetimestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `responseflag` smallint(6) DEFAULT '0',
  `username` varchar(20) DEFAULT NULL,
  `reqip` varchar(20) DEFAULT NULL,
  `msisdn` varchar(20) DEFAULT NULL,
  `requesttime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `operator` varchar(10) DEFAULT NULL,
  `locresponse` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bck_accesslog`
--

DROP TABLE IF EXISTS `bck_accesslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bck_accesslog` (
  `rownum` int(12) NOT NULL DEFAULT '0',
  `datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `request` varchar(500) DEFAULT NULL,
  `response` varchar(2000) DEFAULT NULL,
  `responsetimestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `responseflag` smallint(6) DEFAULT '0',
  `username` varchar(20) DEFAULT NULL,
  `reqip` varchar(20) DEFAULT NULL,
  `msisdn` varchar(20) DEFAULT NULL,
  `requesttime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `operator` varchar(10) DEFAULT NULL,
  `locresponse` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cellidlist`
--

DROP TABLE IF EXISTS `cellidlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cellidlist` (
  `cgi` varchar(25) NOT NULL DEFAULT '',
  `latitude` varchar(12) DEFAULT NULL,
  `longitude` varchar(12) DEFAULT NULL,
  `uploaddate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`cgi`),
  KEY `cgi_idx` (`cgi`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cellidlist_back`
--

DROP TABLE IF EXISTS `cellidlist_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cellidlist_back` (
  `cgi` varchar(25) NOT NULL DEFAULT '',
  `latitude` varchar(12) DEFAULT NULL,
  `longitude` varchar(12) DEFAULT NULL,
  `uploaddate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cellidlist_oct`
--

DROP TABLE IF EXISTS `cellidlist_oct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cellidlist_oct` (
  `cgi` varchar(25) NOT NULL DEFAULT '',
  `latitude` varchar(12) DEFAULT NULL,
  `longitude` varchar(12) DEFAULT NULL,
  `uploaddate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cellidlist_old`
--

DROP TABLE IF EXISTS `cellidlist_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cellidlist_old` (
  `cgi` varchar(25) NOT NULL DEFAULT '',
  `latitude` varchar(12) DEFAULT NULL,
  `longitude` varchar(12) DEFAULT NULL,
  `uploaddate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cellidlist_old19`
--

DROP TABLE IF EXISTS `cellidlist_old19`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cellidlist_old19` (
  `cgi` varchar(25) NOT NULL DEFAULT '',
  `latitude` varchar(12) DEFAULT NULL,
  `longitude` varchar(12) DEFAULT NULL,
  `uploaddate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ideatest`
--

DROP TABLE IF EXISTS `ideatest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ideatest` (
  `msisdn` varchar(12) DEFAULT NULL,
  `hittime` varchar(14) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `landline`
--

DROP TABLE IF EXISTS `landline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landline` (
  `msisdn` bigint(20) DEFAULT NULL,
  `latitude` varchar(10) DEFAULT NULL,
  `longitude` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `oldcellidlist`
--

DROP TABLE IF EXISTS `oldcellidlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oldcellidlist` (
  `cgi` varchar(25) NOT NULL DEFAULT '',
  `latitude` varchar(12) DEFAULT NULL,
  `longitude` varchar(12) DEFAULT NULL,
  `uploaddate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `testdata`
--

DROP TABLE IF EXISTS `testdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testdata` (
  `rownum` smallint(6) DEFAULT NULL,
  `latitude` varchar(20) DEFAULT NULL,
  `longitude` varchar(20) DEFAULT NULL,
  `success` varchar(20) DEFAULT NULL,
  `reachability` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address1type` varchar(20) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `address2type` varchar(20) DEFAULT NULL,
  `mnpflg` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usermaster`
--

DROP TABLE IF EXISTS `usermaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usermaster` (
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-21 13:56:25
