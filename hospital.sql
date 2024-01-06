-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `did` int NOT NULL AUTO_INCREMENT,
  `dname` varchar(10) DEFAULT NULL,
  `darea` varchar(20) DEFAULT NULL,
  `intr` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'吴医生','001科室',' 擅长治疗一切急慢性咳嗽、肺癌，胃癌，失眠；复发性口腔溃疡、口腔扁平苔癣、口腔肿瘤、牙痛，舌癌、鼻咽癌、口臭、舌痛症，牙龈炎（反复牙龈出血）、舌苔厚腻，各类慢性顽固性口腔粘膜疾病；出汗异常（盗汗，多汗症，手脚多汗症，色汗）；颈椎病、长期发热性疾病；小儿科疾病（反复呼吸道感染、哮喘、消化不良、湿疹、癫痫、小儿多动症，小儿抽动症，小儿生长发育相关疾病）；牛皮癣、顽固性皮肤病、湿疹，结节性红斑，痤疮，瘙痒症；溃疡性结肠炎、克隆氏病、肠易激综合征，慢性腹泻；系统性红斑狼疮，干燥综合征，白塞氏病，皮肌炎等各类风湿免疫性疾病；'),(2,'王医生','001科室',' 擅长治疗一切急慢性咳嗽、肺癌，胃癌，失眠；复发性口腔溃疡、口腔扁平苔癣、口腔肿瘤、牙痛，舌癌、鼻咽癌、口臭、舌痛症，牙龈炎（反复牙龈出血）、舌苔厚腻，各类慢性顽固性口腔粘膜疾病；出汗异常（盗汗，多汗症，手脚多汗症，色汗）；颈椎病、长期发热性疾病；小儿科疾病（反复呼吸道感染、哮喘、消化不良、湿疹、癫痫、小儿多动症，小儿抽动症，小儿生长发育相关疾病）；牛皮癣、顽固性皮肤病、湿疹，结节性红斑，痤疮，瘙痒症；溃疡性结肠炎、克隆氏病、肠易激综合征，慢性腹泻；系统性红斑狼疮，干燥综合征，白塞氏病，皮肌炎等各类风湿免疫性疾病；'),(3,'陶医生','001科室','  杭州肿瘤医院杨社森医生擅长中医辨证治疗精神疾病、良性肿瘤、骨肉瘤、宫颈癌、淋巴癌、膀胱癌、前列腺癌、甲状腺癌、胆管癌、胰腺癌、肠癌等;尤其擅长对肺癌、胃癌、直肠癌、食道癌、鼻咽癌、胶质瘤等各种中晚期恶性肿瘤。以及在中医药防治肿瘤并发症、肿瘤放化疗后的不良反应方面颇有心得深受患者好评。'),(4,'杨医生','002科室','在中医理论的指导下，将美国308nm准分子,光黑色素种植术等技术与中药熏蒸、负离子定向渗透等疗法相结合，应用到白癜风的临床治疗中'),(5,'张医生','002科室','对肺心病、呼吸系统疾病（如急慢性支气管炎、支气管哮喘、支扩、慢阻肺、肺纤维化、间质性肺炎、肺脓疡等）急性传染病（特别是流行性出血热...'),(6,'刘医生','002科室','从事内科、呼吸科临床医疗、教学工作20余年，有丰富的呼吸内科疾病诊治经验，擅长慢性咳嗽、支气管哮喘、支气管炎、气管镜的诊断和治疗。');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
create table people
(
    id       int auto_increment
        primary key,
    sex      varchar(10) null,
    name     varchar(20) null,
    identity varchar(20) null,
    constraint people_id_uindex
        unique (id)
);

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (4,'男','yqc','330312345678912345');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record` (
  `oid` int NOT NULL AUTO_INCREMENT,
  `did` int DEFAULT NULL,
  `account` varchar(20) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `ostatus` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (2,2,'yqc','12-13 9:00-10:00','2'),(3,4,'yqc','12-13 9:00-10:00','3'),(4,1,'yqc','12-15 11:00-12:00','3'),(5,5,'yqc','12-18 11:00-12:00','3'),(6,1,'yqc','12-18 11:00-12:00','1');
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
create table user
(
    id             int auto_increment
        primary key,
    account        varchar(10)       null,
    password       varchar(12)       null,
    phone          varchar(15)       null,
    username       varchar(128)      null,
    avatar         varchar(512)      null,
    gender         tinyint default 0 null comment '0 - male ; 1 - female',
    identification varchar(32)       null comment '身份证',
    realName       varchar(128)      null
);
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `user_people`;
create table user_people
(
    userId   bigint null,
    peopleId bigint null
);


--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'zhangsan','123456','13712345678'),(4,'yqc','123','13738751120'),(5,'123','1','1'),(6,'1234','1','1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-21 21:29:11
