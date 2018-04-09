-- MySQL dump 10.13  Distrib 5.7.21, for macos10.13 (x86_64)
--
-- Host: localhost    Database: hiring_project
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_text` varchar(512) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id_index` (`question_id`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=388 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,'Like',18),(2,'Like',19),(3,'Like',20),(4,'Like',21),(5,'Like',22),(6,'Like',23),(7,'Like',24),(8,'Like',25),(9,'Like',26),(10,'Like',27),(11,'Like',28),(12,'Like',29),(13,'Like',30),(14,'Like',31),(15,'Like',32),(16,'Like',33),(17,'Like',34),(18,'Like',35),(19,'Like',36),(20,'Like',37),(21,'Like',38),(22,'Like',39),(23,'Like',40),(24,'Like',41),(25,'Like',42),(26,'Like',43),(27,'Like',44),(28,'Like',45),(29,'Like',46),(30,'Like',47),(31,'Like',48),(32,'Like',49),(33,'Like',50),(34,'Like',51),(35,'Like',52),(36,'Like',53),(37,'Like',54),(38,'Like',55),(39,'Like',56),(40,'Like',57),(41,'Like',58),(42,'Like',59),(43,'Like',60),(44,'Like',61),(45,'Like',62),(46,'Like',63),(47,'Like',64),(48,'Like',65),(49,'Like',66),(50,'Like',67),(51,'Like',68),(52,'Like',69),(53,'Like',70),(54,'Like',71),(55,'Like',72),(56,'Like',73),(57,'Like',74),(58,'Like',75),(59,'Like',76),(60,'Like',77),(61,'Like',78),(62,'Like',79),(63,'Like',80),(64,'Like',81),(65,'Like',82),(66,'Like',83),(67,'Like',84),(68,'Like',85),(69,'Like',86),(70,'Like',87),(71,'Like',88),(72,'Like',89),(73,'Like',90),(74,'Like',91),(75,'Like',92),(76,'Like',93),(77,'Like',94),(78,'Like',95),(79,'Like',96),(80,'Like',97),(81,'Like',98),(82,'Like',99),(83,'Like',100),(84,'Like',101),(85,'Like',102),(86,'Like',103),(87,'Like',104),(88,'Like',105),(89,'Like',106),(90,'Like',107),(91,'Like',108),(92,'Like',109),(93,'Like',110),(94,'Like',111),(95,'Like',112),(96,'Like',113),(97,'Like',114),(98,'Like',115),(99,'Like',116),(100,'Like',117),(101,'Like',118),(102,'Like',119),(103,'Like',120),(104,'Like',121),(105,'Like',122),(106,'Like',123),(107,'Like',124),(108,'Like',125),(109,'Like',126),(110,'Like',127),(111,'Like',128),(112,'Like',129),(128,'Neutral',18),(129,'Neutral',19),(130,'Neutral',20),(131,'Neutral',21),(132,'Neutral',22),(133,'Neutral',23),(134,'Neutral',24),(135,'Neutral',25),(136,'Neutral',26),(137,'Neutral',27),(138,'Neutral',28),(139,'Neutral',29),(140,'Neutral',30),(141,'Neutral',31),(142,'Neutral',32),(143,'Neutral',33),(144,'Neutral',34),(145,'Neutral',35),(146,'Neutral',36),(147,'Neutral',37),(148,'Neutral',38),(149,'Neutral',39),(150,'Neutral',40),(151,'Neutral',41),(152,'Neutral',42),(153,'Neutral',43),(154,'Neutral',44),(155,'Neutral',45),(156,'Neutral',46),(157,'Neutral',47),(158,'Neutral',48),(159,'Neutral',49),(160,'Neutral',50),(161,'Neutral',51),(162,'Neutral',52),(163,'Neutral',53),(164,'Neutral',54),(165,'Neutral',55),(166,'Neutral',56),(167,'Neutral',57),(168,'Neutral',58),(169,'Neutral',59),(170,'Neutral',60),(171,'Neutral',61),(172,'Neutral',62),(173,'Neutral',63),(174,'Neutral',64),(175,'Neutral',65),(176,'Neutral',66),(177,'Neutral',67),(178,'Neutral',68),(179,'Neutral',69),(180,'Neutral',70),(181,'Neutral',71),(182,'Neutral',72),(183,'Neutral',73),(184,'Neutral',74),(185,'Neutral',75),(186,'Neutral',76),(187,'Neutral',77),(188,'Neutral',78),(189,'Neutral',79),(190,'Neutral',80),(191,'Neutral',81),(192,'Neutral',82),(193,'Neutral',83),(194,'Neutral',84),(195,'Neutral',85),(196,'Neutral',86),(197,'Neutral',87),(198,'Neutral',88),(199,'Neutral',89),(200,'Neutral',90),(201,'Neutral',91),(202,'Neutral',92),(203,'Neutral',93),(204,'Neutral',94),(205,'Neutral',95),(206,'Neutral',96),(207,'Neutral',97),(208,'Neutral',98),(209,'Neutral',99),(210,'Neutral',100),(211,'Neutral',101),(212,'Neutral',102),(213,'Neutral',103),(214,'Neutral',104),(215,'Neutral',105),(216,'Neutral',106),(217,'Neutral',107),(218,'Neutral',108),(219,'Neutral',109),(220,'Neutral',110),(221,'Neutral',111),(222,'Neutral',112),(223,'Neutral',113),(224,'Neutral',114),(225,'Neutral',115),(226,'Neutral',116),(227,'Neutral',117),(228,'Neutral',118),(229,'Neutral',119),(230,'Neutral',120),(231,'Neutral',121),(232,'Neutral',122),(233,'Neutral',123),(234,'Neutral',124),(235,'Neutral',125),(236,'Neutral',126),(237,'Neutral',127),(238,'Neutral',128),(239,'Neutral',129),(255,'Dislike',18),(256,'Dislike',19),(257,'Dislike',20),(258,'Dislike',21),(259,'Dislike',22),(260,'Dislike',23),(261,'Dislike',24),(262,'Dislike',25),(263,'Dislike',26),(264,'Dislike',27),(265,'Dislike',28),(266,'Dislike',29),(267,'Dislike',30),(268,'Dislike',31),(269,'Dislike',32),(270,'Dislike',33),(271,'Dislike',34),(272,'Dislike',35),(273,'Dislike',36),(274,'Dislike',37),(275,'Dislike',38),(276,'Dislike',39),(277,'Dislike',40),(278,'Dislike',41),(279,'Dislike',42),(280,'Dislike',43),(281,'Dislike',44),(282,'Dislike',45),(283,'Dislike',46),(284,'Dislike',47),(285,'Dislike',48),(286,'Dislike',49),(287,'Dislike',50),(288,'Dislike',51),(289,'Dislike',52),(290,'Dislike',53),(291,'Dislike',54),(292,'Dislike',55),(293,'Dislike',56),(294,'Dislike',57),(295,'Dislike',58),(296,'Dislike',59),(297,'Dislike',60),(298,'Dislike',61),(299,'Dislike',62),(300,'Dislike',63),(301,'Dislike',64),(302,'Dislike',65),(303,'Dislike',66),(304,'Dislike',67),(305,'Dislike',68),(306,'Dislike',69),(307,'Dislike',70),(308,'Dislike',71),(309,'Dislike',72),(310,'Dislike',73),(311,'Dislike',74),(312,'Dislike',75),(313,'Dislike',76),(314,'Dislike',77),(315,'Dislike',78),(316,'Dislike',79),(317,'Dislike',80),(318,'Dislike',81),(319,'Dislike',82),(320,'Dislike',83),(321,'Dislike',84),(322,'Dislike',85),(323,'Dislike',86),(324,'Dislike',87),(325,'Dislike',88),(326,'Dislike',89),(327,'Dislike',90),(328,'Dislike',91),(329,'Dislike',92),(330,'Dislike',93),(331,'Dislike',94),(332,'Dislike',95),(333,'Dislike',96),(334,'Dislike',97),(335,'Dislike',98),(336,'Dislike',99),(337,'Dislike',100),(338,'Dislike',101),(339,'Dislike',102),(340,'Dislike',103),(341,'Dislike',104),(342,'Dislike',105),(343,'Dislike',106),(344,'Dislike',107),(345,'Dislike',108),(346,'Dislike',109),(347,'Dislike',110),(348,'Dislike',111),(349,'Dislike',112),(350,'Dislike',113),(351,'Dislike',114),(352,'Dislike',115),(353,'Dislike',116),(354,'Dislike',117),(355,'Dislike',118),(356,'Dislike',119),(357,'Dislike',120),(358,'Dislike',121),(359,'Dislike',122),(360,'Dislike',123),(361,'Dislike',124),(362,'Dislike',125),(363,'Dislike',126),(364,'Dislike',127),(365,'Dislike',128),(366,'Dislike',129),(382,'Yes',130),(383,'Definitely',130),(384,'Red',131),(385,'Blue',131),(386,'Green',131),(387,'Orange',131);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assessments`
--

DROP TABLE IF EXISTS `assessments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assessments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assessment_name` varchar(128) NOT NULL,
  `description` text,
  `active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assessments`
--

LOCK TABLES `assessments` WRITE;
/*!40000 ALTER TABLE `assessments` DISABLE KEYS */;
INSERT INTO `assessments` VALUES (1,'General Assessment','This is the assessment given as part of the project.',1),(2,'Project Assessment','An assessment of this project.',1),(3,'A Short Assessment','An assessment that\'s short.',1);
/*!40000 ALTER TABLE `assessments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_answers`
--

DROP TABLE IF EXISTS `form_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `answer_id` (`answer_id`),
  KEY `form_id_index` (`form_id`),
  CONSTRAINT `form_answers_ibfk_1` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`),
  CONSTRAINT `form_answers_ibfk_2` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_answers`
--

LOCK TABLES `form_answers` WRITE;
/*!40000 ALTER TABLE `form_answers` DISABLE KEYS */;
INSERT INTO `form_answers` VALUES (372,3,1),(373,3,2),(374,3,3),(375,3,131),(376,3,259),(377,3,260),(378,3,261),(379,3,135),(380,3,136),(381,3,137),(382,3,138),(383,3,139),(384,3,140),(385,3,141),(400,3,15),(401,3,143),(402,3,271),(403,3,272),(404,3,146),(405,3,147),(406,3,275),(407,8,384);
/*!40000 ALTER TABLE `form_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `on_page` int(11) DEFAULT NULL,
  `submitted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_id` (`assessment_id`),
  KEY `user_id_index` (`user_id`),
  CONSTRAINT `forms_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `forms_ibfk_2` FOREIGN KEY (`assessment_id`) REFERENCES `assessments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
INSERT INTO `forms` VALUES (3,1,1,4,NULL),(8,1,3,NULL,1);
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest_areas`
--

DROP TABLE IF EXISTS `interest_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interest_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interest_area_name` varchar(512) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `assessment_id_index` (`assessment_id`),
  CONSTRAINT `interest_areas_ibfk_1` FOREIGN KEY (`assessment_id`) REFERENCES `assessments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest_areas`
--

LOCK TABLES `interest_areas` WRITE;
/*!40000 ALTER TABLE `interest_areas` DISABLE KEYS */;
INSERT INTO `interest_areas` VALUES (1,'Agriculture, Food & Natural Resources',1),(2,'Architecture & Construction',1),(3,'Arts, A/V Technology & Communications',1),(4,'Business Management & Administration',1),(5,'Education & Training',1),(6,'Finance',1),(7,'Government & Public Administration',1),(8,'Health Science',1),(9,'Hospitality & Tourism',1),(10,'Human Services',1),(11,'Information Technology',1),(12,'Law, Public Safety, Corrections & Security',1),(13,'Manufacturing',1),(14,'Marketing, Sales & Service',1),(15,'Science, Technology, Engineering & Mathematics',1),(16,'Transportation, Distribution & Logistics',1),(17,'Worth',2),(18,'The First Section',3);
/*!40000 ALTER TABLE `interest_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` varchar(1024) NOT NULL,
  `interest_area_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `interest_area_id_index` (`interest_area_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`interest_area_id`) REFERENCES `interest_areas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (18,'Learning how things grow and stay alive.',1),(19,'Making the best use of the earth\'s natural resources.',1),(20,'Hunting or fishing.',1),(21,'Protecting the environment or taking care of animals.',1),(22,'Being outdoors.',1),(23,'Planning, budgeting, and keeping records.',1),(24,'Operating and/or repairing machines.',1),(25,'Reading and following blueprints and/or instructions.',2),(26,'Picturing in my mind what a finished product will look like.',2),(27,'Working with my hands.',2),(28,'Performing work that requires precise steps.',2),(29,'Solving technical problems.',2),(30,'Visiting and learning from historical or beautiful buildings.',2),(31,'Following logical step-by-step procedures.',2),(32,'Using my imagination to communicate new information to others.',3),(33,'Performing in front of others.',3),(34,'Reading and writing.',3),(35,'Playing a musical instrument.',3),(36,'Performing creative, artistic activities.',3),(37,'Using video and recording technology.',3),(38,'Designing brochures and posters.',3),(39,'Performing routine, organized activities but can be flexible.',4),(40,'Working with numbers and detailed information.',4),(41,'Being the leader in a group.',4),(42,'Making business contact with people.',4),(43,'Working with computer programs.',4),(44,'Creating reports and communicating ideas.',4),(45,'Planning my work and follow instructions without close supervision.',4),(46,'Communicating with different types of people.',5),(47,'Help others with their homework or to learn new things.',5),(48,'Going to school.',5),(49,'Directing and planning activities for others.',5),(50,'Handling several responsibilities at once.',5),(51,'Acquiring new information.',5),(52,'Helping people overcome their challenges.',5),(53,'Working with numbers.',6),(54,'Working to meet a deadline.',6),(55,'Making predictions based on existing facts.',6),(56,'Having a framework of rules by which to operate.',6),(57,'Analyzing financial information and interpret it to others.',6),(58,'Handling money with accuracy and reliability.',6),(59,'Taking pride in the way I dress and look.',6),(60,'Being involved in politics.',7),(61,'Negotiating, defending, and debating ideas and topics.',7),(62,'Planning activities and working cooperatively with others.',7),(63,'Working with details.',7),(64,'Performing a variety of duties that may change often.',7),(65,'Analyzing information and interpreting it to others.',7),(66,'Traveling and seeing things that are new to me.',7),(67,'Working under pressure.',8),(68,'Helping sick people and animals.',8),(69,'Making decisions based on logic and information.',8),(70,'Participating in health and science classes.',8),(71,'Responding quickly and calmly in emergencies.',8),(72,'Working as a member of a team.',8),(73,'Following guidelines precisely and meet strict standards of accuracy.',8),(74,'Investigating new places and activities.',9),(75,'Working with all ages and types of people.',9),(76,'Organizing activities in which other people enjoy themselves.',9),(77,'Having a flexible schedule.',9),(78,'Helping people make up their minds.',9),(79,'Communicating easily, tactfully, and courteously.',9),(80,'Learning about other cultures.',9),(81,'Caring about people, their needs, and their problems.',10),(82,'Participating in community services and/or volunteering.',10),(83,'Listening to other people\'s viewpoints.',10),(84,'Working with people from preschool age to old age.',10),(85,'Thinking of new ways to do things.',10),(86,'Making friends with different kinds of people.',10),(87,'Being socially aware or advocating for the rights of others.',10),(88,'Reasoning clearly and logically to solve complex problems.',11),(89,'Using machines, techniques, and processes.',11),(90,'Reading technical materials and/or diagrams.',11),(91,'Solving technical problems.',11),(92,'Adapting to change.',11),(93,'Playing video games and figure out how they work.',11),(94,'Concentrating for long periods without being distracted.',11),(95,'Working under pressure or in the face of danger.',12),(96,'Making decisions based on my own observations.',12),(97,'Interacting with other people.',12),(98,'Respecting rules and regulations.',12),(99,'Debating and winning arguments.',12),(100,'Observing and analyzing people\'s behavior.',12),(101,'Helping people in need or standing up for the rights of others',12),(102,'Working with my hands.',13),(103,'Putting things together.',13),(104,'Doing routine, organized and accurate work.',13),(105,'Performing activities that produce tangible results.',13),(106,'Applying math to work out solutions.',13),(107,'Using hand and power tools and operate equipment/machinery.',13),(108,'Visualizing objects in three dimensions from flat drawings.',13),(109,'Shopping and going to the mall.',14),(110,'Being in charge.',14),(111,'Making displays and promote ideas.',14),(112,'Giving presentations and enjoy public speaking.',14),(113,'Persuading people to buy products or to participate in activities.',14),(114,'Communicating my ideas to other people.',14),(115,'Taking advantage of opportunities to make extra money.',14),(116,'Interpreting formulas.',15),(117,'Finding the answers to questions.',15),(118,'Working in a laboratory.',15),(119,'Figuring out how things work and investigate new things.',15),(120,'Exploring new technology.',15),(121,'Experimenting to find the best way to do something.',15),(122,'Paying attention to details and help things be precise.',15),(123,'Traveling.',16),(124,'Seeing well and having quick reflexes.',16),(125,'Designing efficient processes.',16),(126,'Anticipating needs and preparing to meet them.',16),(127,'Driving or riding.',16),(128,'Moving things from one place to another.',16),(129,'Working with machines or automotive technology.',16),(130,'Isn\'t this amazing!?',17),(131,'What\'s you favorite color?',18);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(256) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `admin` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test','user','testUser','$2y$10$eKe.w.k4jw8taXJ4wglGH.i9IUpv8JfJ.qe6hBbXALX6dYcP5HDgu',42,'2018-04-06 00:00:00',1);
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

-- Dump completed on 2018-04-09 13:20:30
