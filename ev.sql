-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: ev
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `comp_id` int NOT NULL,
  `comp_name` varchar(50) DEFAULT NULL,
  `comp_hq` varchar(50) DEFAULT NULL,
  `comp_head` varchar(50) DEFAULT NULL,
  `no_of_emp` int DEFAULT NULL,
  `models` int DEFAULT NULL,
  PRIMARY KEY (`comp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (101,'TESLA','TEXAS','ELON',600,6),(102,'ATHER','BANGALORE','TARUN MEHTA',200,5),(103,'OLA','BANGALORE','BHAVISH AGGARWAL',200,2),(104,'HERO','LUDHIANA','SOHINDER SINGH GILL',150,4),(105,'ELECTROWHEELZ','TORONTO','JEFF BROWN',100,2),(106,'OKINAWA','BANGALORE','JEETENDER SHARMA',80,1),(107,'KIA','SEOUL','SONG HO-SUNG',200,2),(108,'TATA','MUMBAI','NATARAJAN CHANDRASEKARAN',1000,2);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost`
--

DROP TABLE IF EXISTS `cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cost` (
  `v_id` int NOT NULL,
  `v_name` varchar(50) DEFAULT NULL,
  `battery` decimal(10,2) DEFAULT NULL,
  `rd` decimal(10,2) DEFAULT NULL,
  `body` decimal(10,2) DEFAULT NULL,
  `subsidy` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost`
--

LOCK TABLES `cost` WRITE;
/*!40000 ALTER TABLE `cost` DISABLE KEYS */;
INSERT INTO `cost` VALUES (1,'Tesla Model S',20000.00,16000.00,25000.00,5000.00,56000.00),(2,'Nissan Leaf',15000.00,22000.50,20000.75,4000.25,53001.00),(3,'Chevrolet Bolt',18000.00,13000.75,22000.50,4500.25,48500.00),(4,'Ford Mustang Mach-E',22000.00,16000.25,28000.00,6000.00,60000.00),(5,'Audi e-tron',25000.00,18000.80,30000.50,6500.80,66500.00);
/*!40000 ALTER TABLE `cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finance`
--

DROP TABLE IF EXISTS `finance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `finance` (
  `comp_id` int NOT NULL,
  `total_sales` decimal(10,2) DEFAULT NULL,
  `vehicles_sold` int DEFAULT NULL,
  `profit` decimal(10,2) DEFAULT NULL,
  `total_spent` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`comp_id`),
  CONSTRAINT `finance_ibfk_1` FOREIGN KEY (`comp_id`) REFERENCES `company` (`comp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finance`
--

LOCK TABLES `finance` WRITE;
/*!40000 ALTER TABLE `finance` DISABLE KEYS */;
INSERT INTO `finance` VALUES (101,200000.00,50,50000.00,150000.00),(102,180000.00,45,45000.50,135000.00),(103,220000.00,55,55000.80,165000.00),(104,240000.00,60,60000.20,180000.00),(105,210000.00,52,52000.80,156001.00);
/*!40000 ALTER TABLE `finance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `comp_id` int NOT NULL,
  `v_id` int NOT NULL,
  `total_complaints` int DEFAULT NULL,
  `total_comp_solved` int DEFAULT NULL,
  `ratings` int DEFAULT NULL,
  PRIMARY KEY (`comp_id`,`v_id`),
  KEY `v_id` (`v_id`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`comp_id`) REFERENCES `company` (`comp_id`),
  CONSTRAINT `service_ibfk_2` FOREIGN KEY (`v_id`) REFERENCES `cost` (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (101,1,10,8,4),(102,2,15,12,5),(103,3,5,4,3),(104,4,20,18,4),(105,5,12,10,4);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `station` (
  `station_id` int NOT NULL,
  `comp_id` int DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `no_of_units` int DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `max_limit` int DEFAULT NULL,
  PRIMARY KEY (`station_id`),
  KEY `comp_id` (`comp_id`),
  CONSTRAINT `station_ibfk_1` FOREIGN KEY (`comp_id`) REFERENCES `company` (`comp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,101,'Station A',50,12000.00,100),(2,102,'Station B',40,10000.50,80),(3,103,'Station C',30,8000.75,60),(4,104,'Station D',45,11000.25,90),(5,105,'Station E',35,9000.80,70);
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Balaji','balajikontanpalli@gmail.com','Balaji@2003','admin'),(2,'user1','user1@gmail.com','user1','user'),(3,'Pavan','pavan@gmail.com','1234','admin'),(4,'parvathi','parvathi@gmail.com','1234','admin'),(5,'Shloka','shloka@gmail.com','1234','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `v_id` int NOT NULL,
  `comp_id` int DEFAULT NULL,
  `v_name` varchar(50) DEFAULT NULL,
  `max_range` int DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `max_speed` int DEFAULT NULL,
  `hours` int DEFAULT NULL,
  `voltage` int DEFAULT NULL,
  `station_id` int DEFAULT NULL,
  PRIMARY KEY (`v_id`),
  KEY `comp_id` (`comp_id`),
  KEY `station_id` (`station_id`),
  CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`comp_id`) REFERENCES `company` (`comp_id`),
  CONSTRAINT `vehicles_ibfk_2` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,101,'Tesla Model S',400,80000.00,155,8,400,3),(2,101,'Nissan Leaf',150,35000.00,89,5,300,5),(3,103,'Chevrolet Bolt',250,40000.00,91,7,350,2),(4,104,'Ford Mustang Mach-E',300,55000.00,120,6,400,4),(5,105,'Audi e-tron',220,65000.00,124,7,350,1);
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-30 13:35:00
