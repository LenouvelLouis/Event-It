-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 05 juin 2024 à 17:47
-- Version du serveur : 11.2.2-MariaDB
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
  `id` int(11) NOT NULL,
  `id_salle` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_capteur_salle` (`id_salle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `capteur`
--

INSERT INTO `capteur` (`id`, `id_salle`) VALUES
(5, 1),
(1, 5),
(2, 5),
(3, 5),
(4, 5);

-- --------------------------------------------------------

--
-- Structure de la table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
CREATE TABLE IF NOT EXISTS `cinema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(128) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `type_cine` tinyint(1) DEFAULT NULL,
  `handicape` tinyint(1) NOT NULL,
  `sourd` tinyint(1) NOT NULL,
  `malvoyant` tinyint(1) NOT NULL,
  `image` varchar(128) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `mail` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `cinema`
--

INSERT INTO `cinema` (`id`, `nom`, `adresse`, `type_cine`, `handicape`, `sourd`, `malvoyant`, `image`, `telephone`, `mail`) VALUES
(1, 'cine1', 'dsdsdsdsds', 1, 1, 1, 1, 'jhhj', '', ''),
(2, 'cine2', 'dsdsdsdsds', 1, 1, 1, 1, 'jhhj', '', ''),
(3, 'cine3', 'dsdsdsdsds', 0, 1, 1, 1, 'jhhj', '', ''),
(4, 'cine4', 'dsdsdsdsds', 0, 1, 1, 1, 'jhhj', '', ''),
(6, 'Grand Rex', '10 Rue de Vanves, 92170 Issy-les-Moulineaux', 1, 1, 0, 0, 'Ciné_0.png', '0665448894', 'mr.lenouvel.louis@gmail.com'),
(7, 'Test', '10 Rue de Vanves, 92170 Issy-les-Moulineaux', 1, 0, 1, 0, 'Test.png', '0665448894', 'mr.lenouvel.louis@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `data_capteur_son`
--

DROP TABLE IF EXISTS `data_capteur_son`;
CREATE TABLE IF NOT EXISTS `data_capteur_son` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_capteur` int(11) NOT NULL,
  `valeur` decimal(10,2) NOT NULL,
  `temps` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_data_capteur_son_capteur` (`id_capteur`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `data_capteur_son`
--

INSERT INTO `data_capteur_son` (`id`, `id_capteur`, `valeur`, `temps`) VALUES
(291, 1, 55.60, '08:30:00'),
(292, 2, 50.20, '08:35:00'),
(293, 3, 49.80, '08:40:00'),
(294, 4, 60.00, '08:45:00'),
(295, 5, 57.75, '08:50:00'),
(296, 1, 56.00, '09:00:00'),
(297, 2, 51.65, '09:05:00'),
(298, 3, 49.90, '09:10:00'),
(299, 4, 61.10, '09:15:00'),
(300, 5, 58.00, '09:20:00');

-- --------------------------------------------------------

--
-- Structure de la table `data_capteur_temperature`
--

DROP TABLE IF EXISTS `data_capteur_temperature`;
CREATE TABLE IF NOT EXISTS `data_capteur_temperature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_capteur` int(11) NOT NULL,
  `valeur` decimal(10,2) NOT NULL,
  `temps` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_data_capteur_temperature_capteur` (`id_capteur`)
) ENGINE=InnoDB AUTO_INCREMENT=431 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `data_capteur_temperature`
--

INSERT INTO `data_capteur_temperature` (`id`, `id_capteur`, `valeur`, `temps`) VALUES
(421, 1, 22.50, '08:30:00'),
(422, 2, 23.10, '08:35:00'),
(423, 3, 21.80, '08:40:00'),
(424, 4, 24.00, '08:45:00'),
(425, 5, 22.75, '08:50:00'),
(426, 1, 23.00, '09:00:00'),
(427, 2, 22.65, '09:05:00'),
(428, 3, 21.90, '09:10:00'),
(429, 4, 24.10, '09:15:00'),
(430, 5, 23.00, '09:20:00');

-- --------------------------------------------------------

--
-- Structure de la table `discussion-forum`
--

DROP TABLE IF EXISTS `discussion-forum`;
CREATE TABLE IF NOT EXISTS `discussion-forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` text NOT NULL,
  `creator` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_discussion_forum_user` (`creator`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(128) DEFAULT NULL,
  `synopsis` text DEFAULT NULL,
  `duree` time DEFAULT NULL,
  `realisateur` text NOT NULL,
  `acteurs` text NOT NULL,
  `image` varchar(128) NOT NULL,
  `genre` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `film`
--

INSERT INTO `film` (`id`, `titre`, `synopsis`, `duree`, `realisateur`, `acteurs`, `image`, `genre`) VALUES
(1, 'oppenheimer', 'La vie et les dilemmes moraux de J. Robert Oppenheimer, le père de la bombe atomique.', '03:00:00', 'Christopher Nolan', 'Cillian Murphy, Emily Blunt, Matt Damon', 'oppenheimer.png', 'Biopic, Drame'),
(39, 'Barbie', 'Les aventures de Barbie dans un monde magique.', '01:40:00', 'Greta Gerwig', 'Margot Robbie, Ryan Gosling', 'Barbie.png', 'Comédie, Fantastique'),
(40, 'Bob_Marley', 'La vie et la carrière de la légende du reggae Bob Marley.', '02:20:00', 'Reinaldo Marcus Green', 'Kingsley Ben-Adir, Lashana Lynch', 'Bob_Marley.png', 'Biopic, Musique'),
(41, 'Dune', 'Adaptation épique du roman de science-fiction de Frank Herbert.', '02:35:00', 'Denis Villeneuve', 'Timothée Chalamet, Rebecca Ferguson, Oscar Isaac', 'Dune.png', 'Science-fiction, Aventure'),
(43, 'Grand_Turismo', 'Basé sur l\'histoire vraie d\'un joueur de Gran Turismo qui devient pilote de course professionnel.', '02:15:00', 'Neill Blomkamp', 'David Harbour, Orlando Bloom', 'Grand_Turismo.png', 'Action, Drame'),
(44, 'Maison_de_Retraite', 'Une comédie sur la vie dans une maison de retraite.', '01:50:00', 'Thomas Gilou', 'Kev Adams, Gérard Depardieu', 'Maison_de_Retraite.png', 'Comédie'),
(45, 'Spider_Man', 'Spider-Man affronte de nouveaux défis dans le multivers.', '02:28:00', 'Jon Watts', 'Tom Holland, Zendaya, Benedict Cumberbatch', 'Spider_Man.png', 'Action, Aventure, Super-héros');

-- --------------------------------------------------------

--
-- Structure de la table `gestionnaire`
--

DROP TABLE IF EXISTS `gestionnaire`;
CREATE TABLE IF NOT EXISTS `gestionnaire` (
  `idUser` int(11) NOT NULL,
  `idCinema` int(11) NOT NULL,
  PRIMARY KEY (`idUser`,`idCinema`),
  KEY `fk_gestionnaire_cinema` (`idCinema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `message-forum`
--

DROP TABLE IF EXISTS `message-forum`;
CREATE TABLE IF NOT EXISTS `message-forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `idUser` int(11) NOT NULL,
  `idDiscussion` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_message_forum_user` (`idUser`),
  KEY `fk_message_forum_discussion` (`idDiscussion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

DROP TABLE IF EXISTS `salle`;
CREATE TABLE IF NOT EXISTS `salle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `id_cinema` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_salle_cinema` (`id_cinema`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `salle`
--

INSERT INTO `salle` (`id`, `nom`, `id_cinema`) VALUES
(1, 'Salle01', 1),
(2, 'Salle02', 1),
(3, 'Salle03', 1),
(4, 'Salle01', 2),
(5, 'Salle02', 2),
(6, 'Salle 01', 3),
(7, 'Salle 01', 4),
(8, 'Salle 1', 6),
(9, 'Salle 2', 6),
(10, 'Salle 3', 6),
(11, 'Salle 1', 7),
(12, 'Salle 2', 7),
(13, 'Salle 3', 7),
(14, 'Salle 4', 7);

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

DROP TABLE IF EXISTS `seance`;
CREATE TABLE IF NOT EXISTS `seance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `horairedébut` time DEFAULT NULL,
  `id_cinema` int(11) DEFAULT NULL,
  `id_film` int(11) NOT NULL,
  `id_salle` int(11) NOT NULL,
  `type_affichage` varchar(128) NOT NULL,
  `date` date NOT NULL DEFAULT curdate(),
  PRIMARY KEY (`id`),
  KEY `fk_seance_cinema` (`id_cinema`),
  KEY `fk_seance_film` (`id_film`),
  KEY `fk_seance_salle` (`id_salle`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `seance`
--

INSERT INTO `seance` (`id`, `horairedébut`, `id_cinema`, `id_film`, `id_salle`, `type_affichage`, `date`) VALUES
(18, '23:32:00', 2, 39, 5, 'affiche', '2024-05-31'),
(31, '14:00:00', 1, 1, 1, 'nouveautes', '2024-06-05'),
(32, '17:30:00', 1, 39, 2, 'affiche', '2024-06-05'),
(33, '20:00:00', 1, 40, 3, 'nouveautes', '2024-06-05'),
(34, '10:00:00', 2, 41, 4, 'nouveautes', '2024-06-05'),
(35, '13:30:00', 2, 43, 5, 'affiche', '2024-06-05'),
(36, '16:00:00', 3, 44, 6, 'nouveautes', '2024-06-05'),
(37, '19:00:00', 4, 45, 7, 'affiche', '2024-06-05'),
(38, '21:30:00', 6, 1, 8, 'nouveautes', '2024-06-06'),
(39, '11:00:00', 6, 39, 9, 'nouveautes', '2024-06-06'),
(40, '14:30:00', 6, 40, 10, 'nouveautes', '2024-06-06'),
(41, '18:00:00', 7, 41, 11, 'nouveautes', '2024-06-06'),
(42, '20:30:00', 7, 43, 12, 'affiche', '2024-06-06'),
(43, '09:00:00', 7, 44, 13, 'nouveautes', '2024-06-06'),
(44, '12:00:00', 7, 45, 14, 'affiche', '2024-06-06');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(75) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `status` enum('admin','gestionnaire','user') NOT NULL,
  `salt` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `name`, `phone`, `email`, `password`, `status`, `salt`) VALUES
(37, 'Louis Lenouvel', '0665448894', 'mr.lenouvel.louis@events-it.fr', '$2y$10$HIK4hJYOtDWDbO0knKl4DumYJGNlf4.i8TkuVpR2chNJeNlFrPD1W', 'admin', 'HIK4hJYOtDWDbO0knKl4D1c/DleRZA==');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `capteur`
--
ALTER TABLE `capteur`
  ADD CONSTRAINT `fk_capteur_salle` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id`);

--
-- Contraintes pour la table `data_capteur_son`
--
ALTER TABLE `data_capteur_son`
  ADD CONSTRAINT `fk_data_capteur_son_capteur` FOREIGN KEY (`id_capteur`) REFERENCES `capteur` (`id`);

--
-- Contraintes pour la table `data_capteur_temperature`
--
ALTER TABLE `data_capteur_temperature`
  ADD CONSTRAINT `data_capteur_temperature_ibfk_1` FOREIGN KEY (`id_capteur`) REFERENCES `capteur` (`id`),
  ADD CONSTRAINT `fk_data_capteur_temperature_capteur` FOREIGN KEY (`id_capteur`) REFERENCES `capteur` (`id`);

--
-- Contraintes pour la table `discussion-forum`
--
ALTER TABLE `discussion-forum`
  ADD CONSTRAINT `fk_discussion_forum_user` FOREIGN KEY (`creator`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `gestionnaire`
--
ALTER TABLE `gestionnaire`
  ADD CONSTRAINT `fk_gestionnaire_cinema` FOREIGN KEY (`idCinema`) REFERENCES `cinema` (`id`),
  ADD CONSTRAINT `fk_gestionnaire_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `gestionnaire_ibfk_1` FOREIGN KEY (`idCinema`) REFERENCES `cinema` (`id`);

--
-- Contraintes pour la table `message-forum`
--
ALTER TABLE `message-forum`
  ADD CONSTRAINT `fk_message_forum_discussion` FOREIGN KEY (`idDiscussion`) REFERENCES `discussion-forum` (`id`),
  ADD CONSTRAINT `fk_message_forum_user` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `salle`
--
ALTER TABLE `salle`
  ADD CONSTRAINT `fk_salle_cinema` FOREIGN KEY (`id_cinema`) REFERENCES `cinema` (`id`),
  ADD CONSTRAINT `salle_ibfk_1` FOREIGN KEY (`id_cinema`) REFERENCES `cinema` (`id`);

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `fk_seance_cinema` FOREIGN KEY (`id_cinema`) REFERENCES `cinema` (`id`),
  ADD CONSTRAINT `fk_seance_film` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `fk_seance_salle` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id`),
  ADD CONSTRAINT `seance_ibfk_1` FOREIGN KEY (`id_cinema`) REFERENCES `cinema` (`id`),
  ADD CONSTRAINT `seance_ibfk_2` FOREIGN KEY (`id_film`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `seance_ibfk_3` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
