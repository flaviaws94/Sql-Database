-- MySQL dump 10.13  Distrib 8.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: oficina_mecanica
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Current Database: `oficina_mecanica`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `oficina_mecanica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `oficina_mecanica`;

--
-- Table structure for table `acompanhamento`
--

DROP TABLE IF EXISTS `acompanhamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acompanhamento` (
  `Id_Acompanhamento` int NOT NULL AUTO_INCREMENT,
  `Id_OrdemServico` int DEFAULT NULL,
  `Status_OrdemServico` enum('Em processo de concerto','Em processo de revisão','Finalizado') NOT NULL,
  PRIMARY KEY (`Id_Acompanhamento`),
  KEY `fk_Acompanhamento_OrdemServico` (`Id_OrdemServico`),
  CONSTRAINT `fk_Acompanhamento_OrdemServico` FOREIGN KEY (`Id_OrdemServico`) REFERENCES `ordemservico` (`Id_OrdemServico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acompanhamento`
--

LOCK TABLES `acompanhamento` WRITE;
/*!40000 ALTER TABLE `acompanhamento` DISABLE KEYS */;
INSERT INTO `acompanhamento` VALUES (1,1,'Finalizado'),(2,2,'Finalizado');
/*!40000 ALTER TABLE `acompanhamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_Cliente` int NOT NULL AUTO_INCREMENT,
  `NomeCompleto` varchar(100) NOT NULL,
  `CPF` char(11) NOT NULL,
  `RG` char(10) NOT NULL,
  `DataNascimento` date NOT NULL,
  `Endereco` varchar(200) NOT NULL,
  `Telefone` varchar(15) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_Cliente`),
  UNIQUE KEY `unique_CPF_Cliente` (`CPF`),
  UNIQUE KEY `unique_RG_Cliente` (`RG`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Rodrigo dos Santos','65896547789','1265891153','1998-09-15','Rua dos Papagaios 235, Cidade das Flores','44-12354-2214',NULL),(2,'Rose M. Souza','65412398712','1265474415','1985-05-15','Rua Brasil, 136, Centro - Cidade das Flores','44-12354-2145','Rose@gmail.com'),(3,'Sidnei da Silva','12362355477','1457856587','1961-08-20','Rua dos Passaros, 1550, Centro - Cidade das Flores','44-11233-1125','sidineids@gmail.com'),(4,'Jurandir Fonseca','98745365214','1235465887','1959-03-24','Rua Valente, 569, Centro - Cidade das Flores','44-33225-3256',NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `Id_Estoque` int NOT NULL AUTO_INCREMENT,
  `Local_Estoque` varchar(25) DEFAULT NULL,
  `Quantidade_Estoque` int DEFAULT '0',
  PRIMARY KEY (`Id_Estoque`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Rio de janiro',150),(2,'Rio de janiro',400),(3,'São Paulo',360),(4,'São Paulo',80),(5,'Goiás',95);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formapagamento`
--

DROP TABLE IF EXISTS `formapagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formapagamento` (
  `Id_FormaPagamento` int NOT NULL AUTO_INCREMENT,
  `Descrição` enum('Cartão de Crédito','Cartão de Débito','Pix','Boleto bancário') NOT NULL,
  PRIMARY KEY (`Id_FormaPagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapagamento`
--

LOCK TABLES `formapagamento` WRITE;
/*!40000 ALTER TABLE `formapagamento` DISABLE KEYS */;
INSERT INTO `formapagamento` VALUES (6,'Cartão de Crédito'),(7,'Cartão de Débito'),(8,'Pix'),(10,'Boleto bancário');
/*!40000 ALTER TABLE `formapagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maodeobra`
--

DROP TABLE IF EXISTS `maodeobra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maodeobra` (
  `Id_MaoDeObra` int NOT NULL AUTO_INCREMENT,
  `Descriçao_MaoDeObra` varchar(100) NOT NULL,
  `Valor_MaoDeObra` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id_MaoDeObra`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maodeobra`
--

LOCK TABLES `maodeobra` WRITE;
/*!40000 ALTER TABLE `maodeobra` DISABLE KEYS */;
INSERT INTO `maodeobra` VALUES (1,'Concerto de Motor',1500),(2,'Revisão Completa',500),(3,'Concerto da Suspensão',399),(4,'Concerto da Direção',150),(5,'Concerto dos Amortecedores',750);
/*!40000 ALTER TABLE `maodeobra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maodeobra_orcamento`
--

DROP TABLE IF EXISTS `maodeobra_orcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maodeobra_orcamento` (
  `Id_MaoDeObra` int DEFAULT NULL,
  `Id_Orcamento` int DEFAULT NULL,
  KEY `fk_MaoeObra_Orcamento_MaoDeObra` (`Id_MaoDeObra`),
  KEY `fk_MaoDeObra_Orcamento_OrdemServico` (`Id_Orcamento`),
  CONSTRAINT `fk_MaoDeObra_Orcamento_OrdemServico` FOREIGN KEY (`Id_Orcamento`) REFERENCES `orcamento` (`Id_Orcamento`),
  CONSTRAINT `fk_MaoeObra_Orcamento_MaoDeObra` FOREIGN KEY (`Id_MaoDeObra`) REFERENCES `maodeobra` (`Id_MaoDeObra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maodeobra_orcamento`
--

LOCK TABLES `maodeobra_orcamento` WRITE;
/*!40000 ALTER TABLE `maodeobra_orcamento` DISABLE KEYS */;
INSERT INTO `maodeobra_orcamento` VALUES (2,5),(3,6),(1,7),(2,8);
/*!40000 ALTER TABLE `maodeobra_orcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanico`
--

DROP TABLE IF EXISTS `mecanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanico` (
  `Id_Mecanico` int NOT NULL AUTO_INCREMENT,
  `NomeCompleto_Mecanico` varchar(100) NOT NULL,
  `Especialidade` varchar(50) NOT NULL,
  `Codigo` int NOT NULL,
  PRIMARY KEY (`Id_Mecanico`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanico`
--

LOCK TABLES `mecanico` WRITE;
/*!40000 ALTER TABLE `mecanico` DISABLE KEYS */;
INSERT INTO `mecanico` VALUES (1,'Marcos dos Santos','Eletricista',9784),(2,'Jefferson Nascimento','Mecânico Geral',9874),(3,'Antônio Moraes','Suspensão',9589),(4,'Diego Martins','Mecânico Geral',9658);
/*!40000 ALTER TABLE `mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orcamento`
--

DROP TABLE IF EXISTS `orcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orcamento` (
  `Id_Orcamento` int NOT NULL AUTO_INCREMENT,
  `Data_Orcamento` datetime NOT NULL,
  `Tipo_servico` enum('Conserto','Revisão') NOT NULL,
  `Status_Orcamento` enum('Aprovado','Aguardando Confirmação','Cancelado') NOT NULL,
  `Valor_Total` float NOT NULL,
  `Id_Mecanico` int DEFAULT NULL,
  `Id_Cliente` int DEFAULT NULL,
  `Id_Veiculo` int DEFAULT NULL,
  PRIMARY KEY (`Id_Orcamento`),
  KEY `fk_Orcamento_Mecanico` (`Id_Mecanico`),
  KEY `fk_Orcamento_Cliente` (`Id_Cliente`),
  KEY `fk_Orcamento_Veiculo` (`Id_Veiculo`),
  CONSTRAINT `fk_Orcamento_Cliente` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`id_Cliente`),
  CONSTRAINT `fk_Orcamento_Mecanico` FOREIGN KEY (`Id_Mecanico`) REFERENCES `mecanico` (`Id_Mecanico`),
  CONSTRAINT `fk_Orcamento_Veiculo` FOREIGN KEY (`Id_Veiculo`) REFERENCES `veiculo` (`Id_Veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orcamento`
--

LOCK TABLES `orcamento` WRITE;
/*!40000 ALTER TABLE `orcamento` DISABLE KEYS */;
INSERT INTO `orcamento` VALUES (5,'2023-11-30 07:30:05','Revisão','Aprovado',500,2,1,3),(6,'2023-12-02 10:00:15','Conserto','Aprovado',1300,3,4,1),(7,'2023-12-05 13:20:30','Conserto','Cancelado',1300,4,3,4),(8,'2023-12-19 10:15:10','Revisão','Aguardando Confirmação',800,4,2,2);
/*!40000 ALTER TABLE `orcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordemservico`
--

DROP TABLE IF EXISTS `ordemservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordemservico` (
  `Id_OrdemServico` int NOT NULL AUTO_INCREMENT,
  `DataEmissao` datetime NOT NULL,
  `DataConclusao` datetime DEFAULT NULL,
  `Id_Orcamento` int DEFAULT NULL,
  `Id_Mecanico` int DEFAULT NULL,
  `Id_FormaPagamento` int DEFAULT NULL,
  `Id_Cliente` int DEFAULT NULL,
  `Id_Veiculo` int DEFAULT NULL,
  PRIMARY KEY (`Id_OrdemServico`),
  KEY `fk_OrdemServico_Mecanico` (`Id_Mecanico`),
  KEY `fk_OrdemServico_Orcamento` (`Id_Orcamento`),
  KEY `fk_OrdemServico_FormaPagamento` (`Id_FormaPagamento`),
  KEY `fk_OrdemServico_Cliente` (`Id_Cliente`),
  KEY `fk_OrdemServico_Veiculo` (`Id_Veiculo`),
  CONSTRAINT `fk_OrdemServico_Cliente` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`id_Cliente`),
  CONSTRAINT `fk_OrdemServico_FormaPagamento` FOREIGN KEY (`Id_FormaPagamento`) REFERENCES `formapagamento` (`Id_FormaPagamento`),
  CONSTRAINT `fk_OrdemServico_Mecanico` FOREIGN KEY (`Id_Mecanico`) REFERENCES `mecanico` (`Id_Mecanico`),
  CONSTRAINT `fk_OrdemServico_Orcamento` FOREIGN KEY (`Id_Orcamento`) REFERENCES `orcamento` (`Id_Orcamento`),
  CONSTRAINT `fk_OrdemServico_Veiculo` FOREIGN KEY (`Id_Veiculo`) REFERENCES `veiculo` (`Id_Veiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordemservico`
--

LOCK TABLES `ordemservico` WRITE;
/*!40000 ALTER TABLE `ordemservico` DISABLE KEYS */;
INSERT INTO `ordemservico` VALUES (1,'2023-11-30 07:55:05','2023-12-02 14:15:05',5,2,6,1,3),(2,'2023-12-02 10:30:00','2023-12-03 17:30:00',6,3,8,4,1);
/*!40000 ALTER TABLE `ordemservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peca`
--

DROP TABLE IF EXISTS `peca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peca` (
  `Id_Peca` int NOT NULL AUTO_INCREMENT,
  `Nome_Peca` varchar(100) DEFAULT NULL,
  `Valor_Peca` float DEFAULT '0',
  PRIMARY KEY (`Id_Peca`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peca`
--

LOCK TABLES `peca` WRITE;
/*!40000 ALTER TABLE `peca` DISABLE KEYS */;
INSERT INTO `peca` VALUES (1,'Amortecedor',200),(2,'Coxim Dianteiro Motor',800),(3,'Suporte De Motor Automotivo',300),(4,'Terminal de Direção',221),(5,'Kit de Suspensão a Rosca Slim',1200);
/*!40000 ALTER TABLE `peca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peca_orcamento`
--

DROP TABLE IF EXISTS `peca_orcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peca_orcamento` (
  `Id_Peca` int DEFAULT NULL,
  `Id_Orcamento` int DEFAULT NULL,
  KEY `fk_peca_Orcamento_Peça` (`Id_Peca`),
  KEY `fk_Peca_Orcamento_orcamento` (`Id_Orcamento`),
  CONSTRAINT `fk_Peca_Orcamento_orcamento` FOREIGN KEY (`Id_Orcamento`) REFERENCES `orcamento` (`Id_Orcamento`),
  CONSTRAINT `fk_peca_Orcamento_Peça` FOREIGN KEY (`Id_Peca`) REFERENCES `peca` (`Id_Peca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peca_orcamento`
--

LOCK TABLES `peca_orcamento` WRITE;
/*!40000 ALTER TABLE `peca_orcamento` DISABLE KEYS */;
INSERT INTO `peca_orcamento` VALUES (NULL,5),(5,6),(2,7),(NULL,8);
/*!40000 ALTER TABLE `peca_orcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecaestoque`
--

DROP TABLE IF EXISTS `pecaestoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecaestoque` (
  `Id_Peca` int NOT NULL,
  `Id_Estoque` int NOT NULL,
  PRIMARY KEY (`Id_Estoque`,`Id_Peca`),
  KEY `fk_PecaEstoque_Peca` (`Id_Peca`),
  CONSTRAINT `fk_PecaEstoque_Estoque` FOREIGN KEY (`Id_Estoque`) REFERENCES `estoque` (`Id_Estoque`),
  CONSTRAINT `fk_PecaEstoque_Peca` FOREIGN KEY (`Id_Peca`) REFERENCES `peca` (`Id_Peca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecaestoque`
--

LOCK TABLES `pecaestoque` WRITE;
/*!40000 ALTER TABLE `pecaestoque` DISABLE KEYS */;
INSERT INTO `pecaestoque` VALUES (1,2),(2,4),(3,1),(4,5),(5,3);
/*!40000 ALTER TABLE `pecaestoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo` (
  `Id_Veiculo` int NOT NULL AUTO_INCREMENT,
  `identificacao` varchar(100) NOT NULL,
  `Placa` char(7) NOT NULL,
  `Registro` char(11) NOT NULL,
  `Id_Cliente` int DEFAULT NULL,
  PRIMARY KEY (`Id_Veiculo`),
  UNIQUE KEY `unique_Placa_Veiculo` (`Placa`),
  UNIQUE KEY `unique_Registro_Veículo` (`Registro`),
  KEY `fk_Veiculo_Cliente` (`Id_Cliente`),
  CONSTRAINT `fk_Veiculo_Cliente` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`id_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,'Chevrolet Onix (ano 2010) - Vermelho','MKJ3E55','32569887778',2),(2,'Ford Ka (ano 2019) - Prata','ATP6J88','11336588999',3),(3,'Fiat Uno (ano 2005) - Preto','OPU35O5','66449985311',1),(4,' Volkswagen Polo (ano 2020) - Branco','AVM98P6','32659977445',4);
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-31 13:56:21
