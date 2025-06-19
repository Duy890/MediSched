-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: medisched
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appointment_date` date DEFAULT NULL,
  `appointment_time` time(6) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `status` enum('APPROVED','NOT_APPROVED','PENDING','REJECTED','COMPLETED') DEFAULT NULL,
  `doctor_id` bigint DEFAULT NULL,
  `patient_id` bigint DEFAULT NULL,
  `payment_method` enum('CASH','ONLINE') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKoeb98n82eph1dx43v3y2bcmsl` (`doctor_id`),
  KEY `FK4apif2ewfyf14077ichee8g06` (`patient_id`),
  CONSTRAINT `FK4apif2ewfyf14077ichee8g06` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  CONSTRAINT `FKoeb98n82eph1dx43v3y2bcmsl` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (13,'2025-06-05','15:00:00.000000','Cần tư vấn chấn thương thể thao sau khi tập gym – đau vùng vai','COMPLETED',9,10,'ONLINE');
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Responsible for diagnosing and treating heart conditions','Cardiology'),(2,'The Dermatology Department specializes in diagnosing and treating skin, hair, nail, and sexually transmitted conditions.','Dermatology'),(3,'Chuyên điều trị các bệnh liên quan đến xương khớp','Orthopedics'),(4,'Chẩn đoán và điều trị các bệnh tiêu hóa','Gastroenterology'),(5,'Chuyên khám và điều trị cho trẻ em','Pediatrics'),(6,'Khoa chăm sóc sức khỏe phụ nữ','Gynecology'),(7,'Điều trị các bệnh về mắt','Ophthalmology'),(8,'Chuyên điều trị các bệnh liên quan đến xương khớp','Orthopedics'),(9,'Chẩn đoán và điều trị các bệnh tiêu hóa','Gastroenterology'),(10,'Chuyên khám và điều trị cho trẻ em','Pediatrics'),(11,'Khoa chăm sóc sức khỏe phụ nữ','Gynecology'),(12,'Điều trị các bệnh về mắt','Ophthalmology');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `role` enum('ADMIN','DOCTOR','PATIENT','USER') DEFAULT NULL,
  `specialty` varchar(50) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `department_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dob` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` bigint DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fee` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK3q0j5r6i4e9k3afhypo6uljph` (`user_id`),
  KEY `FK75x47tyyeco3xj4cmlhj8v6ta` (`department_id`),
  CONSTRAINT `FK11wrxiolc8qa2e64s32xc2yy4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK75x47tyyeco3xj4cmlhj8v6ta` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (9,'2025-06-18 12:09:14.000000','Dr. Nguyen Minh Duc','DOCTOR','ORTHOPEDICS','2025-06-18 12:09:14.000000',6,11,'https://img.lovepik.com/free-png/20211111/lovepik-geriatric-doctor-png-image_400886089_wh1200.png','123 Clinic St','1990-01-01 00:00:00.000000','duc@example.com','Nguyen','Duc','$2a$10$2HaVIMYLG8ZbOnYtujAvXODuieEPkOfAB2wDUG0VC.qLVyY9VWPEK',909123456,'duc','Chuyên gia phẫu thuật chỉnh hình với hơn 10 năm kinh nghiệm.',280000),(10,'2025-06-18 12:09:14.000000','Dr. Bui Van An','DOCTOR','ORTHOPEDICS','2025-06-18 12:09:14.000000',7,12,'https://taimuihongsg.com/wp-content/uploads/2019/01/Trinh-Tan-Lap_taimuihongsg.jpg','123 Clinic St','1990-01-01 00:00:00.000000','an@example.com','Bui','An','$2a$10$2HaVIMYLG8ZbOnYtujAvXODuieEPkOfAB2wDUG0VC.qLVyY9VWPEK',909123456,'an','Chuyên điều trị bệnh về dạ dày và tiêu hóa cho mọi độ tuổi.',290000),(11,'2025-06-18 12:09:14.000000','Dr. Nguyen Thi Lan','DOCTOR','Pediatrician','2025-06-18 12:09:14.000000',8,13,'https://img.lovepik.com/free-png/20210928/lovepik-female-doctor-image-png-image_401630436_wh1200.png','123 Clinic St','1990-01-01 00:00:00.000000','lan@example.com','Nguyen','Lan','$2a$10$2HaVIMYLG8ZbOnYtujAvXODuieEPkOfAB2wDUG0VC.qLVyY9VWPEK',909123456,'lan','Bác sĩ nhi tận tâm, được phụ huynh tin tưởng tại TP.HCM.',270000),(12,'2025-06-18 12:09:14.000000','Dr. Do Minh Hieu','DOCTOR','ORTHOPEDICS','2025-06-18 12:09:14.000000',9,14,'https://taimuihongsg.com/wp-content/uploads/2018/05/Kim-Bun-ThuongE_taimuihongsg.jpg','123 Clinic St','1990-01-01 00:00:00.000000','hieu@example.com','Do','Hieu','$2a$10$2HaVIMYLG8ZbOnYtujAvXODuieEPkOfAB2wDUG0VC.qLVyY9VWPEK',909123456,'hieu','Bác sĩ phụ khoa chuyên tư vấn và điều trị bệnh lý nữ giới.',260000),(13,'2025-06-18 12:09:14.000000','Dr. Hoang Van Nam','DOCTOR','ORTHOPEDICS','2025-06-18 12:09:14.000000',10,15,'https://watermark.lovepik.com/photo/20211201/large/lovepik-male-doctor-image-picture_501367339.jpg','123 Clinic St','1990-01-01 00:00:00.000000','nam@example.com','Hoang','Nam','$2a$10$2HaVIMYLG8ZbOnYtujAvXODuieEPkOfAB2wDUG0VC.qLVyY9VWPEK',909123456,'nam','Chuyên khoa Mắt – tư vấn và phẫu thuật tật khúc xạ.',310000),(14,'2025-06-18 12:09:14.000000','Dr. Tran Pham Ly','DOCTOR','ORTHOPEDICS','2025-06-18 12:09:14.000000',2,16,'https://media.sohuutritue.net.vn/files/huongmi/2023/01/27/bsi-pham-ly-0853.jpg','123 Clinic St','1990-01-01 00:00:00.000000','ly@example.com','Tran','Ly','$2a$10$2HaVIMYLG8ZbOnYtujAvXODuieEPkOfAB2wDUG0VC.qLVyY9VWPEK',909123456,'ly','Bác sĩ da liễu với kỹ năng điều trị mụn, nám và các bệnh ngoài da.',275000),(15,'2025-06-18 12:09:14.000000','Dr. Le Quoc Dung','DOCTOR','CARDIOLOGY','2025-06-18 12:09:14.000000',1,17,'https://img.lovepik.com/free-png/20211215/lovepik-male-doctor-image-png-image_401633157_wh1200.png','123 Clinic St','1990-01-01 00:00:00.000000','dung@example.com','Le','Dung','$2a$10$2HaVIMYLG8ZbOnYtujAvXODuieEPkOfAB2wDUG0VC.qLVyY9VWPEK',909123456,'dung','Chuyên khoa Tim mạch – giàu kinh nghiệm điều trị cao huyết áp và bệnh tim.',325000),(16,'2025-06-18 13:31:35.385879','Le Hoai Nam','DOCTOR','CARDIOLOGY','2025-06-18 13:31:35.385879',1,18,'https://res.cloudinary.com/dcfmbv2yz/image/upload/v1750227442/jvg2dtjgcpjmja4uf7pi.jpg','45 Nguyễn Văn Cừ, Q5, TP.HCM','2003-06-15 07:00:00.000000','2251150008@ut.edu.vn','Le','Hoai Nam','$2a$10$lJW/t296WzEmxLHNEY5Mk.8gi7kL9RCvDMgaCALbq/IhYXG8fhSWK',901001001,'hoainam001','Bác sĩ tim mạch với hơn 15 năm khám và điều trị bệnh lý tim mạch.',300000),(17,'2025-06-18 13:31:51.544634','Tran Bao Chau','DOCTOR','ORTHOPEDICS','2025-06-18 13:31:51.544634',1,19,'https://res.cloudinary.com/dcfmbv2yz/image/upload/v1750227566/n4swqoqsafrfuvbg5j2u.webp','78 Cách Mạng Tháng 8, Q10, TP.HCM','2002-11-21 07:00:00.000000','2251150008@ut.edu.vn','Tran','Bao Chau','$2a$10$WivksIIiMjvezGOhrg9wGeKmD7bgsVk9f0GHCXOTe/MewdXuk8bTK',902002002,'chautran02','Chuyên phẫu thuật chỉnh hình và điều trị chấn thương thể thao.',400000),(18,'2025-06-18 13:31:54.174336','Nguyen Thi Minh','DOCTOR','CARDIOLOGY','2025-06-18 13:31:54.174336',1,20,'https://res.cloudinary.com/dcfmbv2yz/image/upload/v1750227905/hmr0na3yjjg3wxpfh9o9.webp','12 Lê Duẩn, Q1, TP.HCM','2001-03-09 07:00:00.000000','2251150008@ut.edu.vn','Nguyen','Thi Minh','$2a$10$ZFBS6NXcl5etthxCXgVqQe8UTLEVLRPlNCXthUEeZLwWWsRMv18J.',903003003,'minhnguyen03','Chuyên gia tim mạch, tư vấn và điều trị các rối loạn nhịp tim.',400000),(19,'2025-06-18 13:31:55.546197','Pham Quang Huy','DOCTOR','PEDIATRICS','2025-06-18 13:31:55.546197',8,21,'https://res.cloudinary.com/dcfmbv2yz/image/upload/v1750228032/ocjqvx71mmmfhkecwui6.jpg','33 Trường Chinh, Q12, TP.HCM','2000-12-25 07:00:00.000000','2251150008@ut.edu.vn','Pham','Quang Huy','$2a$10$R1djXQVe9/.yO2ASe60Nteysi3IGLSEXU.guS1uxjG0rulJAkFq5a',904004004,'huypham04','Bác sĩ nhi tận tâm với phong cách nhẹ nhàng, chuyên điều trị trẻ nhỏ.',700000),(20,'2025-06-18 13:31:56.802298','Vo My Linh','DOCTOR','CARDIOLOGY','2025-06-18 13:31:56.802298',1,22,'https://res.cloudinary.com/dcfmbv2yz/image/upload/v1750228138/eohulwhabg6usjsdggns.jpg','66 Nguyễn Oanh, Gò Vấp, TP.HCM','2004-08-01 07:00:00.000000','2251150008@ut.edu.vn','Vo','My Linh','$2a$10$sZb7dMnYM.XSY8f9iAcIHeSYDPCHBZtk67s9M7b1FDlAEuXgVGH/i',905005005,'linhvo05','Bác sĩ tim mạch giàu kinh nghiệm tại bệnh viện quốc tế.',780000),(21,'2025-06-18 13:31:58.068500','Dang Tuan Kiet','DOCTOR','CARDIOLOGY','2025-06-18 13:31:58.068500',1,23,'https://res.cloudinary.com/dcfmbv2yz/image/upload/v1750228199/sovz3gpz222ffihe4tw2.jpg','9 Đặng Văn Bi, Thủ Đức, TP.HCM','2002-07-19 07:00:00.000000','2251150008@ut.edu.vn','Dang','Tuan Kiet','$2a$10$GEnHggJKsfB1mJ2fQGAcTOkFY1onZMSprFIiQct8xnm2p/QrhIu/e',906006006,'kietdang06','Tư vấn chuyên sâu và điều trị cao huyết áp, rối loạn mạch máu.',600000);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_request`
--

DROP TABLE IF EXISTS `doctor_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_request` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `end_time` time(6) DEFAULT NULL,
  `specialty` enum('ANESTHESIOLOGY','CARDIOLOGY','DENTISTRY','DERMATOLOGY','ENT','GENERAL_PRACTICE','GYNECOLOGY','NEUROLOGY','ONCOLOGY','OPHTHALMOLOGY','ORTHOPEDICS','PEDIATRICS','PSYCHIATRY','RADIOLOGY') DEFAULT NULL,
  `start_time` time(6) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `department_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `fee` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKghxc4bgprsanutivfcfyurmfw` (`user_id`),
  KEY `FKmfb5gw9o5k3p5xiiwgi7wj30a` (`department_id`),
  CONSTRAINT `FKic4n5mubjlgqoe5awco9pxh12` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKmfb5gw9o5k3p5xiiwgi7wj30a` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_request`
--

LOCK TABLES `doctor_request` WRITE;
/*!40000 ALTER TABLE `doctor_request` DISABLE KEYS */;
INSERT INTO `doctor_request` VALUES (9,'2025-06-18 13:17:22.335846','17:00:00.000000','CARDIOLOGY','09:00:00.000000','APPROVED',1,18,'https://res.cloudinary.com/dcfmbv2yz/image/upload/v1750227442/jvg2dtjgcpjmja4uf7pi.jpg','',300000),(10,'2025-06-18 13:19:26.956696','17:00:00.000000','ORTHOPEDICS','09:00:00.000000','APPROVED',1,19,'https://res.cloudinary.com/dcfmbv2yz/image/upload/v1750227566/n4swqoqsafrfuvbg5j2u.webp','',400000),(11,'2025-06-18 13:25:05.170496','17:00:00.000000','CARDIOLOGY','09:00:00.000000','APPROVED',1,20,'https://res.cloudinary.com/dcfmbv2yz/image/upload/v1750227905/hmr0na3yjjg3wxpfh9o9.webp','',400000),(12,'2025-06-18 13:27:12.561021','17:00:00.000000','PEDIATRICS','09:00:00.000000','APPROVED',8,21,'https://res.cloudinary.com/dcfmbv2yz/image/upload/v1750228032/ocjqvx71mmmfhkecwui6.jpg','',700000),(13,'2025-06-18 13:28:58.400753','17:00:00.000000','CARDIOLOGY','09:00:00.000000','APPROVED',1,22,'https://res.cloudinary.com/dcfmbv2yz/image/upload/v1750228138/eohulwhabg6usjsdggns.jpg','',780000),(14,'2025-06-18 13:30:00.167399','17:00:00.000000','CARDIOLOGY','09:00:00.000000','APPROVED',1,23,'https://res.cloudinary.com/dcfmbv2yz/image/upload/v1750228199/sovz3gpz222ffihe4tw2.jpg','',600000);
/*!40000 ALTER TABLE `doctor_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_request_days_of_week`
--

DROP TABLE IF EXISTS `doctor_request_days_of_week`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_request_days_of_week` (
  `doctor_request_id` bigint NOT NULL,
  `days_of_week` enum('FRIDAY','MONDAY','SATURDAY','SUNDAY','THURSDAY','TUESDAY','WEDNESDAY') DEFAULT NULL,
  KEY `FKdvqhsdvp159aqfxiqi5798e39` (`doctor_request_id`),
  CONSTRAINT `FKdvqhsdvp159aqfxiqi5798e39` FOREIGN KEY (`doctor_request_id`) REFERENCES `doctor_request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_request_days_of_week`
--

LOCK TABLES `doctor_request_days_of_week` WRITE;
/*!40000 ALTER TABLE `doctor_request_days_of_week` DISABLE KEYS */;
INSERT INTO `doctor_request_days_of_week` VALUES (9,'MONDAY'),(9,'WEDNESDAY'),(9,'FRIDAY'),(10,'MONDAY'),(10,'WEDNESDAY'),(10,'FRIDAY'),(11,'MONDAY'),(11,'WEDNESDAY'),(11,'FRIDAY'),(12,'MONDAY'),(12,'WEDNESDAY'),(12,'FRIDAY'),(13,'MONDAY'),(13,'WEDNESDAY'),(13,'FRIDAY'),(14,'MONDAY'),(14,'WEDNESDAY'),(14,'FRIDAY');
/*!40000 ALTER TABLE `doctor_request_days_of_week` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical_record`
--

DROP TABLE IF EXISTS `medical_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical_record` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `prescription` varchar(255) DEFAULT NULL,
  `treatment_plan` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical_record`
--

LOCK TABLES `medical_record` WRITE;
/*!40000 ALTER TABLE `medical_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `medical_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `dob` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` bigint DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `role` enum('ADMIN','DOCTOR','PATIENT','USER') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6i3fp8wcdxk473941mbcvdao4` (`user_id`),
  CONSTRAINT `FKie6vajiyur53rjcl5nc2pe83t` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (10,'18 Âu Cơ, Tân Phú, TP.HCM','2025-06-18 14:02:12.814999','2000-10-11 07:00:00.000000','nduc94009@gmail.com','Hoang','Gia Bao','$2a$10$mxZ4gSVL1AnXcES56WGtruiNcNm.WDE9C9UeftGvkYFTHQUfv8xNS',910010010,'2025-06-18 14:02:12.814999','baohoang10',27,'PATIENT');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `doctor_id` bigint DEFAULT NULL,
  `patient_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5exj952i0hvwrqsapgo01o1k3` (`doctor_id`),
  KEY `FK9lv11ny63mbk7x66uweefc65r` (`patient_id`),
  CONSTRAINT `FK5exj952i0hvwrqsapgo01o1k3` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  CONSTRAINT `FK9lv11ny63mbk7x66uweefc65r` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (3,'Bác sĩ rất tận tình và chu đáo!','2025-06-18 14:11:25.897175',5,9,10);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `end_time` time(6) DEFAULT NULL,
  `start_time` time(6) DEFAULT NULL,
  `doctor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqixlhugy7jvrwut9o2s6hqnu8` (`doctor_id`),
  CONSTRAINT `FKqixlhugy7jvrwut9o2s6hqnu8` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (8,'16:00:00.000000','08:00:00.000000',9),(9,'16:00:00.000000','08:00:00.000000',10),(10,'16:00:00.000000','08:00:00.000000',11),(11,'16:00:00.000000','08:00:00.000000',12),(12,'16:00:00.000000','08:00:00.000000',13),(13,'16:00:00.000000','08:00:00.000000',14),(14,'16:00:00.000000','08:00:00.000000',15),(15,'17:00:00.000000','09:00:00.000000',16),(16,'17:00:00.000000','09:00:00.000000',17),(17,'17:00:00.000000','09:00:00.000000',18),(18,'17:00:00.000000','09:00:00.000000',19),(19,'17:00:00.000000','09:00:00.000000',20),(20,'17:00:00.000000','09:00:00.000000',21);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule_days`
--

DROP TABLE IF EXISTS `schedule_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule_days` (
  `schedule_id` bigint NOT NULL,
  `day_of_week` enum('FRIDAY','MONDAY','SATURDAY','SUNDAY','THURSDAY','TUESDAY','WEDNESDAY') DEFAULT NULL,
  KEY `FKjyllqo39a64hu98c15rxrfw0n` (`schedule_id`),
  CONSTRAINT `FKjyllqo39a64hu98c15rxrfw0n` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule_days`
--

LOCK TABLES `schedule_days` WRITE;
/*!40000 ALTER TABLE `schedule_days` DISABLE KEYS */;
INSERT INTO `schedule_days` VALUES (8,'MONDAY'),(8,'TUESDAY'),(8,'WEDNESDAY'),(8,'THURSDAY'),(8,'FRIDAY'),(9,'MONDAY'),(9,'WEDNESDAY'),(9,'FRIDAY'),(10,'TUESDAY'),(10,'THURSDAY'),(10,'FRIDAY'),(11,'MONDAY'),(11,'TUESDAY'),(11,'WEDNESDAY'),(11,'FRIDAY'),(12,'TUESDAY'),(12,'WEDNESDAY'),(12,'THURSDAY'),(12,'FRIDAY'),(13,'MONDAY'),(13,'TUESDAY'),(13,'THURSDAY'),(13,'FRIDAY'),(14,'MONDAY'),(14,'TUESDAY'),(14,'WEDNESDAY'),(14,'THURSDAY'),(14,'FRIDAY'),(15,'MONDAY'),(15,'WEDNESDAY'),(15,'FRIDAY'),(16,'MONDAY'),(16,'WEDNESDAY'),(16,'FRIDAY'),(17,'MONDAY'),(17,'WEDNESDAY'),(17,'FRIDAY'),(18,'MONDAY'),(18,'WEDNESDAY'),(18,'FRIDAY'),(19,'MONDAY'),(19,'WEDNESDAY'),(19,'FRIDAY'),(20,'MONDAY'),(20,'WEDNESDAY'),(20,'FRIDAY');
/*!40000 ALTER TABLE `schedule_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `dob` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` bigint DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'123 Admin St','2025-05-27 14:09:38.000000','1990-01-01 00:00:00.000000','admin@example.com','Admin','User','$2a$10$2HaVIMYLG8ZbOnYtujAvXODuieEPkOfAB2wDUG0VC.qLVyY9VWPEK',1234567890,'ADMIN','2025-05-27 14:09:38.000000','admin'),(11,'123 Clinic St','2025-06-18 12:27:02.000000','1990-01-01 00:00:00.000000','duc@example.com','Nguyen','Duc','$2a$10$2HaVIMYLG8ZbOnYtujAvXODuieEPkOfAB2wDUG0VC.qLVyY9VWPEK',909123456,'DOCTOR','2025-06-18 12:27:02.000000','duc'),(12,'123 Clinic St','2025-06-18 12:27:02.000000','1990-01-01 00:00:00.000000','an@example.com','Bui','An','$2a$10$2HaVIMYLG8ZbOnYtujAvXODuieEPkOfAB2wDUG0VC.qLVyY9VWPEK',909123456,'DOCTOR','2025-06-18 12:27:02.000000','an'),(13,'123 Clinic St','2025-06-18 12:27:02.000000','1990-01-01 00:00:00.000000','lan@example.com','Nguyen','Lan','$2a$10$2HaVIMYLG8ZbOnYtujAvXODuieEPkOfAB2wDUG0VC.qLVyY9VWPEK',909123456,'DOCTOR','2025-06-18 12:27:02.000000','lan'),(14,'123 Clinic St','2025-06-18 12:27:02.000000','1990-01-01 00:00:00.000000','hieu@example.com','Do','Hieu','$2a$10$2HaVIMYLG8ZbOnYtujAvXODuieEPkOfAB2wDUG0VC.qLVyY9VWPEK',909123456,'DOCTOR','2025-06-18 12:27:02.000000','hieu'),(15,'123 Clinic St','2025-06-18 12:27:02.000000','1990-01-01 00:00:00.000000','nam@example.com','Hoang','Nam','$2a$10$2HaVIMYLG8ZbOnYtujAvXODuieEPkOfAB2wDUG0VC.qLVyY9VWPEK',909123456,'DOCTOR','2025-06-18 12:27:02.000000','nam'),(16,'123 Clinic St','2025-06-18 12:27:02.000000','1990-01-01 00:00:00.000000','ly@example.com','Tran','Ly','$2a$10$2HaVIMYLG8ZbOnYtujAvXODuieEPkOfAB2wDUG0VC.qLVyY9VWPEK',909123456,'DOCTOR','2025-06-18 12:27:02.000000','ly'),(17,'123 Clinic St','2025-06-18 12:27:02.000000','1990-01-01 00:00:00.000000','dung@example.com','Le','Dung','$2a$10$2HaVIMYLG8ZbOnYtujAvXODuieEPkOfAB2wDUG0VC.qLVyY9VWPEK',909123456,'DOCTOR','2025-06-18 12:27:02.000000','dung'),(18,'45 Nguyễn Văn Cừ, Q5, TP.HCM','2025-06-18 13:04:16.951500','2003-06-15 07:00:00.000000','2251150008@ut.edu.vn','Le','Hoai Nam','$2a$10$lJW/t296WzEmxLHNEY5Mk.8gi7kL9RCvDMgaCALbq/IhYXG8fhSWK',901001001,'DOCTOR','2025-06-18 13:31:35.416880','hoainam001'),(19,'78 Cách Mạng Tháng 8, Q10, TP.HCM','2025-06-18 13:04:29.526046','2002-11-21 07:00:00.000000','2251150008@ut.edu.vn','Tran','Bao Chau','$2a$10$WivksIIiMjvezGOhrg9wGeKmD7bgsVk9f0GHCXOTe/MewdXuk8bTK',902002002,'DOCTOR','2025-06-18 13:31:51.564620','chautran02'),(20,'12 Lê Duẩn, Q1, TP.HCM','2025-06-18 13:04:38.627142','2001-03-09 07:00:00.000000','2251150008@ut.edu.vn','Nguyen','Thi Minh','$2a$10$ZFBS6NXcl5etthxCXgVqQe8UTLEVLRPlNCXthUEeZLwWWsRMv18J.',903003003,'DOCTOR','2025-06-18 13:31:54.183326','minhnguyen03'),(21,'33 Trường Chinh, Q12, TP.HCM','2025-06-18 13:04:50.171422','2000-12-25 07:00:00.000000','2251150008@ut.edu.vn','Pham','Quang Huy','$2a$10$R1djXQVe9/.yO2ASe60Nteysi3IGLSEXU.guS1uxjG0rulJAkFq5a',904004004,'DOCTOR','2025-06-18 13:31:55.567134','huypham04'),(22,'66 Nguyễn Oanh, Gò Vấp, TP.HCM','2025-06-18 13:04:57.371483','2004-08-01 07:00:00.000000','2251150008@ut.edu.vn','Vo','My Linh','$2a$10$sZb7dMnYM.XSY8f9iAcIHeSYDPCHBZtk67s9M7b1FDlAEuXgVGH/i',905005005,'DOCTOR','2025-06-18 13:31:56.814298','linhvo05'),(23,'9 Đặng Văn Bi, Thủ Đức, TP.HCM','2025-06-18 13:05:04.172353','2002-07-19 07:00:00.000000','2251150008@ut.edu.vn','Dang','Tuan Kiet','$2a$10$GEnHggJKsfB1mJ2fQGAcTOkFY1onZMSprFIiQct8xnm2p/QrhIu/e',906006006,'DOCTOR','2025-06-18 13:31:58.077502','kietdang06'),(24,'14 Nguyễn Hữu Cảnh, Bình Thạnh, TP.HCM','2025-06-18 13:05:15.907835','2001-05-04 07:00:00.000000','2251150008@ut.edu.vn','Bui','Thi Lan','$2a$10$RlaUqPmWbkNUbRxIFojRx.ca.Jewf.JSc2lqa6gtbcyxHBk0Pk1B.',907007007,'USER','2025-06-18 13:05:15.907835','lanbui07'),(25,'29 Hoàng Văn Thụ, Phú Nhuận, TP.HCM','2025-06-18 13:05:21.740455','2003-09-30 07:00:00.000000','2251150008@ut.edu.vn','Tran','Anh Khoa','$2a$10$GWhqHdTlkKYT1/AUEuzHzOwMyhdxtz8CYQha4q8XFkUB1FlzMuduO',908008008,'USER','2025-06-18 13:05:21.740455','khoatran08'),(26,'101 Lý Thường Kiệt, Tân Bình, TP.HCM','2025-06-18 13:05:28.302303','2004-01-20 07:00:00.000000','2251150008@ut.edu.vn','Do','Ngoc Mai','$2a$10$0ZfcgFPiO7xFiuvy2SbRweErJpQW6Kbj9oe9TOdx/viDT41D3EpRq',909009009,'USER','2025-06-18 13:05:28.302303','maidong09'),(27,'18 Âu Cơ, Tân Phú, TP.HCM','2025-06-18 13:05:37.819687','2000-10-11 07:00:00.000000','nduc94009@gmail.com','Hoang','Gia Bao','$2a$10$mxZ4gSVL1AnXcES56WGtruiNcNm.WDE9C9UeftGvkYFTHQUfv8xNS',910010010,'PATIENT','2025-06-18 14:02:12.865011','baohoang10'),(28,'18 Âu Cơ, Tân Phú, TP.HCM','2025-06-18 13:47:45.897303','2000-10-11 07:00:00.000000','nduc94009@gmail.com','Le','Hoang Duc','$2a$10$PemoWxyCJfUfXAa1O8AAjefJx1zeBFKKbrfM65E26lgskqTL3pmAW',910010010,'USER','2025-06-18 13:47:57.189903','hoangduc');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-18 14:41:57
