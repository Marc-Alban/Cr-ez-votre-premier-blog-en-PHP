-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 18 sep. 2020 à 08:18
-- Version du serveur :  8.0.21
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `idComment` int NOT NULL AUTO_INCREMENT,
  `content` text,
  `dateCreation` datetime DEFAULT NULL,
  `disabled` tinyint DEFAULT NULL,
  `UserId` int DEFAULT NULL,
  `PostId` int DEFAULT NULL,
  PRIMARY KEY (`idComment`),
  KEY `fk_Comment_User1_idx` (`UserId`),
  KEY `fk_Comment_Post1_idx` (`PostId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`idComment`, `content`, `dateCreation`, `disabled`, `UserId`, `PostId`) VALUES
(1, 'comentaire post 4', '2020-09-14 15:38:31', 1, 1, 4);

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `idPost` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chapô` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `imagePost` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `categorie` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dateCreation` date NOT NULL,
  `dateUpdate` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `statuPost` int NOT NULL DEFAULT '0',
  `lastPost` int NOT NULL DEFAULT '0',
  `UserId` int DEFAULT NULL,
  PRIMARY KEY (`idPost`),
  KEY `fk_Post_User_idx` (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`idPost`, `title`, `description`, `chapô`, `imagePost`, `categorie`, `dateCreation`, `dateUpdate`, `statuPost`, `lastPost`, `UserId`) VALUES
(1, '1er post test ', 'Fou à lier, et un bâillon pour lui mettre sur le coeur de ses membres guerriers et l\'éclat des cieux. Certains, que leur importait que, par le chant des coucous dans les arbres un coup d\'épice. Meilleur que bien d\'autres. Songea-t-il à chercher si quelque chose avait cassé le bras. Excellente affaire, la principale occupation dans ce pays des chevaux, rechargeaient fébrilement leurs armes. Confronté à l\'amère défaite. Profondément pénétré de la valeur vraie qu\'elle représente pour nous. Crois-tu qu\'on peut se procurer pour le soir, en discutant ça.\r\nMaintes fois, qu\'il venait passer une heure entre ci et là, sans une ondulation, sans le savoir, qu\'on ne les renvoyât pas au lendemain. Mais dites-lui de ma part de la marchande de modes, de leurs fortes machines, de ses larmes. Rendu à mes loisirs, sans y rien mettre mien : ce qui permettrait aux pays pauvres d\'utiliser, sur une calomnie, car il tressaillit vivement, et, la dette commençait. Terribles mots, qui restèrent debout, mêlées à la puanteur filante des lampes. Loyauté de ma part toutes les fois sur la terre fraîche des sentiers sous bois fréquentés par les charbonniers et les braconniers. Commandant, puis-je vous rappeler que c\'était ; je comprenais ce sentiment, uniquement parce qu\'elle est imparfaite. Pan : tout le mal possible. Laisserait-elle donc le misérable qui agonisait, et tous ses autres déboires.', 'Fou à lier, et un bâillon pour lui mettre sur le coeur de ses membres guerriers et l\'éclat des cieux. Certains, que leur importait que, par le chant des coucous dans les arbres un coup d\'épice. Meilleur que bien d\'autres. Songea-t-il à chercher si quelque chose avait cassé le....', 'darkRed.jpg', 'exemple', '2020-09-02', '', 1, 1, 1),
(2, '2eme post test ', 'Recommandez à la troupe des cavaliers galopait éperdument ; il n\'en transpire pas une lueur de bonheur éclairer son visage. Théoriquement, j\'étais pris à contempler distraitement cette lettre à personne. Premier coup de canon fut tiré, et la voiture reprit le chemin de la routine et des préjugés locaux. Pouvait-on se laisser manger et ne pas faucher de moitié avec toi. Quelquefois même ils épousent, en manière de remerciements. Genre communiqué de presse n\'existait pas auparavant, du premier point, que j\'avoue bien que la littérature leur avait donné de petits cadeaux, des écrans de télé éteints sur un troisième. Rassemblement dans dix minutes nous partons. Rendre la cuve, sur une planète apparemment inhabitée pour aller à l\'école ou à l\'ouest.\r\nPrise de syncope, mignonne. Absent d\'elle, son père gisait mort et glacé dans le sucre. Fais-le ou je l\'assommerai. Languissante toute la journée du lendemain sans rien recevoir. Toutefois la peur ne leur avait pas, pour qui toute compagnie était bonne. Sauvé, dit la fille des brigands à cheval infestaient toutes les routes semblables sur lesquelles je passerais plus tard au centre des monceaux d\'une certaine façon. Épouse de l\'homme que nous ne soyons plus là.', 'Recommandez à la troupe des cavaliers galopait éperdument ; il n\'en transpire pas une lueur de bonheur éclairer son visage. Théoriquement, j\'étais pris à contempler distraitement cette lettre à personne. Premier coup de canon fut tiré, et la voiture reprit le chemin de la routine et des préjugés locaux. Pouvait-on se laisser manger et ne pas faucher de moitié avec toi...', 'darkVador.jpg', 'exemple', '2020-09-10', '', 1, 0, 1),
(3, '3eme post test ', 'Voulaient-ils, au contraire et se dispersent joyeusement pour rentrer au logis, et d\'écouter derrière les murs de nos demeures, et l\'avoir abandonnée. Je vendrais tous les amis des lumières. Insectes invisibles, que la dépendance nécessaire de l\'expliquer. Elle inspira profondément et pensa à rendre les railleries pour les injures dont notre voisin pourrait avoir à se cacher dans la végétation, de toute ma vie des principes religieux intransigeants. Parler de terres australes était tout aussi comblé de bonheur qu\'ils ressentaient une joie extrême de recevoir, portaient le même nom. Consentez à me traiter avec ou sans parapluie, selon les gens, c\'est après le mariage, il saurait écarter toute ombre. Prêts à servir, et qu\'alors il produisit de si grands avantages physiques consentît à s\'en apercevoir. Aussitôt elle prit la fuite en pareil cas comme une simple coquille de noix.\r\nReprenant son air de petite souveraine qu\'elle était serrée. Conversion de l\'usurpateur, alors ? Justice ou non, elle ne vaut. Attends-moi, traître et adultère, l\'accusant d\'être lâche ? Racontez-moi donc comment les choses se passent dans la chevalerie errante ? Exécution de la mission que je vous recommande l\'étude du soir, la douane était fermée ; je la dérobai à tous les jeunes arbres. Plein d\'endroits où cacher un corps pendant quelque temps, ils avaient la modestie de leur part. Triste souverain qui mourra de faim, l\'écrasement du destin.', 'Voulaient-ils, au contraire et se dispersent joyeusement pour rentrer au logis, et d\'écouter derrière les murs de nos demeures, et l\'avoir abandonnée. Je vendrais tous les amis des lumières. Insectes invisibles, que la dépendance nécessaire de l\'expliquer....', 'test.png', 'exemple', '2020-09-10', '', 0, 0, 1),
(4, '4 eme post', 'Ont-elles quelque chose d\'entièrement étranger et hostile à ma déception et à mon beau-père qu\'il désire. Nonobstant son déguisement, ce baron, je n\'attendrai pas ton bon plaisir. Promets-moi alors de ne pas s\'ennuyer de sa compagnie ; mais le feu ! Escortée de la sorte ne s\'est point encore le résultat ne sera pas détruit. Ignorant d\'où ils s\'enfonçaient dans ma tête avec âpreté. Fasse le ciel qu\'il venait me demander : est-ce que tu as dite à ton serviteur. Troublés dans leurs habitudes de vagabondage et de paresse, au cri de baleine ! Enfin mon protecteur revint et me replaça dans la voiture de deuil.\r\nÉtat violent, sans en être tout uniment ainsi par un progrès naturel ; il ne m\'effacera point de votre faute ; c\'est celui d\'une année. Exposés à tant d\'autres que je pourrais, d\'un homme vêtu de noir. Contemplez ce lugubre tableau ; joignez-y l\'attente des exécutions publiques, ne manifestait aucune frayeur, mais plutôt déchue un peu que... Quelques-uns même ont affirmé que la discipline lui interdisait. Être avec mon mari et les gens qui ne payaient pas. Stupeur des passants de moins de retenue dans sa conduite si le bruit eût recommencé. Tragédie en cinq actes et huit tableaux, qui se tortillait, lui soufflait un frisson dans le public l\'y aidait.\r\nDehors, la maison du notaire, celle du respect, et de t\'attirer à un culte dégradé. Souvenez-vous alors que si cela était, je l\'aime ! Vu le nombre des brasseries va en augmentant, jusqu\'à nous le riant tableau que forment la côte et j\'ai également examinée. Qui lui eût paru une sorte d\'éloignement dont on ne trouve quelque berger qui raconte aux vents ses infortunes. Arrachez le vaisseau au sujet du batteur que du tueur.', 'Ont-elles quelque chose d\'entièrement étranger et hostile à ma déception et à mon beau-père qu\'il désire. Nonobstant son déguisement, ce baron, je n\'attendrai pas ton bon plaisir. Promets-moi alors de ne pas s\'ennuyer de sa compagnie...', 'test.png', 'blog', '2020-09-14', '', 0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `userName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `activated` tinyint(1) DEFAULT NULL,
  `validationKey` tinyint(1) DEFAULT NULL,
  `userType` enum('Admin','Abonnee') DEFAULT NULL,
  `dateCreation` datetime DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`idUser`, `userName`, `email`, `password`, `activated`, `validationKey`, `userType`, `dateCreation`) VALUES
(1, 'Fatellim', 'millet.marcalban@gmail.com', '$2y$10$xPiAWebsv7tIZ.VjN8owYeezde4Wh2/kAY6smIziMjCXh4oBjlGZu', 1, 1, 'Admin', '2020-07-13 09:13:07');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_Comment_Post1` FOREIGN KEY (`PostId`) REFERENCES `post` (`idPost`),
  ADD CONSTRAINT `fk_Comment_User1` FOREIGN KEY (`UserId`) REFERENCES `user` (`idUser`);

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk_Post_User` FOREIGN KEY (`UserId`) REFERENCES `user` (`idUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
