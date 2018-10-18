-- MySQL dump 10.16  Distrib 10.3.8-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: fp
-- ------------------------------------------------------
-- Server version	10.3.8-MariaDB

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
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar` (
  `calendar_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '실험 달력 시퀀스',
  `main_seq` int(11) NOT NULL COMMENT 'MAIN 시퀀스',
  `comment` varchar(100) DEFAULT NULL COMMENT '0: 정상, 1: 시스템 오류, 2: 비',
  `is_error` tinyint(4) DEFAULT NULL COMMENT '에러 여부',
  `writedate` datetime DEFAULT NULL COMMENT '작성일',
  PRIMARY KEY (`calendar_seq`,`main_seq`),
  KEY `FK_MAIN_TO_CALENDAR` (`main_seq`),
  CONSTRAINT `FK_MAIN_TO_CALENDAR` FOREIGN KEY (`main_seq`) REFERENCES `main` (`main_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='실험 달력';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendar`
--

LOCK TABLES `calendar` WRITE;
/*!40000 ALTER TABLE `calendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dv_data_logger`
--

DROP TABLE IF EXISTS `dv_data_logger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dv_data_logger` (
  `data_logger_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '데이타 로거 시퀀스',
  `main_seq` int(11) DEFAULT NULL COMMENT 'MAIN 시퀀스',
  `data_logger_def_seq` int(11) DEFAULT NULL COMMENT '데이터 로거 개요 시퀀스',
  `serial_number` varchar(6) DEFAULT NULL COMMENT 'Data Logger에 접속할 수 있는 ID',
  `target_code` varchar(10) DEFAULT NULL COMMENT '데이타 로거 식별 번호',
  `connect_info` longtext DEFAULT NULL COMMENT '장치 접속 정보',
  `protocol_info` longtext DEFAULT NULL COMMENT '장치 프로토콜 정보',
  PRIMARY KEY (`data_logger_seq`),
  KEY `FK_MAIN_TO_DV_DATA_LOGGER` (`main_seq`),
  KEY `FK_DV_DATA_LOGGER_DEF_TO_DV_DATA_LOGGER` (`data_logger_def_seq`),
  CONSTRAINT `FK_DV_DATA_LOGGER_DEF_TO_DV_DATA_LOGGER` FOREIGN KEY (`data_logger_def_seq`) REFERENCES `dv_data_logger_def` (`data_logger_def_seq`),
  CONSTRAINT `FK_MAIN_TO_DV_DATA_LOGGER` FOREIGN KEY (`main_seq`) REFERENCES `main` (`main_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='데이타 로거';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dv_data_logger`
--

LOCK TABLES `dv_data_logger` WRITE;
/*!40000 ALTER TABLE `dv_data_logger` DISABLE KEYS */;
INSERT INTO `dv_data_logger` VALUES (17,1,3,'1','001','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\",\"deviceId\":1}'),(18,1,3,'2','002','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\",\"deviceId\":2}'),(19,1,3,'3','003','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\",\"deviceId\":3}'),(20,1,3,'4','004','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\",\"deviceId\":4}'),(21,1,3,'5','005','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\",\"deviceId\":5}'),(22,1,3,'6','006','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\",\"deviceId\":6}'),(23,1,4,'7','007','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\",\"deviceId\":7}'),(24,2,3,'8','008','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\",\"deviceId\":8}'),(25,2,4,'9','009','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\",\"deviceId\":9}'),(26,3,3,'10','010','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\",\"deviceId\":10}'),(27,3,4,'11','011','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\",\"deviceId\":11}'),(28,4,3,'12','012','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\",\"deviceId\":12}'),(29,4,4,'13','013','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\",\"deviceId\":13}'),(30,5,3,'14','014','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\",\"deviceId\":14}'),(31,5,3,'15','015','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\",\"deviceId\":15}'),(32,5,4,'16','016','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\",\"deviceId\":16}');
/*!40000 ALTER TABLE `dv_data_logger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dv_data_logger_def`
--

DROP TABLE IF EXISTS `dv_data_logger_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dv_data_logger_def` (
  `data_logger_def_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '데이터 로거 개요 시퀀스',
  `target_prefix` varchar(15) DEFAULT NULL COMMENT '데이터 로거 접두사(D_WD, D_P, ...)',
  `target_name` varchar(50) DEFAULT NULL COMMENT '데이터 로거를 부를 일반 명칭',
  PRIMARY KEY (`data_logger_def_seq`),
  UNIQUE KEY `UIX_DV_DATA_LOGGER_DEF` (`target_prefix`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='데이터 로거 개요';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dv_data_logger_def`
--

LOCK TABLES `dv_data_logger_def` WRITE;
/*!40000 ALTER TABLE `dv_data_logger_def` DISABLE KEYS */;
INSERT INTO `dv_data_logger_def` VALUES (3,'D_CE','Crops Environment (작물 생육 환경)'),(4,'D_OE','Outside Environment (외기 환경)');
/*!40000 ALTER TABLE `dv_data_logger_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dv_data_logger_trouble_data`
--

DROP TABLE IF EXISTS `dv_data_logger_trouble_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dv_data_logger_trouble_data` (
  `data_logger_trouble_data_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '고장 이력 시퀀스',
  `data_logger_seq` int(11) DEFAULT NULL COMMENT '데이타 로거 시퀀스',
  `trouble_msg` varchar(100) NOT NULL COMMENT '고장 내용',
  `fix_msg` varchar(100) DEFAULT NULL COMMENT '해결 내용',
  `occur_date` datetime DEFAULT NULL COMMENT '발생 일자',
  `fix_date` datetime DEFAULT NULL COMMENT '해결 일자',
  PRIMARY KEY (`data_logger_trouble_data_seq`),
  KEY `FK_DV_DATA_LOGGER_TO_DV_DATA_LOGGER_TROUBLE_DATA` (`data_logger_seq`),
  CONSTRAINT `FK_DV_DATA_LOGGER_TO_DV_DATA_LOGGER_TROUBLE_DATA` FOREIGN KEY (`data_logger_seq`) REFERENCES `dv_data_logger` (`data_logger_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='장치에서 에러가 검출될 경우 발생 및 해결 정보 저장';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dv_data_logger_trouble_data`
--

LOCK TABLES `dv_data_logger_trouble_data` WRITE;
/*!40000 ALTER TABLE `dv_data_logger_trouble_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `dv_data_logger_trouble_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dv_device_data`
--

DROP TABLE IF EXISTS `dv_device_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dv_device_data` (
  `device_data_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '장치 상태 데이터 시퀀스',
  `node_seq` int(11) NOT NULL COMMENT '노드 정보 시퀀스',
  `str_data` varchar(30) NOT NULL COMMENT 'Open, Close, On, Off ...',
  `writedate` datetime NOT NULL COMMENT '입력일',
  PRIMARY KEY (`device_data_seq`,`node_seq`),
  KEY `FK_DV_NODE_TO_DV_DEVICE_DATA` (`node_seq`),
  CONSTRAINT `FK_DV_NODE_TO_DV_DEVICE_DATA` FOREIGN KEY (`node_seq`) REFERENCES `dv_node` (`node_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='동작 상태를 가지고 있는 장치의 데이터를 기';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dv_device_data`
--

LOCK TABLES `dv_device_data` WRITE;
/*!40000 ALTER TABLE `dv_device_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `dv_device_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dv_node`
--

DROP TABLE IF EXISTS `dv_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dv_node` (
  `node_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '노드 정보 시퀀스',
  `node_def_seq` int(11) DEFAULT NULL COMMENT '노드 개요 정보 시퀀스',
  `data_logger_seq` int(11) DEFAULT NULL COMMENT '데이타 로거 시퀀스',
  `target_code` varchar(10) NOT NULL COMMENT '노드 ID(001, 002, ...)',
  `data_logger_index` tinyint(4) NOT NULL DEFAULT 0 COMMENT '해당 센서 데이터의 데이터 로거 인덱스(Default 0)',
  `serial_number` varchar(100) DEFAULT NULL COMMENT '장치 뒷면에 나와있는 S/N',
  PRIMARY KEY (`node_seq`),
  KEY `FK_DV_NODE_DEF_TO_DV_NODE` (`node_def_seq`),
  KEY `FK_DV_DATA_LOGGER_TO_DV_NODE` (`data_logger_seq`),
  CONSTRAINT `FK_DV_DATA_LOGGER_TO_DV_NODE` FOREIGN KEY (`data_logger_seq`) REFERENCES `dv_data_logger` (`data_logger_seq`),
  CONSTRAINT `FK_DV_NODE_DEF_TO_DV_NODE` FOREIGN KEY (`node_def_seq`) REFERENCES `dv_node_def` (`node_def_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8 COMMENT='장치 및 센서 정';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dv_node`
--

LOCK TABLES `dv_node` WRITE;
/*!40000 ALTER TABLE `dv_node` DISABLE KEYS */;
INSERT INTO `dv_node` VALUES (130,16,17,'001',0,NULL),(131,16,18,'002',0,NULL),(132,16,19,'003',0,NULL),(133,16,20,'004',0,NULL),(134,16,21,'005',0,NULL),(135,16,22,'006',0,NULL),(136,16,23,'007',0,NULL),(137,17,23,'007',0,NULL),(138,18,17,'001',0,NULL),(139,18,19,'003',0,NULL),(140,18,21,'005',0,NULL),(141,19,17,'001',0,NULL),(142,19,18,'002',0,NULL),(143,19,19,'003',0,NULL),(144,19,20,'004',0,NULL),(145,19,21,'005',0,NULL),(146,19,22,'006',0,NULL),(147,19,23,'007',0,NULL),(148,20,23,'007',0,NULL),(149,21,23,'007',0,NULL),(150,22,23,'007',0,NULL),(151,23,17,'001',0,NULL),(152,23,18,'002',0,NULL),(153,23,19,'003',0,NULL),(154,23,20,'004',0,NULL),(155,23,21,'005',0,NULL),(156,23,22,'006',0,NULL),(157,23,23,'007',0,NULL),(158,25,23,'007',0,NULL),(159,26,23,'007',0,NULL),(160,27,17,'001',0,NULL),(161,27,18,'002',0,NULL),(162,27,19,'003',0,NULL),(163,27,20,'004',0,NULL),(164,27,21,'005',0,NULL),(165,27,22,'006',0,NULL),(166,27,23,'007',0,NULL),(167,28,17,'001',0,NULL),(168,28,18,'002',0,NULL),(169,28,19,'003',0,NULL),(170,28,20,'004',0,NULL),(171,28,21,'005',0,NULL),(172,28,22,'006',0,NULL),(173,28,23,'007',0,NULL),(174,29,17,'001',0,NULL),(175,29,18,'002',0,NULL),(176,29,19,'003',0,NULL),(177,29,20,'004',0,NULL),(178,29,21,'005',0,NULL),(179,29,22,'006',0,NULL),(180,29,23,'007',0,NULL),(181,16,24,'008',0,NULL),(182,16,25,'009',0,NULL),(183,17,25,'009',0,NULL),(184,19,24,'008',0,NULL),(185,19,25,'009',0,NULL),(186,20,25,'009',0,NULL),(187,21,25,'009',0,NULL),(188,22,25,'009',0,NULL),(189,23,24,'008',0,NULL),(190,23,25,'009',0,NULL),(191,25,25,'009',0,NULL),(192,26,25,'009',0,NULL),(193,27,24,'008',0,NULL),(194,27,25,'009',0,NULL),(195,28,24,'008',0,NULL),(196,28,25,'009',0,NULL),(197,29,24,'008',0,NULL),(198,29,25,'009',0,NULL),(199,16,26,'010',0,NULL),(200,16,27,'011',0,NULL),(201,17,27,'011',0,NULL),(202,19,26,'010',0,NULL),(203,19,27,'011',0,NULL),(204,20,27,'011',0,NULL),(205,21,27,'011',0,NULL),(206,22,27,'011',0,NULL),(207,23,26,'010',0,NULL),(208,23,27,'011',0,NULL),(209,25,27,'011',0,NULL),(210,26,27,'011',0,NULL),(211,27,26,'010',0,NULL),(212,27,27,'011',0,NULL),(213,28,26,'010',0,NULL),(214,28,27,'011',0,NULL),(215,29,26,'010',0,NULL),(216,29,27,'011',0,NULL),(217,16,28,'012',0,NULL),(218,16,29,'013',0,NULL),(219,17,29,'013',0,NULL),(220,19,28,'012',0,NULL),(221,19,29,'013',0,NULL),(222,20,29,'013',0,NULL),(223,21,29,'013',0,NULL),(224,22,29,'013',0,NULL),(225,23,28,'012',0,NULL),(226,23,29,'013',0,NULL),(227,25,29,'013',0,NULL),(228,26,29,'013',0,NULL),(229,27,28,'012',0,NULL),(230,27,29,'013',0,NULL),(231,28,28,'012',0,NULL),(232,28,29,'013',0,NULL),(233,29,28,'012',0,NULL),(234,29,29,'013',0,NULL),(235,16,30,'014',0,NULL),(236,16,31,'015',0,NULL),(237,16,32,'016',0,NULL),(238,17,32,'016',0,NULL),(239,19,30,'014',0,NULL),(240,19,31,'015',0,NULL),(241,19,32,'016',0,NULL),(242,20,32,'016',0,NULL),(243,21,32,'016',0,NULL),(244,22,32,'016',0,NULL),(245,23,30,'014',0,NULL),(246,23,31,'015',0,NULL),(247,23,32,'016',0,NULL),(248,25,32,'016',0,NULL),(249,26,32,'016',0,NULL),(250,27,30,'014',0,NULL),(251,27,31,'015',0,NULL),(252,27,32,'016',0,NULL),(253,28,30,'014',0,NULL),(254,28,31,'015',0,NULL),(255,28,32,'016',0,NULL),(256,29,30,'014',0,NULL),(257,29,31,'015',0,NULL),(258,29,32,'016',0,NULL);
/*!40000 ALTER TABLE `dv_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dv_node_class`
--

DROP TABLE IF EXISTS `dv_node_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dv_node_class` (
  `node_class_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '노드 대분류 시퀀스',
  `target_id` varchar(255) DEFAULT NULL COMMENT '노드를 가르키는 고유 명',
  `target_name` varchar(50) DEFAULT NULL COMMENT '장치 명(한글)',
  `is_sensor` tinyint(4) DEFAULT NULL COMMENT '센서 여부(0: Device, 1: Sensor)',
  `data_unit` varchar(10) DEFAULT NULL COMMENT 'cm, kWh, m/s, m 등등',
  `description` varchar(255) DEFAULT NULL COMMENT '부연 설명이 필요한 경우',
  PRIMARY KEY (`node_class_seq`),
  UNIQUE KEY `UIX_DV_NODE_CLASS` (`target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='지정된 센서 목록으로 온도 센서(Temperature), 풍향 센서(WindSpeed) 등등을 표기한 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dv_node_class`
--

LOCK TABLES `dv_node_class` WRITE;
/*!40000 ALTER TABLE `dv_node_class` DISABLE KEYS */;
INSERT INTO `dv_node_class` VALUES (15,'temp','온도',1,'℃','섭씨: 1 atm에서의 물의 어는점을 0도, 끓는점을 100도로 정한 온도'),(16,'reh','습도',1,'%RH','공기 중에 포함되어 있는 수증기의 양 또는 비율을 나타내는 단위'),(17,'ws','풍속',1,'m/s','초당 바람이 이동하는 거리(m)'),(18,'wd','풍향',1,NULL,'풍향 0~7 (북, 북동, 동, 남동, 남, 남서, 서, 북서)'),(19,'solar','일사량',1,'W/m²','1평방 미터당 조사되는 일사에너지의 양이 1W'),(20,'rainfall','강우량',1,'mm/hr','시간당 일정한 곳에 내린 비의 분량. 단위는 mm'),(21,'isRain','강우 감지 여부',1,NULL,'감지시 1, 미감지시 0'),(22,'co2','이산화탄소',1,'ppm','백만분의 1. 이산화탄소 농도 395ppm = 395/1,000,000 * 100 = 0.0395 %'),(23,'uv','자외선',1,'mJ/c㎡','1평방 센치당 조사되는 uv 에너지가 1mJ'),(24,'lux','조도',1,'lx','1㎡의 면적 위에 1m의 광속이 균일하게 비춰질 때'),(25,'waterValue','수분 값',1,'%',''),(26,'vol','전압',1,'V',NULL),(27,'amp','전류',1,'A',NULL),(28,'kiloWatt','출력',NULL,'kW','출력');
/*!40000 ALTER TABLE `dv_node_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dv_node_def`
--

DROP TABLE IF EXISTS `dv_node_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dv_node_def` (
  `node_def_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '노드 개요 정보 시퀀스',
  `node_class_seq` int(11) DEFAULT NULL COMMENT '노드 목록 시퀀스',
  `target_prefix` varchar(15) NOT NULL COMMENT '해당 프로젝트에서 쓸 접두사',
  `target_id` varchar(50) DEFAULT NULL COMMENT '사용 목적에 따라 달리 부를 센서 명으로 데이터 Key를 결정',
  `target_name` varchar(50) DEFAULT NULL COMMENT '필요시 세부 사용 목적 기술',
  `description` varchar(255) DEFAULT NULL COMMENT '노드 데이터 단위에 대한 부연 설명이 필요한 경우',
  PRIMARY KEY (`node_def_seq`),
  UNIQUE KEY `UIX_DV_NODE_DEF` (`target_prefix`),
  UNIQUE KEY `UIX_DV_NODE_DEF2` (`target_id`),
  KEY `FK_DV_NODE_CLASS_TO_DV_NODE_DEF` (`node_class_seq`),
  CONSTRAINT `FK_DV_NODE_CLASS_TO_DV_NODE_DEF` FOREIGN KEY (`node_class_seq`) REFERENCES `dv_node_class` (`node_class_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='노드 개요 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dv_node_def`
--

LOCK TABLES `dv_node_def` WRITE;
/*!40000 ALTER TABLE `dv_node_def` DISABLE KEYS */;
INSERT INTO `dv_node_def` VALUES (16,15,'T_S','soilTemperature','토양 온도','섭씨: 1 atm에서의 물의 어는점을 0도, 끓는점을 100도로 정한 온도'),(17,15,'T_OA','outsideAirTemperature','외기 온도','섭씨: 1 atm에서의 물의 어는점을 0도, 끓는점을 100도로 정한 온도'),(18,15,'T_PR','pvRearTemperature','모듈 뒷면 온도','섭씨: 1 atm에서의 물의 어는점을 0도, 끓는점을 100도로 정한 온도'),(19,16,'RH_S','soilReh','토양 습도','공기 중에 포함되어 있는 수증기의 양 또는 비율을 나타내는 단위'),(20,16,'RH_OA','outsideAirReh','외기 습도','공기 중에 포함되어 있는 수증기의 양 또는 비율을 나타내는 단위'),(21,17,'W_S','windSpeed','풍속','초당 바람이 이동하는 거리(m)'),(22,18,'W_D','windDirection','풍향','풍향 0~7 (북, 북동, 동, 남동, 남, 남서, 서, 북서)'),(23,19,'S_H','horizontalSolar','일사량','1평방 미터당 조사되는 일사에너지의 양이 1W'),(24,19,'S_I','inclinedSolar','경사 일사량','1평방 미터당 조사되는 일사에너지의 양이 1W'),(25,20,'RF1','r1','시간당 강우량','시간당 일정한 곳에 내린 비의 분량. 단위는 mm'),(26,21,'IR','isRain','강우 감지 여부','감지시 1, 미감지시 0'),(27,22,'CO2','co2','이산화탄소','백만분의 1. 이산화탄소 농도 395ppm = 395/1,000,000 * 100 = 0.0395 %'),(28,24,'LX','lux','조도','1㎡의 면적 위에 1m의 광속이 균일하게 비춰질 때'),(29,25,'WV_S','soilWaterValue','토양 수분 값',''),(30,28,'kW_I','inverter','인버터 출력','33kW급');
/*!40000 ALTER TABLE `dv_node_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dv_place`
--

DROP TABLE IF EXISTS `dv_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dv_place` (
  `place_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '장소 정보 시퀀스',
  `place_def_seq` int(11) DEFAULT NULL COMMENT '장소 개요 정보 시퀀스',
  `main_seq` int(11) DEFAULT NULL COMMENT 'MAIN 시퀀스',
  `target_code` varchar(10) DEFAULT NULL COMMENT '장소 번호',
  `target_name` varchar(50) DEFAULT NULL COMMENT '장소 명',
  `chart_color` varchar(13) DEFAULT NULL COMMENT '차트 색상',
  `chart_sort_rank` tinyint(4) DEFAULT NULL COMMENT '차트 정렬 순위',
  `depth` float DEFAULT NULL COMMENT '장소 상대적 위치',
  `place_info` longtext DEFAULT NULL COMMENT '장소 상세 정보',
  PRIMARY KEY (`place_seq`),
  KEY `FK_DV_PLACE_DEF_TO_DV_PLACE` (`place_def_seq`),
  KEY `FK_MAIN_TO_DV_PLACE` (`main_seq`),
  CONSTRAINT `FK_DV_PLACE_DEF_TO_DV_PLACE` FOREIGN KEY (`place_def_seq`) REFERENCES `dv_place_def` (`place_def_seq`),
  CONSTRAINT `FK_MAIN_TO_DV_PLACE` FOREIGN KEY (`main_seq`) REFERENCES `main` (`main_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='장소 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dv_place`
--

LOCK TABLES `dv_place` WRITE;
/*!40000 ALTER TABLE `dv_place` DISABLE KEYS */;
INSERT INTO `dv_place` VALUES (69,9,1,'001','고정식','#212529',1,NULL,NULL),(70,9,1,'002','가변식','#a61e4d',2,NULL,NULL),(71,9,1,'003','수평','#5f3dc4',3,NULL,NULL),(72,10,1,'001','하부','#212529',1,NULL,NULL),(73,10,1,'002','외곽','#c92a2a',2,NULL,NULL),(74,11,1,'003','하부','#a61e4d',3,NULL,NULL),(75,11,1,'004','외곽','#862e9c',4,NULL,NULL),(76,12,1,'005','하부','#5f3dc4',5,NULL,NULL),(77,12,1,'006','외곽','#364fc7',6,NULL,NULL),(78,13,1,'007',NULL,'#1864ab',7,NULL,NULL),(79,9,2,'004','외부','#0b7285',4,NULL,NULL),(80,14,2,'008','하부','#0b7285',8,NULL,NULL),(81,13,2,'009',NULL,'#087f5b',9,NULL,NULL),(82,9,3,'005','외부','#2b8a3e',5,NULL,NULL),(83,14,3,'010','하부','#2b8a3e',10,NULL,NULL),(84,13,3,'011',NULL,'#5c940d',11,NULL,NULL),(85,9,4,'006','1','#e67700',6,NULL,NULL),(86,9,4,'007','2','#d9480f',7,NULL,NULL),(87,9,4,'008','3','#c92a2a',8,NULL,NULL),(88,14,4,'012','하부','#e67700',12,NULL,NULL),(89,13,4,'013',NULL,'#d9480f',13,NULL,NULL),(90,9,5,'009','일반 구조물','#868e96',9,NULL,NULL),(91,9,5,'010','태양광 구조물','#b9560d',10,NULL,NULL),(92,9,5,'011','외부','#3bc9db',11,NULL,NULL),(93,15,5,'014','하부','#868e96',14,NULL,NULL),(94,16,5,'015','하부','#b9560d',15,NULL,NULL),(95,13,5,'016',NULL,'#3bc9db',16,NULL,NULL);
/*!40000 ALTER TABLE `dv_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dv_place_class`
--

DROP TABLE IF EXISTS `dv_place_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dv_place_class` (
  `place_class_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '장소 대분류 시퀀스',
  `target_id` varchar(255) DEFAULT NULL COMMENT '장소 id',
  `target_name` varchar(50) DEFAULT NULL COMMENT '장소 대분류 명',
  `description` varchar(255) DEFAULT NULL COMMENT '장소 분류 설명',
  PRIMARY KEY (`place_class_seq`),
  UNIQUE KEY `UIX_DV_PLACE_CLASS` (`target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='장소 대분류';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dv_place_class`
--

LOCK TABLES `dv_place_class` WRITE;
/*!40000 ALTER TABLE `dv_place_class` DISABLE KEYS */;
INSERT INTO `dv_place_class` VALUES (4,'inverter','인버터','인버터가 설치된 부지'),(5,'farmParallelSite','농업 병행 부지','농업 병행 태양광 부지로 작물 생육 환경 센서가 존재'),(6,'outside','외부 환경','농업 병행 태양광 부지와의 대조군으로 작물 생육에 들어간 센서와 기상환경 계측 센서 존재');
/*!40000 ALTER TABLE `dv_place_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dv_place_def`
--

DROP TABLE IF EXISTS `dv_place_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dv_place_def` (
  `place_def_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '장소 개요 정보 시퀀스',
  `place_class_seq` int(11) DEFAULT NULL COMMENT '장소 대분류 시퀀스',
  `target_id` varchar(255) DEFAULT NULL COMMENT '장소 개요 id',
  `target_prefix` varchar(15) DEFAULT NULL COMMENT '장소 접두사',
  `target_name` varchar(50) DEFAULT NULL COMMENT '이름',
  PRIMARY KEY (`place_def_seq`),
  UNIQUE KEY `UIX_DV_PLACE_DEF` (`target_id`),
  UNIQUE KEY `UIX_DV_PLACE_DEF2` (`target_prefix`),
  KEY `FK_DV_PLACE_CLASS_TO_DV_PLACE_DEF` (`place_class_seq`),
  CONSTRAINT `FK_DV_PLACE_CLASS_TO_DV_PLACE_DEF` FOREIGN KEY (`place_class_seq`) REFERENCES `dv_place_class` (`place_class_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='장소 개요 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dv_place_def`
--

LOCK TABLES `dv_place_def` WRITE;
/*!40000 ALTER TABLE `dv_place_def` DISABLE KEYS */;
INSERT INTO `dv_place_def` VALUES (9,4,'inverter','IVT','인버터'),(10,5,'fixingPV','PV_F','고정식 태양광'),(11,5,'variablePV','PV_V','가변식 태양광'),(12,5,'horizontalPV','PV_H','수평 태양광'),(13,6,'outside','OS','외부 환경'),(14,5,'normalPV','PV_N','태양광'),(15,5,'normalStructure','N_S','일반 구조물'),(16,5,'photovoltaicStructure','PV_S','태양광 구조물');
/*!40000 ALTER TABLE `dv_place_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dv_place_relation`
--

DROP TABLE IF EXISTS `dv_place_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dv_place_relation` (
  `place_relation_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '센서 관계 시퀀스',
  `node_seq` int(11) NOT NULL COMMENT '노드 정보 시퀀스',
  `place_seq` int(11) NOT NULL COMMENT '장소 정보 시퀀스',
  PRIMARY KEY (`place_relation_seq`,`node_seq`,`place_seq`),
  KEY `FK_DV_NODE_TO_DV_PLACE_RELATION` (`node_seq`),
  KEY `FK_DV_PLACE_TO_DV_PLACE_RELATION` (`place_seq`),
  CONSTRAINT `FK_DV_NODE_TO_DV_PLACE_RELATION` FOREIGN KEY (`node_seq`) REFERENCES `dv_node` (`node_seq`),
  CONSTRAINT `FK_DV_PLACE_TO_DV_PLACE_RELATION` FOREIGN KEY (`place_seq`) REFERENCES `dv_place` (`place_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=850 DEFAULT CHARSET=utf8 COMMENT='센서 관계';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dv_place_relation`
--

LOCK TABLES `dv_place_relation` WRITE;
/*!40000 ALTER TABLE `dv_place_relation` DISABLE KEYS */;
INSERT INTO `dv_place_relation` VALUES (721,167,72),(722,151,72),(723,160,72),(724,174,72),(725,138,72),(726,130,72),(727,141,72),(728,168,73),(729,152,73),(730,161,73),(731,175,73),(732,131,73),(733,142,73),(734,169,74),(735,153,74),(736,162,74),(737,176,74),(738,139,74),(739,132,74),(740,143,74),(741,170,75),(742,154,75),(743,163,75),(744,177,75),(745,133,75),(746,144,75),(747,171,76),(748,155,76),(749,164,76),(750,178,76),(751,140,76),(752,134,76),(753,145,76),(754,172,77),(755,156,77),(756,165,77),(757,179,77),(758,135,77),(759,146,77),(760,173,78),(761,157,78),(762,166,78),(763,180,78),(764,136,78),(765,147,78),(766,137,78),(767,148,78),(768,150,78),(769,149,78),(770,158,78),(771,159,78),(772,195,80),(773,189,80),(774,193,80),(775,197,80),(776,181,80),(777,184,80),(778,196,81),(779,190,81),(780,194,81),(781,198,81),(782,182,81),(783,185,81),(784,183,81),(785,186,81),(786,188,81),(787,187,81),(788,191,81),(789,192,81),(790,213,83),(791,207,83),(792,211,83),(793,215,83),(794,199,83),(795,202,83),(796,214,84),(797,208,84),(798,212,84),(799,216,84),(800,200,84),(801,203,84),(802,201,84),(803,204,84),(804,206,84),(805,205,84),(806,209,84),(807,210,84),(808,231,88),(809,225,88),(810,229,88),(811,233,88),(812,217,88),(813,220,88),(814,232,89),(815,226,89),(816,230,89),(817,234,89),(818,218,89),(819,221,89),(820,219,89),(821,222,89),(822,224,89),(823,223,89),(824,227,89),(825,228,89),(826,253,93),(827,245,93),(828,250,93),(829,256,93),(830,235,93),(831,239,93),(832,254,94),(833,246,94),(834,251,94),(835,257,94),(836,236,94),(837,240,94),(838,255,95),(839,247,95),(840,252,95),(841,258,95),(842,237,95),(843,241,95),(844,238,95),(845,242,95),(846,244,95),(847,243,95),(848,248,95),(849,249,95);
/*!40000 ALTER TABLE `dv_place_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dv_sensor_data`
--

DROP TABLE IF EXISTS `dv_sensor_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dv_sensor_data` (
  `sensor_data_seq` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '센서 데이터 시퀀스',
  `node_seq` int(11) NOT NULL COMMENT '노드 정보 시퀀스',
  `num_data` float NOT NULL COMMENT '센서 데이터',
  `writedate` datetime NOT NULL COMMENT '입력일',
  PRIMARY KEY (`sensor_data_seq`,`node_seq`),
  KEY `FK_DV_NODE_TO_DV_SENSOR_DATA` (`node_seq`),
  CONSTRAINT `FK_DV_NODE_TO_DV_SENSOR_DATA` FOREIGN KEY (`node_seq`) REFERENCES `dv_node` (`node_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 COMMENT='수치 데이터를 가지고 있는 센서의 데이터를 기록';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dv_sensor_data`
--

LOCK TABLES `dv_sensor_data` WRITE;
/*!40000 ALTER TABLE `dv_sensor_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `dv_sensor_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main`
--

DROP TABLE IF EXISTS `main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main` (
  `main_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT 'MAIN 시퀀스',
  `weather_location_seq` int(11) DEFAULT NULL COMMENT '기상청 정보 위치 시퀀스',
  `uuid` varchar(255) NOT NULL COMMENT 'uuid',
  `name` varchar(50) DEFAULT NULL COMMENT '지역 이름',
  `map` longtext DEFAULT NULL COMMENT '맵 파일 정보',
  `address` varchar(100) DEFAULT NULL COMMENT '주소',
  `is_deleted` tinyint(4) DEFAULT 0 COMMENT '삭제여부',
  `writedate` datetime DEFAULT NULL COMMENT '생성일',
  `updatedate` timestamp NULL DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`main_seq`),
  KEY `FK_WC_WEATHER_LOCATION_TO_MAIN` (`weather_location_seq`),
  CONSTRAINT `FK_WC_WEATHER_LOCATION_TO_MAIN` FOREIGN KEY (`weather_location_seq`) REFERENCES `wc_weather_location` (`weather_location_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='설치되고 운용중인 UPSAS 목록 정보 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main`
--

LOCK TABLES `main` WRITE;
/*!40000 ALTER TABLE `main` DISABLE KEYS */;
INSERT INTO `main` VALUES (1,NULL,'001','나주','{\"drawInfo\":{\"frame\":{\"mapSize\":{\"width\":880,\"height\":1230},\"svgModelResourceList\":[{\"id\":\"salternBlock_001\",\"type\":\"rect\",\"elementDrawInfo\":{\"width\":100,\"height\":150,\"color\":\"#33ffff\"}},{\"id\":\"salternBlock_002\",\"type\":\"rect\",\"elementDrawInfo\":{\"width\":100,\"height\":150,\"color\":\"#33ffff\"}},{\"id\":\"salternLine_001\",\"type\":\"line\",\"elementDrawInfo\":{\"strokeWidth\":100,\"color\":\"#33ccff\"}},{\"id\":\"pump_001\",\"type\":\"circle\",\"elementDrawInfo\":{\"radius\":20,\"color\":\"#9fe667\"}},{\"id\":\"valve_001\",\"type\":\"rhombus\",\"elementDrawInfo\":{\"width\":20,\"height\":20,\"rotate\":45,\"color\":\"#efb4ce\"}}]},\"positionList\":[{}]},\"setInfo\":{\"mainInfo\":{\"main_seq\":1,\"uuid\":\"001\"},\"dccConstructorList\":[{\"dccId\":\"DCC_001\",\"connect_info\":{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}},{\"dccId\":\"DCC_002\",\"connect_info\":{\"type\":\"modbus\",\"subType\":\"rtu\",\"baudRate\":9600,\"port\":\"COM3\",\"hasPassive\":true}}],\"dpcConstructorList\":[{\"dpcId\":\"DPC_001\",\"protocol_info\":{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\"}}],\"dataLoggerStructureList\":[{\"target_prefix\":\"D_CE\",\"target_name\":\"Crops Environment (작물 생육 환경)\",\"dataLoggerDeviceList\":[{\"serial_number\":1,\"target_code\":\"001\",\"target_name\":\"나주 고정식 태양광 하부\",\"dccId\":\"DCC_001\",\"dpcId\":\"DPC_001\",\"nodeList\":[\"LX_001\",\"S_H_001\",\"CO2_001\",\"WV_S_001\",\"T_PR_001\",\"T_S_001\",\"RH_S_001\"]},{\"serial_number\":2,\"target_code\":\"002\",\"target_name\":\"나주 고정식 외부\",\"dccId\":\"DCC_001\",\"dpcId\":\"DPC_001\",\"nodeList\":[\"LX_002\",\"S_H_002\",\"CO2_002\",\"WV_S_002\",\"T_S_002\",\"RH_S_002\"]},{\"serial_number\":3,\"target_code\":\"003\",\"target_name\":\"나주 가변식 태양광 하부\",\"dccId\":\"DCC_001\",\"dpcId\":\"DPC_001\",\"nodeList\":[\"LX_003\",\"S_H_003\",\"CO2_003\",\"WV_S_003\",\"T_PR_003\",\"T_S_003\",\"RH_S_003\"]},{\"serial_number\":4,\"target_code\":\"004\",\"target_name\":\"나주 가변식 외부\",\"dccId\":\"DCC_001\",\"dpcId\":\"DPC_001\",\"nodeList\":[\"LX_004\",\"S_H_004\",\"CO2_004\",\"WV_S_004\",\"T_S_004\",\"RH_S_004\"]},{\"serial_number\":5,\"target_code\":\"005\",\"target_name\":\"나주 수평 태양광 하부\",\"dccId\":\"DCC_001\",\"dpcId\":\"DPC_001\",\"nodeList\":[\"LX_005\",\"S_H_005\",\"CO2_005\",\"WV_S_005\",\"T_PR_005\",\"T_S_005\",\"RH_S_005\"]},{\"serial_number\":6,\"target_code\":\"006\",\"target_name\":\"나주 수평 외부\",\"dccId\":\"DCC_001\",\"dpcId\":\"DPC_001\",\"nodeList\":[\"LX_006\",\"S_H_006\",\"CO2_006\",\"WV_S_006\",\"T_S_006\",\"RH_S_006\"]}]},{\"target_prefix\":\"D_OE\",\"target_name\":\"Outside Environment (외기 환경)\",\"dataLoggerDeviceList\":[{\"serial_number\":7,\"target_code\":\"007\",\"target_name\":\"나주 외기 환경\",\"dccId\":\"DCC_001\",\"dpcId\":\"DPC_001\",\"nodeList\":[\"LX_007\",\"S_H_007\",\"CO2_007\",\"WV_S_007\",\"T_S_007\",\"RH_S_007\",\"T_OA_007\",\"RH_OA_007\",\"W_D_007\",\"W_S_007\",\"RF1_007\",\"IR_007\"]}]}],\"nodeStructureList\":[{\"target_id\":\"temp\",\"target_name\":\"온도\",\"is_sensor\":1,\"data_unit\":\"℃\",\"description\":\"섭씨: 1 atm에서의 물의 어는점을 0도, 끓는점을 100도로 정한 온도\",\"defList\":[{\"target_id\":\"soilTemperature\",\"target_prefix\":\"T_S\",\"target_name\":\"토양 온도\",\"nodeList\":[{\"target_code\":\"001\"},{\"target_code\":\"002\"},{\"target_code\":\"003\"},{\"target_code\":\"004\"},{\"target_code\":\"005\"},{\"target_code\":\"006\"},{\"target_code\":\"007\"}]},{\"target_id\":\"outsideAirTemperature\",\"target_prefix\":\"T_OA\",\"target_name\":\"외기 온도\",\"nodeList\":[{\"target_code\":\"007\"}]},{\"target_id\":\"pvRearTemperature\",\"target_prefix\":\"T_PR\",\"target_name\":\"모듈 뒷면 온도\",\"nodeList\":[{\"target_code\":\"001\"},{\"target_code\":\"003\"},{\"target_code\":\"005\"}]}]},{\"target_id\":\"reh\",\"target_name\":\"습도\",\"is_sensor\":1,\"data_unit\":\"%RH\",\"description\":\"공기 중에 포함되어 있는 수증기의 양 또는 비율을 나타내는 단위\",\"defList\":[{\"target_id\":\"soilReh\",\"target_prefix\":\"RH_S\",\"target_name\":\"토양 습도\",\"nodeList\":[{\"target_code\":\"001\"},{\"target_code\":\"002\"},{\"target_code\":\"003\"},{\"target_code\":\"004\"},{\"target_code\":\"005\"},{\"target_code\":\"006\"},{\"target_code\":\"007\"}]},{\"target_id\":\"outsideAirReh\",\"target_prefix\":\"RH_OA\",\"target_name\":\"외기 습도\",\"nodeList\":[{\"target_code\":\"007\"}]}]},{\"target_id\":\"ws\",\"target_name\":\"풍속\",\"is_sensor\":1,\"data_unit\":\"m/s\",\"description\":\"초당 바람이 이동하는 거리(m)\",\"defList\":[{\"target_id\":\"windSpeed\",\"target_prefix\":\"W_S\",\"nodeList\":[{\"target_code\":\"007\"}]}]},{\"target_id\":\"wd\",\"target_name\":\"풍향\",\"is_sensor\":1,\"description\":\"풍향 0~7 (북, 북동, 동, 남동, 남, 남서, 서, 북서)\",\"defList\":[{\"target_id\":\"windDirection\",\"target_prefix\":\"W_D\",\"nodeList\":[{\"target_code\":\"007\"}]}]},{\"target_id\":\"solar\",\"target_name\":\"일사량\",\"is_sensor\":1,\"data_unit\":\"W/m²\",\"description\":\"1평방 미터당 조사되는 일사에너지의 양이 1W\",\"defList\":[{\"target_id\":\"horizontalSolar\",\"target_name\":\"일사량\",\"target_prefix\":\"S_H\",\"nodeList\":[{\"target_code\":\"001\"},{\"target_code\":\"002\"},{\"target_code\":\"003\"},{\"target_code\":\"004\"},{\"target_code\":\"005\"},{\"target_code\":\"006\"},{\"target_code\":\"007\"}]},{\"target_id\":\"inclinedSolar\",\"target_name\":\"경사 일사량\",\"target_prefix\":\"S_I\",\"nodeList\":[]}]},{\"target_id\":\"rainfall\",\"target_name\":\"강우량\",\"is_sensor\":1,\"data_unit\":\"mm/hr\",\"description\":\"시간당 일정한 곳에 내린 비의 분량. 단위는 mm\",\"defList\":[{\"target_id\":\"r1\",\"target_prefix\":\"RF1\",\"target_name\":\"시간당 강우량\",\"nodeList\":[{\"target_code\":\"007\"}]}]},{\"target_id\":\"isRain\",\"target_name\":\"강우 감지 여부\",\"is_sensor\":1,\"description\":\"감지시 1, 미감지시 0\",\"defList\":[{\"target_id\":\"isRain\",\"target_prefix\":\"IR\",\"target_name\":\"강우 감지 여부\",\"nodeList\":[{\"target_code\":\"007\"}]}]},{\"target_id\":\"co2\",\"target_name\":\"이산화탄소\",\"is_sensor\":1,\"data_unit\":\"ppm\",\"description\":\"백만분의 1. 이산화탄소 농도 395ppm = 395/1,000,000 * 100 = 0.0395 %\",\"defList\":[{\"target_id\":\"co2\",\"target_prefix\":\"CO2\",\"nodeList\":[{\"target_code\":\"001\"},{\"target_code\":\"002\"},{\"target_code\":\"003\"},{\"target_code\":\"004\"},{\"target_code\":\"005\"},{\"target_code\":\"006\"},{\"target_code\":\"007\"}]}]},{\"target_id\":\"uv\",\"target_name\":\"자외선\",\"is_sensor\":1,\"data_unit\":\"mJ/c㎡\",\"description\":\"1평방 센치당 조사되는 uv 에너지가 1mJ\",\"defList\":[]},{\"target_id\":\"lux\",\"target_name\":\"조도\",\"is_sensor\":1,\"data_unit\":\"lx\",\"description\":\"1㎡의 면적 위에 1m의 광속이 균일하게 비춰질 때\",\"defList\":[{\"target_id\":\"lux\",\"target_prefix\":\"LX\",\"nodeList\":[{\"target_code\":\"001\"},{\"target_code\":\"002\"},{\"target_code\":\"003\"},{\"target_code\":\"004\"},{\"target_code\":\"005\"},{\"target_code\":\"006\"},{\"target_code\":\"007\"}]}]},{\"target_id\":\"waterValue\",\"target_name\":\"수분 값\",\"is_sensor\":1,\"data_unit\":\"%\",\"description\":\"\",\"defList\":[{\"target_id\":\"soilWaterValue\",\"target_prefix\":\"WV_S\",\"target_name\":\"토양 수분 값\",\"nodeList\":[{\"target_code\":\"001\"},{\"target_code\":\"002\"},{\"target_code\":\"003\"},{\"target_code\":\"004\"},{\"target_code\":\"005\"},{\"target_code\":\"006\"},{\"target_code\":\"007\"}]}]},{\"target_id\":\"vol\",\"target_name\":\"전압\",\"is_sensor\":1,\"data_unit\":\"V\",\"description\":null,\"defList\":[]},{\"target_id\":\"amp\",\"target_name\":\"전류\",\"is_sensor\":1,\"data_unit\":\"A\",\"description\":null,\"defList\":[]},{\"target_id\":\"kiloWatt\",\"target_name\":\"출력\",\"data_unit\":\"kW\",\"description\":\"출력\",\"defList\":[{\"target_id\":\"inverter\",\"target_name\":\"인버터\",\"target_prefix\":\"kW_I\",\"description\":\"33kW급\",\"nodeList\":[{\"target_code\":\"001\"},{\"target_code\":\"002\"},{\"target_code\":\"003\"}]}]}]},\"realtionInfo\":{\"placeRelationList\":[{\"target_id\":\"inverter\",\"target_name\":\"인버터\",\"description\":\"인버터가 설치된 부지\",\"defList\":[{\"target_id\":\"inverter\",\"target_name\":\"인버터\",\"target_prefix\":\"IVT\",\"placeList\":[{\"target_code\":\"001\",\"target_name\":\"고정식\",\"nodeList\":[\"kW_I_001\"]},{\"target_code\":\"002\",\"target_name\":\"가변식\",\"nodeList\":[\"kW_I_002\"]},{\"target_code\":\"003\",\"target_name\":\"수평\",\"nodeList\":[\"kW_I_003\"]}]}]},{\"target_id\":\"farmParallelSite\",\"target_name\":\"농업 병행 부지\",\"description\":\"농업 병행 태양광 부지로 작물 생육 환경 센서가 존재\",\"defList\":[{\"target_id\":\"fixingPV\",\"target_prefix\":\"PV_F\",\"target_name\":\"고정식 태양광\",\"placeList\":[{\"target_code\":\"001\",\"target_name\":\"하부\",\"chart_color\":\"#212529\",\"chart_sort_rank\":1,\"nodeList\":[\"LX_001\",\"S_H_001\",\"CO2_001\",\"WV_S_001\",\"T_PR_001\",\"T_S_001\",\"RH_S_001\"]},{\"target_code\":\"002\",\"target_name\":\"외곽\",\"chart_color\":\"#c92a2a\",\"chart_sort_rank\":2,\"nodeList\":[\"LX_002\",\"S_H_002\",\"CO2_002\",\"WV_S_002\",\"T_S_002\",\"RH_S_002\"]}]},{\"target_id\":\"variablePV\",\"target_prefix\":\"PV_V\",\"target_name\":\"가변식 태양광\",\"placeList\":[{\"target_code\":\"003\",\"target_name\":\"하부\",\"chart_color\":\"#a61e4d\",\"chart_sort_rank\":3,\"nodeList\":[\"LX_003\",\"S_H_003\",\"CO2_003\",\"WV_S_003\",\"T_PR_003\",\"T_S_003\",\"RH_S_003\"]},{\"target_code\":\"004\",\"target_name\":\"외곽\",\"chart_color\":\"#862e9c\",\"chart_sort_rank\":4,\"nodeList\":[\"LX_004\",\"S_H_004\",\"CO2_004\",\"WV_S_004\",\"T_S_004\",\"RH_S_004\"]}]},{\"target_id\":\"horizontalPV\",\"target_prefix\":\"PV_H\",\"target_name\":\"수평 태양광\",\"placeList\":[{\"target_code\":\"005\",\"target_name\":\"하부\",\"chart_color\":\"#5f3dc4\",\"chart_sort_rank\":5,\"nodeList\":[\"LX_005\",\"S_H_005\",\"CO2_005\",\"WV_S_005\",\"T_PR_005\",\"T_S_005\",\"RH_S_005\"]},{\"target_code\":\"006\",\"target_name\":\"외곽\",\"chart_color\":\"#364fc7\",\"chart_sort_rank\":6,\"nodeList\":[\"LX_006\",\"S_H_006\",\"CO2_006\",\"WV_S_006\",\"T_S_006\",\"RH_S_006\"]}]}]},{\"target_id\":\"outside\",\"target_name\":\"외부 환경\",\"description\":\"농업 병행 태양광 부지와의 대조군으로 작물 생육에 들어간 센서와 기상환경 계측 센서 존재\",\"defList\":[{\"target_id\":\"outside\",\"target_prefix\":\"OS\",\"placeList\":[{\"target_code\":\"007\",\"chart_color\":\"#1864ab\",\"chart_sort_rank\":7,\"nodeList\":[\"LX_007\",\"S_H_007\",\"CO2_007\",\"WV_S_007\",\"T_S_007\",\"RH_S_007\",\"T_OA_007\",\"RH_OA_007\",\"W_D_007\",\"W_S_007\",\"RF1_007\",\"IR_007\"]}]}]}]},\"controlInfo\":{}}',NULL,0,'2018-10-18 16:56:34','2018-10-18 07:56:37'),(2,NULL,'002','강진','{\"drawInfo\":{\"frame\":{\"mapSize\":{\"width\":880,\"height\":1230},\"svgModelResourceList\":[{\"id\":\"salternBlock_001\",\"type\":\"rect\",\"elementDrawInfo\":{\"width\":100,\"height\":150,\"color\":\"#33ffff\"}},{\"id\":\"salternBlock_002\",\"type\":\"rect\",\"elementDrawInfo\":{\"width\":100,\"height\":150,\"color\":\"#33ffff\"}},{\"id\":\"salternLine_001\",\"type\":\"line\",\"elementDrawInfo\":{\"strokeWidth\":100,\"color\":\"#33ccff\"}},{\"id\":\"pump_001\",\"type\":\"circle\",\"elementDrawInfo\":{\"radius\":20,\"color\":\"#9fe667\"}},{\"id\":\"valve_001\",\"type\":\"rhombus\",\"elementDrawInfo\":{\"width\":20,\"height\":20,\"rotate\":45,\"color\":\"#efb4ce\"}}]},\"positionList\":[{}]},\"setInfo\":{\"mainInfo\":{\"main_seq\":2,\"uuid\":\"002\"},\"dccConstructorList\":[{\"dccId\":\"DCC_001\",\"connect_info\":{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}},{\"dccId\":\"DCC_002\",\"connect_info\":{\"type\":\"modbus\",\"subType\":\"rtu\",\"baudRate\":9600,\"port\":\"COM3\",\"hasPassive\":true}}],\"dpcConstructorList\":[{\"dpcId\":\"DPC_001\",\"protocol_info\":{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\"}}],\"dataLoggerStructureList\":[{\"target_prefix\":\"D_CE\",\"target_name\":\"Crops Environment (작물 생육 환경)\",\"dataLoggerDeviceList\":[{\"serial_number\":8,\"target_code\":\"008\",\"dccId\":\"DCC_001\",\"dpcId\":\"DPC_001\",\"nodeList\":[\"LX_008\",\"S_H_008\",\"CO2_008\",\"WV_S_008\",\"T_S_008\",\"RH_S_008\"]}]},{\"target_prefix\":\"D_OE\",\"target_name\":\"Outside Environment (외기 환경)\",\"dataLoggerDeviceList\":[{\"serial_number\":9,\"target_code\":\"009\",\"dccId\":\"DCC_001\",\"dpcId\":\"DPC_001\",\"nodeList\":[\"LX_009\",\"S_H_009\",\"CO2_009\",\"WV_S_009\",\"T_S_009\",\"RH_S_009\",\"T_OA_009\",\"RH_OA_009\",\"W_D_009\",\"W_S_009\",\"RF1_009\",\"IR_009\"]}]}],\"nodeStructureList\":[{\"target_id\":\"temp\",\"target_name\":\"온도\",\"is_sensor\":1,\"data_unit\":\"℃\",\"description\":\"섭씨: 1 atm에서의 물의 어는점을 0도, 끓는점을 100도로 정한 온도\",\"defList\":[{\"target_id\":\"soilTemperature\",\"target_prefix\":\"T_S\",\"target_name\":\"토양 온도\",\"nodeList\":[{\"target_code\":\"008\"},{\"target_code\":\"009\"}]},{\"target_id\":\"outsideAirTemperature\",\"target_prefix\":\"T_OA\",\"target_name\":\"외기 온도\",\"nodeList\":[{\"target_code\":\"009\"}]}]},{\"target_id\":\"reh\",\"target_name\":\"습도\",\"is_sensor\":1,\"data_unit\":\"%RH\",\"description\":\"공기 중에 포함되어 있는 수증기의 양 또는 비율을 나타내는 단위\",\"defList\":[{\"target_id\":\"soilReh\",\"target_prefix\":\"RH_S\",\"target_name\":\"토양 습도\",\"nodeList\":[{\"target_code\":\"008\"},{\"target_code\":\"009\"}]},{\"target_id\":\"outsideAirReh\",\"target_prefix\":\"RH_OA\",\"target_name\":\"외기 습도\",\"nodeList\":[{\"target_code\":\"009\"}]}]},{\"target_id\":\"ws\",\"target_name\":\"풍속\",\"is_sensor\":1,\"data_unit\":\"m/s\",\"description\":\"초당 바람이 이동하는 거리(m)\",\"defList\":[{\"target_id\":\"windSpeed\",\"target_prefix\":\"W_S\",\"nodeList\":[{\"target_code\":\"009\"}]}]},{\"target_id\":\"wd\",\"target_name\":\"풍향\",\"is_sensor\":1,\"description\":\"풍향 0~7 (북, 북동, 동, 남동, 남, 남서, 서, 북서)\",\"defList\":[{\"target_id\":\"windDirection\",\"target_prefix\":\"W_D\",\"nodeList\":[{\"target_code\":\"009\"}]}]},{\"target_id\":\"solar\",\"target_name\":\"일사량\",\"is_sensor\":1,\"data_unit\":\"W/m²\",\"description\":\"1평방 미터당 조사되는 일사에너지의 양이 1W\",\"defList\":[{\"target_id\":\"horizontalSolar\",\"target_name\":\"일사량\",\"target_prefix\":\"S_H\",\"nodeList\":[{\"target_code\":\"008\"},{\"target_code\":\"009\"}]},{\"target_id\":\"inclinedSolar\",\"target_name\":\"경사 일사량\",\"target_prefix\":\"S_I\",\"nodeList\":[]}]},{\"target_id\":\"rainfall\",\"target_name\":\"강우량\",\"is_sensor\":1,\"data_unit\":\"mm/hr\",\"description\":\"시간당 일정한 곳에 내린 비의 분량. 단위는 mm\",\"defList\":[{\"target_id\":\"r1\",\"target_prefix\":\"RF1\",\"target_name\":\"시간당 강우량\",\"nodeList\":[{\"target_code\":\"009\"}]}]},{\"target_id\":\"isRain\",\"target_name\":\"강우 감지 여부\",\"is_sensor\":1,\"data_unit\":null,\"description\":\"감지시 1, 미감지시 0\",\"defList\":[{\"target_id\":\"isRain\",\"target_prefix\":\"IR\",\"target_name\":\"강우 감지 여부\",\"nodeList\":[{\"target_code\":\"009\"}]}]},{\"target_id\":\"co2\",\"target_name\":\"이산화탄소\",\"is_sensor\":1,\"data_unit\":\"ppm\",\"description\":\"백만분의 1. 이산화탄소 농도 395ppm = 395/1,000,000 * 100 = 0.0395 %\",\"defList\":[{\"target_id\":\"co2\",\"target_prefix\":\"CO2\",\"nodeList\":[{\"target_code\":\"008\"},{\"target_code\":\"009\"}]}]},{\"target_id\":\"uv\",\"target_name\":\"자외선\",\"is_sensor\":1,\"data_unit\":\"mJ/c㎡\",\"description\":\"1평방 센치당 조사되는 uv 에너지가 1mJ\",\"defList\":[]},{\"target_id\":\"lux\",\"target_name\":\"조도\",\"is_sensor\":1,\"data_unit\":\"lx\",\"description\":\"1㎡의 면적 위에 1m의 광속이 균일하게 비춰질 때\",\"defList\":[{\"target_id\":\"lux\",\"target_prefix\":\"LX\",\"nodeList\":[{\"target_code\":\"008\"},{\"target_code\":\"009\"}]}]},{\"target_id\":\"waterValue\",\"target_name\":\"수분 값\",\"is_sensor\":1,\"data_unit\":\"%\",\"description\":\"\",\"defList\":[{\"target_id\":\"soilWaterValue\",\"target_prefix\":\"WV_S\",\"target_name\":\"토양 수분 값\",\"nodeList\":[{\"target_code\":\"008\"},{\"target_code\":\"009\"}]}]},{\"target_id\":\"vol\",\"target_name\":\"전압\",\"is_sensor\":1,\"data_unit\":\"V\",\"description\":null,\"defList\":[]},{\"target_id\":\"amp\",\"target_name\":\"전류\",\"is_sensor\":1,\"data_unit\":\"A\",\"description\":null,\"defList\":[]},{\"target_id\":\"kiloWatt\",\"target_name\":\"출력\",\"data_unit\":\"kW\",\"description\":\"출력\",\"defList\":[{\"target_id\":\"inverter\",\"target_name\":\"인버터 출력\",\"target_prefix\":\"kW_I\",\"description\":\"33kW급\",\"nodeList\":[{\"target_code\":\"008\"}]}]}]},\"realtionInfo\":{\"placeRelationList\":[{\"target_id\":\"inverter\",\"target_name\":\"인버터\",\"description\":\"인버터가 설치된 부지\",\"defList\":[{\"target_id\":\"inverter\",\"target_name\":\"인버터\",\"target_prefix\":\"IVT\",\"placeList\":[{\"target_code\":\"008\",\"target_name\":\"외부\",\"nodeList\":[\"kW_I_008\"]}]}]},{\"target_id\":\"farmParallelSite\",\"target_name\":\"농업 병행 부지\",\"description\":\"농업 병행 태양광 부지로 작물 생육 환경 센서가 존재\",\"defList\":[{\"target_id\":\"normalPV\",\"target_prefix\":\"PV_N\",\"target_name\":\"태양광\",\"placeList\":[{\"target_code\":\"008\",\"target_name\":\"하부\",\"chart_color\":\"#0b7285\",\"chart_sort_rank\":8,\"nodeList\":[\"LX_008\",\"S_H_008\",\"CO2_008\",\"WV_S_008\",\"T_S_008\",\"RH_S_008\"]}]}]},{\"target_id\":\"outside\",\"target_name\":\"외부 환경\",\"description\":\"농업 병행 태양광 부지와의 대조군으로 작물 생육에 들어간 센서와 기상환경 계측 센서 존재\",\"defList\":[{\"target_id\":\"outside\",\"target_prefix\":\"OS\",\"placeList\":[{\"target_code\":\"009\",\"chart_color\":\"#087f5b\",\"chart_sort_rank\":9,\"nodeList\":[\"LX_009\",\"S_H_009\",\"CO2_009\",\"WV_S_009\",\"T_S_009\",\"RH_S_009\",\"T_OA_009\",\"RH_OA_009\",\"W_D_009\",\"W_S_009\",\"RF1_009\",\"IR_009\"]}]}]}]},\"controlInfo\":{}}',NULL,0,'2018-10-18 16:56:40','2018-10-18 07:56:42'),(3,NULL,'003','보성','{\"drawInfo\":{\"frame\":{\"mapSize\":{\"width\":880,\"height\":1230},\"svgModelResourceList\":[{\"id\":\"salternBlock_001\",\"type\":\"rect\",\"elementDrawInfo\":{\"width\":100,\"height\":150,\"color\":\"#33ffff\"}},{\"id\":\"salternBlock_002\",\"type\":\"rect\",\"elementDrawInfo\":{\"width\":100,\"height\":150,\"color\":\"#33ffff\"}},{\"id\":\"salternLine_001\",\"type\":\"line\",\"elementDrawInfo\":{\"strokeWidth\":100,\"color\":\"#33ccff\"}},{\"id\":\"pump_001\",\"type\":\"circle\",\"elementDrawInfo\":{\"radius\":20,\"color\":\"#9fe667\"}},{\"id\":\"valve_001\",\"type\":\"rhombus\",\"elementDrawInfo\":{\"width\":20,\"height\":20,\"rotate\":45,\"color\":\"#efb4ce\"}}]},\"positionList\":[{}]},\"setInfo\":{\"mainInfo\":{\"main_seq\":3,\"uuid\":\"003\"},\"dccConstructorList\":[{\"dccId\":\"DCC_001\",\"connect_info\":{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}},{\"dccId\":\"DCC_002\",\"connect_info\":{\"type\":\"modbus\",\"subType\":\"rtu\",\"baudRate\":9600,\"port\":\"COM3\",\"hasPassive\":true}}],\"dpcConstructorList\":[{\"dpcId\":\"DPC_001\",\"protocol_info\":{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\"}}],\"dataLoggerStructureList\":[{\"target_prefix\":\"D_CE\",\"target_name\":\"Crops Environment (작물 생육 환경)\",\"dataLoggerDeviceList\":[{\"serial_number\":10,\"target_code\":\"010\",\"dccId\":\"DCC_001\",\"dpcId\":\"DPC_001\",\"nodeList\":[\"LX_010\",\"S_H_010\",\"CO2_010\",\"WV_S_010\",\"T_S_010\",\"RH_S_010\"]}]},{\"target_prefix\":\"D_OE\",\"target_name\":\"Outside Environment (외기 환경)\",\"dataLoggerDeviceList\":[{\"serial_number\":11,\"target_code\":\"011\",\"dccId\":\"DCC_001\",\"dpcId\":\"DPC_001\",\"nodeList\":[\"LX_011\",\"S_H_011\",\"CO2_011\",\"WV_S_011\",\"T_S_011\",\"RH_S_011\",\"T_OA_011\",\"RH_OA_011\",\"W_D_011\",\"W_S_011\",\"RF1_011\",\"IR_011\"]}]}],\"nodeStructureList\":[{\"target_id\":\"temp\",\"target_name\":\"온도\",\"is_sensor\":1,\"data_unit\":\"℃\",\"description\":\"섭씨: 1 atm에서의 물의 어는점을 0도, 끓는점을 100도로 정한 온도\",\"defList\":[{\"target_id\":\"soilTemperature\",\"target_prefix\":\"T_S\",\"target_name\":\"토양 온도\",\"nodeList\":[{\"target_code\":\"010\"},{\"target_code\":\"011\"}]},{\"target_id\":\"outsideAirTemperature\",\"target_prefix\":\"T_OA\",\"target_name\":\"외기 온도\",\"nodeList\":[{\"target_code\":\"011\"}]}]},{\"target_id\":\"reh\",\"target_name\":\"습도\",\"is_sensor\":1,\"data_unit\":\"%RH\",\"description\":\"공기 중에 포함되어 있는 수증기의 양 또는 비율을 나타내는 단위\",\"defList\":[{\"target_id\":\"soilReh\",\"target_prefix\":\"RH_S\",\"target_name\":\"토양 습도\",\"nodeList\":[{\"target_code\":\"010\"},{\"target_code\":\"011\"}]},{\"target_id\":\"outsideAirReh\",\"target_prefix\":\"RH_OA\",\"target_name\":\"외기 습도\",\"nodeList\":[{\"target_code\":\"011\"}]}]},{\"target_id\":\"ws\",\"target_name\":\"풍속\",\"is_sensor\":1,\"data_unit\":\"m/s\",\"description\":\"초당 바람이 이동하는 거리(m)\",\"defList\":[{\"target_id\":\"windSpeed\",\"target_prefix\":\"W_S\",\"nodeList\":[{\"target_code\":\"011\"}]}]},{\"target_id\":\"wd\",\"target_name\":\"풍향\",\"is_sensor\":1,\"description\":\"풍향 0~7 (북, 북동, 동, 남동, 남, 남서, 서, 북서)\",\"defList\":[{\"target_id\":\"windDirection\",\"target_prefix\":\"W_D\",\"nodeList\":[{\"target_code\":\"011\"}]}]},{\"target_id\":\"solar\",\"target_name\":\"일사량\",\"is_sensor\":1,\"data_unit\":\"W/m²\",\"description\":\"1평방 미터당 조사되는 일사에너지의 양이 1W\",\"defList\":[{\"target_id\":\"horizontalSolar\",\"target_name\":\"수평 일사량\",\"target_prefix\":\"S_H\",\"nodeList\":[{\"target_code\":\"010\"},{\"target_code\":\"011\"}]},{\"target_id\":\"inclinedSolar\",\"target_name\":\"경사 일사량\",\"target_prefix\":\"S_I\",\"nodeList\":[]}]},{\"target_id\":\"rainfall\",\"target_name\":\"강우량\",\"is_sensor\":1,\"data_unit\":\"mm/hr\",\"description\":\"시간당 일정한 곳에 내린 비의 분량. 단위는 mm\",\"defList\":[{\"target_id\":\"r1\",\"target_prefix\":\"RF1\",\"target_name\":\"시간당 강우량\",\"nodeList\":[{\"target_code\":\"011\"}]}]},{\"target_id\":\"isRain\",\"target_name\":\"강우 감지 여부\",\"is_sensor\":1,\"data_unit\":null,\"description\":\"감지시 1, 미감지시 0\",\"defList\":[{\"target_id\":\"isRain\",\"target_prefix\":\"IR\",\"target_name\":\"강우 감지 여부\",\"nodeList\":[{\"target_code\":\"011\"}]}]},{\"target_id\":\"co2\",\"target_name\":\"이산화탄소\",\"is_sensor\":1,\"data_unit\":\"ppm\",\"description\":\"백만분의 1. 이산화탄소 농도 395ppm = 395/1,000,000 * 100 = 0.0395 %\",\"defList\":[{\"target_id\":\"co2\",\"target_prefix\":\"CO2\",\"nodeList\":[{\"target_code\":\"010\"},{\"target_code\":\"011\"}]}]},{\"target_id\":\"uv\",\"target_name\":\"자외선\",\"is_sensor\":1,\"data_unit\":\"mJ/c㎡\",\"description\":\"1평방 센치당 조사되는 uv 에너지가 1mJ\",\"defList\":[]},{\"target_id\":\"lux\",\"target_name\":\"조도\",\"is_sensor\":1,\"data_unit\":\"lx\",\"description\":\"1㎡의 면적 위에 1m의 광속이 균일하게 비춰질 때\",\"defList\":[{\"target_id\":\"lux\",\"target_prefix\":\"LX\",\"nodeList\":[{\"target_code\":\"010\"},{\"target_code\":\"011\"}]}]},{\"target_id\":\"waterValue\",\"target_name\":\"수분 값\",\"is_sensor\":1,\"data_unit\":\"%\",\"description\":\"\",\"defList\":[{\"target_id\":\"soilWaterValue\",\"target_prefix\":\"WV_S\",\"target_name\":\"토양 수분 값\",\"nodeList\":[{\"target_code\":\"010\"},{\"target_code\":\"011\"}]}]},{\"target_id\":\"vol\",\"target_name\":\"전압\",\"is_sensor\":1,\"data_unit\":\"V\",\"description\":null,\"defList\":[]},{\"target_id\":\"amp\",\"target_name\":\"전류\",\"is_sensor\":1,\"data_unit\":\"A\",\"description\":null,\"defList\":[]},{\"target_id\":\"kiloWatt\",\"target_name\":\"출력\",\"data_unit\":\"kW\",\"description\":\"출력\",\"defList\":[{\"target_id\":\"inverter\",\"target_name\":\"인버터 출력\",\"target_prefix\":\"kW_I\",\"description\":\"33kW급\",\"nodeList\":[{\"target_code\":\"001\"}]}]}]},\"realtionInfo\":{\"placeRelationList\":[{\"target_id\":\"inverter\",\"target_name\":\"인버터\",\"description\":\"인버터가 설치된 부지\",\"defList\":[{\"target_id\":\"inverter\",\"target_name\":\"인버터\",\"target_prefix\":\"IVT\",\"placeList\":[{\"target_code\":\"010\",\"target_name\":\"외부\",\"nodeList\":[\"kW_I_010\"]}]}]},{\"target_id\":\"farmParallelSite\",\"target_name\":\"농업 병행 부지\",\"description\":\"농업 병행 태양광 부지로 작물 생육 환경 센서가 존재\",\"defList\":[{\"target_id\":\"normalPV\",\"target_prefix\":\"PV_N\",\"target_name\":\"태양광\",\"placeList\":[{\"target_code\":\"010\",\"target_name\":\"하부\",\"chart_color\":\"#2b8a3e\",\"chart_sort_rank\":10,\"nodeList\":[\"LX_010\",\"S_H_010\",\"CO2_010\",\"WV_S_010\",\"T_S_010\",\"RH_S_010\"]}]}]},{\"target_id\":\"outside\",\"target_name\":\"외부 환경\",\"description\":\"농업 병행 태양광 부지와의 대조군으로 작물 생육에 들어간 센서와 기상환경 계측 센서 존재\",\"defList\":[{\"target_id\":\"outside\",\"target_prefix\":\"OS\",\"placeList\":[{\"target_code\":\"011\",\"chart_color\":\"#5c940d\",\"chart_sort_rank\":11,\"nodeList\":[\"LX_011\",\"S_H_011\",\"CO2_011\",\"WV_S_011\",\"T_S_011\",\"RH_S_011\",\"T_OA_011\",\"RH_OA_011\",\"W_D_011\",\"W_S_011\",\"RF1_011\",\"IR_011\"]}]}]}]},\"controlInfo\":{}}',NULL,0,'2018-10-18 16:56:47','2018-10-18 08:56:46'),(4,NULL,'004','오창','{\"drawInfo\":{\"frame\":{\"mapSize\":{\"width\":880,\"height\":1230},\"svgModelResourceList\":[{\"id\":\"salternBlock_001\",\"type\":\"rect\",\"elementDrawInfo\":{\"width\":100,\"height\":150,\"color\":\"#33ffff\"}},{\"id\":\"salternBlock_002\",\"type\":\"rect\",\"elementDrawInfo\":{\"width\":100,\"height\":150,\"color\":\"#33ffff\"}},{\"id\":\"salternLine_001\",\"type\":\"line\",\"elementDrawInfo\":{\"strokeWidth\":100,\"color\":\"#33ccff\"}},{\"id\":\"pump_001\",\"type\":\"circle\",\"elementDrawInfo\":{\"radius\":20,\"color\":\"#9fe667\"}},{\"id\":\"valve_001\",\"type\":\"rhombus\",\"elementDrawInfo\":{\"width\":20,\"height\":20,\"rotate\":45,\"color\":\"#efb4ce\"}}]},\"positionList\":[{}]},\"setInfo\":{\"mainInfo\":{\"main_seq\":4,\"uuid\":\"004\"},\"dccConstructorList\":[{\"dccId\":\"DCC_001\",\"connect_info\":{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}},{\"dccId\":\"DCC_002\",\"connect_info\":{\"type\":\"modbus\",\"subType\":\"rtu\",\"baudRate\":9600,\"port\":\"COM3\",\"hasPassive\":true}}],\"dpcConstructorList\":[{\"dpcId\":\"DPC_001\",\"protocol_info\":{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\"}}],\"dataLoggerStructureList\":[{\"target_prefix\":\"D_CE\",\"target_name\":\"Crops Environment (작물 생육 환경)\",\"dataLoggerDeviceList\":[{\"serial_number\":12,\"target_code\":\"012\",\"dccId\":\"DCC_001\",\"dpcId\":\"DPC_001\",\"nodeList\":[\"LX_012\",\"S_H_012\",\"CO2_012\",\"WV_S_012\",\"T_S_012\",\"RH_S_012\"]}]},{\"target_prefix\":\"D_OE\",\"target_name\":\"Outside Environment (외기 환경)\",\"dataLoggerDeviceList\":[{\"serial_number\":13,\"target_code\":\"013\",\"dccId\":\"DCC_001\",\"dpcId\":\"DPC_001\",\"nodeList\":[\"LX_013\",\"S_H_013\",\"CO2_013\",\"WV_S_013\",\"T_S_013\",\"RH_S_013\",\"T_OA_013\",\"RH_OA_013\",\"W_D_013\",\"W_S_013\",\"RF1_013\",\"IR_013\"]}]}],\"nodeStructureList\":[{\"target_id\":\"temp\",\"target_name\":\"온도\",\"is_sensor\":1,\"data_unit\":\"℃\",\"description\":\"섭씨: 1 atm에서의 물의 어는점을 0도, 끓는점을 100도로 정한 온도\",\"defList\":[{\"target_id\":\"soilTemperature\",\"target_prefix\":\"T_S\",\"target_name\":\"토양 온도\",\"nodeList\":[{\"target_code\":\"012\"},{\"target_code\":\"013\"}]},{\"target_id\":\"outsideAirTemperature\",\"target_prefix\":\"T_OA\",\"target_name\":\"외기 온도\",\"nodeList\":[{\"target_code\":\"013\"}]}]},{\"target_id\":\"reh\",\"target_name\":\"습도\",\"is_sensor\":1,\"data_unit\":\"%RH\",\"description\":\"공기 중에 포함되어 있는 수증기의 양 또는 비율을 나타내는 단위\",\"defList\":[{\"target_id\":\"soilReh\",\"target_prefix\":\"RH_S\",\"target_name\":\"토양 습도\",\"nodeList\":[{\"target_code\":\"012\"},{\"target_code\":\"013\"}]},{\"target_id\":\"outsideAirReh\",\"target_prefix\":\"RH_OA\",\"target_name\":\"외기 습도\",\"nodeList\":[{\"target_code\":\"013\"}]}]},{\"target_id\":\"ws\",\"target_name\":\"풍속\",\"is_sensor\":1,\"data_unit\":\"m/s\",\"description\":\"초당 바람이 이동하는 거리(m)\",\"defList\":[{\"target_id\":\"windSpeed\",\"target_prefix\":\"W_S\",\"nodeList\":[{\"target_code\":\"013\"}]}]},{\"target_id\":\"wd\",\"target_name\":\"풍향\",\"is_sensor\":1,\"description\":\"풍향 0~7 (북, 북동, 동, 남동, 남, 남서, 서, 북서)\",\"defList\":[{\"target_id\":\"windDirection\",\"target_prefix\":\"W_D\",\"nodeList\":[{\"target_code\":\"013\"}]}]},{\"target_id\":\"solar\",\"target_name\":\"일사량\",\"is_sensor\":1,\"data_unit\":\"W/m²\",\"description\":\"1평방 미터당 조사되는 일사에너지의 양이 1W\",\"defList\":[{\"target_id\":\"horizontalSolar\",\"target_name\":\"일사량\",\"target_prefix\":\"S_H\",\"nodeList\":[{\"target_code\":\"012\"},{\"target_code\":\"013\"}]},{\"target_id\":\"inclinedSolar\",\"target_name\":\"경사 일사량\",\"target_prefix\":\"S_I\",\"nodeList\":[]}]},{\"target_id\":\"rainfall\",\"target_name\":\"강우량\",\"is_sensor\":1,\"data_unit\":\"mm/hr\",\"description\":\"시간당 일정한 곳에 내린 비의 분량. 단위는 mm\",\"defList\":[{\"target_id\":\"r1\",\"target_prefix\":\"RF1\",\"target_name\":\"시간당 강우량\",\"nodeList\":[{\"target_code\":\"013\"}]}]},{\"target_id\":\"isRain\",\"target_name\":\"강우 감지 여부\",\"is_sensor\":1,\"data_unit\":null,\"description\":\"감지시 1, 미감지시 0\",\"defList\":[{\"target_id\":\"isRain\",\"target_prefix\":\"IR\",\"target_name\":\"강우 감지 여부\",\"nodeList\":[{\"target_code\":\"013\"}]}]},{\"target_id\":\"co2\",\"target_name\":\"이산화탄소\",\"is_sensor\":1,\"data_unit\":\"ppm\",\"description\":\"백만분의 1. 이산화탄소 농도 395ppm = 395/1,000,000 * 100 = 0.0395 %\",\"defList\":[{\"target_id\":\"co2\",\"target_prefix\":\"CO2\",\"nodeList\":[{\"target_code\":\"012\"},{\"target_code\":\"013\"}]}]},{\"target_id\":\"uv\",\"target_name\":\"자외선\",\"is_sensor\":1,\"data_unit\":\"mJ/c㎡\",\"description\":\"1평방 센치당 조사되는 uv 에너지가 1mJ\",\"defList\":[]},{\"target_id\":\"lux\",\"target_name\":\"조도\",\"is_sensor\":1,\"data_unit\":\"lx\",\"description\":\"1㎡의 면적 위에 1m의 광속이 균일하게 비춰질 때\",\"defList\":[{\"target_id\":\"lux\",\"target_prefix\":\"LX\",\"nodeList\":[{\"target_code\":\"012\"},{\"target_code\":\"013\"}]}]},{\"target_id\":\"waterValue\",\"target_name\":\"수분 값\",\"is_sensor\":1,\"data_unit\":\"%\",\"description\":\"\",\"defList\":[{\"target_id\":\"soilWaterValue\",\"target_prefix\":\"WV_S\",\"target_name\":\"토양 수분 값\",\"nodeList\":[{\"target_code\":\"012\"},{\"target_code\":\"013\"}]}]},{\"target_id\":\"vol\",\"target_name\":\"전압\",\"is_sensor\":1,\"data_unit\":\"V\",\"description\":null,\"defList\":[]},{\"target_id\":\"amp\",\"target_name\":\"전류\",\"is_sensor\":1,\"data_unit\":\"A\",\"description\":null,\"defList\":[]},{\"target_id\":\"kiloWatt\",\"target_name\":\"출력\",\"data_unit\":\"kW\",\"description\":\"출력\",\"defList\":[{\"target_id\":\"inverter\",\"target_name\":\"인버터 출력\",\"target_prefix\":\"kW_I\",\"description\":\"33kW급\",\"nodeList\":[{\"target_code\":\"012\"},{\"target_code\":\"013\"},{\"target_code\":\"014\"}]}]}]},\"realtionInfo\":{\"placeRelationList\":[{\"target_id\":\"inverter\",\"target_name\":\"인버터\",\"description\":\"인버터가 설치된 부지\",\"defList\":[{\"target_id\":\"inverter\",\"target_name\":\"인버터\",\"target_prefix\":\"IVT\",\"placeList\":[{\"target_code\":\"012\",\"target_name\":\"1\",\"nodeList\":[\"kW_I_012\"]},{\"target_code\":\"013\",\"target_name\":\"2\",\"nodeList\":[\"kW_I_013\"]},{\"target_code\":\"014\",\"target_name\":\"3\",\"nodeList\":[\"kW_I_014\"]}]}]},{\"target_id\":\"farmParallelSite\",\"target_name\":\"농업 병행 부지\",\"description\":\"농업 병행 태양광 부지로 작물 생육 환경 센서가 존재\",\"defList\":[{\"target_id\":\"normalPV\",\"target_prefix\":\"PV_N\",\"target_name\":\"태양광\",\"placeList\":[{\"target_code\":\"012\",\"target_name\":\"하부\",\"chart_color\":\"#e67700\",\"chart_sort_rank\":12,\"nodeList\":[\"LX_012\",\"S_H_012\",\"CO2_012\",\"WV_S_012\",\"T_S_012\",\"RH_S_012\"]}]}]},{\"target_id\":\"outside\",\"target_name\":\"외부 환경\",\"description\":\"농업 병행 태양광 부지와의 대조군으로 작물 생육에 들어간 센서와 기상환경 계측 센서 존재\",\"defList\":[{\"target_id\":\"outside\",\"target_prefix\":\"OS\",\"placeList\":[{\"target_code\":\"013\",\"chart_color\":\"#d9480f\",\"chart_sort_rank\":13,\"nodeList\":[\"LX_013\",\"S_H_013\",\"CO2_013\",\"WV_S_013\",\"T_S_013\",\"RH_S_013\",\"T_OA_013\",\"RH_OA_013\",\"W_D_013\",\"W_S_013\",\"RF1_013\",\"IR_013\"]}]}]}]},\"controlInfo\":{}}',NULL,0,'2018-10-18 16:56:49','2018-10-18 07:56:49'),(5,NULL,'005','영흥','{\"drawInfo\":{\"frame\":{\"mapSize\":{\"width\":880,\"height\":1230},\"svgModelResourceList\":[{\"id\":\"salternBlock_001\",\"type\":\"rect\",\"elementDrawInfo\":{\"width\":100,\"height\":150,\"color\":\"#33ffff\"}},{\"id\":\"salternBlock_002\",\"type\":\"rect\",\"elementDrawInfo\":{\"width\":100,\"height\":150,\"color\":\"#33ffff\"}},{\"id\":\"salternLine_001\",\"type\":\"line\",\"elementDrawInfo\":{\"strokeWidth\":100,\"color\":\"#33ccff\"}},{\"id\":\"pump_001\",\"type\":\"circle\",\"elementDrawInfo\":{\"radius\":20,\"color\":\"#9fe667\"}},{\"id\":\"valve_001\",\"type\":\"rhombus\",\"elementDrawInfo\":{\"width\":20,\"height\":20,\"rotate\":45,\"color\":\"#efb4ce\"}}]},\"positionList\":[{}]},\"setInfo\":{\"mainInfo\":{\"main_seq\":5,\"uuid\":\"005\"},\"dccConstructorList\":[{\"dccId\":\"DCC_001\",\"connect_info\":{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}},{\"dccId\":\"DCC_002\",\"connect_info\":{\"type\":\"modbus\",\"subType\":\"rtu\",\"baudRate\":9600,\"port\":\"COM3\",\"hasPassive\":true}}],\"dpcConstructorList\":[{\"dpcId\":\"DPC_001\",\"protocol_info\":{\"mainCategory\":\"FarmParallel\",\"subCategory\":\"dmTech\",\"wrapperCategory\":\"default\"}}],\"dataLoggerStructureList\":[{\"target_prefix\":\"D_CE\",\"target_name\":\"Crops Environment (작물 생육 환경)\",\"dataLoggerDeviceList\":[{\"serial_number\":14,\"target_code\":\"014\",\"dccId\":\"DCC_001\",\"dpcId\":\"DPC_001\",\"nodeList\":[\"LX_014\",\"S_H_014\",\"CO2_014\",\"WV_S_014\",\"T_S_014\",\"RH_S_014\"]},{\"serial_number\":15,\"target_code\":\"015\",\"dccId\":\"DCC_001\",\"dpcId\":\"DPC_001\",\"nodeList\":[\"LX_015\",\"S_H_015\",\"CO2_015\",\"WV_S_015\",\"T_S_015\",\"RH_S_015\"]}]},{\"target_prefix\":\"D_OE\",\"target_name\":\"Outside Environment (외기 환경)\",\"dataLoggerDeviceList\":[{\"serial_number\":16,\"target_code\":\"016\",\"dccId\":\"DCC_001\",\"dpcId\":\"DPC_001\",\"nodeList\":[\"LX_016\",\"S_H_016\",\"CO2_016\",\"WV_S_016\",\"T_S_016\",\"RH_S_016\",\"T_OA_016\",\"RH_OA_016\",\"W_D_016\",\"W_S_016\",\"RF1_016\",\"IR_016\"]}]}],\"nodeStructureList\":[{\"target_id\":\"temp\",\"target_name\":\"온도\",\"is_sensor\":1,\"data_unit\":\"℃\",\"description\":\"섭씨: 1 atm에서의 물의 어는점을 0도, 끓는점을 100도로 정한 온도\",\"defList\":[{\"target_id\":\"soilTemperature\",\"target_prefix\":\"T_S\",\"target_name\":\"토양 온도\",\"nodeList\":[{\"target_code\":\"014\"},{\"target_code\":\"015\"},{\"target_code\":\"016\"}]},{\"target_id\":\"outsideAirTemperature\",\"target_prefix\":\"T_OA\",\"target_name\":\"외기 온도\",\"nodeList\":[{\"target_code\":\"016\"}]}]},{\"target_id\":\"reh\",\"target_name\":\"습도\",\"is_sensor\":1,\"data_unit\":\"%RH\",\"description\":\"공기 중에 포함되어 있는 수증기의 양 또는 비율을 나타내는 단위\",\"defList\":[{\"target_id\":\"soilReh\",\"target_prefix\":\"RH_S\",\"target_name\":\"토양 습도\",\"nodeList\":[{\"target_code\":\"014\"},{\"target_code\":\"015\"},{\"target_code\":\"016\"}]},{\"target_id\":\"outsideAirReh\",\"target_prefix\":\"RH_OA\",\"target_name\":\"외기 습도\",\"nodeList\":[{\"target_code\":\"016\"}]}]},{\"target_id\":\"ws\",\"target_name\":\"풍속\",\"is_sensor\":1,\"data_unit\":\"m/s\",\"description\":\"초당 바람이 이동하는 거리(m)\",\"defList\":[{\"target_id\":\"windSpeed\",\"target_prefix\":\"W_S\",\"nodeList\":[{\"target_code\":\"016\"}]}]},{\"target_id\":\"wd\",\"target_name\":\"풍향\",\"is_sensor\":1,\"description\":\"풍향 0~7 (북, 북동, 동, 남동, 남, 남서, 서, 북서)\",\"defList\":[{\"target_id\":\"windDirection\",\"target_prefix\":\"W_D\",\"nodeList\":[{\"target_code\":\"016\"}]}]},{\"target_id\":\"solar\",\"target_name\":\"일사량\",\"is_sensor\":1,\"data_unit\":\"W/m²\",\"description\":\"1평방 미터당 조사되는 일사에너지의 양이 1W\",\"defList\":[{\"target_id\":\"horizontalSolar\",\"target_name\":\"일사량\",\"target_prefix\":\"S_H\",\"nodeList\":[{\"target_code\":\"014\"},{\"target_code\":\"015\"},{\"target_code\":\"016\"}]},{\"target_id\":\"inclinedSolar\",\"target_name\":\"경사 일사량\",\"target_prefix\":\"S_I\",\"nodeList\":[]}]},{\"target_id\":\"rainfall\",\"target_name\":\"강우량\",\"is_sensor\":1,\"data_unit\":\"mm/hr\",\"description\":\"시간당 일정한 곳에 내린 비의 분량. 단위는 mm\",\"defList\":[{\"target_id\":\"r1\",\"target_prefix\":\"RF1\",\"target_name\":\"시간당 강우량\",\"nodeList\":[{\"target_code\":\"016\"}]}]},{\"target_id\":\"isRain\",\"target_name\":\"강우 감지 여부\",\"is_sensor\":1,\"data_unit\":null,\"description\":\"감지시 1, 미감지시 0\",\"defList\":[{\"target_id\":\"isRain\",\"target_prefix\":\"IR\",\"target_name\":\"강우 감지 여부\",\"nodeList\":[{\"target_code\":\"016\"}]}]},{\"target_id\":\"co2\",\"target_name\":\"이산화탄소\",\"is_sensor\":1,\"data_unit\":\"ppm\",\"description\":\"백만분의 1. 이산화탄소 농도 395ppm = 395/1,000,000 * 100 = 0.0395 %\",\"defList\":[{\"target_id\":\"co2\",\"target_prefix\":\"CO2\",\"nodeList\":[{\"target_code\":\"014\"},{\"target_code\":\"015\"},{\"target_code\":\"016\"}]}]},{\"target_id\":\"uv\",\"target_name\":\"자외선\",\"is_sensor\":1,\"data_unit\":\"mJ/c㎡\",\"description\":\"1평방 센치당 조사되는 uv 에너지가 1mJ\",\"defList\":[]},{\"target_id\":\"lux\",\"target_name\":\"조도\",\"is_sensor\":1,\"data_unit\":\"lx\",\"description\":\"1㎡의 면적 위에 1m의 광속이 균일하게 비춰질 때\",\"defList\":[{\"target_id\":\"lux\",\"target_prefix\":\"LX\",\"nodeList\":[{\"target_code\":\"014\"},{\"target_code\":\"015\"},{\"target_code\":\"016\"}]}]},{\"target_id\":\"waterValue\",\"target_name\":\"수분 값\",\"is_sensor\":1,\"data_unit\":\"%\",\"description\":\"\",\"defList\":[{\"target_id\":\"soilWaterValue\",\"target_prefix\":\"WV_S\",\"target_name\":\"토양 수분 값\",\"nodeList\":[{\"target_code\":\"014\"},{\"target_code\":\"015\"},{\"target_code\":\"016\"}]}]},{\"target_id\":\"vol\",\"target_name\":\"전압\",\"is_sensor\":1,\"data_unit\":\"V\",\"description\":null,\"defList\":[]},{\"target_id\":\"amp\",\"target_name\":\"전류\",\"is_sensor\":1,\"data_unit\":\"A\",\"description\":null,\"defList\":[]},{\"target_id\":\"kiloWatt\",\"target_name\":\"출력\",\"data_unit\":\"kW\",\"description\":\"출력\",\"defList\":[{\"target_id\":\"inverter\",\"target_name\":\"인버터 출력\",\"target_prefix\":\"kW_I\",\"description\":\"33kW급\",\"nodeList\":[{\"target_code\":\"014\"},{\"target_code\":\"015\"},{\"target_code\":\"016\"}]}]}]},\"realtionInfo\":{\"placeRelationList\":[{\"target_id\":\"inverter\",\"target_name\":\"인버터\",\"description\":\"인버터가 설치된 부지\",\"defList\":[{\"target_id\":\"inverter\",\"target_name\":\"인버터\",\"target_prefix\":\"IVT\",\"placeList\":[{\"target_code\":\"014\",\"target_name\":\"일반 구조물\",\"nodeList\":[\"kW_I_014\"]},{\"target_code\":\"015\",\"target_name\":\"태양광 구조물\",\"nodeList\":[\"kW_I_015\"]},{\"target_code\":\"016\",\"target_name\":\"외부\",\"nodeList\":[\"kW_I_016\"]}]}]},{\"target_id\":\"farmParallelSite\",\"target_name\":\"농업 병행 부지\",\"description\":\"농업 병행 태양광 부지로 작물 생육 환경 센서가 존재\",\"defList\":[{\"target_id\":\"normalStructure\",\"target_prefix\":\"N_S\",\"target_name\":\"일반 구조물\",\"placeList\":[{\"target_code\":\"014\",\"target_name\":\"하부\",\"chart_color\":\"#868e96\",\"chart_sort_rank\":14,\"nodeList\":[\"LX_014\",\"S_H_014\",\"CO2_014\",\"WV_S_014\",\"T_S_014\",\"RH_S_014\"]}]},{\"target_id\":\"photovoltaicStructure\",\"target_prefix\":\"PV_S\",\"target_name\":\"태양광 구조물\",\"placeList\":[{\"target_code\":\"015\",\"target_name\":\"하부\",\"chart_color\":\"#b9560d\",\"chart_sort_rank\":15,\"nodeList\":[\"LX_015\",\"S_H_015\",\"CO2_015\",\"WV_S_015\",\"T_S_015\",\"RH_S_015\"]}]}]},{\"target_id\":\"outside\",\"target_name\":\"외부 환경\",\"description\":\"농업 병행 태양광 부지와의 대조군으로 작물 생육에 들어간 센서와 기상환경 계측 센서 존재\",\"defList\":[{\"target_id\":\"outside\",\"target_prefix\":\"OS\",\"placeList\":[{\"target_code\":\"016\",\"chart_color\":\"#3bc9db\",\"chart_sort_rank\":16,\"nodeList\":[\"LX_016\",\"S_H_016\",\"CO2_016\",\"WV_S_016\",\"T_S_016\",\"RH_S_016\",\"T_OA_016\",\"RH_OA_016\",\"W_D_016\",\"W_S_016\",\"RF1_016\",\"IR_016\"]}]}]}]},\"controlInfo\":{}}',NULL,0,'2018-10-18 16:56:51','2018-10-18 07:56:50');
/*!40000 ALTER TABLE `main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_map`
--

DROP TABLE IF EXISTS `main_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_map` (
  `main_seq` int(11) NOT NULL COMMENT 'MAIN 시퀀스',
  `path` varchar(255) DEFAULT NULL COMMENT '경로',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL',
  `name` varchar(50) DEFAULT NULL COMMENT '파일이름',
  `writedate` datetime DEFAULT NULL COMMENT '등록일',
  PRIMARY KEY (`main_seq`),
  CONSTRAINT `FK_MAIN_TO_MAIN_MAP` FOREIGN KEY (`main_seq`) REFERENCES `main` (`main_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='염전맵이 저장되어 있는 경로';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_map`
--

LOCK TABLES `main_map` WRITE;
/*!40000 ALTER TABLE `main_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `main_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `member_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '회원정보 시퀀스',
  `main_seq` int(11) DEFAULT NULL COMMENT 'MAIN 시퀀스',
  `user_id` varchar(255) NOT NULL COMMENT '아이디',
  `pw_salt` varchar(255) DEFAULT NULL COMMENT '암호화소금',
  `pw_hash` varchar(255) DEFAULT NULL COMMENT '암호화비밀번호',
  `name` varchar(50) DEFAULT NULL COMMENT '이름',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '별칭',
  `grade` enum('admin','manager','owner','guest') DEFAULT NULL COMMENT '회원 등급',
  `address` varchar(100) DEFAULT NULL COMMENT '주소',
  `tel` varchar(13) DEFAULT NULL COMMENT '전화번호',
  `is_deleted` tinyint(4) DEFAULT NULL COMMENT '삭제여부',
  `writedate` datetime DEFAULT NULL COMMENT '생성일',
  `updatedate` timestamp NULL DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`member_seq`),
  UNIQUE KEY `UIX_MEMBER` (`user_id`),
  KEY `FK_MAIN_TO_MEMBER` (`main_seq`),
  CONSTRAINT `FK_MAIN_TO_MEMBER` FOREIGN KEY (`main_seq`) REFERENCES `main` (`main_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='가입한 회원의 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pw_connector`
--

DROP TABLE IF EXISTS `pw_connector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pw_connector` (
  `connector_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '접속반 정보 시퀀스',
  `target_id` varchar(30) NOT NULL COMMENT '접속반 id',
  `target_name` varchar(50) NOT NULL COMMENT '접속반 명',
  `target_category` varchar(50) DEFAULT NULL COMMENT '접속반 종류',
  `connect_info` longtext DEFAULT NULL COMMENT '장치 접속 정보',
  `protocol_info` longtext DEFAULT NULL COMMENT '장치 프로토콜 정보',
  `install_place` varchar(50) DEFAULT NULL COMMENT '설치장소',
  `serial_number` varchar(100) DEFAULT NULL COMMENT '고유 코드',
  `model_name` varchar(50) DEFAULT NULL COMMENT '장치 명',
  `director_name` varchar(50) DEFAULT NULL COMMENT '담당자',
  `director_tel` varchar(13) DEFAULT NULL COMMENT '연락처',
  PRIMARY KEY (`connector_seq`),
  UNIQUE KEY `UIX_PW_CONNECTOR` (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='접속반 상세 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pw_connector`
--

LOCK TABLES `pw_connector` WRITE;
/*!40000 ALTER TABLE `pw_connector` DISABLE KEYS */;
/*!40000 ALTER TABLE `pw_connector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pw_connector_trouble_data`
--

DROP TABLE IF EXISTS `pw_connector_trouble_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pw_connector_trouble_data` (
  `connector_trouble_data_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '접속반 문제 이력 시퀀스',
  `connector_seq` int(11) NOT NULL COMMENT '접속반 정보 시퀀스',
  `is_error` tinyint(4) NOT NULL COMMENT '고장 여부',
  `msg` varchar(100) NOT NULL COMMENT '고장 내용',
  `code` varchar(100) NOT NULL COMMENT '고장 코드',
  `occur_date` datetime NOT NULL COMMENT '발생 일자',
  `fix_date` datetime DEFAULT NULL COMMENT '해결 일자',
  PRIMARY KEY (`connector_trouble_data_seq`,`connector_seq`),
  KEY `FK_PW_CONNECTOR_TO_PW_CONNECTOR_TROUBLE_DATA` (`connector_seq`),
  CONSTRAINT `FK_PW_CONNECTOR_TO_PW_CONNECTOR_TROUBLE_DATA` FOREIGN KEY (`connector_seq`) REFERENCES `pw_connector` (`connector_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='장치에서 에러가 검출될 경우 발생 및 해결 정보 저장';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pw_connector_trouble_data`
--

LOCK TABLES `pw_connector_trouble_data` WRITE;
/*!40000 ALTER TABLE `pw_connector_trouble_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `pw_connector_trouble_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pw_inverter`
--

DROP TABLE IF EXISTS `pw_inverter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pw_inverter` (
  `inverter_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '인버터 정보 시퀀스',
  `target_id` varchar(30) NOT NULL COMMENT '인버터 id',
  `target_name` varchar(50) NOT NULL COMMENT '인버터 명',
  `target_category` varchar(13) DEFAULT NULL COMMENT '장치 카테고리',
  `connect_info` longtext DEFAULT NULL COMMENT '접속 정보',
  `protocol_info` longtext DEFAULT NULL COMMENT '장치 프로토콜 정보',
  `install_place` varchar(50) DEFAULT NULL COMMENT '설치 장소',
  `serial_number` varchar(100) DEFAULT NULL COMMENT '고유 코드',
  `amount` float DEFAULT NULL COMMENT '단위: Wh (10:1 Scale)',
  `director_name` varchar(50) DEFAULT NULL COMMENT '담당자',
  `director_tel` varchar(13) DEFAULT NULL COMMENT '연락처',
  `chart_color` varchar(13) DEFAULT NULL COMMENT '대시 보드 차트 색상',
  `chart_sort_rank` tinyint(4) DEFAULT NULL COMMENT '대시 보드 차트 정렬 순위',
  PRIMARY KEY (`inverter_seq`),
  UNIQUE KEY `UIX_PW_INVERTER` (`target_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='인버터 장치 상세 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pw_inverter`
--

LOCK TABLES `pw_inverter` WRITE;
/*!40000 ALTER TABLE `pw_inverter` DISABLE KEYS */;
INSERT INTO `pw_inverter` VALUES (1,'IVT_001','고정식','inverter','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"Inverter\",\"subCategory\":\"das_1.3\",\"wrapperCategory\":\"default\",\"deviceId\":\"001\"}',NULL,NULL,33,NULL,NULL,'#212529',1),(2,'IVT_002','가변식','inverter','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"Inverter\",\"subCategory\":\"das_1.3\",\"wrapperCategory\":\"default\",\"deviceId\":\"002\"}',NULL,NULL,33,NULL,NULL,'#a61e4d',2),(3,'IVT_003','수평','inverter','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"Inverter\",\"subCategory\":\"das_1.3\",\"wrapperCategory\":\"default\",\"deviceId\":\"003\"}',NULL,NULL,33,NULL,NULL,'#5f3dc4',3),(4,'IVT_004','외부','inverter','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"Inverter\",\"subCategory\":\"das_1.3\",\"wrapperCategory\":\"default\",\"deviceId\":\"001\"}',NULL,NULL,33,NULL,NULL,'#0b7285',4),(5,'IVT_005','외부','inverter','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"Inverter\",\"subCategory\":\"das_1.3\",\"wrapperCategory\":\"default\",\"deviceId\":\"001\"}',NULL,NULL,33,NULL,NULL,'#2b8a3e',5),(6,'IVT_006','1','inverter','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"Inverter\",\"subCategory\":\"das_1.3\",\"wrapperCategory\":\"default\",\"deviceId\":\"001\"}',NULL,NULL,33,NULL,NULL,'#e67700',6),(7,'IVT_007','2','inverter','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"Inverter\",\"subCategory\":\"das_1.3\",\"wrapperCategory\":\"default\",\"deviceId\":\"002\"}',NULL,NULL,33,NULL,NULL,'#d9480f',7),(8,'IVT_008','3','inverter','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"Inverter\",\"subCategory\":\"das_1.3\",\"wrapperCategory\":\"default\",\"deviceId\":\"003\"}',NULL,NULL,33,NULL,NULL,'#c92a2a',8),(9,'IVT_009','일반 구조물','inverter','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"Inverter\",\"subCategory\":\"das_1.3\",\"wrapperCategory\":\"default\",\"deviceId\":\"001\"}',NULL,NULL,33,NULL,NULL,'#868e96',9),(10,'IVT_010','태양광 구조물','inverter','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"Inverter\",\"subCategory\":\"das_1.3\",\"wrapperCategory\":\"default\",\"deviceId\":\"002\"}',NULL,NULL,33,NULL,NULL,'#b9560d',10),(11,'IVT_011','외부','inverter','{\"type\":\"socket\",\"subType\":\"\",\"host\":\"localhost\",\"port\":9000,\"hasPassive\":true}','{\"mainCategory\":\"Inverter\",\"subCategory\":\"das_1.3\",\"wrapperCategory\":\"default\",\"deviceId\":\"003\"}',NULL,NULL,33,NULL,NULL,'#3bc9db',11);
/*!40000 ALTER TABLE `pw_inverter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pw_inverter_data`
--

DROP TABLE IF EXISTS `pw_inverter_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pw_inverter_data` (
  `inverter_data_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '인버터 데이터 시퀀스',
  `inverter_seq` int(11) DEFAULT NULL COMMENT '인버터 정보 시퀀스',
  `pv_v` float DEFAULT NULL,
  `pv_a` float DEFAULT NULL,
  `pv_kw` float DEFAULT NULL,
  `grid_rs_v` float DEFAULT NULL,
  `grid_st_v` float DEFAULT NULL,
  `grid_tr_v` float DEFAULT NULL,
  `grid_r_a` float DEFAULT NULL,
  `grid_s_a` float DEFAULT NULL,
  `grid_t_a` float unsigned DEFAULT NULL,
  `line_f` float DEFAULT NULL COMMENT '라인 주파수',
  `power_f` float DEFAULT NULL COMMENT 'Power Factor',
  `power_kw` float DEFAULT NULL COMMENT '현재 발전 출력',
  `power_total_kwh` float NOT NULL COMMENT '누적 발전량, 단위:kWh',
  `writedate` datetime NOT NULL COMMENT '등록일',
  PRIMARY KEY (`inverter_data_seq`),
  KEY `FK_PW_INVERTER_TO_PW_INVERTER_DATA` (`inverter_seq`),
  CONSTRAINT `FK_PW_INVERTER_TO_PW_INVERTER_DATA` FOREIGN KEY (`inverter_seq`) REFERENCES `pw_inverter` (`inverter_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='인버터에서 측정된 데이터';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pw_inverter_data`
--

LOCK TABLES `pw_inverter_data` WRITE;
/*!40000 ALTER TABLE `pw_inverter_data` DISABLE KEYS */;
INSERT INTO `pw_inverter_data` VALUES (9,1,5.5,178,0.983,154,161,166,1.4,1.4,1.4,59.9,NULL,0.756,125,'2018-10-18 17:34:10'),(10,2,7.5,174,1.313,179,187,169,2.7,2.5,2.3,60.3,NULL,0.2,118,'2018-10-18 17:34:10'),(11,4,1.9,181,0.336,149,155,153,1.2,1.2,1,59.8,NULL,0.17,126,'2018-10-18 17:34:10');
/*!40000 ALTER TABLE `pw_inverter_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pw_inverter_trouble_data`
--

DROP TABLE IF EXISTS `pw_inverter_trouble_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pw_inverter_trouble_data` (
  `inverter_trouble_data_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '인버터 문제 이력 시퀀스',
  `inverter_seq` int(11) NOT NULL COMMENT '인버터 정보 시퀀스',
  `is_error` tinyint(4) NOT NULL COMMENT 'isSystemError',
  `msg` varchar(100) NOT NULL COMMENT '고장 내용',
  `code` varchar(100) NOT NULL COMMENT '고장 코드',
  `occur_date` datetime NOT NULL COMMENT '발생 일자',
  `fix_date` datetime DEFAULT NULL COMMENT '해결 일자',
  PRIMARY KEY (`inverter_trouble_data_seq`,`inverter_seq`),
  KEY `FK_PW_INVERTER_TO_PW_INVERTER_TROUBLE_DATA` (`inverter_seq`),
  CONSTRAINT `FK_PW_INVERTER_TO_PW_INVERTER_TROUBLE_DATA` FOREIGN KEY (`inverter_seq`) REFERENCES `pw_inverter` (`inverter_seq`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8 COMMENT='장치에서 에러가 검출될 경우 발생 및 해결 정보 저장';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pw_inverter_trouble_data`
--

LOCK TABLES `pw_inverter_trouble_data` WRITE;
/*!40000 ALTER TABLE `pw_inverter_trouble_data` DISABLE KEYS */;
INSERT INTO `pw_inverter_trouble_data` VALUES (161,1,0,'시스템 과열(단상 95도, 삼상 85도)','OVER HEAT','2018-10-18 16:52:40','2018-10-18 16:52:50'),(162,2,0,'시스템 과열(단상 95도, 삼상 85도)','OVER HEAT','2018-10-18 16:52:41','2018-10-18 16:52:50'),(163,4,0,'시스템 과열(단상 95도, 삼상 85도)','OVER HEAT','2018-10-18 16:52:40','2018-10-18 16:52:50'),(164,5,0,'시스템 과열(단상 95도, 삼상 85도)','OVER HEAT','2018-10-18 16:52:40','2018-10-18 16:52:50'),(165,1,0,'시스템 과열(단상 95도, 삼상 85도)','OVER HEAT','2018-10-18 17:33:51','2018-10-18 17:34:00'),(166,2,0,'시스템 과열(단상 95도, 삼상 85도)','OVER HEAT','2018-10-18 17:33:52','2018-10-18 17:34:00'),(167,4,0,'시스템 과열(단상 95도, 삼상 85도)','OVER HEAT','2018-10-18 17:33:51','2018-10-18 17:34:00'),(168,5,0,'시스템 과열(단상 95도, 삼상 85도)','OVER HEAT','2018-10-18 17:33:52','2018-10-18 17:34:00'),(169,1,0,'시스템 과열(단상 95도, 삼상 85도)','OVER HEAT','2018-10-18 17:34:00',NULL),(170,2,0,'시스템 과열(단상 95도, 삼상 85도)','OVER HEAT','2018-10-18 17:34:01',NULL),(171,4,0,'시스템 과열(단상 95도, 삼상 85도)','OVER HEAT','2018-10-18 17:34:00',NULL),(172,5,1,'장치 연결 해제','Disconnect','2018-10-18 17:34:11',NULL);
/*!40000 ALTER TABLE `pw_inverter_trouble_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pw_module_data`
--

DROP TABLE IF EXISTS `pw_module_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pw_module_data` (
  `module_data_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '접속반 데이터 시퀀스',
  `photovoltaic_seq` int(11) NOT NULL COMMENT '모듈 세부 정보 시퀀스',
  `amp` float NOT NULL COMMENT 'A',
  `vol` float NOT NULL COMMENT 'V',
  `writedate` datetime NOT NULL COMMENT '등록일',
  PRIMARY KEY (`module_data_seq`,`photovoltaic_seq`),
  KEY `FK_PW_PHOTOVOLTAIC_TO_PW_MODULE_DATA` (`photovoltaic_seq`),
  CONSTRAINT `FK_PW_PHOTOVOLTAIC_TO_PW_MODULE_DATA` FOREIGN KEY (`photovoltaic_seq`) REFERENCES `pw_photovoltaic` (`photovoltaic_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='접속반에서 측정된 데이터';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pw_module_data`
--

LOCK TABLES `pw_module_data` WRITE;
/*!40000 ALTER TABLE `pw_module_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `pw_module_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pw_photovoltaic`
--

DROP TABLE IF EXISTS `pw_photovoltaic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pw_photovoltaic` (
  `photovoltaic_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '모듈 세부 정보 시퀀스',
  `target_id` varchar(6) NOT NULL COMMENT '모듈 id',
  `target_name` varchar(50) NOT NULL COMMENT '모듈 명',
  `install_place` varchar(50) NOT NULL COMMENT '설치장소',
  `module_type` enum('단결정','다결정') NOT NULL COMMENT '모듈 타입',
  `compose_count` tinyint(4) NOT NULL COMMENT '직렬구성 개수',
  `amount` float NOT NULL COMMENT '단위: kW (10:1 Scale)',
  `manufacturer` varchar(50) NOT NULL COMMENT '제조사',
  `chart_color` varchar(13) DEFAULT NULL COMMENT '대시 보드 차트 색상',
  `chart_sort_rank` tinyint(4) DEFAULT NULL COMMENT '대시 보드 차트 정렬 순위',
  PRIMARY KEY (`photovoltaic_seq`),
  UNIQUE KEY `UIX_PW_PHOTOVOLTAIC` (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='수중 태양광 모듈 상세 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pw_photovoltaic`
--

LOCK TABLES `pw_photovoltaic` WRITE;
/*!40000 ALTER TABLE `pw_photovoltaic` DISABLE KEYS */;
/*!40000 ALTER TABLE `pw_photovoltaic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pw_photovoltaic_trouble_data`
--

DROP TABLE IF EXISTS `pw_photovoltaic_trouble_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pw_photovoltaic_trouble_data` (
  `photovoltaic_trouble_data_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '모듈 문제 이력 시퀀스',
  `photovoltaic_seq` int(11) NOT NULL COMMENT '모듈 세부 정보 시퀀스',
  `is_error` tinyint(4) NOT NULL COMMENT '고장 여부',
  `code` varchar(100) NOT NULL COMMENT '고장 code',
  `msg` varchar(100) NOT NULL COMMENT '고장 내용',
  `occur_date` datetime NOT NULL COMMENT '발생 일자',
  `fix_date` datetime DEFAULT NULL COMMENT '해결 일자',
  PRIMARY KEY (`photovoltaic_trouble_data_seq`,`photovoltaic_seq`),
  KEY `FK_PW_PHOTOVOLTAIC_TO_PW_PHOTOVOLTAIC_TROUBLE_DATA` (`photovoltaic_seq`),
  CONSTRAINT `FK_PW_PHOTOVOLTAIC_TO_PW_PHOTOVOLTAIC_TROUBLE_DATA` FOREIGN KEY (`photovoltaic_seq`) REFERENCES `pw_photovoltaic` (`photovoltaic_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='장치에서 에러가 검출될 경우 발생 및 해결 정보 저장';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pw_photovoltaic_trouble_data`
--

LOCK TABLES `pw_photovoltaic_trouble_data` WRITE;
/*!40000 ALTER TABLE `pw_photovoltaic_trouble_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `pw_photovoltaic_trouble_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pw_relation_power`
--

DROP TABLE IF EXISTS `pw_relation_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pw_relation_power` (
  `main_seq` int(11) NOT NULL COMMENT 'MAIN 시퀀스',
  `inverter_seq` int(11) NOT NULL COMMENT '인버터 정보 시퀀스',
  `connector_seq` int(11) DEFAULT NULL COMMENT '접속반 정보 시퀀스',
  `photovoltaic_seq` int(11) DEFAULT NULL COMMENT '모듈 세부 정보 시퀀스',
  `place_seq` int(11) DEFAULT NULL COMMENT '장소 정보 시퀀스',
  `connector_ch` tinyint(4) DEFAULT NULL COMMENT '접속반 연결 채널',
  PRIMARY KEY (`main_seq`,`inverter_seq`),
  KEY `FK_PW_PHOTOVOLTAIC_TO_PW_RELATION_POWER` (`photovoltaic_seq`),
  KEY `FK_DV_PLACE_TO_PW_RELATION_POWER` (`place_seq`),
  KEY `FK_PW_INVERTER_TO_PW_RELATION_POWER` (`inverter_seq`),
  KEY `FK_PW_CONNECTOR_TO_PW_RELATION_POWER` (`connector_seq`),
  CONSTRAINT `FK_DV_PLACE_TO_PW_RELATION_POWER` FOREIGN KEY (`place_seq`) REFERENCES `dv_place` (`place_seq`),
  CONSTRAINT `FK_MAIN_TO_PW_RELATION_POWER` FOREIGN KEY (`main_seq`) REFERENCES `main` (`main_seq`),
  CONSTRAINT `FK_PW_CONNECTOR_TO_PW_RELATION_POWER` FOREIGN KEY (`connector_seq`) REFERENCES `pw_connector` (`connector_seq`),
  CONSTRAINT `FK_PW_INVERTER_TO_PW_RELATION_POWER` FOREIGN KEY (`inverter_seq`) REFERENCES `pw_inverter` (`inverter_seq`),
  CONSTRAINT `FK_PW_PHOTOVOLTAIC_TO_PW_RELATION_POWER` FOREIGN KEY (`photovoltaic_seq`) REFERENCES `pw_photovoltaic` (`photovoltaic_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='태양광 계측 시스템 관계 정보';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pw_relation_power`
--

LOCK TABLES `pw_relation_power` WRITE;
/*!40000 ALTER TABLE `pw_relation_power` DISABLE KEYS */;
INSERT INTO `pw_relation_power` VALUES (1,1,NULL,NULL,69,NULL),(1,2,NULL,NULL,70,NULL),(1,3,NULL,NULL,71,NULL),(2,4,NULL,NULL,79,NULL),(3,5,NULL,NULL,82,NULL),(4,6,NULL,NULL,85,NULL),(4,7,NULL,NULL,86,NULL),(4,8,NULL,NULL,87,NULL),(5,9,NULL,NULL,90,NULL),(5,10,NULL,NULL,91,NULL),(5,11,NULL,NULL,92,NULL);
/*!40000 ALTER TABLE `pw_relation_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_dv_data_logger`
--

DROP TABLE IF EXISTS `v_dv_data_logger`;
/*!50001 DROP VIEW IF EXISTS `v_dv_data_logger`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_dv_data_logger` (
  `data_logger_seq` tinyint NOT NULL,
  `data_logger_def_seq` tinyint NOT NULL,
  `main_seq` tinyint NOT NULL,
  `dl_real_id` tinyint NOT NULL,
  `dl_id` tinyint NOT NULL,
  `dl_name` tinyint NOT NULL,
  `m_name` tinyint NOT NULL,
  `dl_target_code` tinyint NOT NULL,
  `dld_target_name` tinyint NOT NULL,
  `dld_target_prefix` tinyint NOT NULL,
  `serial_number` tinyint NOT NULL,
  `connect_info` tinyint NOT NULL,
  `protocol_info` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_dv_device_data`
--

DROP TABLE IF EXISTS `v_dv_device_data`;
/*!50001 DROP VIEW IF EXISTS `v_dv_device_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_dv_device_data` (
  `device_data_seq` tinyint NOT NULL,
  `node_seq` tinyint NOT NULL,
  `str_data` tinyint NOT NULL,
  `data_unit` tinyint NOT NULL,
  `writedate` tinyint NOT NULL,
  `node_id` tinyint NOT NULL,
  `node_real_id` tinyint NOT NULL,
  `node_name` tinyint NOT NULL,
  `dl_real_id` tinyint NOT NULL,
  `dl_id` tinyint NOT NULL,
  `dl_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_dv_node`
--

DROP TABLE IF EXISTS `v_dv_node`;
/*!50001 DROP VIEW IF EXISTS `v_dv_node`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_dv_node` (
  `node_seq` tinyint NOT NULL,
  `node_def_seq` tinyint NOT NULL,
  `node_class_seq` tinyint NOT NULL,
  `data_logger_seq` tinyint NOT NULL,
  `main_seq` tinyint NOT NULL,
  `node_id` tinyint NOT NULL,
  `node_real_id` tinyint NOT NULL,
  `node_name` tinyint NOT NULL,
  `dl_real_id` tinyint NOT NULL,
  `dl_id` tinyint NOT NULL,
  `dl_name` tinyint NOT NULL,
  `data_unit` tinyint NOT NULL,
  `is_sensor` tinyint NOT NULL,
  `data_logger_index` tinyint NOT NULL,
  `n_target_code` tinyint NOT NULL,
  `nd_target_id` tinyint NOT NULL,
  `nd_target_name` tinyint NOT NULL,
  `nd_target_prefix` tinyint NOT NULL,
  `nd_description` tinyint NOT NULL,
  `nc_target_id` tinyint NOT NULL,
  `nc_target_name` tinyint NOT NULL,
  `nc_description` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_dv_node_profile`
--

DROP TABLE IF EXISTS `v_dv_node_profile`;
/*!50001 DROP VIEW IF EXISTS `v_dv_node_profile`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_dv_node_profile` (
  `node_seq` tinyint NOT NULL,
  `node_real_id` tinyint NOT NULL,
  `node_id` tinyint NOT NULL,
  `node_name` tinyint NOT NULL,
  `target_code` tinyint NOT NULL,
  `data_logger_index` tinyint NOT NULL,
  `dl_real_id` tinyint NOT NULL,
  `dl_id` tinyint NOT NULL,
  `nd_target_prefix` tinyint NOT NULL,
  `nd_target_id` tinyint NOT NULL,
  `nd_target_name` tinyint NOT NULL,
  `nc_target_id` tinyint NOT NULL,
  `nc_is_sensor` tinyint NOT NULL,
  `nc_target_name` tinyint NOT NULL,
  `nc_data_unit` tinyint NOT NULL,
  `nc_description` tinyint NOT NULL,
  `m_name` tinyint NOT NULL,
  `node_def_seq` tinyint NOT NULL,
  `node_class_seq` tinyint NOT NULL,
  `main_seq` tinyint NOT NULL,
  `data_logger_seq` tinyint NOT NULL,
  `data_logger_def_seq` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_dv_place`
--

DROP TABLE IF EXISTS `v_dv_place`;
/*!50001 DROP VIEW IF EXISTS `v_dv_place`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_dv_place` (
  `place_seq` tinyint NOT NULL,
  `place_def_seq` tinyint NOT NULL,
  `place_class_seq` tinyint NOT NULL,
  `main_seq` tinyint NOT NULL,
  `uuid` tinyint NOT NULL,
  `m_name` tinyint NOT NULL,
  `place_id` tinyint NOT NULL,
  `place_real_id` tinyint NOT NULL,
  `place_name` tinyint NOT NULL,
  `p_target_code` tinyint NOT NULL,
  `p_target_name` tinyint NOT NULL,
  `depth` tinyint NOT NULL,
  `place_info` tinyint NOT NULL,
  `chart_color` tinyint NOT NULL,
  `chart_sort_rank` tinyint NOT NULL,
  `pd_target_prefix` tinyint NOT NULL,
  `pd_target_id` tinyint NOT NULL,
  `pd_target_name` tinyint NOT NULL,
  `pc_target_id` tinyint NOT NULL,
  `pc_target_name` tinyint NOT NULL,
  `pc_description` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_dv_place_relation`
--

DROP TABLE IF EXISTS `v_dv_place_relation`;
/*!50001 DROP VIEW IF EXISTS `v_dv_place_relation`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_dv_place_relation` (
  `place_relation_seq` tinyint NOT NULL,
  `node_seq` tinyint NOT NULL,
  `place_seq` tinyint NOT NULL,
  `node_id` tinyint NOT NULL,
  `node_real_id` tinyint NOT NULL,
  `node_name` tinyint NOT NULL,
  `dl_id` tinyint NOT NULL,
  `dl_name` tinyint NOT NULL,
  `place_id` tinyint NOT NULL,
  `place_real_id` tinyint NOT NULL,
  `place_name` tinyint NOT NULL,
  `p_target_code` tinyint NOT NULL,
  `p_target_name` tinyint NOT NULL,
  `chart_color` tinyint NOT NULL,
  `chart_sort_rank` tinyint NOT NULL,
  `pd_target_name` tinyint NOT NULL,
  `nc_target_name` tinyint NOT NULL,
  `nd_target_name` tinyint NOT NULL,
  `is_sensor` tinyint NOT NULL,
  `nd_target_id` tinyint NOT NULL,
  `nc_target_id` tinyint NOT NULL,
  `serial_number` tinyint NOT NULL,
  `main_seq` tinyint NOT NULL,
  `data_logger_seq` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_dv_sensor_data`
--

DROP TABLE IF EXISTS `v_dv_sensor_data`;
/*!50001 DROP VIEW IF EXISTS `v_dv_sensor_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_dv_sensor_data` (
  `sensor_data_seq` tinyint NOT NULL,
  `node_seq` tinyint NOT NULL,
  `num_data` tinyint NOT NULL,
  `data_unit` tinyint NOT NULL,
  `writedate` tinyint NOT NULL,
  `node_id` tinyint NOT NULL,
  `node_real_id` tinyint NOT NULL,
  `node_name` tinyint NOT NULL,
  `dl_real_id` tinyint NOT NULL,
  `dl_id` tinyint NOT NULL,
  `dl_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_dv_sensor_profile`
--

DROP TABLE IF EXISTS `v_dv_sensor_profile`;
/*!50001 DROP VIEW IF EXISTS `v_dv_sensor_profile`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_dv_sensor_profile` (
  `node_seq` tinyint NOT NULL,
  `node_def_seq` tinyint NOT NULL,
  `node_class_seq` tinyint NOT NULL,
  `data_logger_seq` tinyint NOT NULL,
  `main_seq` tinyint NOT NULL,
  `node_id` tinyint NOT NULL,
  `node_real_id` tinyint NOT NULL,
  `node_name` tinyint NOT NULL,
  `node_data` tinyint NOT NULL,
  `writedate` tinyint NOT NULL,
  `data_unit` tinyint NOT NULL,
  `is_sensor` tinyint NOT NULL,
  `data_logger_index` tinyint NOT NULL,
  `n_target_code` tinyint NOT NULL,
  `nc_target_id` tinyint NOT NULL,
  `nc_target_name` tinyint NOT NULL,
  `nc_description` tinyint NOT NULL,
  `nd_target_id` tinyint NOT NULL,
  `nd_target_name` tinyint NOT NULL,
  `nd_target_prefix` tinyint NOT NULL,
  `nd_description` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_member`
--

DROP TABLE IF EXISTS `v_member`;
/*!50001 DROP VIEW IF EXISTS `v_member`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_member` (
  `member_seq` tinyint NOT NULL,
  `main_seq` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `pw_salt` tinyint NOT NULL,
  `pw_hash` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `nick_name` tinyint NOT NULL,
  `grade` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `tel` tinyint NOT NULL,
  `is_deleted` tinyint NOT NULL,
  `writedate` tinyint NOT NULL,
  `updatedate` tinyint NOT NULL,
  `weather_location_seq` tinyint NOT NULL,
  `main_uuid` tinyint NOT NULL,
  `main_name` tinyint NOT NULL,
  `main_address` tinyint NOT NULL,
  `main_is_deleted` tinyint NOT NULL,
  `province` tinyint NOT NULL,
  `city` tinyint NOT NULL,
  `town` tinyint NOT NULL,
  `latitude` tinyint NOT NULL,
  `longitude` tinyint NOT NULL,
  `x` tinyint NOT NULL,
  `y` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_pw_inverter_profile`
--

DROP TABLE IF EXISTS `v_pw_inverter_profile`;
/*!50001 DROP VIEW IF EXISTS `v_pw_inverter_profile`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_pw_inverter_profile` (
  `inverter_seq` tinyint NOT NULL,
  `target_id` tinyint NOT NULL,
  `target_name` tinyint NOT NULL,
  `target_category` tinyint NOT NULL,
  `connect_info` tinyint NOT NULL,
  `protocol_info` tinyint NOT NULL,
  `install_place` tinyint NOT NULL,
  `serial_number` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `director_name` tinyint NOT NULL,
  `director_tel` tinyint NOT NULL,
  `chart_color` tinyint NOT NULL,
  `chart_sort_rank` tinyint NOT NULL,
  `photovoltaic_seq` tinyint NOT NULL,
  `connector_seq` tinyint NOT NULL,
  `place_seq` tinyint NOT NULL,
  `connector_ch` tinyint NOT NULL,
  `main_seq` tinyint NOT NULL,
  `weather_location_seq` tinyint NOT NULL,
  `uuid` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `map` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `is_deleted` tinyint NOT NULL,
  `writedate` tinyint NOT NULL,
  `updatedate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_pw_inverter_status`
--

DROP TABLE IF EXISTS `v_pw_inverter_status`;
/*!50001 DROP VIEW IF EXISTS `v_pw_inverter_status`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_pw_inverter_status` (
  `place_seq` tinyint NOT NULL,
  `inverter_data_seq` tinyint NOT NULL,
  `inverter_seq` tinyint NOT NULL,
  `pv_v` tinyint NOT NULL,
  `pv_a` tinyint NOT NULL,
  `pv_kw` tinyint NOT NULL,
  `grid_rs_v` tinyint NOT NULL,
  `grid_st_v` tinyint NOT NULL,
  `grid_tr_v` tinyint NOT NULL,
  `grid_r_a` tinyint NOT NULL,
  `grid_s_a` tinyint NOT NULL,
  `grid_t_a` tinyint NOT NULL,
  `line_f` tinyint NOT NULL,
  `power_f` tinyint NOT NULL,
  `power_kw` tinyint NOT NULL,
  `power_total_kwh` tinyint NOT NULL,
  `writedate` tinyint NOT NULL,
  `daily_power_kwh` tinyint NOT NULL,
  `pv_amount` tinyint NOT NULL,
  `compose_count` tinyint NOT NULL,
  `install_place` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_pw_module_data`
--

DROP TABLE IF EXISTS `v_pw_module_data`;
/*!50001 DROP VIEW IF EXISTS `v_pw_module_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_pw_module_data` (
  `photovoltaic_seq` tinyint NOT NULL,
  `writedate` tinyint NOT NULL,
  `avg_amp` tinyint NOT NULL,
  `avg_vol` tinyint NOT NULL,
  `hour_time` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_pw_module_status`
--

DROP TABLE IF EXISTS `v_pw_module_status`;
/*!50001 DROP VIEW IF EXISTS `v_pw_module_status`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_pw_module_status` (
  `photovoltaic_seq` tinyint NOT NULL,
  `target_id` tinyint NOT NULL,
  `target_name` tinyint NOT NULL,
  `install_place` tinyint NOT NULL,
  `module_type` tinyint NOT NULL,
  `compose_count` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `manufacturer` tinyint NOT NULL,
  `chart_color` tinyint NOT NULL,
  `chart_sort_rank` tinyint NOT NULL,
  `connector_ch` tinyint NOT NULL,
  `place_seq` tinyint NOT NULL,
  `amp` tinyint NOT NULL,
  `vol` tinyint NOT NULL,
  `writedate` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `v_pw_profile`
--

DROP TABLE IF EXISTS `v_pw_profile`;
/*!50001 DROP VIEW IF EXISTS `v_pw_profile`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_pw_profile` (
  `main_seq` tinyint NOT NULL,
  `connector_ch` tinyint NOT NULL,
  `photovoltaic_seq` tinyint NOT NULL,
  `pv_target_id` tinyint NOT NULL,
  `pv_target_name` tinyint NOT NULL,
  `pv_install_place` tinyint NOT NULL,
  `pv_module_type` tinyint NOT NULL,
  `pv_compose_count` tinyint NOT NULL,
  `pv_amount` tinyint NOT NULL,
  `pv_manufacturer` tinyint NOT NULL,
  `pv_chart_color` tinyint NOT NULL,
  `pv_chart_sort_rank` tinyint NOT NULL,
  `connector_seq` tinyint NOT NULL,
  `cnt_target_id` tinyint NOT NULL,
  `cnt_target_category` tinyint NOT NULL,
  `cnt_target_name` tinyint NOT NULL,
  `cnt_connect_info` tinyint NOT NULL,
  `cnt_protocol_info` tinyint NOT NULL,
  `cnt_director_name` tinyint NOT NULL,
  `cnt_director_tel` tinyint NOT NULL,
  `inverter_seq` tinyint NOT NULL,
  `ivt_target_id` tinyint NOT NULL,
  `ivt_target_category` tinyint NOT NULL,
  `ivt_target_name` tinyint NOT NULL,
  `ivt_connect_info` tinyint NOT NULL,
  `ivt_protocol_info` tinyint NOT NULL,
  `ivt_amount` tinyint NOT NULL,
  `ivt_director_name` tinyint NOT NULL,
  `ivt_director_tel` tinyint NOT NULL,
  `place_seq` tinyint NOT NULL,
  `place_id` tinyint NOT NULL,
  `place_name` tinyint NOT NULL,
  `ch_number` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wc_kma_data`
--

DROP TABLE IF EXISTS `wc_kma_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wc_kma_data` (
  `kma_data_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '기상청 일기 예보 시퀀스',
  `weather_location_seq` int(11) NOT NULL COMMENT '기상청 정보 위치 시퀀스',
  `temp` float NOT NULL COMMENT '℃',
  `sky` tinyint(4) NOT NULL COMMENT '① 1 : 맑음 ② 2 : 구름조금 ③ 3 : 구름많음 ④ 4 : 흐림',
  `pty` tinyint(4) NOT NULL COMMENT '(0 : 없음, 1:비, 2:비/눈, 3:눈/비, 4:눈)',
  `wf` tinyint(4) NOT NULL COMMENT '① 맑음 ② 구름 조금 ③ 구름 많음 ④ 흐림 ⑤ 비 ⑥ 눈/비 ⑦ 눈',
  `pop` tinyint(4) NOT NULL COMMENT '%',
  `r12` float NOT NULL COMMENT 'mm (① 0 <= x < 0.1, ② 0.1 <= x < 1, ③ 1 <= x < 5, ④ 5 <= x < 10, ⑤ 10 <= x < 25, ⑥ 25 <= x < 50, ⑦ 50 <= x)',
  `ws` float NOT NULL COMMENT 'm/s',
  `wd` tinyint(4) NOT NULL COMMENT '풍향 0~7 (북, 북동, 동, 남동, 남, 남서, 서, 북서)',
  `reh` float NOT NULL COMMENT '%',
  `applydate` datetime NOT NULL COMMENT '적용시간',
  `writedate` datetime NOT NULL COMMENT '작성일',
  `updatedate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '수정일',
  PRIMARY KEY (`kma_data_seq`,`weather_location_seq`),
  KEY `FK_WC_WEATHER_LOCATION_TO_WC_KMA_DATA` (`weather_location_seq`),
  CONSTRAINT `FK_WC_WEATHER_LOCATION_TO_WC_KMA_DATA` FOREIGN KEY (`weather_location_seq`) REFERENCES `wc_weather_location` (`weather_location_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='기상청에서 발표한 일기예보를 저장';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wc_kma_data`
--

LOCK TABLES `wc_kma_data` WRITE;
/*!40000 ALTER TABLE `wc_kma_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `wc_kma_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wc_weather_location`
--

DROP TABLE IF EXISTS `wc_weather_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wc_weather_location` (
  `weather_location_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '기상청 정보 위치 시퀀스',
  `province` varchar(50) DEFAULT NULL COMMENT '도',
  `city` varchar(50) DEFAULT NULL COMMENT '시',
  `town` varchar(50) DEFAULT NULL COMMENT '읍',
  `latitude` float DEFAULT NULL COMMENT '위도',
  `longitude` float DEFAULT NULL COMMENT '경도',
  `x` int(11) DEFAULT NULL COMMENT 'X',
  `y` int(11) DEFAULT NULL COMMENT 'Y',
  PRIMARY KEY (`weather_location_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='기상청의 날씨 API를 가져올 위치값 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wc_weather_location`
--

LOCK TABLES `wc_weather_location` WRITE;
/*!40000 ALTER TABLE `wc_weather_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `wc_weather_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weather_device_data`
--

DROP TABLE IF EXISTS `weather_device_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weather_device_data` (
  `weather_device_data_seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '기상관측장비 측정 정보 시퀀스',
  `main_seq` int(11) NOT NULL COMMENT 'MAIN 시퀀스',
  `sm_infrared` int(11) DEFAULT NULL COMMENT '0: 맑음, 1: 이슬비, 2: 약한비, 3: 보통비, 4: 폭우',
  `temp` float DEFAULT NULL COMMENT '℃',
  `reh` float DEFAULT NULL COMMENT '%',
  `wd` tinyint(4) DEFAULT NULL COMMENT '0~7 (북, 북동, 동, 남동, 남, 남서, 서, 북서)',
  `ws` float DEFAULT NULL COMMENT 'm/s',
  `rain_h` float DEFAULT NULL COMMENT 'mm',
  `rain_d` float DEFAULT NULL COMMENT 'mm',
  `solar` float DEFAULT NULL COMMENT 'W/mﾲ',
  `inclined_solar` float DEFAULT NULL COMMENT '경사 일사량',
  `uv` float DEFAULT NULL COMMENT '자외선',
  `writedate` datetime NOT NULL COMMENT '등록일',
  PRIMARY KEY (`weather_device_data_seq`,`main_seq`),
  KEY `FK_MAIN_TO_WEATHER_DEVICE_DATA` (`main_seq`),
  CONSTRAINT `FK_MAIN_TO_WEATHER_DEVICE_DATA` FOREIGN KEY (`main_seq`) REFERENCES `main` (`main_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='기상관측장비로부터 수집한 데이터를 저장';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weather_device_data`
--

LOCK TABLES `weather_device_data` WRITE;
/*!40000 ALTER TABLE `weather_device_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `weather_device_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `v_dv_data_logger`
--

/*!50001 DROP TABLE IF EXISTS `v_dv_data_logger`*/;
/*!50001 DROP VIEW IF EXISTS `v_dv_data_logger`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dv_data_logger` AS select `dl`.`data_logger_seq` AS `data_logger_seq`,`dld`.`data_logger_def_seq` AS `data_logger_def_seq`,`dl`.`main_seq` AS `main_seq`,case when octet_length(`dl`.`target_code`) > 0 then concat(`dld`.`target_prefix`,'_',`dl`.`main_seq`,'_',`dl`.`target_code`) else concat(`dld`.`target_prefix`,'_',`dl`.`main_seq`) end AS `dl_real_id`,case when octet_length(`dl`.`target_code`) > 0 then concat(`dld`.`target_prefix`,'_',`dl`.`target_code`) else concat(`dld`.`target_prefix`) end AS `dl_id`,case when octet_length(`dl`.`target_code`) > 0 then concat(`dld`.`target_name`,' ',`dl`.`target_code`) else concat(`dld`.`target_prefix`) end AS `dl_name`,`m`.`name` AS `m_name`,`dl`.`target_code` AS `dl_target_code`,`dld`.`target_name` AS `dld_target_name`,`dld`.`target_prefix` AS `dld_target_prefix`,`dl`.`serial_number` AS `serial_number`,`dl`.`connect_info` AS `connect_info`,`dl`.`protocol_info` AS `protocol_info` from ((`dv_data_logger` `dl` join `dv_data_logger_def` `dld` on(`dld`.`data_logger_def_seq` = `dl`.`data_logger_def_seq`)) join `main` `m` on(`m`.`main_seq` = `dl`.`main_seq`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dv_device_data`
--

/*!50001 DROP TABLE IF EXISTS `v_dv_device_data`*/;
/*!50001 DROP VIEW IF EXISTS `v_dv_device_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dv_device_data` AS select `dd`.`device_data_seq` AS `device_data_seq`,`dd`.`node_seq` AS `node_seq`,`dd`.`str_data` AS `str_data`,`dn`.`data_unit` AS `data_unit`,`dd`.`writedate` AS `writedate`,`dn`.`node_id` AS `node_id`,`dn`.`node_real_id` AS `node_real_id`,`dn`.`node_name` AS `node_name`,`dn`.`dl_real_id` AS `dl_real_id`,`dn`.`dl_id` AS `dl_id`,`dn`.`dl_name` AS `dl_name` from (`dv_device_data` `dd` join `v_dv_node` `dn` on(`dn`.`node_seq` = `dd`.`node_seq`)) order by `dd`.`device_data_seq` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dv_node`
--

/*!50001 DROP TABLE IF EXISTS `v_dv_node`*/;
/*!50001 DROP VIEW IF EXISTS `v_dv_node`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dv_node` AS select `n`.`node_seq` AS `node_seq`,`nd`.`node_def_seq` AS `node_def_seq`,`nc`.`node_class_seq` AS `node_class_seq`,`n`.`data_logger_seq` AS `data_logger_seq`,`dl`.`main_seq` AS `main_seq`,case when octet_length(`n`.`target_code`) > 0 then concat(`nd`.`target_prefix`,'_',`n`.`target_code`) else concat(`nd`.`target_prefix`) end AS `node_id`,case when octet_length(`n`.`target_code`) > 0 then concat(`nd`.`target_prefix`,'_',`dl`.`main_seq`,'_',`n`.`target_code`) else concat(`nd`.`target_prefix`,'_',`dl`.`main_seq`) end AS `node_real_id`,case when octet_length(`n`.`target_code`) > 0 then concat(`nd`.`target_name`,' ',`n`.`target_code`) else concat(`nd`.`target_name`) end AS `node_name`,case when octet_length(`dl`.`target_code`) > 0 then concat(`dld`.`target_prefix`,'_',`dl`.`main_seq`,'_',`dl`.`target_code`) else concat(`dld`.`target_prefix`,'_',`dl`.`main_seq`) end AS `dl_real_id`,case when octet_length(`dl`.`target_code`) > 0 then concat(`dld`.`target_prefix`,'_',`dl`.`target_code`) else concat(`dld`.`target_prefix`) end AS `dl_id`,case when octet_length(`dl`.`target_code`) > 0 then concat(`dld`.`target_name`,' ',`dl`.`target_code`) else concat(`dld`.`target_prefix`) end AS `dl_name`,`nc`.`data_unit` AS `data_unit`,`nc`.`is_sensor` AS `is_sensor`,`n`.`data_logger_index` AS `data_logger_index`,`n`.`target_code` AS `n_target_code`,`nd`.`target_id` AS `nd_target_id`,`nd`.`target_name` AS `nd_target_name`,`nd`.`target_prefix` AS `nd_target_prefix`,`nd`.`description` AS `nd_description`,`nc`.`target_id` AS `nc_target_id`,`nc`.`target_name` AS `nc_target_name`,`nc`.`description` AS `nc_description` from ((((`dv_node` `n` join `dv_node_def` `nd` on(`nd`.`node_def_seq` = `n`.`node_def_seq`)) join `dv_node_class` `nc` on(`nc`.`node_class_seq` = `nd`.`node_class_seq`)) join `dv_data_logger` `dl` on(`dl`.`data_logger_seq` = `n`.`data_logger_seq`)) join `dv_data_logger_def` `dld` on(`dld`.`data_logger_def_seq` = `dl`.`data_logger_def_seq`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dv_node_profile`
--

/*!50001 DROP TABLE IF EXISTS `v_dv_node_profile`*/;
/*!50001 DROP VIEW IF EXISTS `v_dv_node_profile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dv_node_profile` AS select `n`.`node_seq` AS `node_seq`,case when octet_length(`n`.`target_code`) > 0 then concat(`nd`.`target_prefix`,'_',`vddl`.`main_seq`,'_',`n`.`target_code`) else concat(`nd`.`target_prefix`,'_',`vddl`.`main_seq`) end AS `node_real_id`,case when octet_length(`n`.`target_code`) > 0 then concat(`nd`.`target_prefix`,'_',`n`.`target_code`) else concat(`nd`.`target_prefix`) end AS `node_id`,case when octet_length(`n`.`target_code`) > 0 then concat(`nd`.`target_name`,'_',`n`.`target_code`) else concat(`nd`.`target_name`) end AS `node_name`,`n`.`target_code` AS `target_code`,`n`.`data_logger_index` AS `data_logger_index`,`vddl`.`dl_real_id` AS `dl_real_id`,`vddl`.`dl_id` AS `dl_id`,`nd`.`target_prefix` AS `nd_target_prefix`,`nd`.`target_id` AS `nd_target_id`,`nd`.`target_name` AS `nd_target_name`,`nc`.`target_id` AS `nc_target_id`,`nc`.`is_sensor` AS `nc_is_sensor`,`nc`.`target_name` AS `nc_target_name`,`nc`.`data_unit` AS `nc_data_unit`,`nc`.`description` AS `nc_description`,`vddl`.`m_name` AS `m_name`,`nd`.`node_def_seq` AS `node_def_seq`,`nd`.`node_class_seq` AS `node_class_seq`,`vddl`.`main_seq` AS `main_seq`,`vddl`.`data_logger_seq` AS `data_logger_seq`,`vddl`.`data_logger_def_seq` AS `data_logger_def_seq` from (((`dv_node` `n` left join `dv_node_def` `nd` on(`nd`.`node_def_seq` = `n`.`node_def_seq`)) left join `dv_node_class` `nc` on(`nc`.`node_class_seq` = `nd`.`node_class_seq`)) left join `v_dv_data_logger` `vddl` on(`vddl`.`data_logger_seq` = `n`.`data_logger_seq`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dv_place`
--

/*!50001 DROP TABLE IF EXISTS `v_dv_place`*/;
/*!50001 DROP VIEW IF EXISTS `v_dv_place`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dv_place` AS select `p`.`place_seq` AS `place_seq`,`p`.`place_def_seq` AS `place_def_seq`,`pc`.`place_class_seq` AS `place_class_seq`,`m`.`main_seq` AS `main_seq`,`m`.`uuid` AS `uuid`,`m`.`name` AS `m_name`,case when octet_length(`p`.`target_code`) > 0 then concat(`pd`.`target_prefix`,'_',`p`.`target_code`) else concat(`pd`.`target_prefix`) end AS `place_id`,case when octet_length(`p`.`target_code`) > 0 then concat(`pd`.`target_prefix`,'_',`m`.`main_seq`,'_',`p`.`target_code`) else concat(`pd`.`target_prefix`,'_',`m`.`main_seq`) end AS `place_real_id`,case when octet_length(`p`.`target_code`) > 0 then concat(`pd`.`target_name`,' ',`p`.`target_code`) else concat(`pd`.`target_name`) end AS `place_name`,`p`.`target_code` AS `p_target_code`,`p`.`target_name` AS `p_target_name`,`p`.`depth` AS `depth`,`p`.`place_info` AS `place_info`,`p`.`chart_color` AS `chart_color`,`p`.`chart_sort_rank` AS `chart_sort_rank`,`pd`.`target_prefix` AS `pd_target_prefix`,`pd`.`target_id` AS `pd_target_id`,`pd`.`target_name` AS `pd_target_name`,`pc`.`target_id` AS `pc_target_id`,`pc`.`target_name` AS `pc_target_name`,`pc`.`description` AS `pc_description` from (((`dv_place` `p` join `dv_place_def` `pd` on(`pd`.`place_def_seq` = `p`.`place_def_seq`)) join `dv_place_class` `pc` on(`pc`.`place_class_seq` = `pd`.`place_class_seq`)) join `main` `m` on(`m`.`main_seq` = `p`.`main_seq`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dv_place_relation`
--

/*!50001 DROP TABLE IF EXISTS `v_dv_place_relation`*/;
/*!50001 DROP VIEW IF EXISTS `v_dv_place_relation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dv_place_relation` AS select `dpr`.`place_relation_seq` AS `place_relation_seq`,`dpr`.`node_seq` AS `node_seq`,`dpr`.`place_seq` AS `place_seq`,`vdn`.`node_id` AS `node_id`,`vdn`.`node_real_id` AS `node_real_id`,`vdn`.`node_name` AS `node_name`,`vddl`.`dl_id` AS `dl_id`,`vddl`.`dl_name` AS `dl_name`,`vdp`.`place_id` AS `place_id`,`vdp`.`place_real_id` AS `place_real_id`,`vdp`.`place_name` AS `place_name`,`vdp`.`p_target_code` AS `p_target_code`,`vdp`.`p_target_name` AS `p_target_name`,`vdp`.`chart_color` AS `chart_color`,`vdp`.`chart_sort_rank` AS `chart_sort_rank`,`vdp`.`pd_target_name` AS `pd_target_name`,`vdn`.`nc_target_name` AS `nc_target_name`,`vdn`.`nd_target_name` AS `nd_target_name`,`vdn`.`is_sensor` AS `is_sensor`,`vdn`.`nd_target_id` AS `nd_target_id`,`vdn`.`nc_target_id` AS `nc_target_id`,`vddl`.`serial_number` AS `serial_number`,`vdn`.`main_seq` AS `main_seq`,`vdn`.`data_logger_seq` AS `data_logger_seq` from (((`dv_place_relation` `dpr` join `v_dv_place` `vdp` on(`vdp`.`place_seq` = `dpr`.`place_seq`)) join `v_dv_node` `vdn` on(`vdn`.`node_seq` = `dpr`.`node_seq`)) join `v_dv_data_logger` `vddl` on(`vddl`.`data_logger_seq` = `vdn`.`data_logger_seq`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dv_sensor_data`
--

/*!50001 DROP TABLE IF EXISTS `v_dv_sensor_data`*/;
/*!50001 DROP VIEW IF EXISTS `v_dv_sensor_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dv_sensor_data` AS select `sd`.`sensor_data_seq` AS `sensor_data_seq`,`sd`.`node_seq` AS `node_seq`,`sd`.`num_data` AS `num_data`,`dn`.`data_unit` AS `data_unit`,`sd`.`writedate` AS `writedate`,`dn`.`node_id` AS `node_id`,`dn`.`node_real_id` AS `node_real_id`,`dn`.`node_name` AS `node_name`,`dn`.`dl_real_id` AS `dl_real_id`,`dn`.`dl_id` AS `dl_id`,`dn`.`dl_name` AS `dl_name` from (`dv_sensor_data` `sd` join `v_dv_node` `dn` on(`dn`.`node_seq` = `sd`.`node_seq`)) order by `sd`.`sensor_data_seq` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_dv_sensor_profile`
--

/*!50001 DROP TABLE IF EXISTS `v_dv_sensor_profile`*/;
/*!50001 DROP VIEW IF EXISTS `v_dv_sensor_profile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_dv_sensor_profile` AS select `n`.`node_seq` AS `node_seq`,`nd`.`node_def_seq` AS `node_def_seq`,`nc`.`node_class_seq` AS `node_class_seq`,`n`.`data_logger_seq` AS `data_logger_seq`,`dl`.`main_seq` AS `main_seq`,case when octet_length(`n`.`target_code`) > 0 then concat(`nd`.`target_prefix`,'_',`n`.`target_code`) else concat(`nd`.`target_prefix`) end AS `node_id`,case when octet_length(`n`.`target_code`) > 0 then concat(`nd`.`target_prefix`,'_',`dl`.`main_seq`,'_',`n`.`target_code`) else concat(`nd`.`target_prefix`,'_',`dl`.`main_seq`) end AS `node_real_id`,case when octet_length(`n`.`target_code`) > 0 then concat(`nd`.`target_name`,' ',`n`.`target_code`) else concat(`nd`.`target_name`) end AS `node_name`,`r_dsd`.`num_data` AS `node_data`,`r_dsd`.`writedate` AS `writedate`,`nc`.`data_unit` AS `data_unit`,`nc`.`is_sensor` AS `is_sensor`,`n`.`data_logger_index` AS `data_logger_index`,`n`.`target_code` AS `n_target_code`,`nc`.`target_id` AS `nc_target_id`,`nc`.`target_name` AS `nc_target_name`,`nc`.`description` AS `nc_description`,`nd`.`target_id` AS `nd_target_id`,`nd`.`target_name` AS `nd_target_name`,`nd`.`target_prefix` AS `nd_target_prefix`,`nd`.`description` AS `nd_description` from ((((`fp`.`dv_node` `n` join `fp`.`dv_node_def` `nd` on(`nd`.`node_def_seq` = `n`.`node_def_seq`)) join `fp`.`dv_node_class` `nc` on(`nc`.`node_class_seq` = `nd`.`node_class_seq`)) join `fp`.`dv_data_logger` `dl` on(`dl`.`data_logger_seq` = `n`.`data_logger_seq`)) left join (select `dsd`.`node_seq` AS `node_seq`,`dsd`.`num_data` AS `num_data`,`dsd`.`writedate` AS `writedate` from (`fp`.`dv_sensor_data` `dsd` join (select max(`fp`.`dv_sensor_data`.`sensor_data_seq`) AS `sensor_data_seq` from `fp`.`dv_sensor_data` group by `fp`.`dv_sensor_data`.`node_seq`) `temp` on(`dsd`.`sensor_data_seq` = `temp`.`sensor_data_seq`))) `r_dsd` on(`r_dsd`.`node_seq` = `n`.`node_seq`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_member`
--

/*!50001 DROP TABLE IF EXISTS `v_member`*/;
/*!50001 DROP VIEW IF EXISTS `v_member`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_member` AS select `mem`.`member_seq` AS `member_seq`,`mem`.`main_seq` AS `main_seq`,`mem`.`user_id` AS `user_id`,`mem`.`pw_salt` AS `pw_salt`,`mem`.`pw_hash` AS `pw_hash`,`mem`.`name` AS `name`,`mem`.`nick_name` AS `nick_name`,`mem`.`grade` AS `grade`,`mem`.`address` AS `address`,`mem`.`tel` AS `tel`,`mem`.`is_deleted` AS `is_deleted`,`mem`.`writedate` AS `writedate`,`mem`.`updatedate` AS `updatedate`,`m`.`weather_location_seq` AS `weather_location_seq`,`m`.`uuid` AS `main_uuid`,`m`.`name` AS `main_name`,`m`.`address` AS `main_address`,`m`.`is_deleted` AS `main_is_deleted`,`wl`.`province` AS `province`,`wl`.`city` AS `city`,`wl`.`town` AS `town`,`wl`.`latitude` AS `latitude`,`wl`.`longitude` AS `longitude`,`wl`.`x` AS `x`,`wl`.`y` AS `y` from ((`member` `mem` join `main` `m` on(`mem`.`main_seq` = `m`.`main_seq`)) join `wc_weather_location` `wl` on(`wl`.`weather_location_seq` = `m`.`weather_location_seq`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_pw_inverter_profile`
--

/*!50001 DROP TABLE IF EXISTS `v_pw_inverter_profile`*/;
/*!50001 DROP VIEW IF EXISTS `v_pw_inverter_profile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pw_inverter_profile` AS select `ivt`.`inverter_seq` AS `inverter_seq`,`ivt`.`target_id` AS `target_id`,`ivt`.`target_name` AS `target_name`,`ivt`.`target_category` AS `target_category`,`ivt`.`connect_info` AS `connect_info`,`ivt`.`protocol_info` AS `protocol_info`,`ivt`.`install_place` AS `install_place`,`ivt`.`serial_number` AS `serial_number`,`ivt`.`amount` AS `amount`,`ivt`.`director_name` AS `director_name`,`ivt`.`director_tel` AS `director_tel`,`ivt`.`chart_color` AS `chart_color`,`ivt`.`chart_sort_rank` AS `chart_sort_rank`,`rp`.`photovoltaic_seq` AS `photovoltaic_seq`,`rp`.`connector_seq` AS `connector_seq`,`rp`.`place_seq` AS `place_seq`,`rp`.`connector_ch` AS `connector_ch`,`m`.`main_seq` AS `main_seq`,`m`.`weather_location_seq` AS `weather_location_seq`,`m`.`uuid` AS `uuid`,`m`.`name` AS `name`,`m`.`map` AS `map`,`m`.`address` AS `address`,`m`.`is_deleted` AS `is_deleted`,`m`.`writedate` AS `writedate`,`m`.`updatedate` AS `updatedate` from ((`pw_inverter` `ivt` left join `pw_relation_power` `rp` on(`rp`.`inverter_seq` = `ivt`.`inverter_seq`)) join `main` `m` on(`m`.`main_seq` = `rp`.`main_seq`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_pw_inverter_status`
--

/*!50001 DROP TABLE IF EXISTS `v_pw_inverter_status`*/;
/*!50001 DROP VIEW IF EXISTS `v_pw_inverter_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pw_inverter_status` AS select `rp`.`place_seq` AS `place_seq`,`id`.`inverter_data_seq` AS `inverter_data_seq`,`id`.`inverter_seq` AS `inverter_seq`,`id`.`pv_v` AS `pv_v`,`id`.`pv_a` AS `pv_a`,`id`.`pv_kw` AS `pv_kw`,`id`.`grid_rs_v` AS `grid_rs_v`,`id`.`grid_st_v` AS `grid_st_v`,`id`.`grid_tr_v` AS `grid_tr_v`,`id`.`grid_r_a` AS `grid_r_a`,`id`.`grid_s_a` AS `grid_s_a`,`id`.`grid_t_a` AS `grid_t_a`,`id`.`line_f` AS `line_f`,`id`.`power_f` AS `power_f`,`id`.`power_kw` AS `power_kw`,`id`.`power_total_kwh` AS `power_total_kwh`,`id`.`writedate` AS `writedate`,round(`id`.`power_total_kwh` - (select max(`pw_inverter_data`.`power_total_kwh`) from `pw_inverter_data` where `pw_inverter_data`.`inverter_seq` = `id`.`inverter_seq` and `pw_inverter_data`.`writedate` >= curdate() - 1 and `pw_inverter_data`.`writedate` < curdate()),1) AS `daily_power_kwh`,`pv`.`amount` AS `pv_amount`,`pv`.`compose_count` AS `compose_count`,`pv`.`install_place` AS `install_place` from (((`pw_inverter_data` `id` left join `pw_inverter` on(`pw_inverter`.`inverter_seq` = `id`.`inverter_seq`)) left join `pw_relation_power` `rp` on(`rp`.`inverter_seq` = `id`.`inverter_seq`)) left join `pw_photovoltaic` `pv` on(`pv`.`photovoltaic_seq` = `rp`.`photovoltaic_seq`)) where `id`.`inverter_data_seq` in (select max(`pw_inverter_data`.`inverter_data_seq`) from `pw_inverter_data` group by `pw_inverter_data`.`inverter_seq`) order by `pw_inverter`.`chart_sort_rank` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_pw_module_data`
--

/*!50001 DROP TABLE IF EXISTS `v_pw_module_data`*/;
/*!50001 DROP VIEW IF EXISTS `v_pw_module_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pw_module_data` AS select `md`.`photovoltaic_seq` AS `photovoltaic_seq`,`md`.`writedate` AS `writedate`,round(avg(`md`.`amp`),1) AS `avg_amp`,round(avg(`md`.`vol`),1) AS `avg_vol`,date_format(`md`.`writedate`,'%H-%i') AS `hour_time` from `pw_module_data` `md` group by date_format(`md`.`writedate`,'%Y-%m-%d %H-%i'),`md`.`photovoltaic_seq` order by `md`.`writedate` desc,`md`.`photovoltaic_seq` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_pw_module_status`
--

/*!50001 DROP TABLE IF EXISTS `v_pw_module_status`*/;
/*!50001 DROP VIEW IF EXISTS `v_pw_module_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pw_module_status` AS select `pv`.`photovoltaic_seq` AS `photovoltaic_seq`,`pv`.`target_id` AS `target_id`,`pv`.`target_name` AS `target_name`,`pv`.`install_place` AS `install_place`,`pv`.`module_type` AS `module_type`,`pv`.`compose_count` AS `compose_count`,`pv`.`amount` AS `amount`,`pv`.`manufacturer` AS `manufacturer`,`pv`.`chart_color` AS `chart_color`,`pv`.`chart_sort_rank` AS `chart_sort_rank`,`rp`.`connector_ch` AS `connector_ch`,`rp`.`place_seq` AS `place_seq`,`curr_data`.`amp` AS `amp`,`curr_data`.`vol` AS `vol`,`curr_data`.`writedate` AS `writedate` from (((`fp`.`pw_photovoltaic` `pv` join `fp`.`pw_relation_power` `rp` on(`rp`.`photovoltaic_seq` = `pv`.`photovoltaic_seq`)) left join `fp`.`dv_place` `dp` on(`dp`.`place_seq` = `rp`.`place_seq`)) left join (select `md`.`photovoltaic_seq` AS `photovoltaic_seq`,`md`.`amp` AS `amp`,`md`.`vol` AS `vol`,`md`.`writedate` AS `writedate` from (`fp`.`pw_module_data` `md` join (select max(`fp`.`pw_module_data`.`module_data_seq`) AS `module_data_seq` from `fp`.`pw_module_data` group by `fp`.`pw_module_data`.`photovoltaic_seq`) `b` on(`md`.`module_data_seq` = `b`.`module_data_seq`))) `curr_data` on(`curr_data`.`photovoltaic_seq` = `pv`.`photovoltaic_seq`)) order by `pv`.`chart_sort_rank` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_pw_profile`
--

/*!50001 DROP TABLE IF EXISTS `v_pw_profile`*/;
/*!50001 DROP VIEW IF EXISTS `v_pw_profile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pw_profile` AS select `rp`.`main_seq` AS `main_seq`,`rp`.`connector_ch` AS `connector_ch`,`pv`.`photovoltaic_seq` AS `photovoltaic_seq`,`pv`.`target_id` AS `pv_target_id`,`pv`.`target_name` AS `pv_target_name`,`pv`.`install_place` AS `pv_install_place`,`pv`.`module_type` AS `pv_module_type`,`pv`.`compose_count` AS `pv_compose_count`,`pv`.`amount` AS `pv_amount`,`pv`.`manufacturer` AS `pv_manufacturer`,`pv`.`chart_color` AS `pv_chart_color`,`pv`.`chart_sort_rank` AS `pv_chart_sort_rank`,`cnt`.`connector_seq` AS `connector_seq`,`cnt`.`target_id` AS `cnt_target_id`,`cnt`.`target_category` AS `cnt_target_category`,`cnt`.`target_name` AS `cnt_target_name`,`cnt`.`connect_info` AS `cnt_connect_info`,`cnt`.`protocol_info` AS `cnt_protocol_info`,`cnt`.`director_name` AS `cnt_director_name`,`cnt`.`director_tel` AS `cnt_director_tel`,`ivt`.`inverter_seq` AS `inverter_seq`,`ivt`.`target_id` AS `ivt_target_id`,`ivt`.`target_category` AS `ivt_target_category`,`ivt`.`target_name` AS `ivt_target_name`,`ivt`.`connect_info` AS `ivt_connect_info`,`ivt`.`protocol_info` AS `ivt_protocol_info`,`ivt`.`amount` AS `ivt_amount`,`ivt`.`director_name` AS `ivt_director_name`,`ivt`.`director_tel` AS `ivt_director_tel`,`vdp`.`place_seq` AS `place_seq`,`vdp`.`place_id` AS `place_id`,`vdp`.`place_name` AS `place_name`,(select count(0) from `pw_relation_power` where `cnt`.`connector_seq` = `pw_relation_power`.`connector_seq`) AS `ch_number` from ((((`pw_relation_power` `rp` left join `pw_photovoltaic` `pv` on(`pv`.`photovoltaic_seq` = `rp`.`photovoltaic_seq`)) left join `pw_inverter` `ivt` on(`ivt`.`inverter_seq` = `rp`.`inverter_seq`)) left join `pw_connector` `cnt` on(`cnt`.`connector_seq` = `rp`.`connector_seq`)) left join `v_dv_place` `vdp` on(`vdp`.`place_seq` = `rp`.`place_seq`)) order by `pv`.`chart_sort_rank` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-18 17:37:43
