-- MySQL dump 10.13  Distrib 8.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
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
-- Table structure for table `acompanhamentopedido`
--

DROP TABLE IF EXISTS `acompanhamentopedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acompanhamentopedido` (
  `Id_AcompanhamentoPedido` int NOT NULL AUTO_INCREMENT,
  `StatusAPedido` enum('Preparando Pedido','Enviado','Em Trânsito','Entregue') DEFAULT NULL,
  `CodigoRastreio` float DEFAULT NULL,
  `Id_Pedido` int DEFAULT NULL,
  PRIMARY KEY (`Id_AcompanhamentoPedido`),
  KEY `fk_AcompanhamentoPedido_pedido` (`Id_Pedido`),
  CONSTRAINT `fk_AcompanhamentoPedido_pedido` FOREIGN KEY (`Id_Pedido`) REFERENCES `pedido` (`id_Pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acompanhamentopedido`
--

LOCK TABLES `acompanhamentopedido` WRITE;
/*!40000 ALTER TABLE `acompanhamentopedido` DISABLE KEYS */;
INSERT INTO `acompanhamentopedido` VALUES (1,'Enviado',23515900000,3),(2,'Entregue',23658500000,1),(3,'Em Trânsito',23554800000,2),(4,'Preparando Pedido',235133000000,4);
/*!40000 ALTER TABLE `acompanhamentopedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `administrador_view`
--

DROP TABLE IF EXISTS `administrador_view`;
/*!50001 DROP VIEW IF EXISTS `administrador_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `administrador_view` AS SELECT 
 1 AS `Id_Cliente`,
 1 AS `Endereço`,
 1 AS `Telefone`,
 1 AS `Email`,
 1 AS `Id_Pedido`,
 1 AS `StatusPedido`,
 1 AS `TipoFormaPagamento`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `boletobancario`
--

DROP TABLE IF EXISTS `boletobancario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boletobancario` (
  `ID_BoletoBancario` int NOT NULL AUTO_INCREMENT,
  `ID_FormaPagamento` int DEFAULT NULL,
  `CodigoBarras` varchar(50) DEFAULT NULL,
  `DataEmissao` date DEFAULT NULL,
  `DataVencimento` date DEFAULT NULL,
  PRIMARY KEY (`ID_BoletoBancario`),
  UNIQUE KEY `CodigoBarras` (`CodigoBarras`),
  UNIQUE KEY `unique_CodigoBarras_BoletoBancario` (`CodigoBarras`),
  KEY `FK_BoletoBancario_FormaPagamento` (`ID_FormaPagamento`),
  CONSTRAINT `FK_BoletoBancario_FormaPagamento` FOREIGN KEY (`ID_FormaPagamento`) REFERENCES `formapagamento` (`Id_FormaPagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boletobancario`
--

LOCK TABLES `boletobancario` WRITE;
/*!40000 ALTER TABLE `boletobancario` DISABLE KEYS */;
INSERT INTO `boletobancario` VALUES (1,4,'123456789012345678901234567890123456789012','2023-12-01','2023-12-15'),(2,4,'132547851256632546435415645456456845454465','2023-11-28','2023-12-27');
/*!40000 ALTER TABLE `boletobancario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartao`
--

DROP TABLE IF EXISTS `cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartao` (
  `Id_Cartão` int NOT NULL AUTO_INCREMENT,
  `NomeTitular` varchar(45) NOT NULL,
  `NumeroCartao` varchar(45) NOT NULL,
  `DataValidade` date NOT NULL,
  `CodigoSeguranca` char(3) NOT NULL,
  `Banco` varchar(30) DEFAULT NULL,
  `TipoCartao` enum('Crédito','Débito') DEFAULT NULL,
  `id_FormaPagamento` int DEFAULT NULL,
  PRIMARY KEY (`Id_Cartão`),
  UNIQUE KEY `unique_Numero_Cartao` (`NumeroCartao`),
  KEY `FK_cartão_FormaPagamento` (`id_FormaPagamento`),
  CONSTRAINT `FK_cartão_FormaPagamento` FOREIGN KEY (`id_FormaPagamento`) REFERENCES `formapagamento` (`Id_FormaPagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartao`
--

LOCK TABLES `cartao` WRITE;
/*!40000 ALTER TABLE `cartao` DISABLE KEYS */;
INSERT INTO `cartao` VALUES (1,'Maria J. Souza','4927325139359147','2028-03-24','123','Banco Z','Crédito',1),(2,'Marcos F Ferreira','4921465477896547','2027-09-05','409','Banco Z','Débito',2);
/*!40000 ALTER TABLE `cartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `Id_Cliente` int NOT NULL AUTO_INCREMENT,
  `Endereço` varchar(200) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id_Cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Rua Brasil, 124, Centro - Cidade das Flores','44-12354-2145','mariaj@gmail.com'),(2,'Rua dos Passaros, 1547, Centro - Cidade das Flores','44-11233-1125','antoniok@gmail.com'),(3,'Rua Valente, 545, Centro - Cidade das Flores','44-33225-3256','marcosf@gmail.com'),(4,'Rua Pavão, 1985, Centro - Cidade das Flores','44-32145-2154','joaoa@gmail.com'),(5,'Rua Brasil, 663, Centro - Cidade das Flores','44-65478-6655','isabellabj@gmail.com'),(6,'Rua Jasmin, 894, Centro - Cidade das Flores','44-12354-3254','lucasj@gmail.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Before_Delete_Cliente` BEFORE DELETE ON `cliente` FOR EACH ROW BEGIN
    INSERT INTO ClienteRemovido (Id_Cliente, Endereco, Telefone, Email, MotivoRemocao)
    VALUES (OLD.Id_Cliente, OLD.Endereço, OLD.Telefone, OLD.Email, 'Removido por solicitação do usuário');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `cliente_view`
--

DROP TABLE IF EXISTS `cliente_view`;
/*!50001 DROP VIEW IF EXISTS `cliente_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cliente_view` AS SELECT 
 1 AS `NomeProduto`,
 1 AS `Categoria`,
 1 AS `Valor`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clienteremovido`
--

DROP TABLE IF EXISTS `clienteremovido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clienteremovido` (
  `Id_Cliente` int DEFAULT NULL,
  `Endereco` varchar(200) DEFAULT NULL,
  `Telefone` varchar(15) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `MotivoRemocao` varchar(100) DEFAULT NULL,
  `DataRemocao` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienteremovido`
--

LOCK TABLES `clienteremovido` WRITE;
/*!40000 ALTER TABLE `clienteremovido` DISABLE KEYS */;
/*!40000 ALTER TABLE `clienteremovido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `estoque_view`
--

DROP TABLE IF EXISTS `estoque_view`;
/*!50001 DROP VIEW IF EXISTS `estoque_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `estoque_view` AS SELECT 
 1 AS `Id_LocalEstoque`,
 1 AS `Localização`,
 1 AS `NomeProduto`,
 1 AS `Quantidade`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `formapagamento`
--

DROP TABLE IF EXISTS `formapagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formapagamento` (
  `Id_FormaPagamento` int NOT NULL AUTO_INCREMENT,
  `TipoFormaPagamento` enum('Cartão de Crédito','Cartão de Débito','Boleto Bancário','Pix','Dinheiro') DEFAULT NULL,
  `Valor` float NOT NULL,
  `data_pagamento` date NOT NULL,
  `status` enum('Pendente','Pago','Cancelado') NOT NULL,
  PRIMARY KEY (`Id_FormaPagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapagamento`
--

LOCK TABLES `formapagamento` WRITE;
/*!40000 ALTER TABLE `formapagamento` DISABLE KEYS */;
INSERT INTO `formapagamento` VALUES (1,'Cartão de Crédito',2500,'2023-12-15','Pago'),(2,'Cartão de Débito',89.9,'2023-12-03','Pendente'),(3,'Pix',150,'2023-12-10','Pago'),(4,'Boleto Bancário',39.9,'2023-12-01','Cancelado');
/*!40000 ALTER TABLE `formapagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formapagamentocliente`
--

DROP TABLE IF EXISTS `formapagamentocliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formapagamentocliente` (
  `id_Cliente` int NOT NULL,
  `id_FormaPagamento` int NOT NULL,
  PRIMARY KEY (`id_FormaPagamento`,`id_Cliente`),
  KEY `fk_FormaPagamentoPessoa_Cliente` (`id_Cliente`),
  CONSTRAINT `fk_FormaPagamentoPessoa_Cliente` FOREIGN KEY (`id_Cliente`) REFERENCES `cliente` (`Id_Cliente`),
  CONSTRAINT `fk_FormaPagamentoPessoa_FormaPagamento` FOREIGN KEY (`id_FormaPagamento`) REFERENCES `formapagamento` (`Id_FormaPagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formapagamentocliente`
--

LOCK TABLES `formapagamentocliente` WRITE;
/*!40000 ALTER TABLE `formapagamentocliente` DISABLE KEYS */;
INSERT INTO `formapagamentocliente` VALUES (1,1),(2,4),(3,2),(3,3),(5,3),(6,4);
/*!40000 ALTER TABLE `formapagamentocliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `Id_Fornecedor` int NOT NULL AUTO_INCREMENT,
  `Endereço` varchar(200) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id_Fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Rua Barão, 1544, Centro - Curitiba-PR','44-93266-12354','Topelet@gmail.com'),(2,'Rua America, 3547, Centro - São Paulo-SP','44-93365-16587','simport@gmail.com'),(3,'Rua Barão, 1544, Centro - Curitiba-PR','44-93266-12354','Topelet@gmail.com'),(4,'Rua America, 3547, Centro - São Paulo-SP','44-93365-16587','simport@gmail.com');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `infovendedor_view`
--

DROP TABLE IF EXISTS `infovendedor_view`;
/*!50001 DROP VIEW IF EXISTS `infovendedor_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `infovendedor_view` AS SELECT 
 1 AS `Id_Vendedor`,
 1 AS `NomeVendedor`,
 1 AS `EnderecoVendedor`,
 1 AS `TotalProdutosEmEstoque`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `localestoque`
--

DROP TABLE IF EXISTS `localestoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localestoque` (
  `Id_LocalEstoque` int NOT NULL AUTO_INCREMENT,
  `LocalEstoque` varchar(255) NOT NULL,
  `QuantidadeEstoque` int DEFAULT '0',
  PRIMARY KEY (`Id_LocalEstoque`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localestoque`
--

LOCK TABLES `localestoque` WRITE;
/*!40000 ALTER TABLE `localestoque` DISABLE KEYS */;
INSERT INTO `localestoque` VALUES (1,'RJ',1000),(2,'SP',800),(3,'DF',100);
/*!40000 ALTER TABLE `localestoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordempedido`
--

DROP TABLE IF EXISTS `ordempedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordempedido` (
  `Id_Pedido` int NOT NULL,
  `Id_Produto` int NOT NULL,
  `QuantidadeProduto` int DEFAULT '1',
  `STatusProduto` enum('Disponível','Sem Estque') DEFAULT 'Disponível',
  PRIMARY KEY (`Id_Pedido`,`Id_Produto`),
  KEY `fk_OrdemPedido_Produto` (`Id_Produto`),
  CONSTRAINT `fk_OrdemPedido_Pedido` FOREIGN KEY (`Id_Pedido`) REFERENCES `pedido` (`id_Pedido`),
  CONSTRAINT `fk_OrdemPedido_Produto` FOREIGN KEY (`Id_Produto`) REFERENCES `produto` (`id_Produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordempedido`
--

LOCK TABLES `ordempedido` WRITE;
/*!40000 ALTER TABLE `ordempedido` DISABLE KEYS */;
INSERT INTO `ordempedido` VALUES (1,2,1,'Disponível'),(2,4,1,'Disponível'),(3,3,2,'Sem Estque'),(4,1,2,'Disponível');
/*!40000 ALTER TABLE `ordempedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_Pedido` int NOT NULL AUTO_INCREMENT,
  `id_Cliente` int DEFAULT NULL,
  `id_FormaPagamento` int DEFAULT NULL,
  `StatusPedido` enum('Cancelado','Confirmado','Em Processamento') DEFAULT 'Em Processamento',
  `DescriçãoPedido` varchar(255) DEFAULT NULL,
  `Frete` float DEFAULT '10',
  `Valor` float DEFAULT NULL,
  PRIMARY KEY (`id_Pedido`),
  KEY `fk_Pedido_FormaPagamento` (`id_FormaPagamento`),
  KEY `fk_Pedido_Cliente` (`id_Cliente`),
  CONSTRAINT `fk_Pedido_Cliente` FOREIGN KEY (`id_Cliente`) REFERENCES `cliente` (`Id_Cliente`),
  CONSTRAINT `fk_Pedido_FormaPagamento` FOREIGN KEY (`id_FormaPagamento`) REFERENCES `formapagamento` (`Id_FormaPagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,3,'Confirmado','Compra web site',15.9,150),(2,5,1,'Em Processamento','Compra Via Aplicativo',150,2.5),(3,3,2,'Em Processamento','compra Via aplicativo',10,89.9),(4,2,4,'Cancelado','Compra via web site',10,39.9);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pedidospendentes_view`
--

DROP TABLE IF EXISTS `pedidospendentes_view`;
/*!50001 DROP VIEW IF EXISTS `pedidospendentes_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pedidospendentes_view` AS SELECT 
 1 AS `Id_Pedido`,
 1 AS `Id_Cliente`,
 1 AS `Endereço`,
 1 AS `DescriçãoPedido`,
 1 AS `Valor`,
 1 AS `Frete`,
 1 AS `TipoFormaPagamento`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pessoafisica`
--

DROP TABLE IF EXISTS `pessoafisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoafisica` (
  `id_PessoaFisica` int NOT NULL AUTO_INCREMENT,
  `Id_Cliente` int DEFAULT NULL,
  `id_vendedor` int DEFAULT NULL,
  `Nome` varchar(10) NOT NULL,
  `MeioNome` char(3) NOT NULL,
  `Sobrenome` varchar(20) NOT NULL,
  `CPF` char(11) NOT NULL,
  `RG` char(10) NOT NULL,
  `DataNascimento` date NOT NULL,
  PRIMARY KEY (`id_PessoaFisica`),
  UNIQUE KEY `unique_CPF_PessoaFisica` (`CPF`),
  UNIQUE KEY `unique_RG_PessoaFisica` (`RG`),
  UNIQUE KEY `Id_Cliente` (`Id_Cliente`),
  KEY `fk_PessoaFisica_Vendedor` (`id_vendedor`),
  CONSTRAINT `fk_PessoaFisica_Cliente` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`Id_Cliente`),
  CONSTRAINT `fk_PessoaFisica_Vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`Id_Vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoafisica`
--

LOCK TABLES `pessoafisica` WRITE;
/*!40000 ALTER TABLE `pessoafisica` DISABLE KEYS */;
INSERT INTO `pessoafisica` VALUES (1,1,NULL,'Maria','J','Souza','65412398712','126547441','2001-05-15'),(2,2,NULL,'Antonio','k','Santos','12365477789','1457851114','1989-08-20'),(3,3,NULL,'Marcos','F','Ferreira','98745987887','1235487744','1998-03-24'),(4,4,NULL,'João','A','Filho','65498778992','651234886','1968-09-30'),(5,5,NULL,'Isabella','B','Silva','65488896388','657854551','2003-07-15'),(6,6,NULL,'Lucas','J','Zacarias','12366654792','651251772','1993-03-28'),(11,NULL,3,'Clayton','J','Santos','65359826587','193268767','1998-03-21'),(12,NULL,4,'Jessica','A','Gonçalves','18326922165','183264662','1997-10-09');
/*!40000 ALTER TABLE `pessoafisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoajuridica`
--

DROP TABLE IF EXISTS `pessoajuridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoajuridica` (
  `id_PessoaJuridica` int NOT NULL AUTO_INCREMENT,
  `Id_Cliente` int DEFAULT NULL,
  `Id_Vendedor` int DEFAULT NULL,
  `Id_Fornecedor` int DEFAULT NULL,
  `RazaoSocial` varchar(45) NOT NULL,
  `NomeFantasia` varchar(45) DEFAULT NULL,
  `CNPJ` char(14) NOT NULL,
  `IE` char(9) NOT NULL,
  PRIMARY KEY (`id_PessoaJuridica`),
  UNIQUE KEY `unique_CNPJ_Pessoa_Juridica` (`CNPJ`),
  UNIQUE KEY `unique__IE_Pessoa_Juridica` (`IE`),
  UNIQUE KEY `Id_Cliente` (`Id_Cliente`),
  KEY `fk_PessoaJuridica_Vendedor` (`Id_Vendedor`),
  KEY `fk_PessoaJuridica_Fornecedor` (`Id_Fornecedor`),
  CONSTRAINT `fk_PessoaJuridica_Cliente` FOREIGN KEY (`Id_Cliente`) REFERENCES `cliente` (`Id_Cliente`),
  CONSTRAINT `fk_PessoaJuridica_Fornecedor` FOREIGN KEY (`Id_Fornecedor`) REFERENCES `fornecedor` (`Id_Fornecedor`),
  CONSTRAINT `fk_PessoaJuridica_Vendedor` FOREIGN KEY (`Id_Vendedor`) REFERENCES `vendedor` (`Id_Vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoajuridica`
--

LOCK TABLES `pessoajuridica` WRITE;
/*!40000 ALTER TABLE `pessoajuridica` DISABLE KEYS */;
INSERT INTO `pessoajuridica` VALUES (1,NULL,NULL,1,'Souza e Souza','Tecidos Souza','23125124000155','32658745'),(2,NULL,NULL,2,'Ma Brinquedos LTDA','Mix Brinquedos','56222547000100','33558798'),(3,NULL,3,NULL,'Tancredo Eletronicos','Top Eletrônicos','54562125000165','332548796'),(4,NULL,4,NULL,'Silva Importados Ltda','Moveis Silva','33254778888898','336587779');
/*!40000 ALTER TABLE `pessoajuridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pix`
--

DROP TABLE IF EXISTS `pix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pix` (
  `Id_Pix` int NOT NULL AUTO_INCREMENT,
  `ChavePix` varchar(45) NOT NULL,
  `id_FormaPagamento` int DEFAULT NULL,
  PRIMARY KEY (`Id_Pix`),
  UNIQUE KEY `ChavePix` (`ChavePix`),
  UNIQUE KEY `unique_Chave_Pix` (`ChavePix`),
  KEY `fk_Pix_FormaPagamento` (`id_FormaPagamento`),
  CONSTRAINT `fk_Pix_FormaPagamento` FOREIGN KEY (`id_FormaPagamento`) REFERENCES `formapagamento` (`Id_FormaPagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pix`
--

LOCK TABLES `pix` WRITE;
/*!40000 ALTER TABLE `pix` DISABLE KEYS */;
INSERT INTO `pix` VALUES (1,'isabellabj@gmail.com',3),(2,'-36437',3);
/*!40000 ALTER TABLE `pix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `id_Produto` int NOT NULL AUTO_INCREMENT,
  `Pnome` varchar(50) DEFAULT NULL,
  `Classificacao_Kids` tinyint(1) DEFAULT '0',
  `Categoria` enum('Eletrônico','Vestuário','Brinquedos','Alimentos','Móveis') NOT NULL,
  `Valor` float NOT NULL,
  `Avaliação` float DEFAULT '0',
  `Tamanho` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_Produto`),
  UNIQUE KEY `index_Pnome` (`Pnome`),
  KEY `idx_categoria_produto` (`Categoria`) USING BTREE,
  KEY `idx_avaliacao_produto` (`Avaliação` DESC) USING BTREE,
  KEY `idx_nome_produto` (`Pnome`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Caixa de som LG',0,'Eletrônico',129.9,4,NULL),(2,'Barbie Elsa',1,'Brinquedos',69.9,3,NULL),(3,'Macacão T. Tigre',1,'Vestuário',129.9,5,NULL),(4,'Sofá Retratil',0,'Móveis',2.599,5,NULL),(5,'Chips Cheetos',1,'Alimentos',8.99,2,NULL),(6,'Pendrive',0,'Eletrônico',39.9,0,NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtoestoque`
--

DROP TABLE IF EXISTS `produtoestoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtoestoque` (
  `Id_LocalEstoque` int NOT NULL,
  `Id_Produto` int NOT NULL,
  `Localização` varchar(255) NOT NULL,
  `Quantidade` float DEFAULT NULL,
  PRIMARY KEY (`Id_LocalEstoque`,`Id_Produto`),
  KEY `fk_ProdutoEstoque_Produto` (`Id_Produto`),
  CONSTRAINT `fk_ProdutoEstoque_LocalEstoque` FOREIGN KEY (`Id_LocalEstoque`) REFERENCES `localestoque` (`Id_LocalEstoque`),
  CONSTRAINT `fk_ProdutoEstoque_Produto` FOREIGN KEY (`Id_Produto`) REFERENCES `produto` (`id_Produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtoestoque`
--

LOCK TABLES `produtoestoque` WRITE;
/*!40000 ALTER TABLE `produtoestoque` DISABLE KEYS */;
INSERT INTO `produtoestoque` VALUES (1,2,'Rio de janeiro',120),(1,5,'Rio de janeiro',750),(2,1,'São Paulo',1000),(2,2,'São Paulo',120),(2,3,'São Paulo',623),(2,6,'São Paulo',50),(3,4,'Brasilia',51);
/*!40000 ALTER TABLE `produtoestoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtovendedor`
--

DROP TABLE IF EXISTS `produtovendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtovendedor` (
  `Id_Vendedor` int NOT NULL,
  `Id_Produto` int NOT NULL,
  `Quantidade` int DEFAULT '0',
  PRIMARY KEY (`Id_Vendedor`,`Id_Produto`),
  KEY `fk_ProdutoVendedor_Produto` (`Id_Produto`),
  CONSTRAINT `fk_ProdutoVendedor_Produto` FOREIGN KEY (`Id_Produto`) REFERENCES `produto` (`id_Produto`),
  CONSTRAINT `fk_ProdutoVendedor_Vendedor` FOREIGN KEY (`Id_Vendedor`) REFERENCES `vendedor` (`Id_Vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtovendedor`
--

LOCK TABLES `produtovendedor` WRITE;
/*!40000 ALTER TABLE `produtovendedor` DISABLE KEYS */;
INSERT INTO `produtovendedor` VALUES (1,2,100),(1,3,55),(2,4,20);
/*!40000 ALTER TABLE `produtovendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabela_user`
--

DROP TABLE IF EXISTS `tabela_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabela_user` (
  `nome_tabela` varchar(100) DEFAULT NULL,
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabela_user`
--

LOCK TABLES `tabela_user` WRITE;
/*!40000 ALTER TABLE `tabela_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabela_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `Id_Vendedor` int NOT NULL AUTO_INCREMENT,
  `Endereço` varchar(200) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id_Vendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'Rua Santos, 1544, Centro - São Jose-SP','11-15477-1554','souzaesouza@gmail.com'),(2,'Rua das Limeiras, 3258, Centro - Blumenau-SC','11-65877-2255','mabrinq@gmail.com'),(3,'Rua Brasil, 168, Centro - Cidade das Flores','44-12368-2122','claytonj@gmail.com'),(4,'Jasmin, 897, Centro - Cidade das Flores','44-12365-6658','jessicaa@gmail.com');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ecommerce'
--
/*!50003 DROP PROCEDURE IF EXISTS `InserirClienteEFormaPagamento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InserirClienteEFormaPagamento`(
    IN endereco_cliente VARCHAR(200),
    IN telefone_cliente VARCHAR(15),
    IN email_cliente VARCHAR(30),
    IN tipo_forma_pagamento ENUM('Cartão de Crédito', 'Boleto Bancário', 'Outro'),
    IN valor_pagamento FLOAT
)
BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
ROLLBACK TO my_savepoint;
	SELECT 'Erro durante a transação. As alterações foram desfeitas.' AS Mensagem;
END;

START TRANSACTION;
SAVEPOINT my_savepoint;
INSERT INTO Cliente (Endereço, telefone, email)
VALUES ( 'Rua Brasil, 350, Centro - Cidade das Flores', '44-12354-2668', 'JoaquimM@gmail.com'
);
SET @novoClienteId = LAST_INSERT_ID();
INSERT INTO FormaPagamento (TipoFormaPagamento, Valor, data_pagamento, status)
VALUES ('Cartão de Crédito', 21.00, CURDATE(), 'Pendente');
SET @novaFormaPagamentoId = LAST_INSERT_ID();
UPDATE Cliente SET id_FormaPagamento = @novaFormaPagamentoId WHERE Id_Cliente = @novoClienteId;
COMMIT;
    SELECT 'Cliente e forma de pagamento inseridos com sucesso!' AS Mensagem;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManipularDadosECommerce` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManipularDadosECommerce`(
    IN p_acao INT,
    IN p_id INT,   
    IN p_novo_valor VARCHAR(255) 
)
BEGIN
    IF p_acao = 1 THEN
        SELECT * FROM SuaTabela WHERE Id = p_id;
    END IF;
    IF p_acao = 2 THEN
        UPDATE SuaTabela SET NomeColuna = p_novo_valor WHERE Id = p_id;
    END IF;
    IF p_acao = 3 THEN
        DELETE FROM SuaTabela WHERE Id = p_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ManipularDadosProduto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManipularDadosProduto`(
    IN p_acao INT,       -- Variável de controle (1 - SELECT, 2 - UPDATE, 3 - DELETE)
    IN p_id INT,         -- ID do produto (quando aplicável)
    IN p_novo_nome VARCHAR(255), -- Novo nome para atualização (quando aplicável)
    IN p_nova_categoria ENUM('Eletrônico', 'Vestuário', 'Brinquedos', 'Alimentos', 'Móveis'), -- Nova categoria para atualização (quando aplicável)
    IN p_novo_valor FLOAT -- Novo valor para atualização (quando aplicável)
)
BEGIN
    -- Se a ação for SELECT
    IF p_acao = 1 THEN
        SELECT * FROM Produto WHERE id_Produto = p_id;
    END IF;
    -- Se a ação for UPDATE
    IF p_acao = 2 THEN
        UPDATE Produto
        SET Pnome = CASE WHEN p_novo_nome IS NOT NULL THEN p_novo_nome ELSE Pnome END,
            Categoria = CASE WHEN p_nova_categoria IS NOT NULL THEN p_nova_categoria ELSE Categoria END,
            Valor = CASE WHEN p_novo_valor IS NOT NULL THEN p_novo_valor ELSE Valor END
        WHERE id_Produto = p_id;
    END IF;

    -- Se a ação for DELETE
    IF p_acao = 3 THEN
        DELETE FROM Produto WHERE id_Produto = p_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `administrador_view`
--

/*!50001 DROP VIEW IF EXISTS `administrador_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `administrador_view` AS select 1 AS `Id_Cliente`,1 AS `Endereço`,1 AS `Telefone`,1 AS `Email`,1 AS `Id_Pedido`,1 AS `StatusPedido`,1 AS `TipoFormaPagamento` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cliente_view`
--

/*!50001 DROP VIEW IF EXISTS `cliente_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cliente_view` AS select `produto`.`Pnome` AS `NomeProduto`,`produto`.`Categoria` AS `Categoria`,`produto`.`Valor` AS `Valor` from `produto` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `estoque_view`
--

/*!50001 DROP VIEW IF EXISTS `estoque_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `estoque_view` AS select `pe`.`Id_LocalEstoque` AS `Id_LocalEstoque`,`pe`.`Localização` AS `Localização`,`p`.`Pnome` AS `NomeProduto`,`pe`.`Quantidade` AS `Quantidade` from (`produtoestoque` `pe` join `produto` `p` on((`pe`.`Id_Produto` = `p`.`id_Produto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `infovendedor_view`
--

/*!50001 DROP VIEW IF EXISTS `infovendedor_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `infovendedor_view` AS select `vendedor`.`Id_Vendedor` AS `Id_Vendedor`,concat(`pessoafisica`.`Nome`,' ',`pessoafisica`.`Sobrenome`) AS `NomeVendedor`,`vendedor`.`Endereço` AS `EnderecoVendedor`,count(`produtovendedor`.`Id_Produto`) AS `TotalProdutosEmEstoque` from ((`vendedor` join `pessoafisica` on((`vendedor`.`Id_Vendedor` = `pessoafisica`.`id_vendedor`))) left join `produtovendedor` on((`vendedor`.`Id_Vendedor` = `produtovendedor`.`Id_Vendedor`))) group by `vendedor`.`Id_Vendedor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pedidospendentes_view`
--

/*!50001 DROP VIEW IF EXISTS `pedidospendentes_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pedidospendentes_view` AS select `p`.`id_Pedido` AS `Id_Pedido`,`c`.`Id_Cliente` AS `Id_Cliente`,`c`.`Endereço` AS `Endereço`,`p`.`DescriçãoPedido` AS `DescriçãoPedido`,`p`.`Valor` AS `Valor`,`p`.`Frete` AS `Frete`,`fp`.`TipoFormaPagamento` AS `TipoFormaPagamento` from ((`pedido` `p` join `cliente` `c` on((`p`.`id_Cliente` = `c`.`Id_Cliente`))) join `formapagamento` `fp` on((`p`.`id_FormaPagamento` = `fp`.`Id_FormaPagamento`))) where (`p`.`StatusPedido` = 'Em Processamento') */;
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

-- Dump completed on 2024-01-31 13:15:57
