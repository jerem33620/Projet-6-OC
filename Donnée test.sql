-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 12 juil. 2018 à 11:20
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

--
-- Déchargement des données de la table `associationpizzaingredient`
--

INSERT INTO `associationpizzaingredient` (`ingredient_id`, `pizza_id`) VALUES
(1, 0),
(1, 2),
(1, 3),
(2, 0),
(2, 2),
(2, 3),
(3, 3),
(4, 1),
(4, 2),
(5, 2),
(6, 1),
(7, 1),
(8, 1),
(9, 1);

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `prenom`, `nom`, `mail`, `telephone`) VALUES
(1, 'pascal', 'guyot', 'Pascal@hotmail.fr', '0559487525'),
(2, 'beatrice', 'guyot', 'b.guyot@gmail.fr', '0612963587'),
(3, 'benoït', 'prieur', 'b.pri@Outlook.com', '0645467887'),
(4, 'Jeremy', 'guyot', 'blabla@hotmail.fr', '0558586948'),
(5, 'Guillaume', 'Lignat', 'G.Lignat@Openclassrooms.fr', '0684956241');

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`numero`, `client_id`, `date`, `ville`, `codePostale`, `rue`, `paiement_typePaiement`, `etablissement_id`, `employe_id`, `etat`) VALUES
(1, 1, '2018-07-12 07:51:02', 'St Andre', 33489, 'Sante', 'Espèces', 1, 1, 'Prêt'),
(2, 2, '2018-07-12 07:51:02', 'cavignac', 33720, 'terre brulée', 'Carte Bleue', 2, 7, 'En cours'),
(3, 3, '2018-07-12 07:51:02', 'Arcachon', 33570, 'La marche', 'Carte Bleue', 3, 3, 'Prêt'),
(4, 4, '2018-07-12 07:55:37', 'laruscade', 33620, 'Le bourg', 'Espèces', 4, 9, 'En cours'),
(5, 5, '2018-07-12 07:55:37', 'Soulac', 33960, 'Rue de la courbe', 'Carte Bleue', 5, 5, 'Prêt');

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`id`, `typeEmploye`, `prenom`, `nom`, `etablissement_id`) VALUES
(1, 'Livreur', 'Benjamin', 'Gonzalez', 1),
(2, 'Livreur', 'Jeremy', 'Gonzalez', 2),
(3, 'Livreur', 'Sebastien', 'Gonzalez', 3),
(4, 'Livreur', 'Gwendoline', 'Renaud', 4),
(5, 'Livreur', 'Amelia', 'Clin', 5),
(6, 'Caisse', 'Fabien', 'Peirera', 1),
(7, 'Caisse', 'Constance', 'Peirera', 2),
(8, 'Caisse', 'Olivier', 'Boucheron', 3),
(9, 'Caisse', 'Yohan', 'Bardeau', 4),
(10, 'Caisse', 'Clément', 'Bardeau', 5),
(11, 'Pizzaiolo', 'Steve', 'Dayon', 1),
(12, 'Pizzaiolo', 'Jimmy', 'Dayon', 2),
(13, 'Pizzaiolo', 'Jocelyne', 'Guyot', 3),
(14, 'Pizzaiolo', 'Mathilde', 'Hervé', 4),
(15, 'Pizzaiolo', 'Aurore', 'Granier', 5);

--
-- Déchargement des données de la table `etablissement`
--

INSERT INTO `etablissement` (`id`, `ville`, `codePostale`, `rue`, `telephone`) VALUES
(1, 'St Andre', 33489, 'Sante', '0558586948'),
(2, 'cavignac', 33720, 'terre brulée', '0557596885'),
(3, 'Arcachon', 33570, 'La marche', '0559487525'),
(4, 'laruscade', 33620, 'le bourg', '0556962547'),
(5, 'Soulac', 33960, 'Rue de la courbe', '0554855129');

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

--
-- Déchargement des données de la table `lignecommande`
--

INSERT INTO `lignecommande` (`pizza_id`, `commande_numero`, `quantite`) VALUES
(0, 1, 2),
(0, 3, 1),
(1, 1, 2),
(1, 3, 1),
(1, 4, 3),
(1, 5, 2),
(2, 2, 1),
(2, 3, 1),
(3, 2, 3),
(3, 3, 1),
(3, 5, 2);

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`typePaiement`, `espece`, `carteBleue`) VALUES
('Carte Bleue', '0', 'entre 10 et 500'),
('Espèces', 'entre 0 et 150', '0');

--
-- Déchargement des données de la table `pizza`
--

INSERT INTO `pizza` (`id`, `nom`, `description`, `prixTTC`) VALUES
(0, 'Margherita', 'Sauce tomate, Mozzarella', 10),
(1, 'Savoyarde', 'Jambon, pomme de terre, fromage à raclette, lardon, crème fraîche et oignon.', 14),
(2, 'La Reine', 'Sauce tomate, Mozzarella, Jambon, Champignons', 13),
(3, 'Pepperoni', 'Sauce tomate, mozzarella, saucisson pepperoni.', 12);

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`ingredient_id`, `etablissement_id`, `poids`, `unite`) VALUES
(1, 1, 500, '50'),
(1, 2, 500, '50'),
(1, 3, 500, '50'),
(1, 4, 500, '50'),
(1, 5, 500, '50'),
(2, 1, 200, '100'),
(2, 2, 200, '100'),
(2, 3, 200, '100'),
(2, 4, 200, '100'),
(2, 5, 200, '100'),
(3, 1, 400, '20'),
(3, 2, 400, '20'),
(3, 3, 400, '20'),
(3, 4, 400, '20'),
(3, 5, 400, '20'),
(4, 1, 1000, '10'),
(4, 2, 1000, '10'),
(4, 3, 1000, '10'),
(4, 4, 1000, '10'),
(4, 5, 1000, '10'),
(5, 1, 800, '4'),
(5, 2, 800, '4'),
(5, 3, 800, '4'),
(5, 4, 800, '4'),
(5, 5, 800, '4'),
(6, 1, 600, '20'),
(6, 2, 600, '20'),
(6, 3, 600, '20'),
(6, 4, 600, '20'),
(6, 5, 600, '20'),
(7, 1, 400, '20'),
(7, 2, 400, '20'),
(7, 3, 400, '20'),
(7, 4, 400, '20'),
(7, 5, 400, '20'),
(8, 1, 1000, '10'),
(8, 2, 1000, '10'),
(8, 3, 1000, '10'),
(8, 4, 1000, '10'),
(8, 5, 1000, '10'),
(9, 1, 800, '10'),
(9, 2, 800, '10'),
(9, 3, 800, '10'),
(9, 4, 800, '10'),
(9, 5, 800, '10');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
