-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: catalogo
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autori`
--

DROP TABLE IF EXISTS `autori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `autori` (
  `refPubblicazione` char(13) NOT NULL,
  `autore` varchar(31) NOT NULL,
  KEY `refPubblicazione` (`refPubblicazione`),
  CONSTRAINT `autori_ibfk_1` FOREIGN KEY (`refPubblicazione`) REFERENCES `pubblicazione` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autori`
--

LOCK TABLES `autori` WRITE;
/*!40000 ALTER TABLE `autori` DISABLE KEYS */;
INSERT INTO `autori` VALUES ('9788854165069','Dante'),('9781118503256','Robert G. Hagstrom'),('9788854181434','Giovanni Boccaccio'),('9788854187177','Omero'),('9788854186231','Omero'),('9788854165511','Azteni'),('9788854165511','Ceri'),('9788854165511','Paraboschi'),('9788854165511','Torlone'),('9788864401607','Milton Friedman'),('9788864400235','Milton Friedman'),('9788849830842','Friedrich A. von Hayek'),('9788849833409','Friedrich A. von Hayek'),('9788849829839','Friedrich A. von Hayek'),('9788849829631','Ludwig von Mises'),('9788854165075','Ludwig von Mises'),('9788856500707','Robert Nozick'),('9788856501707','Richer');
/*!40000 ALTER TABLE `autori` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `triggerNoDupAuthor` BEFORE INSERT ON `autori` FOR EACH ROW begin
	if (select refPubblicazione from Autori where refPubblicazione = new.refPubblicazione and autore = new.autore) is not null
    then
		signal sqlstate '45000'
        set message_text = "cannot exist two identical author for the same publication";
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `chiavi`
--

DROP TABLE IF EXISTS `chiavi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chiavi` (
  `refPubblicazione` char(13) NOT NULL,
  `chiave` varchar(31) NOT NULL,
  KEY `refPubblicazione` (`refPubblicazione`),
  CONSTRAINT `chiavi_ibfk_1` FOREIGN KEY (`refPubblicazione`) REFERENCES `pubblicazione` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chiavi`
--

LOCK TABLES `chiavi` WRITE;
/*!40000 ALTER TABLE `chiavi` DISABLE KEYS */;
INSERT INTO `chiavi` VALUES ('9788854165069','Alighieri'),('9788854165069','Divina'),('9788854165069','Commedia'),('9781118503256','Warren'),('9781118503256','Buffett'),('9781118503256','Economia'),('9788854181434','Giovanni'),('9788854181434','Boccaccio'),('9788854181434','Decameron'),('9788854187177','Omero'),('9788854187177','Odissea'),('9788854187177','Grecia'),('9788854187177','Greco'),('9788854186231','Omero'),('9788854186231','Illiade'),('9788854186231','Grecia'),('9788854186231','Greco'),('9788864401607','Friedman'),('9788864401607','Liberismo'),('9788864401607','Capitalismo'),('9788864401607','Economia'),('9788864400235','Friedman'),('9788864400235','Liberismo'),('9788864400235','Capitalismo'),('9788864400235','Economia'),('9788849830842','von Hayek'),('9788849830842','Liberismo'),('9788849830842','Liberalismo'),('9788849830842','Capitalismo'),('9788849833409','von Hayek'),('9788849833409','Liberismo'),('9788849833409','Liberalismo'),('9788849833409','Capitalismo'),('9788849829839','von Hayek'),('9788849829839','Liberismo'),('9788849829839','Liberalismo'),('9788849829839','Capitalismo'),('9788849829631','von Mises'),('9788849829631','Liberismo'),('9788849829631','Liberalismo'),('9788849829631','Capitalismo'),('9788849829631','Economia'),('9788854165075','von Mises'),('9788854165075','Liberismo'),('9788854165075','Liberalismo'),('9788854165075','Capitalismo'),('9788854165075','Economia'),('9788856500707','Nozick'),('9788856500707','Anarchia'),('9788856500707','Stato'),('9788856500707','Utopia'),('9788856501707','Richer'),('9788856501707','Operating'),('9788856501707','System');
/*!40000 ALTER TABLE `chiavi` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `triggerNoDupKey` BEFORE INSERT ON `chiavi` FOR EACH ROW begin
	if (select refPubblicazione from chiavi where refPubblicazione = new.refPubblicazione and chiave = new.chiave) is not null
    then
		signal sqlstate '45000'
        set message_text = "cannot exist two identical keys for the same publication";
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `indice`
--

DROP TABLE IF EXISTS `indice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `indice` (
  `n°capitolo` int(11) DEFAULT NULL,
  `titoloCapitolo` varchar(63) DEFAULT NULL,
  `refPubblicazione` char(13) NOT NULL,
  KEY `refPubblicazione` (`refPubblicazione`),
  CONSTRAINT `indice_ibfk_1` FOREIGN KEY (`refPubblicazione`) REFERENCES `pubblicazione` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `indice`
--

LOCK TABLES `indice` WRITE;
/*!40000 ALTER TABLE `indice` DISABLE KEYS */;
INSERT INTO `indice` VALUES (1,'paradiso','9788854165069'),(2,'purgatorio','9788854165069'),(3,'inferno','9788854165069'),(1,'The first','9781118503256'),(2,'The second','9781118503256'),(3,'And yeah, the third!','9781118503256'),(1,'Novella prima','9788854181434'),(2,'novella seconda','9788854181434'),(3,'novella terza','9788854181434'),(4,'Novella quarta','9788854181434'),(5,'novella quinta','9788854181434'),(6,'novella sesta','9788854181434'),(7,'Novella settima','9788854181434'),(8,'novella ottava','9788854181434'),(9,'novella nona','9788854181434'),(10,'Novella decima','9788854181434'),(1,'Il cavallo di troia','9788854187177'),(2,'Polifemo ATTACK!','9788854187177'),(3,'le sireneeeee','9788854187177'),(4,'ARRIVANO I PROCI!','9788854187177'),(1,'Eneide, SCAPPA!','9788854186231'),(2,'Eneide sta scappando!','9788854186231'),(3,'Eneide sta ancora scappando!','9788854186231'),(4,'Eneide... È SCAPPATA!','9788854186231'),(1,'PARTE PRIMA','9788854165511'),(2,'PARTE SECONDA','9788854165511'),(3,'PARTE TERZA','9788854165511'),(4,'PARTE QUARTA','9788854165511'),(1,'PARTE PRIMA','9788856501707'),(2,'PARTE SECONDA','9788856501707'),(3,'PARTE TERZA','9788856501707'),(4,'PARTE QUARTA','9788856501707');
/*!40000 ALTER TABLE `indice` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `triggerIndice` BEFORE INSERT ON `indice` FOR EACH ROW begin
	if (select refPubblicazione from indice where n°capitolo = new.n°capitolo and refPubblicazione = new.refPubblicazione) is not null
    then
		signal sqlstate '45000'
        set message_text = "chapter already exists";
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inserisce`
--

DROP TABLE IF EXISTS `inserisce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `inserisce` (
  `ISBNInserisce` char(13) NOT NULL,
  `mailInserente` varchar(63) DEFAULT NULL,
  `dataInserimento` timestamp NULL DEFAULT NULL,
  KEY `ISBNInserisce` (`ISBNInserisce`),
  KEY `mailInserente` (`mailInserente`),
  CONSTRAINT `inserisce_ibfk_1` FOREIGN KEY (`ISBNInserisce`) REFERENCES `pubblicazione` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inserisce_ibfk_2` FOREIGN KEY (`mailInserente`) REFERENCES `utente` (`mail`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inserisce`
--

LOCK TABLES `inserisce` WRITE;
/*!40000 ALTER TABLE `inserisce` DISABLE KEYS */;
INSERT INTO `inserisce` VALUES ('9788854165069','francesco.totti@gmail.com','2019-07-18 15:26:03'),('9781118503256','eric.cantona@gmail.com','2019-07-18 15:26:03'),('9788854181434','eric.cantona@gmail.com','2019-07-18 15:26:03'),('9788854187177','eric.cantona@gmail.com','2019-07-18 15:26:03'),('9788854186231','alex.delpiero@gmail.com','2019-07-18 15:26:03'),('9788854165511','francesco.totti@gmail.com','2019-07-18 15:26:03'),('9788864401607','francesco.totti@gmail.com','2019-07-18 15:26:03'),('9788864400235','francesco.totti@gmail.com','2019-07-18 15:26:04'),('9788849830842','francesco.totti@gmail.com','2019-07-18 15:26:04'),('9788849833409','francesco.totti@gmail.com','2019-07-18 15:26:04'),('9788849829839','francesco.totti@gmail.com','2019-07-18 15:26:04'),('9788849829631','francesco.totti@gmail.com','2019-07-18 15:26:04'),('9788854165075','francesco.totti@gmail.com','2019-07-18 15:26:04'),('9788856500707','francesco.totti@gmail.com','2019-07-18 15:26:04'),('9788856501707','francesco.totti@gmail.com','2019-07-18 15:26:04');
/*!40000 ALTER TABLE `inserisce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mipiace`
--

DROP TABLE IF EXISTS `mipiace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mipiace` (
  `dataMiPiace` timestamp NULL DEFAULT NULL,
  `refPubblicazione` char(13) NOT NULL,
  `refUtente` varchar(63) DEFAULT NULL,
  KEY `refPubblicazione` (`refPubblicazione`),
  KEY `refUtente` (`refUtente`),
  CONSTRAINT `mipiace_ibfk_1` FOREIGN KEY (`refPubblicazione`) REFERENCES `pubblicazione` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `mipiace_ibfk_2` FOREIGN KEY (`refUtente`) REFERENCES `utente` (`mail`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mipiace`
--

LOCK TABLES `mipiace` WRITE;
/*!40000 ALTER TABLE `mipiace` DISABLE KEYS */;
INSERT INTO `mipiace` VALUES ('2019-07-18 15:26:05','9788854165069','alex.delpiero@gmail.com'),('2019-07-18 15:26:05','9788854165069','francesco.totti@gmail.com'),('2019-07-18 15:26:05','9788854165069','daniele.fossemo@gmail.com'),('2019-07-18 15:26:05','9788854187177','francesco.totti@gmail.com'),('2019-07-18 15:26:05','9788854187177','joey.tribbiani@gmail.com'),('2019-07-18 15:26:05','9788854186231','francesco.totti@gmail.com'),('2019-07-18 15:26:05','9788854186231','davide.ricci@gmail.com'),('2019-07-18 15:26:17','9788854165069','frank.sinatra@gmail.com');
/*!40000 ALTER TABLE `mipiace` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `triggerLike` BEFORE INSERT ON `mipiace` FOR EACH ROW begin
	if (select refUtente from mipiace where refUtente= new.RefUtente and refPubblicazione = new.refPubblicazione) is null	#controllo se il like è stato già messo dall'utente
    then
		if (select ISBN from pubblicazione where ISBN = new.refPubblicazione and approvazione = "accettata") is not null	#controllo se si sta mettendo like ad una pubblicazione accettata
		then
			update pubblicazione
			set n°miPiace = n°miPiace + 1
			where pubblicazione.isbn = new.refPubblicazione;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('Mi piace alla pubblicazione ', new.refPubblicazione, ' inserito da ', new.refUtente), new.refPubblicazione, new.refUtente);
		else
			signal sqlstate '45000'
			set message_text = "Cannot add a like to a not accepted (or in waiting) publication";
		end if;
	else
		signal sqlstate '45000'
		set message_text = "the user has already put like";
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `triggerLikeUPD` BEFORE UPDATE ON `mipiace` FOR EACH ROW begin
signal sqlstate '45000'
set message_text = "Cannot modify a like!";
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `triggerDelLike` BEFORE DELETE ON `mipiace` FOR EACH ROW begin
update pubblicazione
set n°miPiace = n°miPiace -1
where pubblicazione.isbn = old.refPubblicazione;
insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
values (current_timestamp, concat('Rimozione mi piace alla pubblicazione ', old.refPubblicazione, ' inserito da ', old.refUtente), old.refPubblicazione, old.refUtente);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `moderatorep`
--

DROP TABLE IF EXISTS `moderatorep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `moderatorep` (
  `ISBNPubblicazione` char(13) NOT NULL,
  `approvato` varchar(13) DEFAULT NULL,
  `mailModeratore` varchar(63) DEFAULT NULL,
  `tipoOperazione` varchar(13) NOT NULL,
  KEY `ISBNPubblicazione` (`ISBNPubblicazione`),
  KEY `mailModeratore` (`mailModeratore`),
  CONSTRAINT `moderatorep_ibfk_1` FOREIGN KEY (`ISBNPubblicazione`) REFERENCES `pubblicazione` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moderatorep_ibfk_2` FOREIGN KEY (`mailModeratore`) REFERENCES `utente` (`mail`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `approvOkMP` CHECK ((`approvato` in (_utf8mb3'accettata',_utf8mb3'non accettata'))),
  CONSTRAINT `tipoOpOkP` CHECK ((`tipoOperazione` in (_utf8mb4'inserimento',_utf8mb4'modifica',_utf8mb4'cancellazione')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderatorep`
--

LOCK TABLES `moderatorep` WRITE;
/*!40000 ALTER TABLE `moderatorep` DISABLE KEYS */;
INSERT INTO `moderatorep` VALUES ('9788854165069','accettata','daniele.fossemo@gmail.com','inserimento'),('9788854187177','accettata','davide.ricci@gmail.com','inserimento'),('9788854186231','accettata','gianluca.rea@gmail.com','inserimento'),('9788854165511','accettata','gianluca.rea@gmail.com','inserimento'),('9788854165075','accettata','gianluca.rea@gmail.com','inserimento');
/*!40000 ALTER TABLE `moderatorep` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `triggerModeratorePubblicazione` BEFORE INSERT ON `moderatorep` FOR EACH ROW begin
	if(select mail from utente where mail = new.mailModeratore and tipo = "moderatore") is null
    then
				signal sqlstate '45000' 
				set message_text = 'a users who want accept/not accept is not a moderator' ;
    end if;
    
    if new.tipoOperazione = "inserimento" and new.approvato = "accettata"
    then
		if (select ISBN from pubblicazione where new.ISBNPubblicazione = ISBN and new.approvato = approvazione) is null	#se è già accettata non ha senso "accettarla" di nuovo
        then
			update pubblicazione
			set approvazione = "accettata"
			where ISBN = new.ISBNPubblicazione;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('accettazione inserimento della pubblicazione ', new.ISBNPubblicazione, ' da parte del moderatore ', new.mailModeratore ), new.ISBNPubblicazione, new.mailModeratore);
		else
			signal sqlstate '45000' 
			set message_text = 'The pubblication is already accepted' ;
		end if;
    end if;
    
    if new.tipoOperazione = "inserimento" and new.approvato = "non accettata"
    then
		if (select ISBN from pubblicazione where new.ISBNPubblicazione = ISBN and new.approvato = approvazione) is null	#se è già non accettata non ha senso "non accettarla" di nuovo
        then
			update pubblicazione
			set approvazione = "non accettata"
			where ISBN = new.ISBNPubblicazione;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('rifiuto inserimento della pubblicazione ', new.ISBNPubblicazione, ' da parte del moderatore ', new.mailModeratore ), new.ISBNPubblicazione, new.mailModeratore);
		else
			signal sqlstate '45000' 
			set message_text = 'The pubblication is already not accepted' ;
		end if;
   end if;
    
    if new.tipoOperazione = "modifica" and new.approvato = "accettata"
    then
		if (select ISBN from pubblicazione where new.ISBNPubblicazione = ISBN and new.approvato = approvazione) is null	#se è già accettata non ha senso "accettarla" di nuovo
        then
			update pubblicazione
			set approvazione = "accettata"
			where ISBN = new.ISBNPubblicazione;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('accettazione della modifica sulla pubblicazione ', new.ISBNPubblicazione, ' da parte del moderatore ', new.mailModeratore), new.ISBNPubblicazione, new.mailModeratore);
		else
			signal sqlstate '45000' 
			set message_text = 'The modify of pubblication is already accepted' ;
		end if;
    end if;
    
    if new.tipoOperazione = "modifica" and new.approvato = "non accettata"
    then
		if (select ISBN from pubblicazione where new.ISBNPubblicazione = ISBN and new.approvato = approvazione) is null	#se è già accettata non ha senso "non accettarla" di nuovo
        then
			update pubblicazione
			set approvazione = "non accettata"
			where ISBN = new.ISBNPubblicazione;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('rifiuto della modifica sulla pubblicazione ', new.ISBNPubblicazione, ' da parte del moderatore ', new.mailModeratore), new.ISBNPubblicazione, new.mailModeratore);
		else
			signal sqlstate '45000' 
			set message_text = 'The modify of pubblication is already not accepted' ;
		end if;
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `moderatorer`
--

DROP TABLE IF EXISTS `moderatorer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `moderatorer` (
  `IDRecensioneDaAccettare` int(11) DEFAULT NULL,
  `approvato` varchar(13) DEFAULT NULL,
  `mailModeratoreCheAccetta` varchar(63) DEFAULT NULL,
  `tipoOperazione` varchar(13) NOT NULL,
  KEY `IDRecensioneDaAccettare` (`IDRecensioneDaAccettare`),
  KEY `mailModeratoreCheAccetta` (`mailModeratoreCheAccetta`),
  CONSTRAINT `moderatorer_ibfk_1` FOREIGN KEY (`IDRecensioneDaAccettare`) REFERENCES `recensione` (`IDRecensione`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `moderatorer_ibfk_2` FOREIGN KEY (`mailModeratoreCheAccetta`) REFERENCES `utente` (`mail`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `approvOkMR` CHECK ((`approvato` in (_utf8mb3'accettata',_utf8mb3'non accettata'))),
  CONSTRAINT `tipoOpOkR` CHECK ((`tipoOperazione` in (_utf8mb4'inserimento',_utf8mb4'modifica',_utf8mb4'cancellazione')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moderatorer`
--

LOCK TABLES `moderatorer` WRITE;
/*!40000 ALTER TABLE `moderatorer` DISABLE KEYS */;
INSERT INTO `moderatorer` VALUES (1,'accettata','daniele.fossemo@gmail.com','inserimento'),(2,'accettata','davide.ricci@gmail.com','inserimento'),(3,'accettata','gianluca.rea@gmail.com','inserimento');
/*!40000 ALTER TABLE `moderatorer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `triggerModeratoreRecensione` BEFORE INSERT ON `moderatorer` FOR EACH ROW begin
	declare x char(13);
	if(select mail from utente where mail = new.mailModeratoreCheAccetta and tipo = "moderatore") is null
    then
				signal sqlstate '45000' 
				set message_text = 'a users who want accept/not accept is not a moderator' ;
    end if;
    
    select refPubblicazione into @x from recensione where new.IDRecensioneDaAccettare = IDRecensione;
    
    if new.tipoOperazione = "inserimento" and new.approvato = "accettata"
    then
		if (select IDRecensione from recensione where new.IDRecensioneDaAccettare = IDRecensione and new.approvato = approvazione) is null	#se è già accettata non ha senso "accettarla" di nuovo
        then
			update recensione
			set approvazione = "accettata"
			where IDRecensione = new.IDRecensioneDaAccettare;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('accettazione inserimento della recensione ', new.IDRecensioneDaAccettare, ' da parte del moderatore ', new.mailModeratoreCheAccetta, ' sulla pubblicazione ' , @x ), @x, new.mailModeratoreCheAccetta);
		else
			signal sqlstate '45000' 
			set message_text = 'The review is already accepted' ;
		end if;
    end if;
    
    if new.tipoOperazione = "inserimento" and new.approvato = "non accettata"
    then
		if (select IDRecensione from recensione where new.IDRecensioneDaAccettare = IDRecensione and new.approvato = approvazione) is null	#se è già non accettata non ha senso "non accettarla" di nuovo"
        then
			update recensione
			set approvazione = "non accettata"
			where IDRecensione = new.IDRecensioneDaAccettare;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('rifiuto inserimento della recensione ', new.IDRecensioneDaAccettare, ' da parte del moderatore ', new.mailModeratoreCheAccetta, ' sulla pubblicazione ' , @x ), @x, new.mailModeratoreCheAccetta);
		else
			signal sqlstate '45000' 
			set message_text = 'The review is already not accepted' ;
		end if;
    end if;
    
	if new.tipoOperazione = "modifica" and new.approvato = "accettata"
    then
		if (select IDRecensione from recensione where new.IDRecensioneDaAccettare = IDRecensione and new.approvato = approvazione) is null	#se è già accettata non ha senso "accettarla" di nuovo
        then
			update recensione
			set approvazione = "accettata"
			where IDRecensione = new.IDRecensioneDaAccettare;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('accettazione della modifica sulla recensione ', new.IDRecensioneDaAccettare, ' da parte del moderatore ', new.mailModeratoreCheAccetta, ' sulla pubblicazione ' , @x ), @x, new.mailModeratoreCheAccetta);
		else
			signal sqlstate '45000' 
			set message_text = 'The modify of review is already accepted' ;
		end if;
    end if;
    
	if new.tipoOperazione = "modifica" and new.approvato = "non accettata"
    then
		if (select IDRecensione from recensione where new.IDRecensioneDaAccettare = IDRecensione and new.approvato = approvazione) is null	#se è già non accettata non ha senso "non accettarla" di nuovo"
        then
			update recensione
			set approvazione = "non accettata"
			where IDRecensione = new.IDRecensioneDaAccettare;
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('rifiuto della modifica sulla recensione ', new.IDRecensioneDaAccettare, ' da parte del moderatore ', new.mailModeratoreCheAccetta, ' sulla pubblicazione ' , @x ), @x, new.mailModeratoreCheAccetta);
		else
			signal sqlstate '45000' 
			set message_text = 'The modify of review is already not accepted' ;
		end if;
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pubblicazione`
--

DROP TABLE IF EXISTS `pubblicazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pubblicazione` (
  `ISBN` char(13) NOT NULL,
  `titolo` varchar(31) NOT NULL,
  `editore` varchar(31) DEFAULT NULL,
  `lingua` varchar(31) DEFAULT NULL,
  `dataPubblicazione` date DEFAULT NULL,
  `n°pagine` int(11) DEFAULT NULL,
  `disponibilitàDownload` tinyint(1) DEFAULT '0',
  `n°miPiace` int(11) DEFAULT '0',
  `approvazione` varchar(63) DEFAULT 'in attesa',
  `commitUser` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`ISBN`),
  KEY `commitUser` (`commitUser`),
  CONSTRAINT `pubblicazione_ibfk_1` FOREIGN KEY (`commitUser`) REFERENCES `utente` (`mail`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `approvOkP` CHECK ((`approvazione` in (_utf8mb3'in attesa',_utf8mb3'accettata',_utf8mb3'non accettata')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pubblicazione`
--

LOCK TABLES `pubblicazione` WRITE;
/*!40000 ALTER TABLE `pubblicazione` DISABLE KEYS */;
INSERT INTO `pubblicazione` VALUES ('9781118503256','The Warrent Buffet way','John Wiley','Inglese','2004-05-02',281,0,0,'in attesa','eric.cantona@gmail.com'),('9788849829631',' stato interventista','Rubbetino','Inglese','1986-04-05',328,0,0,'in attesa','francesco.totti@gmail.com'),('9788849829839','La società libera','Rubbetino','Inglese','1979-08-06',714,0,0,'in attesa','francesco.totti@gmail.com'),('9788849830842','La via della schiavitù','IBL Libri','Inglese','1980-09-09',293,1,0,'in attesa','francesco.totti@gmail.com'),('9788849833409','Liberalismo','Rubbettino','Italiano','1974-06-08',70,0,0,'in attesa','francesco.totti@gmail.com'),('9788854165069','Divina Commedia','D Agostini','Dialetto Fiorentino','2000-02-02',1000,1,4,'accettata','francesco.totti@gmail.com'),('9788854165075','Burocrazia','Rubbetino','Inglese','1971-05-12',161,0,0,'accettata','francesco.totti@gmail.com'),('9788854165511','Database Systems','McGraw-Hill','Inglese','1999-05-05',612,1,0,'accettata','francesco.totti@gmail.com'),('9788854181434','Decameron','Mondadori','Dialetto Fiorentino','2003-02-01',699,0,0,'in attesa','eric.cantona@gmail.com'),('9788854186231','Illiade','Newton Compton','Greco Antico','2013-05-02',510,0,2,'accettata','alex.delpiero@gmail.com'),('9788854187177','Odissea','Newton Compton','Greco Antico','2013-05-03',383,0,2,'accettata','eric.cantona@gmail.com'),('9788856500707','Anarchia,stato e utopia','Il Saggiatore','Italiano','2001-04-09',382,0,0,'in attesa','francesco.totti@gmail.com'),('9788856501707','Operating System','Newton Compton','Inglese','2010-04-09',718,0,0,'in attesa','francesco.totti@gmail.com'),('9788864400235','Capitalismo e libertà','IBL Libri','Inglese','1976-06-05',298,0,0,'in attesa','francesco.totti@gmail.com'),('9788864401607','Liberi di Scegliere','IBL Libri','Inglese','1974-02-02',305,0,0,'in attesa','francesco.totti@gmail.com');
/*!40000 ALTER TABLE `pubblicazione` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `triggerISBN` BEFORE INSERT ON `pubblicazione` FOR EACH ROW begin
	if new.ISBN like '[a-z]%' or new.ISBN like '%[a-z]'
    then
		signal sqlstate '45000' set message_text = 'invalid ISBN, ISBN can contain only number';
    end if;
    
	if new.ISBN not regexp '[0-9]{13,}'
    then
		signal sqlstate '45000' set message_text = 'invalid ISBN, ISBN can contain only number';
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insertTableTrigger` AFTER INSERT ON `pubblicazione` FOR EACH ROW begin
	if new.commitUser is null
    then
		signal sqlstate '45000'
        set message_text = "A publication need a commit user to be insert into the database";
	else
    insert into inserisce (ISBNInserisce,mailInserente, dataInserimento) values
    (new.ISBN, new.commitUser, current_timestamp);
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insOfPubbl` AFTER INSERT ON `pubblicazione` FOR EACH ROW begin
	insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
    values (current_timestamp, concat('inserimento della pubblicazione ', new.ISBN, ' inserita da ', new.commitUser), new.ISBN, new.commitUser);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `triggerCollaborazione` AFTER INSERT ON `pubblicazione` FOR EACH ROW begin
       declare numero int;
	   select count(*) into numero from pubblicazione where commitUser = new.commitUser ;
       
       if(numero >= 10)
       then 
       update utente 
       set collaborazione = 1 
       where mail = new.commitUser ;
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modOfPubbl` BEFORE UPDATE ON `pubblicazione` FOR EACH ROW begin
	if (select ISBN from pubblicazione where ISBN = new.ISBN and approvazione = 'non accettata') is null
    then
		if new.n°miPiace is null then #if per evitare che l'aggiornamento dato dai trigger di aggiunta/eliminazione like rimettano la pubblicazione "in attesa" e scrivano nello storico "modifica...".
			if (select ISBN from pubblicazione where ISBN = new.ISBN and approvazione = 'in attesa')
			then
				set new.approvazione = 'in attesa';
				insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
				values (current_timestamp, concat('modifica della pubblicazione ', new.ISBN, ' inserita da ', new.commitUser), new.ISBN, new.commitUser);
			end if;
		end if;
	else
		signal sqlstate '45000'
        set message_text = "A publication not accepted cannot be modified";
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delOfPubbl` BEFORE DELETE ON `pubblicazione` FOR EACH ROW begin
	if old.approvazione = 'accettata' or old.approvazione='in attesa' 
    then
		signal sqlstate '45000'
        set message_text = 'an accepted/waiting publication cannot be delete';
    else
	insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
    values (current_timestamp, concat('Cancellazione della pubblicazione NON ACCETTATA ', old.ISBN, ' inserita da ', old.commitUser), old.ISBN, old.commitUser);
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `recensione`
--

DROP TABLE IF EXISTS `recensione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recensione` (
  `IDRecensione` int(11) NOT NULL AUTO_INCREMENT,
  `testo` varchar(511) DEFAULT NULL,
  `dataRecensione` date DEFAULT NULL,
  `approvazione` varchar(63) DEFAULT 'in attesa',
  `refPubblicazione` char(13) NOT NULL,
  `refUtente` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`IDRecensione`),
  KEY `refPubblicazione` (`refPubblicazione`),
  KEY `refUtente` (`refUtente`),
  CONSTRAINT `recensione_ibfk_1` FOREIGN KEY (`refPubblicazione`) REFERENCES `pubblicazione` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recensione_ibfk_2` FOREIGN KEY (`refUtente`) REFERENCES `utente` (`mail`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `approvOkR` CHECK ((`approvazione` in (_utf8mb3'in attesa',_utf8mb3'accettata',_utf8mb3'non accettata')))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recensione`
--

LOCK TABLES `recensione` WRITE;
/*!40000 ALTER TABLE `recensione` DISABLE KEYS */;
INSERT INTO `recensione` VALUES (1,'GRANDISSIMO GIOVE, un libro più che fantastico','2012-01-01','in attesa','9788854165069','alex.delpiero@gmail.com'),(2,'Grande giove,un bel libro ','2013-02-02','accettata','9788854165069','francesco.totti@gmail.com'),(3,'Grande giove,un libro carino','2014-02-04','accettata','9788854186231','francesco.totti@gmail.com'),(5,'Bel libro,consigliato a tutti gli amanti del genere!','2019-07-18','in attesa','9788854165075','ross.geller@gmail.com');
/*!40000 ALTER TABLE `recensione` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `onlyOneRec` BEFORE INSERT ON `recensione` FOR EACH ROW begin
	if(select IDRecensione from recensione where refPubblicazione = new.refPubblicazione and refUtente=new.refUtente) is not null
    then
		signal sqlstate '45000'
        set message_text = "review already exists";
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `InsOfRec` AFTER INSERT ON `recensione` FOR EACH ROW begin
	if (select ISBN from pubblicazione where ISBN = new.refPubblicazione and pubblicazione.approvazione = 'accettata') is not null
    then
	insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
    values (current_timestamp, concat('inserimento della recensione ', new.IDRecensione, ' inserito da ', new.refUtente, ' sulla pubblicazione ', new.refPubblicazione), new.refPubblicazione, new.refUtente);
	else
    signal sqlstate '45000'
	set message_text = "Cannot add a review to a not accepted (or in waiting) publication";
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `modOfRec` BEFORE UPDATE ON `recensione` FOR EACH ROW begin
	if (select IDRecensione from recensione where IDRecensione = new.IDRecensione and approvazione = 'non accettata') is null
    then
		if (select IDRecensione from recensione where IDRecensione = new.IDRecensione and approvazione = 'in attesa') is null
		then
			set new.approvazione = 'in attesa';
			insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
			values (current_timestamp, concat('modifica della recensione ', new.IDRecensione, ' inserito da ', new.refUtente, ' sulla pubblicazione ', new.refPubblicazione), new.refPubblicazione, new.refUtente);
		end if;
	else
		signal sqlstate '45000'
        set message_text = "A review not accepted cannot be modified";
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delOfRec` AFTER DELETE ON `recensione` FOR EACH ROW begin
	insert into storico (time_stamp, descrizione, refPubblicazione, refUtente) 
    values (current_timestamp, concat('Cancellazione della recensione ', old.IDRecensione, ' inserito da ', old.refUtente, ' sulla pubblicazione ', old.refPubblicazione), old.refPubblicazione, old.refUtente);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ristampa`
--

DROP TABLE IF EXISTS `ristampa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ristampa` (
  `refPubblicazione` char(13) NOT NULL,
  `Nristampa` int(11) DEFAULT NULL,
  `data_ristampa` date DEFAULT NULL,
  KEY `refPubblicazione` (`refPubblicazione`),
  CONSTRAINT `ristampa_ibfk_1` FOREIGN KEY (`refPubblicazione`) REFERENCES `pubblicazione` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ristampa`
--

LOCK TABLES `ristampa` WRITE;
/*!40000 ALTER TABLE `ristampa` DISABLE KEYS */;
INSERT INTO `ristampa` VALUES ('9788854165069',1,'2000-04-04'),('9788854165069',2,'2000-06-05'),('9788854165069',3,'2000-07-06'),('9781118503256',1,'2004-07-10'),('9781118503256',2,'2004-09-06'),('9788854181434',1,'2003-11-23'),('9788854187177',1,'2013-09-23'),('9788854187177',2,'2013-12-19'),('9788854186231',1,'2013-06-13'),('9788854186231',2,'2013-12-02'),('9788854186231',3,'2014-03-21'),('9788854165511',1,'2000-01-30'),('9788864401607',1,'1974-06-22'),('9788864401607',2,'1975-04-19'),('9788864400235',1,'1976-12-16'),('9788864400235',2,'1977-05-16'),('9788864400235',3,'1978-11-07'),('9788849830842',1,'1980-12-12'),('9788849830842',2,'1981-02-27'),('9788849830842',3,'1982-03-01'),('9788849833409',1,'1974-09-18'),('9788849833409',2,'1975-04-28'),('9788849829839',1,'1980-03-07'),('9788849829631',1,'1986-09-15'),('9788849829631',2,'1987-02-25'),('9788854165075',1,'1971-05-12'),('9788854165075',2,'1972-05-12'),('9788856500707',1,'2002-11-09'),('9788856500707',2,'2003-02-12'),('9788856501707',1,'2011-05-29');
/*!40000 ALTER TABLE `ristampa` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `triggerNoDupReprint` BEFORE INSERT ON `ristampa` FOR EACH ROW begin
	if (select refPubblicazione from ristampa where refPubblicazione = new.refPubblicazione and Nristampa = new.Nristampa) is not null
    then
		signal sqlstate '45000'
        set message_text = "cannot exist two identical reprint for the same publication (NOTE: even with different dates)";
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sorgente`
--

DROP TABLE IF EXISTS `sorgente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sorgente` (
  `IDSorgente` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(63) DEFAULT NULL,
  `tipo` varchar(63) DEFAULT NULL,
  `formato` varchar(63) DEFAULT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `refPubblicazione` char(13) NOT NULL,
  PRIMARY KEY (`IDSorgente`),
  KEY `refPubblicazione` (`refPubblicazione`),
  CONSTRAINT `sorgente_ibfk_1` FOREIGN KEY (`refPubblicazione`) REFERENCES `pubblicazione` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sorgente`
--

LOCK TABLES `sorgente` WRITE;
/*!40000 ALTER TABLE `sorgente` DISABLE KEYS */;
INSERT INTO `sorgente` VALUES (1,'http://server.net/coverDC.jpg','immagine','image/jpeg','copertina','9788854165069'),(2,'http://server.net/DivinaCommedia.pdf','download','application/pdf','versione elettronica gratuita','9788854165069'),(3,'http://server.net/coverTWBW.jpg','immagine','image/jpeg','copertina','9781118503256'),(4,'”http://www.amazon.it/TheWarrentBUffetWay','acquisto','cartaceo, copertina rigida','Acquista online','9781118503256'),(5,'”http://www.amazon.it/Odissea','acquisto','cartaceo, copertina rigida','Acquista online','9788854187177'),(6,'http://server.net/LaViaDellaSchiavitù.pdf','download','application/pdf','versione elettronica gratuita','9788849830842');
/*!40000 ALTER TABLE `sorgente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `triggerDownload` AFTER INSERT ON `sorgente` FOR EACH ROW begin
declare disp boolean;
	if new.tipo = 'download'
    then
		select disponibilitàDownload into @disp from pubblicazione, sorgente where pubblicazione.ISBN = new.refPubblicazione limit 1;
        if @disp = false
        then
			update pubblicazione
            set disponibilitàDownload = true
            where pubblicazione.ISBN = new.refPubblicazione;
		end if;
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `storico`
--

DROP TABLE IF EXISTS `storico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `storico` (
  `IDStorico` int(11) NOT NULL AUTO_INCREMENT,
  `time_stamp` timestamp NULL DEFAULT NULL,
  `descrizione` varchar(255) DEFAULT NULL,
  `refPubblicazione` char(13) DEFAULT NULL,
  `refUtente` varchar(63) DEFAULT NULL,
  PRIMARY KEY (`IDStorico`),
  KEY `refPubblicazione` (`refPubblicazione`),
  KEY `refUtente` (`refUtente`),
  CONSTRAINT `storico_ibfk_1` FOREIGN KEY (`refPubblicazione`) REFERENCES `pubblicazione` (`ISBN`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `storico_ibfk_2` FOREIGN KEY (`refUtente`) REFERENCES `utente` (`mail`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storico`
--

LOCK TABLES `storico` WRITE;
/*!40000 ALTER TABLE `storico` DISABLE KEYS */;
INSERT INTO `storico` VALUES (1,'2019-07-18 15:26:03','inserimento della pubblicazione 9788854165069 inserita da francesco.totti@gmail.com','9788854165069','francesco.totti@gmail.com'),(2,'2019-07-18 15:26:03','inserimento della pubblicazione 9781118503256 inserita da eric.cantona@gmail.com','9781118503256','eric.cantona@gmail.com'),(3,'2019-07-18 15:26:03','inserimento della pubblicazione 9788854181434 inserita da eric.cantona@gmail.com','9788854181434','eric.cantona@gmail.com'),(4,'2019-07-18 15:26:03','inserimento della pubblicazione 9788854187177 inserita da eric.cantona@gmail.com','9788854187177','eric.cantona@gmail.com'),(5,'2019-07-18 15:26:03','inserimento della pubblicazione 9788854186231 inserita da alex.delpiero@gmail.com','9788854186231','alex.delpiero@gmail.com'),(6,'2019-07-18 15:26:03','inserimento della pubblicazione 9788854165511 inserita da francesco.totti@gmail.com','9788854165511','francesco.totti@gmail.com'),(7,'2019-07-18 15:26:03','inserimento della pubblicazione 9788864401607 inserita da francesco.totti@gmail.com','9788864401607','francesco.totti@gmail.com'),(8,'2019-07-18 15:26:04','inserimento della pubblicazione 9788864400235 inserita da francesco.totti@gmail.com','9788864400235','francesco.totti@gmail.com'),(9,'2019-07-18 15:26:04','inserimento della pubblicazione 9788849830842 inserita da francesco.totti@gmail.com','9788849830842','francesco.totti@gmail.com'),(10,'2019-07-18 15:26:04','inserimento della pubblicazione 9788849833409 inserita da francesco.totti@gmail.com','9788849833409','francesco.totti@gmail.com'),(11,'2019-07-18 15:26:04','inserimento della pubblicazione 9788849829839 inserita da francesco.totti@gmail.com','9788849829839','francesco.totti@gmail.com'),(12,'2019-07-18 15:26:04','inserimento della pubblicazione 9788849829631 inserita da francesco.totti@gmail.com','9788849829631','francesco.totti@gmail.com'),(13,'2019-07-18 15:26:04','inserimento della pubblicazione 9788854165075 inserita da francesco.totti@gmail.com','9788854165075','francesco.totti@gmail.com'),(14,'2019-07-18 15:26:04','inserimento della pubblicazione 9788849851779 inserita da francesco.totti@gmail.com',NULL,'francesco.totti@gmail.com'),(15,'2019-07-18 15:26:04','inserimento della pubblicazione 9788856500707 inserita da francesco.totti@gmail.com','9788856500707','francesco.totti@gmail.com'),(16,'2019-07-18 15:26:04','inserimento della pubblicazione 9788856501707 inserita da francesco.totti@gmail.com','9788856501707','francesco.totti@gmail.com'),(17,'2019-07-18 15:26:04','accettazione inserimento della pubblicazione 9788854165069 da parte del moderatore daniele.fossemo@gmail.com','9788854165069','daniele.fossemo@gmail.com'),(18,'2019-07-18 15:26:04','accettazione inserimento della pubblicazione 9788854187177 da parte del moderatore davide.ricci@gmail.com','9788854187177','davide.ricci@gmail.com'),(19,'2019-07-18 15:26:04','accettazione inserimento della pubblicazione 9788854186231 da parte del moderatore gianluca.rea@gmail.com','9788854186231','gianluca.rea@gmail.com'),(20,'2019-07-18 15:26:04','accettazione inserimento della pubblicazione 9788854165511 da parte del moderatore gianluca.rea@gmail.com','9788854165511','gianluca.rea@gmail.com'),(21,'2019-07-18 15:26:04','accettazione inserimento della pubblicazione 9788854165075 da parte del moderatore gianluca.rea@gmail.com','9788854165075','gianluca.rea@gmail.com'),(22,'2019-07-18 15:26:04','rifiuto inserimento della pubblicazione 9788849851779 da parte del moderatore davide.ricci@gmail.com',NULL,'davide.ricci@gmail.com'),(23,'2019-07-18 15:26:04','Cancellazione della pubblicazione NON ACCETTATA 9788849851779 inserita da francesco.totti@gmail.com',NULL,'francesco.totti@gmail.com'),(24,'2019-07-18 15:26:04','inserimento della recensione 1 inserito da alex.delpiero@gmail.com sulla pubblicazione 9788854165069','9788854165069','alex.delpiero@gmail.com'),(25,'2019-07-18 15:26:04','inserimento della recensione 2 inserito da francesco.totti@gmail.com sulla pubblicazione 9788854165069','9788854165069','francesco.totti@gmail.com'),(26,'2019-07-18 15:26:04','inserimento della recensione 3 inserito da francesco.totti@gmail.com sulla pubblicazione 9788854186231','9788854186231','francesco.totti@gmail.com'),(27,'2019-07-18 15:26:05','inserimento della recensione 4 inserito da eric.cantona@gmail.com sulla pubblicazione 9788854165511','9788854165511','eric.cantona@gmail.com'),(28,'2019-07-18 15:26:05','Mi piace alla pubblicazione 9788854165069 inserito da alex.delpiero@gmail.com','9788854165069','alex.delpiero@gmail.com'),(29,'2019-07-18 15:26:05','Mi piace alla pubblicazione 9788854165069 inserito da francesco.totti@gmail.com','9788854165069','francesco.totti@gmail.com'),(30,'2019-07-18 15:26:05','Mi piace alla pubblicazione 9788854165069 inserito da joey.tribbiani@gmail.com','9788854165069','joey.tribbiani@gmail.com'),(31,'2019-07-18 15:26:05','Mi piace alla pubblicazione 9788854165069 inserito da daniele.fossemo@gmail.com','9788854165069','daniele.fossemo@gmail.com'),(32,'2019-07-18 15:26:05','Mi piace alla pubblicazione 9788854187177 inserito da francesco.totti@gmail.com','9788854187177','francesco.totti@gmail.com'),(33,'2019-07-18 15:26:05','Mi piace alla pubblicazione 9788854187177 inserito da joey.tribbiani@gmail.com','9788854187177','joey.tribbiani@gmail.com'),(34,'2019-07-18 15:26:05','Mi piace alla pubblicazione 9788854186231 inserito da daniele.fossemo@gmail.com','9788854186231','daniele.fossemo@gmail.com'),(35,'2019-07-18 15:26:05','Mi piace alla pubblicazione 9788854186231 inserito da francesco.totti@gmail.com','9788854186231','francesco.totti@gmail.com'),(36,'2019-07-18 15:26:05','Mi piace alla pubblicazione 9788854186231 inserito da davide.ricci@gmail.com','9788854186231','davide.ricci@gmail.com'),(37,'2019-07-18 15:26:05','Mi piace alla pubblicazione 9788854186231 inserito da gianluca.rea@gmail.com','9788854186231','gianluca.rea@gmail.com'),(38,'2019-07-18 15:26:05','accettazione inserimento della recensione 1 da parte del moderatore daniele.fossemo@gmail.com sulla pubblicazione 9788854165069','9788854165069','daniele.fossemo@gmail.com'),(39,'2019-07-18 15:26:05','accettazione inserimento della recensione 2 da parte del moderatore davide.ricci@gmail.com sulla pubblicazione 9788854165069','9788854165069','davide.ricci@gmail.com'),(40,'2019-07-18 15:26:05','rifiuto inserimento della recensione 4 da parte del moderatore gianluca.rea@gmail.com sulla pubblicazione 9788854165511','9788854165511','gianluca.rea@gmail.com'),(41,'2019-07-18 15:26:05','Rimozione mi piace alla pubblicazione 9788854186231 inserito da gianluca.rea@gmail.com','9788854186231','gianluca.rea@gmail.com'),(42,'2019-07-18 15:26:05','Rimozione mi piace alla pubblicazione 9788854186231 inserito da daniele.fossemo@gmail.com','9788854186231','daniele.fossemo@gmail.com'),(43,'2019-07-18 15:26:05','Rimozione mi piace alla pubblicazione 9788854165069 inserito da joey.tribbiani@gmail.com','9788854165069','joey.tribbiani@gmail.com'),(44,'2019-07-18 15:26:05','modifica della recensione 1 inserito da alex.delpiero@gmail.com sulla pubblicazione 9788854165069','9788854165069','alex.delpiero@gmail.com'),(45,'2019-07-18 15:26:05','Cancellazione della recensione 4 inserito da eric.cantona@gmail.com sulla pubblicazione 9788854165511','9788854165511','eric.cantona@gmail.com'),(46,'2019-07-18 15:26:16','inserimento della recensione 5 inserito da ross.geller@gmail.com sulla pubblicazione 9788854165075','9788854165075','ross.geller@gmail.com'),(47,'2019-07-18 15:26:17','accettazione inserimento della recensione 3 da parte del moderatore gianluca.rea@gmail.com sulla pubblicazione 9788854186231','9788854186231','gianluca.rea@gmail.com'),(48,'2019-07-18 15:26:17','Mi piace alla pubblicazione 9788854165069 inserito da frank.sinatra@gmail.com','9788854165069','frank.sinatra@gmail.com');
/*!40000 ALTER TABLE `storico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `utente` (
  `mail` varchar(63) NOT NULL,
  `nome` varchar(31) NOT NULL,
  `cognome` varchar(31) NOT NULL,
  `CF` char(16) NOT NULL,
  `password` varchar(31) NOT NULL,
  `stato` varchar(31) DEFAULT NULL,
  `tipo` varchar(31) DEFAULT NULL,
  `collaborazione` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`mail`),
  CONSTRAINT `statOk` CHECK ((`stato` in (_utf8mb4'attivo',_utf8mb4'passivo'))),
  CONSTRAINT `tipOk` CHECK ((`tipo` in (_utf8mb3'finale',_utf8mb3'moderatore')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('alex.delpiero@gmail.com','Alex','DelPiero','DPRALX7P21I886S','Mondiali2006','attivo','finale',0),('chandler.bing@gmail.com','Chandler','Bing','CDLBNG9S24S976D','KingofSarcasm','attivo','finale',0),('daniele.fossemo@gmail.com','Daniele','Fossemo','DNLFSM98P25I203S','admin','passivo','moderatore',0),('davide.ricci@gmail.com','Davide','Ricci','DVDRCC98P23I230S','sveglia','passivo','moderatore',0),('eric.cantona@gmail.com','Eric','Cantona','CNTERC68P14I999S','TheKing','passivo','finale',0),('francesco.totti@gmail.com','Francesco','Totti','FRTTTP76P26I838S','forzaRoma','passivo','finale',1),('frank.sinatra@gmail.com','Frank','Sinatra','FRKSNT7P21I999S','NewYork','passivo','finale',0),('gianluca.rea@gmail.com','Gianluca','Rea','REAGLC97P26I838S','ciaociao','attivo','moderatore',0),('joey.tribbiani@gmail.com','Joey','Tribbiani','JOETRB7P21I999S','HowYouDoin','passivo','finale',0),('maria.defilippi@gmail.com','Maria','De Filippi','MRADFP12P22I123S','amici','passivo','finale',0),('monica.geller@gmail.com','Monica','Geller','MNCGLL3P11I392S','IalwaysWin','passivo','finale',0),('phoebe.buffay@gmail.com','Phoebe','Buffay','POBBFF3P17I237S','SmellyCat','passivo','finale',0),('rachel.green@gmail.com','Rachel','Green','RCLGRN6P46I368D','Igotofftheplane','attivo','finale',0),('ross.geller@gmail.com','Ross','Geller','RSSGLL3C16I456S','PivotPivot','attivo','finale',0);
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insUtente` BEFORE INSERT ON `utente` FOR EACH ROW begin
	if (select mail from utente where CF = new.CF)
    then
		signal sqlstate '45000'
        set message_text = "review already exists";
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'catalogo'
--

--
-- Dumping routines for database 'catalogo'
--
/*!50003 DROP PROCEDURE IF EXISTS `accettazione_recensione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `accettazione_recensione`(in IDRec integer, mailMod varchar(63))
begin
if(select tipo = 'moderatore' from utente where mailMod = mail)
then
insert into moderatorer (IDRecensioneDaAccettare, approvato , mailModeratoreCheAccetta,tipoOperazione)  value (IDRec, 'accettata', mailMod, 'inserimento');
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `calcolo_numerolike` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `calcolo_numerolike`(in nwpISBN char(13))
begin
select n°miPiace from pubblicazione where ISBN = nwpISBN;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cambio_di_stato` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cambio_di_stato`(in newMail varchar(63), mailOperatore varchar(63))
begin 
if(select mail from utente where mail = mailOperatore and tipo = "moderatore") is not null
then
if(select stato = 'passivo' from utente where mail = newMail )
   then 
   update utente
   set stato = "attivo"
   where newMail = mail;
else
   update utente
   set stato = "passivo"
   where newMail = mail; 
end if;
else
signal sqlstate '45000'
set message_text = "the state of user cannot be modify by another final user";
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delOfLikeOperation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delOfLikeOperation`(in PubblReferred varchar(13), deleter varchar(63))
begin
	if (select refPubblicazione from mipiace where refPubblicazione = PubblReferred and refUtente = deleter) is null
    then
		signal sqlstate '45000'
        set message_text = "Not exist a like to the publication passed by the user passed";
    else
			delete from mipiace where refPubblicazione = PubblReferred and refUtente = deleter;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delOfPubblOperation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delOfPubblOperation`(in ISBNPubblToMod varchar(13), deleter varchar(63))
begin
	if (select ISBN from pubblicazione where ISBN = ISBNPubblToMod) is null
    then
		signal sqlstate '45000'
        set message_text = "Not exist a publication with the ID passed";
    else
		if (select ISBN from pubblicazione, utente where ISBN = ISBNPubblToMod and deleter = mail and tipo = "moderatore" )
			then
			delete from pubblicazione where ISBN = ISBNPubblToMod;
		else
			signal sqlstate '45000'
			set message_text = "the users who try to delete the pubbliation is not a moderator";
		end if;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delOfRecOperation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delOfRecOperation`(in IDRecToMod int, deleter varchar(63))
begin
	if (select IDRecensione from recensione where IDRecensione = IDRecToMod) is null
    then
		signal sqlstate '45000'
        set message_text = "Not exist a review with the ID passed";
    else
		if (select IDRecensione from recensione where IDRecensione = IDRecToMod and refUtente = deleter)
			then
			delete from recensione where IDRecensione = IDRecToMod;
		else
			signal sqlstate '45000'
			set message_text = "the users who try to delete the review is not the same who insert him";
		end if;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `estrazionePU` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `estrazionePU`(in mailEPU varchar(63))
select titolo from utente join pubblicazione where (mailEPU = mail) && utente.mail = pubblicazione.commituser order by titolo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `estrazione_byautore` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `estrazione_byautore`(in aISBN char(13))
select titolo, autore from pubblicazione , autori where ISBN = (select refPubblicazione where autore = (select autore from Autori  where aISBN = refPubblicazione)) group by refPubblicazione ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `estrazione_byISBN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `estrazione_byISBN`(in eISBN char(13))
select titolo , group_concat(distinct autore) as ListaAutori,editore,lingua,dataPubblicazione,n°pagine,group_concat(distinct chiave) as Chiavi ,disponibilitàDownload,n°mipiace,approvazione , max(Nristampa) as NumeroTotaleRistampe ,group_concat(distinct data_ristampa) as DataVarieRistampe from pubblicazione join chiavi join ristampa join Autori  where eISBN = ISBN && eISBN = ristampa.refPubblicazione && eISBN = Autori.refPubblicazione && eISBN = chiavi.refPubblicazione group by ISBN ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `estrazione_catalogo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `estrazione_catalogo`()
begin
select titolo,group_concat(autore) as ListaAutori,editore,dataPubblicazione from pubblicazione join Autori where ISBN = refPubblicazione group by ISBN order by titolo;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `estrazione_log_pubblicazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `estrazione_log_pubblicazione`(in newISBN char(13))
select IDStorico , time_stamp , descrizione, refUtente from Storico where refPubblicazione = newISBN ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `estrazione_pubblicazione_ultimaristampa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `estrazione_pubblicazione_ultimaristampa`()
select ISBN , titolo , max(data_ristampa) from pubblicazione join ristampa where ISBN = refPubblicazione group by refPubblicazione ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `estrazione_pubblicazioni_aggiornate_30giorni` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `estrazione_pubblicazioni_aggiornate_30giorni`()
begin
select titolo , ISBN from Storico join Pubblicazione where ISBN = refPubblicazione && time_stamp > date_sub(now(),interval 30 day);

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `estrazione_pubblicazioni_approvate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `estrazione_pubblicazioni_approvate`()
select titolo,ISBN from pubblicazione where approvazione = 'accettata' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `estrazione_pubblicazioni_nonapprovate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `estrazione_pubblicazioni_nonapprovate`()
select titolo,ISBN from pubblicazione where approvazione = 'in attesa' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `estrazione_recensioni_approvate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `estrazione_recensioni_approvate`(in pISBN char(13))
begin
   select IDRecensione , testo from recensione where approvazione = 'accettata' && refPubblicazione = pISBN ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `estrazione_recensioni_inattesa` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `estrazione_recensioni_inattesa`()
begin
   select IDRecensione , testo from recensione where approvazione = 'in attesa';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `estrazione_ultime10_pubblicazioni_inserite` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `estrazione_ultime10_pubblicazioni_inserite`()
select titolo, ISBN from Storico join Pubblicazione where ISBN = refPubblicazione && descrizione like '%inserimento della pubblicazione%' &&  time_stamp order by time_stamp desc limit 10 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserimento_mipiace` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserimento_mipiace`(in newISBN char(13) , newmail varchar(63))
insert into mipiace(dataMiPiace,refPubblicazione,refUtente) value (current_timestamp(),newISBN,newmail) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `inserimento_recensione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `inserimento_recensione`(in newtesto varchar(511), newISBN char(13), newUtente varchar(63))
insert into recensione (testo,dataRecensione,refPubblicazione,refUtente) value (newtesto,current_timestamp(),newISBN,newUtente) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modOfRecOperation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modOfRecOperation`(in IDRecToMod int, newTesto varchar(511), modifier varchar(63))
begin
	if (select IDRecensione from recensione where IDRecensione = IDRecToMod) is null
    then
		signal sqlstate '45000'
        set message_text = "Not exist a review with the ID passed";
    else
		if (select IDRecensione from recensione where IDRecensione = IDRecToMod and refUtente = modifier)
			then
			update recensione set testo = newTesto where IDRecensione = IDRecToMod;
		else
			signal sqlstate '45000'
			set message_text = "the users who try to modify the review is not the same who insert him";
		end if;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pubblizazione_bydownload` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pubblizazione_bydownload`()
select titolo from pubblicazione where disponibilitàDownload = true ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ricerca_pubblicazione` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ricerca_pubblicazione`(in Parola varchar(63))
begin 
select ISBN,titolo,autore from pubblicazione join Autori join Chiavi where ISBN = Autori.refPubblicazione && ISBN = Chiavi.refPubblicazione && ( Parola = autore || Parola = chiave || Parola = titolo || Parola = ISBN ) group by ISBN;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `utenti_collaborativi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `utenti_collaborativi`()
select mail from utente where collaborazione = true ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-18 17:27:13
