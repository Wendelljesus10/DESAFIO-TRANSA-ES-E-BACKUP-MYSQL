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
-- Dumping data for table `cadastro`
--

LOCK TABLES `cadastro` WRITE;
/*!40000 ALTER TABLE `cadastro` DISABLE KEYS */;
INSERT INTO `cadastro` VALUES (1,'Física',NULL,1),(2,'Física',NULL,2),(3,'Física',NULL,3),(4,'Física',NULL,4),(5,'Física',NULL,5),(6,'Jurídica',1,NULL),(7,'Física',NULL,1),(8,'Física',NULL,2),(9,'Física',NULL,3),(10,'Física',NULL,4),(11,'Física',NULL,5),(12,'Jurídica',1,NULL);
/*!40000 ALTER TABLE `cadastro` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `cartaocredito`
--

LOCK TABLES `cartaocredito` WRITE;
/*!40000 ALTER TABLE `cartaocredito` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartaocredito` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `consignado`
--

LOCK TABLES `consignado` WRITE;
/*!40000 ALTER TABLE `consignado` DISABLE KEYS */;
INSERT INTO `consignado` VALUES (1,'Guilherme','40120365001','14997514698'),(2,'Wendell','41211915875','14998509496'),(3,'Guilherme Ramos','33748198715','11987885030');
/*!40000 ALTER TABLE `consignado` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (7,1,'Em transporte','TR345678912BR'),(21,7,'Entregue','TR112266547BR');
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'São Paulo',2);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `estoquedoproduto`
--

LOCK TABLES `estoquedoproduto` WRITE;
/*!40000 ALTER TABLE `estoquedoproduto` DISABLE KEYS */;
INSERT INTO `estoquedoproduto` VALUES (1,11,1);
/*!40000 ALTER TABLE `estoquedoproduto` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'LK Sneaker','12131415167895','11998509397');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'Confirmado','Air Max 97 CR7',25,1925,1),(7,'Cancelado','Air Max 97 CR7',25,1925,9),(8,'Confirmado','Dunk Travis - 40',15,19015,3),(9,'Confirmado','Camiseta Stussy Logo NY',25,675,4),(10,'Processando','Camiseta ASSC Roses',0,500,5),(11,'Cancelado','Dunk Travis 42',101,20101,6);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `pessoafisica`
--

LOCK TABLES `pessoafisica` WRITE;
/*!40000 ALTER TABLE `pessoafisica` DISABLE KEYS */;
INSERT INTO `pessoafisica` VALUES (1,'4121915875','456322152','Wendell','Rodrigues','Masculino','Rua Altair Leite','Carolina','Bauru','719','14998509496'),(2,'4159875556','333587842','Carolina','Antunes','Feminino','Rua Treze de Maio','Jardim Lais','São Paulo','7219','11998758969'),(3,'8896475624','555789942','Marcele','Juarez','Não Informado','Rua da Graça','Vila Palmas','São Paulo','7889','11998778969'),(4,'8975472556','991234542','Guilherme','Brighes','Masculino','Oscar Freire','Jardins','São Paulo','419','11995552969'),(5,'1237895996','775100242','Henrique','Cartiê','Não Informado','Rua Bahamas','Alphavile','Rio de Janeiro','27','21998457878'),(11,'123456789','12345672','Ronaldo','Alvarez','Masculino','Rua Leite','Carolina','Bauru','719','14998509496');
/*!40000 ALTER TABLE `pessoafisica` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `pessoajuridica`
--

LOCK TABLES `pessoajuridica` WRITE;
/*!40000 ALTER TABLE `pessoajuridica` DISABLE KEYS */;
INSERT INTO `pessoajuridica` VALUES (1,'12345678910123','UNLTD','Comercio Varejo');
/*!40000 ALTER TABLE `pessoajuridica` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `pix`
--

LOCK TABLES `pix` WRITE;
/*!40000 ALTER TABLE `pix` DISABLE KEYS */;
/*!40000 ALTER TABLE `pix` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Dunk Travis','Tênis','42',20000,NULL),(2,'Air Jordan 1 Rebelionare','Tênis','41',2500,NULL),(3,'Camiseta Stussy Logo NY','Vestuário','GG',650,NULL),(4,'Dunk Travis','Tênis','41',20000,NULL),(5,'Dunk Travis','Tênis','40',19000,NULL),(6,'Camiseta Supreme Box Logo','Vestuário','G',750,NULL),(7,'Camiseta ASSC Roses','Vestuário','G',500,NULL),(8,'Camiseta ASSC Roses','Vestuário','GG',500,NULL),(9,'Air Max 97 CR7','Tênis','35',1900,NULL),(10,'Zippo Supreme','Acessório',NULL,500,'Isqueiro'),(11,'Camiseta Nike x Stussy','Vestuário','M',600,'Guilherme'),(12,'Camiseta Nike x Stussy','Vestuário','G',600,'Wendell'),(13,'Air Jordan 1 UNC','Tênis','46',1600,'Guilherme Ramos'),(14,'Dunk Travis','Tênis','42',20000,NULL),(15,'Air Jordan 1 Rebelionare','Tênis','41',2500,NULL),(16,'Camiseta Stussy Logo NY','Vestuário','GG',650,NULL),(17,'Dunk Travis','Tênis','41',20000,NULL),(18,'Dunk Travis','Tênis','40',19000,NULL),(19,'Camiseta Supreme Box Logo','Vestuário','G',750,NULL),(20,'Camiseta ASSC Roses','Vestuário','G',500,NULL),(21,'Camiseta ASSC Roses','Vestuário','GG',500,NULL),(22,'Air Max 97 CR7','Tênis','35',1900,NULL),(23,'Zippo Supreme','Acessório',NULL,500,'Isqueiro'),(24,'Camiseta Nike x Stussy','Vestuário','M',600,'Guilherme'),(25,'Camiseta Nike x Stussy','Vestuário','G',600,'Wendell'),(26,'Air Jordan 1 UNC','Tênis','46',1600,'Guilherme Ramos'),(27,'Samba','Tênis','42',1000,NULL),(28,'Samba','Tênis','42',1000,NULL),(29,'Samba','Tênis','42',1000,NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `produtosconsignados`
--

LOCK TABLES `produtosconsignados` WRITE;
/*!40000 ALTER TABLE `produtosconsignados` DISABLE KEYS */;
INSERT INTO `produtosconsignados` VALUES (1,11,1),(2,12,1),(3,13,1);
/*!40000 ALTER TABLE `produtosconsignados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'desafio1'
--
/*!50003 DROP PROCEDURE IF EXISTS `insert_procedure` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_procedure`(
in produto_id_p int,
in nome_p varchar(50),
in categoria_p enum('Vestuário','Tênis','Acessório'),
in tamanho_p varchar(5),
in valor_p float,
in descricão_p varchar(80)
)
begin 
	DECLARE EXIT HANDLER FOR sqlexception
begin
        select 'Erro durante a transação' AS Resultado;
        rollback;
	END;
if (produto_id_p > 13) then
insert into produto (produto_id,nome,categoria,tamanho,valor,descrição) values (produto_id_p,nome_p,categoria_p,tamanho_p,valor_p,descricão_p);
select 'Produto inserido' as Message;
select * from produto;
else
select 'Já inserido' as Message;
end if;
commit;
end ;;
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

-- Dump completed on 2024-01-22 21:56:14
