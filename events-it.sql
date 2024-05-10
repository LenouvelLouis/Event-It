-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 10 mai 2024 à 09:16
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `events-it`
--

-- --------------------------------------------------------

--
-- Structure de la table `capteur`
--

DROP TABLE IF EXISTS `capteur`;
CREATE TABLE IF NOT EXISTS `capteur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_seance` int NOT NULL,
  `id_cinema` int NOT NULL,
  `température` float NOT NULL,
  `fréquence` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_capteur_cinema` (`id_cinema`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
CREATE TABLE IF NOT EXISTS `cinema` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `handicapé` tinyint(1) NOT NULL DEFAULT '0',
  `sourd` tinyint(1) NOT NULL DEFAULT '0',
  `malvoyant` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `discussion-forum`
--

DROP TABLE IF EXISTS `discussion-forum`;
CREATE TABLE IF NOT EXISTS `discussion-forum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` text NOT NULL,
  `creator` int NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `discussion-forum`
--

INSERT INTO `discussion-forum` (`id`, `titre`, `creator`, `date`) VALUES
(1, 'test', 1, '2024-05-10 09:13:36'),
(2, 'ererer', 1, '2024-05-10 11:16:05');

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(128) DEFAULT NULL,
  `synopsis` text,
  `duree` time DEFAULT NULL,
  `realisateur` text NOT NULL,
  `acteurs` text NOT NULL,
  `image` varchar(128) NOT NULL,
  `genre` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `message-forum`
--

DROP TABLE IF EXISTS `message-forum`;
CREATE TABLE IF NOT EXISTS `message-forum` (
  `id` int NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `idUser` int NOT NULL,
  `idDiscussion` int NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `message-forum`
--

INSERT INTO `message-forum` (`id`, `message`, `idUser`, `idDiscussion`, `date`) VALUES
(1, 'erreer', 1, 1, '2024-05-10 11:15:55');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `capacité` int DEFAULT NULL,
  `id_cinéma` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_salle_cinema` (`id_cinéma`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

DROP TABLE IF EXISTS `seance`;
CREATE TABLE IF NOT EXISTS `seance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `horairedébut` datetime DEFAULT NULL,
  `horairefin` datetime DEFAULT NULL,
  `id_cinéma` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_seance_cinema` (`id_cinéma`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `status` enum('admin','gestionnaire','user') NOT NULL,
  `salt` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `name`, `phone`, `email`, `password`, `status`, `salt`) VALUES
(1, 'Louis Lenouvel', '0665448894', 'mr.lenouvel.louis@gmail.com', '$2y$10$64aJkaQLQZLvfzPO7rif6OWE79Q3fOtYwSTKSw1k29DdMsP0BJDRS', 'admin', '64aJkaQLQZLvfzPO7rif6O96Ro1qkw==');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
