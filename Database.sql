-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 11 juil. 2018 à 16:19
-- Version du serveur :  10.1.33-MariaDB
-- Version de PHP :  7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet-6`
--

-- --------------------------------------------------------

--
-- Structure de la table `associationpizzaingredient`
--

CREATE TABLE `associationpizzaingredient` (
  `ingredient_id` int(11) NOT NULL,
  `pizza_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `telephone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `prenom`, `nom`, `mail`, `telephone`) VALUES
(1, 'pascal', 'guyot', 'Pascal@hotmail.fr', '0559487525'),
(2, 'beatrice', 'guyot', 'b.guyot@gmail.fr', '0612963587'),
(3, 'benoït', 'prieur', 'b.pri@Outlook.com', '0645467887'),
(4, 'Jeremy', 'guyot', 'blabla@hotmail.fr', '0558586948');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `numero` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ville` varchar(50) NOT NULL,
  `codePostale` int(11) NOT NULL,
  `rue` varchar(50) NOT NULL,
  `paiement_typePaiement` varchar(20) NOT NULL,
  `etablissement_id` int(11) NOT NULL,
  `employe_id` int(11) NOT NULL,
  `etat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `id` int(11) NOT NULL,
  `typeEmploye` varchar(30) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`id`, `typeEmploye`, `prenom`, `nom`) VALUES
(1, 'Livreur', 'Benjamin', 'Gonzalez'),
(2, 'Livreur', 'Jeremy', 'Gonzalez'),
(3, 'Livreur', 'Sebastien', 'Gonzalez'),
(4, 'Livreur', 'Amelia', 'Clin'),
(5, 'pizzaiolo', 'Gwendoline', 'Renaud'),
(6, 'pizzaiolo', 'Delphine', 'Gonzalez'),
(7, 'pizzaiolo', 'Steve', 'Dayon'),
(8, 'pizzaiolo', 'Gaëlle', 'Dayon'),
(9, 'Caisse', 'Jimmy', 'Dayon'),
(10, 'Caisse', 'Yohan', 'Bardeau'),
(11, 'Caisse', 'Fabien', 'Peirera'),
(12, 'Caisse', 'Constance', 'Peirera');

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

CREATE TABLE `etablissement` (
  `id` int(11) NOT NULL,
  `ville` varchar(50) NOT NULL,
  `codePostale` int(11) NOT NULL,
  `rue` varchar(50) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `employe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `nomIngredient` varchar(100) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `ingredient`
--

INSERT INTO `ingredient` (`id`, `nomIngredient`, `quantite`) VALUES
(1, 'Sauce tomate 500g', 50),
(2, 'Mozzarella 200g', 100),
(3, 'Saucisson pepperoni 400g', 20),
(4, 'Jambon 1kg', 10),
(5, 'Champignons 800g', 4),
(6, 'Crème fraîche 600g', 20),
(7, 'Lardons 400g', 20),
(8, 'Pomme de terre 1kg', 10),
(9, 'Fromage à raclette 800g', 10);

-- --------------------------------------------------------

--
-- Structure de la table `lignecommande`
--

CREATE TABLE `lignecommande` (
  `pizza_id` int(11) NOT NULL,
  `commande_numero` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `typePaiement` varchar(20) NOT NULL,
  `espece` varchar(20) NOT NULL,
  `carteBleue` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`typePaiement`, `espece`, `carteBleue`) VALUES
('Sélectionné E ou CB', 'entre 0 et 500', 'entre 10 et 1 000');

-- --------------------------------------------------------

--
-- Structure de la table `pizza`
--

CREATE TABLE `pizza` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `prixTTC` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `pizza`
--

INSERT INTO `pizza` (`id`, `nom`, `description`, `prixTTC`) VALUES
(0, 'Margherita', 'Sauce tomate, Mozzarella', 10),
(1, 'Savoyarde', 'Jambon, pomme de terre, fromage à raclette, lardon, crème fraîche et oignon.', 14),
(2, 'La Reine', 'Sauce tomate, Mozzarella, Jambon, Champignons', 13),
(3, 'Pepperoni', 'Sauce tomate, mozzarella, saucisson pepperoni.', 12);

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `ingredient_id` int(11) NOT NULL,
  `etablissement_id` int(11) NOT NULL,
  `poids` int(11) DEFAULT NULL,
  `unite` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `associationpizzaingredient`
--
ALTER TABLE `associationpizzaingredient`
  ADD PRIMARY KEY (`ingredient_id`,`pizza_id`),
  ADD KEY `fk_AssociationPizzaIngredient_pizza_id` (`pizza_id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `fk_client_id` (`client_id`),
  ADD KEY `fk_etablissement_id` (`etablissement_id`),
  ADD KEY `fk_commande_paiement_typePaiement` (`paiement_typePaiement`),
  ADD KEY `fk_Commande_employe_id` (`employe_id`);

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_etablissement_employe_id` (`employe_id`);

--
-- Index pour la table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
  ADD PRIMARY KEY (`pizza_id`,`commande_numero`),
  ADD KEY `fk_LigneCommande_commande_numero` (`commande_numero`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`typePaiement`);

--
-- Index pour la table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`ingredient_id`,`etablissement_id`),
  ADD KEY `fk_Stock_etablissement_id` (`etablissement_id`),
  ADD KEY `fk_Stock_unite_id` (`unite`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `ingredient`
--
ALTER TABLE `ingredient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `associationpizzaingredient`
--
ALTER TABLE `associationpizzaingredient`
  ADD CONSTRAINT `fk_AssociationPizzaIngredient_ingredient_id` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`),
  ADD CONSTRAINT `fk_AssociationPizzaIngredient_pizza_id` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_Commande_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `fk_Commande_employe_id` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`id`),
  ADD CONSTRAINT `fk_Commande_etablissement_id` FOREIGN KEY (`etablissement_id`) REFERENCES `etablissement` (`id`),
  ADD CONSTRAINT `fk_Commande_paiement_typePaiement` FOREIGN KEY (`paiement_typePaiement`) REFERENCES `paiement` (`typePaiement`);

--
-- Contraintes pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD CONSTRAINT `fk_etablissement_employe_id` FOREIGN KEY (`employe_id`) REFERENCES `employe` (`id`);

--
-- Contraintes pour la table `lignecommande`
--
ALTER TABLE `lignecommande`
  ADD CONSTRAINT `fk_LigneCommande_commande_numero` FOREIGN KEY (`commande_numero`) REFERENCES `commande` (`numero`),
  ADD CONSTRAINT `fk_LigneCommande_pizza_id` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`);

--
-- Contraintes pour la table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `fk_Stock_etablissement_id` FOREIGN KEY (`etablissement_id`) REFERENCES `etablissement` (`id`),
  ADD CONSTRAINT `fk_Stock_ingredient_id` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
