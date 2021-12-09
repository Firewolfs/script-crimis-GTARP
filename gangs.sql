ALTER TABLE `users`
	ADD COLUMN `id_gang` int(11) DEFAULT NULL,
	ADD COLUMN `mj` tinyint(1) DEFAULT '0'
;

-- --------------------------------------------------------

--
-- Structure de la table `wf_business`
--

CREATE TABLE IF NOT EXISTS `wf_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `wf_gangs`
--

CREATE TABLE IF NOT EXISTS `wf_gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `id_chef` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_x` float DEFAULT NULL,
  `pos_y` float DEFAULT NULL,
  `pos_z` float DEFAULT NULL,
  `heading` float DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_chef` (`id_chef`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `wf_gang_business`
--

CREATE TABLE IF NOT EXISTS `wf_gang_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_gang` int(11) DEFAULT NULL,
  `id_business` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_GANG` (`id_gang`),
  KEY `FK_BUSINESS` (`id_business`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_gang`) REFERENCES `wf_gangs` (`id`);

--
-- Contraintes pour la table `wf_gangs`
--
ALTER TABLE `wf_gangs`
  ADD CONSTRAINT `wf_gangs_ibfk_1` FOREIGN KEY (`id_chef`) REFERENCES `users` (`identifier`);

--
-- Contraintes pour la table `wf_gang_business`
--
ALTER TABLE `wf_gang_business`
  ADD CONSTRAINT `FK_BUSINESS` FOREIGN KEY (`id_business`) REFERENCES `wf_business` (`id`),
  ADD CONSTRAINT `FK_GANG` FOREIGN KEY (`id_gang`) REFERENCES `wf_gangs` (`id`);
