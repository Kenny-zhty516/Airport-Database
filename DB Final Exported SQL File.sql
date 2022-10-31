-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: database-project.cydrszq23mx4.us-east-2.rds.amazonaws.com    Database: databaseproject
-- ------------------------------------------------------
-- Server version	8.0.23

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `Accounts`
--

DROP TABLE IF EXISTS `Accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts` (
  `AccNumber` int NOT NULL,
  `AccCreateDate` varchar(25) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `AccEmail` varchar(45) NOT NULL,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `DateModified` datetime DEFAULT NULL,
  `CreatedByUser` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AccNumber`),
  UNIQUE KEY `Username` (`Username`),
  CONSTRAINT `userRole` CHECK (((`Role` = _utf8mb4'Manager') or (`Role` = _utf8mb4'CustRep') or (`Role` = _utf8mb4'Customer')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts`
--

LOCK TABLES `Accounts` WRITE;
/*!40000 ALTER TABLE `Accounts` DISABLE KEYS */;
INSERT INTO `Accounts` VALUES (1,'2020-12-19 00:00:00','Ian','123456','bo@gmail.com','Ian','Liu','Manager',NULL,'Kenny'),(2,'2020-12-19 00:00:00','Bo','123456','zhangtt2002@gmail.com','Bo','Zhang','Customer',NULL,'Ian'),(3,'2020-12-19 00:00:00','Kenny','123456','kenny@gmail.com','Kenny','Zhang','Manager',NULL,'Kenny'),(4,'2020-12-19 00:00:00','Rumi','123456','rumi@gmail.com','Rumi','Albert','Customer',NULL,'Kenny'),(5,'2020-12-19 00:00:00','Makai','123456','makai@gmail.com','Makai','Albert','Custrep',NULL,'Kenny'),(6,'2020-12-19 00:00:00','Danny','123456','danny@gmail.com','Danny','Chen','Custrep',NULL,'Kenny'),(7,'2020-12-19 00:00:00','Michael','123456','Michael@gmail.com','Michael','Chen','Customer',NULL,NULL),(8,'2020-12-19 00:00:00','Samuel','123456','Samuel@gmail.com','Samuel','Zhou','Customer',NULL,NULL);
/*!40000 ALTER TABLE `Accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airlines`
--

DROP TABLE IF EXISTS `Airlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Airlines` (
  `ALID` char(2) NOT NULL,
  `ALname` varchar(22) NOT NULL,
  PRIMARY KEY (`ALID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airlines`
--

LOCK TABLES `Airlines` WRITE;
/*!40000 ALTER TABLE `Airlines` DISABLE KEYS */;
INSERT INTO `Airlines` VALUES ('11','Hawaiin Airline'),('12','United Airlines'),('13','British Airways');
/*!40000 ALTER TABLE `Airlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Airports`
--

DROP TABLE IF EXISTS `Airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Airports` (
  `APID` char(3) NOT NULL,
  `APName` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  PRIMARY KEY (`APID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airports`
--

LOCK TABLES `Airports` WRITE;
/*!40000 ALTER TABLE `Airports` DISABLE KEYS */;
INSERT INTO `Airports` VALUES ('HNL','Daniel K. Inouye International Airport','Honolulu','United States'),('JFK','John F. Kennedy International Airport','Queens','United States'),('LHR','Heathrow Airport','London','United Kindom');
/*!40000 ALTER TABLE `Airports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Booking` (
  `ResNo` int NOT NULL,
  `BookFee` double NOT NULL,
  `CustomerRep` varchar(22) NOT NULL,
  PRIMARY KEY (`ResNo`),
  CONSTRAINT `Booking_ibfk_1` FOREIGN KEY (`ResNo`) REFERENCES `ReservationData` (`ResNo`),
  CONSTRAINT `Booking_chk_1` CHECK ((`BookFee` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES (1,24.99,'Makai'),(2,20,'Makai'),(3,35,'Danny'),(4,24.99,'Makai'),(5,24.99,'Danny');
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contact`
--

DROP TABLE IF EXISTS `Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contact` (
  `AccNumber` int NOT NULL,
  `Telephone` int NOT NULL,
  `EmailAddress` varchar(100) NOT NULL,
  PRIMARY KEY (`AccNumber`),
  CONSTRAINT `Contact_ibfk_1` FOREIGN KEY (`AccNumber`) REFERENCES `Accounts` (`AccNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contact`
--

LOCK TABLES `Contact` WRITE;
/*!40000 ALTER TABLE `Contact` DISABLE KEYS */;
INSERT INTO `Contact` VALUES (1,2147483641,'bo@gmail.com'),(2,2147483642,'zhangtt2002@gmail.com'),(3,2147483643,'kenny@gmail.com'),(4,2147483644,'rumi@gmail.com'),(5,2147483645,'makai@gmail.com'),(6,2147483646,'danny@gmail.com'),(7,2147483647,'Michael@gmail.com'),(8,2147483647,'Samuel@gmail.com');
/*!40000 ALTER TABLE `Contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerData`
--

DROP TABLE IF EXISTS `CustomerData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomerData` (
  `AccNumber` int NOT NULL,
  `Preferences` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`AccNumber`),
  UNIQUE KEY `AccNumber_UNIQUE` (`AccNumber`),
  CONSTRAINT `CustomerData_ibfk_3` FOREIGN KEY (`AccNumber`) REFERENCES `Accounts` (`AccNumber`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerData`
--

LOCK TABLES `CustomerData` WRITE;
/*!40000 ALTER TABLE `CustomerData` DISABLE KEYS */;
INSERT INTO `CustomerData` VALUES (2,'No Peanuts'),(4,'Vegan'),(7,'Vegatirian'),(8,'Next to windows');
/*!40000 ALTER TABLE `CustomerData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerHas`
--

DROP TABLE IF EXISTS `CustomerHas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomerHas` (
  `CreditCardNo` varchar(20) NOT NULL,
  `AccNumber` int NOT NULL,
  PRIMARY KEY (`CreditCardNo`),
  UNIQUE KEY `CreditCardNo_UNIQUE` (`CreditCardNo`),
  KEY `AccNumber` (`AccNumber`),
  CONSTRAINT `CustomerHas_ibfk_1` FOREIGN KEY (`AccNumber`) REFERENCES `Accounts` (`AccNumber`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerHas`
--

LOCK TABLES `CustomerHas` WRITE;
/*!40000 ALTER TABLE `CustomerHas` DISABLE KEYS */;
INSERT INTO `CustomerHas` VALUES ('2147483647',1),('349968031430901',1),('372487401547566',2),('371173068898465',4),('370313073426552',7),('371173068826979',8);
/*!40000 ALTER TABLE `CustomerHas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `AccNumber` int NOT NULL,
  `SSN` int NOT NULL,
  `StartDate` datetime NOT NULL,
  `HourlyRate` double NOT NULL,
  PRIMARY KEY (`SSN`),
  UNIQUE KEY `AccNumber_UNIQUE` (`AccNumber`),
  CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`AccNumber`) REFERENCES `Accounts` (`AccNumber`) ON DELETE CASCADE,
  CONSTRAINT `Employee_chk_1` CHECK ((`HourlyRate` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,575071111,'2021-12-19 00:00:00',35),(3,575071112,'2021-12-19 00:00:00',35),(5,575071113,'2021-12-19 00:00:00',24),(6,575071114,'2021-12-19 00:00:00',24);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fare`
--

DROP TABLE IF EXISTS `Fare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fare` (
  `TotalFare` decimal(32,0) DEFAULT NULL,
  `AccNumber` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fare`
--

LOCK TABLES `Fare` WRITE;
/*!40000 ALTER TABLE `Fare` DISABLE KEYS */;
INSERT INTO `Fare` VALUES (2220,2),(2720,4),(740,7),(1480,8);
/*!40000 ALTER TABLE `Fare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FlightFares`
--

DROP TABLE IF EXISTS `FlightFares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FlightFares` (
  `ALID` char(5) NOT NULL,
  `FLNO` int NOT NULL,
  `Fare` char(20) DEFAULT NULL,
  `AdvancedPurchase` char(20) DEFAULT NULL,
  `LengthOfStay` char(20) DEFAULT NULL,
  PRIMARY KEY (`ALID`,`FLNO`),
  KEY `FLNO` (`FLNO`),
  CONSTRAINT `FlightFares_ibfk_1` FOREIGN KEY (`ALID`) REFERENCES `Airlines` (`ALID`),
  CONSTRAINT `FlightFares_ibfk_2` FOREIGN KEY (`FLNO`) REFERENCES `Flights` (`FLNO`),
  CONSTRAINT `FlightFares_chk_1` CHECK ((`Fare` >= 0)),
  CONSTRAINT `FlightFares_chk_2` CHECK ((`AdvancedPurchase` >= 0)),
  CONSTRAINT `FlightFares_chk_3` CHECK ((`LengthOfStay` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FlightFares`
--

LOCK TABLES `FlightFares` WRITE;
/*!40000 ALTER TABLE `FlightFares` DISABLE KEYS */;
INSERT INTO `FlightFares` VALUES ('11',111,'$740','7 days',''),('12',112,'$200',NULL,'Minimum: 3'),('13',113,'$1160','21 days','Maximum: 7'),('13',114,'$740','7 days',NULL);
/*!40000 ALTER TABLE `FlightFares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flights`
--

DROP TABLE IF EXISTS `Flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Flights` (
  `FLNO` int NOT NULL,
  `NumOfSeats` int NOT NULL,
  `ALID` char(5) NOT NULL,
  `DayOfWeek` char(20) DEFAULT NULL,
  PRIMARY KEY (`FLNO`),
  KEY `Flights_ibfk_1` (`ALID`),
  CONSTRAINT `Flights_ibfk_1` FOREIGN KEY (`ALID`) REFERENCES `Airlines` (`ALID`),
  CONSTRAINT `Flights_chk_1` CHECK ((`NumOfSeats` >= 0)),
  CONSTRAINT `Flights_chk_2` CHECK (((`DayOfWeek` <= 7) and (`DayOfWeek` >= 1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flights`
--

LOCK TABLES `Flights` WRITE;
/*!40000 ALTER TABLE `Flights` DISABLE KEYS */;
INSERT INTO `Flights` VALUES (111,900,'11','1, 3, 5'),(112,700,'12','2, 4'),(113,500,'13','6, 7'),(114,900,'11','3, 5');
/*!40000 ALTER TABLE `Flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Legs`
--

DROP TABLE IF EXISTS `Legs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Legs` (
  `ResNo` int NOT NULL,
  `FLNO` int NOT NULL,
  `ALID` char(5) NOT NULL,
  `FromAirport` char(200) NOT NULL,
  `ToAirport` char(200) NOT NULL,
  `Class` char(10) NOT NULL,
  `DepDatetime` datetime NOT NULL,
  `SpecialMeal` varchar(22) DEFAULT NULL,
  `ArrDatetime` datetime NOT NULL,
  PRIMARY KEY (`ResNo`),
  KEY `FLNO` (`FLNO`),
  KEY `Legs_ibfk_2` (`ALID`),
  CONSTRAINT `Legs_ibfk_1` FOREIGN KEY (`ResNo`) REFERENCES `ReservationData` (`ResNo`),
  CONSTRAINT `Legs_ibfk_2` FOREIGN KEY (`ALID`) REFERENCES `Airlines` (`ALID`),
  CONSTRAINT `Legs_ibfk_3` FOREIGN KEY (`FLNO`) REFERENCES `Flights` (`FLNO`),
  CONSTRAINT `Legs_chk_1` CHECK (((`Class` = _utf8mb4'ECONOMY') or (`Class` = _utf8mb4'BUSINESS') or (`Class` = _utf8mb4'FIRST')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Legs`
--

LOCK TABLES `Legs` WRITE;
/*!40000 ALTER TABLE `Legs` DISABLE KEYS */;
INSERT INTO `Legs` VALUES (1,111,'11','HNL','JFK','Business','2021-10-20 01:00:00','Vegetarian','2021-10-22 01:00:00'),(2,112,'12','HNL','LHR','Economy','2021-11-21 02:00:00','','2021-11-23 03:00:00'),(3,113,'13','LHR','JFK','First','2021-12-18 03:00:00','Vegan','2021-12-20 05:00:00'),(4,114,'11','JFK','HNL','Business','2021-10-23 01:00:00','Peanuts Allergy','2021-10-25 01:00:00'),(5,111,'11','HNL','JFK','Business','2021-10-20 01:00:00',NULL,'2021-10-22 01:00:00'),(6,111,'11','HNL','JFK','Business','2020-10-20 01:00:00',NULL,'2020-10-22 01:00:00');
/*!40000 ALTER TABLE `Legs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lives`
--

DROP TABLE IF EXISTS `Lives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Lives` (
  `AccNumber` int NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `State` char(2) DEFAULT NULL,
  `ZIPCode` int NOT NULL,
  PRIMARY KEY (`AccNumber`),
  CONSTRAINT `Lives_ibfk_1` FOREIGN KEY (`AccNumber`) REFERENCES `Contact` (`AccNumber`),
  CONSTRAINT `Lives_ibfk_2` FOREIGN KEY (`AccNumber`) REFERENCES `Accounts` (`AccNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lives`
--

LOCK TABLES `Lives` WRITE;
/*!40000 ALTER TABLE `Lives` DISABLE KEYS */;
INSERT INTO `Lives` VALUES (1,'92 Palahia St #V104','Kapolei','HI',96707),(2,'95-181 Wainaku Pl','Mililani','HI',96789),(3,'91-1033 Kaiapo St','Ewa Beach','HI',93384),(4,'46-034 Puulena St #APT 724','Kaneohe','HI',96486),(5,'6405 101st St','Ewa Beach','HI',97856),(6,'1160 Radar Hill Rd','Honolulu','HI',94682),(7,'1165 Radar Hill Rd','Honolulu','HI',94683),(8,'6409 101st St','Honolulu','HI',94681);
/*!40000 ALTER TABLE `Lives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OperatedBy`
--

DROP TABLE IF EXISTS `OperatedBy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OperatedBy` (
  `ALID` char(5) NOT NULL,
  `FLNO` int NOT NULL,
  PRIMARY KEY (`ALID`,`FLNO`),
  KEY `FLNO` (`FLNO`),
  CONSTRAINT `OperatedBy_ibfk_1` FOREIGN KEY (`ALID`) REFERENCES `Airlines` (`ALID`) ON DELETE CASCADE,
  CONSTRAINT `OperatedBy_ibfk_2` FOREIGN KEY (`FLNO`) REFERENCES `Flights` (`FLNO`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OperatedBy`
--

LOCK TABLES `OperatedBy` WRITE;
/*!40000 ALTER TABLE `OperatedBy` DISABLE KEYS */;
INSERT INTO `OperatedBy` VALUES ('11',111),('12',112),('13',113);
/*!40000 ALTER TABLE `OperatedBy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Portfolio`
--

DROP TABLE IF EXISTS `Portfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portfolio` (
  `AccNumber` int NOT NULL,
  `ResNo` int NOT NULL,
  PRIMARY KEY (`ResNo`),
  UNIQUE KEY `ResNo_UNIQUE` (`ResNo`),
  CONSTRAINT `Portfolio_ibfk_2` FOREIGN KEY (`ResNo`) REFERENCES `ReservationData` (`ResNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Portfolio`
--

LOCK TABLES `Portfolio` WRITE;
/*!40000 ALTER TABLE `Portfolio` DISABLE KEYS */;
INSERT INTO `Portfolio` VALUES (2,1),(4,2),(4,3),(7,4),(8,5),(8,6);
/*!40000 ALTER TABLE `Portfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReservationData`
--

DROP TABLE IF EXISTS `ReservationData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ReservationData` (
  `ResNo` int NOT NULL,
  `ResDate` varchar(100) NOT NULL,
  `Passengers` varchar(100) NOT NULL,
  `TotalFare` int NOT NULL,
  `FareRestriction` varchar(100) DEFAULT NULL,
  `FlightType` varchar(45) DEFAULT NULL,
  `Domestic` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ResNo`),
  CONSTRAINT `ReservationData_chk_1` CHECK ((`Passengers` > 0)),
  CONSTRAINT `ReservationData_chk_2` CHECK ((`TotalFare` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReservationData`
--

LOCK TABLES `ReservationData` WRITE;
/*!40000 ALTER TABLE `ReservationData` DISABLE KEYS */;
INSERT INTO `ReservationData` VALUES (1,'2021-10-13','3',2220,'Advanced Purchase: 7 days','Round-Trip','Domestic','Reserved'),(2,'2021-11-19','2',400,'Minimum Stay: 3 days','One-Way','International','Reserved'),(3,'2021-11-18','2',2320,'Advanced Purchase: 21 days Maxiimum Stay: 7 days','One-Way','International','Reserved'),(4,'2021-10-16','1',740,'Advanced Purchase: 7 days','Round-Trip','Domestic','Reserved'),(5,'2021-10-13','1',740,'Advanced Purchase: 7 days','Round-Trip','Domestic','Reserved'),(6,'2020-10-13','1',740,'Advanced Purchase: 7 days','Round-Trip','Domestic','Historical');
/*!40000 ALTER TABLE `ReservationData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seats`
--

DROP TABLE IF EXISTS `Seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Seats` (
  `SeatPK` int NOT NULL AUTO_INCREMENT,
  `ResNo` int NOT NULL,
  `SeatNo` varchar(5) NOT NULL,
  PRIMARY KEY (`SeatPK`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seats`
--

LOCK TABLES `Seats` WRITE;
/*!40000 ALTER TABLE `Seats` DISABLE KEYS */;
INSERT INTO `Seats` VALUES (1,1,'K23'),(2,1,'K21'),(3,1,'K22'),(4,2,'A11'),(5,2,'A12'),(6,3,'B13'),(7,3,'B14'),(8,4,'J4'),(9,5,'L5');
/*!40000 ALTER TABLE `Seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StopsAt`
--

DROP TABLE IF EXISTS `StopsAt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `StopsAt` (
  `APID` char(3) NOT NULL,
  `FLNO` int NOT NULL,
  `ALID` char(5) NOT NULL,
  `ArrivalTime` datetime NOT NULL,
  `DepartTime` datetime NOT NULL,
  PRIMARY KEY (`ALID`,`FLNO`,`APID`),
  KEY `FLNO` (`FLNO`),
  CONSTRAINT `StopsAt_ibfk_2` FOREIGN KEY (`FLNO`) REFERENCES `Flights` (`FLNO`),
  CONSTRAINT `StopsAt_ibfk_3` FOREIGN KEY (`ALID`) REFERENCES `Airlines` (`ALID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StopsAt`
--

LOCK TABLES `StopsAt` WRITE;
/*!40000 ALTER TABLE `StopsAt` DISABLE KEYS */;
INSERT INTO `StopsAt` VALUES ('JFK',111,'11','2021-10-22 01:00:00','2021-10-20 01:00:00'),('HNL',114,'11','2021-10-25 01:00:00','2021-10-23 01:00:00'),('LHR',112,'12','2021-11-23 03:00:00','2021-11-21 02:00:00'),('JFK',111,'13','2021-12-20 05:00:00','2021-12-18 03:00:00');
/*!40000 ALTER TABLE `StopsAt` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-20 23:26:20
