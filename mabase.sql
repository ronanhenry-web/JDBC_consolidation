-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.7.31 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Listage de la structure de la table mabase. article
CREATE TABLE IF NOT EXISTS `article` (
  `denomination` varchar(255) COLLATE utf8_bin NOT NULL,
  `cout_hors_taxe` float DEFAULT NULL,
  `tva` float DEFAULT NULL,
  PRIMARY KEY (`denomination`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table mabase. client
CREATE TABLE IF NOT EXISTS `client` (
  `nom` varchar(100) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`nom`,`prenom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table mabase. commande
CREATE TABLE IF NOT EXISTS `commande` (
  `numero` bigint(20) NOT NULL,
  `date_commande` timestamp NULL DEFAULT NULL,
  `nom_client` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `prenom_client` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `commande_nom_client_prenom_client_fk` (`nom_client`,`prenom_client`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table mabase. commande_article
CREATE TABLE IF NOT EXISTS `commande_article` (
  `numero_commande` bigint(20) NOT NULL,
  `denomination_article` varchar(100) COLLATE utf8_bin NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`numero_commande`,`denomination_article`),
  KEY `commande_article_denomination_article_fk` (`denomination_article`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table mabase. facture
CREATE TABLE IF NOT EXISTS `facture` (
  `numero_commande` bigint(20) NOT NULL,
  `statut_paiement` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`numero_commande`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- Les données exportées n'étaient pas sélectionnées.

-- Listage de la structure de la table mabase. livraison
CREATE TABLE IF NOT EXISTS `livraison` (
  `id_livraison` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_livraison` timestamp NULL DEFAULT NULL,
  `numero_commande` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_livraison`),
  KEY `livraison_numero_commande_fk` (`numero_commande`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='alter table livraison';

-- Les données exportées n'étaient pas sélectionnées.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
