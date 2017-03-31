-- MySQL dump 10.13  Distrib 5.6.11, for Win32 (x86)
--
-- Host: localhost    Database: board
-- ------------------------------------------------------
-- Server version	5.6.11

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
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (1,'本社'),(2,'支店A'),(3,'支店B'),(4,'支店C');
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(500) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'test',5,0,'2017-03-03 01:17:06','0000-00-00 00:00:00'),(2,'テステス',5,0,'2017-03-03 02:48:45','0000-00-00 00:00:00'),(3,'ﾃｽﾃｽ',5,0,'2017-03-03 04:53:12','0000-00-00 00:00:00'),(4,'てーす',5,1,'2017-03-03 05:07:06','0000-00-00 00:00:00'),(5,'テストコメ',5,1,'2017-03-03 05:08:31','0000-00-00 00:00:00'),(6,'３ｑ４ｔｑｇｗ３４',5,1,'2017-03-03 05:10:02','0000-00-00 00:00:00'),(7,'tesuto',5,0,'2017-03-03 05:24:48','0000-00-00 00:00:00'),(8,'テスト',5,0,'2017-03-03 05:28:21','0000-00-00 00:00:00'),(9,'あいうえお',5,0,'2017-03-03 07:25:53','0000-00-00 00:00:00'),(10,'テスト',5,0,'2017-03-03 08:12:44','0000-00-00 00:00:00'),(11,'あｓｆｓ',5,0,'2017-03-03 08:16:13','0000-00-00 00:00:00'),(12,'あいうれお',5,0,'2017-03-03 08:17:09','0000-00-00 00:00:00'),(13,'あいうえ',5,0,'2017-03-03 08:17:25','0000-00-00 00:00:00'),(14,'あｓｄｆ',5,0,'2017-03-03 08:18:30','0000-00-00 00:00:00'),(15,'test',5,3,'2017-03-03 09:04:31','0000-00-00 00:00:00'),(16,'test',5,8,'2017-03-03 09:05:04','0000-00-00 00:00:00'),(17,'テスト４',5,9,'2017-03-08 05:40:38','0000-00-00 00:00:00'),(18,'未ログインテスト',6,9,'2017-03-13 01:09:56','0000-00-00 00:00:00'),(19,'test',6,9,'2017-03-13 07:11:56','0000-00-00 00:00:00'),(20,'asd',8,9,'2017-03-14 02:35:56','0000-00-00 00:00:00'),(21,'asd',8,9,'2017-03-14 02:35:56','0000-00-00 00:00:00'),(22,'投稿者:かわしま\r\n件名:テスト１\r\nカテゴリ:テスト２\r\n本文\r\nテスト３\r\n2017/03/08 14:40:26\r\n投稿者:かわしま\r\n本文\r\nテスト４\r\n2017/03/08 14:40:38',6,9,'2017-03-14 08:07:39','0000-00-00 00:00:00'),(23,'投稿者:かわしま\r\n件名:テスト１\r\nカテゴリ:テスト２\r\n本文\r\nテスト３\r\n2017/03/08 14:40:26\r\n投稿者:かわしま\r\n本文\r\nテスト４\r\n2017/03/08 14:40:38',6,9,'2017-03-14 08:07:54','0000-00-00 00:00:00'),(24,'投稿者:かわしま 件名:テスト１ カテゴリ:テスト２ 本文 テスト３ 2017/03/08 14:40:26 投稿者:かわしま 本文 テスト４ 2017/03/08 14:40:38\r\n投稿者:かわしま 件名:テスト１ カテゴリ:テスト２ 本文 テスト３ 2017/03/08 14:40:26 投稿者:かわしま 本文 テスト４ 2017/03/08 14:40:38\r\n投稿者:かわしま 件名:テスト１ カテゴリ:テスト２ 本文 テスト３ 2017/03/08 14:40:26 投稿者:かわしま 本文 テスト４ 2017/03/08 14:40:38\r\n投稿者:かわしま 件名:テスト１ カテゴリ:テスト２ 本文 テスト３ 2017/03/08 14:40:26 投稿者:かわしま 本文 テスト４ 2017/03/08 14:40:38\r\n',6,9,'2017-03-14 08:08:07','0000-00-00 00:00:00'),(25,'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll',16,13,'2017-03-16 01:41:20','0000-00-00 00:00:00'),(26,'lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll\r\nlllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll',16,13,'2017-03-16 01:42:01','0000-00-00 00:00:00'),(28,'sedrftgyuhji',15,17,'2017-03-21 02:02:26','0000-00-00 00:00:00'),(33,'awertyu78i9',31,17,'2017-03-21 03:24:12','0000-00-00 00:00:00'),(34,'ああああああああああああああああ',31,17,'2017-03-22 02:00:37','0000-00-00 00:00:00'),(35,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',31,25,'2017-03-23 04:15:28','0000-00-00 00:00:00'),(36,'了解です。',15,27,'2017-03-24 02:18:06','0000-00-00 00:00:00'),(37,'かしこまりました。',22,27,'2017-03-24 02:18:49','0000-00-00 00:00:00'),(39,'かしこまり！',17,27,'2017-03-24 02:19:55','0000-00-00 00:00:00'),(40,'かしこま！',18,27,'2017-03-24 02:20:21','0000-00-00 00:00:00'),(41,'りょ',23,27,'2017-03-24 02:20:42','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'総務人事担当者'),(2,'情報管理担当者'),(3,'店長'),(4,'社員');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `managements`
--

DROP TABLE IF EXISTS `managements`;
/*!50001 DROP VIEW IF EXISTS `managements`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `managements` (
  `id` tinyint NOT NULL,
  `account` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `password` tinyint NOT NULL,
  `branch_id` tinyint NOT NULL,
  `department_id` tinyint NOT NULL,
  `branch_name` tinyint NOT NULL,
  `department_name` tinyint NOT NULL,
  `is_stoped` tinyint NOT NULL,
  `created_at` tinyint NOT NULL,
  `updated_at` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(50) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `category` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (11,'こんにちわ','こんにちわ','挨拶',14,'2017-03-15 05:30:18','0000-00-00 00:00:00'),(12,'こんにちわ','こんにちわ','挨拶',14,'2017-03-15 05:31:19','0000-00-00 00:00:00'),(17,'削除用','投稿削除','削除',17,'2017-03-16 02:08:06','0000-00-00 00:00:00'),(18,'値の保持','値の保持','テスト',0,'2017-03-17 01:35:04','0000-00-00 00:00:00'),(19,'値の保持','値の保持','テスト',0,'2017-03-17 01:35:19','0000-00-00 00:00:00'),(20,'値の保持','値の保持','テスト',14,'2017-03-17 01:35:53','0000-00-00 00:00:00'),(21,'test','てすと','テスト',14,'2017-03-17 02:57:11','0000-00-00 00:00:00'),(23,'あｓｄｆｇｈ','くぇｒとぇｒ','くぇｒ',31,'2017-03-21 02:49:04','0000-00-00 00:00:00'),(24,'ｓｄｆｇｈｊんｍｋ','くぇｒちゅいうｙｔれｗくぇｄｒｆｔｇｙｈ','くぁｗｓｒｔｇｙふｊ',31,'2017-03-21 04:15:41','0000-00-00 00:00:00'),(25,'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii','iiiiiiiiiiiiii\r\niiiiiiiiiiiiii\r\niiiiiiiiiiiiii\r\niiiiiiiiiiiiii\r\n\r\n\r\niiiiiiiiiiiiii\r\niiiiiiiiiiiiii\r\n','test',31,'2017-03-22 07:20:04','0000-00-00 00:00:00'),(26,'改行','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\r\naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','改行',31,'2017-03-23 04:17:44','0000-00-00 00:00:00'),(27,'お願い','皆様\r\nお疲れ様です。\r\n野球部よりお願いです！\r\n\r\n現在、部活のコートや施設は民間施設を利用してますが、\r\n東京都管轄のスポーツ施設を使うと大幅にコストを抑えることができます。\r\nただそのためにはかなり厳しい抽選に受かる必要が御座います。\r\n\r\nそこで皆様にも利用者登録して頂き、当選確率を上げたいと思っております。\r\n\r\n利用者登録は20ページ、21ページに記載のある公園の管理事務所で利用者登録カードを作成できます。\r\n※平日、土日祝日問わず、公園の管理事務所で登録できることを確認しました。\r\n※申込書書いて、身分証明書見せるだけのたった5分で作れます。\r\n\r\n【抽選～当選の流れ】\r\n・毎月1~10日に応募\r\n・14日に発表\r\n上記の流れが毎月ありまして応募は全て私が行います。\r\n利用者登録された方は、下記私のアドレスへご連絡頂けますと幸いです。\r\nt_osaki@ic-com.co.jp\r\n\r\n何卒何卒宜しくお願い致します。\r\nすでに利用者登録されている方がいらっしゃいましたら\r\nぜひ教えて頂けますと幸いです！！\r\n\r\n※ちなみに先月4名で抽選に申し込み全員落ちました！\r\n\r\n以上、よろしくお願い致します。','お願い',31,'2017-03-24 02:17:14','0000-00-00 00:00:00'),(29,'あいうえお','あいうえお','あいうえお',18,'2017-03-24 04:46:15','0000-00-00 00:00:00'),(30,'あいうえお','さしすせそ','かきくけこ',31,'2017-03-24 05:10:53','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(10) NOT NULL,
  `branch_id` int(30) NOT NULL,
  `department_id` int(30) NOT NULL,
  `is_stoped` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (15,'admin2','HBQrLQGqNOmja95IBkWlf9aeFBVdrPq1o_kle3f9yNg','本社情報管理部',1,2,0,'2017-03-21 00:22:58','2017-03-15 04:36:17'),(17,'admin4','EQGYgxpCaAe8zZ299Utty1KYvF0xrEkGnguj0hDZcK4','支店A社員',3,3,0,'2017-03-24 05:18:32','2017-03-15 04:37:22'),(18,'admin5','abVAZTjFwJWAzswMe6-_P5YCZ_-nR46J2DUtqBRSnLc','支店B店長',3,3,0,'2017-03-17 05:14:11','2017-03-15 04:37:55'),(20,'admin7','peNUg_F0XA9PPelQhh1qrtSIwl2n00Kogno_x7DnMYY','支店C店長',4,3,0,'2017-03-17 05:14:30','2017-03-15 04:38:58'),(21,'admin8','1SCSZxtBQf1dkoHQsD02RBKLGFtCQ8NzP9BHBab_4cU','支店C社員',4,4,0,'2017-03-22 07:21:29','2017-03-15 04:39:26'),(22,'admin3','T8K1ZzogGtmx_APcs0bhuq1ENR2qBQPVU0tN_cxDMuA','支店A店長',1,1,0,'2017-03-24 05:20:16','2017-03-16 06:21:20'),(23,'admin6','0y_VMBGbFJvcPx7Rl7rvrEGEKNNJ66L6mDr7P6X7YNI','支店B社員',3,4,0,'2017-03-17 05:14:21','2017-03-16 09:12:50'),(24,'kawashi','FUH2zlw3dfoCUxMGqslFw0-iNgEmU9gDvIHSIWXKnv0','kawashi',0,0,0,'2017-03-17 02:03:34','2017-03-17 02:03:34'),(31,'admin1','JfQ7FIatlaE5jj7rPYO8QBABX8yb7bNbQy4AKY1QIfc','本社人事総務部',1,1,0,'2017-03-22 07:38:11','2017-03-17 10:45:21'),(35,'admin1111','b7hniPOOY0EfHJXBDkacx91ysH4h0TnkTXJpdRwJOhw','admin1111',1,1,0,'2017-03-24 05:21:54','2017-03-24 05:21:54');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `users_comments`
--

DROP TABLE IF EXISTS `users_comments`;
/*!50001 DROP VIEW IF EXISTS `users_comments`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `users_comments` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `text` tinyint NOT NULL,
  `account` tinyint NOT NULL,
  `branch_id` tinyint NOT NULL,
  `department_id` tinyint NOT NULL,
  `message_id` tinyint NOT NULL,
  `is_stoped` tinyint NOT NULL,
  `created_at` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `users_messages`
--

DROP TABLE IF EXISTS `users_messages`;
/*!50001 DROP VIEW IF EXISTS `users_messages`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `users_messages` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `subject` tinyint NOT NULL,
  `text` tinyint NOT NULL,
  `category` tinyint NOT NULL,
  `account` tinyint NOT NULL,
  `branch_id` tinyint NOT NULL,
  `department_id` tinyint NOT NULL,
  `is_stoped` tinyint NOT NULL,
  `created_at` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `managements`
--

/*!50001 DROP TABLE IF EXISTS `managements`*/;
/*!50001 DROP VIEW IF EXISTS `managements`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `managements` AS select `users`.`id` AS `id`,`users`.`account` AS `account`,`users`.`name` AS `name`,`users`.`password` AS `password`,`users`.`branch_id` AS `branch_id`,`users`.`department_id` AS `department_id`,`branches`.`name` AS `branch_name`,`departments`.`name` AS `department_name`,`users`.`is_stoped` AS `is_stoped`,`users`.`created_at` AS `created_at`,`users`.`updated_at` AS `updated_at` from ((`users` join `branches`) join `departments`) where ((`branches`.`id` = `users`.`branch_id`) and (`departments`.`id` = `users`.`department_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_comments`
--

/*!50001 DROP TABLE IF EXISTS `users_comments`*/;
/*!50001 DROP VIEW IF EXISTS `users_comments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_comments` AS select `comments`.`id` AS `id`,`comments`.`user_id` AS `user_id`,`users`.`name` AS `name`,`comments`.`text` AS `text`,`users`.`account` AS `account`,`users`.`branch_id` AS `branch_id`,`users`.`department_id` AS `department_id`,`comments`.`message_id` AS `message_id`,`users`.`is_stoped` AS `is_stoped`,`comments`.`created_at` AS `created_at` from (`users` join `comments`) where (`users`.`id` = `comments`.`user_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_messages`
--

/*!50001 DROP TABLE IF EXISTS `users_messages`*/;
/*!50001 DROP VIEW IF EXISTS `users_messages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_messages` AS select `messages`.`id` AS `id`,`messages`.`user_id` AS `user_id`,`users`.`name` AS `name`,`messages`.`subject` AS `subject`,`messages`.`text` AS `text`,`messages`.`category` AS `category`,`users`.`account` AS `account`,`users`.`branch_id` AS `branch_id`,`users`.`department_id` AS `department_id`,`users`.`is_stoped` AS `is_stoped`,`messages`.`created_at` AS `created_at` from (`users` join `messages`) where (`users`.`id` = `messages`.`user_id`) */;
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

-- Dump completed on 2017-03-31 17:43:49
