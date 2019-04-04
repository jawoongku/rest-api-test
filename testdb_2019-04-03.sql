# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 13.125.207.133 (MySQL 5.7.25)
# Database: testdb
# Generation Time: 2019-04-03 14:21:01 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `members`;

CREATE TABLE `members` (
  `idx` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '키',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '이메일',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '비밀번호',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '이름',
  `tel` varchar(13) NOT NULL DEFAULT '' COMMENT '전화번호',
  `rcmd_code` varchar(255) NOT NULL COMMENT '추천코드',
  `marketing` enum('Y','N') DEFAULT 'N' COMMENT '마켓팅 동의 Y,N',
  PRIMARY KEY (`idx`),
  KEY `id` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원';

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;

INSERT INTO `members` (`idx`, `email`, `password`, `name`, `tel`, `rcmd_code`, `marketing`)
VALUES
	(1,'0@email.com','0password','0name','0123123123','0rcmd_code','N'),
	(2,'1@email.com','1password','1name','1123123123','1rcmd_code','N'),
	(3,'2@email.com','2password','2name','2123123123','2rcmd_code','Y'),
	(4,'3@email.com','3password','3name','3123123123','3rcmd_code','Y'),
	(5,'4@email.com','4password','4name','4123123123','4rcmd_code','N'),
	(6,'5@email.com','5password','5name','5123123123','5rcmd_code','Y'),
	(7,'6@email.com','6password','6name','6123123123','6rcmd_code','Y'),
	(8,'7@email.com','7password','7name','7123123123','7rcmd_code','Y'),
	(9,'8@email.com','8password','8name','8123123123','8rcmd_code','Y'),
	(10,'9@email.com','9password','9name','9123123123','9rcmd_code','N'),
	(11,'10@email.com','10password','10name','10123123123','10rcmd_code','Y'),
	(12,'11@email.com','11password','11name','11123123123','11rcmd_code','Y'),
	(13,'12@email.com','12password','12name','12123123123','12rcmd_code','Y'),
	(14,'13@email.com','13password','13name','13123123123','13rcmd_code','Y'),
	(15,'14@email.com','14password','14name','14123123123','14rcmd_code','N'),
	(16,'15@email.com','15password','15name','15123123123','15rcmd_code','Y'),
	(17,'16@email.com','16password','16name','16123123123','16rcmd_code','N'),
	(18,'17@email.com','17password','17name','17123123123','17rcmd_code','Y'),
	(19,'18@email.com','18password','18name','18123123123','18rcmd_code','N'),
	(20,'19@email.com','19password','19name','19123123123','19rcmd_code','Y'),
	(21,'20@email.com','20password','20name','20123123123','20rcmd_code','Y'),
	(22,'21@email.com','21password','21name','21123123123','21rcmd_code','N'),
	(23,'22@email.com','22password','22name','22123123123','22rcmd_code','Y'),
	(24,'23@email.com','23password','23name','23123123123','23rcmd_code','Y'),
	(25,'24@email.com','24password','24name','24123123123','24rcmd_code','Y'),
	(26,'25@email.com','25password','25name','25123123123','25rcmd_code','Y'),
	(27,'26@email.com','26password','26name','26123123123','26rcmd_code','N'),
	(28,'27@email.com','27password','27name','27123123123','27rcmd_code','Y'),
	(29,'28@email.com','28password','28name','28123123123','28rcmd_code','N'),
	(30,'29@email.com','29password','29name','29123123123','29rcmd_code','N'),
	(31,'30@email.com','30password','30name','30123123123','30rcmd_code','N'),
	(32,'31@email.com','31password','31name','31123123123','31rcmd_code','N'),
	(33,'32@email.com','32password','32name','32123123123','32rcmd_code','N'),
	(34,'33@email.com','33password','33name','33123123123','33rcmd_code','Y'),
	(35,'34@email.com','34password','34name','34123123123','34rcmd_code','Y'),
	(36,'35@email.com','35password','35name','35123123123','35rcmd_code','Y'),
	(37,'36@email.com','36password','36name','36123123123','36rcmd_code','N'),
	(38,'37@email.com','37password','37name','37123123123','37rcmd_code','N'),
	(39,'38@email.com','38password','38name','38123123123','38rcmd_code','Y'),
	(40,'39@email.com','39password','39name','39123123123','39rcmd_code','N'),
	(41,'40@email.com','40password','40name','40123123123','40rcmd_code','Y'),
	(42,'41@email.com','41password','41name','41123123123','41rcmd_code','N'),
	(43,'42@email.com','42password','42name','42123123123','42rcmd_code','N'),
	(44,'43@email.com','43password','43name','43123123123','43rcmd_code','Y'),
	(45,'44@email.com','44password','44name','44123123123','44rcmd_code','N'),
	(46,'45@email.com','45password','45name','45123123123','45rcmd_code','Y'),
	(47,'46@email.com','46password','46name','46123123123','46rcmd_code','Y'),
	(48,'47@email.com','47password','47name','47123123123','47rcmd_code','Y'),
	(49,'48@email.com','48password','48name','48123123123','48rcmd_code','N'),
	(50,'49@email.com','49password','49name','49123123123','49rcmd_code','Y'),
	(51,'50@email.com','50password','50name','50123123123','50rcmd_code','N'),
	(52,'51@email.com','51password','51name','51123123123','51rcmd_code','Y'),
	(53,'52@email.com','52password','52name','52123123123','52rcmd_code','Y'),
	(54,'53@email.com','53password','53name','53123123123','53rcmd_code','Y'),
	(55,'54@email.com','54password','54name','54123123123','54rcmd_code','Y'),
	(56,'55@email.com','55password','55name','55123123123','55rcmd_code','Y'),
	(57,'56@email.com','56password','56name','56123123123','56rcmd_code','Y'),
	(58,'57@email.com','57password','57name','57123123123','57rcmd_code','N'),
	(59,'58@email.com','58password','58name','58123123123','58rcmd_code','Y'),
	(60,'59@email.com','59password','59name','59123123123','59rcmd_code','N'),
	(61,'60@email.com','60password','60name','60123123123','60rcmd_code','N'),
	(62,'61@email.com','61password','61name','61123123123','61rcmd_code','N'),
	(63,'62@email.com','62password','62name','62123123123','62rcmd_code','Y'),
	(64,'63@email.com','63password','63name','63123123123','63rcmd_code','N'),
	(65,'64@email.com','64password','64name','64123123123','64rcmd_code','N'),
	(66,'65@email.com','65password','65name','65123123123','65rcmd_code','N'),
	(67,'66@email.com','66password','66name','66123123123','66rcmd_code','Y'),
	(68,'67@email.com','67password','67name','67123123123','67rcmd_code','Y'),
	(69,'68@email.com','68password','68name','68123123123','68rcmd_code','N'),
	(70,'69@email.com','69password','69name','69123123123','69rcmd_code','N'),
	(71,'70@email.com','70password','70name','70123123123','70rcmd_code','Y'),
	(72,'71@email.com','71password','71name','71123123123','71rcmd_code','N'),
	(73,'72@email.com','72password','72name','72123123123','72rcmd_code','Y'),
	(74,'73@email.com','73password','73name','73123123123','73rcmd_code','N'),
	(75,'74@email.com','74password','74name','74123123123','74rcmd_code','N'),
	(76,'75@email.com','75password','75name','75123123123','75rcmd_code','Y'),
	(77,'76@email.com','76password','76name','76123123123','76rcmd_code','N'),
	(78,'77@email.com','77password','77name','77123123123','77rcmd_code','N'),
	(79,'78@email.com','78password','78name','78123123123','78rcmd_code','N'),
	(80,'79@email.com','79password','79name','79123123123','79rcmd_code','N'),
	(81,'80@email.com','80password','80name','80123123123','80rcmd_code','Y'),
	(82,'81@email.com','81password','81name','81123123123','81rcmd_code','N'),
	(83,'82@email.com','82password','82name','82123123123','82rcmd_code','N'),
	(84,'83@email.com','83password','83name','83123123123','83rcmd_code','N'),
	(85,'84@email.com','84password','84name','84123123123','84rcmd_code','N'),
	(86,'85@email.com','85password','85name','85123123123','85rcmd_code','N'),
	(87,'86@email.com','86password','86name','86123123123','86rcmd_code','Y'),
	(88,'87@email.com','87password','87name','87123123123','87rcmd_code','Y'),
	(89,'88@email.com','88password','88name','88123123123','88rcmd_code','N'),
	(90,'89@email.com','89password','89name','89123123123','89rcmd_code','Y'),
	(91,'90@email.com','90password','90name','90123123123','90rcmd_code','Y'),
	(92,'91@email.com','91password','91name','91123123123','91rcmd_code','N'),
	(93,'92@email.com','92password','92name','92123123123','92rcmd_code','Y'),
	(94,'93@email.com','93password','93name','93123123123','93rcmd_code','Y'),
	(95,'94@email.com','94password','94name','94123123123','94rcmd_code','Y'),
	(96,'95@email.com','95password','95name','95123123123','95rcmd_code','N'),
	(97,'96@email.com','96password','96name','96123123123','96rcmd_code','N'),
	(98,'97@email.com','97password','97name','97123123123','97rcmd_code','N'),
	(99,'98@email.com','98password','98name','98123123123','98rcmd_code','N'),
	(100,'99@email.com','99password','99name','99123123123','99rcmd_code','Y');

/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
