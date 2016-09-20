-- phpMyAdmin SQL Dump
-- version 4.2.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 20, 2016 at 09:27 AM
-- Server version: 5.5.43-0+deb7u1
-- PHP Version: 5.4.44-0+deb7u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `desert`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE IF NOT EXISTS `blog_categories` (
`cat_id` int(11) NOT NULL,
  `cat_descr` varchar(50) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`cat_id`, `cat_descr`) VALUES
(1, 'La gauche'),
(2, 'La droite'),
(3, 'Les autres');

-- --------------------------------------------------------

--
-- Table structure for table `blog_comments`
--

CREATE TABLE IF NOT EXISTS `blog_comments` (
`comment_ID` int(11) NOT NULL COMMENT 'Clé primaire',
  `comment_post_ID` int(11) NOT NULL COMMENT 'Clé vers le post',
  `comment_author` int(11) NOT NULL COMMENT 'Clé vers l''auteur',
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date du commentaire',
  `comment_content` text NOT NULL COMMENT 'Texte du commentaire'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `blog_comments`
--

INSERT INTO `blog_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_date`, `comment_content`) VALUES
(1, 1, 2, '2012-04-11 12:27:00', 'Cette campagne est ennuyeuse à mourir !'),
(2, 1, 2, '2012-04-10 11:27:34', '30% d''abstension attendue ...'),
(3, 2, 2, '2012-04-10 12:29:23', 'Les commentaires sur les blogs ne sont que rarement intéressants'),
(4, 2, 2, '2012-06-07 09:35:28', 'Test de commentaire');

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE IF NOT EXISTS `blog_posts` (
`post_ID` int(11) NOT NULL COMMENT 'Clé primaire',
  `post_author` int(11) NOT NULL COMMENT 'Clé vers l''auteur',
  `post_category` int(11) NOT NULL,
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date du post',
  `post_content` longtext NOT NULL COMMENT 'Contenu du post',
  `post_title` text NOT NULL COMMENT 'Titre du post'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`post_ID`, `post_author`, `post_category`, `post_date`, `post_content`, `post_title`) VALUES
(1, 1, 2, '2012-04-10 10:00:00', '« Nous irons au pouvoir car c’est que veulent les Français, j’en suis certaine. C’est ce que nous voulons tous ». Nous étions alors en janvier 2011, et la présidente du Front National, à peine investie à la tête de son parti, n’hésitait pas à afficher clairement son objectif : faire sortir l’extrême droite de sa fonction d’agitatrice politique pour l’amener aux portes de l’Elysée. Alors poussée par des sondages incroyablement favorables, l’héritière rêve déjà de renouveller « l’exploit » du 21 avril et, mieux encore, de mener un second tour au coude à coude contre l’un des candidats de « l’UMPS ».\r\n\r\nDéjà très active dans la campagne de 2007, celle qui était alors la fille du chef a eu tout le temps d’observer et de comprendre les complexes ressorts du vote frontiste. Ainsi capable d’analyser le lien entre peur de l’étranger et malaise social, elle refonde totalement le discours économique de son parti, en n’hésitant pas à convoquer pour l’occasion Marx ou Roosevelt dans ses argumentaires. Le FN n’est ainsi plus tellement perçu comme le défenseur du français de souche que comme celui du « peuple opprimé » par les ravages d’un « mondialisme aveugle ». La fameuse « dédiabolisation » est en marche, et elle passera par l’exclusion des élements les plus sulfureux de son parti… présidentialisation oblige.\r\n\r\nL’opération semble réussir… ouvriers, cadres, artisans s’avouant désormais séduits par une candidate « plus ouverte que son père », sur les sujets qui fâchent. Peu à peu, la « vague bleue Marine », forte d’une nouvelle respectabilité, prend son élan et finit par inquiéter les états-majors des grands partis. La première onde de choc tombera le 20 mars 2011, au soir du premier tour des élections cantonales, alors que l’extrême droite progresse sur l’ensemble du territoire et arrache un premier canton, celui de Carpentras.\r\n\r\nGalvanisée par des résultats supposés prometteurs, la candidate se satisfait d’une stratégie jusque là réussie : renvoyer dos à dos UMP et PS pour mieux promouvoir « la nouvelle élite », celle qui se souciera du sort d’un électorat oublié par la mondialisation et victime de l’appétit vorace d’une finance toute-puissante. Quelques mois plus tard, Jean-Luc Mélenchon reconnaîtra lui même qu’elle était alors, dans l’esprit des électeurs, la seule représentante de la France du non, et par extension celle des classes populaires déçues de la mondialisation.\r\n\r\nLa « présidente », malgré un retour parfois violent sur ce que l’on appelle pudiquement les fondamentaux de son électorat, ne bougera désormais plus d’un iota : elle est, selon elle, devenue « la seule candidate de la révolte populaire », ou encore « la seule voie de l’exception française », en clair : la seule qui changera vraiment la gouvernance du pays. Histoire d’appuyer la parole par l’image, elle rythme sa campagne par des bains de foule visant à la dépeindre en véritable star du peuple… Illustration\r\n\r\n\r\n\r\nEn plein cœur d’Hénin-Beaumont, petite ville du Pas-de-Calais devenue la vitrine d’une extrême droite en phase avec les angoisses des ouvriers, la frontiste joue la partition au millimètre et s’affiche tout sourire avec des têtes blondes arborant fièrement leur t-shirts « Marine 2012 »… histoire de dire que le Front National n’effraie pas les enfants. Dédiabolisation, encore et toujours.\r\n\r\nMais, comme nous l’avions déjà vu, les différents partis ont beaucoup appris de 2002 en développant à leur tour un discours rassurant et protecteur, tandis que Jean Luc Mélenchon a su rebattre les cartes en ressuscitant la gauche anti-libérale. A 12 jours du premier tour, et alors que la candidate stagne à dix points derrière François Hollande, on peut ainsi présumer sans risque qu’elle ne créera pas la surprise cette année. Il n’en reste pas moins le troisième parti de France, et le simple fait qu’il occupe cette position constitue en soi un défi majeur pour la classe politique « traditionnelle ». Le Front National peut en attendant toujours tabler sur un scénario déjà plus probable et qui l’avantagerait considérablement aux législatives, à savoir la possible explosion de l’UMP en cas de défaite de Nicolas Sarkozy le 6 mai…', 'L’ambition républicaine du Front National.'),
(2, 2, 1, '2012-04-05 12:00:00', 'Il serait désormais le troisième homme de cette présidentielle, autrement dit celui capable de peser de tout son poids pour rebattre les cartes d’une campagne jusque là très binaire. Jean Luc Mélenchon, fort de sa nouvelle position, le martèle tant qu’il peut, il ne veut pas d’une « élection à la papa » ou l’austérité sociale-démocrate donnerait platement la réplique à l’austérité libérale. Tout semblait pourtant bien balisé jusque là : les socialistes pouvaient compter sur un anti-sarkozisme fort pour se laisser pousser vers l’Elysée en présentant un programme « solidaire » mais aussi « gestionnaire »… histoire d’être de gauche sans avoir à froisser les précieuses voix du centre.\r\n\r\nPreuve que les élections n’aiment pas les scénarios écrits à l’avance, cette stratégie se retrouve aujourd’hui bousculée par les grosses caisses du Front de Gauche, qui s’est accomodé au mieux d’un électorat qui refuse de résumer l’avenir politique à la simple réduction des déficits. Réunissant peu à peu les syndicats, les trotskistes, les communistes, les déçus du socialisme ou encore les écologistes radicaux, l’ancien sénateur aura ainsi rempli un objectif presque utopique : fédérer la gauche radicale sous un même étendard, tout en renouant avec des scores dignes de Georges Marchais.\r\n\r\nRésultat d’une alliance politique et d’une synthèse idéologique séduisante, la dynamique Front de Gauche doit aussi, pour beaucoup, à une personnalité peu commune et talentueuse.\r\n\r\nIci à la Bastille, fin février, pour un rassemblement visant à contrer l’adoption du traité européen de rigueur budgétaire, l’ancien socialiste affichait déjà une attitude des plus optimistes.\r\n\r\n\r\n\r\nAlors que François Hollande venait d’annoncer qu’il comptait taxer les gros revenus à hauteur de 75%, le candidat du Front de Gauche était aux anges : l’acte représentait en soi la reconnaissance de son mouvement comme force politique influente. Dans une manifestation initialement dédiée à la politique de l’Union Européenne, l’homme du jour profite de ce tremplin en distillant un message pluriel et efficace. Railleur envers Hollande, flatteur avec les écolos et solidaire de la cause ouvrière, Jean Luc Mélenchon a su dépasser avec talent son rôle de leader communiste pour s’imposer comme un tribun rassembleur. C’est d’ailleurs là tout le talent du monsieur : savoir être « de gauche en général et de gauche en particulier ».\r\n\r\nDésormais l’autre visage de l’opposition peut parler d’une même voix, et fort de cette union, il n’est pas impossible que quelques pages estampillées « Front de Gauche » puissent venir se greffer aux 60 propositions de François Hollande au lendemain du premier tour. D’ici là le principal enjeu reste de tenir la distance, et de s’assurer que l’alliance nouvellement forgée résiste à la diversité de l’électorat rassemblé.', 'L’attrape-tout Mélenchon'),
(3, 1, 3, '2012-03-31 09:00:00', 'François Bayrou hibernait-il ces dernières semaines? La question mérite d’être posée. Il aura fallu attendre le 25 mars pour que le candidat « central » tienne son premier, oui, son premier grand meeting, en présence de tous ses soutiens officiels. A vingt-huit jours du premier tour, il était temps. Car après son envolée du mois de décembre suite à l’annonce de sa candidature, François Bayrou est en perte de vitesse dans les sondages qui le placent désormais en cinquième position. Il fallait répliquer.\r\nAlors, après l’effet Bourget de François Hollande, l’effet Villepinte de Nicolas Sarkozy et surtout juste après l’effet Bastille de Jean-Luc Mélenchon, le président du MoDem, a profité du passage à l’heure d’été pour remettre les pendules à l’heure et créer l’effet Zénith. Plus de six mille personnes et un message d’espoir pour lancer, ou plutôt relancer la campagne au centre et délivrer les électeurs du débat imposé Droite-Gauche. Et pas question de se laisser impressionner par les enquêtes d’opinion défavorables. Une démonstration de force, oui, mais toujours tranquille.\r\n\r\nEn coulisses, juste avant d’entrer en scène pour prêcher la bonne parole dans un discours quasi mystique, François Bayrou affiche devant les caméras d’« Elysée 2012, la vraie campagne » sa sérénité.\r\n\r\n\r\n\r\n« Il n’y a pas d’espoir du côté de chez eux ». Ainsi parlait François Bayrou qui, dans un lyrisme « Proustien », s’en prenait une fois encore au bipartisme UMP-PS. Un bipartisme dont le président du MoDem ne saurait pourtant se passer, car sa position stratégique d’homme du centre ne pourrait exister aujourd’hui sans cette géographie politique.\r\n« Un pas en avant, deux pas en arrière »… François le Français abandonne Proust pour emprunter à la lutte sociale un vocabulaire contestataire et tenter de s’imposer comme le premier opposant aux deux « grands » de cette élection. Mais la situation de 2012 n’est pas celle d’il y a cinq ans. Le parti socialiste, cette fois-ci, est en ordre de bataille, uni derrière son candidat ; précieux atout dont avait été privée Ségolène Royal. Et Mélenchon, plus fort que jamais, semble, pour l’instant, voler la vedette à celui qui fût l’arbitre de 2007.\r\nAlors, François Bayrou est venu parler d’espoir. Peut-être est-il venu en chercher aussi, au milieu de ces milliers de sympathisants rassemblés. Nos caméras ont filmé ce jour-là un meeting en grand. L’effet Zénith est à nos yeux réussi. Mais de ces six mille personnes venues des quatre coins de la France par navettes mises à disposition par le parti, qu’en est-il vraiment de l’électorat du centre. Les électrons libres qui ne veulent ni d’Hollande, ni de Sarkozy, auront-ils cette fois-ci encore le réflexe consensuel et « géographique » du vote centriste ? Mieux encore pour le candidat du Modem, se laisseront-ils envoûter par l’espoir porté, ou du moins invoqué, par le Béarnais ? Une chose est sûre pour l’homme du « milieu », il faudra bien regarder du côté de chez eux….', 'L’espoir fait vivre… François Bayrou'),
(18, 2, 1, '2016-03-11 16:48:32', 'A l''issue de sa rencontre avec Manuel Valls, le président du syndicat étudiant considère que "le désaccord de fond reste entier" avec le gouvernement. Les prochaines manifestations auront lieu les 17 et 31 mars.\r\nIl a pu "discuter de tout, mais pas de la loi travail". Vendredi matin, le président de l''UNEF William Martinet a été reçu à Matignon par Manuel Valls. A l''issue de cet entretien, il a acté un "désaccord de fond" qui "reste entier" sur le projet de réforme du code du travail et appelle à "amplifier" la mobilisation étudiante contre ce texte.\r\n\r\nPour un retrait du projet de loi\r\n"Ce projet de loi va nous précariser", explique le syndicaliste qui assure que "les jeunes, les lycéens et les étudiants sont préoccupés". William Martinet a de nouveau demandé le retrait du projet de loi. Selon lui, lors de son entretien avec le Premier ministre, il n''y a pas eu de "discussion de fond" sur des "questions centrales", comme "la modulation du temps de travail, la modulation de la rémunération des heures supplémentaires et la question des indemnités prud''homales".\r\n\r\nLe responsable étudiant, qui estime que "le gouvernement craint" la mobilisation en cours, appelle donc à manifester le 17 mars et surtout le 31 mars, pour une "journée de grève et de manifestation qui va être déterminante".', 'William Martinet appelle a une modification.'),
(28, 1, 2, '2016-04-01 12:24:54', 'Petit test externe de la part de Robin.\r\n\r\n\r\nLà j''avoue c''est moi', 'Test'),
(27, 1, 2, '2016-04-01 12:22:58', 'Je men fou, ca fonctionne !\r\n', 'Tu vois comment ca fonctionne'),
(29, 1, 1, '2016-04-01 14:45:18', 'Cest sur', 'Le changement'),
(30, 1, 2, '2016-04-04 08:03:35', 'zdqdzq', 'zdzd'),
(31, 1, 2, '2016-04-04 08:10:48', 'Ouii c chiant je C !', 'Encore un test !'),
(32, 1, 2, '2016-04-04 08:11:08', 'Ouii c chiant je C !', 'Encore un test !'),
(33, 1, 2, '2016-04-04 08:11:32', 'Ouii c chiant je C !', 'Encore un test !'),
(34, 1, 2, '2016-04-04 08:12:19', 'Ouii c chiant je C !', 'Encore un test !'),
(35, 1, 2, '2016-04-04 08:12:37', '2edzqd', 'Ca fonctionne ?'),
(36, 1, 2, '2016-04-04 08:13:35', '2edzqd', 'Ca fonctionne ?'),
(37, 1, 2, '2016-04-04 08:14:38', '2edzqd', 'Ca fonctionne ?'),
(38, 2, 3, '2016-04-04 08:26:12', 'LOLZ', 'On est 42 !'),
(39, 1, 2, '2016-04-04 08:39:29', '\n		dzq', '\n		l''''''dzq'),
(40, 1, 2, '2016-04-04 08:40:04', '\n		dzql''''''dzq', '\n		zdq'),
(41, 2, 2, '2016-04-04 08:52:16', '\n		tdht', '\n		test notification'),
(42, 2, 2, '2016-04-04 08:59:12', 'Ouii', 'Ca fonctionne 3?'),
(43, 1, 2, '2016-04-08 08:20:55', '		zqdqzdq', '		dzqd2');

-- --------------------------------------------------------

--
-- Table structure for table `blog_users`
--

CREATE TABLE IF NOT EXISTS `blog_users` (
`ID` int(11) NOT NULL COMMENT 'Clé primaire',
  `user_login` varchar(60) NOT NULL COMMENT 'Login',
  `user_pass` varchar(64) NOT NULL COMMENT 'Password',
  `user_email` varchar(100) NOT NULL COMMENT 'Email',
  `display_name` varchar(250) NOT NULL COMMENT 'Nom affiché',
  `user_photo` varchar(45) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `blog_users`
--

INSERT INTO `blog_users` (`ID`, `user_login`, `user_pass`, `user_email`, `display_name`, `user_photo`) VALUES
(1, 'admin', 'admin', 'admin@blog.com', 'Ruben', NULL),
(2, 'dupont', '123456', 'dupont@lemail.com', 'Ruby', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `minitp`
--

CREATE TABLE IF NOT EXISTS `minitp` (
`MINITP_ID` int(11) NOT NULL,
  `MINITP_NAME` varchar(100) NOT NULL,
  `MINITP_MAIL` varchar(100) NOT NULL,
  `MINITP_COMMENT` varchar(250) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `minitp`
--

INSERT INTO `minitp` (`MINITP_ID`, `MINITP_NAME`, `MINITP_MAIL`, `MINITP_COMMENT`) VALUES
(1, 'Jean Dupont', 'jd@unmail.com', 'Ce site est super, on ne peut faire mieux'),
(2, 'Pierre Durand', 'pierre@unsite.fr', 'Superbes photos, trop top !'),
(3, 'Un anonymous pas content', 'anonymous@revolution.org', 'Je demande la suppression des copyright et revendique le tout gratuit !! Et moi je bosse gratis !'),
(5, 'Webmaster', 'webmaster@lesite.com', 'Merci pour tous vos messages sympathiques'),
(6, 'Le modérateur', 'modo@lesite.com', 'Désolé pour tous les messages que j''ai supprimé'),
(32, 'Ruben', 'ruben@test.com', 'Ca marche !'),
(34, 'Ruben', 'ruben@test.com', 'Ca marche !'),
(35, 'test', 'dzqdq', 'jlijil'),
(36, 'ruben', 'mzdoqdq@zdqm', 'dzmqdq'),
(37, '', '', ''''),
(38, 'test', 'dzqdq', 'ldzqdzq'),
(39, 'dzdq', 'qdzdq', 'zqdzqd'),
(40, 'dzqd', 'qdzqd', 'qzdqz'),
(41, '', '', ''),
(42, '', '', ''),
(43, '', '', ''),
(44, '', '', ''),
(45, '', '', ''),
(46, '', '', ''),
(47, '', '', ''),
(48, 'Enfin', 'Voila@voial.com', 'Le devoir est enfin terminer je crois !'),
(49, 'testa', 'test@mail.com', 'test'),
(50, 'test', 'test@notif.com', 'On est 42 !');

-- --------------------------------------------------------

--
-- Table structure for table `minitp_old`
--

CREATE TABLE IF NOT EXISTS `minitp_old` (
`MINITP_ID` int(11) NOT NULL,
  `MINITP_NAME` varchar(100) NOT NULL,
  `MINITP_MAIL` varchar(100) NOT NULL,
  `MINITP_COMMENT` varchar(250) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `minitp_old`
--

INSERT INTO `minitp_old` (`MINITP_ID`, `MINITP_NAME`, `MINITP_MAIL`, `MINITP_COMMENT`) VALUES
(1, 'Jean Dupont', 'jd@unmail.com', 'Ce site est super, on ne peut faire mieux'),
(2, 'Pierre Durand', 'pierre@unsite.fr', 'Superbes photos, trop top !'),
(3, 'Un anonymous pas content', 'anonymous@revolution.org', 'Je demande la suppression des copyright et revendique le tout gratuit !! Et moi je bosse gratis !'),
(5, 'Webmaster', 'webmaster@lesite.com', 'Merci pour tous vos messages sympathiques');

-- --------------------------------------------------------

--
-- Table structure for table `projet1a_categories`
--

CREATE TABLE IF NOT EXISTS `projet1a_categories` (
`cat_id` int(11) NOT NULL,
  `cat_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cat_descr` varchar(50) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `projet1a_categories`
--

INSERT INTO `projet1a_categories` (`cat_id`, `cat_date`, `cat_descr`) VALUES
(7, '2016-04-29 08:48:21', 'Ecologie'),
(8, '2016-04-29 08:48:21', 'Technologie'),
(9, '2016-04-29 08:48:31', 'Conférence');

-- --------------------------------------------------------

--
-- Table structure for table `projet1a_comments`
--

CREATE TABLE IF NOT EXISTS `projet1a_comments` (
`comment_id` int(11) NOT NULL COMMENT 'Clé primaire',
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date du commentaire',
  `comment_content` text NOT NULL COMMENT 'Texte du commentaire',
  `comment_post_ID` int(11) NOT NULL COMMENT 'Clé vers le post',
  `comment_author` int(11) NOT NULL COMMENT 'Clé vers l''auteur'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `projet1a_contacts`
--

CREATE TABLE IF NOT EXISTS `projet1a_contacts` (
`contact_id` int(11) NOT NULL,
  `contact_firstname` varchar(45) DEFAULT NULL,
  `contact_lastname` varchar(45) DEFAULT NULL,
  `contact_company` varchar(45) NOT NULL,
  `contact_mail` varchar(100) DEFAULT NULL,
  `contact_phone` varchar(15) DEFAULT NULL,
  `contact_message` text
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `projet1a_contacts`
--

INSERT INTO `projet1a_contacts` (`contact_id`, `contact_firstname`, `contact_lastname`, `contact_company`, `contact_mail`, `contact_phone`, `contact_message`) VALUES
(58, 'nkjhk', '', '', 'adrien.joly@gmail.com', '', 'efef'),
(60, 'DUPONT', 'Jean', '', 'jean.dupont@gmail.com', '0722546632', 'Bonjour,\r\n\r\nJe souhaiterais avoir plus d''informations concernant votre politique de recrutement.\r\n\r\nMerci de votre réponse,\r\nCordialement\r\n\r\nJean DUPONT'),
(61, 'Dupuis', 'Edgar', '', 'edgar.dupuis@eemi.com', '', 'Bonjour,\r\n\r\nNous avons été absent lors de la conférence, serait-il possible de recevoir le .pdf récapitulatif ?\r\n\r\nCordialement,\r\nEdgar DUPUIS'),
(63, 'Vélon', 'Pierre', 'EEMI', 'pierre.velon@eemi.com', '', 'Test');

-- --------------------------------------------------------

--
-- Table structure for table `projet1a_pictures`
--

CREATE TABLE IF NOT EXISTS `projet1a_pictures` (
`pict_id` int(11) NOT NULL,
  `pict_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pict_url` varchar(255) NOT NULL,
  `pict_descr` varchar(45) NOT NULL,
  `blog_posts_post_ID` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `projet1a_pictures`
--

INSERT INTO `projet1a_pictures` (`pict_id`, `pict_date`, `pict_url`, `pict_descr`, `blog_posts_post_ID`) VALUES
(1, '2016-05-09 13:41:36', 'img/article1.jpg', 'Image voiture volante', 18),
(3, '2016-05-09 13:53:18', 'img/article3.jpg', 'Image conférence Toronto', 20),
(4, '2016-05-09 14:04:11', 'img/article/ecologie_cadre.jpg', 'Image ecologie', 23),
(5, '2016-05-09 14:06:02', 'img/article/ecole_inde_cadre.jpg', 'Ecole en Inde', 22),
(6, '2016-05-09 14:07:01', 'img/article/concert_ecologique_cadre.jpg', 'Image d''un concert ecologique', 21),
(7, '2016-05-09 14:08:48', 'img/article2.jpg', 'Image Ecole Innovante', 19);

-- --------------------------------------------------------

--
-- Table structure for table `projet1a_posts`
--

CREATE TABLE IF NOT EXISTS `projet1a_posts` (
`post_id` int(11) NOT NULL COMMENT 'Clé primaire',
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date du post',
  `post_title` text NOT NULL COMMENT 'Titre du post',
  `post_content` longtext NOT NULL COMMENT 'Contenu du post',
  `post_author` int(11) NOT NULL COMMENT 'Clé vers l''auteur',
  `post_category` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `projet1a_posts`
--

INSERT INTO `projet1a_posts` (`post_id`, `post_date`, `post_title`, `post_content`, `post_author`, `post_category`) VALUES
(18, '2016-04-29 08:49:12', 'Nova Corp et les voitures volantes', '<p>C&rsquo;est non sans une certaine fiert&eacute; que nous vous annon&ccedil;ons que Nova Corp a mis au point la Glider 0, un v&eacute;hicule capable de l&eacute;viter &agrave; 50 centim&egrave;tres du sol.</p>\r\n<p>La Glider 0 est le fruit de nombreuses ann&eacute;es de recherches et ils ont aujourd&rsquo;hui abouti &agrave; ce v&eacute;hicule 100% &eacute;lectrique ayant une vitesse de pointe de 50km/h. Mais ce qui fait l&rsquo;attrait de cette invention, c&rsquo;est sa mani&egrave;re de se d&eacute;placer, en effet, elle ne roule pas mais l&eacute;vite supprimant ainsi &eacute;norm&eacute;ment d&rsquo;&eacute;nergie gaspill&eacute;e en frottement avec le sol, cela lui permet donc une autonomie tr&egrave;s &eacute;lev&eacute;e pour un prototype (5h en vitesse maximale ).</p>\r\n<p>A quand les voitures volantes alors ? Malheureusement, pas forc&eacute;ment pour tout de suite, la Glider 0 n&eacute;cessite des routes aimant&eacute;es qui sont elles aussi &agrave; l&rsquo;&eacute;tat de prototype et qui n&eacute;cessiterons du temps et de l&rsquo;argent &agrave; d&eacute;ployer, mais Nova Corp travaille activement afin de simplifier le syst&egrave;me de routes aimant&eacute;es et de les rendre les moins couteuses possible afin de permettre une diffusion &agrave; travers le monde. Mais malgr&eacute; les efforts mis en place il faudra &ecirc;tre patient avant de pouvoir esp&eacute;rer une d&eacute;mocratisation de cette technologie.</p>\r\n<p>Nova Corp va continuer &agrave; travailler et optimiser sa Glider 0 afin pouvoir proposer le meilleur v&eacute;hicule possible, Nova Corp fait ce qui est possible pour cr&eacute;er l''impossible.</p>', 5, 8),
(19, '2016-04-29 09:16:45', 'Une école innovante : iNOVA School', '<p>La baisse g&eacute;n&eacute;rale du niveau de qualification des &eacute;coles d''ing&eacute;nieurs posait un r&eacute;el probl&egrave;me lors des recrutements pour les entreprises de haute technologie.</p>\r\n<p>C''est pourquoi Robin Mesa Marin, Ruben D&eacute;sert et Romain Rouleau, les cr&eacute;ateurs de la grande firme Nova Corp ont d&eacute;cid&eacute; de r&eacute;soudre ce probl&egrave;me de mani&egrave;re tout &agrave; fait radicale. En effet, c''est par la cr&eacute;ation de leur propre &eacute;cole que les g&eacute;ants du high-tech comptent bannir ce probl&egrave;me.</p>\r\n<p>En proposant une formation professionnalisante bas&eacute;e sur la synergie entre cours th&eacute;oriques et stages en entreprise. Les dirigeants souhaitent offrir aux &eacute;l&egrave;ves une formation des plus compl&egrave;tes et des plus en phase avec son temps en tenant compte des perp&eacute;tuelles &eacute;volutions technologiques : L&rsquo;iNOVA School.</p>', 6, 8),
(20, '2016-04-29 09:16:45', 'Conférence internationale de l’entreprenariat', '<p>Nous avons le plaisir d&rsquo;&ecirc;tre les invit&eacute;s d&rsquo;honneur &agrave; la 4&egrave;me conf&eacute;rence internationale de l&rsquo;entreprenariat et de l&rsquo;innovation.</p>\r\n<p>Cet &eacute;v&egrave;nement qui se tiendra &agrave; Toronto du 28 au 29 Avril 2016, r&eacute;unira plus de 25 pays, de nombreuses universit&eacute;s, et encore plus d&rsquo;entreprises dont le ma&icirc;tre mot est l&rsquo;innovation. L&rsquo;un de nos fondateurs, Robin Rinma-Same, sera pr&eacute;sent pour introduire la conf&eacute;rence, et mettre en avant l&rsquo;importance de l&rsquo;innovation pour les nouvelles entreprises.</p>\r\n<p>La vid&eacute;o d&rsquo;introduction sera pr&eacute;sente sur notre <a href="https://www.facebook.com/Nova-Corporation-1580002722328950/" target="_blank">compte Facebook</a>.</p>', 5, 9),
(21, '2016-04-29 09:16:45', 'Nova Corp organise son premier concert écolo !', '<p>C''est en France qu''aura lieu le premier num&eacute;ro du PEACE &amp; INNOV , le premier festival &eacute;colo organis&eacute; par Nova Corp. Ce dernier aura pour but de r&eacute;colter des fonds qui seront utilis&eacute;s dans le cadre de la recherche en mati&egrave;re d''&eacute;nergie renouvelable pour pr&eacute;server la plan&egrave;te.</p>\r\n<p>Un paysage magnifique, une programmation in&eacute;dite, 10 hectares de terrain, 5 sc&egrave;nes, 5 ambiances diff&eacute;rentes, 3 jours de concert.</p>\r\n<p>La t&ecirc;te d''affiche se compose de nombreux groupes fran&ccedil;ais et internationaux : Wiz Khalifa, Danakil, Dub Inc, Die Antwoord, Dr Dre, Linkin Park, Parov Stelar, Flume... et bien d''autres. Un &eacute;v&eacute;nement &eacute;co-responsable &agrave; ne rater sous aucun pr&eacute;texte !</p>', 6, 7),
(22, '2016-04-29 09:16:45', 'Novacorp partenaires de l’India Institute Technology', '<p>Suite &agrave; de longues discussions avec le ministre de l&rsquo;&eacute;ducation de l&rsquo;Etat Indien, nous venons de trouver un accord avec l&rsquo;IIT de la r&eacute;gion de DELHI.</p>\r\n<p>Cela permettra aux &eacute;tudiants d&rsquo;acc&eacute;der &agrave; de nouvelles ressources pour mener leurs projets, tels que l&rsquo;acc&egrave;s &agrave; des instruments de haute technologie, ou une base de connaissances qui leur sera exclusivement r&eacute;serv&eacute;e.</p>\r\n<p>De nombreux &eacute;v&egrave;nements seront aussi mis en place pour permettre aux &eacute;l&egrave;ves le souhaitant, d&rsquo;exporter leur savoir aux quatre coins du monde.</p>\r\n<p>L&rsquo;Inde &eacute;tant le pays o&ugrave; l&rsquo;on enseigne tr&egrave;s t&ocirc;t le concept d&rsquo;innovation aux &eacute;l&egrave;ves, cet accord intervient dans le cadre du projet du ministre Narendra Modi, souhaitant promouvoir l&rsquo;ouverture aux mondes des universit&eacute;s Indiennes.</p>\r\n<p>Nous esp&eacute;rons &eacute;tendre cet accord &agrave; d&rsquo;autres r&eacute;gions et que cela profite &agrave; nos deux organisations.</p>', 7, 8),
(23, '2016-04-29 09:16:45', 'Novacorp investit des millions dans l''environnement', '<p>Ce 5 F&eacute;vrier 2016 nous vous annon&ccedil;ons avec fiert&eacute; que Nova Corp a investi 500 millions de dollars sous forme de dons aupr&egrave;s de divers organismes agissant pour le bien de l&rsquo;environnement</p>\r\n<p>Ce don s&rsquo;inscrit dans la philosophie de Nova Corp de pr&eacute;server l&rsquo;environnement afin de vivre dans un monde meilleur aussi bien d&rsquo;un point de vue technologique avec les brevets cr&eacute;&eacute;s par Nova Corp que d&rsquo;un point de vue environnemental avec les dons que l&rsquo;entreprise vient d&rsquo;effectuer.</p>\r\n<p>Nova Corp affirme donc son implication dans la protection de l&rsquo;environnement et ce don arrive alors que l&rsquo;entreprise a affirm&eacute; sa volont&eacute; de r&eacute;duire encore plus son empreinte carbone.</p>', 7, 7);

-- --------------------------------------------------------

--
-- Table structure for table `projet1a_users`
--

CREATE TABLE IF NOT EXISTS `projet1a_users` (
`user_id` int(11) NOT NULL COMMENT 'Clé primaire',
  `user_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_login` varchar(20) NOT NULL COMMENT 'Login',
  `user_password` varchar(32) NOT NULL COMMENT 'Password',
  `user_email` varchar(100) NOT NULL COMMENT 'Email',
  `display_name` varchar(255) NOT NULL COMMENT 'Nom affiché',
  `user_photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `projet1a_users`
--

INSERT INTO `projet1a_users` (`user_id`, `user_date`, `user_login`, `user_password`, `user_email`, `display_name`, `user_photo`) VALUES
(3, '2016-03-21 18:19:14', 'phg', '123456', 'phg@mail.com', 'Ph Giraud', NULL),
(4, '2016-04-27 08:18:36', 'admin', 'adminnovacorp3', '', 'Admin', NULL),
(5, '2016-04-29 08:47:13', 'ruben', 'ruben15', '', 'Ruben', NULL),
(6, '2016-04-29 09:12:20', 'romain', 'romain15', '', 'Romain', NULL),
(7, '2016-04-29 09:12:20', 'robin', 'robin15', '', 'Robin', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
 ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `blog_comments`
--
ALTER TABLE `blog_comments`
 ADD PRIMARY KEY (`comment_ID`), ADD KEY `fk_blog_comments_blog_posts1` (`comment_post_ID`), ADD KEY `fk_blog_comments_blog_users1` (`comment_author`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
 ADD PRIMARY KEY (`post_ID`), ADD KEY `fk_blog_posts_blog_users` (`post_author`), ADD KEY `fk_blog_posts_blog_categories1` (`post_category`);

--
-- Indexes for table `blog_users`
--
ALTER TABLE `blog_users`
 ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `minitp`
--
ALTER TABLE `minitp`
 ADD PRIMARY KEY (`MINITP_ID`);

--
-- Indexes for table `minitp_old`
--
ALTER TABLE `minitp_old`
 ADD PRIMARY KEY (`MINITP_ID`);

--
-- Indexes for table `projet1a_categories`
--
ALTER TABLE `projet1a_categories`
 ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `projet1a_comments`
--
ALTER TABLE `projet1a_comments`
 ADD PRIMARY KEY (`comment_id`), ADD KEY `fk_blog_comments_blog_posts1_idx` (`comment_post_ID`), ADD KEY `fk_blog_comments_blog_users1_idx` (`comment_author`);

--
-- Indexes for table `projet1a_contacts`
--
ALTER TABLE `projet1a_contacts`
 ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `projet1a_pictures`
--
ALTER TABLE `projet1a_pictures`
 ADD PRIMARY KEY (`pict_id`), ADD KEY `fk_blog_pictures_blog_posts1_idx` (`blog_posts_post_ID`);

--
-- Indexes for table `projet1a_posts`
--
ALTER TABLE `projet1a_posts`
 ADD PRIMARY KEY (`post_id`), ADD KEY `fk_blog_posts_blog_users_idx` (`post_author`), ADD KEY `fk_blog_posts_blog_categories1_idx` (`post_category`);

--
-- Indexes for table `projet1a_users`
--
ALTER TABLE `projet1a_users`
 ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `blog_comments`
--
ALTER TABLE `blog_comments`
MODIFY `comment_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clé primaire',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
MODIFY `post_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clé primaire',AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `blog_users`
--
ALTER TABLE `blog_users`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clé primaire',AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `minitp`
--
ALTER TABLE `minitp`
MODIFY `MINITP_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `minitp_old`
--
ALTER TABLE `minitp_old`
MODIFY `MINITP_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `projet1a_categories`
--
ALTER TABLE `projet1a_categories`
MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `projet1a_comments`
--
ALTER TABLE `projet1a_comments`
MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clé primaire';
--
-- AUTO_INCREMENT for table `projet1a_contacts`
--
ALTER TABLE `projet1a_contacts`
MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `projet1a_pictures`
--
ALTER TABLE `projet1a_pictures`
MODIFY `pict_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `projet1a_posts`
--
ALTER TABLE `projet1a_posts`
MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clé primaire',AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `projet1a_users`
--
ALTER TABLE `projet1a_users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Clé primaire',AUTO_INCREMENT=8;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `projet1a_comments`
--
ALTER TABLE `projet1a_comments`
ADD CONSTRAINT `fk_blog_comments_blog_posts1` FOREIGN KEY (`comment_post_ID`) REFERENCES `projet1a_posts` (`post_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_blog_comments_blog_users1` FOREIGN KEY (`comment_author`) REFERENCES `projet1a_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `projet1a_pictures`
--
ALTER TABLE `projet1a_pictures`
ADD CONSTRAINT `fk_blog_pictures_blog_posts1` FOREIGN KEY (`blog_posts_post_ID`) REFERENCES `projet1a_posts` (`post_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `projet1a_posts`
--
ALTER TABLE `projet1a_posts`
ADD CONSTRAINT `fk_blog_posts_blog_categories1` FOREIGN KEY (`post_category`) REFERENCES `projet1a_categories` (`cat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_blog_posts_blog_users` FOREIGN KEY (`post_author`) REFERENCES `projet1a_users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
