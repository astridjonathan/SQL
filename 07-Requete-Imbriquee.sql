CREATE TABLE abonne (
	id INT(5) NOT NULL AUTO_INCREMENT,
    prenom VARCHAR(30) NOT NULL,
    nom VARCHAR(30) NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB charset= utf8mb4;

CREATE TABLE livre (
	id INT(5) NOT NULL AUTO_INCREMENT,
    auteur VARCHAR(30) NOT NULL,
    titre	VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB charset= utf8mb4;

CREATE TABLE emprunt (
	id INT(5) NOT NULL AUTO_INCREMENT,
    id_livre INT(5) NULL,
    id_abonne INT(5) NULL,
    date_sortie DATE NOT NULL,
    date_rendu DATE NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB charset= utf8mb4;

#La création des contraintes se fait après les tables
ALTER TABLE emprunt ADD FOREIGN KEY (id_livre)
REFERENCES bibliotheque.livre (id);

ALTER TABLE emprunt ADD FOREIGN KEY (id_abonne)
REFERENCES bibliotheque.abonne (id);

INSERT INTO abonne (prenom, nom) VALUES
('Astrid', 'JONATHAN'),
('Lena', 'BROISSERON'),
('Hugo', 'LIEAGEARG'),
('Laureen', 'LABUTHIE');

INSERT INTO livre (auteur, titre) VALUES
('CHARLES BAUDELAIRE', 'Les Fleurs du Mal'),
('VICTOR HUGO', 'Les Misérables'),
('HONORE DE BALZAC', 'La Peau de Chagrin'),
('GUY DE MAUPASSANT', 'Bel-ami'),
('ROBERT KYOSAKI', 'Père Riche, Père Pauvre'),
('ALEXANDRE DUMAS', 'La Reine Margot'),
('HONORE DE BALZAC', 'Le père Goriot');

INSERT INTO emprunt ( id_livre, id_abonne, date_sortie, date_rendu) VALUES
(1,1,'2019-02-18', '2019-03-19'),
(5,1,'2019-07-1', '2019-11-31'),
(6,4,'2019-05-15', '2019-10-10'),
(2,2, '2018-12-19', '2019-03-29'),
(3,2, '2017-08-24', '2017-11-20'),
(4,3, '2018-02-17', '2019-05-4'),
(7,4, '2019-01-20', '2019-10-9'),
(5,2,'2017-07-1', '2017-11-31'),
(1,3,'2018-02-18', '2018-03-19');

INSERT INTO emprunt ( id_livre, id_abonne, date_sortie, date_rendu) VALUES
(1,4,'2019-09-8', NULL);

INSERT INTO emprunt ( id_livre, id_abonne, date_sortie, date_rendu) VALUES
(6,1,'2019-02-15', '2019-03-10'),
(3,1, '2017-01-24', '2017-05-20');




