-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 01 Février 2021 à 05:05
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `cartographie`
--

-- --------------------------------------------------------

--
-- Structure de la table `disponible`
--

CREATE TABLE `disponible` (
  `idformation_Formation` int(11) NOT NULL,
  `idEtablissement_Etablissement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `disponible`
--

INSERT INTO `disponible` (`idformation_Formation`, `idEtablissement_Etablissement`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 4),
(12, 4),
(13, 16),
(14, 17),
(15, 18),
(16, 18),
(17, 18),
(18, 18),
(19, 18),
(14, 19),
(20, 20),
(14, 21),
(20, 22),
(14, 23),
(20, 24);

-- --------------------------------------------------------

--
-- Structure de la table `domaine`
--

CREATE TABLE `domaine` (
  `iddomaine_Domaine` int(11) NOT NULL,
  `lib_domaine_Domaine` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `domaine`
--

INSERT INTO `domaine` (`iddomaine_Domaine`, `lib_domaine_Domaine`) VALUES
(1, ' '),
(2, 'Production'),
(3, 'Services');

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

CREATE TABLE `etablissement` (
  `idEtablissement_Etablissement` int(11) NOT NULL,
  `nomEtablissement_Etablissement` varchar(60) NOT NULL,
  `codeEtab_Etablissement` varchar(11) DEFAULT NULL,
  `codep_Etablissement` int(11) DEFAULT NULL,
  `ville_Etablissement` varchar(255) DEFAULT NULL,
  `adresse_Etablissement` varchar(255) DEFAULT NULL,
  `mail_Etablissement` varchar(255) DEFAULT NULL,
  `tel_Etablissement` int(11) DEFAULT NULL,
  `idOrganisme_Organisme` int(11) NOT NULL,
  `idVille_Ville` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `etablissement`
--

INSERT INTO `etablissement` (`idEtablissement_Etablissement`, `nomEtablissement_Etablissement`, `codeEtab_Etablissement`, `codep_Etablissement`, `ville_Etablissement`, `adresse_Etablissement`, `mail_Etablissement`, `tel_Etablissement`, `idOrganisme_Organisme`, `idVille_Ville`) VALUES
(1, 'AFPAR', NULL, 97440, 'SAINT ANDRE', NULL, NULL, NULL, 2, 17),
(2, 'CFA CCI EST SAINT BENOÎT', '9740985C', 97470, 'SAINT BENOÎT', '15 rue Pierre Benoît Dumas\r\n97470 Saint Benoît', 'esrn@reunion.cci.fr', 262500295, 3, 22),
(3, 'CNAM', '9741246L', 97420, 'LE PORT', '18 Rue Claude Chappe, La Réunion', 'info@cnam.re', 262422837, 4, 24),
(4, 'DUCRETET (CMAR)', NULL, NULL, NULL, NULL, NULL, NULL, 5, 1),
(5, 'EPITECH', NULL, 97440, NULL, NULL, NULL, 262290857, 6, 17),
(16, 'ESIROI', '974', NULL, 'SAINTE CLOTILDE', 'Bâtiment 2, 4, 5 & 6, 2 Rue Joseph Wetzell, Sainte-Clotilde 97490, La Réunion', NULL, NULL, 7, 1),
(17, 'GRETA REUNION', NULL, NULL, NULL, '8 r Philibert Tsiranana, 97490 SAINT DENIS', NULL, 262418113, 8, 1),
(18, 'ILOI - Institut de L\'image de l\'Océan Indien', NULL, 97420, NULL, 'Rue du 8 mars - Parc de l Oasis - FAC Pierre Ayma, B.P. 232, Le Port - Reunion 97826, La Réunion', 'info@iloi.fr', 262430881, 9, 24),
(19, 'Lycée BELLEPIERRE', NULL, 97400, 'SAINT DENIS', 'Boulevard Gaston Monerville, Saint-Denis 97400, La Réunion', NULL, 262907300, 1, 1),
(20, 'Lycée de Trois Bassins', NULL, 97426, 'TROIS BASSINS', '81 Rue Georges Brassens, La Réunion', 'ce.9741186w@ac-reunion.fr', 262247950, 1, 8),
(21, 'Lycée NELSON MANDELA', NULL, 97470, 'SAINT BENOIT', '69 Rue des alamandas, Saint-Benoît 97470, La Réunion', 'ce.9741233x@ax-reunion.fr\r\n', 262929681, 1, 22),
(22, 'Lycée Nord', NULL, 974, NULL, NULL, 'ce.9741620t@ac-reunion.fr', 262982425, 1, 1),
(23, 'Lycée PIERRE POIVRE', NULL, 97480, 'SAINT JOSEPH', 'Rue Hippolyte Foucque, Saint-Joseph 97480, La Réunion', 'ce.9740952s@ac-reunion.fr', 262566979, 1, 23),
(24, 'Lycée Roland Garros', NULL, 97430, 'LE TAMPON', '72 Rue Roland Garros, 97430, La Réunion', 'ce.9740002j@ac-reunion.fr', 262578100, 1, 11),
(25, 'SUPINFO', NULL, 97490, 'STE CHLOTILDE', '97490, 42 Rue de l\'Anjou, Sainte-Clotilde, La Réunion', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `idformation_Formation` int(11) NOT NULL,
  `nom_Formation` varchar(255) DEFAULT NULL,
  `description_Formation` varchar(255) DEFAULT NULL,
  `url_Formation` varchar(255) DEFAULT NULL,
  `diplome_Formation` varchar(255) DEFAULT NULL,
  `rec_nationale_Formation` varchar(255) DEFAULT NULL,
  `periode_Formation` datetime DEFAULT NULL,
  `nb_diplome_Formation` datetime DEFAULT NULL,
  `iddomaine_Domaine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `formation`
--

INSERT INTO `formation` (`idformation_Formation`, `nom_Formation`, `description_Formation`, `url_Formation`, `diplome_Formation`, `rec_nationale_Formation`, `periode_Formation`, `nb_diplome_Formation`, `iddomaine_Domaine`) VALUES
(1, 'DEVELOPPEUR WEB ET WEB MOBILE', NULL, 'http://www.afpar.com/index.php?page=Front.Formations.View&id=47&title=Developpeur-euse-Logiciel', NULL, NULL, NULL, NULL, 2),
(2, 'DESIGNER WEB', 'http://www.afpar.com/index.php?page=Front.Formations.View&id=46&title=DESIGNER-WEB', NULL, NULL, NULL, NULL, NULL, 2),
(3, 'TECHNICIEN/NE SUPÉRIEUR/E SYSTÈMES ET RÉSEAUX', NULL, NULL, NULL, NULL, NULL, NULL, 2),
(4, 'CHEF DE PROJET EN MARKETING INTERNET ET CONCEPTION DE SITE', 'https://reunion.cci.fr/formation/13207/chef-de-projet-en-marketing-internet-et-conception-de-site', NULL, NULL, NULL, NULL, NULL, 2),
(5, 'Chargé d’Exploitation en Réseaux et Télécoms', NULL, 'https://reunion.cci.fr/formation/13204/charge-dexploitation-en-reseaux-et-telecoms\r\n', NULL, NULL, NULL, NULL, 2),
(6, 'WEBMASTER – DEVELOPPEUR INTEGRATEUR DE SOLUTIONS INTERNET/INTRANET', NULL, 'https://reunion.cci.fr/formation/13216/webmaster-developpeur-integrateur-de-solutions-internet-intranet', NULL, NULL, NULL, NULL, 2),
(7, 'Concepteur architecte', NULL, 'https://www.google.com/url?sa=t&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjnjdXMpL7uAhUPcBQKHTjMCtAQFjAAegQIChAC&url=http%3A%2F%2Fwww.cnam.re%2Fsite%2Fdocs%2Fpdf%2Ffiches_afnor%2F2017-2018%2FCPN84.pdf&usg=AOvVaw0jaL--eL1GlKOOXQMV4oLy', NULL, NULL, NULL, NULL, 2),
(8, 'Ingénieur Réseaux, Systèmes et Multimédia', '', 'http://www.intercariforef.org/formations/diplome-dingenieur-informatique-option-reseaux-systemes-et-multimedia/cnam/formation-25_98S1903468_98S1903468.html', NULL, NULL, NULL, NULL, 2),
(9, 'Licence informatique générale', NULL, 'http://www.intercariforef.org/formations/licence-generale-sciences-technologies-sante-mention-informatique-generale/cnam/formation-25_98S1903466_98S1903466.html', NULL, NULL, NULL, NULL, 2),
(10, 'Analyste programmeur informatique', NULL, 'http://www.intercariforef.org/formations/analyste-programmeur-informatique/cesi-sas-pau/formation-02_201805033525_00135216.html', NULL, NULL, NULL, NULL, 2),
(11, 'Conseiller service en électrodomestique et multimedia', NULL, NULL, NULL, NULL, NULL, NULL, 3),
(12, 'Technicien service audiovisuel et électrodomestique', NULL, 'http://www.intercariforef.org/formations/technicien-services-en-audiovisuel-et-electrodomestique/certification-78881.html', NULL, NULL, NULL, NULL, 2),
(13, 'Ingénieur télécoms informatique et multimédia', NULL, NULL, NULL, NULL, NULL, NULL, 2),
(14, 'BTS Sciences Informatiques aux Organisations - Option SISR: Solution d\'infrastructures systèmes et réseaux\r\n', NULL, 'https://www.letudiant.fr/etudes/bts/bts-services-informatiques-aux-organisations-option-solutions-d-infrastructure-systemes-et-reseaux-sio-sisr.html', NULL, NULL, NULL, NULL, 2),
(15, 'Licence Communication et Media', NULL, 'http://www.iloi.fr/index.php/formation-premier-cycle-bac3/', NULL, NULL, NULL, NULL, 2),
(16, 'Maitrise Sciences de l’Information et de la Communication ', NULL, 'http://www.iloi.fr/index.php/formations-second-cycle-bac5/\r\n', NULL, NULL, NULL, NULL, 2),
(17, 'Master Création et Edition Numérique', NULL, 'http://www.iloi.fr/index.php/formations-second-cycle-bac5/', NULL, NULL, NULL, NULL, 2),
(18, 'Master Sciences de l’Information et de la Communication ', NULL, 'http://www.iloi.fr/index.php/formation-premier-cycle-bac3/', NULL, NULL, NULL, NULL, 2),
(19, 'Infographiste Multimédia', NULL, NULL, NULL, NULL, NULL, NULL, 2),
(20, 'BTS Systèmes numériques', NULL, NULL, NULL, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Structure de la table `markerstest`
--

CREATE TABLE `markerstest` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(80) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL,
  `type` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Contenu de la table `markerstest`
--

INSERT INTO `markerstest` (`id`, `name`, `address`, `lat`, `lng`, `type`) VALUES
(1, 'Lycée Leconte De Lisle', 'Allée Etudiants 3, 97490 Saint-Denis', -20.887899, 55.469299, 'BTS SIO'),
(2, 'Lycée Nelson MANDELA', '69 Rue des alamandas, Saint-Benoît 97470, La Réunion', -21.043699, 55.717899, 'BTS SIO'),
(3, 'Lycée Bellepierre', 'Boulevard Gaston Monerville, Saint-Denis 97400, La Réunion', -20.894600, 55.449902, 'BTS SIO'),
(4, 'Lycée Pierre Poivre', 'Rue Hippolyte Foucque, Saint-Joseph 97480, La Réunion', -21.374599, 55.624802, 'BTS SIO'),
(5, 'Lycée Roland Garros', '72 Rue Roland Garros, 97430, La Réunion', -21.273399, 55.522099, 'BTS SN'),
(6, 'Lycée de Trois Bassins', '81 Rue Georges Brassens, La Réunion', -21.104000, 55.301601, 'BTS SN'),
(7, 'Lycée  Mémona Hintermann-Afféjee', '1 Chemin des Francisceas, Sainte-Clotilde, La Réunion', -20.912239, 55.479061, 'BTS SN');

-- --------------------------------------------------------

--
-- Structure de la table `marqueur`
--

CREATE TABLE `marqueur` (
  `idEtablissement_Etablissement` int(11) NOT NULL,
  `idVille_Ville` int(11) NOT NULL,
  `lat` float(10,6) DEFAULT NULL,
  `lng` float(10,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `marqueur`
--

INSERT INTO `marqueur` (`idEtablissement_Etablissement`, `idVille_Ville`, `lat`, `lng`) VALUES
(1, 17, NULL, NULL),
(2, 22, NULL, NULL),
(3, 24, NULL, NULL),
(4, 1, NULL, NULL),
(5, 17, NULL, NULL),
(16, 1, NULL, NULL),
(17, 1, NULL, NULL),
(18, 24, NULL, NULL),
(19, 1, NULL, NULL),
(20, 8, NULL, NULL),
(21, 22, NULL, NULL),
(22, 1, NULL, NULL),
(23, 23, NULL, NULL),
(24, 11, NULL, NULL),
(25, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `organisme`
--

CREATE TABLE `organisme` (
  `idOrganisme_Organisme` int(11) NOT NULL,
  `nomOrganisme_Organisme` varchar(255) DEFAULT NULL,
  `siteOrganisme_Organisme` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `organisme`
--

INSERT INTO `organisme` (`idOrganisme_Organisme`, `nomOrganisme_Organisme`, `siteOrganisme_Organisme`) VALUES
(1, 'Établissement public\r\n', NULL),
(2, 'AFPAR', ''),
(3, 'Chambre de Commerce et d\'Industrie de la Réunion (CCI)', 'https://reunion.cci.fr/'),
(4, 'CNAM', 'http://www.cnam.re/'),
(5, 'DUCRETET (CMAR)', NULL),
(6, 'EPITECH', 'https://www.epitech.eu/fr/ecole-informatique-saint-andre/'),
(7, 'ESIROI - Ecole Supérieure d\'Ingénieurs Réunion Océan Indien', 'https://esiroi.univ-reunion.fr/'),
(8, 'GRETA REUNION', 'https://ftlvreunion.fr/'),
(9, 'ILOI - Institut de L\'image de l\'Océan Indien', 'http://www.iloi.fr/'),
(10, 'Université', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `secteur`
--

CREATE TABLE `secteur` (
  `idSecteur_Secteur` int(11) NOT NULL,
  `nom_Secteur` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `secteur`
--

INSERT INTO `secteur` (`idSecteur_Secteur`, `nom_Secteur`) VALUES
(1, 'NORD'),
(2, 'SUD'),
(3, 'EST'),
(4, 'OUEST');

-- --------------------------------------------------------

--
-- Structure de la table `se_situe`
--

CREATE TABLE `se_situe` (
  `idOrganisme_Organisme` int(11) NOT NULL,
  `idVille_Ville` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `idVille_Ville` int(11) NOT NULL,
  `nom_Ville` varchar(255) DEFAULT NULL,
  `commune_Ville` varchar(255) DEFAULT NULL,
  `codep_Ville` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ville`
--

INSERT INTO `ville` (`idVille_Ville`, `nom_Ville`, `commune_Ville`, `codep_Ville`) VALUES
(1, 'SAINT-DENIS', 'SAINT-DENIS', 97400),
(2, 'SAINT-PIERRE', NULL, 97410),
(3, 'BRAS PANON', NULL, 97410),
(4, 'CILAOS', NULL, 97413),
(5, 'ENTRE-DEUX', NULL, 97414),
(6, 'LA POSSESSION', NULL, 97419),
(7, 'LES AVIRONS', NULL, 97425),
(8, 'LES-TROIS-BASSINS', NULL, 97426),
(9, 'ETANG SALE', NULL, 97427),
(10, 'LA PETITE-ILE', NULL, 97429),
(11, 'LE TAMPON', NULL, 97430),
(12, 'LA-PLAINE-DES-PALMISTES', NULL, 97431),
(13, 'SALAZIE', NULL, 97433),
(14, 'SAINT LEU', NULL, 97436),
(15, 'SAINTE-MARIE', NULL, 97438),
(16, 'SAINTE-ROSE', NULL, 97439),
(17, 'SAINT-ANDRE', NULL, 97440),
(18, 'SAINTE-SUZANNE', NULL, 97441),
(19, 'SAINT-PHILIPPE', NULL, 97442),
(20, 'SAINT-LOUIS', NULL, 97450),
(21, 'SAINT-PAUL', NULL, 97460),
(22, 'SAINT-BENOIT', NULL, 97470),
(23, 'SAINT JOSEPH', NULL, 97480),
(24, 'LE PORT', NULL, 97420);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `disponible`
--
ALTER TABLE `disponible`
  ADD KEY `FK_Disponible_idformation_Formation` (`idformation_Formation`),
  ADD KEY `FK_Disponible_idEtablissement_Etablissement` (`idEtablissement_Etablissement`);

--
-- Index pour la table `domaine`
--
ALTER TABLE `domaine`
  ADD PRIMARY KEY (`iddomaine_Domaine`);

--
-- Index pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD PRIMARY KEY (`idEtablissement_Etablissement`),
  ADD KEY `FK_Etablissement_idOrganisme_Organisme` (`idOrganisme_Organisme`),
  ADD KEY `FK_Etablissement_idVille_Ville` (`idVille_Ville`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`idformation_Formation`),
  ADD KEY `FK_Formation_iddomaine_Domaine` (`iddomaine_Domaine`);

--
-- Index pour la table `markerstest`
--
ALTER TABLE `markerstest`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `marqueur`
--
ALTER TABLE `marqueur`
  ADD UNIQUE KEY `idEtablissement_Etablissement` (`idEtablissement_Etablissement`),
  ADD KEY `FK_marqueur_idVille_Ville` (`idVille_Ville`);

--
-- Index pour la table `organisme`
--
ALTER TABLE `organisme`
  ADD PRIMARY KEY (`idOrganisme_Organisme`);

--
-- Index pour la table `secteur`
--
ALTER TABLE `secteur`
  ADD PRIMARY KEY (`idSecteur_Secteur`);

--
-- Index pour la table `se_situe`
--
ALTER TABLE `se_situe`
  ADD KEY `FK_se_situe_idOrganisme_Organisme` (`idOrganisme_Organisme`),
  ADD KEY `FK_se_situe_idVille_Ville` (`idVille_Ville`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`idVille_Ville`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `domaine`
--
ALTER TABLE `domaine`
  MODIFY `iddomaine_Domaine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `etablissement`
--
ALTER TABLE `etablissement`
  MODIFY `idEtablissement_Etablissement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `idformation_Formation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `markerstest`
--
ALTER TABLE `markerstest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `organisme`
--
ALTER TABLE `organisme`
  MODIFY `idOrganisme_Organisme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `secteur`
--
ALTER TABLE `secteur`
  MODIFY `idSecteur_Secteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `idVille_Ville` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `disponible`
--
ALTER TABLE `disponible`
  ADD CONSTRAINT `FK_Disponible_idEtablissement_Etablissement` FOREIGN KEY (`idEtablissement_Etablissement`) REFERENCES `etablissement` (`idEtablissement_Etablissement`),
  ADD CONSTRAINT `FK_Disponible_idformation_Formation` FOREIGN KEY (`idformation_Formation`) REFERENCES `formation` (`idformation_Formation`);

--
-- Contraintes pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD CONSTRAINT `FK_Etablissement_idOrganisme_Organisme` FOREIGN KEY (`idOrganisme_Organisme`) REFERENCES `organisme` (`idOrganisme_Organisme`),
  ADD CONSTRAINT `FK_Etablissement_idVille_Ville` FOREIGN KEY (`idVille_Ville`) REFERENCES `ville` (`idVille_Ville`);

--
-- Contraintes pour la table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `FK_Formation_iddomaine_Domaine` FOREIGN KEY (`iddomaine_Domaine`) REFERENCES `domaine` (`iddomaine_Domaine`);

--
-- Contraintes pour la table `marqueur`
--
ALTER TABLE `marqueur`
  ADD CONSTRAINT `FK_marqueur_idEtablissement_Etablissement` FOREIGN KEY (`idEtablissement_Etablissement`) REFERENCES `etablissement` (`idEtablissement_Etablissement`),
  ADD CONSTRAINT `FK_marqueur_idVille_Ville` FOREIGN KEY (`idVille_Ville`) REFERENCES `ville` (`idVille_Ville`);

--
-- Contraintes pour la table `se_situe`
--
ALTER TABLE `se_situe`
  ADD CONSTRAINT `FK_se_situe_idOrganisme_Organisme` FOREIGN KEY (`idOrganisme_Organisme`) REFERENCES `organisme` (`idOrganisme_Organisme`),
  ADD CONSTRAINT `FK_se_situe_idVille_Ville` FOREIGN KEY (`idVille_Ville`) REFERENCES `ville` (`idVille_Ville`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
