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
-- Dumping data for table `acompanhamento`
--

LOCK TABLES `acompanhamento` WRITE;
/*!40000 ALTER TABLE `acompanhamento` DISABLE KEYS */;
INSERT INTO `acompanhamento` VALUES (1,1,'Finalizado'),(2,2,'Finalizado');
/*!40000 ALTER TABLE `acompanhamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Rodrigo dos Santos','65896547789','1265891153','1998-09-15','Rua dos Papagaios 235, Cidade das Flores','44-12354-2214',NULL),(2,'Rose M. Souza','65412398712','1265474415','1985-05-15','Rua Brasil, 136, Centro - Cidade das Flores','44-12354-2145','Rose@gmail.com'),(3,'Sidnei da Silva','12362355477','1457856587','1961-08-20','Rua dos Passaros, 1550, Centro - Cidade das Flores','44-11233-1125','sidineids@gmail.com'),(4,'Jurandir Fonseca','98745365214','1235465887','1959-03-24','Rua Valente, 569, Centro - Cidade das Flores','44-33225-3256',NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'Rio de janiro',150),(2,'Rio de janiro',400),(3,'São Paulo',360),(4,'São Paulo',80),(5,'Goiás',95);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `formapagamento`
--

LOCK TABLES `formapagamento` WRITE;
/*!40000 ALTER TABLE `formapagamento` DISABLE KEYS */;
INSERT INTO `formapagamento` VALUES (6,'Cartão de Crédito'),(7,'Cartão de Débito'),(8,'Pix'),(10,'Boleto bancário');
/*!40000 ALTER TABLE `formapagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `maodeobra`
--

LOCK TABLES `maodeobra` WRITE;
/*!40000 ALTER TABLE `maodeobra` DISABLE KEYS */;
INSERT INTO `maodeobra` VALUES (1,'Concerto de Motor',1500),(2,'Revisão Completa',500),(3,'Concerto da Suspensão',399),(4,'Concerto da Direção',150),(5,'Concerto dos Amortecedores',750);
/*!40000 ALTER TABLE `maodeobra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `maodeobra_orcamento`
--

LOCK TABLES `maodeobra_orcamento` WRITE;
/*!40000 ALTER TABLE `maodeobra_orcamento` DISABLE KEYS */;
INSERT INTO `maodeobra_orcamento` VALUES (2,5),(3,6),(1,7),(2,8);
/*!40000 ALTER TABLE `maodeobra_orcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mecanico`
--

LOCK TABLES `mecanico` WRITE;
/*!40000 ALTER TABLE `mecanico` DISABLE KEYS */;
INSERT INTO `mecanico` VALUES (1,'Marcos dos Santos','Eletricista',9784),(2,'Jefferson Nascimento','Mecânico Geral',9874),(3,'Antônio Moraes','Suspensão',9589),(4,'Diego Martins','Mecânico Geral',9658);
/*!40000 ALTER TABLE `mecanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `orcamento`
--

LOCK TABLES `orcamento` WRITE;
/*!40000 ALTER TABLE `orcamento` DISABLE KEYS */;
INSERT INTO `orcamento` VALUES (5,'2023-11-30 07:30:05','Revisão','Aprovado',500,2,1,3),(6,'2023-12-02 10:00:15','Conserto','Aprovado',1300,3,4,1),(7,'2023-12-05 13:20:30','Conserto','Cancelado',1300,4,3,4),(8,'2023-12-19 10:15:10','Revisão','Aguardando Confirmação',800,4,2,2);
/*!40000 ALTER TABLE `orcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ordemservico`
--

LOCK TABLES `ordemservico` WRITE;
/*!40000 ALTER TABLE `ordemservico` DISABLE KEYS */;
INSERT INTO `ordemservico` VALUES (1,'2023-11-30 07:55:05','2023-12-02 14:15:05',5,2,6,1,3),(2,'2023-12-02 10:30:00','2023-12-03 17:30:00',6,3,8,4,1);
/*!40000 ALTER TABLE `ordemservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `peca`
--

LOCK TABLES `peca` WRITE;
/*!40000 ALTER TABLE `peca` DISABLE KEYS */;
INSERT INTO `peca` VALUES (1,'Amortecedor',200),(2,'Coxim Dianteiro Motor',800),(3,'Suporte De Motor Automotivo',300),(4,'Terminal de Direção',221),(5,'Kit de Suspensão a Rosca Slim',1200);
/*!40000 ALTER TABLE `peca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `peca_orcamento`
--

LOCK TABLES `peca_orcamento` WRITE;
/*!40000 ALTER TABLE `peca_orcamento` DISABLE KEYS */;
INSERT INTO `peca_orcamento` VALUES (NULL,5),(5,6),(2,7),(NULL,8);
/*!40000 ALTER TABLE `peca_orcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pecaestoque`
--

LOCK TABLES `pecaestoque` WRITE;
/*!40000 ALTER TABLE `pecaestoque` DISABLE KEYS */;
INSERT INTO `pecaestoque` VALUES (1,2),(2,4),(3,1),(4,5),(5,3);
/*!40000 ALTER TABLE `pecaestoque` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2024-01-31 15:07:20
