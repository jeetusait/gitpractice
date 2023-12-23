-- MySQL dump 10.14  Distrib 5.5.68-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: ialert
-- ------------------------------------------------------
-- Server version	5.5.68-MariaDB

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
-- Table structure for table `reportcustomizations`
--

DROP TABLE IF EXISTS `reportcustomizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportcustomizations` (
  `columnname` varchar(100) DEFAULT NULL,
  `displayname` varchar(200) DEFAULT NULL,
  `reportid` bigint(20) DEFAULT NULL,
  `changesheet` smallint(6) DEFAULT NULL,
  `isnumeric` smallint(6) DEFAULT NULL,
  `lookup` varchar(300) DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `pivotdata` varchar(200) DEFAULT NULL,
  `orderby` varchar(100) DEFAULT NULL,
  `total` varchar(1500) DEFAULT NULL,
  `gtotal` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportcustomizations`
--

LOCK TABLES `reportcustomizations` WRITE;
/*!40000 ALTER TABLE `reportcustomizations` DISABLE KEYS */;
INSERT INTO `reportcustomizations` VALUES ('CALLINGNO','CALLINGNO',301,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('CALLINGNO','CALLINGNO',302,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('CALLINGNO','CALLINGNO',303,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('TOTAL_ELS_REQUEST','TOTAL_ELS_REQUEST',306,0,0,NULL,NULL,NULL,NULL,'ELS:TOTAL_ELS_REQUEST,TOTAL_ELS_SUCCESS,TOTAL_ELS_FAILED',NULL),('TOTAL_LBS_REQUEST','TOTAL_LBS_REQUEST',305,0,0,NULL,NULL,NULL,NULL,'LBS:TOTAL_LBS_REQUEST,TOTAL_LBS_SUCCESS,TOTAL_LBS_FAILED',NULL),('TOTAL_LBS_REQUEST','TOTAL_LBS_REQUEST',304,0,0,NULL,NULL,NULL,NULL,'TLBS:TOTAL_LBS_REQUEST,TOTAL_LBS_SUCCESS,TOTAL_LBS_FAILED',NULL),('msisdn','msisdn',201,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `reportcustomizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportqueue`
--

DROP TABLE IF EXISTS `reportqueue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportqueue` (
  `seqid` bigint(20) DEFAULT NULL,
  `reporttitle` varchar(100) DEFAULT NULL,
  `reportid` bigint(20) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `reportquery` varchar(2000) DEFAULT NULL,
  `reportstatus` smallint(6) DEFAULT NULL,
  `reportcomment` varchar(1000) DEFAULT NULL,
  `requestdate` date DEFAULT NULL,
  `generatedate` date DEFAULT NULL,
  `params` varchar(300) DEFAULT NULL,
  `filepath` varchar(200) DEFAULT NULL,
  `rowcount` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportqueue`
--

LOCK TABLES `reportqueue` WRITE;
/*!40000 ALTER TABLE `reportqueue` DISABLE KEYS */;
INSERT INTO `reportqueue` VALUES (124,'Events by Date',101,'mv@pertsol.com','select eventname EVENT, polyname POLYGON, smsmessage SMS, audiofile AUDIOFILE, voicemessage VOICEMESSAGE, createdate CreateDate, createdby CreatedBy, replace(groupinfo,\'\\\'\',\'\') Groups from events where createdate between \'2020-06-15\' and \'2020-06-22\'',2,'','2020-06-22','2020-06-22','Start Date:2020-06-15\nEnd Date:2020-06-22\n','/var/web/reportdata//124.csv',13),(125,'Events by Date',101,'mv@pertsol.com','select eventname EVENT, polyname POLYGON, smsmessage SMS, audiofile AUDIOFILE, voicemessage VOICEMESSAGE, createdate CreateDate, createdby CreatedBy, replace(groupinfo,\'\\\'\',\'\') Groups from events where createdate between \'2020-06-15\' and \'2020-06-22\'',2,'','2020-06-22','2020-06-22','Start Date:2020-06-15\nEnd Date:2020-06-22\n','/var/web/reportdata//125.csv',13),(126,'Events by Date',101,'mv@pertsol.com','select eventname EVENT, polyname POLYGON, smsmessage SMS, audiofile AUDIOFILE, voicemessage VOICEMESSAGE, createdate CreateDate, createdby CreatedBy, replace(groupinfo,\'\\\'\',\'\') Groups from events where createdate between \'2020-06-16\' and \'2020-06-29\'',2,'','2020-06-22','2020-06-22','Start Date:2020-06-16\nEnd Date:2020-06-29\n','/var/web/reportdata//126.csv',10),(127,'Mobile Numbers for Specific Event',102,'mv@pertsol.com','select msisdn MobileNo, a.cgi CellID, address Cell_Address from event_msisdn a, celldb b where eventname = \'NewEventG\' and a.cgi=b.cgi',3,'Report generated with no rows at ./genreportcsv.pl line 69.\n','2020-06-22','2020-06-22','Event Name:NewEventG\n','',NULL),(128,'Mobile Numbers for Specific Event',102,'mv@pertsol.com','select msisdn MobileNo, a.cgi CellID, address Cell_Address from event_msisdn a, celldb b where eventname = \'NewEvent_Kudi\' and a.cgi=b.cgi',3,'Report generated with no rows at ./genreportcsv.pl line 69.\n','2020-06-22','2020-06-22','Event Name:NewEvent_Kudi\n','',NULL),(129,'Mobile Numbers for Specific Event',102,'mv@pertsol.com','select msisdn MobileNo, a.cgi CellID, address Cell_Address from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'NewEventGG\' ',2,'','2020-06-22','2020-06-22','Event Name:NewEventGG\n','/var/web/reportdata//129.csv',896),(130,'Cell Based Count',103,'mv@pertsol.com','select b.cgi CellID, address Cell_Address from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'NewEventGG\' group by b.cgi,address ',2,'','2020-06-22','2020-06-22','Event Name:NewEventGG\n','/var/web/reportdata//130.csv',328),(131,'Cell Based Count',103,'mv@pertsol.com','select b.cgi CellID, address Cell_Address, count(1) CNT from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'NewEventGG\' group by b.cgi,address ',2,'','2020-06-22','2020-06-22','Event Name:NewEventGG\n','/var/web/reportdata//131.csv',328),(132,'Mobile Numbers for Specific Event',102,'mv@pertsol.com','select msisdn MobileNo, a.cgi CellID, address Cell_Address from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'DighaAlerts\' ',2,'','2020-06-23','2020-06-23','Event Name:DighaAlerts\n','/var/web/reportdata//132.csv',1068),(133,'Mobile Numbers for Specific Event',102,'mv@pertsol.com','select msisdn MobileNo, a.cgi CellID, address Cell_Address from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'mkvoicesms2\' ',2,'','2020-06-25','2020-06-25','Event Name:mkvoicesms2\n','/var/web/reportdata//133.csv',4),(134,'Events by Date',101,'mv@pertsol.com','select eventname EVENT, polyname POLYGON, smsmessage SMS, audiofile AUDIOFILE, voicemessage VOICEMESSAGE, createdate CreateDate, createdby CreatedBy, replace(groupinfo,\'\\\'\',\'\') Groups from events where createdate between \'2020-06-25\' and \'2020-06-26\'',2,'','2020-06-25','2020-06-25','Start Date:2020-06-25\nEnd Date:2020-06-26\n','/var/web/reportdata//134.csv',6),(135,'Mobile Numbers for Specific Event',102,'mv@pertsol.com','select msisdn MobileNo, a.cgi CellID, address Cell_Address from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'test1337_2506\' ',2,'','2020-06-25','2020-06-25','Event Name:test1337_2506\n','/var/web/reportdata//135.csv',7),(136,'Cell Based Count',103,'mv@pertsol.com','select b.cgi CellID, address Cell_Address, count(1) CNT from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'LIVE_DEMO_CELL_2506_1606\' group by b.cgi,address ',2,'','2020-06-25','2020-06-25','Event Name:LIVE_DEMO_CELL_2506_1606\n','/var/web/reportdata//136.csv',6),(137,'Mobile Numbers for Specific Event',102,'mv@pertsol.com','select msisdn MobileNo, a.cgi CellID, address Cell_Address from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'LIVE_DEMO_CELL_2506_1606\' ',2,'','2020-06-25','2020-06-25','Event Name:LIVE_DEMO_CELL_2506_1606\n','/var/web/reportdata//137.csv',1164),(138,'Events by Date',101,'mv@pertsol.com','select eventname EVENT, polyname POLYGON, smsmessage SMS, audiofile AUDIOFILE, voicemessage VOICEMESSAGE, createdate CreateDate, createdby CreatedBy, replace(groupinfo,\'\\\'\',\'\') Groups from events where createdate between \'2020-06-25\' and \'2020-06-26\'',2,'','2020-06-25','2020-06-25','Start Date:2020-06-25\nEnd Date:2020-06-26\n','/var/web/reportdata//138.csv',15),(139,'Mobile Numbers for Specific Event',102,'mv@pertsol.com','select msisdn MobileNo, a.cgi CellID, address Cell_Address from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'tel_bwn\' ',2,'','2020-06-25','2020-06-25','Event Name:tel_bwn\n','/var/web/reportdata//139.csv',3),(140,'Cell Based Count',103,'mv@pertsol.com','select b.cgi CellID, address Cell_Address, count(1) CNT from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'DEMO_IALERT_2506_1547\' group by b.cgi,address ',2,'','2020-06-26','2020-06-26','Event Name:DEMO_IALERT_2506_1547\n','/var/web/reportdata//140.csv',1),(141,'Events by Date',101,'mv@pertsol.com','select eventname EVENT, polyname POLYGON, smsmessage SMS, audiofile AUDIOFILE, voicemessage VOICEMESSAGE, createdate CreateDate, createdby CreatedBy, replace(groupinfo,\'\\\'\',\'\') Groups from events where createdate between \'2020-06-25\' and \'2020-06-26\'',2,'','2020-06-26','2020-06-26','Start Date:2020-06-25\nEnd Date:2020-06-26\n','/var/web/reportdata//141.csv',15),(142,'Mobile Numbers for Specific Event',102,'mv@pertsol.com','select msisdn MobileNo, a.cgi CellID, address Cell_Address from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'LIVE_DEMO_CELL_2506_1606\' ',2,'','2020-06-26','2020-06-26','Event Name:LIVE_DEMO_CELL_2506_1606\n','/var/web/reportdata//142.csv',1164),(143,'Events by Date',101,'mv@pertsol.com','select eventname EVENT, polyname POLYGON, smsmessage SMS, audiofile AUDIOFILE, voicemessage VOICEMESSAGE, createdate CreateDate, createdby CreatedBy, replace(groupinfo,\'\\\'\',\'\') Groups from events where createdate between \'2020-06-17\' and \'2020-06-26\'',2,'','2020-06-26','2020-06-26','Start Date:2020-06-17\nEnd Date:2020-06-26\n','/var/web/reportdata//143.csv',21),(144,'Mobile Numbers for Specific Event',102,'mv@pertsol.com','select msisdn MobileNo, a.cgi CellID, address Cell_Address from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'LIVE_BSNL_2906\' ',2,'','2020-06-29','2020-06-29','Event Name:LIVE_BSNL_2906\n','/var/web/reportdata//144.csv',2219),(145,'Mobile Numbers for Specific Event',102,'mv@pertsol.com','select msisdn MobileNo, a.cgi CellID, address Cell_Address from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'live_tel_bwn_3006_1\' ',2,'','2020-06-30','2020-06-30','Event Name:live_tel_bwn_3006_1\n','/var/web/reportdata//145.csv',1897),(146,'Mobile Numbers for Specific Event',102,'mv@pertsol.com','select msisdn MobileNo, a.cgi CellID, address Cell_Address from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'tel_bwn\' ',2,'','2020-06-30','2020-06-30','Event Name:tel_bwn\n','/var/web/reportdata//146.csv',3),(147,'Mobile Numbers for Specific Event',102,'mv@pertsol.com','select msisdn MobileNo, a.cgi CellID, address Cell_Address from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'live_msc_5\' ',2,'','2020-06-30','2020-06-30','Event Name:live_msc_5\n','/var/web/reportdata//147.csv',4),(148,'Mobile Numbers for Specific Event',102,'mv@pertsol.com','select msisdn MobileNo, a.cgi CellID, address Cell_Address from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'LIVE_TEST_30062020\' ',2,'','2020-06-30','2020-06-30','Event Name:LIVE_TEST_30062020\n','/var/web/reportdata//148.csv',971),(149,'Mobile Numbers for Specific Event',102,'mv@pertsol.com','select msisdn MobileNo, a.cgi CellID, address Cell_Address from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'test1\' ',2,'','2020-07-02','2020-07-02','Event Name:test1\n','/var/web/reportdata//149.csv',6),(150,'Events by Date',101,'mv@pertsol.com','select eventname EVENT, polyname POLYGON, smsmessage SMS, audiofile AUDIOFILE, voicemessage VOICEMESSAGE, createdate CreateDate, createdby CreatedBy, replace(groupinfo,\'\\\'\',\'\') Groups from events where createdate between \'2022-10-19\' and \'2022-10-19\'',3,'DBD::mysql::st execute failed: Table \'reportuser.report150\' doesn\'t exist at ./genreportcsv.pl line 65.\n','2022-11-17','2022-11-17','Start Date:2022-10-19\nEnd Date:2022-10-19\n','',NULL);
/*!40000 ALTER TABLE `reportqueue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportsmap`
--

DROP TABLE IF EXISTS `reportsmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportsmap` (
  `reportid` int(10) NOT NULL,
  `reportname` varchar(100) DEFAULT NULL,
  `reporttype` int(3) DEFAULT NULL,
  `parentname` varchar(100) DEFAULT NULL,
  `reportquery` varchar(1000) DEFAULT NULL,
  `rightsrequired` int(2) DEFAULT NULL,
  `paramlist` varchar(300) DEFAULT NULL,
  `maxrows` int(10) DEFAULT NULL,
  `keyfield` varchar(30) DEFAULT NULL,
  `suboptions` varchar(500) DEFAULT NULL,
  `inputsep` varchar(10) DEFAULT NULL,
  `visible` int(1) DEFAULT NULL,
  `enable` int(1) DEFAULT NULL,
  `reporttitle` varchar(1000) DEFAULT NULL,
  `comments` varchar(1000) DEFAULT NULL,
  `circle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportsmap`
--

LOCK TABLES `reportsmap` WRITE;
/*!40000 ALTER TABLE `reportsmap` DISABLE KEYS */;
INSERT INTO `reportsmap` VALUES (1,'Event based Reports',1,NULL,'',255,NULL,NULL,NULL,NULL,NULL,NULL,1,'Event Based Reports','',NULL),(101,'Events by Date',3,'1','select eventname EVENT, polyname POLYGON, smsmessage SMS, audiofile AUDIOFILE, voicemessage VOICEMESSAGE, createdate CreateDate, createdby CreatedBy, replace(groupinfo,\'\\\'\',\'\') Groups from events where createdate between \'STDT\' and \'EDDT\'',255,'STDT,EDDT',NULL,NULL,NULL,NULL,NULL,1,'Events by Date','',NULL),(102,'Mobile Numbers for Specific Event',3,'1','select msisdn MobileNo, a.cgi CellID, address Cell_Address from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'EVENT\' ',255,'EVENT',NULL,NULL,NULL,NULL,NULL,1,'Mobile Numbers for Specific Event','',NULL),(103,'Cell Based Count',3,'1','select b.cgi CellID, address Cell_Address, count(1) CNT from event_msisdn a left join celldb b on (a.cgi=b.cgi) where eventname = \'EVENT\' group by b.cgi,address ',255,'EVENT',NULL,NULL,NULL,NULL,NULL,1,'Cell Based Count','',NULL),(10101,'Dont Delete',3,NULL,'select concat(\'FILE:/lis/lis?func=ViewREPORT&seqid=\' , SEQID , \' \' , seqid) SEQ, Reporttitle, if(reportstatus=1,\'IN Progress\',if(reportstatus=2,\'Successful\',if(reportstatus = 3,\'Failed\',\'Unknown\'))) ReportStatus, reportcomment,rowcount,Requestdate, Generatedate from reportqueue order by seqid desc',255,NULL,100000,NULL,NULL,NULL,NULL,1,'Dont Delete',NULL,NULL);
/*!40000 ALTER TABLE `reportsmap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reportseq`
--

DROP TABLE IF EXISTS `reportseq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportseq` (
  `seqid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reportseq`
--

LOCK TABLES `reportseq` WRITE;
/*!40000 ALTER TABLE `reportseq` DISABLE KEYS */;
INSERT INTO `reportseq` VALUES (151);
/*!40000 ALTER TABLE `reportseq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smsalerts`
--

DROP TABLE IF EXISTS `smsalerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smsalerts` (
  `smstext` varchar(2000) DEFAULT NULL,
  `smstitle` varchar(50) DEFAULT NULL,
  `messagetype` varchar(10) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smsalerts`
--

LOCK TABLES `smsalerts` WRITE;
/*!40000 ALTER TABLE `smsalerts` DISABLE KEYS */;
INSERT INTO `smsalerts` VALUES ('This is message requested by gurjot','GurjotRequest','sms','mv@pertsol.com','2020-06-15 18:38:57'),('This is for demo purpose','ISPL','audio','mv@pertsol.com','2020-06-26 10:25:06'),('this is a text to voice message you should be able to hear it properly ... it is a good day today ... climate is beautiful ... times are ripe ','Test_Mitesh','audio','mv@pertsol.com','2020-06-16 16:08:17'),('Hello This is MP Police Dial 100 CCC','MP100','sms','mv@pertsol.com','2020-06-23 12:35:04'),('Hello This is MP Police Dial 100 CCC','MP100 audio','audio','mv@pertsol.com','2020-06-23 12:35:21'),('प्रिय बीएसएनएल उपभोक्ता , आप से हार्दिक निवेदन हैं की  कोरोना काल मैं आप आपने घरो मैं रहे ,सुरक्षित रहे।  घर से बाहर निकलते वक़्त मास्क  और सैनिटाइज़र्स  इश्तेमाल अवश्य करे।  ','LIVE_DEMO_HINDI_SMS','sms','mv@pertsol.com','2020-06-25 15:29:34'),('Hi we are participating in Gujarat','L&T','audio','mv@pertsol.com','2020-06-25 12:26:03'),('प्रिय बीएसएनएल उपभोक्ता , आप से हार्दिक निवेदन हैं की  कोरोना काल मैं आप आपने घरो मैं रहे ,सुरक्षित रहे।  घर से बाहर निकलते वक़्त मास्क  और सैनिटाइज़र्स  इश्तेमाल अवश्य करे।  ','LIVE_DEMO_HINDI_SMS_Voice ','audio','mv@pertsol.com','2020-06-25 15:29:48'),('This  is   test  message   for  ialert  POC 2506','LIVE_DEMO_ENGLISH','sms','mv@pertsol.com','2020-06-25 15:44:25'),('ଯଦି ଜରୁରୀ କିଛି ନାହିଁ,ଘର ବାହାରକୁ ଯିବା ନାହିଁ,ଯଦି ବାହାରକୁ ଯିବା,କରୋନ ନିୟମ ମାନି ଚାଲିବା । ସୂଚନା ଓ ଲୋକସଂପର୍କ ବିଭାଗ,ଓଡିଶା ସରକାର','DEMO_SMS_ORIA','sms','mv@pertsol.com','2020-06-25 16:21:38'),('test message from BSNL','bsnl_demo','sms','mv@pertsol.com','2020-06-25 16:45:19'),('test message from BSNL for  ilart   testing  for  sms  to  voice  message ','bsnl_demo_voice','audio','mv@pertsol.com','2020-06-25 16:45:54'),('This is for demo purpose','ISPL12','audio','mv@pertsol.com','2020-06-26 10:26:39'),('This is for Demo purpose','ISPL123','audio','mv@pertsol.com','2020-06-26 10:52:12'),('Test Message from BSNL','bsnl_2606','sms','mv@pertsol.com','2020-06-26 12:25:48'),('Test Message from BSNL','bsnl_2606_voice','audio','mv@pertsol.com','2020-06-26 12:26:08'),('This if for MP Demo purpose.','MP Dial 100 Demo1','audio','mv@pertsol.com','2020-06-29 11:50:11'),('There is an fire in bhagat chowk area','Report of fire incident','sms','mv@pertsol.com','2022-11-17 12:03:24'),('Hi, sending message on behalf of SSCL','this is test message','sms','mv@pertsol.com','2022-11-17 12:51:49'),('There is a fire in the building. pls vacate the place asap','Intimation for Fire Alarm','sms','mv@pertsol.com','2022-11-17 16:13:37'),('There is an fire in bahagat chowk area','Report an fire incident','sms','mv@pertsol.com','2022-11-17 16:27:45'),('there is a possibility of flood at baramullah area','Flood at baramullah','audio','mv@pertsol.com','2022-11-25 20:28:09'),('need of ambulance','ambulance','sms','mv@pertsol.com','2022-12-02 16:44:17');
/*!40000 ALTER TABLE `smsalerts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smsmaster`
--

DROP TABLE IF EXISTS `smsmaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smsmaster` (
  `msisdn` varchar(12) DEFAULT NULL,
  `belongsto` varchar(25) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smsmaster`
--

LOCK TABLES `smsmaster` WRITE;
/*!40000 ALTER TABLE `smsmaster` DISABLE KEYS */;
INSERT INTO `smsmaster` VALUES ('919867852018','Mitesh',1),('919711990010','Gurjot Sandhu',2);
/*!40000 ALTER TABLE `smsmaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smssentlist`
--

DROP TABLE IF EXISTS `smssentlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smssentlist` (
  `msisdn` varchar(12) DEFAULT NULL,
  `message` varchar(1000) DEFAULT NULL,
  `sent` smallint(6) DEFAULT NULL,
  `insertdate` datetime DEFAULT NULL,
  `sentdate` datetime DEFAULT NULL,
  `vkey` varchar(30) NOT NULL,
  PRIMARY KEY (`vkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smssentlist`
--

LOCK TABLES `smssentlist` WRITE;
/*!40000 ALTER TABLE `smssentlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `smssentlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `a` int(11) DEFAULT NULL,
  `b` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,2),(1,3);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updatetables`
--

DROP TABLE IF EXISTS `updatetables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updatetables` (
  `tablename` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `fieldlist` varchar(2000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updatetables`
--

LOCK TABLES `updatetables` WRITE;
/*!40000 ALTER TABLE `updatetables` DISABLE KEYS */;
INSERT INTO `updatetables` VALUES ('whitelists','White List Numbers','msisdn~number~Mobile Number');
/*!40000 ALTER TABLE `updatetables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdata`
--

DROP TABLE IF EXISTS `userdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userdata` (
  `username` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `emailid1` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `dateofbirth` varchar(200) DEFAULT NULL,
  `employeeid` varchar(40) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdata`
--

LOCK TABLES `userdata` WRITE;
/*!40000 ALTER TABLE `userdata` DISABLE KEYS */;
INSERT INTO `userdata` VALUES ('mv@pertso1l.com','kkkk','','','1973-02-01','','',NULL,'2018-02-11 23:12:40',NULL),('mv@peratso1l.com','kkkka','second@second.com','kkkkasd','1973-02-01','empid','',NULL,'2018-02-11 23:14:00',NULL),('mkk@kkk.com','Mitesh','','Password','1984-02-01','','mv@pertsol.com','mv@pertsol.com','2018-03-30 13:51:25','2018-05-13 17:35:15'),('mvv@pertsol.com','Mitesh Vageria','','Address','1965-07-08','','mv@pertsol.com',NULL,'2018-05-10 12:59:56',NULL),('mkkk@kkk.com','Mukesh','','Address','1965-07-14','','mv@pertsol.com',NULL,'2019-02-24 18:49:10',NULL),('ml@pertsol.com','Melwin','','Mumbai','1986-05-31','9999','mv@pertsol.com','mv@pertsol.com','2019-03-01 13:51:47','2019-03-01 15:14:28'),('anoop.bhawnani@mahindrassg.com','MDSL_USER_1','','UP100','','1','mv@pertsol.com',NULL,'2019-03-04 14:34:15',NULL),('ialertdemonstration@gmail.com','MP100 Demo','gurjot.sandhu@pertsol.com','MP Police, Bhopal','','3','mv@pertsol.com','mv@pertsol.com','2020-06-23 14:57:36','2020-06-30 14:08:49'),('gurjot.sandhu@pertsol.com','MP100','','MP100 Bhopal','','','mv@pertsol.com','gurjot.sandhu@pertsol.com','2020-06-30 14:11:53','2020-06-30 14:29:38');
/*!40000 ALTER TABLE `userdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdataold`
--

DROP TABLE IF EXISTS `userdataold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userdataold` (
  `username` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `emailid1` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `dateofbirth` varchar(200) DEFAULT NULL,
  `employeeid` varchar(40) DEFAULT NULL,
  `createdby` varchar(50) DEFAULT NULL,
  `updatedby` varchar(50) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdataold`
--

LOCK TABLES `userdataold` WRITE;
/*!40000 ALTER TABLE `userdataold` DISABLE KEYS */;
INSERT INTO `userdataold` VALUES ('gs@pertsol.com','Mitesh','seecond@second.com','New Address','1994-01-01','12','mv@pertsol.com','mv@pertsol.com','2018-02-11 23:32:57','2018-02-27 12:59:25'),('gs@pertsol.com','Mitesh','seecond@second.com','New Address','1994-01-01','12','mv@pertsol.com','mv@pertsol.com','2018-02-11 23:32:57','2018-02-27 12:59:25'),('mk@pertsol.com','mukesh Kumar','','mmkkkk','1981-10-15','','mv@pertsol.com',NULL,'2018-03-24 02:35:50',NULL),('mk@pertsol.com','mukesh','','mukeshkkk','1981-03-26','','mv@pertsol.com','mv@pertsol.com','2018-03-24 11:11:19','2018-03-24 22:14:57');
/*!40000 ALTER TABLE `userdataold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdb`
--

DROP TABLE IF EXISTS `userdb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userdb` (
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `lastchangedt` datetime DEFAULT NULL,
  `lastpassword` varchar(30) DEFAULT NULL,
  `loginattempts` tinyint(4) DEFAULT NULL,
  `rights` int(11) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `changepassword` tinyint(4) DEFAULT NULL,
  `locked` tinyint(4) DEFAULT NULL,
  `multilogin` tinyint(4) DEFAULT NULL,
  `ipadd` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdb`
--

LOCK TABLES `userdb` WRITE;
/*!40000 ALTER TABLE `userdb` DISABLE KEYS */;
INSERT INTO `userdb` VALUES ('mv@pertsol.com','25f9e794323b453885f5181f1b624d0b','Mitesh Vageriya','2018-08-02 00:01:25','538df0a4068130695d184910ef4eb1',54,255,'2023-03-04 14:13:22',0,0,1,NULL),('mkk@kkk.com','41bbae5fafba7603104d055391ed2f87','Mitesh','2018-03-30 13:51:25',NULL,0,175,'2018-05-02 01:52:17',0,0,1,NULL),('mvv@pertsol.com','41bbae5fafba7603104d055391ed2f87','Mitesh Vageria','2018-05-10 12:59:56',NULL,NULL,0,NULL,1,0,1,NULL),('mkkk@kkk.com','46c806322f934da5f660d1d4a56da339','Mukesh','2019-02-24 18:49:10',NULL,NULL,1,NULL,1,0,0,NULL),('ml@pertsol.com','991bfbbd3e437d82dce732e0b2ea6bfd','Melwin','2019-03-01 13:51:47',NULL,NULL,179,'2019-03-01 14:19:39',0,1,1,NULL),('anoop.bhawnani@mahindrassg.com','e4206895219c8df47ad48561eec212e2','MDSL_USER_1','2019-03-04 14:34:15',NULL,1,177,'2019-03-05 10:53:38',0,0,1,NULL),('ialertdemonstration@gmail.com','0a41b35e0ac1df97825b7537e93c399e','MP100 Demo','2020-06-23 14:57:36',NULL,NULL,255,'2020-07-02 11:28:28',0,0,1,NULL),('gurjot.sandhu@pertsol.com','0a41b35e0ac1df97825b7537e93c399e','MP100','2020-06-30 14:11:53',NULL,NULL,255,'2020-06-30 15:03:31',0,0,1,NULL);
/*!40000 ALTER TABLE `userdb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdbold`
--

DROP TABLE IF EXISTS `userdbold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userdbold` (
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `lastchangedt` datetime DEFAULT NULL,
  `lastpassword` varchar(30) DEFAULT NULL,
  `loginattempts` tinyint(4) DEFAULT NULL,
  `rights` int(11) DEFAULT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `changepassword` tinyint(4) DEFAULT NULL,
  `locked` tinyint(4) DEFAULT NULL,
  `multilogin` tinyint(4) DEFAULT NULL,
  `ipadd` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdbold`
--

LOCK TABLES `userdbold` WRITE;
/*!40000 ALTER TABLE `userdbold` DISABLE KEYS */;
INSERT INTO `userdbold` VALUES ('gs@pertsol.com','ed56dd2ad060195d7e37f501a3b469c2','Mitesh','2018-02-11 23:41:16','25d55ad283aa400af464c76d713c07',0,13,'2018-02-27 12:59:37',0,0,1,NULL),('mk@pertsol.com','d1f22773455a21ebe763fbd11791b81e','mukesh Kumar','2018-03-24 02:35:50',NULL,NULL,45,NULL,0,0,0,NULL),('mk@pertsol.com','41bbae5fafba7603104d055391ed2f87','mukesh','2018-03-24 22:09:16','d1f22773455a21ebe763fbd11791b8',NULL,13,'2018-03-24 22:15:35',0,0,1,NULL);
/*!40000 ALTER TABLE `userdbold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usernodes`
--

DROP TABLE IF EXISTS `usernodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usernodes` (
  `userid` varchar(50) NOT NULL DEFAULT '',
  `neid` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`,`neid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usernodes`
--

LOCK TABLES `usernodes` WRITE;
/*!40000 ALTER TABLE `usernodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `usernodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whitelist_back`
--

DROP TABLE IF EXISTS `whitelist_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whitelist_back` (
  `msisdn` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whitelist_back`
--

LOCK TABLES `whitelist_back` WRITE;
/*!40000 ALTER TABLE `whitelist_back` DISABLE KEYS */;
INSERT INTO `whitelist_back` VALUES (919867852018),(919163895786),(919437076688),(919437045252),(919434001730),(919437070706),(919953323649),(919711735023),(919437055400),(918518883737),(918767187567),(919479776704),(919324223061),(919711990010),(919880896533),(919880149300),(917009183954);
/*!40000 ALTER TABLE `whitelist_back` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whitelists`
--

DROP TABLE IF EXISTS `whitelists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whitelists` (
  `msisdn` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whitelists`
--

LOCK TABLES `whitelists` WRITE;
/*!40000 ALTER TABLE `whitelists` DISABLE KEYS */;
INSERT INTO `whitelists` VALUES (919953323649),(919437055400),(919437677700),(919437076688);
/*!40000 ALTER TABLE `whitelists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `whitelists_back_m`
--

DROP TABLE IF EXISTS `whitelists_back_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `whitelists_back_m` (
  `msisdn` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `whitelists_back_m`
--

LOCK TABLES `whitelists_back_m` WRITE;
/*!40000 ALTER TABLE `whitelists_back_m` DISABLE KEYS */;
INSERT INTO `whitelists_back_m` VALUES (919163895786),(919437070606),(919437042200),(919437039494),(919438556600),(919867852018),(919711735023),(919437076688),(919437045252),(919434001730),(919953323649),(919437055400),(918518883737),(918767187567),(919479776704),(919324223061),(919711990010),(919880896533),(919880149300),(917009183954),(0);
/*!40000 ALTER TABLE `whitelists_back_m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `WIDGETNAME` varchar(30) DEFAULT NULL,
  `WIDGETTITLE` varchar(50) DEFAULT NULL,
  `WIDGETTYPE` varchar(20) DEFAULT NULL,
  `WIDGETDATA` varchar(2000) DEFAULT NULL,
  `VSIZE` tinyint(4) DEFAULT NULL,
  `DASHBOARD` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES ('1eventsms','SMS Status','infobox','fa fa-comments~select count(1) CNT from event_sms where eventname = \'EVENTNAME\' and smsstatus = 1~select count(1) CNT from event_sms where eventname = \'EVENTNAME\'',3,1),('2eventcall','Calls Initiated','infobox','fa fa-phone-square~select count(1) CNT from event_call where eventname = \'EVENTNAME\' and callstatus = 1~select count(1) CNT from event_call where eventname = \'EVENTNAME\'',3,1),('3eventcallsuccess','Calls Answered','infobox','fa fa-headphones~select count(1) CNT from event_call a, newcalls b where eventname = \'EVENTNAME\' and callstatus = 1 and a.corrid = b.corrid and connectdt is not null~select count(1) CNT from event_call where eventname = \'EVENTNAME\'',3,1),('4eventcallfailed','Failed Calls','infobox','fa fa-microphone-slash~select count(1) CNT from event_call a, newcalls b where eventname = \'EVENTNAME\' and callstatus = 1 and a.corrid = b.corrid and connectdt is null~select count(1) CNT from event_call where eventname = \'EVENTNAME\'',3,1),('5inroamer','Domestic Inroamers','infobox','fa fa-flag~select count(1) CNT from event_msisdn where eventname = \'EVENTNAME\' and roamtype = 2',3,1),('6inroamerint','International Inroamers','infobox','fa fa-plane~select count(1) CNT from event_msisdn where eventname = \'EVENTNAME\' and roamtype = 3',3,1),('7smsmessage','SMS Message','infobox','~select smsmessage CNT from events where eventname = \'EVENTNAME\'',3,1),('8voicemessage','Voice Message','infobox','~select voicemessage CNT from events where eventname = \'EVENTNAME\'',3,1),('9url','MAP','url','/lis/lis?func=showcirclemapjs&eventname=EVENTNAME',9,1);
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-04 17:22:06
