-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: fall2019dbabhishek.cark2u2mobnw.us-east-2.rds.amazonaws.com    Database: Transportaion_System
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Transportation`
--

DROP TABLE IF EXISTS `Transportation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transportation` (
  `Transportation_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Mode_of_transportation` varchar(40) DEFAULT NULL,
  `Source_journey` varchar(40) DEFAULT NULL,
  `Destination_journey` varchar(40) DEFAULT NULL,
  `Date_of_journey` datetime DEFAULT NULL,
  `Fare` int(11) DEFAULT NULL,
  `Number_of_available_seats` varchar(40) DEFAULT NULL,
  `Admin_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Transportation_ID`),
  KEY `Admin_ID` (`Admin_ID`),
  CONSTRAINT `Transportation_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `Admin` (`Admin_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transportation`
--

LOCK TABLES `Transportation` WRITE;
/*!40000 ALTER TABLE `Transportation` DISABLE KEYS */;
INSERT INTO `Transportation` VALUES (1,'Train','Charlotte','Concord Mill','2019-10-17 21:27:04',800,'100',1),(2,'Bus','Charlote','Concord Mill','2019-10-17 21:27:11',1000,'10',1),(8,'Flight','Charlote','Concord Mill','2019-10-18 16:54:11',10000,'70',1),(10,'Flight','Newyork','Charlotte','2019-10-18 17:26:40',100000,'70',1),(11,'Flight','New York','Concord Mill','2019-10-18 17:37:44',10000,'70',1);
/*!40000 ALTER TABLE `Transportation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-18 13:42:40
