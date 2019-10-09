# On crée la table si elle n'existe pas
CREATE TABLE IF NOT EXISTS employes (
	# Ici je vais préciser les colonnes de ma table
	# 1- nom de la colonne
	# 2- le type de la colonne
	# 3- NULL/ NOT NULL
	# 4- si AUTO_INCREMENT le préciser
	`id_employes` int(3) NOT NULL AUTO_INCREMENT ,
    `prenom` varchar(20) NOT NULL,
    `nom` varchar(20) NOT NULL,
    `sexe` enum('h','f') NOT NULL,
    `service` varchar(30)  DEFAULT NULL,
    `date_embauche` date DEFAULT NULL,
    `salaire` float DEFAULT NULL,
    PRIMARY KEY (`id_employes`)
 # InnoDB permet de bénéficier des relations avec les FK   
)ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 ;