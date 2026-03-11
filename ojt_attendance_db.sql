-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ojt_attendance_db
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (1,'mtcc.ojt@g.batstate-u.edu.ph','$2a$10$ocqUu4Krt7MgTGmxdnSy9O0aqG5qtUowongqN54UoCd6OBA.bGGSu','2026-03-10 03:36:57','2026-03-10 03:36:57');
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance_logs`
--

DROP TABLE IF EXISTS `attendance_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `student_id` int unsigned NOT NULL,
  `student_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Time In','Time Out') COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_accomplishment` text COLLATE utf8mb4_unicode_ci,
  `is_overtime` tinyint(1) NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_student_id` (`student_id`),
  KEY `idx_timestamp` (`timestamp`),
  KEY `idx_status` (`status`),
  KEY `idx_student_date` (`student_id`,`timestamp`),
  CONSTRAINT `fk_attendance_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=660 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance_logs`
--

LOCK TABLES `attendance_logs` WRITE;
/*!40000 ALTER TABLE `attendance_logs` DISABLE KEYS */;
INSERT INTO `attendance_logs` VALUES (6,15,'RUSSEL VINCENT V. MANALO','Time In','No task reported.',0,'2026-03-10 04:50:00'),(7,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-03-10 00:50:00'),(8,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-03-10 00:32:00'),(9,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-03-10 00:06:00'),(10,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-03-09 23:50:00'),(11,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-03-09 23:43:00'),(12,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-03-09 23:40:00'),(14,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-03-09 23:24:00'),(15,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-03-09 23:21:00'),(16,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-03-08 23:44:00'),(17,3,'ADELAIDA BALMES','Time Out','Front desk personnel - assisted clients on their material service request forms, received and evaluated clients sample before accepting it.   Check Facebook messages for new clients and inquiries.  Updated the google sheet and the MTCC log sheet.   Assisted in Urisnap project together with sir neil and co ojt.',0,'2026-03-09 10:16:00'),(18,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-03-08 23:49:00'),(19,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Entertained and assisted clients regarding FTIR testing services. - Conducted mixture experiments for the URISNAP project. - Printed sample strips for testing in the URISNAP project.',0,'2026-03-09 10:07:00'),(20,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-03-09 00:16:00'),(21,11,'JOHN CARLO M. REYES','Time Out','Assisted and Received Clients -Friontdesk; debugged final revisions on the website; printing; Email and Request Handling; ',0,'2026-03-09 10:03:00'),(22,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-03-09 00:00:00'),(23,12,'JOHN RUSSEL ACHICO','Time Out','- helped in cleaning tables and tools rack - assisted my supervisor in filling water on the rotary evaporator - cleaned the laboratory equipment after the experiment - assisted in the urisnap project ',0,'2026-03-09 09:05:00'),(24,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-03-09 09:03:00'),(25,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','- Frontdesk - Cleaned Facility - Photodocumented UriSNAP printer working - videodocumented uriSNAP printer working - modified main website - thought of possible workshop titles',0,'2026-03-09 09:04:00'),(26,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-03-09 00:16:00'),(27,9,'GWYNETH FANER','Time Out','-naghelp kay sir neil sa Urisnap  -naghelp kay maam indi sa documenta ng urisnap at files A 2026 -nagupit ng filter paper -nagclean ng beakers ',0,'2026-03-09 09:04:00'),(28,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-03-09 00:16:00'),(29,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','Washed cleaning materials such as gloves, rags, and mouse pads.  Cleaned the bookshelf, tables, and tools table.',0,'2026-03-09 09:04:00'),(30,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-03-09 00:29:00'),(31,7,'DEO CRIS M. TUTOR','Time Out','1. Assisted Cris and Emman to wash the used mechanical gloves used in UTM. 2. Cooperated to the URISNAP project of Sir Niel.  ',0,'2026-03-09 09:01:00'),(34,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-03-08 22:43:00'),(35,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-03-06 01:04:00'),(36,4,'AKIKO MAJI DANGCA','Time Out','-expe urisnap -attended seminar -took a photo for delivery report -inquired aboutquotation -washed equipments',0,'2026-03-06 09:08:00'),(37,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-03-05 23:21:00'),(38,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','06 - heavily modified the new revamped main mtcc website - carried office furnitures up to the fourth floor - Photodocumented Tour of DBM - Gave tour to one of the members of DBM who wasnt apart of the first group that was toured - Assisted Client (ROA #26)  - Photodocumented delivery for delivery report ',0,'2026-03-06 09:07:00'),(39,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-03-06 00:16:00'),(40,12,'JOHN RUSSEL ACHICO','Time Out','- Carried the new arrival packages to the fourth floor building of Steer Hub. - Assisted in the front desk inqueries. - Put back the equipments of laboratory in their disignated box.',0,'2026-03-06 09:07:00'),(41,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-03-06 00:53:00'),(42,11,'JOHN CARLO M. REYES','Time Out','Assistance on Lifting Furniture for MTCC; Received Clients, Visitors, Inquiries; Explained Services of MTCC; Assistance on Email Queries; Front Desk Tasks  TODAY: 7 Hours and 30 Minutes',0,'2026-03-06 09:06:00'),(43,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-03-06 00:17:00'),(44,7,'DEO CRIS M. TUTOR','Time Out','1. Help carry the newly delivered furniture for MTCC Office and bring them to fourth floor 2. Front Desk in charge. 3. Scanned FTIR documents. ',0,'2026-03-06 09:05:00'),(45,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-03-05 23:54:00'),(46,15,'RUSSEL VINCENT V. MANALO','Time Out','Assisted in conducting laboratory experiments related to the URISNAP study.  Cleaned and organized laboratory equipment after experimental procedures.  Posted content on the MTCC Facebook page for updates and information dissemination.',0,'2026-03-06 09:05:00'),(47,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-03-06 02:42:00'),(48,10,'JOHANNA LYN R. BELO','Time Out','- Attended the Women for Stem event',0,'2026-03-06 09:04:00'),(49,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-03-05 23:42:00'),(50,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Responded to walk-in and email inquiries, providing clear and professional assistance to clients. - Assisted in project-related activities under the URISNAP program - Cleaned and maintained laboratory equipment to ensure proper functionality and compliance with safety standards. ',0,'2026-03-06 09:04:00'),(51,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-03-06 05:11:00'),(52,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','Clean the laboratory equipment   Assist client / Front Desk   ',0,'2026-03-06 09:04:00'),(53,14,'MHELFIN KEY CARANDANG','Time In','Ongoing...',0,'2026-03-05 23:48:00'),(54,14,'MHELFIN KEY CARANDANG','Time Out','Responded to walk-in and email inquiries, providing clear and professional assistance to clients. Assisted in project-related activities under the URISNAP program Cleaned and maintained laboratory equipment to ensure proper functionality and compliance with safety standards. ',0,'2026-03-06 09:02:00'),(55,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-03-05 23:56:00'),(56,3,'ADELAIDA BALMES','Time Out','Checked Facebook messages and Emails to make sure all inquiries and clients questions are answered.   Assisted in UriSnap project with Co-Ojts and Sir Neil.',0,'2026-03-06 04:01:00'),(57,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-03-05 01:00:00'),(58,11,'JOHN CARLO M. REYES','Time Out','Front Desk, Print, Received Clients 7 hours Work Today Half Day Yesterday (March 04)',0,'2026-03-05 09:01:00'),(59,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-03-04 23:32:00'),(60,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','- printed more borchure - printed more callcards - photodocumented visitation from Line Seiki - modified the new revamped main mtcc website',0,'2026-03-05 09:01:00'),(61,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-03-05 00:37:00'),(62,12,'JOHN RUSSEL ACHICO','Time Out','- Cut the calling card paper for the visitors - Assisted in Front desk - Assisted in typing of documents in laptop',0,'2026-03-05 09:01:00'),(63,14,'MHELFIN KEY CARANDANG','Time In','Ongoing...',0,'2026-03-05 00:33:00'),(64,14,'MHELFIN KEY CARANDANG','Time Out','- Replied to clients regarding FTIR inquiries by providing details on procedures, requirements, and sample submission guidelines. - Attended FTIR training and conducted testing on client samples - Edited and processed signed request forms submitted by clients - Evaluated and pre-assessed samples prior to FTIR analysis to confirm suitability and proper preparation for testing.',0,'2026-03-05 09:00:00'),(65,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-03-05 00:46:00'),(66,7,'DEO CRIS M. TUTOR','Time Out','1. In charge in front desk and assisted 2 clients for FTIR services.  2. I scanned documents.  3. Oriented by ma\'am Indi in FTIR testing.  ',0,'2026-03-05 09:00:00'),(67,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-03-04 23:56:00'),(68,3,'ADELAIDA BALMES','Time Out','Check Facebook and Email messages to see if there are new inquiries or clients. ',0,'2026-03-05 09:00:00'),(69,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-03-04 23:47:00'),(70,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Replied to clients regarding FTIR inquiries by providing details on procedures, requirements, and sample submission guidelines. - Attended FTIR training and conducted testing on client samples - Edited and processed signed request forms submitted by clients - Evaluated and pre-assessed samples prior to FTIR analysis to confirm suitability and proper preparation for testing.',0,'2026-03-05 09:00:00'),(71,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-03-05 00:07:00'),(72,10,'JOHANNA LYN R. BELO','Time Out','- Attended FTIR training - Wash the laboratory untensils - cut out the calling card of MTCC',0,'2026-03-05 09:00:00'),(75,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-03-04 23:52:00'),(76,15,'RUSSEL VINCENT V. MANALO','Time Out','- Cut printed calling cards for distribution.  - Attended a training on how to operate the FTIR (Fourier Transform Infrared Spectroscopy) instrument.  - Designed and laid out content for the Facebook page.  - Posted finalized content on the Facebook page.  - Cleaned laboratory equipment.',0,'2026-03-05 09:00:00'),(77,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-03-05 00:08:00'),(78,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','Arranged the printed brochures for MTCC services.  Cleaned the laboratory equipment.',0,'2026-03-05 08:58:00'),(79,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-03-05 04:37:00'),(80,4,'AKIKO MAJI DANGCA','Time Out','-created a caption for posting -naghugas ng equipments -nag-email ng suppliers for market study',0,'2026-03-05 08:58:00'),(81,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-03-04 00:39:00'),(82,10,'JOHANNA LYN R. BELO','Time Out','- Usherette for open house in SteerHub - cut the contact card  - prepared the brochure ',0,'2026-03-04 09:01:00'),(83,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-03-04 00:15:00'),(84,9,'GWYNETH FANER','Time Out','-front desk -help in making  b brochure',0,'2026-03-04 09:01:00'),(85,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-03-04 03:58:00'),(86,4,'AKIKO MAJI DANGCA','Time Out','-market study about trolley -naglagay pictures sa canva for february\'s clients -orient about the equipments in mtcc ',0,'2026-03-04 09:01:00'),(87,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-03-03 23:55:00'),(88,15,'RUSSEL VINCENT V. MANALO','Time Out','- Designed and created a customized photo frame layout for posting clients’ pictures for the month of February. - Discussed and explained the principles and applications of FTIR and UV-Vis spectroscopy to visitors during the SteerHub Open House event.',0,'2026-03-04 09:01:00'),(89,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-03-03 23:55:00'),(90,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Replied to email inquiries by providing clear information about laboratory services, procedures, and other client concerns. - Prepared materials and discussed MTCC and its available services with visitors during World Engineering Day, explaining the laboratory’s testing capabilities and answering questions.',0,'2026-03-04 09:01:00'),(91,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-03-04 00:04:00'),(92,7,'DEO CRIS M. TUTOR','Time Out','1. I took photos of our visitors and staff when the MTCC office declared Open House on World Engineering Day (Wednesday). 2. I take over the UTM area as staff to explain the functions and methods of the machine as well as the Hardness Test and Moisture Test. 3. I also took over the Centrifuge Area for once.  4. I take over the calibration area twice.  ',0,'2026-03-04 09:01:00'),(93,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-03-03 23:52:00'),(94,3,'ADELAIDA BALMES','Time Out','MTCC had an Open House because of Wolrd Engineering Day. I discussed the Material Testing Section which includes the function of Universal Testing Machine, why it\'s important and the different types of tests available. Together with the Moisture Test and Hardness Test.   I also checked the mails and FB messages for new inquiries and clients of MTCC.',0,'2026-03-04 09:00:00'),(95,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-03-04 00:17:00'),(96,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','I do discussion and presenting equipment in the mtcc, Because Its engineering day   Presenting na mechanism of Hardness tester(durometer) and moisture tester ',0,'2026-03-04 09:00:00'),(99,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-03-03 23:59:00'),(100,12,'JOHN RUSSEL ACHICO','Time Out','- Assisted in folding brochures - Talk to visitors all about the calibration services',0,'2026-03-04 09:00:00'),(101,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-03-03 23:27:00'),(102,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','World engineering day preparation and hosting for open house',0,'2026-03-04 09:00:00'),(103,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-03-03 23:34:00'),(104,11,'JOHN CARLO M. REYES','Time Out','STEM-A-THON AND ASCEND 2026, fixed lost database, debugging',0,'2026-03-04 08:44:00'),(105,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-03-03 00:05:00'),(106,7,'DEO CRIS M. TUTOR','Time Out','1. I do a test on Hardness and Moisture.  2. I do check the UTM chain and other parts about the strange sound coming from it. And put some oil for lubrication to lessen the noise.  3. I do get the average of test reading in hardness and moisture. ',0,'2026-03-03 09:11:00'),(107,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-03-02 23:33:00'),(108,3,'ADELAIDA BALMES','Time Out','Assisted in UriSnap experiments together with Sir Neil and Co-OJT\'s  Test the sample of clients (Compressive Test) using UTM.   Prepared the ROA#18 and ROA#21, signed and checked by Sir Miggy. ',0,'2026-03-03 09:06:00'),(109,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-03-03 00:14:00'),(110,12,'JOHN RUSSEL ACHICO','Time Out','- Dry the equipments in laboratory - Assisted on setting up the printer for the URISNAP Project - Delivered Laptop to our Supervisor in BSU Main Campus - Assisted on adding grease on the chain of the UTM Machine - Assisting on cleaning and relocations of the things in the office for tomorrow’s World Engineering Day',0,'2026-03-03 09:06:00'),(111,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-03-03 00:02:00'),(112,10,'JOHANNA LYN R. BELO','Time Out','- help in the urisnap  - wash all the laboratory equipments ',0,'2026-03-03 09:03:00'),(113,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-03-02 23:12:00'),(114,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','03 - Fire prevention drill - started developing MTCC main website - printed IDs - did moisture test roa 18 - hardness test roa 18 - edited poster for new announcement for freeze dryer and rotary evaporator - clean lab for world engineering day',0,'2026-03-03 09:02:00'),(115,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-03-02 23:59:00'),(116,11,'JOHN CARLO M. REYES','Time Out','Printed ID, received clients, update statues of clients, fire drill',0,'2026-03-03 09:02:00'),(117,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-03-03 00:31:00'),(118,9,'GWYNETH FANER','Time Out','-frontdesk assist of clientsss',0,'2026-03-03 09:02:00'),(121,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-03-02 23:54:00'),(122,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Replied to client emails by addressing inquiries clearly and providing necessary information regarding laboratory services and procedures. - Assisted in the URISNAP project by supporting ongoing tasks, coordinating with team members, and helping with testing or documentation as needed.',0,'2026-03-03 08:22:00'),(123,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-03-01 23:54:00'),(124,7,'DEO CRIS M. TUTOR','Time Out','1. Help Cielo to calibrate the last 3 DC Power Supply 2. I wash the 1 beaker used by ma\'am Indi in lab Experiment 3. Perform UTM in compressive test and Demonstrated to co-OJT\'s student how it properly operate the Machine 4. Also Demonstrated Flexural Test in our Co-OJT\'s that didn\'t perform yet.  5. Cleaned those samples and help to carry out of the Lab 6. Help client to carry hollow blocks sample going to the Office ',0,'2026-03-02 09:02:00'),(125,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-03-02 00:22:00'),(126,3,'ADELAIDA BALMES','Time Out','Assisted in UriSnap project experiments.  Performed UTM (Compressive Test) for Roa 21.  Made na Report of Analysis for Roa#21 and also its Raw Data. Also sent the soft copy of it to the client.',0,'2026-03-02 09:01:00'),(127,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-03-02 00:13:00'),(128,10,'JOHANNA LYN R. BELO','Time Out','- perform UTM - perform flexural test - help in FTIR to wash the laboratory equipments',0,'2026-03-02 09:00:00'),(129,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-03-01 23:45:00'),(130,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Conducted trial activities for the URISNAP project focusing on printer ink performance and testing.  - Calibrated DC and AC power supplies to ensure proper functionality and accurate output.  - Assisted in the release of ROA results by helping with documentation and verification.  - Performed UTM testing, including compressive strength tests for hollow blocks and flexural tests for roofing materials.',0,'2026-03-02 09:00:00'),(131,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-03-01 23:30:00'),(132,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','- Calibrated 1 DC power Suuply - Clean laboratory equipments - refilled solutions for UriSnap - Photodocumented Roa 20 and 21 - Executed Flextural and compression test on Roa 20 and 21 - Disposed mess from testing',0,'2026-03-02 09:00:00'),(133,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-03-01 23:47:00'),(134,11,'JOHN CARLO M. REYES','Time Out','Front Desk, Administrative Works, received clients, encoded client data, debugging, UTM, Document, Nahiwa Ng bala Ng stapler (clinic)',0,'2026-03-02 09:00:00'),(135,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-03-02 00:19:00'),(136,12,'JOHN RUSSEL ACHICO','Time Out','-Carried the Hollow Blocks Material Samples -Tested the Hollow Blocks by using UTM Machine for Tensile Strength',0,'2026-03-02 09:00:00'),(137,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-03-01 23:54:00'),(138,9,'GWYNETH FANER','Time Out','-front desk -Assist on making request form 20-22 -perform utm in compresive test 12 samples ',0,'2026-03-02 09:00:00'),(141,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-27 00:12:00'),(142,12,'JOHN RUSSEL ACHICO','Time Out','-Input Data on Gsheet on the Newly Arrived DC Power Supply and AC Power Supply -Assit Clients on front desk - Check data’s on gsheet ',0,'2026-02-27 09:02:00'),(143,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-02-26 23:57:00'),(144,15,'RUSSEL VINCENT V. MANALO','Time Out','- Calibrated AC and DC power supplies to ensure accurate and reliable operation.  - Assisted at the front desk by accommodating inquiries and providing basic assistance as needed.',0,'2026-02-27 09:01:00'),(145,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-02-26 23:48:00'),(146,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Assisted in releasing ROAs and accommodating clients, including verifying documentation and coordinating requests  - Edited and validated signed request forms and pre-assessed FTIR samples for analysis readiness  - Calibrated DC and AC power supplies by measuring and verifying voltage and current, with proper documentation',0,'2026-02-27 09:01:00'),(147,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-27 00:03:00'),(148,11,'JOHN CARLO M. REYES','Time Out','Front Desk, debugging of website, tried to deploy website through Render, inputted data for ROA, Received Clients',0,'2026-02-27 09:00:00'),(149,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-27 01:11:00'),(150,3,'ADELAIDA BALMES','Time Out','Calibrated DC and AC power supply. ',0,'2026-02-27 08:59:00'),(151,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-26 23:06:00'),(152,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','- Frontdesk - Encoded Calbiration Equipment Receiving Form to Excel',0,'2026-02-27 06:00:00'),(153,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-02-25 23:47:00'),(154,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Conducted experimental trials for the URISNAP project comparing PEG + ethanol and PEG + distilled water, assisted in reagent preparation, and maintained controlled laboratory conditions - Edited signed request forms and pre-assessed FTIR samples prior to analysis - Encoded readings for calibrated digital multimeters, including uncertainty values',0,'2026-02-26 09:02:00'),(155,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-25 23:49:00'),(156,12,'JOHN RUSSEL ACHICO','Time Out','- Front Desk Service for Clients - Input in Calibration Reports',0,'2026-02-26 09:02:00'),(157,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-25 23:45:00'),(158,3,'ADELAIDA BALMES','Time Out','Updated the Narrative Report for Feb 18 Training.   Input the Datas of Calibration of DMM\'s for Measurement Uncertainties needed for Calibration Certificates.',0,'2026-02-26 09:00:00'),(159,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-02-25 23:57:00'),(160,15,'RUSSEL VINCENT V. MANALO','Time Out','- Conducted experimental trials for the URISNAP project to compare polyethylene glycol (PEG) + ethanol and PEG + distilled water as potential solvent systems.  - Assisted in reagent preparation and accurate measurement to ensure reliable and consistent results.  - Helped set up laboratory apparatus and maintained controlled experimental conditions during testing.',0,'2026-02-26 09:00:00'),(161,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-25 23:03:00'),(162,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','- Frontdesk Duties - Attended FTIR Practical Training - Photodocumented FTIR trainjng - Handled Attendance form for training - Created FTIR training evaluation form - Made FTIR training satisfaction rating paper - Written FTIR training Narrative report - Encoded Calibration results from different multimeters',0,'2026-02-26 09:00:00'),(165,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-26 08:58:00'),(166,11,'JOHN CARLO M. REYES','Time Out','Out Yesterday: Full Day Debugging and Encoding Final Checking of Website',0,'2026-02-26 08:59:00'),(167,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-02-25 00:07:00'),(168,9,'GWYNETH FANER','Time Out','-naggawa ng report of analysis roa #14 -finished the raw data of #13 and #14 -nagclean ng mga bote sa lab -made a calibration sticker and edit the sticker with word also print it -put stickers in the digital multimeter   - assist them in roa #14 hardness test and moisture test',0,'2026-02-25 09:01:00'),(169,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-24 23:30:00'),(170,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','- Have checklist design approved by Sir Miguii - Produced 40 checklist sheet - Provided 2 folders for empty and filled checklist sheets - Frontdesk duties - Reorganized frontdesk files - Printed new Satisfactory sheets - Validated different multimeter models',0,'2026-02-25 09:01:00'),(171,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-02-24 23:50:00'),(172,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Entertain client inquiries at the front desk and respond to emails - Release analysis reports and pre-assess samples for FTIR analysis - Check calibrated digital multimeters and verify serial numbers prior to release',0,'2026-02-25 09:01:00'),(173,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-02-25 00:10:00'),(174,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','I do moisture and Hardness Test for leather material  Check the DDM for calibration set up  Throw the water of cooling Fan Freezer  ',0,'2026-02-25 09:01:00'),(175,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-02-25 00:09:00'),(176,10,'JOHANNA LYN R. BELO','Time Out','- Test the client’s sample for hardness and moisture  - cut the process list - put a sticker on the DMM',0,'2026-02-25 09:01:00'),(177,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-25 00:23:00'),(178,12,'JOHN RUSSEL ACHICO','Time Out','- Carry Microplate Reader and UPS on the other table to be repaired and put it back on it’s designated area. - Substitute on front desk - Quality Control of Digital Multimeter that is Calibrated',0,'2026-02-25 09:00:00'),(179,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-02-24 23:55:00'),(180,15,'RUSSEL VINCENT V. MANALO','Time Out','- Organized school supplies - Sent an email using the MTCC Services Gmail informing the customer that the report of analysis is ready for pick-up - Labeled the multimeters according to their serial numbers - Helped carry equipment - Cut and prepared MTCC Services sheets ',0,'2026-02-25 09:00:00'),(183,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-25 01:13:00'),(184,11,'JOHN CARLO M. REYES','Time Out','Yesterday: Out of 12:16 PM',0,'2026-02-25 01:13:00'),(185,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-23 23:50:00'),(186,3,'ADELAIDA BALMES','Time Out','- asissted the front desk - help the clients with their concern - answer facebook inquires',0,'2026-02-24 09:05:00'),(189,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-23 23:40:00'),(190,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','- Carried biobase laboratory equipments - frontdesk duties - made frontdesk guide - made frontdesk checklist - finished ID design - photo-documented visitation from Rizal Technological Academy - printed brochures',0,'2026-02-24 09:01:00'),(191,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-02-24 00:43:00'),(192,7,'DEO CRIS M. TUTOR','Time Out','1. I assisted front desk Personnel to make request form for ROA#14 and releasing for ROA#13. 2. Taught Johanna on how to make a report of analysis paper since it is her first time and she doesn\'t know how to make one. 3. Help carried 2 huge Biobase laboratory equipments for MTCC',0,'2026-02-24 09:01:00'),(193,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-02-24 00:01:00'),(194,10,'JOHANNA LYN R. BELO','Time Out','- Assist in the front desk - Created the ROA #13 - Assisted the last costumer (ROA #15)',0,'2026-02-24 09:01:00'),(195,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-24 00:00:00'),(196,12,'JOHN RUSSEL ACHICO','Time Out','- Carry the Package - Clean the table - Assisted on folding brochures',0,'2026-02-24 09:00:00'),(197,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-02-24 00:07:00'),(198,9,'GWYNETH FANER','Time Out','-nagclean ng beaker na malaki and maliit (hind po amin  bung basag) -nagclean kami nina russel ng lamesa -nilabhan namin ung basahan and nagtapon ng hazardous waste -nagclean kami ng bote ni adelle ',0,'2026-02-24 09:00:00'),(199,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-02-24 00:08:00'),(200,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','Receive the new Deliver equipment   Clean the laboratory Utensil   Assisting Client to test for FTIR, The Sample is Coffee Bean  Make ROA for the client',0,'2026-02-24 09:00:00'),(201,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-23 23:49:00'),(202,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-02-23 00:09:00'),(203,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','Clean the facility  Test ROA 13 Using tensile test UTM  Market Research of Trolley and Push Cart',0,'2026-02-23 09:03:00'),(204,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-02-23 00:04:00'),(205,7,'DEO CRIS M. TUTOR','Time Out','1. I do assist customer today for FTIR and UTM testing  2. I do search for push cart and trolley 3 tier for office work 3. I do assist sir miggui for UTM tensile strength test of dog bone samples 4. I do teach co-ojt\'s about hardness testing and moisture testing 5. I assist Adelaida for releasing of UTM and FTIR result',0,'2026-02-23 09:01:00'),(206,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-22 23:12:00'),(207,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','Front desk duties, cleaned and organized the big lab, photo documented ROA #13. Organized the population forms folder, updated ID draft for signatures. Tagabantayng PC ni sir Nheil',0,'2026-02-23 09:00:00'),(208,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-23 00:51:00'),(209,11,'JOHN CARLO M. REYES','Time Out','Moisture Test, Hardness Test, Debugging, Personal Life Lessons incl. Marriage and Law',0,'2026-02-23 09:00:00'),(210,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-23 00:08:00'),(211,12,'JOHN RUSSEL ACHICO','Time Out','- Training for Hardness Test and Moisture Test',0,'2026-02-23 08:58:00'),(214,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-02-22 23:38:00'),(215,9,'GWYNETH FANER','Time Out','-help adel in report of analysis of concrete  -learned how to do tensile testing -we did a hardness test to ROA 11 -did a moisture test to ROA 11 -make the raw data of ROA 11 -finish the report of Analysis of ROA 11 ',0,'2026-02-23 08:58:00'),(216,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-22 23:47:00'),(217,3,'ADELAIDA BALMES','Time Out','Prepared ROA#06, ROA#10 and ROA#12 for release.   Front Desk assistant - assisted clients in their inquiries and testing samples.  - received samples for FTIR and Tensile Strength  - replied to messages in MTCCC fb acount.',0,'2026-02-23 08:55:00'),(218,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-02-19 23:48:00'),(219,4,'AKIKO MAJI DANGCA','Time Out','-assisted in urisnap -cleaned and organized the materials -utm testing for compressive strength ',0,'2026-02-20 09:09:00'),(220,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-02-19 23:58:00'),(221,7,'DEO CRIS M. TUTOR','Time Out','1. Incharge in front desk and assisting two client they inquired about UTM as well as moisture and hardness test.  2. I did test the hardness and moisture one of our client samples and do the Report of Analysis to release it immediately.  3. I did testing compressive test of hollow blocks.  4. I did also hardness test of another client\'s samples and compressive strength test. ',0,'2026-02-20 09:08:00'),(222,14,'MHELFIN KEY CARANDANG','Time In','Ongoing...',0,'2026-02-20 00:08:00'),(223,14,'MHELFIN KEY CARANDANG','Time Out','- Responded to client inquiries received through the official Facebook page, providing accurate information regarding laboratory services and testing procedures. - Assisted in project-related activities under the URISNAP program. (Accomplished a total of 300 strips) - Cleaned and maintained laboratory equipment to ensure proper functionality and adherence to safety standards. - Assisted in the operation of the Universal Testing Machine (UTM) during testing of materials sent to the laboratory. ',0,'2026-02-20 09:06:00'),(224,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-20 00:15:00'),(225,12,'JOHN RUSSEL ACHICO','Time Out','- Calibration of the equipment - Take pictures of the Results in URISNAP - Hardness Test on UTM ',0,'2026-02-20 09:04:00'),(226,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-02-19 23:49:00'),(227,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Responded to client inquiries received through the emails and assigned to the front desk to provide accurate information regarding laboratory services and testing procedures.  - Edited and prepared request forms for UTM sample testing.  - Released ROA results for FTIR analysis in accordance with laboratory procedures.  - Conducted UTM testing on various samples, focusing on compressibility measurements and data recording. ',0,'2026-02-20 09:02:00'),(228,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-19 23:49:00'),(229,3,'ADELAIDA BALMES','Time Out','Assisted CO-OJT in taking pictures of strips used in laboratory experiments for URISnap.  Assisted CO-Ojt in front desk task regarding inquiries.   Done the hardness test& moisture test for ROA09, also hardness and compressive test for ROA10-ROA12 together with CO-Ojt.   Prepared the Report fo Analysis 09 to be claimed by clients. ',0,'2026-02-20 09:00:00'),(230,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-02-20 00:17:00'),(231,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-02-18 23:57:00'),(232,15,'RUSSEL VINCENT V. MANALO','Time Out','Participated in and conducted laboratory experiments on various samples in support of the URISNAP study, ensuring proper sample preparation, handling, and documentation of results.',0,'2026-02-19 09:20:00'),(233,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-02-19 00:00:00'),(234,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','I do research and get the quotation of Mesh chair and Conference Table  ',0,'2026-02-19 09:18:00'),(235,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-02-18 23:56:00'),(236,4,'AKIKO MAJI DANGCA','Time Out','-nagtest about urisnap -material study -nagclean ng materials ',0,'2026-02-19 09:16:00'),(237,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-02-18 23:55:00'),(238,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Performed calibration of laboratory glassware and measuring equipment. - Answered walk-in and email inquiries at the front desk. - Assisted others in URISNAP project activities.',0,'2026-02-19 09:15:00'),(239,14,'MHELFIN KEY CARANDANG','Time In','Ongoing...',0,'2026-02-18 23:55:00'),(240,14,'MHELFIN KEY CARANDANG','Time Out','-Performed calibration of laboratory glassware and measuring equipment. - Answered walk-in and email inquiries at the front desk. - Assisted others in URISNAP project activities.',0,'2026-02-19 09:14:00'),(241,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-19 01:46:00'),(242,12,'JOHN RUSSEL ACHICO','Time Out','I calibrated the laboratory equipments and cleaned them after the calibration. ',0,'2026-02-19 09:13:00'),(243,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-19 01:18:00'),(244,3,'ADELAIDA BALMES','Time Out','Prepared the Narrative Report for the FTIR AND UV-Vis Microplate Reader Training held at MTCC and lead by Ma\'am Indira. ',0,'2026-02-19 09:06:00'),(245,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-02-18 23:58:00'),(246,9,'GWYNETH FANER','Time Out','-assist in making request form for UB students in frontdesk',0,'2026-02-19 09:06:00'),(247,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-02-19 00:03:00'),(248,7,'DEO CRIS M. TUTOR','Time Out','1. I do Front Desk as Front Desk Personnel 2. Assisting client for it\'s inquiry for Moisture test, hardness test, and compressive strength test 3. I do the report of analysis of materials we have to buy online 4. I release the result of our client today. ',0,'2026-02-19 09:04:00'),(249,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-18 23:34:00'),(250,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','Assisted one client briefly and conducted market research with Deo and Chris for stainless steel 3-level trolley and 1000kg-supported push trolley',0,'2026-02-19 09:02:00'),(253,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-18 23:29:00'),(254,11,'JOHN CARLO M. REYES','Time Out','Encoded 30+ Clients from 2025 | Debugged Service No Generation | Accepted 2 Clients',0,'2026-02-19 09:00:00'),(255,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-02-18 00:03:00'),(256,9,'GWYNETH FANER','Time Out','-front desk assisting 2 customer from BSU MECHANICAL ENG AND BCAS  -also learned about training of maam indi',0,'2026-02-18 09:03:00'),(257,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-02-17 23:59:00'),(258,7,'DEO CRIS M. TUTOR','Time Out','Attended training of FTIR process and material testing with different testing machine such as microplate reader.',0,'2026-02-18 09:02:00'),(259,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-02-17 23:54:00'),(260,4,'AKIKO MAJI DANGCA','Time Out','-market study -attended training regarding UV and microplates -',0,'2026-02-18 09:01:00'),(261,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-02-17 23:53:00'),(262,13,'KRISTINE CIELO S. PATISUCAN','Time Out','Attended laboratory training to learn FTIR spectrum fundamentals, including peak identification and interpretation. Gained practical experience using a microplate reader for sample measurement and data analysis.',0,'2026-02-18 09:01:00'),(263,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-02-17 23:56:00'),(264,15,'RUSSEL VINCENT V. MANALO','Time Out','Designed and posted a publication material for the MTCC Facebook page. Attended training on the operation and principles of FTIR. Attended training on the operation and principles of UV-Vis spectrophotometer. Assisted in document lamination and other minor administrative tasks.',0,'2026-02-18 09:00:00'),(265,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-17 22:45:00'),(266,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','Edited ID designs, laminated QR posters, photo-documented and attended Ma\'am Indi\'s training, and borrowed/returned TV and laminator from 2nd floor.',0,'2026-02-18 09:00:00'),(267,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-02-17 23:51:00'),(268,10,'JOHANNA LYN R. BELO','Time Out','- Laminate the poster need in the office - Attended Ma’am Indi’s training - Contributed in finishing the ROA',0,'2026-02-18 09:00:00'),(269,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-17 23:53:00'),(270,3,'ADELAIDA BALMES','Time Out','We had Training about FTIR, UV-Vis and Microplate with Ma\'am Indi.   Made the Report of Analysis #02 for Moisture Test.   Sort envelope/files according to the list. ',0,'2026-02-18 09:00:00'),(271,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-17 23:34:00'),(272,11,'JOHN CARLO M. REYES','Time Out','Encoding of 2025 Data, Fixing of several bugs on database and service table',0,'2026-02-18 09:00:00'),(273,14,'MHELFIN KEY CARANDANG','Time In','Ongoing...',0,'2026-02-17 23:51:00'),(274,14,'MHELFIN KEY CARANDANG','Time Out','- Responded to client inquiries received through the official Facebook page, providing accurate information regarding laboratory services and testing procedures. - Assisted clients with their testing requirements, including sample submission, initial assessment, and verification of sample eligibility for analysis. - Gained hands-on exposure to laboratory instrumentation, specifically the operation and application of Fourier Transform Infrared (FTIR) Spectroscopy and UV-Visible (UV-VIS) Spectrophotometry for material characterization and analysis.',0,'2026-02-18 09:00:00'),(275,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-02-18 00:01:00'),(276,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','I do front desk and assisting 2 client from different school and 1 from bsu  I accomplish the the training in FTIR Analysis & Micro plate  Prepare Qr Code and laminated the code for our attendance and Request form access     ',0,'2026-02-18 09:00:00'),(277,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-18 00:12:00'),(278,12,'JOHN RUSSEL ACHICO','Time Out','I organized the documents of the office base on the label. I carried the material samples for the testing. I laminated the QR Codes for our attendance and services of the Office. Our supervisor trained us on the functions of the instruments used in the office.',0,'2026-02-18 09:00:00'),(281,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-02-16 00:22:00'),(282,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','I do create the laboratory table to set up the DDM calibration set up  I search for a quotation of Push cart for the laboratory   Assisting picture the Strip Sample in lab',0,'2026-02-16 09:07:00'),(283,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-15 23:22:00'),(284,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','Photoshoot for publication materials, assisted on albumin photo capturing, did some cleaning and setup on the machine lab area',0,'2026-02-16 09:05:00'),(285,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-02-16 00:03:00'),(286,9,'GWYNETH FANER','Time Out','-assisting customers in front desk  - capturing chemicals for urisnap',0,'2026-02-16 09:05:00'),(287,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-16 00:03:00'),(288,12,'JOHN RUSSEL ACHICO','Time Out','I take pictures of the filter paper for the testing of albumine that is tested on the biobase',0,'2026-02-16 09:05:00'),(289,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-02-16 00:25:00'),(290,10,'JOHANNA LYN R. BELO','Time Out','- Assist in the laboratory experiment - Take pictures of the results - Assist a client ',0,'2026-02-16 09:04:00'),(291,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-15 23:52:00'),(292,11,'JOHN CARLO M. REYES','Time Out','Debugging of Website, Assisting of Clients, and FrontDesk',0,'2026-02-16 09:04:00'),(293,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-15 23:56:00'),(294,3,'ADELAIDA BALMES','Time Out','Assisted Sir Neil in laboratory experiments for URISnap with CO-OJT\'s. ',0,'2026-02-16 09:04:00'),(297,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-02-15 23:59:00'),(298,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Conduct laboratory experiments regarding URISNAP project. - Clean work areas, manage lab materials, analyze sample results of the experiment ',0,'2026-02-16 09:02:00'),(299,14,'MHELFIN KEY CARANDANG','Time In','Ongoing...',0,'2026-02-16 01:27:00'),(300,14,'MHELFIN KEY CARANDANG','Time Out','- cleaned materials - assist in conducting laboratory experiment',0,'2026-02-16 09:02:00'),(301,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-02-16 01:18:00'),(302,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-02-13 00:14:00'),(303,7,'DEO CRIS M. TUTOR','Time Out','• i clean the chemical laboratory equipment use in experiment last lab activity to make sure not contaminated by foreign objects.  • Assisted and participated in sample testing of URISNAP Project by preparation and soaking the paper sample strips. ',0,'2026-02-13 09:18:00'),(304,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-12 23:44:00'),(305,3,'ADELAIDA BALMES','Time Out','Checked mails and fb page for new clients and inquiries about MTCC Services.  Assisted Sir Neil in laboratory experiments for Project Urisnap together with Co-OJT\'s',0,'2026-02-13 09:17:00'),(306,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-02-12 23:39:00'),(307,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Assisted in the laboratory experiment for the URISNAP Project. - Supported the preparation of materials and equipment needed for the experiment. - Helped in documenting procedures and recording observations during the experiment.',0,'2026-02-13 09:17:00'),(308,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-02-13 02:37:00'),(309,14,'MHELFIN KEY CARANDANG','Time In','Ongoing...',0,'2026-02-13 00:03:00'),(310,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-02-12 00:00:00'),(311,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','Assist Front Desk Study how to use the utm inquire supplier for chair and table',0,'2026-02-12 09:03:00'),(312,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-02-11 23:49:00'),(313,4,'AKIKO MAJI DANGCA','Time Out','-front desk -material study -utm orientation ',0,'2026-02-12 09:02:00'),(314,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-12 00:09:00'),(315,3,'ADELAIDA BALMES','Time Out','Learned how to use the UTM. Tested several samples like banana fibers and some constructions sample.',0,'2026-02-12 09:00:00'),(316,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-02-12 00:32:00'),(317,7,'DEO CRIS M. TUTOR','Time Out','Oriented in UTM by sir Antenor',0,'2026-02-12 09:00:00'),(318,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-11 23:17:00'),(319,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','Fixing Add client modal front end and back end. Photoshoot for pubmats',0,'2026-02-12 08:40:00'),(322,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-12 00:26:00'),(323,12,'JOHN RUSSEL ACHICO','Time Out','UTM',0,'2026-02-12 08:37:00'),(324,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-11 23:57:00'),(325,11,'JOHN CARLO M. REYES','Time Out','Fixed minimal on Service Table',0,'2026-02-12 08:36:00'),(326,14,'MHELFIN KEY CARANDANG','Time In','Ongoing...',0,'2026-02-12 08:21:00'),(327,14,'MHELFIN KEY CARANDANG','Time Out','- learned how to use the UTM machine and answered facebook inquiries ',0,'2026-02-12 08:22:00'),(328,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-02-12 08:19:00'),(329,15,'RUSSEL VINCENT V. MANALO','Time Out','Front desk, utm training',0,'2026-02-12 08:21:00'),(330,15,'RUSSEL VINCENT V. MANALO','Time In','No task reported.',0,'2026-03-10 04:50:00'),(331,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-03-10 00:50:00'),(332,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-03-10 00:32:00'),(333,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-03-10 00:06:00'),(334,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-03-09 23:50:00'),(335,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-03-09 23:43:00'),(336,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-03-09 23:40:00'),(338,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-03-09 23:24:00'),(339,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-03-09 23:21:00'),(340,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-03-08 23:44:00'),(341,3,'ADELAIDA BALMES','Time Out','Front desk personnel - assisted clients on their material service request forms, received and evaluated clients sample before accepting it.   Check Facebook messages for new clients and inquiries.  Updated the google sheet and the MTCC log sheet.   Assisted in Urisnap project together with sir neil and co ojt.',0,'2026-03-09 10:16:00'),(342,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-03-08 23:49:00'),(343,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Entertained and assisted clients regarding FTIR testing services. - Conducted mixture experiments for the URISNAP project. - Printed sample strips for testing in the URISNAP project.',0,'2026-03-09 10:07:00'),(344,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-03-09 00:16:00'),(345,11,'JOHN CARLO M. REYES','Time Out','Assisted and Received Clients -Friontdesk; debugged final revisions on the website; printing; Email and Request Handling; ',0,'2026-03-09 10:03:00'),(346,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-03-09 00:00:00'),(347,12,'JOHN RUSSEL ACHICO','Time Out','- helped in cleaning tables and tools rack - assisted my supervisor in filling water on the rotary evaporator - cleaned the laboratory equipment after the experiment - assisted in the urisnap project ',0,'2026-03-09 09:05:00'),(348,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-03-09 09:03:00'),(349,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','- Frontdesk - Cleaned Facility - Photodocumented UriSNAP printer working - videodocumented uriSNAP printer working - modified main website - thought of possible workshop titles',0,'2026-03-09 09:04:00'),(350,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-03-09 00:16:00'),(351,9,'GWYNETH FANER','Time Out','-naghelp kay sir neil sa Urisnap  -naghelp kay maam indi sa documenta ng urisnap at files A 2026 -nagupit ng filter paper -nagclean ng beakers ',0,'2026-03-09 09:04:00'),(352,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-03-09 00:16:00'),(353,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','Washed cleaning materials such as gloves, rags, and mouse pads.  Cleaned the bookshelf, tables, and tools table.',0,'2026-03-09 09:04:00'),(354,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-03-09 00:29:00'),(355,7,'DEO CRIS M. TUTOR','Time Out','1. Assisted Cris and Emman to wash the used mechanical gloves used in UTM. 2. Cooperated to the URISNAP project of Sir Niel.  ',0,'2026-03-09 09:01:00'),(358,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-03-08 22:43:00'),(359,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-03-06 01:04:00'),(360,4,'AKIKO MAJI DANGCA','Time Out','-expe urisnap -attended seminar -took a photo for delivery report -inquired aboutquotation -washed equipments',0,'2026-03-06 09:08:00'),(361,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-03-05 23:21:00'),(362,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','06 - heavily modified the new revamped main mtcc website - carried office furnitures up to the fourth floor - Photodocumented Tour of DBM - Gave tour to one of the members of DBM who wasnt apart of the first group that was toured - Assisted Client (ROA #26)  - Photodocumented delivery for delivery report ',0,'2026-03-06 09:07:00'),(363,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-03-06 00:16:00'),(364,12,'JOHN RUSSEL ACHICO','Time Out','- Carried the new arrival packages to the fourth floor building of Steer Hub. - Assisted in the front desk inqueries. - Put back the equipments of laboratory in their disignated box.',0,'2026-03-06 09:07:00'),(365,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-03-06 00:53:00'),(366,11,'JOHN CARLO M. REYES','Time Out','Assistance on Lifting Furniture for MTCC; Received Clients, Visitors, Inquiries; Explained Services of MTCC; Assistance on Email Queries; Front Desk Tasks  TODAY: 7 Hours and 30 Minutes',0,'2026-03-06 09:06:00'),(367,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-03-06 00:17:00'),(368,7,'DEO CRIS M. TUTOR','Time Out','1. Help carry the newly delivered furniture for MTCC Office and bring them to fourth floor 2. Front Desk in charge. 3. Scanned FTIR documents. ',0,'2026-03-06 09:05:00'),(369,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-03-05 23:54:00'),(370,15,'RUSSEL VINCENT V. MANALO','Time Out','Assisted in conducting laboratory experiments related to the URISNAP study.  Cleaned and organized laboratory equipment after experimental procedures.  Posted content on the MTCC Facebook page for updates and information dissemination.',0,'2026-03-06 09:05:00'),(371,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-03-06 02:42:00'),(372,10,'JOHANNA LYN R. BELO','Time Out','- Attended the Women for Stem event',0,'2026-03-06 09:04:00'),(373,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-03-05 23:42:00'),(374,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Responded to walk-in and email inquiries, providing clear and professional assistance to clients. - Assisted in project-related activities under the URISNAP program - Cleaned and maintained laboratory equipment to ensure proper functionality and compliance with safety standards. ',0,'2026-03-06 09:04:00'),(375,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-03-06 05:11:00'),(376,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','Clean the laboratory equipment   Assist client / Front Desk   ',0,'2026-03-06 09:04:00'),(377,14,'MHELFIN KEY CARANDANG','Time In','Ongoing...',0,'2026-03-05 23:48:00'),(378,14,'MHELFIN KEY CARANDANG','Time Out','Responded to walk-in and email inquiries, providing clear and professional assistance to clients. Assisted in project-related activities under the URISNAP program Cleaned and maintained laboratory equipment to ensure proper functionality and compliance with safety standards. ',0,'2026-03-06 09:02:00'),(379,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-03-05 23:56:00'),(380,3,'ADELAIDA BALMES','Time Out','Checked Facebook messages and Emails to make sure all inquiries and clients questions are answered.   Assisted in UriSnap project with Co-Ojts and Sir Neil.',0,'2026-03-06 04:01:00'),(381,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-03-05 01:00:00'),(382,11,'JOHN CARLO M. REYES','Time Out','Front Desk, Print, Received Clients 7 hours Work Today Half Day Yesterday (March 04)',0,'2026-03-05 09:01:00'),(383,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-03-04 23:32:00'),(384,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','- printed more borchure - printed more callcards - photodocumented visitation from Line Seiki - modified the new revamped main mtcc website',0,'2026-03-05 09:01:00'),(385,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-03-05 00:37:00'),(386,12,'JOHN RUSSEL ACHICO','Time Out','- Cut the calling card paper for the visitors - Assisted in Front desk - Assisted in typing of documents in laptop',0,'2026-03-05 09:01:00'),(387,14,'MHELFIN KEY CARANDANG','Time In','Ongoing...',0,'2026-03-05 00:33:00'),(388,14,'MHELFIN KEY CARANDANG','Time Out','- Replied to clients regarding FTIR inquiries by providing details on procedures, requirements, and sample submission guidelines. - Attended FTIR training and conducted testing on client samples - Edited and processed signed request forms submitted by clients - Evaluated and pre-assessed samples prior to FTIR analysis to confirm suitability and proper preparation for testing.',0,'2026-03-05 09:00:00'),(389,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-03-05 00:46:00'),(390,7,'DEO CRIS M. TUTOR','Time Out','1. In charge in front desk and assisted 2 clients for FTIR services.  2. I scanned documents.  3. Oriented by ma\'am Indi in FTIR testing.  ',0,'2026-03-05 09:00:00'),(391,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-03-04 23:56:00'),(392,3,'ADELAIDA BALMES','Time Out','Check Facebook and Email messages to see if there are new inquiries or clients. ',0,'2026-03-05 09:00:00'),(393,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-03-04 23:47:00'),(394,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Replied to clients regarding FTIR inquiries by providing details on procedures, requirements, and sample submission guidelines. - Attended FTIR training and conducted testing on client samples - Edited and processed signed request forms submitted by clients - Evaluated and pre-assessed samples prior to FTIR analysis to confirm suitability and proper preparation for testing.',0,'2026-03-05 09:00:00'),(395,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-03-05 00:07:00'),(396,10,'JOHANNA LYN R. BELO','Time Out','- Attended FTIR training - Wash the laboratory untensils - cut out the calling card of MTCC',0,'2026-03-05 09:00:00'),(399,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-03-04 23:52:00'),(400,15,'RUSSEL VINCENT V. MANALO','Time Out','- Cut printed calling cards for distribution.  - Attended a training on how to operate the FTIR (Fourier Transform Infrared Spectroscopy) instrument.  - Designed and laid out content for the Facebook page.  - Posted finalized content on the Facebook page.  - Cleaned laboratory equipment.',0,'2026-03-05 09:00:00'),(401,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-03-05 00:08:00'),(402,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','Arranged the printed brochures for MTCC services.  Cleaned the laboratory equipment.',0,'2026-03-05 08:58:00'),(403,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-03-05 04:37:00'),(404,4,'AKIKO MAJI DANGCA','Time Out','-created a caption for posting -naghugas ng equipments -nag-email ng suppliers for market study',0,'2026-03-05 08:58:00'),(405,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-03-04 00:39:00'),(406,10,'JOHANNA LYN R. BELO','Time Out','- Usherette for open house in SteerHub - cut the contact card  - prepared the brochure ',0,'2026-03-04 09:01:00'),(407,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-03-04 00:15:00'),(408,9,'GWYNETH FANER','Time Out','-front desk -help in making  b brochure',0,'2026-03-04 09:01:00'),(409,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-03-04 03:58:00'),(410,4,'AKIKO MAJI DANGCA','Time Out','-market study about trolley -naglagay pictures sa canva for february\'s clients -orient about the equipments in mtcc ',0,'2026-03-04 09:01:00'),(411,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-03-03 23:55:00'),(412,15,'RUSSEL VINCENT V. MANALO','Time Out','- Designed and created a customized photo frame layout for posting clients’ pictures for the month of February. - Discussed and explained the principles and applications of FTIR and UV-Vis spectroscopy to visitors during the SteerHub Open House event.',0,'2026-03-04 09:01:00'),(413,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-03-03 23:55:00'),(414,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Replied to email inquiries by providing clear information about laboratory services, procedures, and other client concerns. - Prepared materials and discussed MTCC and its available services with visitors during World Engineering Day, explaining the laboratory’s testing capabilities and answering questions.',0,'2026-03-04 09:01:00'),(415,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-03-04 00:04:00'),(416,7,'DEO CRIS M. TUTOR','Time Out','1. I took photos of our visitors and staff when the MTCC office declared Open House on World Engineering Day (Wednesday). 2. I take over the UTM area as staff to explain the functions and methods of the machine as well as the Hardness Test and Moisture Test. 3. I also took over the Centrifuge Area for once.  4. I take over the calibration area twice.  ',0,'2026-03-04 09:01:00'),(417,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-03-03 23:52:00'),(418,3,'ADELAIDA BALMES','Time Out','MTCC had an Open House because of Wolrd Engineering Day. I discussed the Material Testing Section which includes the function of Universal Testing Machine, why it\'s important and the different types of tests available. Together with the Moisture Test and Hardness Test.   I also checked the mails and FB messages for new inquiries and clients of MTCC.',0,'2026-03-04 09:00:00'),(419,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-03-04 00:17:00'),(420,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','I do discussion and presenting equipment in the mtcc, Because Its engineering day   Presenting na mechanism of Hardness tester(durometer) and moisture tester ',0,'2026-03-04 09:00:00'),(423,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-03-03 23:59:00'),(424,12,'JOHN RUSSEL ACHICO','Time Out','- Assisted in folding brochures - Talk to visitors all about the calibration services',0,'2026-03-04 09:00:00'),(425,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-03-03 23:27:00'),(426,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','World engineering day preparation and hosting for open house',0,'2026-03-04 09:00:00'),(427,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-03-03 23:34:00'),(428,11,'JOHN CARLO M. REYES','Time Out','STEM-A-THON AND ASCEND 2026, fixed lost database, debugging',0,'2026-03-04 08:44:00'),(429,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-03-03 00:05:00'),(430,7,'DEO CRIS M. TUTOR','Time Out','1. I do a test on Hardness and Moisture.  2. I do check the UTM chain and other parts about the strange sound coming from it. And put some oil for lubrication to lessen the noise.  3. I do get the average of test reading in hardness and moisture. ',0,'2026-03-03 09:11:00'),(431,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-03-02 23:33:00'),(432,3,'ADELAIDA BALMES','Time Out','Assisted in UriSnap experiments together with Sir Neil and Co-OJT\'s  Test the sample of clients (Compressive Test) using UTM.   Prepared the ROA#18 and ROA#21, signed and checked by Sir Miggy. ',0,'2026-03-03 09:06:00'),(433,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-03-03 00:14:00'),(434,12,'JOHN RUSSEL ACHICO','Time Out','- Dry the equipments in laboratory - Assisted on setting up the printer for the URISNAP Project - Delivered Laptop to our Supervisor in BSU Main Campus - Assisted on adding grease on the chain of the UTM Machine - Assisting on cleaning and relocations of the things in the office for tomorrow’s World Engineering Day',0,'2026-03-03 09:06:00'),(435,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-03-03 00:02:00'),(436,10,'JOHANNA LYN R. BELO','Time Out','- help in the urisnap  - wash all the laboratory equipments ',0,'2026-03-03 09:03:00'),(437,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-03-02 23:12:00'),(438,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','03 - Fire prevention drill - started developing MTCC main website - printed IDs - did moisture test roa 18 - hardness test roa 18 - edited poster for new announcement for freeze dryer and rotary evaporator - clean lab for world engineering day',0,'2026-03-03 09:02:00'),(439,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-03-02 23:59:00'),(440,11,'JOHN CARLO M. REYES','Time Out','Printed ID, received clients, update statues of clients, fire drill',0,'2026-03-03 09:02:00'),(441,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-03-03 00:31:00'),(442,9,'GWYNETH FANER','Time Out','-frontdesk assist of clientsss',0,'2026-03-03 09:02:00'),(445,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-03-02 23:54:00'),(446,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Replied to client emails by addressing inquiries clearly and providing necessary information regarding laboratory services and procedures. - Assisted in the URISNAP project by supporting ongoing tasks, coordinating with team members, and helping with testing or documentation as needed.',0,'2026-03-03 08:22:00'),(447,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-03-01 23:54:00'),(448,7,'DEO CRIS M. TUTOR','Time Out','1. Help Cielo to calibrate the last 3 DC Power Supply 2. I wash the 1 beaker used by ma\'am Indi in lab Experiment 3. Perform UTM in compressive test and Demonstrated to co-OJT\'s student how it properly operate the Machine 4. Also Demonstrated Flexural Test in our Co-OJT\'s that didn\'t perform yet.  5. Cleaned those samples and help to carry out of the Lab 6. Help client to carry hollow blocks sample going to the Office ',0,'2026-03-02 09:02:00'),(449,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-03-02 00:22:00'),(450,3,'ADELAIDA BALMES','Time Out','Assisted in UriSnap project experiments.  Performed UTM (Compressive Test) for Roa 21.  Made na Report of Analysis for Roa#21 and also its Raw Data. Also sent the soft copy of it to the client.',0,'2026-03-02 09:01:00'),(451,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-03-02 00:13:00'),(452,10,'JOHANNA LYN R. BELO','Time Out','- perform UTM - perform flexural test - help in FTIR to wash the laboratory equipments',0,'2026-03-02 09:00:00'),(453,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-03-01 23:45:00'),(454,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Conducted trial activities for the URISNAP project focusing on printer ink performance and testing.  - Calibrated DC and AC power supplies to ensure proper functionality and accurate output.  - Assisted in the release of ROA results by helping with documentation and verification.  - Performed UTM testing, including compressive strength tests for hollow blocks and flexural tests for roofing materials.',0,'2026-03-02 09:00:00'),(455,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-03-01 23:30:00'),(456,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','- Calibrated 1 DC power Suuply - Clean laboratory equipments - refilled solutions for UriSnap - Photodocumented Roa 20 and 21 - Executed Flextural and compression test on Roa 20 and 21 - Disposed mess from testing',0,'2026-03-02 09:00:00'),(457,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-03-01 23:47:00'),(458,11,'JOHN CARLO M. REYES','Time Out','Front Desk, Administrative Works, received clients, encoded client data, debugging, UTM, Document, Nahiwa Ng bala Ng stapler (clinic)',0,'2026-03-02 09:00:00'),(459,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-03-02 00:19:00'),(460,12,'JOHN RUSSEL ACHICO','Time Out','-Carried the Hollow Blocks Material Samples -Tested the Hollow Blocks by using UTM Machine for Tensile Strength',0,'2026-03-02 09:00:00'),(461,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-03-01 23:54:00'),(462,9,'GWYNETH FANER','Time Out','-front desk -Assist on making request form 20-22 -perform utm in compresive test 12 samples ',0,'2026-03-02 09:00:00'),(465,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-27 00:12:00'),(466,12,'JOHN RUSSEL ACHICO','Time Out','-Input Data on Gsheet on the Newly Arrived DC Power Supply and AC Power Supply -Assit Clients on front desk - Check data’s on gsheet ',0,'2026-02-27 09:02:00'),(467,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-02-26 23:57:00'),(468,15,'RUSSEL VINCENT V. MANALO','Time Out','- Calibrated AC and DC power supplies to ensure accurate and reliable operation.  - Assisted at the front desk by accommodating inquiries and providing basic assistance as needed.',0,'2026-02-27 09:01:00'),(469,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-02-26 23:48:00'),(470,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Assisted in releasing ROAs and accommodating clients, including verifying documentation and coordinating requests  - Edited and validated signed request forms and pre-assessed FTIR samples for analysis readiness  - Calibrated DC and AC power supplies by measuring and verifying voltage and current, with proper documentation',0,'2026-02-27 09:01:00'),(471,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-27 00:03:00'),(472,11,'JOHN CARLO M. REYES','Time Out','Front Desk, debugging of website, tried to deploy website through Render, inputted data for ROA, Received Clients',0,'2026-02-27 09:00:00'),(473,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-27 01:11:00'),(474,3,'ADELAIDA BALMES','Time Out','Calibrated DC and AC power supply. ',0,'2026-02-27 08:59:00'),(475,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-26 23:06:00'),(476,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','- Frontdesk - Encoded Calbiration Equipment Receiving Form to Excel',0,'2026-02-27 06:00:00'),(477,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-02-25 23:47:00'),(478,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Conducted experimental trials for the URISNAP project comparing PEG + ethanol and PEG + distilled water, assisted in reagent preparation, and maintained controlled laboratory conditions - Edited signed request forms and pre-assessed FTIR samples prior to analysis - Encoded readings for calibrated digital multimeters, including uncertainty values',0,'2026-02-26 09:02:00'),(479,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-25 23:49:00'),(480,12,'JOHN RUSSEL ACHICO','Time Out','- Front Desk Service for Clients - Input in Calibration Reports',0,'2026-02-26 09:02:00'),(481,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-25 23:45:00'),(482,3,'ADELAIDA BALMES','Time Out','Updated the Narrative Report for Feb 18 Training.   Input the Datas of Calibration of DMM\'s for Measurement Uncertainties needed for Calibration Certificates.',0,'2026-02-26 09:00:00'),(483,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-02-25 23:57:00'),(484,15,'RUSSEL VINCENT V. MANALO','Time Out','- Conducted experimental trials for the URISNAP project to compare polyethylene glycol (PEG) + ethanol and PEG + distilled water as potential solvent systems.  - Assisted in reagent preparation and accurate measurement to ensure reliable and consistent results.  - Helped set up laboratory apparatus and maintained controlled experimental conditions during testing.',0,'2026-02-26 09:00:00'),(485,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-25 23:03:00'),(486,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','- Frontdesk Duties - Attended FTIR Practical Training - Photodocumented FTIR trainjng - Handled Attendance form for training - Created FTIR training evaluation form - Made FTIR training satisfaction rating paper - Written FTIR training Narrative report - Encoded Calibration results from different multimeters',0,'2026-02-26 09:00:00'),(489,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-26 08:58:00'),(490,11,'JOHN CARLO M. REYES','Time Out','Out Yesterday: Full Day Debugging and Encoding Final Checking of Website',0,'2026-02-26 08:59:00'),(491,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-02-25 00:07:00'),(492,9,'GWYNETH FANER','Time Out','-naggawa ng report of analysis roa #14 -finished the raw data of #13 and #14 -nagclean ng mga bote sa lab -made a calibration sticker and edit the sticker with word also print it -put stickers in the digital multimeter   - assist them in roa #14 hardness test and moisture test',0,'2026-02-25 09:01:00'),(493,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-24 23:30:00'),(494,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','- Have checklist design approved by Sir Miguii - Produced 40 checklist sheet - Provided 2 folders for empty and filled checklist sheets - Frontdesk duties - Reorganized frontdesk files - Printed new Satisfactory sheets - Validated different multimeter models',0,'2026-02-25 09:01:00'),(495,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-02-24 23:50:00'),(496,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Entertain client inquiries at the front desk and respond to emails - Release analysis reports and pre-assess samples for FTIR analysis - Check calibrated digital multimeters and verify serial numbers prior to release',0,'2026-02-25 09:01:00'),(497,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-02-25 00:10:00'),(498,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','I do moisture and Hardness Test for leather material  Check the DDM for calibration set up  Throw the water of cooling Fan Freezer  ',0,'2026-02-25 09:01:00'),(499,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-02-25 00:09:00'),(500,10,'JOHANNA LYN R. BELO','Time Out','- Test the client’s sample for hardness and moisture  - cut the process list - put a sticker on the DMM',0,'2026-02-25 09:01:00'),(501,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-25 00:23:00'),(502,12,'JOHN RUSSEL ACHICO','Time Out','- Carry Microplate Reader and UPS on the other table to be repaired and put it back on it’s designated area. - Substitute on front desk - Quality Control of Digital Multimeter that is Calibrated',0,'2026-02-25 09:00:00'),(503,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-02-24 23:55:00'),(504,15,'RUSSEL VINCENT V. MANALO','Time Out','- Organized school supplies - Sent an email using the MTCC Services Gmail informing the customer that the report of analysis is ready for pick-up - Labeled the multimeters according to their serial numbers - Helped carry equipment - Cut and prepared MTCC Services sheets ',0,'2026-02-25 09:00:00'),(507,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-25 01:13:00'),(508,11,'JOHN CARLO M. REYES','Time Out','Yesterday: Out of 12:16 PM',0,'2026-02-25 01:13:00'),(509,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-23 23:50:00'),(510,3,'ADELAIDA BALMES','Time Out','- asissted the front desk - help the clients with their concern - answer facebook inquires',0,'2026-02-24 09:05:00'),(513,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-23 23:40:00'),(514,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','- Carried biobase laboratory equipments - frontdesk duties - made frontdesk guide - made frontdesk checklist - finished ID design - photo-documented visitation from Rizal Technological Academy - printed brochures',0,'2026-02-24 09:01:00'),(515,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-02-24 00:43:00'),(516,7,'DEO CRIS M. TUTOR','Time Out','1. I assisted front desk Personnel to make request form for ROA#14 and releasing for ROA#13. 2. Taught Johanna on how to make a report of analysis paper since it is her first time and she doesn\'t know how to make one. 3. Help carried 2 huge Biobase laboratory equipments for MTCC',0,'2026-02-24 09:01:00'),(517,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-02-24 00:01:00'),(518,10,'JOHANNA LYN R. BELO','Time Out','- Assist in the front desk - Created the ROA #13 - Assisted the last costumer (ROA #15)',0,'2026-02-24 09:01:00'),(519,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-24 00:00:00'),(520,12,'JOHN RUSSEL ACHICO','Time Out','- Carry the Package - Clean the table - Assisted on folding brochures',0,'2026-02-24 09:00:00'),(521,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-02-24 00:07:00'),(522,9,'GWYNETH FANER','Time Out','-nagclean ng beaker na malaki and maliit (hind po amin  bung basag) -nagclean kami nina russel ng lamesa -nilabhan namin ung basahan and nagtapon ng hazardous waste -nagclean kami ng bote ni adelle ',0,'2026-02-24 09:00:00'),(523,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-02-24 00:08:00'),(524,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','Receive the new Deliver equipment   Clean the laboratory Utensil   Assisting Client to test for FTIR, The Sample is Coffee Bean  Make ROA for the client',0,'2026-02-24 09:00:00'),(525,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-23 23:49:00'),(526,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-02-23 00:09:00'),(527,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','Clean the facility  Test ROA 13 Using tensile test UTM  Market Research of Trolley and Push Cart',0,'2026-02-23 09:03:00'),(528,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-02-23 00:04:00'),(529,7,'DEO CRIS M. TUTOR','Time Out','1. I do assist customer today for FTIR and UTM testing  2. I do search for push cart and trolley 3 tier for office work 3. I do assist sir miggui for UTM tensile strength test of dog bone samples 4. I do teach co-ojt\'s about hardness testing and moisture testing 5. I assist Adelaida for releasing of UTM and FTIR result',0,'2026-02-23 09:01:00'),(530,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-22 23:12:00'),(531,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','Front desk duties, cleaned and organized the big lab, photo documented ROA #13. Organized the population forms folder, updated ID draft for signatures. Tagabantayng PC ni sir Nheil',0,'2026-02-23 09:00:00'),(532,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-23 00:51:00'),(533,11,'JOHN CARLO M. REYES','Time Out','Moisture Test, Hardness Test, Debugging, Personal Life Lessons incl. Marriage and Law',0,'2026-02-23 09:00:00'),(534,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-23 00:08:00'),(535,12,'JOHN RUSSEL ACHICO','Time Out','- Training for Hardness Test and Moisture Test',0,'2026-02-23 08:58:00'),(538,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-02-22 23:38:00'),(539,9,'GWYNETH FANER','Time Out','-help adel in report of analysis of concrete  -learned how to do tensile testing -we did a hardness test to ROA 11 -did a moisture test to ROA 11 -make the raw data of ROA 11 -finish the report of Analysis of ROA 11 ',0,'2026-02-23 08:58:00'),(540,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-22 23:47:00'),(541,3,'ADELAIDA BALMES','Time Out','Prepared ROA#06, ROA#10 and ROA#12 for release.   Front Desk assistant - assisted clients in their inquiries and testing samples.  - received samples for FTIR and Tensile Strength  - replied to messages in MTCCC fb acount.',0,'2026-02-23 08:55:00'),(542,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-02-19 23:48:00'),(543,4,'AKIKO MAJI DANGCA','Time Out','-assisted in urisnap -cleaned and organized the materials -utm testing for compressive strength ',0,'2026-02-20 09:09:00'),(544,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-02-19 23:58:00'),(545,7,'DEO CRIS M. TUTOR','Time Out','1. Incharge in front desk and assisting two client they inquired about UTM as well as moisture and hardness test.  2. I did test the hardness and moisture one of our client samples and do the Report of Analysis to release it immediately.  3. I did testing compressive test of hollow blocks.  4. I did also hardness test of another client\'s samples and compressive strength test. ',0,'2026-02-20 09:08:00'),(546,14,'MHELFIN KEY CARANDANG','Time In','Ongoing...',0,'2026-02-20 00:08:00'),(547,14,'MHELFIN KEY CARANDANG','Time Out','- Responded to client inquiries received through the official Facebook page, providing accurate information regarding laboratory services and testing procedures. - Assisted in project-related activities under the URISNAP program. (Accomplished a total of 300 strips) - Cleaned and maintained laboratory equipment to ensure proper functionality and adherence to safety standards. - Assisted in the operation of the Universal Testing Machine (UTM) during testing of materials sent to the laboratory. ',0,'2026-02-20 09:06:00'),(548,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-20 00:15:00'),(549,12,'JOHN RUSSEL ACHICO','Time Out','- Calibration of the equipment - Take pictures of the Results in URISNAP - Hardness Test on UTM ',0,'2026-02-20 09:04:00'),(550,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-02-19 23:49:00'),(551,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Responded to client inquiries received through the emails and assigned to the front desk to provide accurate information regarding laboratory services and testing procedures.  - Edited and prepared request forms for UTM sample testing.  - Released ROA results for FTIR analysis in accordance with laboratory procedures.  - Conducted UTM testing on various samples, focusing on compressibility measurements and data recording. ',0,'2026-02-20 09:02:00'),(552,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-19 23:49:00'),(553,3,'ADELAIDA BALMES','Time Out','Assisted CO-OJT in taking pictures of strips used in laboratory experiments for URISnap.  Assisted CO-Ojt in front desk task regarding inquiries.   Done the hardness test& moisture test for ROA09, also hardness and compressive test for ROA10-ROA12 together with CO-Ojt.   Prepared the Report fo Analysis 09 to be claimed by clients. ',0,'2026-02-20 09:00:00'),(554,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-02-20 00:17:00'),(555,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-02-18 23:57:00'),(556,15,'RUSSEL VINCENT V. MANALO','Time Out','Participated in and conducted laboratory experiments on various samples in support of the URISNAP study, ensuring proper sample preparation, handling, and documentation of results.',0,'2026-02-19 09:20:00'),(557,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-02-19 00:00:00'),(558,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','I do research and get the quotation of Mesh chair and Conference Table  ',0,'2026-02-19 09:18:00'),(559,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-02-18 23:56:00'),(560,4,'AKIKO MAJI DANGCA','Time Out','-nagtest about urisnap -material study -nagclean ng materials ',0,'2026-02-19 09:16:00'),(561,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-02-18 23:55:00'),(562,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Performed calibration of laboratory glassware and measuring equipment. - Answered walk-in and email inquiries at the front desk. - Assisted others in URISNAP project activities.',0,'2026-02-19 09:15:00'),(563,14,'MHELFIN KEY CARANDANG','Time In','Ongoing...',0,'2026-02-18 23:55:00'),(564,14,'MHELFIN KEY CARANDANG','Time Out','-Performed calibration of laboratory glassware and measuring equipment. - Answered walk-in and email inquiries at the front desk. - Assisted others in URISNAP project activities.',0,'2026-02-19 09:14:00'),(565,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-19 01:46:00'),(566,12,'JOHN RUSSEL ACHICO','Time Out','I calibrated the laboratory equipments and cleaned them after the calibration. ',0,'2026-02-19 09:13:00'),(567,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-19 01:18:00'),(568,3,'ADELAIDA BALMES','Time Out','Prepared the Narrative Report for the FTIR AND UV-Vis Microplate Reader Training held at MTCC and lead by Ma\'am Indira. ',0,'2026-02-19 09:06:00'),(569,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-02-18 23:58:00'),(570,9,'GWYNETH FANER','Time Out','-assist in making request form for UB students in frontdesk',0,'2026-02-19 09:06:00'),(571,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-02-19 00:03:00'),(572,7,'DEO CRIS M. TUTOR','Time Out','1. I do Front Desk as Front Desk Personnel 2. Assisting client for it\'s inquiry for Moisture test, hardness test, and compressive strength test 3. I do the report of analysis of materials we have to buy online 4. I release the result of our client today. ',0,'2026-02-19 09:04:00'),(573,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-18 23:34:00'),(574,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','Assisted one client briefly and conducted market research with Deo and Chris for stainless steel 3-level trolley and 1000kg-supported push trolley',0,'2026-02-19 09:02:00'),(577,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-18 23:29:00'),(578,11,'JOHN CARLO M. REYES','Time Out','Encoded 30+ Clients from 2025 | Debugged Service No Generation | Accepted 2 Clients',0,'2026-02-19 09:00:00'),(579,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-02-18 00:03:00'),(580,9,'GWYNETH FANER','Time Out','-front desk assisting 2 customer from BSU MECHANICAL ENG AND BCAS  -also learned about training of maam indi',0,'2026-02-18 09:03:00'),(581,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-02-17 23:59:00'),(582,7,'DEO CRIS M. TUTOR','Time Out','Attended training of FTIR process and material testing with different testing machine such as microplate reader.',0,'2026-02-18 09:02:00'),(583,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-02-17 23:54:00'),(584,4,'AKIKO MAJI DANGCA','Time Out','-market study -attended training regarding UV and microplates -',0,'2026-02-18 09:01:00'),(585,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-02-17 23:53:00'),(586,13,'KRISTINE CIELO S. PATISUCAN','Time Out','Attended laboratory training to learn FTIR spectrum fundamentals, including peak identification and interpretation. Gained practical experience using a microplate reader for sample measurement and data analysis.',0,'2026-02-18 09:01:00'),(587,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-02-17 23:56:00'),(588,15,'RUSSEL VINCENT V. MANALO','Time Out','Designed and posted a publication material for the MTCC Facebook page. Attended training on the operation and principles of FTIR. Attended training on the operation and principles of UV-Vis spectrophotometer. Assisted in document lamination and other minor administrative tasks.',0,'2026-02-18 09:00:00'),(589,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-17 22:45:00'),(590,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','Edited ID designs, laminated QR posters, photo-documented and attended Ma\'am Indi\'s training, and borrowed/returned TV and laminator from 2nd floor.',0,'2026-02-18 09:00:00'),(591,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-02-17 23:51:00'),(592,10,'JOHANNA LYN R. BELO','Time Out','- Laminate the poster need in the office - Attended Ma’am Indi’s training - Contributed in finishing the ROA',0,'2026-02-18 09:00:00'),(593,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-17 23:53:00'),(594,3,'ADELAIDA BALMES','Time Out','We had Training about FTIR, UV-Vis and Microplate with Ma\'am Indi.   Made the Report of Analysis #02 for Moisture Test.   Sort envelope/files according to the list. ',0,'2026-02-18 09:00:00'),(595,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-17 23:34:00'),(596,11,'JOHN CARLO M. REYES','Time Out','Encoding of 2025 Data, Fixing of several bugs on database and service table',0,'2026-02-18 09:00:00'),(597,14,'MHELFIN KEY CARANDANG','Time In','Ongoing...',0,'2026-02-17 23:51:00'),(598,14,'MHELFIN KEY CARANDANG','Time Out','- Responded to client inquiries received through the official Facebook page, providing accurate information regarding laboratory services and testing procedures. - Assisted clients with their testing requirements, including sample submission, initial assessment, and verification of sample eligibility for analysis. - Gained hands-on exposure to laboratory instrumentation, specifically the operation and application of Fourier Transform Infrared (FTIR) Spectroscopy and UV-Visible (UV-VIS) Spectrophotometry for material characterization and analysis.',0,'2026-02-18 09:00:00'),(599,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-02-18 00:01:00'),(600,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','I do front desk and assisting 2 client from different school and 1 from bsu  I accomplish the the training in FTIR Analysis & Micro plate  Prepare Qr Code and laminated the code for our attendance and Request form access     ',0,'2026-02-18 09:00:00'),(601,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-18 00:12:00'),(602,12,'JOHN RUSSEL ACHICO','Time Out','I organized the documents of the office base on the label. I carried the material samples for the testing. I laminated the QR Codes for our attendance and services of the Office. Our supervisor trained us on the functions of the instruments used in the office.',0,'2026-02-18 09:00:00'),(605,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-02-16 00:22:00'),(606,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','I do create the laboratory table to set up the DDM calibration set up  I search for a quotation of Push cart for the laboratory   Assisting picture the Strip Sample in lab',0,'2026-02-16 09:07:00'),(607,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-15 23:22:00'),(608,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','Photoshoot for publication materials, assisted on albumin photo capturing, did some cleaning and setup on the machine lab area',0,'2026-02-16 09:05:00'),(609,9,'GWYNETH FANER','Time In','Ongoing...',0,'2026-02-16 00:03:00'),(610,9,'GWYNETH FANER','Time Out','-assisting customers in front desk  - capturing chemicals for urisnap',0,'2026-02-16 09:05:00'),(611,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-16 00:03:00'),(612,12,'JOHN RUSSEL ACHICO','Time Out','I take pictures of the filter paper for the testing of albumine that is tested on the biobase',0,'2026-02-16 09:05:00'),(613,10,'JOHANNA LYN R. BELO','Time In','Ongoing...',0,'2026-02-16 00:25:00'),(614,10,'JOHANNA LYN R. BELO','Time Out','- Assist in the laboratory experiment - Take pictures of the results - Assist a client ',0,'2026-02-16 09:04:00'),(615,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-15 23:52:00'),(616,11,'JOHN CARLO M. REYES','Time Out','Debugging of Website, Assisting of Clients, and FrontDesk',0,'2026-02-16 09:04:00'),(617,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-15 23:56:00'),(618,3,'ADELAIDA BALMES','Time Out','Assisted Sir Neil in laboratory experiments for URISnap with CO-OJT\'s. ',0,'2026-02-16 09:04:00'),(621,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-02-15 23:59:00'),(622,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Conduct laboratory experiments regarding URISNAP project. - Clean work areas, manage lab materials, analyze sample results of the experiment ',0,'2026-02-16 09:02:00'),(623,14,'MHELFIN KEY CARANDANG','Time In','Ongoing...',0,'2026-02-16 01:27:00'),(624,14,'MHELFIN KEY CARANDANG','Time Out','- cleaned materials - assist in conducting laboratory experiment',0,'2026-02-16 09:02:00'),(625,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-02-16 01:18:00'),(626,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-02-13 00:14:00'),(627,7,'DEO CRIS M. TUTOR','Time Out','• i clean the chemical laboratory equipment use in experiment last lab activity to make sure not contaminated by foreign objects.  • Assisted and participated in sample testing of URISNAP Project by preparation and soaking the paper sample strips. ',0,'2026-02-13 09:18:00'),(628,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-12 23:44:00'),(629,3,'ADELAIDA BALMES','Time Out','Checked mails and fb page for new clients and inquiries about MTCC Services.  Assisted Sir Neil in laboratory experiments for Project Urisnap together with Co-OJT\'s',0,'2026-02-13 09:17:00'),(630,13,'KRISTINE CIELO S. PATISUCAN','Time In','Ongoing...',0,'2026-02-12 23:39:00'),(631,13,'KRISTINE CIELO S. PATISUCAN','Time Out','- Assisted in the laboratory experiment for the URISNAP Project. - Supported the preparation of materials and equipment needed for the experiment. - Helped in documenting procedures and recording observations during the experiment.',0,'2026-02-13 09:17:00'),(632,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-02-13 02:37:00'),(633,14,'MHELFIN KEY CARANDANG','Time In','Ongoing...',0,'2026-02-13 00:03:00'),(634,5,'CHRISTIAN DANIEL B. ROCERO','Time In','Ongoing...',0,'2026-02-12 00:00:00'),(635,5,'CHRISTIAN DANIEL B. ROCERO','Time Out','Assist Front Desk Study how to use the utm inquire supplier for chair and table',0,'2026-02-12 09:03:00'),(636,4,'AKIKO MAJI DANGCA','Time In','Ongoing...',0,'2026-02-11 23:49:00'),(637,4,'AKIKO MAJI DANGCA','Time Out','-front desk -material study -utm orientation ',0,'2026-02-12 09:02:00'),(638,3,'ADELAIDA BALMES','Time In','Ongoing...',0,'2026-02-12 00:09:00'),(639,3,'ADELAIDA BALMES','Time Out','Learned how to use the UTM. Tested several samples like banana fibers and some constructions sample.',0,'2026-02-12 09:00:00'),(640,7,'DEO CRIS M. TUTOR','Time In','Ongoing...',0,'2026-02-12 00:32:00'),(641,7,'DEO CRIS M. TUTOR','Time Out','Oriented in UTM by sir Antenor',0,'2026-02-12 09:00:00'),(642,8,'DIAMANTE, EMMANUEL ROBERT A.','Time In','Ongoing...',0,'2026-02-11 23:17:00'),(643,8,'DIAMANTE, EMMANUEL ROBERT A.','Time Out','Fixing Add client modal front end and back end. Photoshoot for pubmats',0,'2026-02-12 08:40:00'),(646,12,'JOHN RUSSEL ACHICO','Time In','Ongoing...',0,'2026-02-12 00:26:00'),(647,12,'JOHN RUSSEL ACHICO','Time Out','UTM',0,'2026-02-12 08:37:00'),(648,11,'JOHN CARLO M. REYES','Time In','Ongoing...',0,'2026-02-11 23:57:00'),(649,11,'JOHN CARLO M. REYES','Time Out','Fixed minimal on Service Table',0,'2026-02-12 08:36:00'),(650,14,'MHELFIN KEY CARANDANG','Time In','Ongoing...',0,'2026-02-12 08:21:00'),(651,14,'MHELFIN KEY CARANDANG','Time Out','- learned how to use the UTM machine and answered facebook inquiries ',0,'2026-02-12 08:22:00'),(652,15,'RUSSEL VINCENT V. MANALO','Time In','Ongoing...',0,'2026-02-12 08:19:00'),(653,15,'RUSSEL VINCENT V. MANALO','Time Out','Front desk, utm training',0,'2026-02-12 08:21:00'),(654,6,'CRISTIAN JOSH Q. MAYO','Time In','\"set up the backend database of the new ojt attendance system, added addtional features\"',0,'2026-03-09 23:39:00'),(655,6,'CRISTIAN JOSH Q. MAYO','Time Out','\"set up the backend database of the new ojt attendance system, added addtional features\"',0,'2026-03-10 09:30:00'),(656,10,'JOHANNA LYN R. BELO','Time Out','No task reported',0,'2026-03-10 09:00:00'),(657,15,'RUSSEL VINCENT V. MANALO','Time Out','No task reported.',0,'2026-03-10 09:00:00'),(658,29,'Nheil Thomas Reyes','Time In','Ongoing...',1,'2026-03-11 00:37:42'),(659,29,'Nheil Thomas Reyes','Time Out','ffegdfefwed',1,'2026-03-11 00:40:40');
/*!40000 ALTER TABLE `attendance_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_settings`
--

DROP TABLE IF EXISTS `office_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_key` (`setting_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_settings`
--

LOCK TABLES `office_settings` WRITE;
/*!40000 ALTER TABLE `office_settings` DISABLE KEYS */;
INSERT INTO `office_settings` VALUES (1,'office_ssid','Steerhub First Floor','2026-03-10 03:38:08');
/*!40000 ALTER TABLE `office_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_code` char(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `required_hours` decimal(6,2) NOT NULL DEFAULT '0.00',
  `registered_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `student_code` (`student_code`),
  KEY `idx_email` (`email`),
  KEY `idx_full_name` (`full_name`),
  KEY `idx_student_code` (`student_code`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (3,'ADELAIDA BALMES','21-05398@g.batstate-u.edu.ph','47382','$2a$10$Bcw4jgO6QDILOmgu8fJaMechbX24d5889GDKlyPebVYL04SCSjxpm',1,0.00,'2026-03-10 07:35:25','2026-03-10 08:15:22'),(4,'AKIKO MAJI DANGCA','22-07603@g.batstate-u.edu.ph','91564','$2a$10$Bcw4jgO6QDILOmgu8fJaMechbX24d5889GDKlyPebVYL04SCSjxpm',1,0.00,'2026-03-10 07:35:25','2026-03-10 08:15:22'),(5,'CHRISTIAN DANIEL B. ROCERO','22-01821@g.batstate-u.edu.ph','28731','$2a$10$Bcw4jgO6QDILOmgu8fJaMechbX24d5889GDKlyPebVYL04SCSjxpm',1,0.00,'2026-03-10 07:35:25','2026-03-10 08:15:22'),(6,'CRISTIAN JOSH Q. MAYO','22-01290@g.batstate-u.edu.ph','63047','$2b$10$/i2Crdtt6vQod5ZyyA56COiJa7w1esIaMwdUUcH1/PZ9Ax/WIyf4q',1,320.00,'2026-03-10 07:35:25','2026-03-11 00:05:55'),(7,'DEO CRIS M. TUTOR','tutordeo@gmail.com','15829','$2a$10$Bcw4jgO6QDILOmgu8fJaMechbX24d5889GDKlyPebVYL04SCSjxpm',1,0.00,'2026-03-10 07:35:25','2026-03-10 08:15:22'),(8,'DIAMANTE, EMMANUEL ROBERT A.','22-03328@g.batstate-u.edu.ph','74613','$2a$10$Bcw4jgO6QDILOmgu8fJaMechbX24d5889GDKlyPebVYL04SCSjxpm',1,0.00,'2026-03-10 07:35:25','2026-03-10 08:15:22'),(9,'GWYNETH FANER','22-05931@g.batstate-u.edu.ph','39256','$2b$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LOnNb6l9Syi',1,320.00,'2026-03-10 07:35:25','2026-03-11 00:22:38'),(10,'JOHANNA LYN R. BELO','21-00577@g.batstate-u.edu.ph','82470','$2a$10$Bcw4jgO6QDILOmgu8fJaMechbX24d5889GDKlyPebVYL04SCSjxpm',1,0.00,'2026-03-10 07:35:25','2026-03-10 08:15:22'),(11,'JOHN CARLO M. REYES','22-03171@g.batstate-u.edu.ph','56138','$2a$10$Bcw4jgO6QDILOmgu8fJaMechbX24d5889GDKlyPebVYL04SCSjxpm',1,0.00,'2026-03-10 07:35:25','2026-03-10 08:15:22'),(12,'JOHN RUSSEL ACHICO','22-05902@g.batstate-u.edu.ph','14793','$2a$10$Bcw4jgO6QDILOmgu8fJaMechbX24d5889GDKlyPebVYL04SCSjxpm',1,0.00,'2026-03-10 07:35:25','2026-03-10 08:15:22'),(13,'KRISTINE CIELO S. PATISUCAN','22-07694@g.batstate-u.edu.ph','67024','$2a$10$Bcw4jgO6QDILOmgu8fJaMechbX24d5889GDKlyPebVYL04SCSjxpm',1,0.00,'2026-03-10 07:35:25','2026-03-10 08:15:22'),(14,'MHELFIN KEY CARANDANG','22-00005@g.batsate-u.edu.ph','93581','$2a$10$Bcw4jgO6QDILOmgu8fJaMechbX24d5889GDKlyPebVYL04SCSjxpm',1,0.00,'2026-03-10 07:35:25','2026-03-10 08:15:22'),(15,'RUSSEL VINCENT V. MANALO','22-05652@g.batstate-u.edu.ph','42867','$2a$10$Bcw4jgO6QDILOmgu8fJaMechbX24d5889GDKlyPebVYL04SCSjxpm',1,0.00,'2026-03-10 07:35:25','2026-03-10 08:15:22'),(29,'Nheil Thomas Reyes','nheilthomas.reyes@g.batsate-u.edu.ph','29514','$2b$10$5QnUd9ivy87zij/m8bAAgu99NcsMZK8pGviUtIFU5YCvrhjfJ7UMy',1,0.00,'2026-03-11 00:35:48','2026-03-11 00:36:52');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_daily_attendance`
--

DROP TABLE IF EXISTS `v_daily_attendance`;
/*!50001 DROP VIEW IF EXISTS `v_daily_attendance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_daily_attendance` AS SELECT 
 1 AS `student_id`,
 1 AS `student_name`,
 1 AS `attendance_date`,
 1 AS `time_in`,
 1 AS `time_out`,
 1 AS `task_accomplishment`,
 1 AS `hours_worked`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_student_total_hours`
--

DROP TABLE IF EXISTS `v_student_total_hours`;
/*!50001 DROP VIEW IF EXISTS `v_student_total_hours`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_student_total_hours` AS SELECT 
 1 AS `student_id`,
 1 AS `student_name`,
 1 AS `total_days`,
 1 AS `total_hours`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_daily_attendance`
--

/*!50001 DROP VIEW IF EXISTS `v_daily_attendance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_daily_attendance` AS select `s`.`id` AS `student_id`,`s`.`full_name` AS `student_name`,cast(`a`.`timestamp` as date) AS `attendance_date`,max((case when (`a`.`status` = 'Time In') then cast(`a`.`timestamp` as time) end)) AS `time_in`,max((case when (`a`.`status` = 'Time Out') then cast(`a`.`timestamp` as time) end)) AS `time_out`,max((case when (`a`.`status` = 'Time Out') then `a`.`task_accomplishment` end)) AS `task_accomplishment`,round(greatest(0,least(((timestampdiff(MINUTE,greatest(convert(max((case when (`a`.`status` = 'Time In') then `a`.`timestamp` end)) using utf8mb4),concat(cast(`a`.`timestamp` as date),' 08:00:00')),least(convert(max((case when (`a`.`status` = 'Time Out') then `a`.`timestamp` end)) using utf8mb4),concat(cast(`a`.`timestamp` as date),' 17:00:00'))) / 60.0) - if(((timestampdiff(MINUTE,greatest(convert(max((case when (`a`.`status` = 'Time In') then `a`.`timestamp` end)) using utf8mb4),concat(cast(`a`.`timestamp` as date),' 08:00:00')),least(convert(max((case when (`a`.`status` = 'Time Out') then `a`.`timestamp` end)) using utf8mb4),concat(cast(`a`.`timestamp` as date),' 17:00:00'))) / 60.0) > 5),1,0)),9)),2) AS `hours_worked` from (`attendance_logs` `a` join `students` `s` on((`a`.`student_id` = `s`.`id`))) group by `s`.`id`,`s`.`full_name`,cast(`a`.`timestamp` as date) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_student_total_hours`
--

/*!50001 DROP VIEW IF EXISTS `v_student_total_hours`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_student_total_hours` AS select `v_daily_attendance`.`student_id` AS `student_id`,`v_daily_attendance`.`student_name` AS `student_name`,count(0) AS `total_days`,sum(`v_daily_attendance`.`hours_worked`) AS `total_hours` from `v_daily_attendance` group by `v_daily_attendance`.`student_id`,`v_daily_attendance`.`student_name` order by `total_hours` desc */;
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

-- Dump completed on 2026-03-11 12:19:31
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mtccservicemonitoring2
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Temporary view structure for view `client_list_view`
--

DROP TABLE IF EXISTS `client_list_view`;
/*!50001 DROP VIEW IF EXISTS `client_list_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `client_list_view` AS SELECT 
 1 AS `id`,
 1 AS `serviceRequestForm`,
 1 AS `name`,
 1 AS `address`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `company`,
 1 AS `category`,
 1 AS `serviceType`,
 1 AS `status`,
 1 AS `progress`,
 1 AS `dateRequested`,
 1 AS `startDate`,
 1 AS `dueDate`,
 1 AS `dateClaimed`,
 1 AS `dateReleased`,
 1 AS `requestForm`,
 1 AS `roa`,
 1 AS `ts`,
 1 AS `testDate`,
 1 AS `releasedROA`,
 1 AS `roaV`,
 1 AS `officialReceipt`,
 1 AS `remarks`,
 1 AS `testTypes`,
 1 AS `amount`,
 1 AS `sampleCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `serviceRequestForm` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `serviceType` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `progress` varchar(50) DEFAULT NULL,
  `dateRequested` date DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `dueDate` date DEFAULT NULL,
  `dateClaimed` date DEFAULT NULL,
  `dateReleased` date DEFAULT NULL,
  `requestForm` varchar(50) DEFAULT NULL,
  `roa` int DEFAULT NULL,
  `ts` int DEFAULT NULL,
  `testDate` date DEFAULT NULL,
  `releasedROA` date DEFAULT NULL,
  `roaV` int DEFAULT '0',
  `officialReceipt` int DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (23,'022026-Material-Testing-Service-Request-Form_ROA#1','josh',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Pending','0','2026-02-23',NULL,NULL,NULL,NULL,'Waiting',1,0,NULL,NULL,0,0,NULL),(24,'022026-Material-Testing-Service-Request-Form_TS#1','jush',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Pending','0','2026-02-24',NULL,NULL,NULL,NULL,'Waiting',0,1,NULL,NULL,0,0,NULL),(25,'022026-Material-Testing-Service-Request-Form_TS#2','jash',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Pending','0','2026-02-21',NULL,NULL,NULL,NULL,'Waiting',0,1,NULL,NULL,0,0,NULL),(26,'022026-Material-Testing-Service-Request-Form_ROA#2','jash',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Pending','0','2026-02-19',NULL,NULL,NULL,NULL,'Waiting',1,0,NULL,NULL,0,0,NULL),(27,'012025-Material-Testing-Service-Request-Form_ROA#1','Evander D. Lingon',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-01-14',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-01-21','2025-01-21',1,1,NULL),(29,'022025-Material-Testing-Service-Request-Form_ROA#2','Cherry Claire L. Jose',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-02-10',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-02-12','2025-02-02',1,1,NULL),(30,'022025-Material-Testing-Service-Request-Form_ROA#3','Kenneth Joshua D. Maderazo',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-02-10',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-02-20','2025-02-25',1,1,NULL),(31,'022025-Material-Testing-Service-Request-Form_ROA#4','Christine B. Terrenal',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-02-10',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-02-20','2025-02-24',1,1,NULL),(32,'022025-Material-Testing-Service-Request-Form_ROA#5','Avrile Nicole Calatong',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-02-10',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-02-13','2025-02-17',1,1,NULL),(33,'022025-Material-Testing-Service-Request-Form_ROA#6','Vhea Andrey Castillo',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-02-10',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-02-11','2025-02-12',1,1,NULL),(34,'022025-Material-Testing-Service-Request-Form_ROA#7','Andrea Nicole L. Castillo',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-02-11',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-02-13','2025-02-18',1,1,NULL),(35,'022025-Material-Testing-Service-Request-Form_ROA#8','Arren Jhunn B. Rivera',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-02-12',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-02-13','2025-02-25',1,1,NULL),(36,'022025-Material-Testing-Service-Request-Form_ROA#9','Marvey Klen Brucal',NULL,NULL,NULL,NULL,'Private HEIs','Material Testing','Completed','100','2025-02-12',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-02-20','2025-02-21',1,1,NULL),(37,'022025-Material-Testing-Service-Request-Form_ROA#10','Mateo Alfonso Guevarra',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-02-12',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-02-13','2025-02-21',1,1,NULL),(38,'022025-Material-Testing-Service-Request-Form_ROA#11','David Raj M. Calinawan',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Pending','0','2025-02-12',NULL,NULL,NULL,NULL,'Signed',0,0,NULL,NULL,0,0,NULL),(39,'022025-Material-Testing-Service-Request-Form_ROA#12','Peterson Ronquillo',NULL,NULL,NULL,NULL,'BatstateU IS','Material Testing','Completed','100','2025-02-12',NULL,NULL,NULL,NULL,'Signed',1,0,NULL,'2025-02-17',1,1,NULL),(40,'022025-Material-Testing-Service-Request-Form_ROA#13','Arianne M. De Castro',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-02-13',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-02-20','2025-02-21',1,1,NULL),(41,'022025-Material-Testing-Service-Request-Form_ROA#14','April Jay B. Asi',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-02-13',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-03','2025-03-04',1,1,NULL),(42,'022025-Material-Testing-Service-Request-Form_ROA#15','Nicole Angela L. Olit',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-02-17',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-02-19','2025-02-20',1,1,NULL),(43,'022025-Material-Testing-Service-Request-Form_ROA#16','Diana Eirene B. Manalo',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-02-18',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-02-19','2025-02-20',1,1,NULL),(44,'022025-Material-Testing-Service-Request-Form_ROA#17','Diana Eirene B. Manalo',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-02-18',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-02-20','2025-02-24',1,1,NULL),(45,'022025-Material-Testing-Service-Request-Form_ROA#18','Rhancesca Jhane E. Dela Cruz',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-02-19',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-02-19','2025-02-20',1,1,NULL),(46,'022025-Material-Testing-Service-Request-Form_ROA#19','Christine B. Terrenal',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-02-19',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-02-25','2025-02-26',1,1,NULL),(47,'022025-Material-Testing-Service-Request-Form_ROA#20','Miguel Angelo M. Catbagan',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-02-25',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-02-25','2025-03-10',1,1,NULL),(48,'022025-Material-Testing-Service-Request-Form_ROA#21','Tristan Kim Z. Briones',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-02-28',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-03','2025-03-07',1,1,NULL),(49,'022025-Material-Testing-Service-Request-Form_ROA#22','Benedict Laurence D. Aguila',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-02-28',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-03','2025-03-03',1,1,NULL),(50,'032025-Material-Testing-Service-Request-Form_ROA#23','Dave Leonel Vergara',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-03-03',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-05','2025-03-07',1,1,NULL),(51,'032025-Material-Testing-Service-Request-Form_ROA#24','Leiron Arjell V. Panganiban',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-03-03',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-05','2025-03-07',1,1,NULL),(52,'032025-Material-Testing-Service-Request-Form_ROA#25','Jaycee Karylle M. Dalisay',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-03-04',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-05','2025-03-07',1,1,NULL),(53,'032025-Material-Testing-Service-Request-Form_ROA#26','Maria Phloem Abringe',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-03-04',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-05','2025-03-07',1,1,NULL),(54,'032025-Material-Testing-Service-Request-Form_ROA#27','Dave Leonel Vergara',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-03-04',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-05','2025-03-07',1,1,NULL),(55,'032025-Material-Testing-Service-Request-Form_ROA#28','Mark Joshua L. Almarez',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-04',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-07','2025-03-11',1,1,NULL),(56,'032025-Material-Testing-Service-Request-Form_ROA#29','Joaqui Bergatz G. Panopio',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-07',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-10','2025-03-11',1,1,NULL),(57,'032025-Material-Testing-Service-Request-Form_ROA#30','Edrich Z. Bondoc',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-03-07',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-10','2025-03-10',1,1,NULL),(58,'032025-Material-Testing-Service-Request-Form_ROA#31','Ivhan Angelo G. Guanlao',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-03-07',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-10','2025-03-10',1,1,NULL),(59,'032025-Material-Testing-Service-Request-Form_ROA#32','Rodel P. Valdez Jr.',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-10',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-13','2025-03-18',1,1,NULL),(60,'032025-Material-Testing-Service-Request-Form_ROA#33','Krystel Yvonne C. Collado',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-03-13',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-13','2025-03-13',1,1,NULL),(61,'032025-Material-Testing-Service-Request-Form_ROA#34','Jerimae D. Macatangay',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-13',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-17','2025-03-18',1,1,NULL),(62,'032025-Material-Testing-Service-Request-Form_ROA#35','Neil Bryan Recillo',NULL,NULL,NULL,NULL,'Private HEIs','Material Testing','Completed','100','2025-03-13',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-13','2025-03-17',1,1,NULL),(63,'032025-Material-Testing-Service-Request-Form_ROA#36','Elijah Joseph Dizon',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-03-13',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-17','2025-03-18',1,1,NULL),(64,'032025-Material-Testing-Service-Request-Form_ROA#37','Pura Adeliz Carandang',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-14',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-17','2025-04-08',1,1,NULL),(65,'032025-Material-Testing-Service-Request-Form_ROA#38','Francis Anne Galudo',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-17',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-25','2025-03-27',1,1,NULL),(66,'032025-Material-Testing-Service-Request-Form_ROA#39','Leanne Jairah Gabrielle M. Dalhag',NULL,NULL,NULL,NULL,'BatstateU IS','Material Testing','Completed','100','2025-03-19',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-20','2025-03-20',1,1,NULL),(67,'032025-Material-Testing-Service-Request-Form_ROA#40','Aivy Grace Malibiran',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-20',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-25','2025-03-26',1,1,NULL),(68,'032025-Material-Testing-Service-Request-Form_ROA#41','Ma. Bea Lourdes S. Luistro',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-20',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-25','2025-03-27',1,1,NULL),(69,'032025-Material-Testing-Service-Request-Form_ROA#42','Dianne Marie E. Mallanao',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-21',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-11','2025-04-11',1,1,NULL),(70,'032025-Material-Testing-Service-Request-Form_ROA#43','Avrile Nicole Calatong',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-21',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-25','2025-03-27',1,1,NULL),(71,'032025-Material-Testing-Service-Request-Form_ROA#44','Clarise Olarte',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-21',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-24','2025-03-21',1,1,NULL),(72,'032025-Material-Testing-Service-Request-Form_ROA#45','Karl Marx Pominto',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-21',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-26','2025-03-31',1,1,NULL),(73,'032025-Material-Testing-Service-Request-Form_ROA#46','Jireh Mae J. Bagadiong',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-24',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-25','2025-03-31',1,1,NULL),(74,'032025-Material-Testing-Service-Request-Form_ROA#47','Karl Marx Pominto',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-24',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-28','2025-03-28',1,1,NULL),(75,'032025-Material-Testing-Service-Request-Form_ROA#48','Kaela Marie Aguda',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-25',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-25','2025-03-27',1,1,NULL),(76,'032025-Material-Testing-Service-Request-Form_ROA#49','Kaela Marie Aguda',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-25',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-25','2025-03-27',1,1,NULL),(77,'032025-Material-Testing-Service-Request-Form_ROA#50','Graciel Anne A. Lira',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-25',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-28','2025-03-28',1,1,NULL),(78,'032025-Material-Testing-Service-Request-Form_ROA#51','Kayla Marie Adap',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-03-26',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-27','2025-03-27',1,1,NULL),(79,'032025-Material-Testing-Service-Request-Form_ROA#52','Sanly Evardone',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-27',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-02','2025-04-03',1,1,NULL),(80,'032025-Material-Testing-Service-Request-Form_ROA#53','Clarise Olarte',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-28',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-28','2025-03-28',1,1,NULL),(81,'032025-Material-Testing-Service-Request-Form_ROA#54','Angelica Tejada',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-28',NULL,NULL,NULL,NULL,'Signed',1,0,NULL,'2025-04-10',1,1,NULL),(82,'032025-Material-Testing-Service-Request-Form_ROA#55','Glenda Bacal',NULL,NULL,NULL,NULL,'BatstateU IS','Material Testing','Completed','100','2025-03-31',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-03-31','2025-03-31',1,1,NULL),(83,'072025-Material-Testing-Service-Request-Form_ROA#56','Jeff Jansen Arellano',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-07-10',NULL,NULL,NULL,NULL,'Waiting',1,0,'2025-07-10',NULL,1,1,NULL),(84,'072025-Material-Testing-Service-Request-Form_ROA#57','Jeff Jansen Arellano',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-07-10',NULL,NULL,NULL,NULL,'Waiting',1,0,'2025-07-10',NULL,1,1,NULL),(85,'072025-Material-Testing-Service-Request-Form_ROA#58','Jeff Jansen Arellano',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-07-10',NULL,NULL,NULL,NULL,'Waiting',1,0,'2025-07-10',NULL,1,1,NULL),(86,'032025-Material-Testing-Service-Request-Form_ROA#59','Angelica Tejada',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-03-31',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-04','2025-04-08',1,1,NULL),(87,'042025-Material-Testing-Service-Request-Form_ROA#60','Raneil E. Alvarez',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-02',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-04','2025-04-08',1,1,NULL),(88,'042025-Material-Testing-Service-Request-Form_ROA#61','Krystelle Joy Macatangay',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-02',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-02','2025-04-08',1,1,NULL),(89,'042025-Material-Testing-Service-Request-Form_ROA#62','Rhian Gabrielle P. Gabay',NULL,NULL,NULL,NULL,'BatstateU IS','Material Testing','Completed','100','2025-04-02',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-04','2025-04-04',1,1,NULL),(90,'042025-Material-Testing-Service-Request-Form_ROA#63','Kharl Louiz Ferrera',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-03',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-04','2025-04-08',1,1,NULL),(91,'042025-Material-Testing-Service-Request-Form_ROA#64','Zaira Mae Gegante',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-03',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-04','2025-04-04',1,1,NULL),(92,'042025-Material-Testing-Service-Request-Form_ROA#65','Florence Mae M. Recesio',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-03',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-07','2025-04-10',1,1,NULL),(93,'042025-Material-Testing-Service-Request-Form_ROA#66','Clarise Olarte',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-04',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-04','2025-04-08',1,1,NULL),(94,'042025-Material-Testing-Service-Request-Form_ROA#67','Marie Francine M. Amul',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-07',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-14','2025-04-14',1,1,NULL),(95,'042025-Material-Testing-Service-Request-Form_ROA#68','Arren Jhunn B. Rivera',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-07',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-14','2025-04-15',1,1,NULL),(96,'042025-Material-Testing-Service-Request-Form_ROA#69','Charles Gabriel C. Dictado',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-07',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-14','2025-04-15',1,1,NULL),(97,'042025-Material-Testing-Service-Request-Form_ROA#70','Arianne Mathel S. Sanchez',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-07',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-14','2025-04-15',1,1,NULL),(98,'042025-Material-Testing-Service-Request-Form_ROA#71','Erica L. Paloma',NULL,NULL,NULL,NULL,'Private HEIs','Material Testing','Completed','100','2025-04-08',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-08','2025-04-08',1,1,NULL),(99,'042025-Material-Testing-Service-Request-Form_ROA#72','Daniella Imerie Trayvilla',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-08',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-11','2025-04-11',1,1,NULL),(100,'042025-Material-Testing-Service-Request-Form_ROA#73','Ammelia Paula S. Espiritu',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-08',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-14','2025-04-15',1,1,NULL),(101,'042025-Material-Testing-Service-Request-Form_ROA#74','Uriel B. Delgado',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-11',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-15','2025-04-15',1,1,NULL),(102,'042025-Material-Testing-Service-Request-Form_ROA#74','Uriel B. Delgado',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-11',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-15','2025-04-15',1,1,NULL),(103,'042025-Material-Testing-Service-Request-Form_ROA#76','Lyka Ghwen Candor',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-14',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-15','2025-04-15',1,1,NULL),(104,'042025-Material-Testing-Service-Request-Form_ROA#77','Emanuel A. Marasigan',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-14',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-21','2025-04-22',1,1,NULL),(105,'042025-Material-Testing-Service-Request-Form_ROA#78','Roanne Ilagan',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-14',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-15','2025-04-15',1,1,NULL),(106,'042025-Material-Testing-Service-Request-Form_ROA#79','Kim Aljon C. Enriquez',NULL,NULL,NULL,NULL,'Private HEIs','Material Testing','Completed','100','2025-04-15',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-24','2025-04-25',1,1,NULL),(107,'042025-Material-Testing-Service-Request-Form_ROA#80','Mary Rose Diane F. Fajilagmago',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-15',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-22','2025-04-24',1,1,NULL),(108,'042025-Material-Testing-Service-Request-Form_ROA#81','Miguel Angelo M. Catbagan',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-16',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-21','2025-04-28',1,1,NULL),(109,'042025-Material-Testing-Service-Request-Form_ROA#82','Dianne Marie E. Mallanao',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-21',NULL,NULL,NULL,NULL,'Signed',1,0,NULL,'2025-04-28',1,1,NULL),(110,'042025-Material-Testing-Service-Request-Form_ROA#83','Arianne Mathel S. Sanchez',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-21',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-22','2025-04-24',1,1,NULL),(111,'042025-Material-Testing-Service-Request-Form_ROA#84','Dianne Marie E. Mallanao',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-23',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-24','2025-04-25',1,1,NULL),(112,'042025-Material-Testing-Service-Request-Form_ROA#85','Daniel Benj de Leon',NULL,NULL,NULL,NULL,'Industry','Material Testing','Completed','100','2025-04-24',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-24','2025-04-25',1,1,NULL),(113,'042025-Material-Testing-Service-Request-Form_ROA#86','Aaron B. Mercado',NULL,NULL,NULL,NULL,'BatstateU IS','Material Testing','Completed','100','2025-04-25',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-25','2025-04-25',1,1,NULL),(114,'042025-Material-Testing-Service-Request-Form_ROA#87','Cris G. De Torres',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-25',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-28','2025-04-30',1,1,NULL),(115,'042025-Material-Testing-Service-Request-Form_ROA#88','Julie Pearl M. Andal',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-25',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-04-29','2025-04-30',1,1,NULL),(116,'042025-Material-Testing-Service-Request-Form_ROA#89','Jeff Jansen Arellano',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-28',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-07-10','2025-07-15',1,1,NULL),(117,'042025-Material-Testing-Service-Request-Form_ROA#90','Ubas, Cherry Jean',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-28',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-05-02','2025-05-08',1,1,NULL),(118,'052025-Material-Testing-Service-Request-Form_ROA#91','John Isaac Olave',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-29',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-05-02','2025-05-13',1,1,NULL),(119,'052025-Material-Testing-Service-Request-Form_ROA#92','Maria Tricia Lumayno',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-04-30',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-05-05','2025-05-13',1,1,NULL),(120,'052025-Material-Testing-Service-Request-Form_ROA#93','Magtibay, Val Emerson N.',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-05-02',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-05-05','2025-05-05',1,1,NULL),(121,'052025-Material-Testing-Service-Request-Form_ROA#94','Laja, Angel Dayne Joshua',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-05-02',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-05-02','2025-05-08',1,1,NULL),(122,'052025-Material-Testing-Service-Request-Form_ROA#95','Cambe Efraim',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-05-02',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-05-05','2025-05-05',1,1,NULL),(123,'052025-Material-Testing-Service-Request-Form_ROA#96','Tolentino, Angela Anselm',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-05-05',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-05-05','2025-05-05',1,1,NULL),(124,'052025-Material-Testing-Service-Request-Form_ROA#97','Rio, Roentgen C.',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-05-14',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-05-19','2025-05-19',1,1,NULL),(125,'052025-Material-Testing-Service-Request-Form_ROA#98','Jeremie Emerson A. Garcia',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-05-14',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-05-15','2025-05-15',1,1,NULL),(126,'052025-Material-Testing-Service-Request-Form_ROA#99','Alduein Cy Fulgar',NULL,NULL,NULL,NULL,'Private HEIs','Material Testing','Completed','100','2025-05-14',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-05-20','2025-05-20',1,1,NULL),(127,'052025-Material-Testing-Service-Request-Form_ROA#100','Krystelle Joy Macatangay',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-05-15',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-05-16','2025-05-16',1,1,NULL),(128,'052025-Material-Testing-Service-Request-Form_ROA#101','Hannah Gabrielle Panganiban',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-05-16',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-05-29','2025-06-05',1,1,NULL),(129,'052025-Material-Testing-Service-Request-Form_ROA#102','Cassius Marcellos Clay M. Dimpasoc',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-05-21',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-06-02','2025-06-03',1,1,NULL),(130,'052025-Material-Testing-Service-Request-Form_ROA#103','Jazel L. Alves',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-05-21',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-05-29','2025-05-30',1,1,NULL),(131,'052025-Material-Testing-Service-Request-Form_ROA#104','Jade Valerie Obispo',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-05-21',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-05-27','2025-05-27',1,1,NULL),(132,'052025-Material-Testing-Service-Request-Form_ROA#105','Davey Von Dimatatac',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-05-29',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-05-29','2025-05-30',1,1,NULL),(133,'062025-Material-Testing-Service-Request-Form_ROA#106','Dianne Marie E. Mallanao',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-06-02',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-06-02','2025-07-15',1,1,NULL),(134,'062025-Material-Testing-Service-Request-Form_ROA#107','Ralph Angelo Bejo',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-06-03',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-06-04','2025-06-09',1,1,NULL),(135,'062025-Material-Testing-Service-Request-Form_ROA#108','Abraham F. Quintia Jr.',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-06-04',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-06-09','2025-06-19',1,1,NULL),(136,'062025-Material-Testing-Service-Request-Form_ROA#109','Jeff Janssen Arellano',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-06-30',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-06-30','2025-07-10',1,1,NULL),(137,'062025-Material-Testing-Service-Request-Form_ROA#110','Ralph Angelo Bejo',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-06-09',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-06-11','2025-06-11',1,1,NULL),(138,'062025-Material-Testing-Service-Request-Form_ROA#111','Giancarlo Ebe',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-06-09',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-06-11','2025-06-17',1,1,NULL),(139,'062025-Material-Testing-Service-Request-Form_ROA#112','Maxinne Gloria R. Bugay',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-06-16',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-06-19','2025-07-21',1,1,NULL),(140,'062025-Material-Testing-Service-Request-Form_ROA#113','Krischelle F. Magracia',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-06-24',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-06-26','2025-06-27',1,1,NULL),(141,'062025-Material-Testing-Service-Request-Form_ROA#114','Vince Jaspher R. Agno',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-06-26',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-06-26','2025-07-09',1,1,NULL),(142,'072025-Material-Testing-Service-Request-Form_ROA#115','JOHN VINCENT AGUILA',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-07-08',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-07-11','2025-07-26',1,1,NULL),(143,'072025-Material-Testing-Service-Request-Form_ROA#116','CHRISTIAN ROYDCARL CASTILLO',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-07-09',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-07-10',NULL,1,1,NULL),(144,'072025-Material-Testing-Service-Request-Form_ROA#117','Jeff Janssen Arellano',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-07-29',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-07-29','2025-08-15',1,1,NULL),(145,'082025-Material-Testing-Service-Request-Form_ROA#118','Racquel Joy E. Caser',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-08-01',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-08-04','2025-08-06',1,1,NULL),(146,'082025-Material-Testing-Service-Request-Form_ROA#119','PRINCE ANGELO DALISAY',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Pending','0','2025-08-05',NULL,NULL,NULL,NULL,'Waiting',0,0,NULL,NULL,0,0,NULL),(147,'082025-Material-Testing-Service-Request-Form_ROA#120','DOROTHY MAE M. RECATO',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-08-08',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-08-08','2025-08-14',1,1,NULL),(148,'082025-Material-Testing-Service-Request-Form_ROA#122','KAELA MARIE AGUDA',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Ongoing','50','2025-08-15',NULL,NULL,NULL,NULL,'Waiting',0,0,NULL,'2025-08-28',0,1,NULL),(149,'082025-Material-Testing-Service-Request-Form_ROA#121','Rodel P. Valdez Jr.',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-08-13',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-08-14','2025-08-15',1,1,NULL),(150,'082025-Material-Testing-Service-Request-Form_ROA#123','RHIAN ANGEL L. SAPUNGAN',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-08-15',NULL,NULL,NULL,NULL,'Signed',1,0,NULL,'2025-08-28',1,1,NULL),(151,'082025-Material-Testing-Service-Request-Form_ROA#124','SHERMAINE G. ORCASITAS',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-08-15',NULL,NULL,NULL,NULL,'Signed',1,0,NULL,'2025-08-28',1,1,NULL),(152,'082025-Material-Testing-Service-Request-Form_ROA#125','ANDRE M. MANDIA',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-08-15',NULL,NULL,NULL,NULL,'Signed',1,0,NULL,'2025-08-28',1,1,NULL),(153,'082025-Material-Testing-Service-Request-Form_ROA#126','JEAN LYKA JAMBALOS',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-08-15',NULL,NULL,NULL,NULL,'Signed',1,0,NULL,'2025-08-28',1,1,NULL),(154,'082025-Material-Testing-Service-Request-Form_ROA#127','ANGEL KATE C. RAZON',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-08-15',NULL,NULL,NULL,NULL,'Signed',1,0,NULL,'2025-08-28',1,1,NULL),(155,'082025-Material-Testing-Service-Request-Form_ROA#128','CIDRICK D. SORIANO',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-08-15',NULL,NULL,NULL,NULL,'Signed',1,0,NULL,'2025-08-28',1,1,NULL),(156,'082025-Material-Testing-Service-Request-Form_ROA#129','BETHANY ACERON',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-08-15',NULL,NULL,NULL,NULL,'Signed',1,0,NULL,'2025-08-28',1,1,NULL),(157,'082025-Material-Testing-Service-Request-Form_ROA#130','MARC JUSTIN B. DE VILLA',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-08-22',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-08-26','2025-08-28',1,1,NULL),(158,'082025-Material-Testing-Service-Request-Form_ROA#131','ANGELA MAE ALORIA',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-08-27',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-08-29','2025-08-29',1,1,NULL),(159,'082025-Material-Testing-Service-Request-Form_ROA#132','JAEA GERWELL G. EVANGELISTA',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-08-28',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-08-29','2025-08-29',1,1,NULL),(160,'092025-Material-Testing-Service-Request-Form_ROA#133','PRINCE ANGELO DALISAY',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-09-17',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-09-25','2025-09-30',1,1,NULL),(161,'092025-Material-Testing-Service-Request-Form_ROA#134','GREGG ANZEL LIWAG',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-09-03',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-09-05','2025-09-08',1,1,NULL),(162,'092025-Material-Testing-Service-Request-Form_ROA#135','Artiannna Arene Dela Cuadra',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-09-17',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-09-25','2025-10-02',1,1,NULL),(163,'092025-Material-Testing-Service-Request-Form_ROA#140','BEA MAGSOMBOL',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Ongoing','50','2025-09-04',NULL,NULL,NULL,NULL,'Signed',0,0,'2025-09-04',NULL,0,1,NULL),(164,'092025-Material-Testing-Service-Request-Form_ROA#136','JORDAN LOUIS D. MACALINDONG',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-09-05',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-09-08','2025-09-08',1,1,NULL),(165,'092025-Material-Testing-Service-Request-Form_ROA#141','HANNA MAE C. MENDOZA',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Ongoing','50','2025-09-05',NULL,NULL,NULL,NULL,'Signed',0,0,'2025-09-05',NULL,0,1,NULL),(166,'092025-Material-Testing-Service-Request-Form_ROA#137','KEIZEL ANN APIGO',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-09-05',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-09-08','2025-09-09',1,1,NULL),(167,'092025-Material-Testing-Service-Request-Form_ROA#138','DELGADO, URIEL B.',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-09-17',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-09-25','2025-09-30',1,1,NULL),(168,'092025-Material-Testing-Service-Request-Form_ROA#139','JOSE MARI N. PAPIO',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-09-08',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-09-09','2025-09-09',1,1,NULL),(169,'092025-Material-Testing-Service-Request-Form_ROA#142','GWYNETH PENELOPE M. DE LEON',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-09-17',NULL,NULL,NULL,NULL,'Signed',1,0,NULL,NULL,1,1,NULL),(170,'092025-Material-Testing-Service-Request-Form_ROA#143','BEA MAGSOMBOL',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-09-18',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-09-25','2025-09-30',1,1,NULL),(171,'092025-Material-Testing-Service-Request-Form_ROA#144','HANNA MAE C. MENDOZA',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-09-18',NULL,NULL,NULL,NULL,'Signed',1,0,NULL,'2025-10-17',1,1,NULL),(172,'092025-Material-Testing-Service-Request-Form_ROA#145','ANNE CLARISSE JUNIO',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-09-19',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-09-25','2025-09-30',1,1,NULL),(173,'092025-Material-Testing-Service-Request-Form_ROA#146','SHANE C. CLEMINO',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-09-19',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-09-25','2025-09-30',1,1,NULL),(174,'102025-Material-Testing-Service-Request-Form_ROA#147','JOSE MARI PAPIO',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-10-03',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-10-13','2025-10-16',1,1,NULL),(175,'102025-Material-Testing-Service-Request-Form_ROA#148','HANNA MAE C. MENDOZA',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-10-03',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-10-13','2025-10-14',1,1,NULL),(176,'102025-Material-Testing-Service-Request-Form_ROA#149','BEA MAGSOMBOL',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-10-06',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-10-13','2025-10-13',1,1,NULL),(177,'102025-Material-Testing-Service-Request-Form_ROA#150','FRANCISCO ANDREI JOSEPH LAUDEZ',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-10-07',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-10-13','2025-10-16',1,1,NULL),(178,'102025-Material-Testing-Service-Request-Form_ROA#151','DANNA HAZEL V. ATIENZA',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-10-07',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-10-13','2025-10-15',1,1,NULL),(179,'102025-Material-Testing-Service-Request-Form_ROA#152','KIMSUN C. HERRERA',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-10-09',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-10-13','2025-10-17',1,1,NULL),(180,'102025-Material-Testing-Service-Request-Form_ROA#153','PATRICIA ANNE S. ASI',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-10-09',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-10-13','2025-10-16',1,1,NULL),(181,'102025-Material-Testing-Service-Request-Form_ROA#154','MONICA B. BAUTISTA',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-10-13',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-10-20',NULL,1,1,NULL),(182,'102025-Material-Testing-Service-Request-Form_ROA#155','BEA MAGSOMBOL',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-10-16',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-10-20','2025-10-22',1,1,NULL),(183,'102025-Material-Testing-Service-Request-Form_ROA#156','ABDUL KHALID M. AMPUAN',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-10-17',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-10-20','2025-10-27',1,1,NULL),(184,'102025-Material-Testing-Service-Request-Form_ROA#157','MARCH ANDRIEL G. SILANG',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-10-17',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-10-20','2025-11-04',1,1,NULL),(185,'102025-Material-Testing-Service-Request-Form_ROA#158','ANNE CLARISSE JUNIO',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-10-17',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-10-20','2025-10-27',1,1,NULL),(186,'102025-Material-Testing-Service-Request-Form_ROA#159','CARL JUSTINE P. INTAC',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-10-27',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-17','2025-11-18',1,1,NULL),(187,'102025-Material-Testing-Service-Request-Form_ROA#160','NICKO P. MENDOZA',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-10-28',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-03','2025-11-05',1,1,NULL),(188,'102025-Material-Testing-Service-Request-Form_ROA#161','JAINNA R. MASONGSONG',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-10-28',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-03','2025-11-05',1,1,NULL),(189,'102025-Material-Testing-Service-Request-Form_ROA#162','JAMES LAWRENCE SELOS',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-10-30',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-10-27','2025-11-05',1,1,NULL),(190,'102025-Material-Testing-Service-Request-Form_ROA#163','KAYZER ANN PEREZ',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-10-30',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-03','2025-11-05',1,1,NULL),(191,'112025-Material-Testing-Service-Request-Form_ROA#164','JULIO JOAQUIN CAS',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-11-05',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-07','2025-11-11',1,1,NULL),(192,'112025-Material-Testing-Service-Request-Form_ROA#165','KLAIRE AUDREY D. PATULOT',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-11-06',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-07','2025-11-11',1,1,NULL),(193,'112025-Material-Testing-Service-Request-Form_ROA#166','EUMHILYN PORTINTO',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-11-06',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-07','2025-11-11',1,1,NULL),(194,'112025-Material-Testing-Service-Request-Form_ROA#167','KHEN RHYAN PAMBAGO',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-11-12',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-12','2025-11-17',1,1,NULL),(195,'112025-Material-Testing-Service-Request-Form_ROA#168','BEA MAGSOMBOL',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-11-17',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-19','2025-11-19',1,1,NULL),(196,'112025-Material-Testing-Service-Request-Form_ROA#169','SHAINETH ILAO',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-11-18',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-18','2025-11-18',1,1,NULL),(197,'112025-Material-Testing-Service-Request-Form_ROA#170','JHONAS TYRON L. MELICAN',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-11-20',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-20','2025-11-24',1,1,NULL),(198,'112025-Material-Testing-Service-Request-Form_ROA#171','MA. CATHLYN OLAVARIO',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-11-20',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-20','2025-11-25',1,1,NULL),(199,'112025-Material-Testing-Service-Request-Form_ROA#172','NOLILYN A. PADERON',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-11-20',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-20','2025-11-25',1,1,NULL),(200,'112025-Material-Testing-Service-Request-Form_ROA#173','JANE KAYLA ARONICO',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-11-20',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-20','2025-11-25',1,1,NULL),(201,'112025-Material-Testing-Service-Request-Form_ROA#174','VICTORIA FAITH VALENZUELA',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-11-20',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-24','2025-11-25',1,1,NULL),(202,'112025-Material-Testing-Service-Request-Form_ROA#175','ROVICK GWYNETH T. PARZUELO',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-11-24',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-28','2025-12-01',1,1,NULL),(203,'112025-Material-Testing-Service-Request-Form_ROA#176','CHRISTINE TENORIO',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-11-24',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-24','2025-11-26',1,1,NULL),(204,'112025-Material-Testing-Service-Request-Form_ROA#177','JOHN RALPH DE ROXAS',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-11-25',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-28','2025-12-01',1,1,NULL),(205,'112025-Material-Testing-Service-Request-Form_ROA#178','SOFIA GERARD D. DIMAANO',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-11-26',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-28','2025-12-01',1,1,NULL),(206,'112025-Material-Testing-Service-Request-Form_ROA#179','Bianca Audrey R. Rosana',NULL,NULL,NULL,NULL,'Senior High','Material Testing','Completed','100','2025-11-26',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-28','2025-12-01',1,1,NULL),(207,'112025-Material-Testing-Service-Request-Form_ROA#180','Klaire Audrey D. Patulot',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-11-26',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-28','2025-12-01',1,1,NULL),(208,'112025-Material-Testing-Service-Request-Form_ROA#181','ABEGAIL M. ARRIOLA',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Completed','100','2025-11-27',NULL,NULL,NULL,NULL,'Signed',1,0,'2025-11-28','2025-12-01',1,1,NULL),(209,'112025-Material-Testing-Service-Request-Form_ROA#182','JAKE ANDREW DEQUITO',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Ongoing','50','2025-11-27',NULL,NULL,NULL,NULL,'Signed',0,0,NULL,NULL,0,1,NULL),(210,'112025-Material-Testing-Service-Request-Form_ROA#183','GERLIEN B. GONZALES',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Ongoing','50','2025-11-27',NULL,NULL,NULL,NULL,'Signed',0,0,NULL,NULL,0,1,NULL),(211,'112025-Material-Testing-Service-Request-Form_ROA#184','GERLIEN B. GONZALES',NULL,NULL,NULL,NULL,'BatStateU College','Material Testing','Ongoing','50','2025-11-28',NULL,NULL,NULL,NULL,'Signed',0,0,NULL,NULL,0,1,NULL),(212,'112025-Material-Testing-Service-Request-Form_ROA#185','JOHN PAUL SALAZAR',NULL,NULL,NULL,NULL,'Private HEIs','Material Testing','Ongoing','50','2025-11-28',NULL,NULL,NULL,NULL,'Signed',0,0,NULL,NULL,0,1,NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company` (`company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_tests`
--

DROP TABLE IF EXISTS `service_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_tests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_id` int NOT NULL,
  `testType` varchar(10) NOT NULL,
  `sampleNo1` varchar(100) DEFAULT NULL,
  `sampleNo2` varchar(100) DEFAULT NULL,
  `sampleCount` int DEFAULT '0',
  `specimenNo` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `fk_service_tests_service_id` (`service_id`),
  CONSTRAINT `fk_service_tests_service_id` FOREIGN KEY (`service_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_tests`
--

LOCK TABLES `service_tests` WRITE;
/*!40000 ALTER TABLE `service_tests` DISABLE KEYS */;
INSERT INTO `service_tests` VALUES (19,23,'FTIR','1','2',2,'FTIR 1-2',1600.00),(20,24,'CN','3','4',2,'CN 3-4',200.00),(21,25,'FTIR','5','6',2,'FTIR 5-6',1600.00),(22,25,'CN','7','8',2,'CN 7-8',200.00),(23,26,'FTIR','10','11',2,'FTIR 10-11',1600.00),(24,27,'FTIR','1','1',1,'FTIR 1',500.00),(25,29,'CT','2','19',18,'CT 02-19',4500.00),(26,30,'CT','20','24',5,'CT 20-34',1250.00),(27,31,'CT','25','28',4,'CT 35-38',1000.00),(28,32,'FTIR','29','29',1,'FTIR 39',800.00),(29,33,'FTIR','30','30',1,'FTIR 40',500.00),(30,34,'FTIR','31','31',1,'FTIR 41',500.00),(31,35,'FTIR','32','36',5,'FTIR 42-46',4000.00),(32,36,'CT','37','38',2,'CT 47-48',500.00),(33,37,'FTIR','39','40',2,'FTIR 49-50',1000.00),(34,37,'CTT','41','42',2,'CTT 51-52',560.00),(35,38,'TS','43','43',1,'TS 53-55',0.00),(36,39,'CT','44','55',12,'CT 56-79',3000.00),(37,40,'MO','56','59',4,'MO 80-83',1000.00),(38,40,'CT','60','63',4,'CT 84-87',1000.00),(39,41,'FTIR','64','64',1,'FTIR 88',800.00),(40,42,'FTIR','65','66',2,'FTIR 89-90',1000.00),(41,43,'FTIR','67','67',1,'FTIR 91',800.00),(42,44,'CT','68','72',5,'CT 92-96',1250.00),(43,45,'FTIR','73','74',2,'FTIR 97-98',1600.00),(44,46,'CT','75','75',1,'CT 99',250.00),(45,46,'FT','76','76',1,'FT100',250.00),(46,47,'CT','77','82',6,'CT 101-106',1500.00),(47,48,'FTIR','83','83',1,'FTIR 107',800.00),(48,49,'FTIR','84','85',2,'FTIR 108-109',1600.00),(49,50,'FT','86','86',1,'FT 110',250.00),(50,50,'HT','87','87',1,'HT 111',300.00),(51,51,'MO','88','88',1,'MO 112',250.00),(52,52,'CT','89','91',3,'CT 113-115',750.00),(53,52,'HT','92','94',3,'HT 116-118',900.00),(54,53,'TS','95','95',1,'TS 119',250.00),(55,53,'MO','96','96',1,'MO 120',300.00),(56,54,'HT','97','97',1,'HT121',300.00),(57,55,'FTIR','98','99',2,'FTIR 122-123',1600.00),(58,56,'FTIR','100','100',1,'FTIR 124',800.00),(59,57,'FTIR','101','102',2,'FTIR 125-126',1600.00),(60,58,'FTIR','103','103',1,'FTIR 127',800.00),(61,59,'FTIR','104','104',1,'FTIR 128',500.00),(62,60,'FTIR','105','105',1,'FTIR 129',500.00),(63,61,'FTIR','106','106',1,'FTIR 130',800.00),(64,62,'FT','107','108',2,'FT 131-132',500.00),(65,62,'TS','109','110',2,'TS 133-134',500.00),(66,62,'HT','111','112',2,'HT135-136',600.00),(67,63,'FTIR','113','113',1,'FTIR 137',800.00),(68,64,'FTIR','114','116',3,'FTIR 138-140',2400.00),(69,65,'FTIR','117','117',1,'FTIR 141',800.00),(70,66,'CT','118','119',2,'CT 142-143',500.00),(71,66,'HT','120','121',2,'HT 144-145',600.00),(72,67,'FTIR','122','126',5,'FTIR 146-150',4000.00),(73,68,'FTIR','127','127',1,'FTIR 151',800.00),(74,69,'TS','128','139',12,'TS 152-163',3000.00),(75,70,'FTIR','140','140',1,'FTIR 164',800.00),(76,71,'CT','141','148',8,'CT 165-172',2000.00),(77,72,'CT','149','150',2,'CT 173-174',500.00),(78,73,'FTIR','151','151',1,'FTIR 175',800.00),(79,74,'FTIR','152','153',2,'FTIR 176-177',1600.00),(80,75,'FTIR','154','154',1,'FTIR 178',800.00),(81,76,'FTIR','155','155',1,'FTIR 179',800.00),(82,77,'FTIR','156','156',1,'FTIR 180',800.00),(83,78,'HT','157','157',1,'HT 181-183',300.00),(84,78,'CT','158','158',1,'CT 184-186',250.00),(85,79,'FTIR','159','159',1,'FTIR 187',800.00),(86,80,'CT','160','167',8,'CT 188-195',2000.00),(87,81,'TS','168','175',8,'TS 196-199, FT 200-203',2000.00),(88,82,'HT','176','176',1,'HT 204',300.00),(89,82,'MO','177','177',1,'MO 205',250.00),(90,83,'CT','178','178',1,'CT 206',0.00),(91,84,'CT','179','180',2,'CT 207-208',0.00),(92,85,'CT','181','182',2,'CT 209-210',0.00),(93,86,'CT','183','183',1,'CT 211',250.00),(94,87,'CT','184','195',12,'CT 212-223',3000.00),(95,88,'FTIR','196','196',1,'FTIR 224',800.00),(96,89,'HT','197','197',1,'HT 225',300.00),(97,89,'MO','198','198',1,'MO 226',250.00),(98,90,'TS','199','202',4,'TS 227-230',1000.00),(99,90,'FT','203','206',4,'FT 231-234',1000.00),(100,91,'MO','207','208',2,'MO 235-236',500.00),(101,92,'FTIR','209','209',1,'FTIR 237',800.00),(102,93,'CT','210','217',8,'CT 238-245',2000.00),(103,94,'FTIR','218','218',1,'FTIR 246',800.00),(104,95,'FTIR','219','219',1,'FTIR 247',800.00),(105,96,'FTIR','220','220',1,'FTIR 248',800.00),(106,97,'FTIR','221','223',3,'FTIR 249-251',2400.00),(107,98,'HT','224','226',3,'HT 252-254',900.00),(108,99,'FT','227','229',3,'FT 255-257',750.00),(109,100,'FTIR','230','231',2,'FTIR 258-259',1300.00),(110,101,'FTIR','232','232',1,'FTIR 260',500.00),(111,101,'FTIR','232','232',1,'FTIR 260',500.00),(112,103,'FTIR','245','245',1,'FTIR 273',800.00),(113,104,'FTIR','246','247',2,'FTIR 274-275',1600.00),(114,105,'FTIR','248','248',1,'FTIR 276',800.00),(115,106,'HT','249','249',1,'HT 277',300.00),(116,106,'MO','250','250',1,'MO 278',250.00),(117,107,'FTIR','251','252',2,'279-280',1600.00),(118,108,'CT','253','255',3,'CT 281-283',750.00),(119,109,'HT','256','265',10,'HT 284-293',3000.00),(120,109,'TS','266','275',10,'TS 294-303',2500.00),(121,110,'FTIR','276','276',1,'FTIR 304',800.00),(122,111,'HT','277','296',20,'HT 305-324',6000.00),(123,112,'TS','297','300',4,'TS 325-328',1100.00),(124,113,'HT','301','303',3,'HT 329-331',900.00),(125,113,'MO','304','306',3,'MO 332-334',750.00),(126,114,'FTIR','307','314',8,'335-342',0.00),(127,115,'CT','315','334',20,'CT 343-362',5000.00),(128,115,'HT','335','354',20,'HT 363-382',6000.00),(129,116,'CT','355','355',1,'TS 383',0.00),(130,117,'TS','356','365',10,'TS 384-393',2500.00),(131,118,'TS','366','375',10,'TS 394-403',2500.00),(132,119,'MO','376','376',1,'MO 404',250.00),(133,120,'FTIR','377','377',1,'FTIR 405',800.00),(134,121,'TS','378','387',10,'TS 406-415',2500.00),(135,122,'FTIR','388','389',2,'FTIR 416-417',1600.00),(136,123,'HT','390','392',3,'HT 418-420',900.00),(137,124,'TS','393','402',10,'TS 421-430',2500.00),(138,125,'FTIR','403','404',2,'FTIR 431-432',0.00),(139,126,'TS','405','407',3,'TS 433-435',750.00),(140,126,'CT','408','416',9,'CT 436-444',2250.00),(141,127,'FTIR','417','417',1,'FTIR 445',800.00),(142,128,'FTIR','418','418',1,'FTIR 446',800.00),(143,129,'FT','419','421',3,'FT  447-449',750.00),(144,130,'FTIR','422','422',1,'FTIR 450',800.00),(145,131,'HT','423','423',1,'HT 451',300.00),(146,132,'FTIR','424','424',1,'FTIR 452',800.00),(147,133,'HT','425','427',3,'HT 453-455',900.00),(148,133,'TS','428','428',1,'TS 456',250.00),(149,134,'FTIR','429','429',1,'FTIR 457',800.00),(150,135,'FTIR','430','430',1,'FTIR 458',800.00),(151,136,'CT','431','432',2,'CT 459-460',0.00),(152,137,'FTIR','433','433',1,'FTIR 461',800.00),(153,138,'FTIR','434','434',1,'FTIR 462',800.00),(154,139,'FTIR','435','435',1,'FTIR 463',800.00),(155,140,'FTIR','436','438',3,'FTIR 464-466',1500.00),(156,141,'FTIR','439','439',1,'FTIR 467',800.00),(157,142,'FTIR','440','448',9,'FTIR 468-476',7200.00),(158,143,'HT','449','451',3,'HT 477-479',900.00),(159,143,'TS','452','454',3,'TS 480-482',750.00),(160,143,'CT','455','457',3,'CT 483-485',750.00),(161,144,'FT','458','463',6,'FT 486-491',0.00),(162,145,'FTIR','464','465',2,'FTIR 492-493',1600.00),(163,146,'FTIR','466','466',1,'FTIR 494',800.00),(164,147,'FTIR','467','467',1,'FTIR 495',800.00),(165,148,'CT','470','485',16,'CT 498-513',4000.00),(166,148,'TS','486','501',16,'TS 514-529',4000.00),(167,148,'HT','502','517',16,'HT 530-545',4800.00),(168,149,'FTIR','468','469',2,'FTIR 496-497',1000.00),(169,150,'FTIR','518','518',1,'FTIR 546',500.00),(170,151,'FTIR','519','519',1,'FTIR 547',500.00),(171,152,'FTIR','520','520',1,'FTIR 548',500.00),(172,153,'FTIR','521','521',1,'FTIR 549',800.00),(173,154,'FTIR','522','522',1,'FTIR 550',500.00),(174,155,'FTIR','523','523',1,'FTIR 551',500.00),(175,156,'FTIR','524','524',1,'FTIR 552',800.00),(176,157,'FTIR','525','525',1,'FTIR 553',800.00),(177,158,'FTIR','526','526',1,'FTIR 554',800.00),(178,159,'FTIR','527','527',1,'FTIR 555',0.00),(179,159,'FTIR','528','528',1,'FTIR 556',0.00),(180,160,'FTIR','539','539',1,'FTIR 567',800.00),(181,161,'FTIR','529','529',1,'FTIR 557',800.00),(182,162,'FTIR','540','540',1,'FTIR 568',800.00),(183,163,'CN','530','530',1,'CN 558',150.00),(184,164,'FTIR','531','532',2,'FTIR 559 - 560',1600.00),(185,165,'CN','533','533',1,'CN 561',225.00),(186,166,'FTIR','534','534',1,'FTIR 562',800.00),(187,167,'FTIR','541','541',1,'FTIR 569',800.00),(188,168,'FTIR','535','535',1,'FTIR 563',500.00),(189,168,'FTIR','536','537',2,'FTIR 564 - 565',0.00),(190,169,'CN','542','543',2,'CN 570 - 572',450.00),(191,169,'FTIR','538','538',1,'566',0.00),(192,170,'FTIR','544','544',1,'573',800.00),(193,171,'CN','545','547',3,'CN 574 - 576',450.00),(194,172,'FTIR','548','549',2,'FTIR 577-578',1000.00),(195,173,'FTIR','550','550',1,'FTIR 579',500.00),(196,174,'FTIR','551','552',2,'FTIR 580-581',1600.00),(197,174,'FTIR','553','553',1,'FTIR 582',0.00),(198,175,'FTIR','554','554',1,'FTIR 583',800.00),(199,176,'C','555','555',1,'CN 584-591',1200.00),(200,177,'FTIR','556','561',6,'FTIR 592-597',3000.00),(201,178,'FTIR','562','562',1,'FTIR  598',800.00),(202,179,'FTIR','563','563',1,'FTIR 599',800.00),(203,180,'FTIR','564','564',1,'FTIR 600',800.00),(204,180,'C','565','565',1,'CN 601',0.00),(205,181,'FTIR','566','566',1,'FTIR 602',800.00),(206,182,'FTIR','567','567',1,'FTIR 603',800.00),(207,182,'FTIR','568','570',3,'FTIR 604-606',0.00),(208,183,'FTIR','571','571',1,'FTIR 607',800.00),(209,183,'FTIR','572','572',1,'FTIR 608',0.00),(210,183,'FTIR','573','573',1,'FTIR 609',0.00),(211,184,'CT','574','575',2,'CT 610-611',500.00),(212,184,'HT','576','577',2,'HT 612-613',600.00),(213,185,'FTIR','578','580',3,'FTIR 614-616',1500.00),(214,186,'MO','581','586',6,'MO 617-622',1500.00),(215,186,'HT','587','613',27,'HT 623-649',0.00),(216,186,'MO','614','640',27,'MO 650-676',0.00),(217,186,'TS','641','658',18,'TS 677-694',0.00),(218,186,'FTIR','659','659',1,'FTIR 695',0.00),(219,187,'FTIR','660','660',1,'FTIR 696',800.00),(220,188,'FTIR','661','663',3,'FTIR 697-699',2400.00),(221,189,'HT','664','667',4,'HT 700-703',1200.00),(222,189,'FT','668','671',4,'FT 704-707',1000.00),(223,190,'FTIR','672','672',1,'FTIR 708',800.00),(224,190,'FTIR','673','674',2,'FTIR 709-710',0.00),(225,191,'FTIR','675','675',1,'FTIR 711',800.00),(226,192,'FTIR','676','676',1,'FTIR 712',800.00),(227,193,'FTIR','677','677',1,'FTIR 713',800.00),(228,193,'FTIR','678','680',3,'FTIR 714-716',0.00),(229,194,'CT','681','687',7,'CT 717-723',1750.00),(230,194,'CT','688','699',12,'CT 724-735',0.00),(231,194,'FT','700','709',10,'FT 736-745',0.00),(232,195,'C','710','710',1,'CN 746-755',1500.00),(233,196,'HT','711','712',2,'HT 756-757',600.00),(234,196,'MO','713','714',2,'MO 758-759',500.00),(235,197,'CT','715','715',1,'CT 760',250.00),(236,198,'CT','716','716',1,'CT 761',250.00),(237,199,'CT','717','717',1,'CT 762',250.00),(238,200,'CT','718','721',4,'CT 763-766',1000.00),(239,201,'FTIR','722','731',10,'FTIR 767-776',8000.00),(240,201,'FTIR','732','733',2,'FTIR 777-778',0.00),(241,202,'FTIR','734','735',2,'FTIR 779-780',1600.00),(242,203,'HT','736','737',2,'HT 781-782',600.00),(243,204,'FTIR','738','739',2,'FTIR 783-784',1600.00),(244,204,'FTIR','740','742',3,'FTIR 785-787',0.00),(245,205,'FTIR','743','743',1,'FTIR 788',800.00),(246,206,'FTIR','744','744',1,'FTIR 789',800.00),(247,207,'FTIR','745','745',1,'FTIR 790',800.00),(248,208,'FTIR','746','746',1,'FTIR 791',800.00),(249,209,'FTIR','747','749',3,'792-794',2400.00),(250,210,'FTIR','750','750',1,'795',800.00),(251,211,'FTIR','751','751',1,'796',800.00),(252,212,'FTIR','752','761',10,'797-806',8000.00),(253,212,'FTIR','762','764',3,'807-809',0.00),(254,212,'FTIR','765','767',3,'810-812',0.00),(255,212,'FTIR','768','769',2,'813-814',0.00),(256,212,'FTIR','770','770',1,'815',0.00),(257,212,'HT','771','772',2,'816-817',0.00),(258,212,'CT','773','774',2,'818-819',0.00),(259,212,'FTIR','775','775',1,'820',0.00);
/*!40000 ALTER TABLE `service_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_code` varchar(10) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `base_price` decimal(10,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_code` (`service_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@mtcc.com','password123','2026-02-03 07:07:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `client_list_view`
--

/*!50001 DROP VIEW IF EXISTS `client_list_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Josh`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `client_list_view` AS select `c`.`id` AS `id`,`c`.`serviceRequestForm` AS `serviceRequestForm`,`c`.`name` AS `name`,`c`.`address` AS `address`,`c`.`email` AS `email`,`c`.`phone` AS `phone`,`c`.`company` AS `company`,`c`.`category` AS `category`,`c`.`serviceType` AS `serviceType`,`c`.`status` AS `status`,`c`.`progress` AS `progress`,`c`.`dateRequested` AS `dateRequested`,`c`.`startDate` AS `startDate`,`c`.`dueDate` AS `dueDate`,`c`.`dateClaimed` AS `dateClaimed`,`c`.`dateReleased` AS `dateReleased`,`c`.`requestForm` AS `requestForm`,`c`.`roa` AS `roa`,`c`.`ts` AS `ts`,`c`.`testDate` AS `testDate`,`c`.`releasedROA` AS `releasedROA`,`c`.`roaV` AS `roaV`,`c`.`officialReceipt` AS `officialReceipt`,`c`.`remarks` AS `remarks`,group_concat(distinct `st`.`testType` order by `st`.`testType` ASC separator ', ') AS `testTypes`,coalesce(sum(`st`.`amount`),0) AS `amount`,coalesce(sum(`st`.`sampleCount`),0) AS `sampleCount` from (`clients` `c` left join `service_tests` `st` on((`st`.`service_id` = `c`.`id`))) group by `c`.`id` */;
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

-- Dump completed on 2026-03-11 12:19:31
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sys
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Temporary view structure for view `client_list_view`
--

DROP TABLE IF EXISTS `client_list_view`;
/*!50001 DROP VIEW IF EXISTS `client_list_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `client_list_view` AS SELECT 
 1 AS `id`,
 1 AS `serviceRequestForm`,
 1 AS `name`,
 1 AS `address`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `company`,
 1 AS `category`,
 1 AS `serviceType`,
 1 AS `status`,
 1 AS `progress`,
 1 AS `dateRequested`,
 1 AS `startDate`,
 1 AS `dueDate`,
 1 AS `dateClaimed`,
 1 AS `dateReleased`,
 1 AS `requestForm`,
 1 AS `roa`,
 1 AS `ts`,
 1 AS `testDate`,
 1 AS `releasedROA`,
 1 AS `roaV`,
 1 AS `officialReceipt`,
 1 AS `remarks`,
 1 AS `testTypes`,
 1 AS `amount`,
 1 AS `sampleCount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `serviceRequestForm` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `serviceType` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `progress` varchar(50) DEFAULT NULL,
  `dateRequested` date DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `dueDate` date DEFAULT NULL,
  `dateClaimed` date DEFAULT NULL,
  `dateReleased` date DEFAULT NULL,
  `requestForm` varchar(50) DEFAULT NULL,
  `roa` int DEFAULT NULL,
  `ts` int DEFAULT NULL,
  `testDate` date DEFAULT NULL,
  `releasedROA` date DEFAULT NULL,
  `roaV` int DEFAULT '0',
  `officialReceipt` int DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'022026-Material-Testing-Service-Request-Form_ROA#1','Krystelle Joy Macatangay',NULL,NULL,NULL,NULL,'Industry','Material Testing','Pending','0','2026-02-23',NULL,NULL,NULL,NULL,'Waiting',1,0,NULL,NULL,0,0,NULL),(6,'022026-Material-Testing-Service-Request-Form_ROA#2','dsds',NULL,NULL,NULL,NULL,'Industry','Material Testing','Pending','0','2026-02-06',NULL,NULL,NULL,NULL,'Waiting',1,0,NULL,NULL,1,1,NULL),(7,'022026-Material-Testing-Service-Request-Form_TS#1','dsds',NULL,NULL,NULL,NULL,'Industry','Material Testing','Pending','0','2026-02-24',NULL,NULL,NULL,NULL,'Waiting',0,1,NULL,NULL,1,1,NULL),(8,'022026-Material-Testing-Service-Request-Form_TS#2','addsd',NULL,NULL,NULL,NULL,'Industry','Material Testing','Pending','0','2026-02-03',NULL,NULL,NULL,NULL,'Waiting',0,1,NULL,NULL,1,1,NULL),(9,'022026-Material-Testing-Service-Request-Form_TS#3','sdsdssdsd',NULL,NULL,NULL,NULL,'Industry','Material Testing','Pending','0','2026-02-13',NULL,NULL,NULL,NULL,'Waiting',0,1,NULL,NULL,0,0,NULL),(10,'022026-Material-Testing-Service-Request-Form_TS#4','dfadsdsfsd',NULL,NULL,NULL,NULL,'Industry','Material Testing','Pending','0','2026-02-10',NULL,NULL,NULL,NULL,'Waiting',0,1,NULL,NULL,1,1,NULL),(13,'022026-Material-Testing-Service-Request-Form_TS#5','jc',NULL,NULL,NULL,NULL,'Industry','Material Testing','Pending','0','2026-02-06',NULL,NULL,NULL,NULL,'Waiting',0,1,NULL,NULL,1,1,NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `host_summary`
--

DROP TABLE IF EXISTS `host_summary`;
/*!50001 DROP VIEW IF EXISTS `host_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary` AS SELECT 
 1 AS `host`,
 1 AS `statements`,
 1 AS `statement_latency`,
 1 AS `statement_avg_latency`,
 1 AS `table_scans`,
 1 AS `file_ios`,
 1 AS `file_io_latency`,
 1 AS `current_connections`,
 1 AS `total_connections`,
 1 AS `unique_users`,
 1 AS `current_memory`,
 1 AS `total_memory_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `host_summary_by_file_io`
--

DROP TABLE IF EXISTS `host_summary_by_file_io`;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary_by_file_io` AS SELECT 
 1 AS `host`,
 1 AS `ios`,
 1 AS `io_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `host_summary_by_file_io_type`
--

DROP TABLE IF EXISTS `host_summary_by_file_io_type`;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_file_io_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary_by_file_io_type` AS SELECT 
 1 AS `host`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `host_summary_by_stages`
--

DROP TABLE IF EXISTS `host_summary_by_stages`;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_stages`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary_by_stages` AS SELECT 
 1 AS `host`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `host_summary_by_statement_latency`
--

DROP TABLE IF EXISTS `host_summary_by_statement_latency`;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_statement_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary_by_statement_latency` AS SELECT 
 1 AS `host`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `host_summary_by_statement_type`
--

DROP TABLE IF EXISTS `host_summary_by_statement_type`;
/*!50001 DROP VIEW IF EXISTS `host_summary_by_statement_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `host_summary_by_statement_type` AS SELECT 
 1 AS `host`,
 1 AS `statement`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `innodb_buffer_stats_by_schema`
--

DROP TABLE IF EXISTS `innodb_buffer_stats_by_schema`;
/*!50001 DROP VIEW IF EXISTS `innodb_buffer_stats_by_schema`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `innodb_buffer_stats_by_schema` AS SELECT 
 1 AS `object_schema`,
 1 AS `allocated`,
 1 AS `data`,
 1 AS `pages`,
 1 AS `pages_hashed`,
 1 AS `pages_old`,
 1 AS `rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `innodb_buffer_stats_by_table`
--

DROP TABLE IF EXISTS `innodb_buffer_stats_by_table`;
/*!50001 DROP VIEW IF EXISTS `innodb_buffer_stats_by_table`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `innodb_buffer_stats_by_table` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `allocated`,
 1 AS `data`,
 1 AS `pages`,
 1 AS `pages_hashed`,
 1 AS `pages_old`,
 1 AS `rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `innodb_lock_waits`
--

DROP TABLE IF EXISTS `innodb_lock_waits`;
/*!50001 DROP VIEW IF EXISTS `innodb_lock_waits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `innodb_lock_waits` AS SELECT 
 1 AS `wait_started`,
 1 AS `wait_age`,
 1 AS `wait_age_secs`,
 1 AS `locked_table`,
 1 AS `locked_table_schema`,
 1 AS `locked_table_name`,
 1 AS `locked_table_partition`,
 1 AS `locked_table_subpartition`,
 1 AS `locked_index`,
 1 AS `locked_type`,
 1 AS `waiting_trx_id`,
 1 AS `waiting_trx_started`,
 1 AS `waiting_trx_age`,
 1 AS `waiting_trx_rows_locked`,
 1 AS `waiting_trx_rows_modified`,
 1 AS `waiting_pid`,
 1 AS `waiting_query`,
 1 AS `waiting_lock_id`,
 1 AS `waiting_lock_mode`,
 1 AS `blocking_trx_id`,
 1 AS `blocking_pid`,
 1 AS `blocking_query`,
 1 AS `blocking_lock_id`,
 1 AS `blocking_lock_mode`,
 1 AS `blocking_trx_started`,
 1 AS `blocking_trx_age`,
 1 AS `blocking_trx_rows_locked`,
 1 AS `blocking_trx_rows_modified`,
 1 AS `sql_kill_blocking_query`,
 1 AS `sql_kill_blocking_connection`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `institution`
--

DROP TABLE IF EXISTS `institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institution` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `company` (`company`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institution`
--

LOCK TABLES `institution` WRITE;
/*!40000 ALTER TABLE `institution` DISABLE KEYS */;
/*!40000 ALTER TABLE `institution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `io_by_thread_by_latency`
--

DROP TABLE IF EXISTS `io_by_thread_by_latency`;
/*!50001 DROP VIEW IF EXISTS `io_by_thread_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `io_by_thread_by_latency` AS SELECT 
 1 AS `user`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `thread_id`,
 1 AS `processlist_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `io_global_by_file_by_bytes`
--

DROP TABLE IF EXISTS `io_global_by_file_by_bytes`;
/*!50001 DROP VIEW IF EXISTS `io_global_by_file_by_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `io_global_by_file_by_bytes` AS SELECT 
 1 AS `file`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_write`,
 1 AS `total`,
 1 AS `write_pct`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `io_global_by_file_by_latency`
--

DROP TABLE IF EXISTS `io_global_by_file_by_latency`;
/*!50001 DROP VIEW IF EXISTS `io_global_by_file_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `io_global_by_file_by_latency` AS SELECT 
 1 AS `file`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `count_read`,
 1 AS `read_latency`,
 1 AS `count_write`,
 1 AS `write_latency`,
 1 AS `count_misc`,
 1 AS `misc_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `io_global_by_wait_by_bytes`
--

DROP TABLE IF EXISTS `io_global_by_wait_by_bytes`;
/*!50001 DROP VIEW IF EXISTS `io_global_by_wait_by_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `io_global_by_wait_by_bytes` AS SELECT 
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_written`,
 1 AS `total_requested`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `io_global_by_wait_by_latency`
--

DROP TABLE IF EXISTS `io_global_by_wait_by_latency`;
/*!50001 DROP VIEW IF EXISTS `io_global_by_wait_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `io_global_by_wait_by_latency` AS SELECT 
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `read_latency`,
 1 AS `write_latency`,
 1 AS `misc_latency`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_written`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `latest_file_io`
--

DROP TABLE IF EXISTS `latest_file_io`;
/*!50001 DROP VIEW IF EXISTS `latest_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `latest_file_io` AS SELECT 
 1 AS `thread`,
 1 AS `file`,
 1 AS `latency`,
 1 AS `operation`,
 1 AS `requested`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `memory_by_host_by_current_bytes`
--

DROP TABLE IF EXISTS `memory_by_host_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `memory_by_host_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `memory_by_host_by_current_bytes` AS SELECT 
 1 AS `host`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `memory_by_thread_by_current_bytes`
--

DROP TABLE IF EXISTS `memory_by_thread_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `memory_by_thread_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `memory_by_thread_by_current_bytes` AS SELECT 
 1 AS `thread_id`,
 1 AS `user`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `memory_by_user_by_current_bytes`
--

DROP TABLE IF EXISTS `memory_by_user_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `memory_by_user_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `memory_by_user_by_current_bytes` AS SELECT 
 1 AS `user`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `memory_global_by_current_bytes`
--

DROP TABLE IF EXISTS `memory_global_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `memory_global_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `memory_global_by_current_bytes` AS SELECT 
 1 AS `event_name`,
 1 AS `current_count`,
 1 AS `current_alloc`,
 1 AS `current_avg_alloc`,
 1 AS `high_count`,
 1 AS `high_alloc`,
 1 AS `high_avg_alloc`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `memory_global_total`
--

DROP TABLE IF EXISTS `memory_global_total`;
/*!50001 DROP VIEW IF EXISTS `memory_global_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `memory_global_total` AS SELECT 
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!50001 DROP VIEW IF EXISTS `metrics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `metrics` AS SELECT 
 1 AS `Variable_name`,
 1 AS `Variable_value`,
 1 AS `Type`,
 1 AS `Enabled`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `processlist`
--

DROP TABLE IF EXISTS `processlist`;
/*!50001 DROP VIEW IF EXISTS `processlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `processlist` AS SELECT 
 1 AS `thd_id`,
 1 AS `conn_id`,
 1 AS `user`,
 1 AS `db`,
 1 AS `command`,
 1 AS `state`,
 1 AS `time`,
 1 AS `current_statement`,
 1 AS `execution_engine`,
 1 AS `statement_latency`,
 1 AS `progress`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_examined`,
 1 AS `rows_sent`,
 1 AS `rows_affected`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `full_scan`,
 1 AS `last_statement`,
 1 AS `last_statement_latency`,
 1 AS `current_memory`,
 1 AS `last_wait`,
 1 AS `last_wait_latency`,
 1 AS `source`,
 1 AS `trx_latency`,
 1 AS `trx_state`,
 1 AS `trx_autocommit`,
 1 AS `pid`,
 1 AS `program_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ps_check_lost_instrumentation`
--

DROP TABLE IF EXISTS `ps_check_lost_instrumentation`;
/*!50001 DROP VIEW IF EXISTS `ps_check_lost_instrumentation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ps_check_lost_instrumentation` AS SELECT 
 1 AS `variable_name`,
 1 AS `variable_value`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_auto_increment_columns`
--

DROP TABLE IF EXISTS `schema_auto_increment_columns`;
/*!50001 DROP VIEW IF EXISTS `schema_auto_increment_columns`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_auto_increment_columns` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `column_name`,
 1 AS `data_type`,
 1 AS `column_type`,
 1 AS `is_signed`,
 1 AS `is_unsigned`,
 1 AS `max_value`,
 1 AS `auto_increment`,
 1 AS `auto_increment_ratio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_index_statistics`
--

DROP TABLE IF EXISTS `schema_index_statistics`;
/*!50001 DROP VIEW IF EXISTS `schema_index_statistics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_index_statistics` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `index_name`,
 1 AS `rows_selected`,
 1 AS `select_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_object_overview`
--

DROP TABLE IF EXISTS `schema_object_overview`;
/*!50001 DROP VIEW IF EXISTS `schema_object_overview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_object_overview` AS SELECT 
 1 AS `db`,
 1 AS `object_type`,
 1 AS `count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_redundant_indexes`
--

DROP TABLE IF EXISTS `schema_redundant_indexes`;
/*!50001 DROP VIEW IF EXISTS `schema_redundant_indexes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_redundant_indexes` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `redundant_index_name`,
 1 AS `redundant_index_columns`,
 1 AS `redundant_index_non_unique`,
 1 AS `dominant_index_name`,
 1 AS `dominant_index_columns`,
 1 AS `dominant_index_non_unique`,
 1 AS `subpart_exists`,
 1 AS `sql_drop_index`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_table_lock_waits`
--

DROP TABLE IF EXISTS `schema_table_lock_waits`;
/*!50001 DROP VIEW IF EXISTS `schema_table_lock_waits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_table_lock_waits` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `waiting_thread_id`,
 1 AS `waiting_pid`,
 1 AS `waiting_account`,
 1 AS `waiting_lock_type`,
 1 AS `waiting_lock_duration`,
 1 AS `waiting_query`,
 1 AS `waiting_query_secs`,
 1 AS `waiting_query_rows_affected`,
 1 AS `waiting_query_rows_examined`,
 1 AS `blocking_thread_id`,
 1 AS `blocking_pid`,
 1 AS `blocking_account`,
 1 AS `blocking_lock_type`,
 1 AS `blocking_lock_duration`,
 1 AS `sql_kill_blocking_query`,
 1 AS `sql_kill_blocking_connection`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_table_statistics`
--

DROP TABLE IF EXISTS `schema_table_statistics`;
/*!50001 DROP VIEW IF EXISTS `schema_table_statistics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_table_statistics` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `total_latency`,
 1 AS `rows_fetched`,
 1 AS `fetch_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`,
 1 AS `io_read_requests`,
 1 AS `io_read`,
 1 AS `io_read_latency`,
 1 AS `io_write_requests`,
 1 AS `io_write`,
 1 AS `io_write_latency`,
 1 AS `io_misc_requests`,
 1 AS `io_misc_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_table_statistics_with_buffer`
--

DROP TABLE IF EXISTS `schema_table_statistics_with_buffer`;
/*!50001 DROP VIEW IF EXISTS `schema_table_statistics_with_buffer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_table_statistics_with_buffer` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `rows_fetched`,
 1 AS `fetch_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`,
 1 AS `io_read_requests`,
 1 AS `io_read`,
 1 AS `io_read_latency`,
 1 AS `io_write_requests`,
 1 AS `io_write`,
 1 AS `io_write_latency`,
 1 AS `io_misc_requests`,
 1 AS `io_misc_latency`,
 1 AS `innodb_buffer_allocated`,
 1 AS `innodb_buffer_data`,
 1 AS `innodb_buffer_free`,
 1 AS `innodb_buffer_pages`,
 1 AS `innodb_buffer_pages_hashed`,
 1 AS `innodb_buffer_pages_old`,
 1 AS `innodb_buffer_rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_tables_with_full_table_scans`
--

DROP TABLE IF EXISTS `schema_tables_with_full_table_scans`;
/*!50001 DROP VIEW IF EXISTS `schema_tables_with_full_table_scans`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_tables_with_full_table_scans` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `rows_full_scanned`,
 1 AS `latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `schema_unused_indexes`
--

DROP TABLE IF EXISTS `schema_unused_indexes`;
/*!50001 DROP VIEW IF EXISTS `schema_unused_indexes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `schema_unused_indexes` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `index_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `service_tests`
--

DROP TABLE IF EXISTS `service_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_tests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_id` int NOT NULL,
  `testType` varchar(10) NOT NULL,
  `sampleNo1` varchar(100) DEFAULT NULL,
  `sampleNo2` varchar(100) DEFAULT NULL,
  `sampleCount` int DEFAULT '0',
  `specimenNo` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `fk_service_tests_service_id` (`service_id`),
  CONSTRAINT `fk_service_tests_service_id` FOREIGN KEY (`service_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_tests`
--

LOCK TABLES `service_tests` WRITE;
/*!40000 ALTER TABLE `service_tests` DISABLE KEYS */;
INSERT INTO `service_tests` VALUES (1,1,'FTIR','1','2',2,'qwe-12',800.00),(8,6,'FTIR','1','2',2,NULL,1600.00),(9,6,'CN','3','4',2,NULL,600.00),(10,7,'FTIR','1','2',2,NULL,1600.00),(11,7,'CN','3','4',2,NULL,600.00),(12,9,'FTIR','1','2',2,NULL,1600.00),(13,9,'CN','3','4',2,NULL,600.00),(14,10,'CN','1','16',16,NULL,0.00),(15,10,'HT','17','20',4,NULL,0.00),(18,13,'CT','13','16',4,'sdsddsd',0.00);
/*!40000 ALTER TABLE `service_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `service_code` varchar(10) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `base_price` decimal(10,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_code` (`service_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `session`
--

DROP TABLE IF EXISTS `session`;
/*!50001 DROP VIEW IF EXISTS `session`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `session` AS SELECT 
 1 AS `thd_id`,
 1 AS `conn_id`,
 1 AS `user`,
 1 AS `db`,
 1 AS `command`,
 1 AS `state`,
 1 AS `time`,
 1 AS `current_statement`,
 1 AS `execution_engine`,
 1 AS `statement_latency`,
 1 AS `progress`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_examined`,
 1 AS `rows_sent`,
 1 AS `rows_affected`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `full_scan`,
 1 AS `last_statement`,
 1 AS `last_statement_latency`,
 1 AS `current_memory`,
 1 AS `last_wait`,
 1 AS `last_wait_latency`,
 1 AS `source`,
 1 AS `trx_latency`,
 1 AS `trx_state`,
 1 AS `trx_autocommit`,
 1 AS `pid`,
 1 AS `program_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `session_ssl_status`
--

DROP TABLE IF EXISTS `session_ssl_status`;
/*!50001 DROP VIEW IF EXISTS `session_ssl_status`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `session_ssl_status` AS SELECT 
 1 AS `thread_id`,
 1 AS `ssl_version`,
 1 AS `ssl_cipher`,
 1 AS `ssl_sessions_reused`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statement_analysis`
--

DROP TABLE IF EXISTS `statement_analysis`;
/*!50001 DROP VIEW IF EXISTS `statement_analysis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statement_analysis` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `full_scan`,
 1 AS `exec_count`,
 1 AS `err_count`,
 1 AS `warn_count`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `avg_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined`,
 1 AS `rows_examined_avg`,
 1 AS `rows_affected`,
 1 AS `rows_affected_avg`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `rows_sorted`,
 1 AS `sort_merge_passes`,
 1 AS `max_controlled_memory`,
 1 AS `max_total_memory`,
 1 AS `digest`,
 1 AS `first_seen`,
 1 AS `last_seen`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statements_with_errors_or_warnings`
--

DROP TABLE IF EXISTS `statements_with_errors_or_warnings`;
/*!50001 DROP VIEW IF EXISTS `statements_with_errors_or_warnings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statements_with_errors_or_warnings` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `errors`,
 1 AS `error_pct`,
 1 AS `warnings`,
 1 AS `warning_pct`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statements_with_full_table_scans`
--

DROP TABLE IF EXISTS `statements_with_full_table_scans`;
/*!50001 DROP VIEW IF EXISTS `statements_with_full_table_scans`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statements_with_full_table_scans` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `no_index_used_count`,
 1 AS `no_good_index_used_count`,
 1 AS `no_index_used_pct`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined_avg`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statements_with_runtimes_in_95th_percentile`
--

DROP TABLE IF EXISTS `statements_with_runtimes_in_95th_percentile`;
/*!50001 DROP VIEW IF EXISTS `statements_with_runtimes_in_95th_percentile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statements_with_runtimes_in_95th_percentile` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `full_scan`,
 1 AS `exec_count`,
 1 AS `err_count`,
 1 AS `warn_count`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `avg_latency`,
 1 AS `rows_sent`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined`,
 1 AS `rows_examined_avg`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statements_with_sorting`
--

DROP TABLE IF EXISTS `statements_with_sorting`;
/*!50001 DROP VIEW IF EXISTS `statements_with_sorting`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statements_with_sorting` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `sort_merge_passes`,
 1 AS `avg_sort_merges`,
 1 AS `sorts_using_scans`,
 1 AS `sort_using_range`,
 1 AS `rows_sorted`,
 1 AS `avg_rows_sorted`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `statements_with_temp_tables`
--

DROP TABLE IF EXISTS `statements_with_temp_tables`;
/*!50001 DROP VIEW IF EXISTS `statements_with_temp_tables`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `statements_with_temp_tables` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `memory_tmp_tables`,
 1 AS `disk_tmp_tables`,
 1 AS `avg_tmp_tables_per_query`,
 1 AS `tmp_tables_to_disk_pct`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `variable` varchar(128) NOT NULL,
  `value` varchar(128) DEFAULT NULL,
  `set_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `set_by` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`variable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES ('diagnostics.allow_i_s_tables','OFF','2026-02-03 00:16:59',NULL),('diagnostics.include_raw','OFF','2026-02-03 00:16:59',NULL),('ps_thread_trx_info.max_length','65535','2026-02-03 00:16:59',NULL),('statement_performance_analyzer.limit','100','2026-02-03 00:16:59',NULL),('statement_performance_analyzer.view',NULL,'2026-02-03 00:16:59',NULL),('statement_truncate_len','64','2026-02-03 00:16:59',NULL);
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_summary`
--

DROP TABLE IF EXISTS `user_summary`;
/*!50001 DROP VIEW IF EXISTS `user_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary` AS SELECT 
 1 AS `user`,
 1 AS `statements`,
 1 AS `statement_latency`,
 1 AS `statement_avg_latency`,
 1 AS `table_scans`,
 1 AS `file_ios`,
 1 AS `file_io_latency`,
 1 AS `current_connections`,
 1 AS `total_connections`,
 1 AS `unique_hosts`,
 1 AS `current_memory`,
 1 AS `total_memory_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_summary_by_file_io`
--

DROP TABLE IF EXISTS `user_summary_by_file_io`;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary_by_file_io` AS SELECT 
 1 AS `user`,
 1 AS `ios`,
 1 AS `io_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_summary_by_file_io_type`
--

DROP TABLE IF EXISTS `user_summary_by_file_io_type`;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_file_io_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary_by_file_io_type` AS SELECT 
 1 AS `user`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_summary_by_stages`
--

DROP TABLE IF EXISTS `user_summary_by_stages`;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_stages`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary_by_stages` AS SELECT 
 1 AS `user`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_summary_by_statement_latency`
--

DROP TABLE IF EXISTS `user_summary_by_statement_latency`;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_statement_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary_by_statement_latency` AS SELECT 
 1 AS `user`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_summary_by_statement_type`
--

DROP TABLE IF EXISTS `user_summary_by_statement_type`;
/*!50001 DROP VIEW IF EXISTS `user_summary_by_statement_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_summary_by_statement_type` AS SELECT 
 1 AS `user`,
 1 AS `statement`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@mtcc.com','password123','2026-02-03 07:07:58');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `version`
--

DROP TABLE IF EXISTS `version`;
/*!50001 DROP VIEW IF EXISTS `version`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `version` AS SELECT 
 1 AS `sys_version`,
 1 AS `mysql_version`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `wait_classes_global_by_avg_latency`
--

DROP TABLE IF EXISTS `wait_classes_global_by_avg_latency`;
/*!50001 DROP VIEW IF EXISTS `wait_classes_global_by_avg_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wait_classes_global_by_avg_latency` AS SELECT 
 1 AS `event_class`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `wait_classes_global_by_latency`
--

DROP TABLE IF EXISTS `wait_classes_global_by_latency`;
/*!50001 DROP VIEW IF EXISTS `wait_classes_global_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `wait_classes_global_by_latency` AS SELECT 
 1 AS `event_class`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `waits_by_host_by_latency`
--

DROP TABLE IF EXISTS `waits_by_host_by_latency`;
/*!50001 DROP VIEW IF EXISTS `waits_by_host_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `waits_by_host_by_latency` AS SELECT 
 1 AS `host`,
 1 AS `event`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `waits_by_user_by_latency`
--

DROP TABLE IF EXISTS `waits_by_user_by_latency`;
/*!50001 DROP VIEW IF EXISTS `waits_by_user_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `waits_by_user_by_latency` AS SELECT 
 1 AS `user`,
 1 AS `event`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `waits_global_by_latency`
--

DROP TABLE IF EXISTS `waits_global_by_latency`;
/*!50001 DROP VIEW IF EXISTS `waits_global_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `waits_global_by_latency` AS SELECT 
 1 AS `events`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$host_summary`
--

DROP TABLE IF EXISTS `x$host_summary`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary` AS SELECT 
 1 AS `host`,
 1 AS `statements`,
 1 AS `statement_latency`,
 1 AS `statement_avg_latency`,
 1 AS `table_scans`,
 1 AS `file_ios`,
 1 AS `file_io_latency`,
 1 AS `current_connections`,
 1 AS `total_connections`,
 1 AS `unique_users`,
 1 AS `current_memory`,
 1 AS `total_memory_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$host_summary_by_file_io`
--

DROP TABLE IF EXISTS `x$host_summary_by_file_io`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary_by_file_io` AS SELECT 
 1 AS `host`,
 1 AS `ios`,
 1 AS `io_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$host_summary_by_file_io_type`
--

DROP TABLE IF EXISTS `x$host_summary_by_file_io_type`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_file_io_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary_by_file_io_type` AS SELECT 
 1 AS `host`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$host_summary_by_stages`
--

DROP TABLE IF EXISTS `x$host_summary_by_stages`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_stages`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary_by_stages` AS SELECT 
 1 AS `host`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$host_summary_by_statement_latency`
--

DROP TABLE IF EXISTS `x$host_summary_by_statement_latency`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_statement_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary_by_statement_latency` AS SELECT 
 1 AS `host`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$host_summary_by_statement_type`
--

DROP TABLE IF EXISTS `x$host_summary_by_statement_type`;
/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_statement_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$host_summary_by_statement_type` AS SELECT 
 1 AS `host`,
 1 AS `statement`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$innodb_buffer_stats_by_schema`
--

DROP TABLE IF EXISTS `x$innodb_buffer_stats_by_schema`;
/*!50001 DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_schema`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$innodb_buffer_stats_by_schema` AS SELECT 
 1 AS `object_schema`,
 1 AS `allocated`,
 1 AS `data`,
 1 AS `pages`,
 1 AS `pages_hashed`,
 1 AS `pages_old`,
 1 AS `rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$innodb_buffer_stats_by_table`
--

DROP TABLE IF EXISTS `x$innodb_buffer_stats_by_table`;
/*!50001 DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_table`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$innodb_buffer_stats_by_table` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `allocated`,
 1 AS `data`,
 1 AS `pages`,
 1 AS `pages_hashed`,
 1 AS `pages_old`,
 1 AS `rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$innodb_lock_waits`
--

DROP TABLE IF EXISTS `x$innodb_lock_waits`;
/*!50001 DROP VIEW IF EXISTS `x$innodb_lock_waits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$innodb_lock_waits` AS SELECT 
 1 AS `wait_started`,
 1 AS `wait_age`,
 1 AS `wait_age_secs`,
 1 AS `locked_table`,
 1 AS `locked_table_schema`,
 1 AS `locked_table_name`,
 1 AS `locked_table_partition`,
 1 AS `locked_table_subpartition`,
 1 AS `locked_index`,
 1 AS `locked_type`,
 1 AS `waiting_trx_id`,
 1 AS `waiting_trx_started`,
 1 AS `waiting_trx_age`,
 1 AS `waiting_trx_rows_locked`,
 1 AS `waiting_trx_rows_modified`,
 1 AS `waiting_pid`,
 1 AS `waiting_query`,
 1 AS `waiting_lock_id`,
 1 AS `waiting_lock_mode`,
 1 AS `blocking_trx_id`,
 1 AS `blocking_pid`,
 1 AS `blocking_query`,
 1 AS `blocking_lock_id`,
 1 AS `blocking_lock_mode`,
 1 AS `blocking_trx_started`,
 1 AS `blocking_trx_age`,
 1 AS `blocking_trx_rows_locked`,
 1 AS `blocking_trx_rows_modified`,
 1 AS `sql_kill_blocking_query`,
 1 AS `sql_kill_blocking_connection`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$io_by_thread_by_latency`
--

DROP TABLE IF EXISTS `x$io_by_thread_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$io_by_thread_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$io_by_thread_by_latency` AS SELECT 
 1 AS `user`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `thread_id`,
 1 AS `processlist_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$io_global_by_file_by_bytes`
--

DROP TABLE IF EXISTS `x$io_global_by_file_by_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$io_global_by_file_by_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$io_global_by_file_by_bytes` AS SELECT 
 1 AS `file`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_write`,
 1 AS `total`,
 1 AS `write_pct`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$io_global_by_file_by_latency`
--

DROP TABLE IF EXISTS `x$io_global_by_file_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$io_global_by_file_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$io_global_by_file_by_latency` AS SELECT 
 1 AS `file`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `count_read`,
 1 AS `read_latency`,
 1 AS `count_write`,
 1 AS `write_latency`,
 1 AS `count_misc`,
 1 AS `misc_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$io_global_by_wait_by_bytes`
--

DROP TABLE IF EXISTS `x$io_global_by_wait_by_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$io_global_by_wait_by_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$io_global_by_wait_by_bytes` AS SELECT 
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_written`,
 1 AS `total_requested`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$io_global_by_wait_by_latency`
--

DROP TABLE IF EXISTS `x$io_global_by_wait_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$io_global_by_wait_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$io_global_by_wait_by_latency` AS SELECT 
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`,
 1 AS `read_latency`,
 1 AS `write_latency`,
 1 AS `misc_latency`,
 1 AS `count_read`,
 1 AS `total_read`,
 1 AS `avg_read`,
 1 AS `count_write`,
 1 AS `total_written`,
 1 AS `avg_written`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$latest_file_io`
--

DROP TABLE IF EXISTS `x$latest_file_io`;
/*!50001 DROP VIEW IF EXISTS `x$latest_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$latest_file_io` AS SELECT 
 1 AS `thread`,
 1 AS `file`,
 1 AS `latency`,
 1 AS `operation`,
 1 AS `requested`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$memory_by_host_by_current_bytes`
--

DROP TABLE IF EXISTS `x$memory_by_host_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$memory_by_host_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$memory_by_host_by_current_bytes` AS SELECT 
 1 AS `host`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$memory_by_thread_by_current_bytes`
--

DROP TABLE IF EXISTS `x$memory_by_thread_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$memory_by_thread_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$memory_by_thread_by_current_bytes` AS SELECT 
 1 AS `thread_id`,
 1 AS `user`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$memory_by_user_by_current_bytes`
--

DROP TABLE IF EXISTS `x$memory_by_user_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$memory_by_user_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$memory_by_user_by_current_bytes` AS SELECT 
 1 AS `user`,
 1 AS `current_count_used`,
 1 AS `current_allocated`,
 1 AS `current_avg_alloc`,
 1 AS `current_max_alloc`,
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$memory_global_by_current_bytes`
--

DROP TABLE IF EXISTS `x$memory_global_by_current_bytes`;
/*!50001 DROP VIEW IF EXISTS `x$memory_global_by_current_bytes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$memory_global_by_current_bytes` AS SELECT 
 1 AS `event_name`,
 1 AS `current_count`,
 1 AS `current_alloc`,
 1 AS `current_avg_alloc`,
 1 AS `high_count`,
 1 AS `high_alloc`,
 1 AS `high_avg_alloc`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$memory_global_total`
--

DROP TABLE IF EXISTS `x$memory_global_total`;
/*!50001 DROP VIEW IF EXISTS `x$memory_global_total`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$memory_global_total` AS SELECT 
 1 AS `total_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$processlist`
--

DROP TABLE IF EXISTS `x$processlist`;
/*!50001 DROP VIEW IF EXISTS `x$processlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$processlist` AS SELECT 
 1 AS `thd_id`,
 1 AS `conn_id`,
 1 AS `user`,
 1 AS `db`,
 1 AS `command`,
 1 AS `state`,
 1 AS `time`,
 1 AS `current_statement`,
 1 AS `execution_engine`,
 1 AS `statement_latency`,
 1 AS `progress`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_examined`,
 1 AS `rows_sent`,
 1 AS `rows_affected`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `full_scan`,
 1 AS `last_statement`,
 1 AS `last_statement_latency`,
 1 AS `current_memory`,
 1 AS `last_wait`,
 1 AS `last_wait_latency`,
 1 AS `source`,
 1 AS `trx_latency`,
 1 AS `trx_state`,
 1 AS `trx_autocommit`,
 1 AS `pid`,
 1 AS `program_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$ps_digest_95th_percentile_by_avg_us`
--

DROP TABLE IF EXISTS `x$ps_digest_95th_percentile_by_avg_us`;
/*!50001 DROP VIEW IF EXISTS `x$ps_digest_95th_percentile_by_avg_us`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$ps_digest_95th_percentile_by_avg_us` AS SELECT 
 1 AS `avg_us`,
 1 AS `percentile`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$ps_digest_avg_latency_distribution`
--

DROP TABLE IF EXISTS `x$ps_digest_avg_latency_distribution`;
/*!50001 DROP VIEW IF EXISTS `x$ps_digest_avg_latency_distribution`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$ps_digest_avg_latency_distribution` AS SELECT 
 1 AS `cnt`,
 1 AS `avg_us`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$ps_schema_table_statistics_io`
--

DROP TABLE IF EXISTS `x$ps_schema_table_statistics_io`;
/*!50001 DROP VIEW IF EXISTS `x$ps_schema_table_statistics_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$ps_schema_table_statistics_io` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `count_read`,
 1 AS `sum_number_of_bytes_read`,
 1 AS `sum_timer_read`,
 1 AS `count_write`,
 1 AS `sum_number_of_bytes_write`,
 1 AS `sum_timer_write`,
 1 AS `count_misc`,
 1 AS `sum_timer_misc`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_flattened_keys`
--

DROP TABLE IF EXISTS `x$schema_flattened_keys`;
/*!50001 DROP VIEW IF EXISTS `x$schema_flattened_keys`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_flattened_keys` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `index_name`,
 1 AS `non_unique`,
 1 AS `subpart_exists`,
 1 AS `index_columns`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_index_statistics`
--

DROP TABLE IF EXISTS `x$schema_index_statistics`;
/*!50001 DROP VIEW IF EXISTS `x$schema_index_statistics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_index_statistics` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `index_name`,
 1 AS `rows_selected`,
 1 AS `select_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_table_lock_waits`
--

DROP TABLE IF EXISTS `x$schema_table_lock_waits`;
/*!50001 DROP VIEW IF EXISTS `x$schema_table_lock_waits`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_table_lock_waits` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `waiting_thread_id`,
 1 AS `waiting_pid`,
 1 AS `waiting_account`,
 1 AS `waiting_lock_type`,
 1 AS `waiting_lock_duration`,
 1 AS `waiting_query`,
 1 AS `waiting_query_secs`,
 1 AS `waiting_query_rows_affected`,
 1 AS `waiting_query_rows_examined`,
 1 AS `blocking_thread_id`,
 1 AS `blocking_pid`,
 1 AS `blocking_account`,
 1 AS `blocking_lock_type`,
 1 AS `blocking_lock_duration`,
 1 AS `sql_kill_blocking_query`,
 1 AS `sql_kill_blocking_connection`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_table_statistics`
--

DROP TABLE IF EXISTS `x$schema_table_statistics`;
/*!50001 DROP VIEW IF EXISTS `x$schema_table_statistics`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_table_statistics` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `total_latency`,
 1 AS `rows_fetched`,
 1 AS `fetch_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`,
 1 AS `io_read_requests`,
 1 AS `io_read`,
 1 AS `io_read_latency`,
 1 AS `io_write_requests`,
 1 AS `io_write`,
 1 AS `io_write_latency`,
 1 AS `io_misc_requests`,
 1 AS `io_misc_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_table_statistics_with_buffer`
--

DROP TABLE IF EXISTS `x$schema_table_statistics_with_buffer`;
/*!50001 DROP VIEW IF EXISTS `x$schema_table_statistics_with_buffer`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_table_statistics_with_buffer` AS SELECT 
 1 AS `table_schema`,
 1 AS `table_name`,
 1 AS `rows_fetched`,
 1 AS `fetch_latency`,
 1 AS `rows_inserted`,
 1 AS `insert_latency`,
 1 AS `rows_updated`,
 1 AS `update_latency`,
 1 AS `rows_deleted`,
 1 AS `delete_latency`,
 1 AS `io_read_requests`,
 1 AS `io_read`,
 1 AS `io_read_latency`,
 1 AS `io_write_requests`,
 1 AS `io_write`,
 1 AS `io_write_latency`,
 1 AS `io_misc_requests`,
 1 AS `io_misc_latency`,
 1 AS `innodb_buffer_allocated`,
 1 AS `innodb_buffer_data`,
 1 AS `innodb_buffer_free`,
 1 AS `innodb_buffer_pages`,
 1 AS `innodb_buffer_pages_hashed`,
 1 AS `innodb_buffer_pages_old`,
 1 AS `innodb_buffer_rows_cached`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$schema_tables_with_full_table_scans`
--

DROP TABLE IF EXISTS `x$schema_tables_with_full_table_scans`;
/*!50001 DROP VIEW IF EXISTS `x$schema_tables_with_full_table_scans`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$schema_tables_with_full_table_scans` AS SELECT 
 1 AS `object_schema`,
 1 AS `object_name`,
 1 AS `rows_full_scanned`,
 1 AS `latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$session`
--

DROP TABLE IF EXISTS `x$session`;
/*!50001 DROP VIEW IF EXISTS `x$session`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$session` AS SELECT 
 1 AS `thd_id`,
 1 AS `conn_id`,
 1 AS `user`,
 1 AS `db`,
 1 AS `command`,
 1 AS `state`,
 1 AS `time`,
 1 AS `current_statement`,
 1 AS `execution_engine`,
 1 AS `statement_latency`,
 1 AS `progress`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_examined`,
 1 AS `rows_sent`,
 1 AS `rows_affected`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `full_scan`,
 1 AS `last_statement`,
 1 AS `last_statement_latency`,
 1 AS `current_memory`,
 1 AS `last_wait`,
 1 AS `last_wait_latency`,
 1 AS `source`,
 1 AS `trx_latency`,
 1 AS `trx_state`,
 1 AS `trx_autocommit`,
 1 AS `pid`,
 1 AS `program_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statement_analysis`
--

DROP TABLE IF EXISTS `x$statement_analysis`;
/*!50001 DROP VIEW IF EXISTS `x$statement_analysis`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statement_analysis` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `full_scan`,
 1 AS `exec_count`,
 1 AS `exec_secondary_count`,
 1 AS `err_count`,
 1 AS `warn_count`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `avg_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined`,
 1 AS `rows_examined_avg`,
 1 AS `rows_affected`,
 1 AS `rows_affected_avg`,
 1 AS `tmp_tables`,
 1 AS `tmp_disk_tables`,
 1 AS `rows_sorted`,
 1 AS `sort_merge_passes`,
 1 AS `max_controlled_memory`,
 1 AS `max_total_memory`,
 1 AS `digest`,
 1 AS `first_seen`,
 1 AS `last_seen`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statements_with_errors_or_warnings`
--

DROP TABLE IF EXISTS `x$statements_with_errors_or_warnings`;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_errors_or_warnings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statements_with_errors_or_warnings` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `errors`,
 1 AS `error_pct`,
 1 AS `warnings`,
 1 AS `warning_pct`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statements_with_full_table_scans`
--

DROP TABLE IF EXISTS `x$statements_with_full_table_scans`;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_full_table_scans`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statements_with_full_table_scans` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `no_index_used_count`,
 1 AS `no_good_index_used_count`,
 1 AS `no_index_used_pct`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined_avg`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statements_with_runtimes_in_95th_percentile`
--

DROP TABLE IF EXISTS `x$statements_with_runtimes_in_95th_percentile`;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_runtimes_in_95th_percentile`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statements_with_runtimes_in_95th_percentile` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `full_scan`,
 1 AS `exec_count`,
 1 AS `err_count`,
 1 AS `warn_count`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `avg_latency`,
 1 AS `rows_sent`,
 1 AS `rows_sent_avg`,
 1 AS `rows_examined`,
 1 AS `rows_examined_avg`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statements_with_sorting`
--

DROP TABLE IF EXISTS `x$statements_with_sorting`;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_sorting`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statements_with_sorting` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `sort_merge_passes`,
 1 AS `avg_sort_merges`,
 1 AS `sorts_using_scans`,
 1 AS `sort_using_range`,
 1 AS `rows_sorted`,
 1 AS `avg_rows_sorted`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$statements_with_temp_tables`
--

DROP TABLE IF EXISTS `x$statements_with_temp_tables`;
/*!50001 DROP VIEW IF EXISTS `x$statements_with_temp_tables`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$statements_with_temp_tables` AS SELECT 
 1 AS `query`,
 1 AS `db`,
 1 AS `exec_count`,
 1 AS `total_latency`,
 1 AS `memory_tmp_tables`,
 1 AS `disk_tmp_tables`,
 1 AS `avg_tmp_tables_per_query`,
 1 AS `tmp_tables_to_disk_pct`,
 1 AS `first_seen`,
 1 AS `last_seen`,
 1 AS `digest`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary`
--

DROP TABLE IF EXISTS `x$user_summary`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary` AS SELECT 
 1 AS `user`,
 1 AS `statements`,
 1 AS `statement_latency`,
 1 AS `statement_avg_latency`,
 1 AS `table_scans`,
 1 AS `file_ios`,
 1 AS `file_io_latency`,
 1 AS `current_connections`,
 1 AS `total_connections`,
 1 AS `unique_hosts`,
 1 AS `current_memory`,
 1 AS `total_memory_allocated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary_by_file_io`
--

DROP TABLE IF EXISTS `x$user_summary_by_file_io`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_file_io`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary_by_file_io` AS SELECT 
 1 AS `user`,
 1 AS `ios`,
 1 AS `io_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary_by_file_io_type`
--

DROP TABLE IF EXISTS `x$user_summary_by_file_io_type`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_file_io_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary_by_file_io_type` AS SELECT 
 1 AS `user`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary_by_stages`
--

DROP TABLE IF EXISTS `x$user_summary_by_stages`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_stages`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary_by_stages` AS SELECT 
 1 AS `user`,
 1 AS `event_name`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary_by_statement_latency`
--

DROP TABLE IF EXISTS `x$user_summary_by_statement_latency`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_statement_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary_by_statement_latency` AS SELECT 
 1 AS `user`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$user_summary_by_statement_type`
--

DROP TABLE IF EXISTS `x$user_summary_by_statement_type`;
/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_statement_type`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$user_summary_by_statement_type` AS SELECT 
 1 AS `user`,
 1 AS `statement`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `max_latency`,
 1 AS `lock_latency`,
 1 AS `cpu_latency`,
 1 AS `rows_sent`,
 1 AS `rows_examined`,
 1 AS `rows_affected`,
 1 AS `full_scans`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$wait_classes_global_by_avg_latency`
--

DROP TABLE IF EXISTS `x$wait_classes_global_by_avg_latency`;
/*!50001 DROP VIEW IF EXISTS `x$wait_classes_global_by_avg_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$wait_classes_global_by_avg_latency` AS SELECT 
 1 AS `event_class`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$wait_classes_global_by_latency`
--

DROP TABLE IF EXISTS `x$wait_classes_global_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$wait_classes_global_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$wait_classes_global_by_latency` AS SELECT 
 1 AS `event_class`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `min_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$waits_by_host_by_latency`
--

DROP TABLE IF EXISTS `x$waits_by_host_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$waits_by_host_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$waits_by_host_by_latency` AS SELECT 
 1 AS `host`,
 1 AS `event`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$waits_by_user_by_latency`
--

DROP TABLE IF EXISTS `x$waits_by_user_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$waits_by_user_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$waits_by_user_by_latency` AS SELECT 
 1 AS `user`,
 1 AS `event`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `x$waits_global_by_latency`
--

DROP TABLE IF EXISTS `x$waits_global_by_latency`;
/*!50001 DROP VIEW IF EXISTS `x$waits_global_by_latency`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `x$waits_global_by_latency` AS SELECT 
 1 AS `events`,
 1 AS `total`,
 1 AS `total_latency`,
 1 AS `avg_latency`,
 1 AS `max_latency`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `client_list_view`
--

/*!50001 DROP VIEW IF EXISTS `client_list_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Josh`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `client_list_view` AS select `c`.`id` AS `id`,`c`.`serviceRequestForm` AS `serviceRequestForm`,`c`.`name` AS `name`,`c`.`address` AS `address`,`c`.`email` AS `email`,`c`.`phone` AS `phone`,`c`.`company` AS `company`,`c`.`category` AS `category`,`c`.`serviceType` AS `serviceType`,`c`.`status` AS `status`,`c`.`progress` AS `progress`,`c`.`dateRequested` AS `dateRequested`,`c`.`startDate` AS `startDate`,`c`.`dueDate` AS `dueDate`,`c`.`dateClaimed` AS `dateClaimed`,`c`.`dateReleased` AS `dateReleased`,`c`.`requestForm` AS `requestForm`,`c`.`roa` AS `roa`,`c`.`ts` AS `ts`,`c`.`testDate` AS `testDate`,`c`.`releasedROA` AS `releasedROA`,`c`.`roaV` AS `roaV`,`c`.`officialReceipt` AS `officialReceipt`,`c`.`remarks` AS `remarks`,group_concat(distinct `st`.`testType` order by `st`.`testType` ASC separator ', ') AS `testTypes`,coalesce(sum(`st`.`amount`),0) AS `amount`,coalesce(sum(`st`.`sampleCount`),0) AS `sampleCount` from (`clients` `c` left join `service_tests` `st` on((`st`.`service_id` = `c`.`id`))) group by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `host_summary`
--

/*!50001 DROP VIEW IF EXISTS `host_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary` (`host`,`statements`,`statement_latency`,`statement_avg_latency`,`table_scans`,`file_ios`,`file_io_latency`,`current_connections`,`total_connections`,`unique_users`,`current_memory`,`total_memory_allocated`) AS select if((`performance_schema`.`accounts`.`HOST` is null),'background',`performance_schema`.`accounts`.`HOST`) AS `host`,sum(`stmt`.`total`) AS `statements`,format_pico_time(sum(`stmt`.`total_latency`)) AS `statement_latency`,format_pico_time(ifnull((sum(`stmt`.`total_latency`) / nullif(sum(`stmt`.`total`),0)),0)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,format_pico_time(sum(`io`.`io_latency`)) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`USER`) AS `unique_users`,format_bytes(sum(`mem`.`current_allocated`)) AS `current_memory`,format_bytes(sum(`mem`.`total_allocated`)) AS `total_memory_allocated` from (((`performance_schema`.`accounts` join `x$host_summary_by_statement_latency` `stmt` on((`performance_schema`.`accounts`.`HOST` = `stmt`.`host`))) join `x$host_summary_by_file_io` `io` on((`performance_schema`.`accounts`.`HOST` = `io`.`host`))) join `x$memory_by_host_by_current_bytes` `mem` on((`performance_schema`.`accounts`.`HOST` = `mem`.`host`))) group by if((`performance_schema`.`accounts`.`HOST` is null),'background',`performance_schema`.`accounts`.`HOST`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `host_summary_by_file_io`
--

/*!50001 DROP VIEW IF EXISTS `host_summary_by_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary_by_file_io` (`host`,`ios`,`io_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR`) AS `ios`,format_pico_time(sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`)) AS `io_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `host_summary_by_file_io_type`
--

/*!50001 DROP VIEW IF EXISTS `host_summary_by_file_io_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary_by_file_io_type` (`host`,`event_name`,`total`,`total_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` > 0)) order by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `host_summary_by_stages`
--

/*!50001 DROP VIEW IF EXISTS `host_summary_by_stages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary_by_stages` (`host`,`event_name`,`total`,`total_latency`,`avg_latency`) AS select if((`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency` from `performance_schema`.`events_stages_summary_by_host_by_event_name` where (`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `host_summary_by_statement_latency`
--

/*!50001 DROP VIEW IF EXISTS `host_summary_by_statement_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary_by_statement_latency` (`host`,`total`,`total_latency`,`max_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR`) AS `total`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,format_pico_time(max(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME`)) AS `lock_latency`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_CPU_TIME`)) AS `cpu_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` group by if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `host_summary_by_statement_type`
--

/*!50001 DROP VIEW IF EXISTS `host_summary_by_statement_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `host_summary_by_statement_type` (`host`,`statement`,`total`,`total_latency`,`max_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,substring_index(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_CPU_TIME`) AS `cpu_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` where (`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `innodb_buffer_stats_by_schema`
--

/*!50001 DROP VIEW IF EXISTS `innodb_buffer_stats_by_schema`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `innodb_buffer_stats_by_schema` (`object_schema`,`allocated`,`data`,`pages`,`pages_hashed`,`pages_old`,`rows_cached`) AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,format_bytes(sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`))) AS `allocated`,format_bytes(sum(`ibp`.`DATA_SIZE`)) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round((sum(`ibp`.`NUMBER_RECORDS`) / count(distinct `ibp`.`INDEX_NAME`)),0) AS `rows_cached` from `information_schema`.`INNODB_BUFFER_PAGE` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `innodb_buffer_stats_by_table`
--

/*!50001 DROP VIEW IF EXISTS `innodb_buffer_stats_by_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `innodb_buffer_stats_by_table` (`object_schema`,`object_name`,`allocated`,`data`,`pages`,`pages_hashed`,`pages_old`,`rows_cached`) AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,replace(substring_index(`ibp`.`TABLE_NAME`,'.',-(1)),'`','') AS `object_name`,format_bytes(sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`))) AS `allocated`,format_bytes(sum(`ibp`.`DATA_SIZE`)) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round((sum(`ibp`.`NUMBER_RECORDS`) / count(distinct `ibp`.`INDEX_NAME`)),0) AS `rows_cached` from `information_schema`.`INNODB_BUFFER_PAGE` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema`,`object_name` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `innodb_lock_waits`
--

/*!50001 DROP VIEW IF EXISTS `innodb_lock_waits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `innodb_lock_waits` (`wait_started`,`wait_age`,`wait_age_secs`,`locked_table`,`locked_table_schema`,`locked_table_name`,`locked_table_partition`,`locked_table_subpartition`,`locked_index`,`locked_type`,`waiting_trx_id`,`waiting_trx_started`,`waiting_trx_age`,`waiting_trx_rows_locked`,`waiting_trx_rows_modified`,`waiting_pid`,`waiting_query`,`waiting_lock_id`,`waiting_lock_mode`,`blocking_trx_id`,`blocking_pid`,`blocking_query`,`blocking_lock_id`,`blocking_lock_mode`,`blocking_trx_started`,`blocking_trx_age`,`blocking_trx_rows_locked`,`blocking_trx_rows_modified`,`sql_kill_blocking_query`,`sql_kill_blocking_connection`) AS select `r`.`trx_wait_started` AS `wait_started`,timediff(now(),`r`.`trx_wait_started`) AS `wait_age`,timestampdiff(SECOND,`r`.`trx_wait_started`,now()) AS `wait_age_secs`,concat(`sys`.`quote_identifier`(`rl`.`OBJECT_SCHEMA`),'.',`sys`.`quote_identifier`(`rl`.`OBJECT_NAME`)) AS `locked_table`,`rl`.`OBJECT_SCHEMA` AS `locked_table_schema`,`rl`.`OBJECT_NAME` AS `locked_table_name`,`rl`.`PARTITION_NAME` AS `locked_table_partition`,`rl`.`SUBPARTITION_NAME` AS `locked_table_subpartition`,`rl`.`INDEX_NAME` AS `locked_index`,`rl`.`LOCK_TYPE` AS `locked_type`,`r`.`trx_id` AS `waiting_trx_id`,`r`.`trx_started` AS `waiting_trx_started`,timediff(now(),`r`.`trx_started`) AS `waiting_trx_age`,`r`.`trx_rows_locked` AS `waiting_trx_rows_locked`,`r`.`trx_rows_modified` AS `waiting_trx_rows_modified`,`r`.`trx_mysql_thread_id` AS `waiting_pid`,`sys`.`format_statement`(`r`.`trx_query`) AS `waiting_query`,`rl`.`ENGINE_LOCK_ID` AS `waiting_lock_id`,`rl`.`LOCK_MODE` AS `waiting_lock_mode`,`b`.`trx_id` AS `blocking_trx_id`,`b`.`trx_mysql_thread_id` AS `blocking_pid`,`sys`.`format_statement`(`b`.`trx_query`) AS `blocking_query`,`bl`.`ENGINE_LOCK_ID` AS `blocking_lock_id`,`bl`.`LOCK_MODE` AS `blocking_lock_mode`,`b`.`trx_started` AS `blocking_trx_started`,timediff(now(),`b`.`trx_started`) AS `blocking_trx_age`,`b`.`trx_rows_locked` AS `blocking_trx_rows_locked`,`b`.`trx_rows_modified` AS `blocking_trx_rows_modified`,concat('KILL QUERY ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_query`,concat('KILL ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_connection` from ((((`performance_schema`.`data_lock_waits` `w` join `information_schema`.`INNODB_TRX` `b` on((`b`.`trx_id` = cast(`w`.`BLOCKING_ENGINE_TRANSACTION_ID` as char charset utf8mb4)))) join `information_schema`.`INNODB_TRX` `r` on((`r`.`trx_id` = cast(`w`.`REQUESTING_ENGINE_TRANSACTION_ID` as char charset utf8mb4)))) join `performance_schema`.`data_locks` `bl` on(((`bl`.`ENGINE_LOCK_ID` = `w`.`BLOCKING_ENGINE_LOCK_ID`) and (`bl`.`ENGINE` = `w`.`ENGINE`)))) join `performance_schema`.`data_locks` `rl` on(((`rl`.`ENGINE_LOCK_ID` = `w`.`REQUESTING_ENGINE_LOCK_ID`) and (`rl`.`ENGINE` = `w`.`ENGINE`)))) order by `r`.`trx_wait_started` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `io_by_thread_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `io_by_thread_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `io_by_thread_by_latency` (`user`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`,`thread_id`,`processlist_id`) AS select if((`performance_schema`.`threads`.`PROCESSLIST_ID` is null),substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),concat(`performance_schema`.`threads`.`PROCESSLIST_USER`,'@',convert(`performance_schema`.`threads`.`PROCESSLIST_HOST` using utf8mb4))) AS `user`,sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`COUNT_STAR`) AS `total`,format_pico_time(sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,format_pico_time(min(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,format_pico_time(avg(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`AVG_TIMER_WAIT`)) AS `avg_latency`,format_pico_time(max(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency`,`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` AS `thread_id`,`performance_schema`.`threads`.`PROCESSLIST_ID` AS `processlist_id` from (`performance_schema`.`events_waits_summary_by_thread_by_event_name` left join `performance_schema`.`threads` on((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) where ((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT` > 0)) group by `performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID`,`performance_schema`.`threads`.`PROCESSLIST_ID`,`user` order by sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `io_global_by_file_by_bytes`
--

/*!50001 DROP VIEW IF EXISTS `io_global_by_file_by_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `io_global_by_file_by_bytes` (`file`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_write`,`total`,`write_pct`) AS select `sys`.`format_path`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,format_bytes(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_read`,format_bytes(ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`,0)),0)) AS `avg_read`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,format_bytes(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total_written`,format_bytes(ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`,0)),0.00)) AS `avg_write`,format_bytes((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`)) AS `total`,ifnull(round((100 - ((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`),0)) * 100)),2),0.00) AS `write_pct` from `performance_schema`.`file_summary_by_instance` order by (`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `io_global_by_file_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `io_global_by_file_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `io_global_by_file_by_latency` (`file`,`total`,`total_latency`,`count_read`,`read_latency`,`count_write`,`write_latency`,`count_misc`,`misc_latency`) AS select `sys`.`format_path`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT`) AS `total_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,format_pico_time(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ`) AS `read_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,format_pico_time(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE`) AS `write_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_MISC` AS `count_misc`,format_pico_time(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC`) AS `misc_latency` from `performance_schema`.`file_summary_by_instance` order by `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `io_global_by_wait_by_bytes`
--

/*!50001 DROP VIEW IF EXISTS `io_global_by_wait_by_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `io_global_by_wait_by_bytes` (`event_name`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_written`,`total_requested`) AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,format_bytes(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_read`,format_bytes(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0)) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,format_bytes(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total_written`,format_bytes(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0)) AS `avg_written`,format_bytes((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`)) AS `total_requested` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by (`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `io_global_by_wait_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `io_global_by_wait_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `io_global_by_wait_by_latency` (`event_name`,`total`,`total_latency`,`avg_latency`,`max_latency`,`read_latency`,`write_latency`,`misc_latency`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_written`) AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_READ`) AS `read_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WRITE`) AS `write_latency`,format_pico_time(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_MISC`) AS `misc_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,format_bytes(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_read`,format_bytes(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0)) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,format_bytes(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total_written`,format_bytes(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0)) AS `avg_written` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `latest_file_io`
--

/*!50001 DROP VIEW IF EXISTS `latest_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `latest_file_io` (`thread`,`file`,`latency`,`operation`,`requested`) AS select if((`information_schema`.`processlist`.`ID` is null),concat(substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),':',`performance_schema`.`events_waits_history_long`.`THREAD_ID`),convert(concat(`information_schema`.`processlist`.`USER`,'@',`information_schema`.`processlist`.`HOST`,':',`information_schema`.`processlist`.`ID`) using utf8mb4)) AS `thread`,`sys`.`format_path`(`performance_schema`.`events_waits_history_long`.`OBJECT_NAME`) AS `file`,format_pico_time(`performance_schema`.`events_waits_history_long`.`TIMER_WAIT`) AS `latency`,`performance_schema`.`events_waits_history_long`.`OPERATION` AS `operation`,format_bytes(`performance_schema`.`events_waits_history_long`.`NUMBER_OF_BYTES`) AS `requested` from ((`performance_schema`.`events_waits_history_long` join `performance_schema`.`threads` on((`performance_schema`.`events_waits_history_long`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) left join `information_schema`.`PROCESSLIST` on((`performance_schema`.`threads`.`PROCESSLIST_ID` = `information_schema`.`processlist`.`ID`))) where ((`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` is not null) and (`performance_schema`.`events_waits_history_long`.`EVENT_NAME` like 'wait/io/file/%')) order by `performance_schema`.`events_waits_history_long`.`TIMER_START` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `memory_by_host_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `memory_by_host_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `memory_by_host_by_current_bytes` (`host`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select if((`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,format_bytes(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,format_bytes(ifnull((sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`),0)),0)) AS `current_avg_alloc`,format_bytes(max(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,format_bytes(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated` from `performance_schema`.`memory_summary_by_host_by_event_name` group by if((`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `memory_by_thread_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `memory_by_thread_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `memory_by_thread_by_current_bytes` (`thread_id`,`user`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select `mt`.`THREAD_ID` AS `thread_id`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',convert(`t`.`PROCESSLIST_HOST` using utf8mb4)),replace(`t`.`NAME`,'thread/','')) AS `user`,sum(`mt`.`CURRENT_COUNT_USED`) AS `current_count_used`,format_bytes(sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,format_bytes(ifnull((sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`mt`.`CURRENT_COUNT_USED`),0)),0)) AS `current_avg_alloc`,format_bytes(max(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,format_bytes(sum(`mt`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated` from (`performance_schema`.`memory_summary_by_thread_by_event_name` `mt` join `performance_schema`.`threads` `t` on((`mt`.`THREAD_ID` = `t`.`THREAD_ID`))) group by `mt`.`THREAD_ID`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',convert(`t`.`PROCESSLIST_HOST` using utf8mb4)),replace(`t`.`NAME`,'thread/','')) order by sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `memory_by_user_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `memory_by_user_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `memory_by_user_by_current_bytes` (`user`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select if((`performance_schema`.`memory_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,format_bytes(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,format_bytes(ifnull((sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`),0)),0)) AS `current_avg_alloc`,format_bytes(max(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,format_bytes(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated` from `performance_schema`.`memory_summary_by_user_by_event_name` group by if((`performance_schema`.`memory_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `memory_global_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `memory_global_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `memory_global_by_current_bytes` (`event_name`,`current_count`,`current_alloc`,`current_avg_alloc`,`high_count`,`high_alloc`,`high_avg_alloc`) AS select `performance_schema`.`memory_summary_global_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED` AS `current_count`,format_bytes(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_alloc`,format_bytes(ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED`,0)),0)) AS `current_avg_alloc`,`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED` AS `high_count`,format_bytes(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED`) AS `high_alloc`,format_bytes(ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED`,0)),0)) AS `high_avg_alloc` from `performance_schema`.`memory_summary_global_by_event_name` where (`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` > 0) order by `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `memory_global_total`
--

/*!50001 DROP VIEW IF EXISTS `memory_global_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `memory_global_total` (`total_allocated`) AS select format_bytes(sum(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `total_allocated` from `performance_schema`.`memory_summary_global_by_event_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `metrics`
--

/*!50001 DROP VIEW IF EXISTS `metrics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `metrics` (`Variable_name`,`Variable_value`,`Type`,`Enabled`) AS select lower(`performance_schema`.`global_status`.`VARIABLE_NAME`) AS `Variable_name`,`performance_schema`.`global_status`.`VARIABLE_VALUE` AS `Variable_value`,'Global Status' AS `Type`,'YES' AS `Enabled` from `performance_schema`.`global_status` union all select `information_schema`.`innodb_metrics`.`NAME` AS `Variable_name`,`information_schema`.`innodb_metrics`.`COUNT` AS `Variable_value`,concat('InnoDB Metrics - ',`information_schema`.`innodb_metrics`.`SUBSYSTEM`) AS `Type`,if((`information_schema`.`innodb_metrics`.`STATUS` = 'enabled'),'YES','NO') AS `Enabled` from `information_schema`.`INNODB_METRICS` where (`information_schema`.`innodb_metrics`.`NAME` not in ('lock_row_lock_time','lock_row_lock_time_avg','lock_row_lock_time_max','lock_row_lock_waits','buffer_pool_reads','buffer_pool_read_requests','buffer_pool_write_requests','buffer_pool_wait_free','buffer_pool_read_ahead','buffer_pool_read_ahead_evicted','buffer_pool_pages_total','buffer_pool_pages_misc','buffer_pool_pages_data','buffer_pool_bytes_data','buffer_pool_pages_dirty','buffer_pool_bytes_dirty','buffer_pool_pages_free','buffer_pages_created','buffer_pages_written','buffer_pages_read','buffer_data_reads','buffer_data_written','file_num_open_files','os_log_bytes_written','os_log_fsyncs','os_log_pending_fsyncs','os_log_pending_writes','log_waits','log_write_requests','log_writes','innodb_dblwr_writes','innodb_dblwr_pages_written','innodb_page_size')) union all select 'memory_current_allocated' AS `Variable_name`,sum(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `Variable_value`,'Performance Schema' AS `Type`,if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'YES'))) = 0),'NO',if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'NO'))) = 0),'YES','PARTIAL')) AS `Enabled` from `performance_schema`.`memory_summary_global_by_event_name` union all select 'memory_total_allocated' AS `Variable_name`,sum(`performance_schema`.`memory_summary_global_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `Variable_value`,'Performance Schema' AS `Type`,if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'YES'))) = 0),'NO',if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'NO'))) = 0),'YES','PARTIAL')) AS `Enabled` from `performance_schema`.`memory_summary_global_by_event_name` union all select 'NOW()' AS `Variable_name`,now(3) AS `Variable_value`,'System Time' AS `Type`,'YES' AS `Enabled` union all select 'UNIX_TIMESTAMP()' AS `Variable_name`,round(unix_timestamp(now(3)),3) AS `Variable_value`,'System Time' AS `Type`,'YES' AS `Enabled` order by `Type`,`Variable_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `processlist`
--

/*!50001 DROP VIEW IF EXISTS `processlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `processlist` (`thd_id`,`conn_id`,`user`,`db`,`command`,`state`,`time`,`current_statement`,`execution_engine`,`statement_latency`,`progress`,`lock_latency`,`cpu_latency`,`rows_examined`,`rows_sent`,`rows_affected`,`tmp_tables`,`tmp_disk_tables`,`full_scan`,`last_statement`,`last_statement_latency`,`current_memory`,`last_wait`,`last_wait_latency`,`source`,`trx_latency`,`trx_state`,`trx_autocommit`,`pid`,`program_name`) AS select `pps`.`THREAD_ID` AS `thd_id`,`pps`.`PROCESSLIST_ID` AS `conn_id`,if((`pps`.`NAME` in ('thread/sql/one_connection','thread/thread_pool/tp_one_connection')),concat(`pps`.`PROCESSLIST_USER`,'@',convert(`pps`.`PROCESSLIST_HOST` using utf8mb4)),replace(`pps`.`NAME`,'thread/','')) AS `user`,`pps`.`PROCESSLIST_DB` AS `db`,`pps`.`PROCESSLIST_COMMAND` AS `command`,`pps`.`PROCESSLIST_STATE` AS `state`,`pps`.`PROCESSLIST_TIME` AS `time`,`sys`.`format_statement`(`pps`.`PROCESSLIST_INFO`) AS `current_statement`,`pps`.`EXECUTION_ENGINE` AS `execution_engine`,if((`esc`.`END_EVENT_ID` is null),format_pico_time(`esc`.`TIMER_WAIT`),NULL) AS `statement_latency`,if((`esc`.`END_EVENT_ID` is null),round((100 * (`estc`.`WORK_COMPLETED` / `estc`.`WORK_ESTIMATED`)),2),NULL) AS `progress`,format_pico_time(`esc`.`LOCK_TIME`) AS `lock_latency`,format_pico_time(`esc`.`CPU_TIME`) AS `cpu_latency`,`esc`.`ROWS_EXAMINED` AS `rows_examined`,`esc`.`ROWS_SENT` AS `rows_sent`,`esc`.`ROWS_AFFECTED` AS `rows_affected`,`esc`.`CREATED_TMP_TABLES` AS `tmp_tables`,`esc`.`CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,if(((`esc`.`NO_GOOD_INDEX_USED` > 0) or (`esc`.`NO_INDEX_USED` > 0)),'YES','NO') AS `full_scan`,if((`esc`.`END_EVENT_ID` is not null),`sys`.`format_statement`(`esc`.`SQL_TEXT`),NULL) AS `last_statement`,if((`esc`.`END_EVENT_ID` is not null),format_pico_time(`esc`.`TIMER_WAIT`),NULL) AS `last_statement_latency`,format_bytes(`mem`.`current_allocated`) AS `current_memory`,`ewc`.`EVENT_NAME` AS `last_wait`,if(((`ewc`.`END_EVENT_ID` is null) and (`ewc`.`EVENT_NAME` is not null)),'Still Waiting',convert(format_pico_time(`ewc`.`TIMER_WAIT`) using utf8mb4)) AS `last_wait_latency`,`ewc`.`SOURCE` AS `source`,format_pico_time(`etc`.`TIMER_WAIT`) AS `trx_latency`,`etc`.`STATE` AS `trx_state`,`etc`.`AUTOCOMMIT` AS `trx_autocommit`,`conattr_pid`.`ATTR_VALUE` AS `pid`,`conattr_progname`.`ATTR_VALUE` AS `program_name` from (((((((`performance_schema`.`threads` `pps` left join `performance_schema`.`events_waits_current` `ewc` on((`pps`.`THREAD_ID` = `ewc`.`THREAD_ID`))) left join `performance_schema`.`events_stages_current` `estc` on((`pps`.`THREAD_ID` = `estc`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `esc` on((`pps`.`THREAD_ID` = `esc`.`THREAD_ID`))) left join `performance_schema`.`events_transactions_current` `etc` on((`pps`.`THREAD_ID` = `etc`.`THREAD_ID`))) left join `x$memory_by_thread_by_current_bytes` `mem` on((`pps`.`THREAD_ID` = `mem`.`thread_id`))) left join `performance_schema`.`session_connect_attrs` `conattr_pid` on(((`conattr_pid`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_pid`.`ATTR_NAME` = '_pid')))) left join `performance_schema`.`session_connect_attrs` `conattr_progname` on(((`conattr_progname`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_progname`.`ATTR_NAME` = 'program_name')))) order by `pps`.`PROCESSLIST_TIME` desc,`last_wait_latency` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ps_check_lost_instrumentation`
--

/*!50001 DROP VIEW IF EXISTS `ps_check_lost_instrumentation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `ps_check_lost_instrumentation` (`variable_name`,`variable_value`) AS select `performance_schema`.`global_status`.`VARIABLE_NAME` AS `variable_name`,`performance_schema`.`global_status`.`VARIABLE_VALUE` AS `variable_value` from `performance_schema`.`global_status` where ((`performance_schema`.`global_status`.`VARIABLE_NAME` like 'perf%lost') and (`performance_schema`.`global_status`.`VARIABLE_VALUE` > 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_auto_increment_columns`
--

/*!50001 DROP VIEW IF EXISTS `schema_auto_increment_columns`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_auto_increment_columns` (`table_schema`,`table_name`,`column_name`,`data_type`,`column_type`,`is_signed`,`is_unsigned`,`max_value`,`auto_increment`,`auto_increment_ratio`) AS select `information_schema`.`columns`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`columns`.`TABLE_NAME` AS `TABLE_NAME`,`information_schema`.`columns`.`COLUMN_NAME` AS `COLUMN_NAME`,`information_schema`.`columns`.`DATA_TYPE` AS `DATA_TYPE`,`information_schema`.`columns`.`COLUMN_TYPE` AS `COLUMN_TYPE`,(locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) = 0) AS `is_signed`,(locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) > 0) AS `is_unsigned`,((case `information_schema`.`columns`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) > 0),0,1)) AS `max_value`,`information_schema`.`tables`.`AUTO_INCREMENT` AS `AUTO_INCREMENT`,(`information_schema`.`tables`.`AUTO_INCREMENT` / ((case `information_schema`.`columns`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) > 0),0,1))) AS `auto_increment_ratio` from (`information_schema`.`COLUMNS` join `information_schema`.`TABLES` on(((`information_schema`.`columns`.`TABLE_SCHEMA` = `information_schema`.`tables`.`TABLE_SCHEMA`) and (`information_schema`.`columns`.`TABLE_NAME` = `information_schema`.`tables`.`TABLE_NAME`)))) where ((`information_schema`.`columns`.`TABLE_SCHEMA` not in ('mysql','sys','INFORMATION_SCHEMA','performance_schema')) and (`information_schema`.`tables`.`TABLE_TYPE` = 'BASE TABLE') and (`information_schema`.`columns`.`EXTRA` = 'auto_increment')) order by (`information_schema`.`tables`.`AUTO_INCREMENT` / ((case `information_schema`.`columns`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) > 0),0,1))) desc,((case `information_schema`.`columns`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`columns`.`COLUMN_TYPE`) > 0),0,1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_index_statistics`
--

/*!50001 DROP VIEW IF EXISTS `schema_index_statistics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_index_statistics` (`table_schema`,`table_name`,`index_name`,`rows_selected`,`select_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`) AS select `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `table_schema`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `table_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` AS `index_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_FETCH` AS `rows_selected`,format_pico_time(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_FETCH`) AS `select_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_INSERT` AS `rows_inserted`,format_pico_time(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_INSERT`) AS `insert_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_UPDATE` AS `rows_updated`,format_pico_time(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_UPDATE`) AS `update_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_DELETE` AS `rows_deleted`,format_pico_time(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_DELETE`) AS `delete_latency` from `performance_schema`.`table_io_waits_summary_by_index_usage` where (`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` is not null) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_object_overview`
--

/*!50001 DROP VIEW IF EXISTS `schema_object_overview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_object_overview` (`db`,`object_type`,`count`) AS select `information_schema`.`routines`.`ROUTINE_SCHEMA` AS `db`,`information_schema`.`routines`.`ROUTINE_TYPE` AS `object_type`,count(0) AS `count` from `information_schema`.`ROUTINES` group by `information_schema`.`routines`.`ROUTINE_SCHEMA`,`information_schema`.`routines`.`ROUTINE_TYPE` union select `information_schema`.`tables`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`tables`.`TABLE_TYPE` AS `TABLE_TYPE`,count(0) AS `COUNT(*)` from `information_schema`.`TABLES` group by `information_schema`.`tables`.`TABLE_SCHEMA`,`information_schema`.`tables`.`TABLE_TYPE` union select `information_schema`.`statistics`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,concat('INDEX (',`information_schema`.`statistics`.`INDEX_TYPE`,')') AS `CONCAT('INDEX (', INDEX_TYPE, ')')`,count(0) AS `COUNT(*)` from `information_schema`.`STATISTICS` group by `information_schema`.`statistics`.`TABLE_SCHEMA`,`information_schema`.`statistics`.`INDEX_TYPE` union select `information_schema`.`triggers`.`TRIGGER_SCHEMA` AS `TRIGGER_SCHEMA`,'TRIGGER' AS `TRIGGER`,count(0) AS `COUNT(*)` from `information_schema`.`TRIGGERS` group by `information_schema`.`triggers`.`TRIGGER_SCHEMA` union select `information_schema`.`events`.`EVENT_SCHEMA` AS `EVENT_SCHEMA`,'EVENT' AS `EVENT`,count(0) AS `COUNT(*)` from `information_schema`.`EVENTS` group by `information_schema`.`events`.`EVENT_SCHEMA` order by `db`,`object_type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_redundant_indexes`
--

/*!50001 DROP VIEW IF EXISTS `schema_redundant_indexes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_redundant_indexes` (`table_schema`,`table_name`,`redundant_index_name`,`redundant_index_columns`,`redundant_index_non_unique`,`dominant_index_name`,`dominant_index_columns`,`dominant_index_non_unique`,`subpart_exists`,`sql_drop_index`) AS select `redundant_keys`.`table_schema` AS `table_schema`,`redundant_keys`.`table_name` AS `table_name`,`redundant_keys`.`index_name` AS `redundant_index_name`,`redundant_keys`.`index_columns` AS `redundant_index_columns`,`redundant_keys`.`non_unique` AS `redundant_index_non_unique`,`dominant_keys`.`index_name` AS `dominant_index_name`,`dominant_keys`.`index_columns` AS `dominant_index_columns`,`dominant_keys`.`non_unique` AS `dominant_index_non_unique`,if(((0 <> `redundant_keys`.`subpart_exists`) or (0 <> `dominant_keys`.`subpart_exists`)),1,0) AS `subpart_exists`,concat('ALTER TABLE `',`redundant_keys`.`table_schema`,'`.`',`redundant_keys`.`table_name`,'` DROP INDEX `',`redundant_keys`.`index_name`,'`') AS `sql_drop_index` from (`x$schema_flattened_keys` `redundant_keys` join `x$schema_flattened_keys` `dominant_keys` on(((`redundant_keys`.`table_schema` = `dominant_keys`.`table_schema`) and (`redundant_keys`.`table_name` = `dominant_keys`.`table_name`)))) where ((`redundant_keys`.`index_name` <> `dominant_keys`.`index_name`) and (((`redundant_keys`.`index_columns` = `dominant_keys`.`index_columns`) and ((`redundant_keys`.`non_unique` > `dominant_keys`.`non_unique`) or ((`redundant_keys`.`non_unique` = `dominant_keys`.`non_unique`) and (if((`redundant_keys`.`index_name` = 'PRIMARY'),'',`redundant_keys`.`index_name`) > if((`dominant_keys`.`index_name` = 'PRIMARY'),'',`dominant_keys`.`index_name`))))) or ((locate(concat(`redundant_keys`.`index_columns`,','),`dominant_keys`.`index_columns`) = 1) and (`redundant_keys`.`non_unique` = 1)) or ((locate(concat(`dominant_keys`.`index_columns`,','),`redundant_keys`.`index_columns`) = 1) and (`dominant_keys`.`non_unique` = 0)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_table_lock_waits`
--

/*!50001 DROP VIEW IF EXISTS `schema_table_lock_waits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_table_lock_waits` (`object_schema`,`object_name`,`waiting_thread_id`,`waiting_pid`,`waiting_account`,`waiting_lock_type`,`waiting_lock_duration`,`waiting_query`,`waiting_query_secs`,`waiting_query_rows_affected`,`waiting_query_rows_examined`,`blocking_thread_id`,`blocking_pid`,`blocking_account`,`blocking_lock_type`,`blocking_lock_duration`,`sql_kill_blocking_query`,`sql_kill_blocking_connection`) AS select `g`.`OBJECT_SCHEMA` AS `object_schema`,`g`.`OBJECT_NAME` AS `object_name`,`pt`.`THREAD_ID` AS `waiting_thread_id`,`pt`.`PROCESSLIST_ID` AS `waiting_pid`,`sys`.`ps_thread_account`(`p`.`OWNER_THREAD_ID`) AS `waiting_account`,`p`.`LOCK_TYPE` AS `waiting_lock_type`,`p`.`LOCK_DURATION` AS `waiting_lock_duration`,`sys`.`format_statement`(`pt`.`PROCESSLIST_INFO`) AS `waiting_query`,`pt`.`PROCESSLIST_TIME` AS `waiting_query_secs`,`ps`.`ROWS_AFFECTED` AS `waiting_query_rows_affected`,`ps`.`ROWS_EXAMINED` AS `waiting_query_rows_examined`,`gt`.`THREAD_ID` AS `blocking_thread_id`,`gt`.`PROCESSLIST_ID` AS `blocking_pid`,`sys`.`ps_thread_account`(`g`.`OWNER_THREAD_ID`) AS `blocking_account`,`g`.`LOCK_TYPE` AS `blocking_lock_type`,`g`.`LOCK_DURATION` AS `blocking_lock_duration`,concat('KILL QUERY ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_query`,concat('KILL ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_connection` from (((((`performance_schema`.`metadata_locks` `g` join `performance_schema`.`metadata_locks` `p` on(((`g`.`OBJECT_TYPE` = `p`.`OBJECT_TYPE`) and (`g`.`OBJECT_SCHEMA` = `p`.`OBJECT_SCHEMA`) and (`g`.`OBJECT_NAME` = `p`.`OBJECT_NAME`) and (`g`.`LOCK_STATUS` = 'GRANTED') and (`p`.`LOCK_STATUS` = 'PENDING')))) join `performance_schema`.`threads` `gt` on((`g`.`OWNER_THREAD_ID` = `gt`.`THREAD_ID`))) join `performance_schema`.`threads` `pt` on((`p`.`OWNER_THREAD_ID` = `pt`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `gs` on((`g`.`OWNER_THREAD_ID` = `gs`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `ps` on((`p`.`OWNER_THREAD_ID` = `ps`.`THREAD_ID`))) where (`g`.`OBJECT_TYPE` = 'TABLE') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_table_statistics`
--

/*!50001 DROP VIEW IF EXISTS `schema_table_statistics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_table_statistics` (`table_schema`,`table_name`,`total_latency`,`rows_fetched`,`fetch_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`,`io_read_requests`,`io_read`,`io_read_latency`,`io_write_requests`,`io_write`,`io_write_latency`,`io_misc_requests`,`io_misc_latency`) AS select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,format_pico_time(`pst`.`SUM_TIMER_WAIT`) AS `total_latency`,`pst`.`COUNT_FETCH` AS `rows_fetched`,format_pico_time(`pst`.`SUM_TIMER_FETCH`) AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,format_pico_time(`pst`.`SUM_TIMER_INSERT`) AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,format_pico_time(`pst`.`SUM_TIMER_UPDATE`) AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,format_pico_time(`pst`.`SUM_TIMER_DELETE`) AS `delete_latency`,`fsbi`.`count_read` AS `io_read_requests`,format_bytes(`fsbi`.`sum_number_of_bytes_read`) AS `io_read`,format_pico_time(`fsbi`.`sum_timer_read`) AS `io_read_latency`,`fsbi`.`count_write` AS `io_write_requests`,format_bytes(`fsbi`.`sum_number_of_bytes_write`) AS `io_write`,format_pico_time(`fsbi`.`sum_timer_write`) AS `io_write_latency`,`fsbi`.`count_misc` AS `io_misc_requests`,format_pico_time(`fsbi`.`sum_timer_misc`) AS `io_misc_latency` from (`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_table_statistics_with_buffer`
--

/*!50001 DROP VIEW IF EXISTS `schema_table_statistics_with_buffer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_table_statistics_with_buffer` (`table_schema`,`table_name`,`rows_fetched`,`fetch_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`,`io_read_requests`,`io_read`,`io_read_latency`,`io_write_requests`,`io_write`,`io_write_latency`,`io_misc_requests`,`io_misc_latency`,`innodb_buffer_allocated`,`innodb_buffer_data`,`innodb_buffer_free`,`innodb_buffer_pages`,`innodb_buffer_pages_hashed`,`innodb_buffer_pages_old`,`innodb_buffer_rows_cached`) AS select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,`pst`.`COUNT_FETCH` AS `rows_fetched`,format_pico_time(`pst`.`SUM_TIMER_FETCH`) AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,format_pico_time(`pst`.`SUM_TIMER_INSERT`) AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,format_pico_time(`pst`.`SUM_TIMER_UPDATE`) AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,format_pico_time(`pst`.`SUM_TIMER_DELETE`) AS `delete_latency`,`fsbi`.`count_read` AS `io_read_requests`,format_bytes(`fsbi`.`sum_number_of_bytes_read`) AS `io_read`,format_pico_time(`fsbi`.`sum_timer_read`) AS `io_read_latency`,`fsbi`.`count_write` AS `io_write_requests`,format_bytes(`fsbi`.`sum_number_of_bytes_write`) AS `io_write`,format_pico_time(`fsbi`.`sum_timer_write`) AS `io_write_latency`,`fsbi`.`count_misc` AS `io_misc_requests`,format_pico_time(`fsbi`.`sum_timer_misc`) AS `io_misc_latency`,format_bytes(`ibp`.`allocated`) AS `innodb_buffer_allocated`,format_bytes(`ibp`.`data`) AS `innodb_buffer_data`,format_bytes((`ibp`.`allocated` - `ibp`.`data`)) AS `innodb_buffer_free`,`ibp`.`pages` AS `innodb_buffer_pages`,`ibp`.`pages_hashed` AS `innodb_buffer_pages_hashed`,`ibp`.`pages_old` AS `innodb_buffer_pages_old`,`ibp`.`rows_cached` AS `innodb_buffer_rows_cached` from ((`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) left join `x$innodb_buffer_stats_by_table` `ibp` on(((`pst`.`OBJECT_SCHEMA` = `ibp`.`object_schema`) and (`pst`.`OBJECT_NAME` = `ibp`.`object_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_tables_with_full_table_scans`
--

/*!50001 DROP VIEW IF EXISTS `schema_tables_with_full_table_scans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_tables_with_full_table_scans` (`object_schema`,`object_name`,`rows_full_scanned`,`latency`) AS select `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `object_schema`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `object_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` AS `rows_full_scanned`,format_pico_time(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT`) AS `latency` from `performance_schema`.`table_io_waits_summary_by_index_usage` where ((`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` is null) and (`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` > 0)) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `schema_unused_indexes`
--

/*!50001 DROP VIEW IF EXISTS `schema_unused_indexes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `schema_unused_indexes` (`object_schema`,`object_name`,`index_name`) AS select `t`.`OBJECT_SCHEMA` AS `object_schema`,`t`.`OBJECT_NAME` AS `object_name`,`t`.`INDEX_NAME` AS `index_name` from (`performance_schema`.`table_io_waits_summary_by_index_usage` `t` join `information_schema`.`STATISTICS` `s` on(((`t`.`OBJECT_SCHEMA` = `information_schema`.`s`.`TABLE_SCHEMA`) and (`t`.`OBJECT_NAME` = `information_schema`.`s`.`TABLE_NAME`) and (`t`.`INDEX_NAME` = `information_schema`.`s`.`INDEX_NAME`)))) where ((`t`.`INDEX_NAME` is not null) and (`t`.`COUNT_STAR` = 0) and (`t`.`OBJECT_SCHEMA` <> 'mysql') and (`t`.`INDEX_NAME` <> 'PRIMARY') and (`information_schema`.`s`.`NON_UNIQUE` = 1) and (`information_schema`.`s`.`SEQ_IN_INDEX` = 1)) order by `t`.`OBJECT_SCHEMA`,`t`.`OBJECT_NAME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `session`
--

/*!50001 DROP VIEW IF EXISTS `session`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `session` AS select `processlist`.`thd_id` AS `thd_id`,`processlist`.`conn_id` AS `conn_id`,`processlist`.`user` AS `user`,`processlist`.`db` AS `db`,`processlist`.`command` AS `command`,`processlist`.`state` AS `state`,`processlist`.`time` AS `time`,`processlist`.`current_statement` AS `current_statement`,`processlist`.`execution_engine` AS `execution_engine`,`processlist`.`statement_latency` AS `statement_latency`,`processlist`.`progress` AS `progress`,`processlist`.`lock_latency` AS `lock_latency`,`processlist`.`cpu_latency` AS `cpu_latency`,`processlist`.`rows_examined` AS `rows_examined`,`processlist`.`rows_sent` AS `rows_sent`,`processlist`.`rows_affected` AS `rows_affected`,`processlist`.`tmp_tables` AS `tmp_tables`,`processlist`.`tmp_disk_tables` AS `tmp_disk_tables`,`processlist`.`full_scan` AS `full_scan`,`processlist`.`last_statement` AS `last_statement`,`processlist`.`last_statement_latency` AS `last_statement_latency`,`processlist`.`current_memory` AS `current_memory`,`processlist`.`last_wait` AS `last_wait`,`processlist`.`last_wait_latency` AS `last_wait_latency`,`processlist`.`source` AS `source`,`processlist`.`trx_latency` AS `trx_latency`,`processlist`.`trx_state` AS `trx_state`,`processlist`.`trx_autocommit` AS `trx_autocommit`,`processlist`.`pid` AS `pid`,`processlist`.`program_name` AS `program_name` from `processlist` where ((`processlist`.`conn_id` is not null) and (`processlist`.`command` <> 'Daemon')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `session_ssl_status`
--

/*!50001 DROP VIEW IF EXISTS `session_ssl_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `session_ssl_status` (`thread_id`,`ssl_version`,`ssl_cipher`,`ssl_sessions_reused`) AS select `sslver`.`THREAD_ID` AS `thread_id`,`sslver`.`VARIABLE_VALUE` AS `ssl_version`,`sslcip`.`VARIABLE_VALUE` AS `ssl_cipher`,`sslreuse`.`VARIABLE_VALUE` AS `ssl_sessions_reused` from ((`performance_schema`.`status_by_thread` `sslver` left join `performance_schema`.`status_by_thread` `sslcip` on(((`sslcip`.`THREAD_ID` = `sslver`.`THREAD_ID`) and (`sslcip`.`VARIABLE_NAME` = 'Ssl_cipher')))) left join `performance_schema`.`status_by_thread` `sslreuse` on(((`sslreuse`.`THREAD_ID` = `sslver`.`THREAD_ID`) and (`sslreuse`.`VARIABLE_NAME` = 'Ssl_sessions_reused')))) where (`sslver`.`VARIABLE_NAME` = 'Ssl_version') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statement_analysis`
--

/*!50001 DROP VIEW IF EXISTS `statement_analysis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statement_analysis` (`query`,`db`,`full_scan`,`exec_count`,`err_count`,`warn_count`,`total_latency`,`max_latency`,`avg_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_sent_avg`,`rows_examined`,`rows_examined_avg`,`rows_affected`,`rows_affected_avg`,`tmp_tables`,`tmp_disk_tables`,`rows_sorted`,`sort_merge_passes`,`max_controlled_memory`,`max_total_memory`,`digest`,`first_seen`,`last_seen`) AS select `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,if(((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `err_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warn_count`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`MAX_TIMER_WAIT`) AS `max_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_LOCK_TIME`) AS `lock_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_CPU_TIME`) AS `cpu_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` AS `rows_affected`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_affected_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `tmp_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,format_bytes(`performance_schema`.`events_statements_summary_by_digest`.`MAX_CONTROLLED_MEMORY`) AS `max_controlled_memory`,format_bytes(`performance_schema`.`events_statements_summary_by_digest`.`MAX_TOTAL_MEMORY`) AS `max_total_memory`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen` from `performance_schema`.`events_statements_summary_by_digest` order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statements_with_errors_or_warnings`
--

/*!50001 DROP VIEW IF EXISTS `statements_with_errors_or_warnings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statements_with_errors_or_warnings` (`query`,`db`,`exec_count`,`errors`,`error_pct`,`warnings`,`warning_pct`,`first_seen`,`last_seen`,`digest`) AS select `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `errors`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `error_pct`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warnings`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `warning_pct`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where ((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` > 0)) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statements_with_full_table_scans`
--

/*!50001 DROP VIEW IF EXISTS `statements_with_full_table_scans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statements_with_full_table_scans` (`query`,`db`,`exec_count`,`total_latency`,`no_index_used_count`,`no_good_index_used_count`,`no_index_used_pct`,`rows_sent`,`rows_examined`,`rows_sent_avg`,`rows_examined_avg`,`first_seen`,`last_seen`,`digest`) AS select `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` AS `no_index_used_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` AS `no_good_index_used_count`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) AS `no_index_used_pct`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_sent_avg`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_examined_avg`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0)) and (not((`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` like 'SHOW%')))) order by round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) desc,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statements_with_runtimes_in_95th_percentile`
--

/*!50001 DROP VIEW IF EXISTS `statements_with_runtimes_in_95th_percentile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statements_with_runtimes_in_95th_percentile` (`query`,`db`,`full_scan`,`exec_count`,`err_count`,`warn_count`,`total_latency`,`max_latency`,`avg_latency`,`rows_sent`,`rows_sent_avg`,`rows_examined`,`rows_examined_avg`,`first_seen`,`last_seen`,`digest`) AS select `sys`.`format_statement`(`stmts`.`DIGEST_TEXT`) AS `query`,`stmts`.`SCHEMA_NAME` AS `db`,if(((`stmts`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`stmts`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,`stmts`.`COUNT_STAR` AS `exec_count`,`stmts`.`SUM_ERRORS` AS `err_count`,`stmts`.`SUM_WARNINGS` AS `warn_count`,format_pico_time(`stmts`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`stmts`.`MAX_TIMER_WAIT`) AS `max_latency`,format_pico_time(`stmts`.`AVG_TIMER_WAIT`) AS `avg_latency`,`stmts`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`stmts`.`SUM_ROWS_SENT` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,`stmts`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`stmts`.`SUM_ROWS_EXAMINED` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,`stmts`.`FIRST_SEEN` AS `first_seen`,`stmts`.`LAST_SEEN` AS `last_seen`,`stmts`.`DIGEST` AS `digest` from (`performance_schema`.`events_statements_summary_by_digest` `stmts` join `x$ps_digest_95th_percentile_by_avg_us` `top_percentile` on((round((`stmts`.`AVG_TIMER_WAIT` / 1000000),0) >= `top_percentile`.`avg_us`))) order by `stmts`.`AVG_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statements_with_sorting`
--

/*!50001 DROP VIEW IF EXISTS `statements_with_sorting`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statements_with_sorting` (`query`,`db`,`exec_count`,`total_latency`,`sort_merge_passes`,`avg_sort_merges`,`sorts_using_scans`,`sort_using_range`,`rows_sorted`,`avg_rows_sorted`,`first_seen`,`last_seen`,`digest`) AS select `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_sort_merges`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_SCAN` AS `sorts_using_scans`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_RANGE` AS `sort_using_range`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_rows_sorted`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `statements_with_temp_tables`
--

/*!50001 DROP VIEW IF EXISTS `statements_with_temp_tables`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `statements_with_temp_tables` (`query`,`db`,`exec_count`,`total_latency`,`memory_tmp_tables`,`disk_tmp_tables`,`avg_tmp_tables_per_query`,`tmp_tables_to_disk_pct`,`first_seen`,`last_seen`,`digest`) AS select `sys`.`format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,format_pico_time(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `memory_tmp_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `disk_tmp_tables`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_tmp_tables_per_query`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES`,0)),0) * 100),0) AS `tmp_tables_to_disk_pct`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary`
--

/*!50001 DROP VIEW IF EXISTS `user_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary` (`user`,`statements`,`statement_latency`,`statement_avg_latency`,`table_scans`,`file_ios`,`file_io_latency`,`current_connections`,`total_connections`,`unique_hosts`,`current_memory`,`total_memory_allocated`) AS select if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) AS `user`,sum(`stmt`.`total`) AS `statements`,format_pico_time(sum(`stmt`.`total_latency`)) AS `statement_latency`,format_pico_time(ifnull((sum(`stmt`.`total_latency`) / nullif(sum(`stmt`.`total`),0)),0)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,format_pico_time(sum(`io`.`io_latency`)) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`HOST`) AS `unique_hosts`,format_bytes(sum(`mem`.`current_allocated`)) AS `current_memory`,format_bytes(sum(`mem`.`total_allocated`)) AS `total_memory_allocated` from (((`performance_schema`.`accounts` left join `x$user_summary_by_statement_latency` `stmt` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `stmt`.`user`))) left join `x$user_summary_by_file_io` `io` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `io`.`user`))) left join `x$memory_by_user_by_current_bytes` `mem` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `mem`.`user`))) group by if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) order by sum(`stmt`.`total_latency`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary_by_file_io`
--

/*!50001 DROP VIEW IF EXISTS `user_summary_by_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary_by_file_io` (`user`,`ios`,`io_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR`) AS `ios`,format_pico_time(sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`)) AS `io_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary_by_file_io_type`
--

/*!50001 DROP VIEW IF EXISTS `user_summary_by_file_io_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary_by_file_io_type` (`user`,`event_name`,`total`,`latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` > 0)) order by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary_by_stages`
--

/*!50001 DROP VIEW IF EXISTS `user_summary_by_stages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary_by_stages` (`user`,`event_name`,`total`,`total_latency`,`avg_latency`) AS select if((`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency` from `performance_schema`.`events_stages_summary_by_user_by_event_name` where (`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary_by_statement_latency`
--

/*!50001 DROP VIEW IF EXISTS `user_summary_by_statement_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary_by_statement_latency` (`user`,`total`,`total_latency`,`max_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR`) AS `total`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`)) AS `lock_latency`,format_pico_time(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_CPU_TIME`)) AS `cpu_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` group by if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_summary_by_statement_type`
--

/*!50001 DROP VIEW IF EXISTS `user_summary_by_statement_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `user_summary_by_statement_type` (`user`,`statement`,`total`,`total_latency`,`max_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,substring_index(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,format_pico_time(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_CPU_TIME`) AS `cpu_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` where (`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `version`
--

/*!50001 DROP VIEW IF EXISTS `version`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `version` (`sys_version`,`mysql_version`) AS select '2.1.3' AS `sys_version`,version() AS `mysql_version` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wait_classes_global_by_avg_latency`
--

/*!50001 DROP VIEW IF EXISTS `wait_classes_global_by_avg_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `wait_classes_global_by_avg_latency` (`event_class`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`) AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,format_pico_time(cast(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) as unsigned)) AS `total_latency`,format_pico_time(min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,format_pico_time(ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0)) AS `avg_latency`,format_pico_time(cast(max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) as unsigned)) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by `event_class` order by ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `wait_classes_global_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `wait_classes_global_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `wait_classes_global_by_latency` (`event_class`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`) AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,format_pico_time(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,format_pico_time(min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,format_pico_time(ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0)) AS `avg_latency`,format_pico_time(max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) order by sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `waits_by_host_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `waits_by_host_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `waits_by_host_by_latency` (`host`,`event`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `waits_by_user_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `waits_by_user_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `waits_by_user_by_latency` (`user`,`event`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is not null) and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `waits_global_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `waits_global_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `waits_global_by_latency` (`events`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select `performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR` AS `total`,format_pico_time(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,format_pico_time(`performance_schema`.`events_waits_summary_global_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,format_pico_time(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by `performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary` (`host`,`statements`,`statement_latency`,`statement_avg_latency`,`table_scans`,`file_ios`,`file_io_latency`,`current_connections`,`total_connections`,`unique_users`,`current_memory`,`total_memory_allocated`) AS select if((`performance_schema`.`accounts`.`HOST` is null),'background',`performance_schema`.`accounts`.`HOST`) AS `host`,sum(`stmt`.`total`) AS `statements`,sum(`stmt`.`total_latency`) AS `statement_latency`,(sum(`stmt`.`total_latency`) / sum(`stmt`.`total`)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,sum(`io`.`io_latency`) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`USER`) AS `unique_users`,sum(`mem`.`current_allocated`) AS `current_memory`,sum(`mem`.`total_allocated`) AS `total_memory_allocated` from (((`performance_schema`.`accounts` join `x$host_summary_by_statement_latency` `stmt` on((`performance_schema`.`accounts`.`HOST` = `stmt`.`host`))) join `x$host_summary_by_file_io` `io` on((`performance_schema`.`accounts`.`HOST` = `io`.`host`))) join `x$memory_by_host_by_current_bytes` `mem` on((`performance_schema`.`accounts`.`HOST` = `mem`.`host`))) group by if((`performance_schema`.`accounts`.`HOST` is null),'background',`performance_schema`.`accounts`.`HOST`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary_by_file_io`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary_by_file_io` (`host`,`ios`,`io_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR`) AS `ios`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `io_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary_by_file_io_type`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_file_io_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary_by_file_io_type` (`host`,`event_name`,`total`,`total_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` > 0)) order by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary_by_stages`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_stages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary_by_stages` (`host`,`event_name`,`total`,`total_latency`,`avg_latency`) AS select if((`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency` from `performance_schema`.`events_stages_summary_by_host_by_event_name` where (`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary_by_statement_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_statement_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary_by_statement_latency` (`host`,`total`,`total_latency`,`max_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,max(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_CPU_TIME`) AS `cpu_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` group by if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$host_summary_by_statement_type`
--

/*!50001 DROP VIEW IF EXISTS `x$host_summary_by_statement_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$host_summary_by_statement_type` (`host`,`statement`,`total`,`total_latency`,`max_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,substring_index(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME` AS `lock_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_CPU_TIME` AS `cpu_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` where (`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$innodb_buffer_stats_by_schema`
--

/*!50001 DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_schema`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$innodb_buffer_stats_by_schema` (`object_schema`,`allocated`,`data`,`pages`,`pages_hashed`,`pages_old`,`rows_cached`) AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) AS `allocated`,sum(`ibp`.`DATA_SIZE`) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round(ifnull((sum(`ibp`.`NUMBER_RECORDS`) / nullif(count(distinct `ibp`.`INDEX_NAME`),0)),0),0) AS `rows_cached` from `information_schema`.`INNODB_BUFFER_PAGE` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$innodb_buffer_stats_by_table`
--

/*!50001 DROP VIEW IF EXISTS `x$innodb_buffer_stats_by_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$innodb_buffer_stats_by_table` (`object_schema`,`object_name`,`allocated`,`data`,`pages`,`pages_hashed`,`pages_old`,`rows_cached`) AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,replace(substring_index(`ibp`.`TABLE_NAME`,'.',-(1)),'`','') AS `object_name`,sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) AS `allocated`,sum(`ibp`.`DATA_SIZE`) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round(ifnull((sum(`ibp`.`NUMBER_RECORDS`) / nullif(count(distinct `ibp`.`INDEX_NAME`),0)),0),0) AS `rows_cached` from `information_schema`.`INNODB_BUFFER_PAGE` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema`,`object_name` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$innodb_lock_waits`
--

/*!50001 DROP VIEW IF EXISTS `x$innodb_lock_waits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$innodb_lock_waits` (`wait_started`,`wait_age`,`wait_age_secs`,`locked_table`,`locked_table_schema`,`locked_table_name`,`locked_table_partition`,`locked_table_subpartition`,`locked_index`,`locked_type`,`waiting_trx_id`,`waiting_trx_started`,`waiting_trx_age`,`waiting_trx_rows_locked`,`waiting_trx_rows_modified`,`waiting_pid`,`waiting_query`,`waiting_lock_id`,`waiting_lock_mode`,`blocking_trx_id`,`blocking_pid`,`blocking_query`,`blocking_lock_id`,`blocking_lock_mode`,`blocking_trx_started`,`blocking_trx_age`,`blocking_trx_rows_locked`,`blocking_trx_rows_modified`,`sql_kill_blocking_query`,`sql_kill_blocking_connection`) AS select `r`.`trx_wait_started` AS `wait_started`,timediff(now(),`r`.`trx_wait_started`) AS `wait_age`,timestampdiff(SECOND,`r`.`trx_wait_started`,now()) AS `wait_age_secs`,concat(`sys`.`quote_identifier`(`rl`.`OBJECT_SCHEMA`),'.',`sys`.`quote_identifier`(`rl`.`OBJECT_NAME`)) AS `locked_table`,`rl`.`OBJECT_SCHEMA` AS `locked_table_schema`,`rl`.`OBJECT_NAME` AS `locked_table_name`,`rl`.`PARTITION_NAME` AS `locked_table_partition`,`rl`.`SUBPARTITION_NAME` AS `locked_table_subpartition`,`rl`.`INDEX_NAME` AS `locked_index`,`rl`.`LOCK_TYPE` AS `locked_type`,`r`.`trx_id` AS `waiting_trx_id`,`r`.`trx_started` AS `waiting_trx_started`,timediff(now(),`r`.`trx_started`) AS `waiting_trx_age`,`r`.`trx_rows_locked` AS `waiting_trx_rows_locked`,`r`.`trx_rows_modified` AS `waiting_trx_rows_modified`,`r`.`trx_mysql_thread_id` AS `waiting_pid`,`r`.`trx_query` AS `waiting_query`,`rl`.`ENGINE_LOCK_ID` AS `waiting_lock_id`,`rl`.`LOCK_MODE` AS `waiting_lock_mode`,`b`.`trx_id` AS `blocking_trx_id`,`b`.`trx_mysql_thread_id` AS `blocking_pid`,`b`.`trx_query` AS `blocking_query`,`bl`.`ENGINE_LOCK_ID` AS `blocking_lock_id`,`bl`.`LOCK_MODE` AS `blocking_lock_mode`,`b`.`trx_started` AS `blocking_trx_started`,timediff(now(),`b`.`trx_started`) AS `blocking_trx_age`,`b`.`trx_rows_locked` AS `blocking_trx_rows_locked`,`b`.`trx_rows_modified` AS `blocking_trx_rows_modified`,concat('KILL QUERY ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_query`,concat('KILL ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_connection` from ((((`performance_schema`.`data_lock_waits` `w` join `information_schema`.`INNODB_TRX` `b` on((`b`.`trx_id` = cast(`w`.`BLOCKING_ENGINE_TRANSACTION_ID` as char charset utf8mb4)))) join `information_schema`.`INNODB_TRX` `r` on((`r`.`trx_id` = cast(`w`.`REQUESTING_ENGINE_TRANSACTION_ID` as char charset utf8mb4)))) join `performance_schema`.`data_locks` `bl` on(((`bl`.`ENGINE_LOCK_ID` = `w`.`BLOCKING_ENGINE_LOCK_ID`) and (`bl`.`ENGINE` = `w`.`ENGINE`)))) join `performance_schema`.`data_locks` `rl` on(((`rl`.`ENGINE_LOCK_ID` = `w`.`REQUESTING_ENGINE_LOCK_ID`) and (`rl`.`ENGINE` = `w`.`ENGINE`)))) order by `r`.`trx_wait_started` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$io_by_thread_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$io_by_thread_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$io_by_thread_by_latency` (`user`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`,`thread_id`,`processlist_id`) AS select if((`performance_schema`.`threads`.`PROCESSLIST_ID` is null),substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),concat(`performance_schema`.`threads`.`PROCESSLIST_USER`,'@',convert(`performance_schema`.`threads`.`PROCESSLIST_HOST` using utf8mb4))) AS `user`,sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,min(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,avg(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,max(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` AS `thread_id`,`performance_schema`.`threads`.`PROCESSLIST_ID` AS `processlist_id` from (`performance_schema`.`events_waits_summary_by_thread_by_event_name` left join `performance_schema`.`threads` on((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) where ((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT` > 0)) group by `performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID`,`performance_schema`.`threads`.`PROCESSLIST_ID`,`user` order by sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$io_global_by_file_by_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$io_global_by_file_by_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$io_global_by_file_by_bytes` (`file`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_write`,`total`,`write_pct`) AS select `performance_schema`.`file_summary_by_instance`.`FILE_NAME` AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`,0)),0) AS `avg_read`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`,0)),0.00) AS `avg_write`,(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total`,ifnull(round((100 - ((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`),0)) * 100)),2),0.00) AS `write_pct` from `performance_schema`.`file_summary_by_instance` order by (`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$io_global_by_file_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$io_global_by_file_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$io_global_by_file_by_latency` (`file`,`total`,`total_latency`,`count_read`,`read_latency`,`count_write`,`write_latency`,`count_misc`,`misc_latency`) AS select `performance_schema`.`file_summary_by_instance`.`FILE_NAME` AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_STAR` AS `total`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ` AS `read_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE` AS `write_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_MISC` AS `count_misc`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC` AS `misc_latency` from `performance_schema`.`file_summary_by_instance` order by `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$io_global_by_wait_by_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$io_global_by_wait_by_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$io_global_by_wait_by_bytes` (`event_name`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_written`,`total_requested`) AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`file_summary_by_event_name`.`MIN_TIMER_WAIT` AS `min_latency`,`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0) AS `avg_written`,(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_requested` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by (`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$io_global_by_wait_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$io_global_by_wait_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$io_global_by_wait_by_latency` (`event_name`,`total`,`total_latency`,`avg_latency`,`max_latency`,`read_latency`,`write_latency`,`misc_latency`,`count_read`,`total_read`,`avg_read`,`count_write`,`total_written`,`avg_written`) AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_READ` AS `read_latency`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WRITE` AS `write_latency`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_MISC` AS `misc_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0) AS `avg_written` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$latest_file_io`
--

/*!50001 DROP VIEW IF EXISTS `x$latest_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$latest_file_io` (`thread`,`file`,`latency`,`operation`,`requested`) AS select if((`information_schema`.`processlist`.`ID` is null),concat(substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),':',`performance_schema`.`events_waits_history_long`.`THREAD_ID`),convert(concat(`information_schema`.`processlist`.`USER`,'@',`information_schema`.`processlist`.`HOST`,':',`information_schema`.`processlist`.`ID`) using utf8mb4)) AS `thread`,`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` AS `file`,`performance_schema`.`events_waits_history_long`.`TIMER_WAIT` AS `latency`,`performance_schema`.`events_waits_history_long`.`OPERATION` AS `operation`,`performance_schema`.`events_waits_history_long`.`NUMBER_OF_BYTES` AS `requested` from ((`performance_schema`.`events_waits_history_long` join `performance_schema`.`threads` on((`performance_schema`.`events_waits_history_long`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) left join `information_schema`.`PROCESSLIST` on((`performance_schema`.`threads`.`PROCESSLIST_ID` = `information_schema`.`processlist`.`ID`))) where ((`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` is not null) and (`performance_schema`.`events_waits_history_long`.`EVENT_NAME` like 'wait/io/file/%')) order by `performance_schema`.`events_waits_history_long`.`TIMER_START` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$memory_by_host_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$memory_by_host_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$memory_by_host_by_current_bytes` (`host`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select if((`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated` from `performance_schema`.`memory_summary_by_host_by_event_name` group by if((`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$memory_by_thread_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$memory_by_thread_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$memory_by_thread_by_current_bytes` (`thread_id`,`user`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select `t`.`THREAD_ID` AS `thread_id`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',convert(`t`.`PROCESSLIST_HOST` using utf8mb4)),replace(`t`.`NAME`,'thread/','')) AS `user`,sum(`mt`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`mt`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`mt`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated` from (`performance_schema`.`memory_summary_by_thread_by_event_name` `mt` join `performance_schema`.`threads` `t` on((`mt`.`THREAD_ID` = `t`.`THREAD_ID`))) group by `t`.`THREAD_ID`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',convert(`t`.`PROCESSLIST_HOST` using utf8mb4)),replace(`t`.`NAME`,'thread/','')) order by sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$memory_by_user_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$memory_by_user_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$memory_by_user_by_current_bytes` (`user`,`current_count_used`,`current_allocated`,`current_avg_alloc`,`current_max_alloc`,`total_allocated`) AS select if((`performance_schema`.`memory_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated` from `performance_schema`.`memory_summary_by_user_by_event_name` group by if((`performance_schema`.`memory_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$memory_global_by_current_bytes`
--

/*!50001 DROP VIEW IF EXISTS `x$memory_global_by_current_bytes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$memory_global_by_current_bytes` (`event_name`,`current_count`,`current_alloc`,`current_avg_alloc`,`high_count`,`high_alloc`,`high_avg_alloc`) AS select `performance_schema`.`memory_summary_global_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED` AS `current_count`,`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` AS `current_alloc`,ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED`,0)),0) AS `current_avg_alloc`,`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED` AS `high_count`,`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` AS `high_alloc`,ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED`,0)),0) AS `high_avg_alloc` from `performance_schema`.`memory_summary_global_by_event_name` where (`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` > 0) order by `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$memory_global_total`
--

/*!50001 DROP VIEW IF EXISTS `x$memory_global_total`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$memory_global_total` (`total_allocated`) AS select sum(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `total_allocated` from `performance_schema`.`memory_summary_global_by_event_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$processlist`
--

/*!50001 DROP VIEW IF EXISTS `x$processlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$processlist` (`thd_id`,`conn_id`,`user`,`db`,`command`,`state`,`time`,`current_statement`,`execution_engine`,`statement_latency`,`progress`,`lock_latency`,`cpu_latency`,`rows_examined`,`rows_sent`,`rows_affected`,`tmp_tables`,`tmp_disk_tables`,`full_scan`,`last_statement`,`last_statement_latency`,`current_memory`,`last_wait`,`last_wait_latency`,`source`,`trx_latency`,`trx_state`,`trx_autocommit`,`pid`,`program_name`) AS select `pps`.`THREAD_ID` AS `thd_id`,`pps`.`PROCESSLIST_ID` AS `conn_id`,if((`pps`.`NAME` in ('thread/sql/one_connection','thread/thread_pool/tp_one_connection')),concat(`pps`.`PROCESSLIST_USER`,'@',convert(`pps`.`PROCESSLIST_HOST` using utf8mb4)),replace(`pps`.`NAME`,'thread/','')) AS `user`,`pps`.`PROCESSLIST_DB` AS `db`,`pps`.`PROCESSLIST_COMMAND` AS `command`,`pps`.`PROCESSLIST_STATE` AS `state`,`pps`.`PROCESSLIST_TIME` AS `time`,`pps`.`PROCESSLIST_INFO` AS `current_statement`,`pps`.`EXECUTION_ENGINE` AS `execution_engine`,if((`esc`.`END_EVENT_ID` is null),`esc`.`TIMER_WAIT`,NULL) AS `statement_latency`,if((`esc`.`END_EVENT_ID` is null),round((100 * (`estc`.`WORK_COMPLETED` / `estc`.`WORK_ESTIMATED`)),2),NULL) AS `progress`,`esc`.`LOCK_TIME` AS `lock_latency`,`esc`.`CPU_TIME` AS `cpu_latency`,`esc`.`ROWS_EXAMINED` AS `rows_examined`,`esc`.`ROWS_SENT` AS `rows_sent`,`esc`.`ROWS_AFFECTED` AS `rows_affected`,`esc`.`CREATED_TMP_TABLES` AS `tmp_tables`,`esc`.`CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,if(((`esc`.`NO_GOOD_INDEX_USED` > 0) or (`esc`.`NO_INDEX_USED` > 0)),'YES','NO') AS `full_scan`,if((`esc`.`END_EVENT_ID` is not null),`esc`.`SQL_TEXT`,NULL) AS `last_statement`,if((`esc`.`END_EVENT_ID` is not null),`esc`.`TIMER_WAIT`,NULL) AS `last_statement_latency`,`mem`.`current_allocated` AS `current_memory`,`ewc`.`EVENT_NAME` AS `last_wait`,if(((`ewc`.`END_EVENT_ID` is null) and (`ewc`.`EVENT_NAME` is not null)),'Still Waiting',`ewc`.`TIMER_WAIT`) AS `last_wait_latency`,`ewc`.`SOURCE` AS `source`,`etc`.`TIMER_WAIT` AS `trx_latency`,`etc`.`STATE` AS `trx_state`,`etc`.`AUTOCOMMIT` AS `trx_autocommit`,`conattr_pid`.`ATTR_VALUE` AS `pid`,`conattr_progname`.`ATTR_VALUE` AS `program_name` from (((((((`performance_schema`.`threads` `pps` left join `performance_schema`.`events_waits_current` `ewc` on((`pps`.`THREAD_ID` = `ewc`.`THREAD_ID`))) left join `performance_schema`.`events_stages_current` `estc` on((`pps`.`THREAD_ID` = `estc`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `esc` on((`pps`.`THREAD_ID` = `esc`.`THREAD_ID`))) left join `performance_schema`.`events_transactions_current` `etc` on((`pps`.`THREAD_ID` = `etc`.`THREAD_ID`))) left join `x$memory_by_thread_by_current_bytes` `mem` on((`pps`.`THREAD_ID` = `mem`.`thread_id`))) left join `performance_schema`.`session_connect_attrs` `conattr_pid` on(((`conattr_pid`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_pid`.`ATTR_NAME` = '_pid')))) left join `performance_schema`.`session_connect_attrs` `conattr_progname` on(((`conattr_progname`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_progname`.`ATTR_NAME` = 'program_name')))) order by `pps`.`PROCESSLIST_TIME` desc,`last_wait_latency` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$ps_digest_95th_percentile_by_avg_us`
--

/*!50001 DROP VIEW IF EXISTS `x$ps_digest_95th_percentile_by_avg_us`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$ps_digest_95th_percentile_by_avg_us` (`avg_us`,`percentile`) AS select `s2`.`avg_us` AS `avg_us`,ifnull((sum(`s1`.`cnt`) / nullif((select count(0) from `performance_schema`.`events_statements_summary_by_digest`),0)),0) AS `percentile` from (`x$ps_digest_avg_latency_distribution` `s1` join `x$ps_digest_avg_latency_distribution` `s2` on((`s1`.`avg_us` <= `s2`.`avg_us`))) group by `s2`.`avg_us` having (ifnull((sum(`s1`.`cnt`) / nullif((select count(0) from `performance_schema`.`events_statements_summary_by_digest`),0)),0) > 0.95) order by `percentile` limit 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$ps_digest_avg_latency_distribution`
--

/*!50001 DROP VIEW IF EXISTS `x$ps_digest_avg_latency_distribution`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$ps_digest_avg_latency_distribution` (`cnt`,`avg_us`) AS select count(0) AS `cnt`,round((`performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT` / 1000000),0) AS `avg_us` from `performance_schema`.`events_statements_summary_by_digest` group by `avg_us` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$ps_schema_table_statistics_io`
--

/*!50001 DROP VIEW IF EXISTS `x$ps_schema_table_statistics_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$ps_schema_table_statistics_io` (`table_schema`,`table_name`,`count_read`,`sum_number_of_bytes_read`,`sum_timer_read`,`count_write`,`sum_number_of_bytes_write`,`sum_timer_write`,`count_misc`,`sum_timer_misc`) AS select `extract_schema_from_file_name`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `table_schema`,`extract_table_from_file_name`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `table_name`,sum(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`) AS `count_read`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ`) AS `sum_number_of_bytes_read`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ`) AS `sum_timer_read`,sum(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`) AS `count_write`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `sum_number_of_bytes_write`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE`) AS `sum_timer_write`,sum(`performance_schema`.`file_summary_by_instance`.`COUNT_MISC`) AS `count_misc`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC`) AS `sum_timer_misc` from `performance_schema`.`file_summary_by_instance` group by `table_schema`,`table_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_flattened_keys`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_flattened_keys`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_flattened_keys` (`table_schema`,`table_name`,`index_name`,`non_unique`,`subpart_exists`,`index_columns`) AS select `information_schema`.`statistics`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`statistics`.`TABLE_NAME` AS `TABLE_NAME`,`information_schema`.`statistics`.`INDEX_NAME` AS `INDEX_NAME`,max(`information_schema`.`statistics`.`NON_UNIQUE`) AS `non_unique`,max(if((`information_schema`.`statistics`.`SUB_PART` is null),0,1)) AS `subpart_exists`,group_concat(`information_schema`.`statistics`.`COLUMN_NAME` order by `information_schema`.`statistics`.`SEQ_IN_INDEX` ASC separator ',') AS `index_columns` from `information_schema`.`STATISTICS` where ((`information_schema`.`statistics`.`INDEX_TYPE` = 'BTREE') and (`information_schema`.`statistics`.`TABLE_SCHEMA` not in ('mysql','sys','INFORMATION_SCHEMA','PERFORMANCE_SCHEMA'))) group by `information_schema`.`statistics`.`TABLE_SCHEMA`,`information_schema`.`statistics`.`TABLE_NAME`,`information_schema`.`statistics`.`INDEX_NAME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_index_statistics`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_index_statistics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_index_statistics` (`table_schema`,`table_name`,`index_name`,`rows_selected`,`select_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`) AS select `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `table_schema`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `table_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` AS `index_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_FETCH` AS `rows_selected`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_FETCH` AS `select_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_INSERT` AS `rows_inserted`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_INSERT` AS `insert_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_UPDATE` AS `rows_updated`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_UPDATE` AS `update_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_DELETE` AS `rows_deleted`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_DELETE` AS `delete_latency` from `performance_schema`.`table_io_waits_summary_by_index_usage` where (`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` is not null) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_table_lock_waits`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_table_lock_waits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_table_lock_waits` (`object_schema`,`object_name`,`waiting_thread_id`,`waiting_pid`,`waiting_account`,`waiting_lock_type`,`waiting_lock_duration`,`waiting_query`,`waiting_query_secs`,`waiting_query_rows_affected`,`waiting_query_rows_examined`,`blocking_thread_id`,`blocking_pid`,`blocking_account`,`blocking_lock_type`,`blocking_lock_duration`,`sql_kill_blocking_query`,`sql_kill_blocking_connection`) AS select `g`.`OBJECT_SCHEMA` AS `object_schema`,`g`.`OBJECT_NAME` AS `object_name`,`pt`.`THREAD_ID` AS `waiting_thread_id`,`pt`.`PROCESSLIST_ID` AS `waiting_pid`,`sys`.`ps_thread_account`(`p`.`OWNER_THREAD_ID`) AS `waiting_account`,`p`.`LOCK_TYPE` AS `waiting_lock_type`,`p`.`LOCK_DURATION` AS `waiting_lock_duration`,`pt`.`PROCESSLIST_INFO` AS `waiting_query`,`pt`.`PROCESSLIST_TIME` AS `waiting_query_secs`,`ps`.`ROWS_AFFECTED` AS `waiting_query_rows_affected`,`ps`.`ROWS_EXAMINED` AS `waiting_query_rows_examined`,`gt`.`THREAD_ID` AS `blocking_thread_id`,`gt`.`PROCESSLIST_ID` AS `blocking_pid`,`sys`.`ps_thread_account`(`g`.`OWNER_THREAD_ID`) AS `blocking_account`,`g`.`LOCK_TYPE` AS `blocking_lock_type`,`g`.`LOCK_DURATION` AS `blocking_lock_duration`,concat('KILL QUERY ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_query`,concat('KILL ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_connection` from (((((`performance_schema`.`metadata_locks` `g` join `performance_schema`.`metadata_locks` `p` on(((`g`.`OBJECT_TYPE` = `p`.`OBJECT_TYPE`) and (`g`.`OBJECT_SCHEMA` = `p`.`OBJECT_SCHEMA`) and (`g`.`OBJECT_NAME` = `p`.`OBJECT_NAME`) and (`g`.`LOCK_STATUS` = 'GRANTED') and (`p`.`LOCK_STATUS` = 'PENDING')))) join `performance_schema`.`threads` `gt` on((`g`.`OWNER_THREAD_ID` = `gt`.`THREAD_ID`))) join `performance_schema`.`threads` `pt` on((`p`.`OWNER_THREAD_ID` = `pt`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `gs` on((`g`.`OWNER_THREAD_ID` = `gs`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `ps` on((`p`.`OWNER_THREAD_ID` = `ps`.`THREAD_ID`))) where (`g`.`OBJECT_TYPE` = 'TABLE') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_table_statistics`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_table_statistics`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_table_statistics` (`table_schema`,`table_name`,`total_latency`,`rows_fetched`,`fetch_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`,`io_read_requests`,`io_read`,`io_read_latency`,`io_write_requests`,`io_write`,`io_write_latency`,`io_misc_requests`,`io_misc_latency`) AS select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,`pst`.`SUM_TIMER_WAIT` AS `total_latency`,`pst`.`COUNT_FETCH` AS `rows_fetched`,`pst`.`SUM_TIMER_FETCH` AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,`pst`.`SUM_TIMER_INSERT` AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,`pst`.`SUM_TIMER_UPDATE` AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,`pst`.`SUM_TIMER_DELETE` AS `delete_latency`,`fsbi`.`count_read` AS `io_read_requests`,`fsbi`.`sum_number_of_bytes_read` AS `io_read`,`fsbi`.`sum_timer_read` AS `io_read_latency`,`fsbi`.`count_write` AS `io_write_requests`,`fsbi`.`sum_number_of_bytes_write` AS `io_write`,`fsbi`.`sum_timer_write` AS `io_write_latency`,`fsbi`.`count_misc` AS `io_misc_requests`,`fsbi`.`sum_timer_misc` AS `io_misc_latency` from (`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_table_statistics_with_buffer`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_table_statistics_with_buffer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_table_statistics_with_buffer` (`table_schema`,`table_name`,`rows_fetched`,`fetch_latency`,`rows_inserted`,`insert_latency`,`rows_updated`,`update_latency`,`rows_deleted`,`delete_latency`,`io_read_requests`,`io_read`,`io_read_latency`,`io_write_requests`,`io_write`,`io_write_latency`,`io_misc_requests`,`io_misc_latency`,`innodb_buffer_allocated`,`innodb_buffer_data`,`innodb_buffer_free`,`innodb_buffer_pages`,`innodb_buffer_pages_hashed`,`innodb_buffer_pages_old`,`innodb_buffer_rows_cached`) AS select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,`pst`.`COUNT_FETCH` AS `rows_fetched`,`pst`.`SUM_TIMER_FETCH` AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,`pst`.`SUM_TIMER_INSERT` AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,`pst`.`SUM_TIMER_UPDATE` AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,`pst`.`SUM_TIMER_DELETE` AS `delete_latency`,`fsbi`.`count_read` AS `io_read_requests`,`fsbi`.`sum_number_of_bytes_read` AS `io_read`,`fsbi`.`sum_timer_read` AS `io_read_latency`,`fsbi`.`count_write` AS `io_write_requests`,`fsbi`.`sum_number_of_bytes_write` AS `io_write`,`fsbi`.`sum_timer_write` AS `io_write_latency`,`fsbi`.`count_misc` AS `io_misc_requests`,`fsbi`.`sum_timer_misc` AS `io_misc_latency`,`ibp`.`allocated` AS `innodb_buffer_allocated`,`ibp`.`data` AS `innodb_buffer_data`,(`ibp`.`allocated` - `ibp`.`data`) AS `innodb_buffer_free`,`ibp`.`pages` AS `innodb_buffer_pages`,`ibp`.`pages_hashed` AS `innodb_buffer_pages_hashed`,`ibp`.`pages_old` AS `innodb_buffer_pages_old`,`ibp`.`rows_cached` AS `innodb_buffer_rows_cached` from ((`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) left join `x$innodb_buffer_stats_by_table` `ibp` on(((`pst`.`OBJECT_SCHEMA` = `ibp`.`object_schema`) and (`pst`.`OBJECT_NAME` = `ibp`.`object_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$schema_tables_with_full_table_scans`
--

/*!50001 DROP VIEW IF EXISTS `x$schema_tables_with_full_table_scans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$schema_tables_with_full_table_scans` (`object_schema`,`object_name`,`rows_full_scanned`,`latency`) AS select `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `object_schema`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `object_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` AS `rows_full_scanned`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT` AS `latency` from `performance_schema`.`table_io_waits_summary_by_index_usage` where ((`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` is null) and (`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` > 0)) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$session`
--

/*!50001 DROP VIEW IF EXISTS `x$session`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$session` AS select `x$processlist`.`thd_id` AS `thd_id`,`x$processlist`.`conn_id` AS `conn_id`,`x$processlist`.`user` AS `user`,`x$processlist`.`db` AS `db`,`x$processlist`.`command` AS `command`,`x$processlist`.`state` AS `state`,`x$processlist`.`time` AS `time`,`x$processlist`.`current_statement` AS `current_statement`,`x$processlist`.`execution_engine` AS `execution_engine`,`x$processlist`.`statement_latency` AS `statement_latency`,`x$processlist`.`progress` AS `progress`,`x$processlist`.`lock_latency` AS `lock_latency`,`x$processlist`.`cpu_latency` AS `cpu_latency`,`x$processlist`.`rows_examined` AS `rows_examined`,`x$processlist`.`rows_sent` AS `rows_sent`,`x$processlist`.`rows_affected` AS `rows_affected`,`x$processlist`.`tmp_tables` AS `tmp_tables`,`x$processlist`.`tmp_disk_tables` AS `tmp_disk_tables`,`x$processlist`.`full_scan` AS `full_scan`,`x$processlist`.`last_statement` AS `last_statement`,`x$processlist`.`last_statement_latency` AS `last_statement_latency`,`x$processlist`.`current_memory` AS `current_memory`,`x$processlist`.`last_wait` AS `last_wait`,`x$processlist`.`last_wait_latency` AS `last_wait_latency`,`x$processlist`.`source` AS `source`,`x$processlist`.`trx_latency` AS `trx_latency`,`x$processlist`.`trx_state` AS `trx_state`,`x$processlist`.`trx_autocommit` AS `trx_autocommit`,`x$processlist`.`pid` AS `pid`,`x$processlist`.`program_name` AS `program_name` from `x$processlist` where ((`x$processlist`.`conn_id` is not null) and (`x$processlist`.`command` <> 'Daemon')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statement_analysis`
--

/*!50001 DROP VIEW IF EXISTS `x$statement_analysis`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statement_analysis` (`query`,`db`,`full_scan`,`exec_count`,`exec_secondary_count`,`err_count`,`warn_count`,`total_latency`,`max_latency`,`avg_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_sent_avg`,`rows_examined`,`rows_examined_avg`,`rows_affected`,`rows_affected_avg`,`tmp_tables`,`tmp_disk_tables`,`rows_sorted`,`sort_merge_passes`,`max_controlled_memory`,`max_total_memory`,`digest`,`first_seen`,`last_seen`) AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,if(((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_SECONDARY` AS `exec_secondary_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `err_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warn_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_LOCK_TIME` AS `lock_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CPU_TIME` AS `cpu_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` AS `rows_affected`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_affected_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `tmp_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,`performance_schema`.`events_statements_summary_by_digest`.`MAX_CONTROLLED_MEMORY` AS `max_controlled_memory`,`performance_schema`.`events_statements_summary_by_digest`.`MAX_TOTAL_MEMORY` AS `max_total_memory`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen` from `performance_schema`.`events_statements_summary_by_digest` order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statements_with_errors_or_warnings`
--

/*!50001 DROP VIEW IF EXISTS `x$statements_with_errors_or_warnings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statements_with_errors_or_warnings` (`query`,`db`,`exec_count`,`errors`,`error_pct`,`warnings`,`warning_pct`,`first_seen`,`last_seen`,`digest`) AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `errors`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `error_pct`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warnings`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `warning_pct`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where ((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` > 0)) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statements_with_full_table_scans`
--

/*!50001 DROP VIEW IF EXISTS `x$statements_with_full_table_scans`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statements_with_full_table_scans` (`query`,`db`,`exec_count`,`total_latency`,`no_index_used_count`,`no_good_index_used_count`,`no_index_used_pct`,`rows_sent`,`rows_examined`,`rows_sent_avg`,`rows_examined_avg`,`first_seen`,`last_seen`,`digest`) AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` AS `no_index_used_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` AS `no_good_index_used_count`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) AS `no_index_used_pct`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_sent_avg`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_examined_avg`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0)) and (not((`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` like 'SHOW%')))) order by round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statements_with_runtimes_in_95th_percentile`
--

/*!50001 DROP VIEW IF EXISTS `x$statements_with_runtimes_in_95th_percentile`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statements_with_runtimes_in_95th_percentile` (`query`,`db`,`full_scan`,`exec_count`,`err_count`,`warn_count`,`total_latency`,`max_latency`,`avg_latency`,`rows_sent`,`rows_sent_avg`,`rows_examined`,`rows_examined_avg`,`first_seen`,`last_seen`,`digest`) AS select `stmts`.`DIGEST_TEXT` AS `query`,`stmts`.`SCHEMA_NAME` AS `db`,if(((`stmts`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`stmts`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,`stmts`.`COUNT_STAR` AS `exec_count`,`stmts`.`SUM_ERRORS` AS `err_count`,`stmts`.`SUM_WARNINGS` AS `warn_count`,`stmts`.`SUM_TIMER_WAIT` AS `total_latency`,`stmts`.`MAX_TIMER_WAIT` AS `max_latency`,`stmts`.`AVG_TIMER_WAIT` AS `avg_latency`,`stmts`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`stmts`.`SUM_ROWS_SENT` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,`stmts`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`stmts`.`SUM_ROWS_EXAMINED` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,`stmts`.`FIRST_SEEN` AS `first_seen`,`stmts`.`LAST_SEEN` AS `last_seen`,`stmts`.`DIGEST` AS `digest` from (`performance_schema`.`events_statements_summary_by_digest` `stmts` join `x$ps_digest_95th_percentile_by_avg_us` `top_percentile` on((round((`stmts`.`AVG_TIMER_WAIT` / 1000000),0) >= `top_percentile`.`avg_us`))) order by `stmts`.`AVG_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statements_with_sorting`
--

/*!50001 DROP VIEW IF EXISTS `x$statements_with_sorting`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statements_with_sorting` (`query`,`db`,`exec_count`,`total_latency`,`sort_merge_passes`,`avg_sort_merges`,`sorts_using_scans`,`sort_using_range`,`rows_sorted`,`avg_rows_sorted`,`first_seen`,`last_seen`,`digest`) AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_sort_merges`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_SCAN` AS `sorts_using_scans`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_RANGE` AS `sort_using_range`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_rows_sorted`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$statements_with_temp_tables`
--

/*!50001 DROP VIEW IF EXISTS `x$statements_with_temp_tables`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$statements_with_temp_tables` (`query`,`db`,`exec_count`,`total_latency`,`memory_tmp_tables`,`disk_tmp_tables`,`avg_tmp_tables_per_query`,`tmp_tables_to_disk_pct`,`first_seen`,`last_seen`,`digest`) AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `memory_tmp_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `disk_tmp_tables`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_tmp_tables_per_query`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES`,0)),0) * 100),0) AS `tmp_tables_to_disk_pct`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary` (`user`,`statements`,`statement_latency`,`statement_avg_latency`,`table_scans`,`file_ios`,`file_io_latency`,`current_connections`,`total_connections`,`unique_hosts`,`current_memory`,`total_memory_allocated`) AS select if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) AS `user`,sum(`stmt`.`total`) AS `statements`,sum(`stmt`.`total_latency`) AS `statement_latency`,ifnull((sum(`stmt`.`total_latency`) / nullif(sum(`stmt`.`total`),0)),0) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,sum(`io`.`io_latency`) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`HOST`) AS `unique_hosts`,sum(`mem`.`current_allocated`) AS `current_memory`,sum(`mem`.`total_allocated`) AS `total_memory_allocated` from (((`performance_schema`.`accounts` left join `x$user_summary_by_statement_latency` `stmt` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `stmt`.`user`))) left join `x$user_summary_by_file_io` `io` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `io`.`user`))) left join `x$memory_by_user_by_current_bytes` `mem` on((if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) = `mem`.`user`))) group by if((`performance_schema`.`accounts`.`USER` is null),'background',`performance_schema`.`accounts`.`USER`) order by sum(`stmt`.`total_latency`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary_by_file_io`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_file_io`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary_by_file_io` (`user`,`ios`,`io_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR`) AS `ios`,sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `io_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary_by_file_io_type`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_file_io_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary_by_file_io_type` (`user`,`event_name`,`total`,`latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `latency`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` > 0)) order by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary_by_stages`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_stages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary_by_stages` (`user`,`event_name`,`total`,`total_latency`,`avg_latency`) AS select if((`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency` from `performance_schema`.`events_stages_summary_by_user_by_event_name` where (`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary_by_statement_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_statement_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary_by_statement_latency` (`user`,`total`,`total_latency`,`max_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_CPU_TIME`) AS `cpu_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` group by if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$user_summary_by_statement_type`
--

/*!50001 DROP VIEW IF EXISTS `x$user_summary_by_statement_type`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$user_summary_by_statement_type` (`user`,`statement`,`total`,`total_latency`,`max_latency`,`lock_latency`,`cpu_latency`,`rows_sent`,`rows_examined`,`rows_affected`,`full_scans`) AS select if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,substring_index(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME` AS `lock_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_CPU_TIME` AS `cpu_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` where (`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if((`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$wait_classes_global_by_avg_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$wait_classes_global_by_avg_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$wait_classes_global_by_avg_latency` (`event_class`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`) AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) AS `avg_latency`,max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by `event_class` order by ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$wait_classes_global_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$wait_classes_global_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$wait_classes_global_by_latency` (`event_class`,`total`,`total_latency`,`min_latency`,`avg_latency`,`max_latency`) AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) AS `avg_latency`,max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) order by sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$waits_by_host_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$waits_by_host_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$waits_by_host_by_latency` (`host`,`event`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST` is null),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$waits_by_user_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$waits_by_user_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$waits_by_user_by_latency` (`user`,`event`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is not null) and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is null),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `x$waits_global_by_latency`
--

/*!50001 DROP VIEW IF EXISTS `x$waits_global_by_latency`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `x$waits_global_by_latency` (`events`,`total`,`total_latency`,`avg_latency`,`max_latency`) AS select `performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_waits_summary_global_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by `performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` desc */;
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

-- Dump completed on 2026-03-11 12:19:34
