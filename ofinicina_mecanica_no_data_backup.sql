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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-31 15:03:19
