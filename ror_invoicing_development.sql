-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: ror_invoicing_development
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

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
-- Table structure for table `access_levels`
--

DROP TABLE IF EXISTS `access_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_levels` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_levels`
--

LOCK TABLES `access_levels` WRITE;
/*!40000 ALTER TABLE `access_levels` DISABLE KEYS */;
INSERT INTO `access_levels` VALUES (1,'admin','Administrator Privileges','2021-01-12 20:25:08.505747','2021-01-12 20:37:47.486298'),(2,'guest','Limited Viewing Privileges','2021-01-12 20:25:24.689950','2021-01-12 20:38:17.317275'),(3,'client','Client Privileges','2021-01-12 20:25:29.410197','2021-01-12 20:38:31.582644');
/*!40000 ALTER TABLE `access_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2021-01-11 16:03:30.156293','2021-01-11 16:03:30.156293');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid_statuses`
--

DROP TABLE IF EXISTS `bid_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid_statuses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid_statuses`
--

LOCK TABLES `bid_statuses` WRITE;
/*!40000 ALTER TABLE `bid_statuses` DISABLE KEYS */;
INSERT INTO `bid_statuses` VALUES (1,'waiting','2021-01-12 20:52:49.861664','2021-01-12 20:53:28.395061'),(2,'approved','2021-01-12 20:52:57.991360','2021-01-12 20:52:57.991360'),(3,'denied','2021-01-12 20:53:04.547317','2021-01-12 20:53:04.547317'),(4,'expired','2021-01-12 20:53:10.415043','2021-01-12 20:53:10.415043');
/*!40000 ALTER TABLE `bid_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bids`
--

DROP TABLE IF EXISTS `bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bids` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company_id` bigint NOT NULL,
  `project_site_id` bigint NOT NULL,
  `sku_id` bigint NOT NULL,
  `bid_status_id` bigint NOT NULL,
  `bid_date` date DEFAULT NULL,
  `description` text,
  `amount` decimal(8,2) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bids_on_company_id` (`company_id`),
  KEY `index_bids_on_project_site_id` (`project_site_id`),
  KEY `index_bids_on_sku_id` (`sku_id`),
  KEY `index_bids_on_bid_status_id` (`bid_status_id`),
  CONSTRAINT `fk_rails_66f9a08f29` FOREIGN KEY (`sku_id`) REFERENCES `skus` (`id`),
  CONSTRAINT `fk_rails_8551aefa6c` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_e59275b161` FOREIGN KEY (`project_site_id`) REFERENCES `project_sites` (`id`),
  CONSTRAINT `fk_rails_f20131fab1` FOREIGN KEY (`bid_status_id`) REFERENCES `bid_statuses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bids`
--

LOCK TABLES `bids` WRITE;
/*!40000 ALTER TABLE `bids` DISABLE KEYS */;
INSERT INTO `bids` VALUES (1,1,5,5,2,'2010-10-23','Removal & Re-Installation of New Vinyl Window<br>\r\nRepair/Patch Misc. Drywall Patches (hallway & A/C unit hole)<br>\r\nRepair/Patch on Exterior (from the removed A/C unit)',800.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(2,1,26,3,2,'2010-12-07','<p>Remove garbage inside and outside of commercial structure.</p>',675.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(5,1,4,6,2,'2011-01-04','<p>Snow Shovel</p>',50.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(6,1,28,6,2,'2011-01-04','<p>Snow Shovel</p>',50.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(7,1,27,7,3,'2011-01-03','<p>Build and Install Railing for South &amp; East Decking</p>',450.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(8,1,27,7,2,'2011-01-06','<p>Install a straight/simple deck railing (east side of the deck) on the south side of the house, and install an L-shaped deck railing on the east side of the house.&nbsp; Deck height&nbsp; is above 30&quot;, and requires a 36&quot; railing.&nbsp; Both decks will be stained and weatherproofed with matching color to deck as well as matching design to the west deck &amp; railing.</p>',875.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(9,1,29,7,2,'2011-02-14','<p>- Install 3\' x 3\' Landing (anchored into concrete wall), attached to upper stairs</p>\r\n<p>- Install Stairs (3 steps) from the Landing to Floor</p>\r\n<p>- Install Posts and Railing System with Ballisters (spacing of 4&quot; apart)</p>',1700.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(10,1,29,7,3,'2011-02-22','<p>Cover and secure Hot Tub</p>',400.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(11,1,29,7,3,'2011-02-22','<p>Install Railing System (both sides) to Porch (closest to left Garage).&nbsp;</p>\r\n<p>Railing consists of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n    <li>Top &amp; Bottom Rail</li>\r\n    <li>Balusters (no more than 4&quot; gaps).</li>\r\n</ul>',930.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(12,1,29,7,2,'2011-03-22','<p>Install Railing System (one side) to Porch (closest to left Garage).&nbsp;</p>\r\n<p>Railing consists of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n    <li>Cap, Top &amp; Middle Rail</li>\r\n</ul>\r\n<p>&nbsp;</p>',415.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(13,1,31,3,2,'2011-03-30','<p>Remove debris/waste from property</p>',300.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(14,1,31,7,2,'2011-04-18','<p>Install railing system to downstairs basement.</p>',125.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(15,1,29,7,2,'2011-05-04','<p>Install Railing System (remaining side) to Porch (closest to left Garage).&nbsp;</p>\r\n<p>Railing consists of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n    <li>Cap, Top &amp; Middle Rail</li>\r\n</ul>',415.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(16,1,29,7,2,'2011-05-04','<p>Install Railing System (both sides) to Porch (front of house).&nbsp;</p>\r\n<p>Railing consists of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n    <li>Cap, Top &amp; Middle Rail</li>\r\n</ul>',355.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(17,1,33,7,3,'2011-05-04','<p>Install railing (single sided) on back porch</p>\r\n<p>Railing consists of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n    <li>Top Railing</li>\r\n    <li>Aluminum 1 1/2&quot;&nbsp; Piping with Galvanized (Schedule 40) Steel fittings</li>\r\n    <li>Anchored into Concrete</li>\r\n</ul>',995.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(18,1,33,7,2,'2011-05-06','<p>Install Rail System (anchored into the concrete steps) on both sides of back porch</p>\r\n<p>Railing System consists of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n    <li>Top &amp; Middle Rail, and Cap</li>\r\n</ul>',500.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(19,1,33,7,2,'2011-05-06','<p>Rebuild 2nd Bedroom</p>\r\n<ul>\r\n    <li>Reframe in bedroom wall, closet, and hallway closet</li>\r\n    <li>Re-wire bedroom light switch and outlet</li>\r\n    <li>Drywall open walls</li>\r\n    <li>Install Bedroom door, and bypass closet doors</li>\r\n    <li>Install Base/Trim, Door Casing, and Closet cleats &amp; dowels</li>\r\n    <li>Primer and Paint (White) Bedroom</li>\r\n</ul>\r\n<p>*Due to having a load-bearing wall being removed by previous owner, ceiling structure is sagging and needs to be jacked up to reinstall new load-bearing wall.</p>',4965.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(20,1,35,7,2,'2011-05-09','<p>Install Rail System (anchored into the concrete steps) on one side of back porch</p>\r\n<p>Railing System consists of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n    <li>Top &amp; Middle Rail, and Cap</li>\r\n<li>Anchored into Concrete</li>\r\n</ul>',300.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(21,1,30,7,2,'2011-05-13','<p>Install Rail System (also install extension on sides) on both sides of front porch.</p>\r\n<p>Install and configure 2 smoke detectors.</p>\r\n<p>Railing System consists of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n    <li>Top &amp; Middle Rail, and Cap</li>\r\n</ul>\r\n<p>Extension (connecting stair to main landing railing) consists of:</p>\r\n<ul>\r\n    <li>Top and Bottom Rails</li>\r\n    <li>Supporting Balluster</li>\r\n</ul>\r\n<p>Smoke detectors are Photoelectric &amp; Ionization (Kidde PI9000)</p>',525.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(22,1,23,11,2,'2011-05-10','<p>Dining Room:</p>\r\n<ul>\r\n    <li>Remove drywall and insulation from wall &amp; ceiling to expose framing</li>\r\n</ul>\r\n<ul>\r\n    <li>Scrap framing and spray mold (Helps eliminate, clean and prevent mold)</li>\r\n</ul>\r\n<ul>\r\n    <li>Repair/Reinstall new insulation and drywall</li>\r\n</ul>\r\n<ul>\r\n    <li>Re-Texture and Primer/Paint newly installed drywall&nbsp;</li>\r\n</ul>\r\n<p>NOTE: Once walls/ceilings are exposed if additional sources are identified we<br />\r\nwill advise.</p>',600.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(23,1,23,11,2,'2011-05-10','<p>Kitchen (under sink):</p>\r\n<ul>\r\n    <li>Remove Countertop &amp; Cabinets from Wall</li>\r\n</ul>\r\n<ul>\r\n    <li>Remove effected drywall</li>\r\n</ul>\r\n<ul>\r\n    <li>Scrape and spray mold (Helps eliminate, clean and prevent mold) on Framing and the Back &amp; Bottom of Cabinets</li>\r\n</ul>\r\n<ul>\r\n    <li>Repair/Reinstall new drywall</li>\r\n</ul>\r\n<ul>\r\n    <li>Primer (using Killz primer) &amp; Paint drywall</li>\r\n</ul>\r\n<ul>\r\n    <li>Rebuild the sink cabinet\'s bottom (damaged and recommeneded to be replaced)</li>\r\n</ul>\r\n<ul>\r\n    <li>Reinstall Cabinets and Countertops</li>\r\n</ul>\r\n<p>NOTE:&nbsp; Once wall/cabinet is exposed if additional sources are identified we<br />\r\nwill advise.</p>',825.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(24,1,36,8,2,'2011-05-18','<p>Lawn Care</p>',40.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(25,1,36,8,2,'2011-05-20','<p>Lawn care maintenance consisting of mowing and trimming</p>',160.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(26,1,37,5,2,'2011-05-23','<p>Re-connect Venting to Top of Water Tank</p>',80.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(27,1,37,7,3,'2011-05-25','<p>Install Rail System on both sides of back porch.</p>\r\n<p>Railing System consists of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n    <li>Top &amp; Middle Rail, and Cap</li>\r\n</ul>',500.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(28,1,37,7,3,'2011-06-02','<p>Install Rail System (anchored into the concrete steps) on both sides of back porch</p>\r\n<p>Railing System consists of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n    <li>Top &amp; Middle Rail, and Cap</li>\r\n</ul>',500.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(29,1,39,7,3,'2011-06-03','<p>install a Simple Rail System for Basement Stairs</p>',150.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(30,1,39,7,3,'2011-06-03','<p>Install Single Railing system from Garage to Basement.&nbsp; Railing system consisting of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n</ul>\r\n<ul>\r\n    <li>Top and Middle Rail and Top Cap</li>\r\n</ul>\r\n<ul>\r\n    <li>anchored into concrete</li>\r\n</ul>',250.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(31,1,39,7,3,'2011-06-07','<p>Install Railing system (both sides) between house and driveway.&nbsp; Railing system consisting of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n</ul>\r\n<ul>\r\n    <li>Top and Middle Rail and Top Cap</li>\r\n</ul>\r\n<ul>\r\n    <li>anchored into concrete</li>\r\n</ul>\r\n<p>Note: Due to being an older residence and uneven/unlevel/unplumb concrete sides/brick stairs, posts will wedged (to be plumb) against concrete sides&nbsp; </p>\r\n<p>&nbsp;</p>',625.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(32,1,40,7,2,'2011-06-08','<p>Install Rail System on both sides of front porch/stairs</p>\r\n<p>Railing System consists of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n</ul>\r\n<ul>\r\n    <li>Top &amp; Middle Rail, and Cap</li>\r\n</ul>\r\n<ul>\r\n    <li>Posts are anchored into concrete</li>\r\n</ul>',450.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(33,1,38,7,2,'2011-06-09','<p>Install existing Railing/Banister between Living Room and Entry Way, railing for upper stairway, and install Railing system (both sides) between house and driveway.&nbsp; New railing system consisting of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n</ul>\r\n<ul>\r\n    <li>Top and Middle Rail and Top Cap</li>\r\n</ul>\r\n<ul>\r\n    <li>anchored into concrete</li>\r\n</ul>',975.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(34,1,38,5,3,'2011-06-09','<p><strong>Upstairs Bathroom</strong></p>\r\n<ul>\r\n    <li>Remove tiling &amp; drywall from bath tub area (tub surround)</li>\r\n</ul>\r\n<ul>\r\n    <li>Scrape and spray mold (helps eliminate, clean and prevent mold) on exposed framing</li>\r\n</ul>\r\n<ul>\r\n    <li>Install insulation (if needed), drywall, and new tiling</li>\r\n</ul>\r\n<ul>\r\n    <li>Re-caulk tiling/tub, primer &amp; paint the (upper) wall and ceiling</li>\r\n</ul>\r\n<p><strong>Downstairs Bathroom</strong></p>\r\n<ul>\r\n    <li>Remove remaining wallpaper, lighting fixture, and vanity mirror, and effected (moldy) drywall &amp; corners in soffit area</li>\r\n</ul>\r\n<ul>\r\n    <li>Scrape and spray mold (Helps eliminate, clean and prevent mold) on exposed framing</li>\r\n</ul>\r\n<ul>\r\n    <li>Install drywall to open areas (rebuilding soffit area)</li>\r\n</ul>\r\n<ul>\r\n    <li>Apply primer &amp; paint in bathroom</li>\r\n</ul>',1800.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(35,1,40,7,2,'2011-06-09','<p>Install Rail System on both sides of garage entryway (stairs).</p>\r\n<p>Railing System consists of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n</ul>\r\n<ul>\r\n    <li>Top &amp; Middle Rail, and Cap</li>\r\n</ul>\r\n<ul>\r\n    <li>Posts anchored into concrete</li>\r\n</ul>',450.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(36,1,29,4,3,'2011-07-07','<p>Remove the first 2-2.5\' of drywall &amp; insulation (from ground &amp; up), and removing any/all base/trim from walls throughout the basement, and adjoining bedrooms to expose all wall framing.&nbsp; All waste will be properly disposed of.</p>\r\n<p>Once walls are exposed if additional sources are identified we will advise.</p>\r\n<p>Estimated time frame to complete is 1-2 weeks.&nbsp; Dumpster/Roll-Off Container rental scheduling may cause delay upon bid approval.&nbsp;</p>',950.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(37,1,29,4,3,'2011-07-08','<p>Demolition - Remove all effected drywall &amp; insulation, and remove all base/trim from walls throughout the  basement, and adjoining bedrooms to expose all wall framing.&nbsp;</p>\r\n<p>Waste - All waste  will be properly disposed of.</p>\r\n<p>Mold Remediation - Scrape and spray mold (Helps eliminate, clean and prevent mold) on exposed wall framing.&nbsp; </p>\r\n<p>Due to the source of the mold being from a drainage issue, we cannot garauntee future mold if current water penetration isn\'t remedied.</p>\r\n<p>Estimated time frame to complete is 3-4 weeks.&nbsp; Dumpster/Roll-Off  Container rental scheduling may cause delay upon bid approval.</p>\r\n<p>&nbsp;</p>',4175.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(38,1,41,7,2,'2011-08-01','<p>Install Rail System on single side of main entryway (stairs).</p>\r\n<p>Railing System consists of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n</ul>\r\n<ul>\r\n    <li>Top &amp; Middle Rail, and Cap</li>\r\n</ul>\r\n<ul>\r\n    <li>Posts anchored into concrete</li>\r\n</ul>',400.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(39,1,42,7,3,'2011-08-01','<p>Install Rail System on both sides of entryway (stairs).</p>\r\n<p>Railing System consists of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n</ul>\r\n<ul>\r\n    <li>Top &amp; Middle Rail, and Cap</li>\r\n</ul>\r\n<ul>\r\n    <li>Posts anchored into concrete</li>\r\n</ul>',950.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(40,1,43,7,3,'2011-08-08','<p>Install Rail System on both sides of main entryway (stairs).</p>\r\n<p>Railing System consists of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n</ul>\r\n<ul>\r\n    <li>Top &amp; Middle Rail, and Cap</li>\r\n</ul>\r\n<ul>\r\n    <li>Posts anchored into concrete</li>\r\n</ul>',0.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(41,1,43,7,2,'2011-08-10','<p>Install Rail System on both sides of front of main entryway (stairs), and both sides of side entry of main entryway (stairs &amp; ramp).</p>\r\n<p>Railing System consists of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n</ul>\r\n<ul>\r\n    <li>Top &amp; Middle Rail, and Cap</li>\r\n</ul>\r\n<br />',835.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(42,1,38,5,2,'2011-08-24','<p><strong>Upstairs Bathroom</strong></p>\r\n<ul>\r\n    <li>Repair Hole</li>\r\n</ul>\r\n<ul>\r\n    <li>Replace missing tile</li>\r\n</ul>\r\n<p>Note:&nbsp; The new tiles will not be exactly matching the olders style, but will be solid color.</p>',650.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(43,1,45,7,3,'2011-09-13','<p>Install Rail System on both sides of rear entryway/patio (stairs).</p>\r\n<p>Railing System consists of:</p>\r\n<ul>\r\n    <li>Posts (no more than 4\' apart)</li>\r\n</ul>\r\n<ul>\r\n    <li>Top &amp; Middle Rail, and Cap</li>\r\n</ul>',695.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(44,1,42,7,2,'2011-12-01','<p>Front Porch - install 4\'x6\' railing (currently missing)</p>\r\n<p>Rear Stairs (on new addition) - install stair railing on both sides</p>\r\n<p>Garage/Exterior Door - install stair railing on both sides</p>',400.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(45,1,52,7,3,'2011-12-29','<p>Purchase &amp; Install a Dishwasher, Slide-In Range, and matching Microwave/Range Hood</p>',3000.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(46,1,44,7,1,'2012-01-06','<p>Front Door/Entryway</p>\r\n<ul>\r\n    <li>Install stairs</li>\r\n</ul>\r\n<ul>\r\n    <li>Install stair railing on both sides</li>\r\n</ul>\r\n<p>Interior - Downstairs</p>\r\n<ul>\r\n    <li>Install 2 handrails</li>\r\n</ul>',600.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(47,2,53,7,1,'2012-03-20','<p>Wall &amp; Ceiling Prep and Installation *</p>\r\n<ul>\r\n    <li>Remove all foundation wall insulation</li>\r\n    <li>Frame entire area - studs spaced at 16&quot;</li>\r\n    <li>R-19 insulation in each wall bay of the eletrical panel wall</li>\r\n    <li>R-30 insulation in each ceiling bay</li>\r\n    <li>Soffits will be built to accomodate duct-work, piping, etc</li>\r\n    <li>Drywall at 1/2&quot; thickness, and Rounded corner beads</li>\r\n    <li>Matching textures for ceiling (spray-on knock down) and walls (light orange peel)</li>\r\n</ul>\r\n<p>Install Electrical throughout basement **</p>\r\n<ul>\r\n    <li>Outlets (spaced accordingly to code)</li>\r\n    <li>Light boxes placed (including under stairs)</li>\r\n    <li>Light Switches</li>\r\n    <li>Coxial Cable (TV cable) and Outlet</li>\r\n    <li>RJ11 Cable (Phone cable) and Outlet</li>\r\n</ul>\r\n<p>Custom Shelving System ***</p>\r\n<ul>\r\n    <li>4\' x 18&quot; x 2\' (WxHxD) - 5 shevles per stack</li>\r\n    <li>includes a Valence to hide dowel/curtain system, and casing along floor</li>\r\n    <li>L-shaped shelving in corners</li>\r\n    <li>Area next to stairs will have a shelfing system along with a non-shelf unit with countertop (opening of 5\'x28&quot;) - Rounded countertop corners</li>\r\n</ul>\r\n<p>Finish Work Installation ****</p>\r\n<ul>\r\n    <li>French Doors to utility area</li>\r\n    <li>Bi-Fold to understair area</li>\r\n    <li>Custom Slab Door to dead-space area</li>\r\n    <li>Matching casing along floor</li>\r\n    <li>Sills at window base</li>\r\n</ul>\r\n<p>* Any remaining furniture will be properly covered with thick 4mm plastic</p>\r\n<p>** Client will provide light fixtures, pick out light switches and provide certain outlet (i.e., phone, cable, and light switch) locations upon bid approval</p>\r\n<p>*** Client will provide a curtain system for the shelving system</p>\r\n<p>**** Client will stain and paint all new construction</p>\r\n<p>&nbsp;</p>',12880.00,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269');
/*!40000 ALTER TABLE `bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company_category_id` bigint NOT NULL,
  `business_name` varchar(75) DEFAULT NULL,
  `contact_name` varchar(75) DEFAULT NULL,
  `address` varchar(75) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state_id` bigint NOT NULL,
  `zipcode` varchar(6) DEFAULT NULL,
  `phone` varchar(14) DEFAULT NULL,
  `phone_ext` varchar(6) DEFAULT NULL,
  `fax` varchar(14) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `image_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_companies_on_company_category_id` (`company_category_id`),
  KEY `index_companies_on_state_id` (`state_id`),
  KEY `index_companies_on_image_id` (`image_id`),
  CONSTRAINT `fk_rails_45f67c57ab` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`),
  CONSTRAINT `fk_rails_c7d6275cfa` FOREIGN KEY (`company_category_id`) REFERENCES `company_categories` (`id`),
  CONSTRAINT `fk_rails_fa4f679532` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,1,'Keller Williams','Doc Nicolson','802 N Washington St','Spokane',49,'99201','(509) 991-4085','','(509) 458-4001','doc@fivestarspokane.com','fivestarspokane.com',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(2,1,'Eleen Northcutt','Eleen Northcutt','12428 N Denver Drive','Mead',49,'99218','(509) 466-5848','','','eleen.northcutt@mead354.org','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(3,1,'Leon Campbell','Leon Campbell','10720 E 31st Ave','Spokane Valley',49,'99206','(509) 891-2245','','','lncampbell48@gmail.com','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(4,1,'Phoenix Reconstruction LLC','Jason L Campbell','7925 N Scott Rd','Spokane',49,'99217','(509) 217-8893','','','jason@phoenix-reconstruction.com','phoenix-reconstruction.com',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(5,1,'Mountain West Janitorial LLC','Jason L Campbell','7925 N Scott Rd','Spokane',49,'99217','(509) 217-8893','','','jason@mountainwestjanitorial.com','mountainwestjanitorial.com',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(6,2,'Home Depot','Home Depot - Valley','5617 E Sprague Ave.','Spokane Valley',49,'99212','(509) 534-8588','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(7,2,'Home Depot','Home Depot - Northside','9116 N Newport Highway','Spokane',49,'99218','(509) 466-89','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(8,2,'Home Depot','Home Depot - Liberty Lake','21701 East Country Vista Dr.','Liberty Lake',49,'99019','(509) 891-0613','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(9,2,'Ziggys','Ziggys - Veradale','17002 E Sprague Ave.','Spokane Valley',49,'99037','(509) 922-18','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(10,2,'O&#39;Reilly Auto Parts','O&#39;Reilly - Francis','3125 E Francis Ave','Spokane',49,'99208','(509) 466-2086','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(11,2,'O&#39;Reilly Auto Parts','O&#39;Reilly - Argonne','2204 N Argonne Rd','Spokane',49,'99212','(509) 922-5020','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(12,2,'O&#39;Reilly Auto Parts','O&#39;Reilly - Bowdish','11606 E Sprague Ave','Spokane Valley',49,'99206','(509) 924-5001','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(13,2,'River Ridge Food & Gas','River Ridge Gas','2508 W NW Blvd','Spokane',49,'99205','(509) 325-5881','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(14,2,'Stewarts True Value Hardware Store','Tru Value - Monroe','1905 N Monroe St','Spokane',49,'99205','(509) 000-0000','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(15,2,'Shell Station','Shell - 395','12310 SR 395','Spokane',49,'99218','(509) 981-5000','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(16,2,'Divines','Divines - Pines','1520 N Pines Rd','Spokane Valley',49,'99206','(509) 922-3911','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(17,2,'Tesoro','Tesoro - N Sullivan','209 N Sullivan Rd','Veradale',49,'99037','(509) 000-0000','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(18,2,'LMC Truck','LMC Truck','15450 W 108th St','Lenexa',17,'66219','(800) 562-8782','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(19,2,'Tesoro','Tesoro - Trent','13819 E Trent Rd','Spokane',49,'99212','(509) 928-5632','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(20,2,'Albertsons Express','Albertons Gas - Trent','8915 E Trent Ave','Spokane',49,'99212','(509) 893-1142','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(21,2,'Exxon Express','Exxon - Newman Lake','25105 E Trent Ave','Newman Lake',49,'99025','(509) 226-3331','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(22,2,'Hauser Smoke Shop','Hauser Smoke Shop','26913 W Highway 53','Hauser',13,'83854','(208) 773-5571','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(23,2,'Conoco','Conoco- Argonne','1520 N Argonne Rd','Spokane',49,'99212','(509) 892-5201','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(24,2,'Amazon','Amazon.com','','',49,'0','','','','','http://www.amazon.com',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(25,2,'Chevron','Chevron - Mission & Argonne','1520 N Argonne Rd','Spokane Valley',49,'99206','','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(26,2,'All-Wall','All-Wall - Kirkland','12700 N.E. 124th St. #9 ','Kirkland',49,'98034','(800) 929-0927','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(27,2,'7-Eleven','7-11 Millwood','3409 N Argonne Rd','Millwood',49,'99212','(509) 926-0380','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(28,2,'Sears','Sears - Northtown Mall','4700 N Division St','Spokane',49,'99207','(509) 482-5600','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(29,2,'Waste to Energy Plan','Waste Disposal - Airway Heights','2900 S Geiger Blvd','Spokane',49,'99224','(509) 625-6871','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(30,2,'Valley Transfer Station','Waste Disposal - Sullivan','3941 N Sullivan Rd','Spokane',49,'99216','','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(31,2,'Village Supply / True Value','True Value - Medical Lake','220 E Lake Street','Medical Lake',49,'99022','(509) 299-3451','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(32,2,'Hico Village','Hico Village - Argonne','9219 E Sprague Ave','Spokane',49,'99206','','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(33,2,'Tesoro','Tesoro - Piggy Mart','104 W 2nd Ave','Spokane',49,'99201','','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(34,2,'eReplacementParts.com','eReplacementParts.com','564 W 932 S','Sandy',46,'84070','(866) 802-6383','','','','eReplacementParts.com',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(35,2,'Whitley Oil #1','Exxon - Whitley Oil','217 S Division St','Spokane',49,'99201','','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(36,2,'7-Eleven','7-Eleven - Millwood','3409 N Argonne Rd','Millwood',49,'99212','','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(37,2,'Cenex Zip Trip','Zip Trip - Mullan','1403 N Mullan Rd','Spokane',49,'99206','(509) 926-3632','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(38,2,'Zin Foodmart','Zin Foodmart','1703 E Francis Ave','Spokane',49,'99208','(509) 482-1204','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(39,2,'Coop Supply Inc','Coop Supply - Post Falls','606 W Mullan','Post Falls',13,'83854','','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(40,2,'Costco 670','Costco Gas - Valley','5601 E Sprague Ave','Spokane',49,'99206','','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(41,2,'Holiday #289','Holiday - N Argonne','2303 N Argonne Rd','Spokane',49,'99212','(509) 928-0436','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(42,2,'Dollar Tree Stores, Inc','Dollar Tree - Argonne & Montgomery','9211 E Montgomery Ave','Spokane',49,'99206','(509) 893-0267','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(43,2,'Grizzly Industrial, Inc','Grizzly','PO Box 2069','Bellingham',49,'98227','(800) 523-4777','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(44,2,'Woodcraft (#573)','Woodcraft (Sullivan & Sprague)','212 N Sullivan Rd, Ste C','Spokane Valley',49,'99037','(509) 892-9663','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(45,2,'International Code Council','ICC','4051 W Flossmoor Rd','County Club Hills',14,'60478','','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(46,2,'Flying J','Flying J - Post Falls','400 N Idahline Rd','Post Falls',13,'83854','(208) 773-0593','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(47,2,'Chevron','Chevron - Post Falls','4020 E Seltice Way','Post Falls',13,'83854','','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(48,2,'Vehicle Emissions #15','Vehicle Emission - Hamilton','920 N Hamilton St','Spokane',49,'99202','(509) 482-7724','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(49,2,'Spokane Valley Licensing','DOL - Sprague Ave','9405 E Sprague Ave','Spokane',49,'99206','(509) 928-7891','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(50,2,'Northtown Gas & Deli','Northtown Gas & Deli','4615 N Division St','Spokane',49,'99207','(800) 373-3277','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(51,2,'V.H. Services','VH Services - Mechanic','12613 E Sprague Ave','Spokane Valley',49,'99216','(509) 922-1995','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(52,2,'Unigard Insurance Company','UniGard Insurance','PO Box 90701','Bellevue',49,'98009','','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(53,2,'Broadway Station','Broadway Station','5821 E Broadway Ave','Spokane Valley',49,'0','(509) 534-2347','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(54,2,'NewEgg.com','NewEgg.com','9997 Rose Hills Road','Whittier',5,'90601','','','','','newegg.com',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(55,2,'Big R','Big R','8307 E Trent Ave','Spokane',49,'99212','(509) 922-1090','','','','',1,'2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_categories`
--

DROP TABLE IF EXISTS `company_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_categories`
--

LOCK TABLES `company_categories` WRITE;
/*!40000 ALTER TABLE `company_categories` DISABLE KEYS */;
INSERT INTO `company_categories` VALUES (1,'Client','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(2,'Vendor','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(3,'Owner','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269');
/*!40000 ALTER TABLE `company_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expense_categories`
--

DROP TABLE IF EXISTS `expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expense_categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expense_categories`
--

LOCK TABLES `expense_categories` WRITE;
/*!40000 ALTER TABLE `expense_categories` DISABLE KEYS */;
INSERT INTO `expense_categories` VALUES (1,'Assets (Depreciation)','Tools or Equipment over $100 (include tax and shipping)','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(2,'Vehicle Gas','Gasoline for Vehicle','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(3,'Vehicle Tires','Tires for Vehicle','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(4,'Vehicle Repair','Brakes, Engine, Transmission, etc','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(5,'Vehicle Maintenance','Oil change, Oil/Air Filter, Light Bulbs, etc','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(6,'Supplies','Small Tools, Drill Bits, Screws, Hoses, Cords, Nails, Safety Equipment, Protective Clothes, etc','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(7,'Materials','Lumber, Hardware, etc','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(8,'Communication','Second Phone Line, Long Distance, Cell Phone Service','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(9,'Home Office','Mortgage Interest, Rent, Utilities, Homeowner/Renters Insurance','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(11,'Taxes and Licenses','Payroll, Business Licenses, Permits','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(12,'Advertising','Business Cards, PhoneBook Ads, Web Ads, Flyers, Brochures','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(13,'Business Travel','Air Fare, Hotel, Rental Car','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(14,'Insurance Payments','Liability Insurance','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(15,'Rental Payments','Equipment such as computers, tools, warehouse space or land','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(16,'Legal and Professional Fees','Fees for business-related legal matters','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(17,'Commissions','Finder\'s Fees, Sales Commissions, Legal Referrals','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(18,'Contract Labor','Sub- and independent Contractors, Additional Project Support','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(19,'Repairs and Maintenance','Painting, Plumbing, Electrical, Computer Services','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(20,'Utilities (for Business, not Personal)','Gas, Electricity, Water, Trash, Alarm Monitoring','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(21,'Other Office Expenses','Pickup and Delivery Services, Data Backup','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(22,'Miscellaneous Expenses','Answering Services, Bank Charges, Business-related Gifts','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(23,'Equipment Gas','Gasoline for Equipment','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(24,'Vehicle Oil','Oil for Vehicle','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(25,'Waste Disposal','Waste Disposal','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(26,'Vehicle Insurance','Auto Insurance','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(27,'Vehicle Registration/License','Registration/Licensing Fees','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(28,'Vehicle - Garage Rent','Garage Rent','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(29,'Vehicle - Other Expense','Towing, Tools for Vehicle, Car Wash','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(30,'Office Supplies','Memberships, Books, Pencils, Paper','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269');
/*!40000 ALTER TABLE `expense_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expenses`
--

DROP TABLE IF EXISTS `expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expenses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `expense_category_id` bigint NOT NULL,
  `vehicle_id` bigint NOT NULL,
  `pdate` date DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL,
  `subtotal` decimal(8,2) DEFAULT NULL,
  `tax_include` tinyint DEFAULT NULL,
  `tax` decimal(8,5) DEFAULT NULL,
  `total` decimal(8,2) DEFAULT NULL,
  `receipt_reference` varchar(100) DEFAULT NULL,
  `image_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_expenses_on_invoice_id` (`invoice_id`),
  KEY `index_expenses_on_company_id` (`company_id`),
  KEY `index_expenses_on_expense_category_id` (`expense_category_id`),
  KEY `index_expenses_on_vehicle_id` (`vehicle_id`),
  KEY `index_expenses_on_image_id` (`image_id`),
  CONSTRAINT `fk_rails_28c0547e2b` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  CONSTRAINT `fk_rails_34c8abbce1` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  CONSTRAINT `fk_rails_3f5911559b` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`),
  CONSTRAINT `fk_rails_cf30a3f331` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_de942b3df2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expenses`
--

LOCK TABLES `expenses` WRITE;
/*!40000 ALTER TABLE `expenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_types`
--

DROP TABLE IF EXISTS `image_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image_types` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_types`
--

LOCK TABLES `image_types` WRITE;
/*!40000 ALTER TABLE `image_types` DISABLE KEYS */;
INSERT INTO `image_types` VALUES (1,'Logo','2021-01-12 22:34:57.676537','2021-01-12 22:34:57.676537'),(2,'Receipt','2021-01-12 22:35:11.687127','2021-01-12 22:35:11.687127'),(3,'Invoice','2021-01-12 22:35:46.010228','2021-01-12 22:35:46.010228');
/*!40000 ALTER TABLE `image_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_type_id` bigint NOT NULL,
  `filename` varchar(250) DEFAULT NULL,
  `title` varchar(75) DEFAULT NULL,
  `file_path` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_images_on_image_type_id` (`image_type_id`),
  CONSTRAINT `fk_rails_5ac97a473d` FOREIGN KEY (`image_type_id`) REFERENCES `image_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,1,'blank_icon.png','Blank Icon','blank_icon.png','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `company_id` bigint NOT NULL,
  `project_site_id` bigint NOT NULL,
  `sku_id` bigint NOT NULL,
  `bid_id` bigint NOT NULL,
  `term_id` bigint NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `description` text,
  `amount` decimal(8,2) DEFAULT NULL,
  `loan_amount` decimal(8,2) DEFAULT NULL,
  `loan_paid` tinyint DEFAULT NULL,
  `interest_amount` decimal(8,2) DEFAULT NULL,
  `interest_paid` tinyint DEFAULT NULL,
  `complete` tinyint DEFAULT NULL,
  `paid` tinyint DEFAULT NULL,
  `paid_checknum` varchar(50) DEFAULT NULL,
  `paid_date` date DEFAULT NULL,
  `project_cost` decimal(8,2) DEFAULT NULL,
  `save_tax` decimal(8,2) DEFAULT NULL,
  `actual_net` decimal(8,2) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_invoices_on_company_id` (`company_id`),
  KEY `index_invoices_on_project_site_id` (`project_site_id`),
  KEY `index_invoices_on_sku_id` (`sku_id`),
  KEY `index_invoices_on_bid_id` (`bid_id`),
  KEY `index_invoices_on_term_id` (`term_id`),
  CONSTRAINT `fk_rails_294158e418` FOREIGN KEY (`project_site_id`) REFERENCES `project_sites` (`id`),
  CONSTRAINT `fk_rails_433d4c368d` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_598d3d7e4a` FOREIGN KEY (`bid_id`) REFERENCES `bids` (`id`),
  CONSTRAINT `fk_rails_7847a13e9f` FOREIGN KEY (`sku_id`) REFERENCES `skus` (`id`),
  CONSTRAINT `fk_rails_e1830a164b` FOREIGN KEY (`term_id`) REFERENCES `terms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mileages`
--

DROP TABLE IF EXISTS `mileages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mileages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `project_site_id` bigint NOT NULL,
  `vehicle_id` bigint NOT NULL,
  `invoice_id` bigint NOT NULL,
  `drive_date` date DEFAULT NULL,
  `start_mileage` decimal(7,1) DEFAULT NULL,
  `end_mileage` decimal(7,1) DEFAULT NULL,
  `subtotal` decimal(7,1) DEFAULT NULL,
  `notes` varchar(150) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mileages_on_project_site_id` (`project_site_id`),
  KEY `index_mileages_on_vehicle_id` (`vehicle_id`),
  KEY `index_mileages_on_invoice_id` (`invoice_id`),
  CONSTRAINT `fk_rails_4261c8fdda` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`),
  CONSTRAINT `fk_rails_9ae1831f64` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`),
  CONSTRAINT `fk_rails_ab71f66de7` FOREIGN KEY (`project_site_id`) REFERENCES `project_sites` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mileages`
--

LOCK TABLES `mileages` WRITE;
/*!40000 ALTER TABLE `mileages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mileages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_sites`
--

DROP TABLE IF EXISTS `project_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_sites` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state_id` bigint NOT NULL,
  `zipcode` varchar(6) DEFAULT NULL,
  `access_code` varchar(10) DEFAULT NULL,
  `map_link` text,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_project_sites_on_state_id` (`state_id`),
  CONSTRAINT `fk_rails_a6d37dc156` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_sites`
--

LOCK TABLES `project_sites` WRITE;
/*!40000 ALTER TABLE `project_sites` DISABLE KEYS */;
INSERT INTO `project_sites` VALUES (1,'36124 N Milan Elk Rd','Chattoroy',49,'99003','2610','http://maps.google.com/maps?oe=utf-8&rls=org.mozilla:en-US:official&client=firefox-a&q=36124+N+Milan+Elk+Rd,+Chattaroy,+WA+99003&um=1&ie=UTF-8&hq=&hnear=0x5361f85ddc29a92b:0x951d12627d29840c,36124+N+Milan+Elk+Rd,+Chattaroy,+WA+99003&gl=us&ei=vMLiTfurNKvQiAL0l7WoBg&sa=X&oi=geocode_result&ct=title&resnum=1&ved=0CCEQ8gEwAA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(2,'1852 N Driskill','Newport',49,'99156','6467','','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(3,'4072 Garden Spot Rd','Loon Lake',49,'99148','','','2021-01-12 21:56:37.345269','2021-01-12 23:03:26.577170'),(4,'224 W Carlisle Ave','Spokane',49,'99205','','http://maps.google.com/maps?q=224+w+carlisle,+spokane,+wa+99205&oe=utf-8&rls=org.mozilla:en-US:official&client=firefox-a&um=1&ie=UTF-8&hq=&hnear=0x549e18e3b7bda66b:0x3ac117a72e370e8,224+W+Carlisle+Ave,+Spokane,+WA+99205&gl=us&ei=8LH-TfPkNOHmiAL_tMy7CA&sa=X&oi=geocode_result&ct=title&resnum=1&ved=0CBkQ8gEwAA','2021-01-12 21:56:37.345269','2021-01-12 23:03:33.386191'),(5,'24515 S Pine Springs Rd','Cheney',49,'99004','6987','','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(13,'104 W Broadway St','St. John',49,'99171','7149','http://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q=104+w+broadway,+st.+john,+wa+99171&aq=&gl=us&ie=UTF8&hq=&hnear=104+W+Broadway+St,+St+John,+Whitman,+Washington+99171&t=h&z=16','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(19,'3419 W Glass Ave','Spokane',49,'99205','','','2021-01-12 21:56:37.345269','2021-01-12 23:03:18.399386'),(20,'2306 W Walker Ct','Spokane',49,'99208','','','2021-01-12 21:56:37.345269','2021-01-12 23:03:43.474656'),(22,'340 S Campbell St','Airway Heights',49,'99224','','','2021-01-12 21:56:37.345269','2021-01-12 23:04:02.413049'),(23,'5423 N Monroe St','Spokane',49,'99205','3590','http://maps.google.com/maps?q=5423+N+Monroe+St,+Spokane,+WA+99205&oe=utf-8&client=firefox-a&ie=UTF8&hq=&hnear=5423+N+Monroe+St,+Spokane,+Washington+99205&gl=us&z=16','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(24,'909 E Harding Dr','Colbert',49,'99218','','','2021-01-12 21:56:37.345269','2021-01-12 23:04:08.721512'),(25,'755 N Dundee Dr','Post Falls',13,'83854','','','2021-01-12 21:56:37.345269','2021-01-12 23:04:14.817372'),(26,'2718 E Sprague Ave','Spokane',49,'99202','','','2021-01-12 21:56:37.345269','2021-01-12 23:04:20.640432'),(27,'29009 N Cedar Rd','Deer Park',49,'99006','7693','','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(28,'2822 W Cleveland Ave','Spokane',49,'99205','','','2021-01-12 21:56:37.345269','2021-01-12 23:03:55.713093'),(29,'20812 N Greenbluff Dr','Colbert',49,'99005','9614','','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(30,'4119 W Owens Rd','Deer Park',49,'99006','3166','','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(31,'2809 W Mallon Ave','Spokane',49,'99201','8173','','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(33,'1312 E Princeton Ave','Spokane',49,'99207','4909','','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(34,'4033 S Schafer Rd','Spokane Valley',49,'99206','','','2021-01-12 21:56:37.345269','2021-01-12 23:04:41.476978'),(35,'21 N Bolivar St','Spokane Valley',49,'99206','0024','','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(36,'6840 W Majestic Ave','Rathrum',13,'83858','8272','http://maps.google.com/maps?q=539%20E%20Bridgeport%20Ave%2C%20Spokane%2C%20WA%2099207&oe=utf-8&rls=org.mozilla:en-US:official&client=firefox-a&um=1&ie=UTF-8&sa=N&hl=en&tab=wl','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(37,'17207 N Trails End Road','Rathdrum',13,'83858','8271','http://maps.google.com/maps?q=539%20E%20Bridgeport%20Ave%2C%20Spokane%2C%20WA%2099207&oe=utf-8&rls=org.mozilla:en-US:official&client=firefox-a&um=1&ie=UTF-8&sa=N&hl=en&tab=wl','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(38,'2304 W Courtland Ave','Spokane',49,'99205','3543','http://maps.google.com/maps?oe=utf-8&client=firefox-a&q=2304+W+Courtland+Ave,+Spokane,+WA+99205&ie=UTF8&hq=&hnear=0x549e1909a7d89dd5:0xd6739a4975c27a9f,2304+W+Courtland+Ave,+Spokane,+WA+99205&gl=us&daddr=2304+W+Courtland+Ave,+Spokane,+WA+99205&z=16','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(39,'539 E Bridgeport Ave','Spokane',49,'99207','4141','http://maps.google.com/maps?q=539%20E%20Bridgeport%20Ave%2C%20Spokane%2C%20WA%2099207&oe=utf-8&rls=org.mozilla:en-US:official&client=firefox-a&um=1&ie=UTF-8&sa=N&hl=en&tab=wl','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(40,'13916 E 9th Ct','Veradale',49,'99037','0233','http://maps.google.com/maps?q=13916+e+9th+ct.,+veradale,+wa+99037&oe=utf-8&rls=org.mozilla:en-US:official&client=firefox-a&um=1&ie=UTF-8&hq=&hnear=0x549e2088104689ed:0x4b53495d1d02f07b,13916+E+9th+Ct,+Veradale,+WA+99037&gl=us&ei=bOzvTc3HLIWgtwfKxsTCCQ&sa=X&oi=geocode_result&ct=title&resnum=1&ved=0CBYQ8gEwAA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(41,'9002 N Pamela St','Spokane',49,'99208','8562','http://maps.google.com/maps?q=9002+N+Pamela,+SPokane,+wa&oe=utf-8&client=firefox-a&gl=us&t=h&z=16','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(42,'3855 Powers Rd','Loon Lake',49,'99148','7968','http://maps.google.com/maps?q=3855+Powers,+Loon+Lake,+wa&hl=en&client=firefox-a&gl=us&t=h&z=16','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(43,'1017 W Providence Ave','Spokane',49,'99205','6197','http://maps.google.com/maps?q=1017+W+Providence,+spokane,+wa+99205&oe=utf-8&client=firefox-a&gl=us&t=h&z=16','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(44,'6617 Thomas Lane','Nine Mile Falls',49,'99029','5878','http://maps.google.com/maps?q=6617+Thomas+Lane+Nine+Mile+Falls+99029&oe=utf-8&rls=org.mozilla:en-US:official&client=firefox-a&um=1&ie=UTF-8&hq=&hnear=0x549e0652d1dd5493:0x3d4a2a072dd5bd20,6617+Thomas+Ln,+Nine+Mile+Falls,+WA+99026&gl=us&ei=uwJsTsejG5KKsAKBw9jKBA&sa=X&oi=geocode_result&ct=title&resnum=1&ved=0CBYQ8gEwAA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(45,'6211 N Alberta St','Spokane',49,'99205','3543','http://maps.google.com/maps?q=6211+n+alberta,+spokane,+wa&oe=utf-8&rls=org.mozilla:en-US:official&client=firefox-a&um=1&ie=UTF-8&hq=&hnear=0x549e19618be1d0b1:0x7458f66c0a55b7e5,6211+N+Alberta+St,+Spokane,+WA+99205&gl=us&ei=6_hvTtyeGojWiALAypDuBg&sa=X&oi=geocode_result&ct=title&resnum=1&ved=0CBgQ8gEwAA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(46,'1920 N Regal St','Spokane',49,'99207','3590','http://www.google.com/search?q=1920+n+regal%2C+spokane%2C+wa&ie=utf-8&oe=utf-8&aq=t&rls=org.mozilla:en-US:official&client=firefox-a','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(47,'723 E Upper Terrace Ln','Colbert',49,'99005','','http://maps.google.com/maps?q=723+e+upper+terrace,+colbert,+wa&oe=utf-8&rls=org.mozilla:en-US:unofficial&client=firefox-a&um=1&ie=UTF-8&hq=&hnear=0x549e02b4ab593681:0x20a24d750c7d394e,723+E+Upper+Terrace+Ln,+Colbert,+WA+99005&gl=us&ei=6CSLTpX1BLKMsALuurjRBA&sa=X&oi=geocode_result&ct=title&resnum=1&ved=0CBwQ8gEwAA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(49,'1014 S Antelope Ave','Spokane',49,'99224','4498','http://maps.google.com/maps?q=1014+s+antelope,+airway+heights,+wa&oe=utf-8&rls=org.mozilla:en-US:official&client=firefox-a&um=1&ie=UTF-8&hq=&hnear=0x549e16f8ab6486a9:0x713e52f03764e176,1014+S+Antelope+Ave,+Spokane,+WA+99224&gl=us&ei=PEqoTtyIGcmaiQLdxoGxCg&sa=X&oi=geocode_result&ct=title&resnum=1&ved=0CBsQ8gEwAA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(50,'1427 E 35th Ave','Spokane',49,'99203','','http://maps.google.com/maps?q=1427+E+35th+Ave,+Spokane,+WA+99203&oe=utf-8&rls=org.mozilla:en-US:official&client=firefox-a&um=1&ie=UTF-8&hq=&hnear=0x549e22f38735420f:0x85a140fb23ae9c09,1427+E+35th+Ave,+Spokane,+WA+99203&gl=us&ei=NzW4TvSiDseXiALWmcG8BQ&sa=X&oi=geocode_result&ct=title&resnum=1&ved=0CCAQ8gEwAA','2021-01-12 21:56:37.345269','2021-01-12 23:04:33.796618'),(51,'1024 N Fox Ridge Rd','Medical Lake',49,'99022','0042','http://maps.google.com/maps?q=1024+N+Fox+Ridge,+medical+lake,+wa&oe=utf-8&rls=org.mozilla:en-US:official&client=firefox-a&um=1&ie=UTF-8&hq=&hnear=0x549e155aa9fb7503:0xfb5fb9e868e37bbf,1024+Fox+Ridge+Rd,+Medical+Lake,+WA+99022&gl=us&ei=P5m9TpalEs7XiALTvqyCAw&sa=X&oi=geocode_result&ct=title&resnum=1&ved=0CB0Q8gEwAA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(52,'1405 E Cambridge Ln','Spokane',49,'99203','','http://maps.google.com/maps?q=1405+E+Cambridge,+Spokane,+WA&oe=utf-8&rls=org.mozilla:en-US:official&client=firefox-a&um=1&ie=UTF-8&hq=&hnear=0x549e22f4b4122b5f:0x84f9e61eee44e83a,1405+E+Cambridge+Ln,+Spokane,+WA+99203&gl=us&ei=ibf8TpWdIKKniQL_kMykDg&sa=X&oi=geocode_result&ct=title&resnum=1&ved=0CCAQ8gEwAA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(53,'12428 N Denver Drive','Mead',49,'99218','','http://maps.google.com/maps?oe=utf-8&rls=org.mozilla:en-US:official&client=firefox-a&q=12428+n+denver+dr.,+mead,+wa&um=1&ie=UTF-8&hq=&hnear=0x549e1dabae56d2db:0xe4a3dfef3914894b,12428+N+Denver+Dr,+Spokane,+WA+99218&gl=us&ei=-gtkT6j-FcKmiQKup8yiDw&sa=X&oi=geocode_result&ct=title&resnum=1&ved=0CCEQ8gEwAA','2021-01-12 21:56:37.345269','2021-01-12 23:04:52.317608'),(54,'10720 E 31st Ave','Spokane Valley',49,'99206','','https://maps.google.com/maps?q=10720+E+31st+ave%2c+spokane+valley%2c+wa+99206','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(55,'7925 N Scott Rd','Spokane',49,'99217','','','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(56,'3807 E 29th Ave','Spokane',49,'99223','CMS','https://maps.google.com/maps?q=3807+e+29th+ave,+spokane,+wa+99223&ie=UTF-8&hq=&hnear=0x549e22472392730d:0x2492a7dc4f7c24de,3807+E+29th+Ave,+Spokane,+WA+99223&gl=us&ei=NsZJUcrwDeiGjAKBkYDgBA&ved=0CDMQ8gEwAA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(57,'1703 E 4th Ave','Spokane',49,'99202','OCN','https://maps.google.com/maps?q=1703+E+4th+Ave,+SPokane,+WA&ie=UTF-8&hq=&hnear=0x549e189c02565f2f:0x1ffacb5857831519,1703+E+4th+Ave,+Spokane,+WA+99202&gl=us&ei=WbRgUc-tKYG1iwKX1oD4DA&ved=0CDMQ8gEwAA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269');
/*!40000 ALTER TABLE `project_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20210111161743'),('20210111161908'),('20210111161944'),('20210111162012'),('20210111162104'),('20210111162140'),('20210111162215'),('20210111162244'),('20210111162317'),('20210111162341'),('20210111162407'),('20210111162440'),('20210111162633'),('20210111163008'),('20210111163637'),('20210111163802'),('20210111164215'),('20210113041956');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skus`
--

DROP TABLE IF EXISTS `skus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skus`
--

LOCK TABLES `skus` WRITE;
/*!40000 ALTER TABLE `skus` DISABLE KEYS */;
INSERT INTO `skus` VALUES (1,'Winterize','','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(2,'Lock Replacement','Replace locks and hardware','2021-01-12 21:56:37.345269','2021-01-12 22:29:43.764841'),(3,'Trash Out','','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(4,'Demolition','','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(5,'Repair','','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(6,'Snow Removal','Shovel Walkway, Driveway, Paths','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(7,'Installation','Installation','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(8,'Lawn Maintenance','Lawn Maintenance','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(9,'Interior Cleaning','Interior Cleaning','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(10,'Exterior Cleaning','Minor Exterior Cleaning','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(11,'Mold Remediation','Mold Removal/Remediation','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(12,'De-Winterize','','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(13,'Electronic Device Configuration','recode garage door opener','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(14,'Materials','Supply Materials for a company','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(15,'Short-term Loan','Short-term Loan','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269');
/*!40000 ALTER TABLE `skus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(75) DEFAULT NULL,
  `abbreviation` varchar(4) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Alaska','AK','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(2,'Alabama','AL','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(3,'Arizona','AZ','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(4,'Arkansas','AR','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(5,'California','CA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(6,'Colorado','CO','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(7,'Connecticut','CT','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(8,'Delaware','DE','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(9,'District of Columbia','DC','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(10,'Florida','FL','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(11,'Georgia','GA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(12,'Hawaii','HI','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(13,'Idaho','ID','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(14,'Illinois','IL','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(15,'Indiana','IN','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(16,'Iowa','IA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(17,'Kansas','KS','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(18,'Kentucky','KY','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(19,'Louisiana','LA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(20,'Maine','ME','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(21,'Maryland','MD','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(22,'Massachusetts','MA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(23,'Michigan','MI','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(24,'Minnesota','MN','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(25,'Mississippi','MS','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(26,'Missouri','MO','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(27,'Montana','MT','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(28,'Nebraska','NE','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(29,'Nevada','NV','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(30,'New Hampshire','NH','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(31,'New Jersey','NJ','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(32,'New Mexico','NM','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(33,'New York','NY','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(34,'North Carolina','NC','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(35,'North Dakota','ND','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(36,'Ohio','OH','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(37,'Oklahoma','OK','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(38,'Oregon','OR','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(39,'Pennsylvania','PA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(40,'Puerto Rico','PR','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(41,'Rhode Island','RI','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(42,'South Carolina','SC','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(43,'South Dakota','SD','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(44,'Tennessee','TN','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(45,'Texas','TX','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(46,'Utah','UT','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(47,'Vermont','VT','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(48,'Virginia','VA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(49,'Washington','WA','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(50,'West Virginia','WV','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(51,'Wisconsin','WI','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269'),(52,'Wyoming','WY','2021-01-12 21:56:37.345269','2021-01-12 21:56:37.345269');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terms` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
INSERT INTO `terms` VALUES (1,'Due on Receipt','2021-01-12 21:00:12.931992','2021-01-12 21:00:12.931992'),(2,'Net 15','2021-01-12 21:00:23.565768','2021-01-12 21:00:23.565768'),(3,'Net 30','2021-01-12 21:00:30.270769','2021-01-12 21:00:30.270769'),(4,'Net 45','2021-01-12 21:00:36.736582','2021-01-12 21:00:36.736582'),(5,'Net 60','2021-01-12 21:00:43.815036','2021-01-12 21:00:43.815036'),(6,'Net 90','2021-01-12 21:00:51.451906','2021-01-12 21:00:51.451906');
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `access_level_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(14) DEFAULT NULL,
  `phone_ext` varchar(6) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_users_on_access_level_id` (`access_level_id`),
  KEY `index_users_on_company_id` (`company_id`),
  CONSTRAINT `fk_rails_7682a3bdfe` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `fk_rails_ca08c4b96c` FOREIGN KEY (`access_level_id`) REFERENCES `access_levels` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `man_year` year DEFAULT NULL,
  `make` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `submodel` varchar(50) DEFAULT NULL,
  `engine` varchar(50) DEFAULT NULL,
  `notes` varchar(150) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,1994,'Subaru','Legacy','L','2.2L 2212 CC H4','5 Door Station Wagon (AWD)','2021-01-12 21:25:29.846261','2021-01-12 21:51:21.477714'),(2,1981,'Ford','F-150','Custom','4.9L 300 CID L6','1/2 Ton Pickup (2WD - rear wheel drive)','2021-01-12 21:26:11.068662','2021-01-12 21:51:37.337475'),(3,2003,'GMC','Yukon','Denali XL','6.0L V-8','AWD','2021-01-12 21:28:52.442815','2021-01-12 21:51:48.317624');
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

-- Dump completed on 2021-01-14  8:27:09
