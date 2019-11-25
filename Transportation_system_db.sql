-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: fall2019dbabhishek.cark2u2mobnw.us-east-2.rds.amazonaws.com    Database: sprint2_schema
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
-- Table structure for table `Transportation_Mode`
--

DROP TABLE IF EXISTS `Transportation_Mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transportation_Mode` (
  `Mode_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Transportation_name` varchar(40) DEFAULT NULL,
  `Transportation_type` varchar(40) DEFAULT NULL,
  `Fare` int(11) DEFAULT NULL,
  `Total_number_of_seats` int(40) DEFAULT NULL,
  `Vehicle_number` int(11) DEFAULT NULL,
  `Number_of_available_seats` int(40) DEFAULT NULL,
  PRIMARY KEY (`Mode_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transportation_Mode`
--

LOCK TABLES `Transportation_Mode` WRITE;
/*!40000 ALTER TABLE `Transportation_Mode` DISABLE KEYS */;
INSERT INTO `Transportation_Mode` VALUES (1,'Volvo','Bus',600,50,980,20),(2,'Rajdhani Express','Train',1000,200,800,200),(3,'BMW','Car',4000,4,400,4);
/*!40000 ALTER TABLE `Transportation_Mode` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-08 12:56:20
