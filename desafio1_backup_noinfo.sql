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
-- Dumping data for table `cadastro`
--

LOCK TABLES `cadastro` WRITE;
/*!40000 ALTER TABLE `cadastro` DISABLE KEYS */;
INSERT INTO `cadastro` VALUES (1,'Física',NULL,1),(2,'Física',NULL,2),(3,'Física',NULL,3),(4,'Física',NULL,4),(5,'Física',NULL,5),(6,'Jurídica',1,NULL),(7,'Física',NULL,1),(8,'Física',NULL,2),(9,'Física',NULL,3),(10,'Física',NULL,4),(11,'Física',NULL,5),(12,'Jurídica',1,NULL);
/*!40000 ALTER TABLE `cadastro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cartaocredito`
--

LOCK TABLES `cartaocredito` WRITE;
/*!40000 ALTER TABLE `cartaocredito` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartaocredito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `consignado`
--

LOCK TABLES `consignado` WRITE;
/*!40000 ALTER TABLE `consignado` DISABLE KEYS */;
INSERT INTO `consignado` VALUES (1,'Guilherme','40120365001','14997514698'),(2,'Wendell','41211915875','14998509496'),(3,'Guilherme Ramos','33748198715','11987885030');
/*!40000 ALTER TABLE `consignado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (7,1,'Em transporte','TR345678912BR'),(21,7,'Entregue','TR112266547BR');
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,'São Paulo',2);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estoquedoproduto`
--

LOCK TABLES `estoquedoproduto` WRITE;
/*!40000 ALTER TABLE `estoquedoproduto` DISABLE KEYS */;
INSERT INTO `estoquedoproduto` VALUES (1,11,1);
/*!40000 ALTER TABLE `estoquedoproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'LK Sneaker','12131415167895','11998509397');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'Confirmado','Air Max 97 CR7',25,1925,1),(7,'Cancelado','Air Max 97 CR7',25,1925,9),(8,'Confirmado','Dunk Travis - 40',15,19015,3),(9,'Confirmado','Camiseta Stussy Logo NY',25,675,4),(10,'Processando','Camiseta ASSC Roses',0,500,5),(11,'Cancelado','Dunk Travis 42',101,20101,6);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pessoafisica`
--

LOCK TABLES `pessoafisica` WRITE;
/*!40000 ALTER TABLE `pessoafisica` DISABLE KEYS */;
INSERT INTO `pessoafisica` VALUES (1,'4121915875','456322152','Wendell','Rodrigues','Masculino','Rua Altair Leite','Carolina','Bauru','719','14998509496'),(2,'4159875556','333587842','Carolina','Antunes','Feminino','Rua Treze de Maio','Jardim Lais','São Paulo','7219','11998758969'),(3,'8896475624','555789942','Marcele','Juarez','Não Informado','Rua da Graça','Vila Palmas','São Paulo','7889','11998778969'),(4,'8975472556','991234542','Guilherme','Brighes','Masculino','Oscar Freire','Jardins','São Paulo','419','11995552969'),(5,'1237895996','775100242','Henrique','Cartiê','Não Informado','Rua Bahamas','Alphavile','Rio de Janeiro','27','21998457878'),(11,'123456789','12345672','Ronaldo','Alvarez','Masculino','Rua Leite','Carolina','Bauru','719','14998509496');
/*!40000 ALTER TABLE `pessoafisica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pessoajuridica`
--

LOCK TABLES `pessoajuridica` WRITE;
/*!40000 ALTER TABLE `pessoajuridica` DISABLE KEYS */;
INSERT INTO `pessoajuridica` VALUES (1,'12345678910123','UNLTD','Comercio Varejo');
/*!40000 ALTER TABLE `pessoajuridica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pix`
--

LOCK TABLES `pix` WRITE;
/*!40000 ALTER TABLE `pix` DISABLE KEYS */;
/*!40000 ALTER TABLE `pix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Dunk Travis','Tênis','42',20000,NULL),(2,'Air Jordan 1 Rebelionare','Tênis','41',2500,NULL),(3,'Camiseta Stussy Logo NY','Vestuário','GG',650,NULL),(4,'Dunk Travis','Tênis','41',20000,NULL),(5,'Dunk Travis','Tênis','40',19000,NULL),(6,'Camiseta Supreme Box Logo','Vestuário','G',750,NULL),(7,'Camiseta ASSC Roses','Vestuário','G',500,NULL),(8,'Camiseta ASSC Roses','Vestuário','GG',500,NULL),(9,'Air Max 97 CR7','Tênis','35',1900,NULL),(10,'Zippo Supreme','Acessório',NULL,500,'Isqueiro'),(11,'Camiseta Nike x Stussy','Vestuário','M',600,'Guilherme'),(12,'Camiseta Nike x Stussy','Vestuário','G',600,'Wendell'),(13,'Air Jordan 1 UNC','Tênis','46',1600,'Guilherme Ramos'),(14,'Dunk Travis','Tênis','42',20000,NULL),(15,'Air Jordan 1 Rebelionare','Tênis','41',2500,NULL),(16,'Camiseta Stussy Logo NY','Vestuário','GG',650,NULL),(17,'Dunk Travis','Tênis','41',20000,NULL),(18,'Dunk Travis','Tênis','40',19000,NULL),(19,'Camiseta Supreme Box Logo','Vestuário','G',750,NULL),(20,'Camiseta ASSC Roses','Vestuário','G',500,NULL),(21,'Camiseta ASSC Roses','Vestuário','GG',500,NULL),(22,'Air Max 97 CR7','Tênis','35',1900,NULL),(23,'Zippo Supreme','Acessório',NULL,500,'Isqueiro'),(24,'Camiseta Nike x Stussy','Vestuário','M',600,'Guilherme'),(25,'Camiseta Nike x Stussy','Vestuário','G',600,'Wendell'),(26,'Air Jordan 1 UNC','Tênis','46',1600,'Guilherme Ramos'),(27,'Samba','Tênis','42',1000,NULL),(28,'Samba','Tênis','42',1000,NULL),(29,'Samba','Tênis','42',1000,NULL);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produtosconsignados`
--

LOCK TABLES `produtosconsignados` WRITE;
/*!40000 ALTER TABLE `produtosconsignados` DISABLE KEYS */;
INSERT INTO `produtosconsignados` VALUES (1,11,1),(2,12,1),(3,13,1);
/*!40000 ALTER TABLE `produtosconsignados` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-22 22:07:42
