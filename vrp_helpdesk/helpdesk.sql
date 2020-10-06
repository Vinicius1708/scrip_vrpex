-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.38-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para allstar
CREATE DATABASE IF NOT EXISTS `vrp` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `vrp`;

-- Copiando estrutura para tabela allstar.vrp_helpdesk_respostas
CREATE TABLE IF NOT EXISTS `vrp_helpdesk_respostas` (
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `case_id` int(11) NOT NULL,
  `createdAt` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela allstar.vrp_helpdesk_respostas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_helpdesk_respostas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_helpdesk_respostas` ENABLE KEYS */;

-- Copiando estrutura para tabela allstar.vrp_helpdesk_ticket
CREATE TABLE IF NOT EXISTS `vrp_helpdesk_ticket` (
  `user_id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL DEFAULT '',
  `message` varchar(2000) NOT NULL,
  `createdAt` varchar(24) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT 1,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela allstar.vrp_helpdesk_ticket: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `vrp_helpdesk_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `vrp_helpdesk_ticket` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
