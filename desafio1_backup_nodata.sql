-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: desafio1
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `cadastro`
--

DROP TABLE IF EXISTS `cadastro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadastro` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `identificação` enum('Jurídica','Física') NOT NULL,
  `pjuridica_id` int DEFAULT NULL,
  `pfisica_id` int DEFAULT NULL,
  PRIMARY KEY (`cliente_id`),
  KEY `fk_cliente_fisica` (`pfisica_id`),
  KEY `fk_cliente_juridica` (`pjuridica_id`),
  CONSTRAINT `fk_cliente_fisica` FOREIGN KEY (`pfisica_id`) REFERENCES `pessoafisica` (`pfisica_id`),
  CONSTRAINT `fk_cliente_juridica` FOREIGN KEY (`pjuridica_id`) REFERENCES `pessoajuridica` (`pjuridica_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cartaocredito`
--

DROP TABLE IF EXISTS `cartaocredito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartaocredito` (
  `cartaocredito_id` int NOT NULL AUTO_INCREMENT,
  `ccpagamento_id` int DEFAULT NULL,
  `Nome` varchar(20) NOT NULL,
  `numero` char(16) NOT NULL,
  `data_vencimento` char(4) NOT NULL,
  `cvc` char(3) NOT NULL,
  `cpf` char(11) NOT NULL,
  `valor` float DEFAULT NULL,
  `status` enum('Aprovado','Rejeitado','Processando') DEFAULT 'Processando',
  PRIMARY KEY (`cartaocredito_id`),
  UNIQUE KEY `numero` (`numero`),
  UNIQUE KEY `cvc` (`cvc`),
  UNIQUE KEY `cpf` (`cpf`),
  KEY `fk_cartaocredito_pagamento` (`ccpagamento_id`),
  CONSTRAINT `fk_cartaocredito_pagamento` FOREIGN KEY (`ccpagamento_id`) REFERENCES `pagamento` (`pagamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consignado`
--

DROP TABLE IF EXISTS `consignado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consignado` (
  `consignado_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `CPF` char(11) DEFAULT NULL,
  `telefone` char(11) NOT NULL,
  PRIMARY KEY (`consignado_id`),
  UNIQUE KEY `unique_cpf_seller` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `entrega_id` int NOT NULL AUTO_INCREMENT,
  `entregapedido_id` int DEFAULT NULL,
  `status_entrega` enum('Em transporte','Separado','Entregue','Não Enviado') DEFAULT 'Não Enviado',
  `código` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`entrega_id`),
  KEY `fk_entrega_pedido` (`entregapedido_id`),
  CONSTRAINT `fk_entrega_pedido` FOREIGN KEY (`entregapedido_id`) REFERENCES `pedidos` (`pedido_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `estoque_id` int NOT NULL AUTO_INCREMENT,
  `localização` varchar(45) NOT NULL,
  `quantidade` int DEFAULT '0',
  PRIMARY KEY (`estoque_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estoquedoproduto`
--

DROP TABLE IF EXISTS `estoquedoproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoquedoproduto` (
  `estoquep_id` int NOT NULL,
  `produtoe_id` int NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`estoquep_id`,`produtoe_id`),
  KEY `fk_estoqueproduto_produto` (`produtoe_id`),
  CONSTRAINT `fk_estoqueproduto_estoque` FOREIGN KEY (`estoquep_id`) REFERENCES `estoque` (`estoque_id`),
  CONSTRAINT `fk_estoqueproduto_produto` FOREIGN KEY (`produtoe_id`) REFERENCES `produto` (`produto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `fornecedor_id` int NOT NULL AUTO_INCREMENT,
  `nomesocial` varchar(255) NOT NULL,
  `CNPJ` char(15) NOT NULL,
  `contato` varchar(11) NOT NULL,
  PRIMARY KEY (`fornecedor_id`),
  UNIQUE KEY `unique_supplier` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `pagamento_id` int NOT NULL AUTO_INCREMENT,
  `pedidopag_id` int DEFAULT NULL,
  `clientpag_id` int DEFAULT NULL,
  `valor` float NOT NULL,
  `datapagamemto` date NOT NULL,
  `metodopagamento` enum('Pix','Cartão de Crédito','Boleto') NOT NULL,
  PRIMARY KEY (`pagamento_id`),
  KEY `fk_pagamento_pedido` (`pedidopag_id`),
  KEY `fk_pagamento_cliente` (`clientpag_id`),
  CONSTRAINT `fk_pagamento_cliente` FOREIGN KEY (`clientpag_id`) REFERENCES `cadastro` (`cliente_id`),
  CONSTRAINT `fk_pagamento_pedido` FOREIGN KEY (`pedidopag_id`) REFERENCES `pedidos` (`pedido_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `pedido_id` int NOT NULL AUTO_INCREMENT,
  `status_pedido` enum('Confirmado','Cancelado','Processando') DEFAULT 'Processando',
  `Descricao` varchar(80) DEFAULT NULL,
  `frete` float DEFAULT NULL,
  `valortotal` float NOT NULL,
  `clienteped_id` int DEFAULT NULL,
  PRIMARY KEY (`pedido_id`),
  KEY `fk_pedido_client` (`clienteped_id`),
  CONSTRAINT `fk_pedido_client` FOREIGN KEY (`clienteped_id`) REFERENCES `cadastro` (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pessoafisica`
--

DROP TABLE IF EXISTS `pessoafisica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoafisica` (
  `pfisica_id` int NOT NULL AUTO_INCREMENT,
  `CPF` char(11) NOT NULL,
  `RG` char(9) NOT NULL,
  `fname` varchar(15) DEFAULT NULL,
  `lname` varchar(15) DEFAULT NULL,
  `sexo` enum('Masculino','Feminino','Não Informado') DEFAULT 'Não Informado',
  `rua` varchar(50) DEFAULT NULL,
  `bairro` varchar(20) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  `numero_end` char(6) DEFAULT NULL,
  `telefone` char(11) DEFAULT NULL,
  PRIMARY KEY (`pfisica_id`),
  UNIQUE KEY `unique_cpf_pessoafisica` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pessoajuridica`
--

DROP TABLE IF EXISTS `pessoajuridica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoajuridica` (
  `pjuridica_id` int NOT NULL AUTO_INCREMENT,
  `CNPJ` char(14) NOT NULL,
  `nomefantasia` varchar(15) DEFAULT NULL,
  `razao_social` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pjuridica_id`),
  UNIQUE KEY `unique_cnpj_pessoajuridica` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pix`
--

DROP TABLE IF EXISTS `pix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pix` (
  `pix_id` int NOT NULL AUTO_INCREMENT,
  `pagamentopix_id` int DEFAULT NULL,
  `valor` float NOT NULL,
  `status_pix` enum('Pago','Não Pago') DEFAULT 'Não Pago',
  PRIMARY KEY (`pix_id`),
  KEY `fk_pix_pagamento` (`pagamentopix_id`),
  CONSTRAINT `fk_pix_pagamento` FOREIGN KEY (`pagamentopix_id`) REFERENCES `pagamento` (`pagamento_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `produto_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `categoria` enum('Vestuário','Tênis','Acessório') NOT NULL,
  `tamanho` varchar(5) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `descrição` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`produto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produtosconsignados`
--

DROP TABLE IF EXISTS `produtosconsignados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtosconsignados` (
  `consignadoprod_id` int DEFAULT NULL,
  `produtocons_id` int DEFAULT NULL,
  `quantidade` int NOT NULL,
  KEY `fk_consignadoproduto_consignado` (`consignadoprod_id`),
  KEY `fk_consignadoproduto_produto` (`produtocons_id`),
  CONSTRAINT `fk_consignadoproduto_consignado` FOREIGN KEY (`consignadoprod_id`) REFERENCES `consignado` (`consignado_id`),
  CONSTRAINT `fk_consignadoproduto_produto` FOREIGN KEY (`produtocons_id`) REFERENCES `produto` (`produto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-22 22:06:11
